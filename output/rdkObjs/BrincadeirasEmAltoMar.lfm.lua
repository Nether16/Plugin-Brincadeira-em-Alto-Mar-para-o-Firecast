require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_fmlBrincadeirasEmAltoMar()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", obj.setNodeObject);

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setTitle("Brincadeiras Em Alto Mar");
    obj:setName("fmlBrincadeirasEmAltoMar");
    obj:setDataType("B.A.M");
    obj:setFormType("sheetTemplate");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(10000);
    obj.rectangle1:setHeight(10000);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setLeft(1);
    obj.tabControl1:setTop(5);
    obj.tabControl1:setWidth(10000);
    obj.tabControl1:setHeight(8000);
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Informações Gerais");
    obj.tab1:setName("tab1");

    obj.InfoGerais = GUI.fromHandle(_obj_newObject("form"));
    obj.InfoGerais:setParent(obj.tab1);
    obj.InfoGerais:setFormType("sheetTemplate");
    obj.InfoGerais:setTitle("Brincadeiras Em Alto Mar");
    obj.InfoGerais:setName("InfoGerais");


		-- Listas de dados
		Organizacoes = {'Kurokage', 'Revolucionario', 'Governo Mundial', 'Marinha', 'Pirata', 'Não Definido'}
		
		EstilosDeLuta = {
			'Black Leg', 'Bō Fudō-ryū', 'Bō Kenryū', 'Boxe', 'Capoeira', 'Colors Trap','Demonharubādo', 
			'Engei no Furete-ryū', 'Frog Leg', 'Hachitoryu', 'Hagane no Kiba', 'Hasshoken',
			'Ittoryu', 'Jao Kun Do', 'Jio-Ken', 'Karatê Tritão', 'Kappa-ryu', 'Kenki no Gattsu',
			'Kikai Kōbō-Ryū', 'Kitsunebi-ryu', 'Koe no Ensei-Ryū', 'Kōsenjū-Ryū',
			'Kyokugi', 'Merman Combat', 'Ningyo Gujutsu', 'Nitoryu', 'Okama Kenpo', 'Rairyū-Ryū',
			'Ramen Kenpo', 'Reitetsu no Ken', 'Rokushiki', 'Rokutoryu', 'Ryusoken', 'Sakejutsu',
			'Santoryu', 'Seigi no Tōken-Ryū', 'Senritsuken', 'Son Goku no Ugoki', 'Street Brawling',
			'Sumo-Ryu', 'Tate no Mamori-ryū', 'Tenshi Nunchaku-Ryū', 'Teppanyaki no Ken', 
			'Tontatta Combat', 'Tōkaradō', 'Tsuinburēdo', 'Yontoryu'
		}

		EdLSemCaracteresEspeciais = {
			"BlackLeg", "BoFudoRyu", "BoKenryu", "Boxe", "Capoeira", "ColorsTrap", "Demonharubado", 
			"EngeinoFureteRyu", "FrogLeg", "Hachitoryu", "HaganeNoKiba", "Hasshoken",
			"Ittoryu", "JaoKunDo", "JioKen", "KarateTritao", "Kapparyu", "KenkinoGattsu",
			"KikaiKoboRyu", "Kitsunebiryu", "KoenoEnseiRyu", "KosenjuRyu",
			"Kyokugi", "MermanCombat", "NingyoGujutsu", "Nitoryu", "OkamaKenpo", "RairyuuRyu",
			"RamenKenpo", "ReitetsunoKen", "Rokushiki", "Rokutoryu", "Ryusoken", "Sakejutsu",
			"Santoryu", "SeiginoTokenRyu", "Senritsuken", "SonGokunoUgoki", "StreetBrawling",
			"SumoRyu", "TatenoMamoriRyu", "TenshiNunchakuRyu", "TeppanyakinoKen", 
			"TontattaCombat", "Tokarado", "Tsuinburedo", "Yontoryu"
		}
		
		Profissoes = {
			'Escolher', 'Armador', 'Artista', 'Atirador', 'Biologo', 'Cientista',
			'Cozinheiro', 'Espadachim', 'Ferreiro', 'Lutador', 'Navegador', 'Timoneiro'
		}
		
		Racas = {
			'🏆Amigo dos Elementos', '🏆Andarilhos do Sol', 'Anfites', '🏆Anões', 
			'Braços-Longos', 'Ciborgues', 'Cinzentos', '🏆Devotos da Chama Sombria', 
			'Dolkins', '🏆Drakos', '🏆Drakumiras', 'Gigantes', '🏆Gladios', 
			'🏆Glacies', '🏆Hamonianos', 'Humanos', 'Humanos-Mink', 'Humanos-Tritoes', 
			'Kujas', 'Kumates', 'Licantropos', '🔒Lunares', 'Meios-Gigante', 
			'Minks', '🏆Místicos', '🏆Nórdicos', '🔒Onis', 'Pernas-Longas', 
			'Sereianos', 'Serpentiuns', 'Skypeanos', '🔒Tenryūbitos', 'Tontattas', 
			'Torinos', '🔒Três Olhos', 'Tritões', '🏆Viridianos', '🔒Vulcanuns', 
			'Wotans'
		}

		RacasSemCaracteresEspeciais = {
			'Amigo dos Elementos', 'Andarilhos do Sol', 'Anfites', 'Anoes', 
			'Braços-Longos', 'Ciborgues', 'Cinzentos', 'Devotos da Chama Sombria', 
			'Dolkins', 'Drakos', 'Drakumiras', 'Gigantes', 'Gladios', 
			'Glacies', 'Hamonianos', 'Humanos', 'Humanos-Mink', 'Humanos-Tritoes', 
			'Kujas', 'Kumates', 'Licantropos', 'Lunares', 'Meios-Gigante', 
			'Minks', 'Misticos', 'Nordicos', 'Onis', 'Pernas-Longas', 
			'Sereianos', 'Serpentiuns', 'Skypeanos', 'Tenryubitos', 'Tontattas', 
			'Torinos', 'Tres Olhos', 'Tritoes', 'Viridianos', 'Vulcanuns', 
			'Wotans'
		}
			
		-- Informações das profissões
		ProfissoesImagens = {
			Armador = {
				imagem = "https://i.pinimg.com/originals/b6/a0/a4/b6a0a41ec6037bf11a744626f346a325.gif"
			},
			Artista = {
				imagem = "https://blob.firecast.com.br/blobs/GQSBFKNR_3714276/one-piece-brook.gif"
			},
			Atirador = {
				imagem = "https://blob.firecast.com.br/blobs/QFIOHLHK_3700975/pont.gif"
			},
			Biologo = {
				imagem = "https://blob.firecast.com.br/blobs/COLJVQKI_3714278/1VTa.gif"
			},
			Cientista = {
				imagem = "https://media.tenor.com/uLEe97tKW2UAAAAM/vegapunk-vegapunk-one-piece.gif"
			},
			Cozinheiro = {
				imagem = "https://blob.firecast.com.br/blobs/JDMTSCLP_3714279/f0436d2a80aebd709b98574d859fa915.gif"
			},
			Espadachim = {
				imagem = "https://i.pinimg.com/originals/4d/64/08/4d6408285378256a5080815dad34d608.gif"
			},
			Ferreiro = {
				imagem = "https://blob.firecast.com.br/blobs/FKKGJJIJ_3714281/V_deo_sem_t_tulo___Feito_com_o_Clipchamp.gif"
			},
			Lutador = {
				imagem = "https://i.pinimg.com/originals/d3/78/9f/d3789ff69a5bc82b336720427dcccc61.gif"
			},
			Navegador = {
				imagem = "https://pa1.narvii.com/6407/0f7d976a3661b43b1dc25c3184c3827067f00262_hq.gif"
			},
			Timoneiro = {
				imagem = "https://blob.firecast.com.br/blobs/MLPVAMDG_3725527/jinbe-jinbei.gif"
			}
		}
		
		RacasInfo = {
			Escolher = {
				nomeNormal = "Raça",
				imagem = ""
			},
			["Amigo dos Elementos"] = {
				nomeNormal = "🏆Amigo dos Elementos",
				imagem = "http://blob.firecast.com.br/blobs/AKJNPEBO_3026397/ezgif.com-webp-to-gif-converter__1_.gif"
			},
			Anoes = {
				nomeNormal = "🏆Anão",
				imagem = "https://images-ext-1.discordapp.net/external/7rvZLr84IAZ7qOGl3NQz48Y4thlyU4O8uCD-MuJeAP8/https/media.tenor.com/C9SwE0VKTD4AAAPo/dungeon-meshi-delicious-in-dungeon.mp4"
			},
			Anfites = {
				nomeNormal = "Anfite",
				imagem = "https://media.tenor.com/FB4WqTRDZrEAAAAd/therealnasa00-frogman.gif"
			},
			["Andarilhos do Sol"] = {
				nomeNormal = "🏆Andarilho do Sol",
				imagem = "http://blob.firecast.com.br/blobs/RIMDBFTN_3026303/ezgif.com-webp-to-gif-converter.gif"
			},
			["Braços-Longos"] = {
				nomeNormal = "Braços-Longos",
				imagem = "https://pa1.narvii.com/6730/ad80c9d7f57af0152da7401400f87e332dad2032_00.gif"
			},
			Ciborgues = {
				nomeNormal = "Ciborgue",
				imagem = "https://media.tenor.com/0Y_xLi0iSTwAAAAM/one-piece-franky.gif"
			},
			Cinzentos = {
				nomeNormal = "Cinzento",
				imagem = "https://blob.firecast.com.br/blobs/BADKHRKG_3425901/dark-souls-defeated.gif"
			},
			["Devotos da Chama Sombria"] = {
				nomeNormal = "🏆Devoto da Chama Sombria",
				imagem = "http://blob.firecast.com.br/blobs/SHOSLLVI_3135008/rio-yudha-img-1365-min.jpg"
			},
			Dolkins = {
				nomeNormal = "Dolkin",
				imagem = "https://i.pinimg.com/originals/f5/ff/37/f5ff37f9e1137b7e566210c2873ba8a9.gif"
			},
			Drakos = {
				nomeNormal = "🏆Drako",
				imagem = "http://blob.firecast.com.br/blobs/EIMETCIH_3316406/dragon-of-monsters-and-men.gif"
			},
			Drakumiras = {
				nomeNormal = "🏆Drakumira",
				imagem = "http://blob.firecast.com.br/blobs/QHGKJPQI_3082970/cuh.gif"
			},
			Gigantes = {
				nomeNormal = "Gigante",
				imagem = "https://media1.tenor.com/m/UfaHN5D9rJ8AAAAd/one-piece-dorry.gif"
			},
			Gladios = {
				nomeNormal = "🏆Gladio",
				imagem = "http://blob.firecast.com.br/blobs/COPONBWV_3316431/pantheon.gif"
			},
			Glacies = {
				nomeNormal = "🏆Glacie",
				imagem = "http://blob.firecast.com.br/blobs/MOISFJPV_3026252/0_GrZ1IQ4IHbQR-5GQ.gif"
			},
			Hamonianos = {
				nomeNormal = "🏆Hamoniano",
				imagem = "https://static.jojowiki.com/images/thumb/e/e0/latest/20200524193436/JonathanAfterimages.gif/250px-JonathanAfterimages.gif"
			},
			Humanos = {
				nomeNormal = "Humano",
				imagem = "https://64.media.tumblr.com/cb105c77e69b7068c3dd661944fc270f/0497d47c1bc6752f-98/s1280x1920/1b08f2170ffad9496d5e03815511e92311499c37.gif"
			},
			["Humanos-Mink"] = {
				nomeNormal = "Humano-Mink",
				imagem = "http://blob.firecast.com.br/blobs/KPNIINQL_3308446/Screenshot_20.png"
			},
			["Humanos-Tritoes"] = {
				nomeNormal = "Humano-Tritão",
				imagem = "https://media.tenor.com/Ca0iC11GAFkAAAAC/dellinger-one-piece.gif"
			},
			Kujas = {
				nomeNormal = "Kuja",
				imagem = "https://images-ext-1.discordapp.net/external/MVPZL2GeryxoyZH1RN4s6dEe9T74B2Ijo9q3DmHb8Do/https/media.tenor.com/2zWJP0TIePIAAAAC/boa-hancock.gif"
			},
			Kumates = {
				nomeNormal = "Kumate",
				imagem = "http://blob.firecast.com.br/blobs/DALGOJJL_2627760/643711f79f3d3e1e010403db.jpg"
			},
			Licantropos = {
				nomeNormal = "Licantropo",
				imagem = "https://media.tenor.com/VTMN5X21O-8AAAAM/howling-at-the-moon-werewolf.gif"
			},
			Lunares = {
				nomeNormal = "🔒Lunar",
				imagem = "https://images-ext-1.discordapp.net/external/Oz-YmmCCnGUU8FM-_OjOOKv86EdAgQXVKYvGX66vw-s/https/media.tenor.com/WfKU_0sXvJwAAAAC/king-one-piece.gif"
			},
			["Meios-Gigante"] = {
				nomeNormal = "Meio-Gigante",
				imagem = "https://blob.firecast.com.br/blobs/DOBARCJU_3725786/barba-branca.gif"
			},
			Minks = {
				nomeNormal = "Mink",
				imagem = "https://images-ext-2.discordapp.net/external/nqRj_UwWzjol3Z2vCB1Zcgce077Lv_prrTSlNqlxbFI/https/64.media.tumblr.com/3cd7f4799ff4190c8f27ee7d59f83fa4/tumblr_opxctfm0E91rcufwuo1_540.gif"
			},
			Misticos = {
				nomeNormal = "🏆Místico",
				imagem = "https://c.tenor.com/paKd0EMDnr4AAAAC/zatanna-eyes.gif"
			},
			Nordicos = {
				nomeNormal = "🏆Nórdico",
				imagem = "https://media.tenor.com/T2MSu5tf8S4AAAAd/vinland-saga-askeladd.gif"
			},
			Onis = {
				nomeNormal = "🔒Oni",
				imagem = "https://media.tenor.com/arj97lLhyvAAAAAC/one-piece-kaido.gif"
			},
			["Pernas-Longas"] = {
				nomeNormal = "Pernas-Longas",
				imagem = "https://pm1.aminoapps.com/6323/7a4334b7d7ce056d4c185f635504ded2a2a027fa_hq.jpg"
			},
			Sereianos = {
				nomeNormal = "Sereiano",
				imagem = "http://blob.firecast.com.br/blobs/AIFPWVFH_2627741/one-piece-shirahoshi.gif"
			},
			Serpentiuns = {
				nomeNormal = "Serpentiun",
				imagem = "https://64.media.tumblr.com/909c5cf9002393d7bcab74f5dc05edb5/0400c12e3f9cf8cc-52/s640x960/e5cb9bd41464fd648789ab18e25ff2f95bc649c0.gif"
			},
			Skypeanos = {
				nomeNormal = "Skypeano",
				imagem = "https://64.media.tumblr.com/55681e5d535093a8b6cd9dcf5f3dcb02/tumblr_pefwi8cuuK1v6xsm2o1_540.gif"
			},
			Tenryubitos = {
				nomeNormal = "🔒Tenryūbito",
				imagem = "https://images-ext-1.discordapp.net/external/H9zFmOc4ej5QbAKLlbJkpOIFDQOB8vNUpnM8vmRf7yk/https/media.tenor.com/uKO85l53TEIAAAPo/one-piece-charlos.mp4"
			},
			Tontattas = {
				nomeNormal = "Tontatta",
				imagem = "https://images-ext-2.discordapp.net/external/mNM2otNbmuKVIFN2Hg9J2UdcqncRaCADCjUnjhj7ihc/https/media.tenor.com/bUotCR7LG1kAAAAC/one-piece-leo.gif"
			},
			Torinos = {
				nomeNormal = "Torino",
				imagem = "http://blob.firecast.com.br/blobs/MDCNWMUU_3109027/Torinos.gif"
			},
			["Tres Olhos"] = {
				nomeNormal = "🔒Três Olhos",
				imagem = "https://images-ext-2.discordapp.net/external/QSZTQpsrk7WvNrblxg0JIYEzPktEMsqXH8fxTHPq0ro/https/pa1.narvii.com/6503/f71368136f3b6fa78a073cb2b9eeec1c436504e1_hq.gif"
			},
			Tritoes = {
				nomeNormal = "Tritão",
				imagem = "https://images-ext-1.discordapp.net/external/vxj7LXyrQ9ZGtPLUgRXzpXt7k1UQpRDB3D9oUNRYnEk/https/64.media.tumblr.com/d8e94dd736ae88cff02ebf5839f380b3/c488971a5f8c309d-b7/s540x810/3425fffb424bf5a06f83fc878c4d0c53d92a3b78.gif"
			},
			Viridianos = {
				nomeNormal = "🏆Viridiano",
				imagem = "https://blob.firecast.com.br/blobs/AMTACKQR_3695064/IMAGE03.gif"
			},
			Vulcanuns = {
				nomeNormal = "🏆Vulcanun",
				imagem = "https://blob.firecast.com.br/blobs/EASVBAKK_3716525/V_deo_sem_t_tulo___Feito_com_o_Clipchamp__.gif"
			},
			Wotans = {
				nomeNormal = "Wotan",
				imagem = "https://images-ext-1.discordapp.net/external/s8aFm9Q57Ip2r5o3lf5ieqmpUZAmy0gl1Mgr1a8mVHo/https/media.tenor.com/hS7oFvsjIEwAAAAC/sanji-zoro.gif"
			}
		}
		
		--Função Para Atualizar o Xp
		function AtualizarExp()
			local nivel = tonumber(self.Nivel.text) or 1

			if nivel > 0 then
				self.Exp.text = tostring(300 + (100 * (nivel - 1)))
			end
			
			if not(self.ExpAtual.text) then  self.ExpAtual.text = "0" end
			if not(self.Nivel.text) then  self.Nivel.text = "1" end
		end
		
		--Função Para Tier da Profissao
		function AtualizarTier(Tier, Exp)
			local tier = tonumber(self[Tier].text) or 1
			
			if (tier > 0) and not(tier > 10) then 
				self[Exp].text = tostring(100 * (tier))
			end
			
			if (self[Tier].text == "") then self[Tier].text = "0"; self[Exp].text = "10" end
			if (tier == 0) then self[Exp].text = "10" end
		end
		
		-- Função para mudar a bandeira
		bandeiras = {Kurokage = "https://blob.firecast.com.br/blobs/BUJUONIQ_3579179/_82bd8847-4e74-4b5b-80aa-a03f51baf153.jpg",
			Revolucionario = "https://blob.firecast.com.br/blobs/LDWMSERB_3713983/revolutionary_army_jolly_roger_by_jormxdos.jpg",
			["Governo Mundial"] = "https://blob.firecast.com.br/blobs/CJTSDRKM_3713984/eba.png",
			Marinha = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
		}

		function MudarBandeira()
			organizacao = self.listaOrganizacoes.value
			
			if organizacao then
				self.ImagemBandeira.src = bandeiras[organizacao]
				
				if (self.ImagemBandeira.src == "") then
					self.ImagemBandeira.editable = true
				else
					self.ImagemBandeira.editable = false
				end
			end
		end

		-- Função para mudar profissão
		function MudarProfissao(profissaoId, nomeProfissao, profissaoField, imagemField, layoutField, fotoField, nomeField)
			local profissaoSelecionada = self[profissaoField].value
			local profissao = ProfissoesImagens[profissaoSelecionada]
			
			
			self[nomeProfissao].text = self[profissaoField].value
			if profissao then
				self[imagemField].src = profissao.imagem
				self[layoutField].visible = true
				
				self[fotoField].src = profissao.imagem
				self[nomeField].text = self[profissaoField].value
			else
				self[layoutField].visible = false
				self[fotoField].src = ""
				self[nomeField].text = "Profissão "..profissaoId
			end
		end

		-- Funções específicas para cada profissão
		function MudarProfissao1()
			MudarProfissao("1", "ProfissaoPrincipal", "ComboProfissaoPrincipal", "FotoProfissaoPrincipal", "LayoutProfissaoPrincipal", "ImagemProfissaoPrincipal", "NomeProfissaoPrincipal")
		end

		function MudarProfissao2()
			MudarProfissao("2", "ProfissaoSecundaria", "ComboProfissaoSecundaria", "FotoProfissaoSecundaria", "LayoutProfissaoSecundaria", "ImagemProfissaoSecundaria", "NomeProfissaoSecundaria")
		end
		
		function MudarRaca()
			local racaSelecionada = self.ComboRaca.value
			local raca = RacasInfo[racaSelecionada]

			self.Raca.text = raca.nomeNormal
			if raca then
				self.FotoRaca.src = ""
				self.FotoRaca.src = raca.imagem
				
				self.ImagemRaca.src = ""
				self.ImagemRaca.src = raca.imagem
				self.NomeRaca.text = raca.nomeNormal
			end
		end
		
		function CheckIfEmpregado(profissao)
			if not(profissao == "Escolher") then
				self.LayoutProfissaoPrincipal.visible = true
				self.LayoutProfissaoSecundaria.visible = true
				
				self.FotoProfissaoPrincipal.visible = true	
				self.FotoProfissaoSecundaria.visible = true
			else
				self.LayoutProfissaoPrincipal.visible = false
				self.LayoutProfissaoSecundaria.visible = false
				
				self.FotoProfissaoPrincipal.visible = false		
				self.FotoProfissaoSecundaria.visible = false	
			end
		end
	


    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.InfoGerais);
    obj.rectangle2:setWidth(10000);
    obj.rectangle2:setHeight(10000);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.InfoGerais);
    obj.layout1:setLeft(5);
    obj.layout1:setTop(-20);
    obj.layout1:setWidth(5000);
    obj.layout1:setHeight(1800);
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(10);
    obj.layout2:setWidth(1000);
    obj.layout2:setHeight(1800);
    obj.layout2:setName("layout2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout2);
    obj.rectangle3:setLeft(2);
    obj.rectangle3:setTop(22);
    obj.rectangle3:setWidth(177);
    obj.rectangle3:setHeight(255);
    obj.rectangle3:setColor("#4169E1");
    obj.rectangle3:setName("rectangle3");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout2);
    obj.rectangle4:setLeft(4);
    obj.rectangle4:setTop(24);
    obj.rectangle4:setWidth(173);
    obj.rectangle4:setHeight(251);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(27);
    obj.label1:setTop(120);
    obj.label1:setText("Clique para adicionar seu personagem");
    obj.label1:setFontSize(12.5);
    lfm_setPropAsString(obj.label1, "fontStyle", "bold");
    obj.label1:setFontColor("#4169E1");
    obj.label1:setAutoSize(true);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout2);
    obj.image1:setField("imagemDoPersonagem");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setLeft(6);
    obj.image1:setTop(29);
    obj.image1:setWidth(169);
    obj.image1:setHeight(244);
    obj.image1:setName("image1");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout2);
    obj.rectangle5:setLeft(2);
    obj.rectangle5:setTop(292);
    obj.rectangle5:setWidth(177);
    obj.rectangle5:setHeight(255);
    obj.rectangle5:setColor("#4169E1");
    obj.rectangle5:setName("rectangle5");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout2);
    obj.rectangle6:setLeft(4);
    obj.rectangle6:setTop(294);
    obj.rectangle6:setWidth(173);
    obj.rectangle6:setHeight(251);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setName("rectangle6");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(27);
    obj.label2:setTop(387);
    obj.label2:setText("Clique para adicionar seu cartaz de recompensa");
    obj.label2:setFontSize(12.5);
    lfm_setPropAsString(obj.label2, "fontStyle", "bold");
    obj.label2:setFontColor("#4169E1");
    obj.label2:setAutoSize(true);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout2);
    obj.image2:setField("cartazDeRecompensa");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setLeft(6);
    obj.image2:setTop(297);
    obj.image2:setWidth(169);
    obj.image2:setHeight(244);
    obj.image2:setName("image2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(5);
    obj.layout3:setTop(10);
    obj.layout3:setWidth(1000);
    obj.layout3:setHeight(1800);
    obj.layout3:setName("layout3");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout3);
    obj.rectangle7:setLeft(192);
    obj.rectangle7:setTop(22);
    obj.rectangle7:setWidth(460);
    obj.rectangle7:setHeight(255);
    obj.rectangle7:setColor("#4169E1");
    obj.rectangle7:setName("rectangle7");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout3);
    obj.rectangle8:setLeft(194);
    obj.rectangle8:setTop(24);
    obj.rectangle8:setWidth(456);
    obj.rectangle8:setHeight(251);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setName("rectangle8");

    obj.nomeDoPersonagem = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeDoPersonagem:setParent(obj.layout3);
    obj.nomeDoPersonagem:setField("nomePersonagem");
    obj.nomeDoPersonagem:setName("nomeDoPersonagem");
    obj.nomeDoPersonagem:setLeft(200);
    obj.nomeDoPersonagem:setTop(30);
    obj.nomeDoPersonagem:setWidth(450);
    obj.nomeDoPersonagem:setHeight(50);
    obj.nomeDoPersonagem:setTextPrompt("Nome do Personagem");
    obj.nomeDoPersonagem:setTransparent(true);
    obj.nomeDoPersonagem:setFontColor("#5F9EA0");
    obj.nomeDoPersonagem:setFontSize(25);
    lfm_setPropAsString(obj.nomeDoPersonagem, "fontStyle", "bold");
    obj.nomeDoPersonagem:setHorzTextAlign("center");

    obj.tituloDoPersonagem = GUI.fromHandle(_obj_newObject("edit"));
    obj.tituloDoPersonagem:setParent(obj.layout3);
    obj.tituloDoPersonagem:setField("tituloPersonagem");
    obj.tituloDoPersonagem:setName("tituloDoPersonagem");
    obj.tituloDoPersonagem:setLeft(200);
    obj.tituloDoPersonagem:setTop(70);
    obj.tituloDoPersonagem:setWidth(450);
    obj.tituloDoPersonagem:setHeight(23);
    obj.tituloDoPersonagem:setText("");
    obj.tituloDoPersonagem:setTransparent(true);
    obj.tituloDoPersonagem:setFontColor("#5F9EA0");
    obj.tituloDoPersonagem:setFontSize(15);
    lfm_setPropAsString(obj.tituloDoPersonagem, "fontStyle", "bold");
    obj.tituloDoPersonagem:setHorzTextAlign("center");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setLeft(285);
    obj.label3:setTop(95);
    obj.label3:setWidth(260);
    obj.label3:setHeight(50);
    obj.label3:setText("Dados Basicos");
    obj.label3:setFontColor("#5F9EA0");
    obj.label3:setFontSize(20);
    lfm_setPropAsString(obj.label3, "fontStyle", "bold underline");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout3);
    obj.label4:setLeft(215);
    obj.label4:setTop(128);
    obj.label4:setWidth(110);
    obj.label4:setHeight(50);
    obj.label4:setText("Nível:");
    obj.label4:setFontColor("#5F9EA0");
    obj.label4:setFontSize(14);
    lfm_setPropAsString(obj.label4, "fontStyle", "bold");
    obj.label4:setName("label4");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout3);
    obj.rectangle9:setLeft(315);
    obj.rectangle9:setTop(145);
    obj.rectangle9:setWidth(80);
    obj.rectangle9:setHeight(18);
    obj.rectangle9:setColor("#F5F5DC");
    obj.rectangle9:setXradius(7);
    obj.rectangle9:setYradius(7);
    obj.rectangle9:setCornerType("round");
    obj.rectangle9:setName("rectangle9");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout3);
    obj.rectangle10:setLeft(275);
    obj.rectangle10:setTop(145);
    obj.rectangle10:setWidth(35);
    obj.rectangle10:setHeight(18);
    obj.rectangle10:setColor("#F5F5DC");
    obj.rectangle10:setXradius(7);
    obj.rectangle10:setYradius(7);
    obj.rectangle10:setCornerType("round");
    obj.rectangle10:setName("rectangle10");

    obj.Nivel = GUI.fromHandle(_obj_newObject("edit"));
    obj.Nivel:setParent(obj.layout3);
    obj.Nivel:setField("nivel");
    obj.Nivel:setName("Nivel");
    obj.Nivel:setLeft(275);
    obj.Nivel:setTop(146);
    obj.Nivel:setWidth(35);
    obj.Nivel:setHeight(17);
    obj.Nivel:setText("sheet.nivel");
    obj.Nivel:setFontColor("black");
    obj.Nivel:setFontSize(12);
    obj.Nivel:setHorzTextAlign("center");
    obj.Nivel:setType("number");
    obj.Nivel:setTransparent(true);

    obj.ExpAtual = GUI.fromHandle(_obj_newObject("edit"));
    obj.ExpAtual:setParent(obj.layout3);
    obj.ExpAtual:setField("expAtual");
    obj.ExpAtual:setName("ExpAtual");
    obj.ExpAtual:setLeft(315);
    obj.ExpAtual:setTop(146);
    obj.ExpAtual:setWidth(40);
    obj.ExpAtual:setHeight(17);
    obj.ExpAtual:setFontColor("black");
    obj.ExpAtual:setFontSize(12);
    obj.ExpAtual:setHorzTextAlign("center");
    obj.ExpAtual:setType("number");
    obj.ExpAtual:setTransparent(true);

    obj.Exp = GUI.fromHandle(_obj_newObject("edit"));
    obj.Exp:setParent(obj.layout3);
    obj.Exp:setField("expMax");
    obj.Exp:setName("Exp");
    obj.Exp:setLeft(356);
    obj.Exp:setTop(146);
    obj.Exp:setWidth(40);
    obj.Exp:setHeight(17);
    obj.Exp:setFontColor("black");
    obj.Exp:setFontSize(12);
    obj.Exp:setReadOnly(true);
    obj.Exp:setHorzTextAlign("center");
    obj.Exp:setTransparent(true);

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setLeft(350);
    obj.edit1:setTop(146);
    obj.edit1:setWidth(17);
    obj.edit1:setHeight(17);
    obj.edit1:setText("/");
    obj.edit1:setFontColor("black");
    obj.edit1:setFontSize(12);
    obj.edit1:setReadOnly(true);
    obj.edit1:setTransparent(true);
    obj.edit1:setName("edit1");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout3);
    obj.label5:setLeft(215);
    obj.label5:setTop(158);
    obj.label5:setWidth(100);
    obj.label5:setHeight(50);
    obj.label5:setText("Idade:");
    obj.label5:setFontColor("#5F9EA0");
    obj.label5:setFontSize(14);
    lfm_setPropAsString(obj.label5, "fontStyle", "bold");
    obj.label5:setName("label5");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout3);
    obj.rectangle11:setLeft(275);
    obj.rectangle11:setTop(176);
    obj.rectangle11:setWidth(120);
    obj.rectangle11:setHeight(17);
    obj.rectangle11:setColor("#F5F5DC");
    obj.rectangle11:setXradius(7);
    obj.rectangle11:setYradius(7);
    obj.rectangle11:setCornerType("round");
    obj.rectangle11:setName("rectangle11");

    obj.idade = GUI.fromHandle(_obj_newObject("edit"));
    obj.idade:setParent(obj.layout3);
    obj.idade:setField("idade");
    obj.idade:setName("idade");
    obj.idade:setLeft(275);
    obj.idade:setTop(172);
    obj.idade:setWidth(120);
    obj.idade:setHeight(22);
    obj.idade:setTransparent(true);
    obj.idade:setFontColor("black");
    obj.idade:setFontSize(12);
    obj.idade:setHorzTextAlign("center");
    obj.idade:setKeyboardType("numberPad");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout3);
    obj.label6:setLeft(215);
    obj.label6:setTop(188);
    obj.label6:setWidth(100);
    obj.label6:setHeight(50);
    obj.label6:setText("Gênero:");
    obj.label6:setFontColor("#5F9EA0");
    obj.label6:setFontSize(14);
    lfm_setPropAsString(obj.label6, "fontStyle", "bold");
    obj.label6:setName("label6");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout3);
    obj.rectangle12:setLeft(275);
    obj.rectangle12:setTop(206);
    obj.rectangle12:setWidth(120);
    obj.rectangle12:setHeight(17);
    obj.rectangle12:setColor("#F5F5DC");
    obj.rectangle12:setXradius(7);
    obj.rectangle12:setYradius(7);
    obj.rectangle12:setCornerType("round");
    obj.rectangle12:setName("rectangle12");

    obj.genero = GUI.fromHandle(_obj_newObject("edit"));
    obj.genero:setParent(obj.layout3);
    obj.genero:setField("genero");
    obj.genero:setName("genero");
    obj.genero:setLeft(275);
    obj.genero:setTop(202);
    obj.genero:setWidth(120);
    obj.genero:setHeight(22);
    obj.genero:setTransparent(true);
    obj.genero:setFontColor("black");
    obj.genero:setFontSize(12);
    obj.genero:setHorzTextAlign("center");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout3);
    obj.label7:setLeft(215);
    obj.label7:setTop(218);
    obj.label7:setWidth(100);
    obj.label7:setHeight(50);
    obj.label7:setText("Moedas:");
    obj.label7:setFontColor("#5F9EA0");
    obj.label7:setFontSize(14);
    lfm_setPropAsString(obj.label7, "fontStyle", "bold");
    obj.label7:setName("label7");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout3);
    obj.rectangle13:setLeft(275);
    obj.rectangle13:setTop(236);
    obj.rectangle13:setWidth(120);
    obj.rectangle13:setHeight(17);
    obj.rectangle13:setColor("#F5F5DC");
    obj.rectangle13:setXradius(7);
    obj.rectangle13:setYradius(7);
    obj.rectangle13:setCornerType("round");
    obj.rectangle13:setName("rectangle13");

    obj.moedas = GUI.fromHandle(_obj_newObject("edit"));
    obj.moedas:setParent(obj.layout3);
    obj.moedas:setField("moedas");
    obj.moedas:setName("moedas");
    obj.moedas:setLeft(275);
    obj.moedas:setTop(232);
    obj.moedas:setWidth(120);
    obj.moedas:setHeight(20);
    obj.moedas:setTransparent(true);
    obj.moedas:setText("0");
    obj.moedas:setFontColor("black");
    obj.moedas:setFontSize(12);
    obj.moedas:setHorzTextAlign("center");
    obj.moedas:setKeyboardType("numbersAndPunctuation");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout3);
    obj.label8:setLeft(415);
    obj.label8:setTop(128);
    obj.label8:setWidth(100);
    obj.label8:setHeight(50);
    obj.label8:setText("Tripulação:");
    obj.label8:setFontColor("#5F9EA0");
    obj.label8:setFontSize(14);
    lfm_setPropAsString(obj.label8, "fontStyle", "bold");
    obj.label8:setName("label8");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout3);
    obj.rectangle14:setLeft(505);
    obj.rectangle14:setTop(146);
    obj.rectangle14:setWidth(120);
    obj.rectangle14:setHeight(17);
    obj.rectangle14:setColor("#F5F5DC");
    obj.rectangle14:setXradius(7);
    obj.rectangle14:setYradius(7);
    obj.rectangle14:setCornerType("round");
    obj.rectangle14:setName("rectangle14");

    obj.tripulacao = GUI.fromHandle(_obj_newObject("edit"));
    obj.tripulacao:setParent(obj.layout3);
    obj.tripulacao:setField("tripulacao");
    obj.tripulacao:setName("tripulacao");
    obj.tripulacao:setLeft(505);
    obj.tripulacao:setTop(143);
    obj.tripulacao:setWidth(120);
    obj.tripulacao:setHeight(22);
    obj.tripulacao:setTransparent(true);
    obj.tripulacao:setFontColor("black");
    obj.tripulacao:setFontSize(12);
    obj.tripulacao:setHorzTextAlign("center");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout3);
    obj.label9:setLeft(415);
    obj.label9:setTop(158);
    obj.label9:setWidth(100);
    obj.label9:setHeight(50);
    obj.label9:setText("Est. de Luta:");
    obj.label9:setFontColor("#5F9EA0");
    obj.label9:setFontSize(14);
    lfm_setPropAsString(obj.label9, "fontStyle", "bold");
    obj.label9:setName("label9");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout3);
    obj.rectangle15:setLeft(505);
    obj.rectangle15:setTop(176);
    obj.rectangle15:setWidth(120);
    obj.rectangle15:setHeight(17);
    obj.rectangle15:setColor("#F5F5DC");
    obj.rectangle15:setXradius(7);
    obj.rectangle15:setYradius(7);
    obj.rectangle15:setCornerType("round");
    obj.rectangle15:setName("rectangle15");

    obj.LabelEdL = GUI.fromHandle(_obj_newObject("label"));
    obj.LabelEdL:setParent(obj.layout3);
    obj.LabelEdL:setName("LabelEdL");
    obj.LabelEdL:setLeft(505);
    obj.LabelEdL:setTop(176);
    obj.LabelEdL:setWidth(120);
    obj.LabelEdL:setHeight(17);
    obj.LabelEdL:setFontSize(12);
    obj.LabelEdL:setFontColor("black");
    obj.LabelEdL:setHorzTextAlign("center");

    obj.estluta = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.estluta:setParent(obj.layout3);
    obj.estluta:setField("estiloDeLuta");
    obj.estluta:setName("estluta");
    obj.estluta:setLeft(505);
    obj.estluta:setTop(176);
    obj.estluta:setWidth(120);
    obj.estluta:setHeight(19);
    obj.estluta:setOpacity(0);
    obj.estluta:setFontColor("white");
    obj.estluta:setFontSize(12);
    obj.estluta:setHorzTextAlign("center");
    obj.estluta:setItems(EstilosDeLuta);
    obj.estluta:setValues(EdLSemCaracteresEspeciais);

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout3);
    obj.label10:setLeft(415);
    obj.label10:setTop(188);
    obj.label10:setWidth(100);
    obj.label10:setHeight(50);
    obj.label10:setText("Sexualidade:");
    obj.label10:setFontColor("#5F9EA0");
    obj.label10:setFontSize(14);
    lfm_setPropAsString(obj.label10, "fontStyle", "bold");
    obj.label10:setName("label10");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout3);
    obj.rectangle16:setLeft(505);
    obj.rectangle16:setTop(206);
    obj.rectangle16:setWidth(120);
    obj.rectangle16:setHeight(17);
    obj.rectangle16:setColor("#F5F5DC");
    obj.rectangle16:setXradius(7);
    obj.rectangle16:setYradius(7);
    obj.rectangle16:setCornerType("round");
    obj.rectangle16:setName("rectangle16");

    obj.sex = GUI.fromHandle(_obj_newObject("edit"));
    obj.sex:setParent(obj.layout3);
    obj.sex:setField("sexualidade");
    obj.sex:setName("sex");
    obj.sex:setLeft(505);
    obj.sex:setTop(202);
    obj.sex:setWidth(120);
    obj.sex:setHeight(22);
    obj.sex:setTransparent(true);
    obj.sex:setFontColor("black");
    obj.sex:setFontSize(12);
    obj.sex:setHorzTextAlign("center");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout3);
    obj.label11:setLeft(415);
    obj.label11:setTop(218);
    obj.label11:setWidth(100);
    obj.label11:setHeight(50);
    obj.label11:setText("Organização:");
    obj.label11:setFontColor("#5F9EA0");
    obj.label11:setFontSize(14);
    lfm_setPropAsString(obj.label11, "fontStyle", "bold");
    obj.label11:setName("label11");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout3);
    obj.rectangle17:setLeft(505);
    obj.rectangle17:setTop(236);
    obj.rectangle17:setWidth(120);
    obj.rectangle17:setHeight(17);
    obj.rectangle17:setColor("#F5F5DC");
    obj.rectangle17:setXradius(7);
    obj.rectangle17:setYradius(7);
    obj.rectangle17:setCornerType("round");
    obj.rectangle17:setName("rectangle17");

    obj.listaOrganizacoes = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.listaOrganizacoes:setParent(obj.layout3);
    obj.listaOrganizacoes:setField("organizacao");
    obj.listaOrganizacoes:setName("listaOrganizacoes");
    obj.listaOrganizacoes:setLeft(505);
    obj.listaOrganizacoes:setTop(236);
    obj.listaOrganizacoes:setWidth(120);
    obj.listaOrganizacoes:setHeight(17);
    obj.listaOrganizacoes:setTransparent(true);
    obj.listaOrganizacoes:setText("0");
    obj.listaOrganizacoes:setFontColor("black");
    obj.listaOrganizacoes:setFontSize(12);
    obj.listaOrganizacoes:setHorzTextAlign("center");
    obj.listaOrganizacoes:setItems(Organizacoes);
    obj.listaOrganizacoes:setValues(Organizacoes);

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(5);
    obj.layout4:setTop(10);
    obj.layout4:setWidth(1000);
    obj.layout4:setHeight(1800);
    obj.layout4:setName("layout4");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout4);
    obj.rectangle18:setLeft(192);
    obj.rectangle18:setTop(292);
    obj.rectangle18:setWidth(97);
    obj.rectangle18:setHeight(123);
    obj.rectangle18:setColor("#4169E1");
    obj.rectangle18:setName("rectangle18");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout4);
    obj.rectangle19:setLeft(194);
    obj.rectangle19:setTop(294);
    obj.rectangle19:setWidth(93);
    obj.rectangle19:setHeight(119);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setName("rectangle19");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout4);
    obj.rectangle20:setLeft(196);
    obj.rectangle20:setTop(296);
    obj.rectangle20:setWidth(89);
    obj.rectangle20:setHeight(115);
    obj.rectangle20:setColor("#F5F5DC");
    obj.rectangle20:setName("rectangle20");

    obj.NomeProfissaoPrincipal = GUI.fromHandle(_obj_newObject("label"));
    obj.NomeProfissaoPrincipal:setParent(obj.layout4);
    obj.NomeProfissaoPrincipal:setField("nomePrincipal");
    obj.NomeProfissaoPrincipal:setName("NomeProfissaoPrincipal");
    obj.NomeProfissaoPrincipal:setLeft(196);
    obj.NomeProfissaoPrincipal:setTop(392);
    obj.NomeProfissaoPrincipal:setWidth(89);
    obj.NomeProfissaoPrincipal:setHeight(113);
    obj.NomeProfissaoPrincipal:setText("Profissão 1");
    obj.NomeProfissaoPrincipal:setFontSize(13);
    lfm_setPropAsString(obj.NomeProfissaoPrincipal, "fontStyle", "bold");
    obj.NomeProfissaoPrincipal:setFontColor("black");
    obj.NomeProfissaoPrincipal:setAutoSize(true);
    obj.NomeProfissaoPrincipal:setHorzTextAlign("center");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout4);
    obj.rectangle21:setLeft(199.5);
    obj.rectangle21:setTop(300);
    obj.rectangle21:setWidth(82);
    obj.rectangle21:setHeight(92);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setName("rectangle21");

    obj.ImagemProfissaoPrincipal = GUI.fromHandle(_obj_newObject("image"));
    obj.ImagemProfissaoPrincipal:setParent(obj.layout4);
    obj.ImagemProfissaoPrincipal:setField("imagemPrincipal");
    obj.ImagemProfissaoPrincipal:setName("ImagemProfissaoPrincipal");
    obj.ImagemProfissaoPrincipal:setLeft(199.5);
    obj.ImagemProfissaoPrincipal:setTop(300);
    obj.ImagemProfissaoPrincipal:setWidth(82);
    obj.ImagemProfissaoPrincipal:setHeight(92);
    obj.ImagemProfissaoPrincipal:setStyle("autoFit");
    obj.ImagemProfissaoPrincipal.animate = true;

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout4);
    obj.button1:setLeft(193);
    obj.button1:setTop(292);
    obj.button1:setWidth(97);
    obj.button1:setHeight(123);
    obj.button1:setOpacity(0);
    obj.button1:setCursor("handPoint");
    obj.button1:setName("button1");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout4);
    obj.rectangle22:setLeft(555);
    obj.rectangle22:setTop(292);
    obj.rectangle22:setWidth(97);
    obj.rectangle22:setHeight(123);
    obj.rectangle22:setColor("#4169E1");
    obj.rectangle22:setName("rectangle22");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout4);
    obj.rectangle23:setLeft(557);
    obj.rectangle23:setTop(294);
    obj.rectangle23:setWidth(93);
    obj.rectangle23:setHeight(119);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setName("rectangle23");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout4);
    obj.rectangle24:setLeft(559);
    obj.rectangle24:setTop(296);
    obj.rectangle24:setWidth(89);
    obj.rectangle24:setHeight(115);
    obj.rectangle24:setColor("#F5F5DC");
    obj.rectangle24:setName("rectangle24");

    obj.NomeProfissaoSecundaria = GUI.fromHandle(_obj_newObject("label"));
    obj.NomeProfissaoSecundaria:setParent(obj.layout4);
    obj.NomeProfissaoSecundaria:setField("nomeSecundaria");
    obj.NomeProfissaoSecundaria:setName("NomeProfissaoSecundaria");
    obj.NomeProfissaoSecundaria:setLeft(559);
    obj.NomeProfissaoSecundaria:setTop(392);
    obj.NomeProfissaoSecundaria:setWidth(89);
    obj.NomeProfissaoSecundaria:setHeight(113);
    obj.NomeProfissaoSecundaria:setText("Profissão 2");
    obj.NomeProfissaoSecundaria:setFontSize(13);
    lfm_setPropAsString(obj.NomeProfissaoSecundaria, "fontStyle", "bold");
    obj.NomeProfissaoSecundaria:setFontColor("black");
    obj.NomeProfissaoSecundaria:setAutoSize(true);
    obj.NomeProfissaoSecundaria:setHorzTextAlign("center");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout4);
    obj.rectangle25:setLeft(562.5);
    obj.rectangle25:setTop(300);
    obj.rectangle25:setWidth(82);
    obj.rectangle25:setHeight(92);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setName("rectangle25");

    obj.ImagemProfissaoSecundaria = GUI.fromHandle(_obj_newObject("image"));
    obj.ImagemProfissaoSecundaria:setParent(obj.layout4);
    obj.ImagemProfissaoSecundaria:setField("imagemSecundaria");
    obj.ImagemProfissaoSecundaria:setName("ImagemProfissaoSecundaria");
    obj.ImagemProfissaoSecundaria:setLeft(562.5);
    obj.ImagemProfissaoSecundaria:setTop(300);
    obj.ImagemProfissaoSecundaria:setWidth(82);
    obj.ImagemProfissaoSecundaria:setHeight(92);
    obj.ImagemProfissaoSecundaria:setStyle("autoFit");
    obj.ImagemProfissaoSecundaria.animate = true;

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout4);
    obj.button2:setLeft(556);
    obj.button2:setTop(292);
    obj.button2:setWidth(97);
    obj.button2:setHeight(123);
    obj.button2:setOpacity(0);
    obj.button2:setCursor("handPoint");
    obj.button2:setName("button2");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout4);
    obj.rectangle26:setLeft(302);
    obj.rectangle26:setTop(292);
    obj.rectangle26:setWidth(240);
    obj.rectangle26:setHeight(123);
    obj.rectangle26:setColor("#4169E1");
    obj.rectangle26:setName("rectangle26");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout4);
    obj.rectangle27:setLeft(304);
    obj.rectangle27:setTop(294);
    obj.rectangle27:setWidth(236);
    obj.rectangle27:setHeight(119);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setName("rectangle27");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout4);
    obj.rectangle28:setLeft(306);
    obj.rectangle28:setTop(296);
    obj.rectangle28:setWidth(232);
    obj.rectangle28:setHeight(115);
    obj.rectangle28:setColor("#F5F5DC");
    obj.rectangle28:setName("rectangle28");

    obj.NomeRaca = GUI.fromHandle(_obj_newObject("label"));
    obj.NomeRaca:setParent(obj.layout4);
    obj.NomeRaca:setField("nomeRaca");
    obj.NomeRaca:setName("NomeRaca");
    obj.NomeRaca:setLeft(306);
    obj.NomeRaca:setTop(392);
    obj.NomeRaca:setWidth(232);
    obj.NomeRaca:setHeight(113);
    obj.NomeRaca:setText("Raça");
    obj.NomeRaca:setFontSize(13);
    lfm_setPropAsString(obj.NomeRaca, "fontStyle", "bold");
    obj.NomeRaca:setFontColor("black");
    obj.NomeRaca:setAutoSize(true);
    obj.NomeRaca:setHorzTextAlign("center");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout4);
    obj.rectangle29:setLeft(310);
    obj.rectangle29:setTop(300);
    obj.rectangle29:setWidth(225);
    obj.rectangle29:setHeight(92);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setName("rectangle29");

    obj.ImagemRaca = GUI.fromHandle(_obj_newObject("image"));
    obj.ImagemRaca:setParent(obj.layout4);
    obj.ImagemRaca:setField("imagemRaca");
    obj.ImagemRaca:setName("ImagemRaca");
    obj.ImagemRaca:setLeft(310);
    obj.ImagemRaca:setTop(300);
    obj.ImagemRaca:setWidth(225);
    obj.ImagemRaca:setHeight(92);
    obj.ImagemRaca:setStyle("autoFit");
    obj.ImagemRaca.animate = true;

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout4);
    obj.button3:setLeft(302);
    obj.button3:setTop(292);
    obj.button3:setWidth(240);
    obj.button3:setHeight(123);
    obj.button3:setOpacity(0);
    obj.button3:setCursor("handPoint");
    obj.button3:setName("button3");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout4);
    obj.rectangle30:setLeft(302);
    obj.rectangle30:setTop(424);
    obj.rectangle30:setWidth(240);
    obj.rectangle30:setHeight(123);
    obj.rectangle30:setColor("#4169E1");
    obj.rectangle30:setName("rectangle30");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout4);
    obj.rectangle31:setLeft(304);
    obj.rectangle31:setTop(426);
    obj.rectangle31:setWidth(236);
    obj.rectangle31:setHeight(119);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setName("rectangle31");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout4);
    obj.label12:setLeft(304);
    obj.label12:setTop(473);
    obj.label12:setWidth(236);
    obj.label12:setHeight(119);
    obj.label12:setText("Clique para adicionar sua bandeira");
    obj.label12:setFontSize(12.5);
    lfm_setPropAsString(obj.label12, "fontStyle", "bold");
    obj.label12:setFontColor("#4169E1");
    obj.label12:setAutoSize(true);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.ImagemBandeira = GUI.fromHandle(_obj_newObject("image"));
    obj.ImagemBandeira:setParent(obj.layout4);
    obj.ImagemBandeira:setField("imagemBandeira");
    obj.ImagemBandeira:setName("ImagemBandeira");
    obj.ImagemBandeira:setLeft(306);
    obj.ImagemBandeira:setTop(428);
    obj.ImagemBandeira:setWidth(232);
    obj.ImagemBandeira:setHeight(115);
    obj.ImagemBandeira:setStyle("autoFit");
    obj.ImagemBandeira.animate = true;

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout4);
    obj.rectangle32:setLeft(192);
    obj.rectangle32:setTop(424);
    obj.rectangle32:setWidth(97);
    obj.rectangle32:setHeight(123);
    obj.rectangle32:setColor("#4169E1");
    obj.rectangle32:setName("rectangle32");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout4);
    obj.rectangle33:setLeft(194);
    obj.rectangle33:setTop(426);
    obj.rectangle33:setWidth(93);
    obj.rectangle33:setHeight(119);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setName("rectangle33");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout4);
    obj.rectangle34:setLeft(196);
    obj.rectangle34:setTop(428);
    obj.rectangle34:setWidth(89);
    obj.rectangle34:setHeight(115);
    obj.rectangle34:setColor("#F5F5DC");
    obj.rectangle34:setName("rectangle34");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout4);
    obj.label13:setField("nomeHistoria");
    obj.label13:setLeft(196);
    obj.label13:setTop(526);
    obj.label13:setWidth(89);
    obj.label13:setHeight(115);
    obj.label13:setText("História");
    obj.label13:setFontSize(13);
    lfm_setPropAsString(obj.label13, "fontStyle", "bold");
    obj.label13:setFontColor("black");
    obj.label13:setAutoSize(true);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout4);
    obj.image3:setField("imagemHistoria");
    obj.image3:setLeft(199);
    obj.image3:setTop(434);
    obj.image3:setWidth(82);
    obj.image3:setHeight(92);
    obj.image3:setStyle("autoFit");
    obj.image3.animate = true;
    obj.image3:setSRC("https://i.pinimg.com/originals/90/44/71/904471579390183b95e3b6e0595bce46.gif");
    obj.image3:setName("image3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout4);
    obj.button4:setLeft(192);
    obj.button4:setTop(424);
    obj.button4:setWidth(97);
    obj.button4:setHeight(123);
    obj.button4:setOpacity(0);
    obj.button4:setCursor("handPoint");
    obj.button4:setName("button4");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout4);
    obj.rectangle35:setLeft(555);
    obj.rectangle35:setTop(424);
    obj.rectangle35:setWidth(97);
    obj.rectangle35:setHeight(123);
    obj.rectangle35:setColor("#4169E1");
    obj.rectangle35:setName("rectangle35");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout4);
    obj.rectangle36:setLeft(557);
    obj.rectangle36:setTop(426);
    obj.rectangle36:setWidth(93);
    obj.rectangle36:setHeight(119);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setName("rectangle36");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout4);
    obj.rectangle37:setLeft(559);
    obj.rectangle37:setTop(428);
    obj.rectangle37:setWidth(89);
    obj.rectangle37:setHeight(115);
    obj.rectangle37:setColor("#F5F5DC");
    obj.rectangle37:setName("rectangle37");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout4);
    obj.label14:setField("nomeAnotacoes");
    obj.label14:setLeft(559);
    obj.label14:setTop(526);
    obj.label14:setWidth(89);
    obj.label14:setHeight(115);
    obj.label14:setText("Anotações");
    obj.label14:setFontSize(13);
    lfm_setPropAsString(obj.label14, "fontStyle", "bold");
    obj.label14:setFontColor("black");
    obj.label14:setAutoSize(true);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout4);
    obj.image4:setField("imagemAnotacoes");
    obj.image4:setLeft(562);
    obj.image4:setTop(434);
    obj.image4:setWidth(82);
    obj.image4:setHeight(92);
    obj.image4:setStyle("autoFit");
    obj.image4.animate = true;
    obj.image4:setSRC("https://i.pinimg.com/originals/3b/13/8c/3b138cfbb52c29b1aab2f55fbdd7f473.gif");
    obj.image4:setName("image4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout4);
    obj.button5:setLeft(555);
    obj.button5:setTop(424);
    obj.button5:setWidth(97);
    obj.button5:setHeight(123);
    obj.button5:setOpacity(0);
    obj.button5:setCursor("handPoint");
    obj.button5:setName("button5");

    obj.AbaProfissaoPrincipal = GUI.fromHandle(_obj_newObject("layout"));
    obj.AbaProfissaoPrincipal:setParent(obj.layout1);
    obj.AbaProfissaoPrincipal:setName("AbaProfissaoPrincipal");
    obj.AbaProfissaoPrincipal:setLeft(5);
    obj.AbaProfissaoPrincipal:setTop(10);
    obj.AbaProfissaoPrincipal:setWidth(5000);
    obj.AbaProfissaoPrincipal:setHeight(1800);
    obj.AbaProfissaoPrincipal:setVisible(false);

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.AbaProfissaoPrincipal);
    obj.rectangle38:setLeft(665);
    obj.rectangle38:setTop(22);
    obj.rectangle38:setWidth(608);
    obj.rectangle38:setHeight(525);
    obj.rectangle38:setColor("#4169E1");
    obj.rectangle38:setName("rectangle38");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.AbaProfissaoPrincipal);
    obj.rectangle39:setLeft(667);
    obj.rectangle39:setTop(24);
    obj.rectangle39:setWidth(604);
    obj.rectangle39:setHeight(521);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setName("rectangle39");

    obj.tabControl2 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl2:setParent(obj.AbaProfissaoPrincipal);
    obj.tabControl2:setLeft(667);
    obj.tabControl2:setTop(26);
    obj.tabControl2:setWidth(604);
    obj.tabControl2:setHeight(520);
    obj.tabControl2:setName("tabControl2");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl2);
    obj.tab2:setTitle("Informações Profissionais");
    obj.tab2:setName("tab2");

    obj.ProfissaoPrincipal = GUI.fromHandle(_obj_newObject("label"));
    obj.ProfissaoPrincipal:setParent(obj.tab2);
    obj.ProfissaoPrincipal:setField("profissaoPrincipal");
    obj.ProfissaoPrincipal:setName("ProfissaoPrincipal");
    obj.ProfissaoPrincipal:setLeft(160);
    obj.ProfissaoPrincipal:setTop(5);
    obj.ProfissaoPrincipal:setWidth(270);
    obj.ProfissaoPrincipal:setHeight(35);
    obj.ProfissaoPrincipal:setText("Escolher");
    obj.ProfissaoPrincipal:setFontSize(28);
    lfm_setPropAsString(obj.ProfissaoPrincipal, "fontStyle", "bold");
    obj.ProfissaoPrincipal:setFontColor("#F5F5DC");
    obj.ProfissaoPrincipal:setAutoSize(true);
    obj.ProfissaoPrincipal:setHorzTextAlign("center");

    obj.FotoProfissaoPrincipal = GUI.fromHandle(_obj_newObject("image"));
    obj.FotoProfissaoPrincipal:setParent(obj.tab2);
    obj.FotoProfissaoPrincipal:setField("fotoProfissaoPrincipal");
    obj.FotoProfissaoPrincipal:setName("FotoProfissaoPrincipal");
    obj.FotoProfissaoPrincipal:setLeft(118);
    obj.FotoProfissaoPrincipal:setTop(50);
    obj.FotoProfissaoPrincipal:setWidth(250);
    obj.FotoProfissaoPrincipal:setHeight(140);
    obj.FotoProfissaoPrincipal:setScaleX(1.4);
    obj.FotoProfissaoPrincipal:setStyle("autoFit");
    obj.FotoProfissaoPrincipal.animate = true;

    obj.ComboProfissaoPrincipal = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.ComboProfissaoPrincipal:setParent(obj.tab2);
    obj.ComboProfissaoPrincipal:setField("comboProfissaoPrincipal");
    obj.ComboProfissaoPrincipal:setName("ComboProfissaoPrincipal");
    obj.ComboProfissaoPrincipal:setLeft(160);
    obj.ComboProfissaoPrincipal:setTop(5);
    obj.ComboProfissaoPrincipal:setWidth(270);
    obj.ComboProfissaoPrincipal:setHeight(35);
    obj.ComboProfissaoPrincipal:setItems(Profissoes);
    obj.ComboProfissaoPrincipal:setValue("Profissoes");
    obj.ComboProfissaoPrincipal:setHorzTextAlign("center");
    lfm_setPropAsString(obj.ComboProfissaoPrincipal, "fontStyle", "bold");
    obj.ComboProfissaoPrincipal:setFontSize(16);
    obj.ComboProfissaoPrincipal:setTransparent(true);
    obj.ComboProfissaoPrincipal:setOpacity(0);

    obj.LayoutProfissaoPrincipal = GUI.fromHandle(_obj_newObject("layout"));
    obj.LayoutProfissaoPrincipal:setParent(obj.tab2);
    obj.LayoutProfissaoPrincipal:setName("LayoutProfissaoPrincipal");
    obj.LayoutProfissaoPrincipal:setWidth(5000);
    obj.LayoutProfissaoPrincipal:setHeight(1800);
    obj.LayoutProfissaoPrincipal:setVisible(false);

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.LayoutProfissaoPrincipal);
    obj.label15:setLeft(205);
    obj.label15:setTop(193);
    obj.label15:setWidth(40);
    obj.label15:setHeight(30);
    obj.label15:setText("Tier:");
    lfm_setPropAsString(obj.label15, "fontStyle", "bold");
    obj.label15:setFontColor("white");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.LayoutProfissaoPrincipal);
    obj.rectangle40:setLeft(245);
    obj.rectangle40:setTop(201);
    obj.rectangle40:setWidth(27);
    obj.rectangle40:setHeight(15);
    obj.rectangle40:setColor("white");
    obj.rectangle40:setXradius(7);
    obj.rectangle40:setYradius(7);
    obj.rectangle40:setCornerType("round");
    obj.rectangle40:setName("rectangle40");

    obj.TierPrincipal = GUI.fromHandle(_obj_newObject("edit"));
    obj.TierPrincipal:setParent(obj.LayoutProfissaoPrincipal);
    obj.TierPrincipal:setField("tierProfissaoPrincipal");
    obj.TierPrincipal:setName("TierPrincipal");
    obj.TierPrincipal:setLeft(245);
    obj.TierPrincipal:setTop(201);
    obj.TierPrincipal:setWidth(27);
    obj.TierPrincipal:setHeight(15);
    obj.TierPrincipal:setFontColor("black");
    obj.TierPrincipal:setFontSize(12);
    obj.TierPrincipal:setHorzTextAlign("center");
    obj.TierPrincipal:setTransparent(true);
    obj.TierPrincipal:setType("number");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.LayoutProfissaoPrincipal);
    obj.label16:setLeft(285);
    obj.label16:setTop(193);
    obj.label16:setWidth(40);
    obj.label16:setHeight(30);
    obj.label16:setText("%Xp:");
    lfm_setPropAsString(obj.label16, "fontStyle", "bold");
    obj.label16:setFontColor("white");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.LayoutProfissaoPrincipal);
    obj.rectangle41:setLeft(325);
    obj.rectangle41:setTop(201);
    obj.rectangle41:setWidth(80);
    obj.rectangle41:setHeight(15);
    obj.rectangle41:setColor("white");
    obj.rectangle41:setXradius(7);
    obj.rectangle41:setYradius(7);
    obj.rectangle41:setCornerType("round");
    obj.rectangle41:setName("rectangle41");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.LayoutProfissaoPrincipal);
    obj.label17:setLeft(354);
    obj.label17:setTop(192);
    obj.label17:setWidth(17);
    obj.label17:setHeight(30);
    obj.label17:setText("/");
    obj.label17:setFontColor("black");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.LayoutProfissaoPrincipal);
    obj.edit2:setField("xpAtualProfissaoPrincipal");
    obj.edit2:setLeft(325);
    obj.edit2:setTop(201);
    obj.edit2:setWidth(38);
    obj.edit2:setHeight(15);
    obj.edit2:setFontColor("black");
    obj.edit2:setFontSize(12);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setType("number");
    obj.edit2:setTransparent(true);
    obj.edit2:setName("edit2");

    obj.XpMaxPrincipal = GUI.fromHandle(_obj_newObject("edit"));
    obj.XpMaxPrincipal:setParent(obj.LayoutProfissaoPrincipal);
    obj.XpMaxPrincipal:setField("xpMaximaProfissaoPrincipal");
    obj.XpMaxPrincipal:setName("XpMaxPrincipal");
    obj.XpMaxPrincipal:setLeft(364);
    obj.XpMaxPrincipal:setTop(201);
    obj.XpMaxPrincipal:setWidth(38);
    obj.XpMaxPrincipal:setHeight(15);
    obj.XpMaxPrincipal:setFontColor("black");
    obj.XpMaxPrincipal:setFontSize(12);
    obj.XpMaxPrincipal:setHorzTextAlign("center");
    obj.XpMaxPrincipal:setType("number");
    obj.XpMaxPrincipal:setTransparent(true);
    obj.XpMaxPrincipal:setReadOnly(true);

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.LayoutProfissaoPrincipal);
    obj.label18:setLeft(25);
    obj.label18:setTop(221);
    obj.label18:setWidth(102);
    obj.label18:setHeight(30);
    obj.label18:setText("Expecialização:");
    lfm_setPropAsString(obj.label18, "fontStyle", "bold");
    obj.label18:setFontColor("white");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.LayoutProfissaoPrincipal);
    obj.rectangle42:setLeft(129);
    obj.rectangle42:setTop(228);
    obj.rectangle42:setWidth(143);
    obj.rectangle42:setHeight(17);
    obj.rectangle42:setColor("white");
    obj.rectangle42:setXradius(7);
    obj.rectangle42:setYradius(7);
    obj.rectangle42:setCornerType("round");
    obj.rectangle42:setName("rectangle42");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.LayoutProfissaoPrincipal);
    obj.edit3:setField("especializacaoProfissaoPrincipal");
    obj.edit3:setLeft(129);
    obj.edit3:setTop(226);
    obj.edit3:setWidth(143);
    obj.edit3:setHeight(19);
    obj.edit3:setFontColor("black");
    obj.edit3:setFontSize(12);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setTransparent(true);
    obj.edit3:setName("edit3");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.LayoutProfissaoPrincipal);
    obj.label19:setLeft(285);
    obj.label19:setTop(221);
    obj.label19:setWidth(70);
    obj.label19:setHeight(30);
    obj.label19:setText("Dominio:");
    lfm_setPropAsString(obj.label19, "fontStyle", "bold");
    obj.label19:setFontColor("white");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.LayoutProfissaoPrincipal);
    obj.rectangle43:setLeft(355);
    obj.rectangle43:setTop(228);
    obj.rectangle43:setWidth(160);
    obj.rectangle43:setHeight(17);
    obj.rectangle43:setColor("white");
    obj.rectangle43:setXradius(7);
    obj.rectangle43:setYradius(7);
    obj.rectangle43:setCornerType("round");
    obj.rectangle43:setName("rectangle43");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.LayoutProfissaoPrincipal);
    obj.edit4:setField("dominioProfissaoPrincipal");
    obj.edit4:setLeft(355);
    obj.edit4:setTop(226);
    obj.edit4:setWidth(160);
    obj.edit4:setHeight(19);
    obj.edit4:setFontColor("black");
    obj.edit4:setFontSize(12);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setTransparent(true);
    obj.edit4:setName("edit4");

    obj.DescricaoProfissionalPrimaria = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.DescricaoProfissionalPrimaria:setParent(obj.LayoutProfissaoPrincipal);
    obj.DescricaoProfissionalPrimaria:setTop(255);
    obj.DescricaoProfissionalPrimaria:setWidth(604);
    obj.DescricaoProfissionalPrimaria:setScaleX(1);
    obj.DescricaoProfissionalPrimaria:setHeight(521);
    obj.DescricaoProfissionalPrimaria:setScaleY(1);
    obj.DescricaoProfissionalPrimaria:setName("DescricaoProfissionalPrimaria");
    obj.DescricaoProfissionalPrimaria.backgroundColor = "#404040";
    obj.DescricaoProfissionalPrimaria.defaultFontColor = "white";
    obj.DescricaoProfissionalPrimaria:setField("");
    obj.DescricaoProfissionalPrimaria.animateImages = true;
    obj.DescricaoProfissionalPrimaria.readOnly = true;
    obj.DescricaoProfissionalPrimaria.showToolbar = false;

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl2);
    obj.tab3:setTitle("Detalhamento");
    obj.tab3:setName("tab3");

    obj.DetalhamentoPrimario = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.DetalhamentoPrimario:setParent(obj.tab3);
    obj.DetalhamentoPrimario:setName("DetalhamentoPrimario");
    obj.DetalhamentoPrimario:setAlign("client");
    obj.DetalhamentoPrimario.backgroundColor = "#404040";
    obj.DetalhamentoPrimario.defaultFontColor = "white";
    obj.DetalhamentoPrimario:setField("");
    obj.DetalhamentoPrimario.animateImages = true;
    obj.DetalhamentoPrimario.readOnly = true;
    obj.DetalhamentoPrimario.showToolbar = false;

    obj.AbaProfissaoSecundaria = GUI.fromHandle(_obj_newObject("layout"));
    obj.AbaProfissaoSecundaria:setParent(obj.layout1);
    obj.AbaProfissaoSecundaria:setName("AbaProfissaoSecundaria");
    obj.AbaProfissaoSecundaria:setLeft(5);
    obj.AbaProfissaoSecundaria:setTop(10);
    obj.AbaProfissaoSecundaria:setWidth(5000);
    obj.AbaProfissaoSecundaria:setHeight(1800);
    obj.AbaProfissaoSecundaria:setVisible(false);

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.AbaProfissaoSecundaria);
    obj.rectangle44:setLeft(665);
    obj.rectangle44:setTop(22);
    obj.rectangle44:setWidth(608);
    obj.rectangle44:setHeight(525);
    obj.rectangle44:setColor("#4169E1");
    obj.rectangle44:setName("rectangle44");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.AbaProfissaoSecundaria);
    obj.rectangle45:setLeft(667);
    obj.rectangle45:setTop(24);
    obj.rectangle45:setWidth(604);
    obj.rectangle45:setHeight(521);
    obj.rectangle45:setColor("black");
    obj.rectangle45:setName("rectangle45");

    obj.tabControl3 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl3:setParent(obj.AbaProfissaoSecundaria);
    obj.tabControl3:setLeft(667);
    obj.tabControl3:setTop(26);
    obj.tabControl3:setWidth(604);
    obj.tabControl3:setHeight(520);
    obj.tabControl3:setName("tabControl3");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl3);
    obj.tab4:setTitle("Informações Profissionais");
    obj.tab4:setName("tab4");

    obj.ProfissaoSecundaria = GUI.fromHandle(_obj_newObject("label"));
    obj.ProfissaoSecundaria:setParent(obj.tab4);
    obj.ProfissaoSecundaria:setField("profissaoSecundaria");
    obj.ProfissaoSecundaria:setName("ProfissaoSecundaria");
    obj.ProfissaoSecundaria:setLeft(160);
    obj.ProfissaoSecundaria:setTop(5);
    obj.ProfissaoSecundaria:setWidth(270);
    obj.ProfissaoSecundaria:setHeight(35);
    obj.ProfissaoSecundaria:setText("Escolher");
    obj.ProfissaoSecundaria:setFontSize(28);
    lfm_setPropAsString(obj.ProfissaoSecundaria, "fontStyle", "bold");
    obj.ProfissaoSecundaria:setFontColor("#F5F5DC");
    obj.ProfissaoSecundaria:setAutoSize(true);
    obj.ProfissaoSecundaria:setHorzTextAlign("center");

    obj.FotoProfissaoSecundaria = GUI.fromHandle(_obj_newObject("image"));
    obj.FotoProfissaoSecundaria:setParent(obj.tab4);
    obj.FotoProfissaoSecundaria:setField("fotoProfissaoSecundaria");
    obj.FotoProfissaoSecundaria:setName("FotoProfissaoSecundaria");
    obj.FotoProfissaoSecundaria:setLeft(118);
    obj.FotoProfissaoSecundaria:setTop(50);
    obj.FotoProfissaoSecundaria:setWidth(250);
    obj.FotoProfissaoSecundaria:setHeight(140);
    obj.FotoProfissaoSecundaria:setScaleX(1.4);
    obj.FotoProfissaoSecundaria:setStyle("autoFit");
    obj.FotoProfissaoSecundaria.animate = true;

    obj.ComboProfissaoSecundaria = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.ComboProfissaoSecundaria:setParent(obj.tab4);
    obj.ComboProfissaoSecundaria:setField("comboProfissaoSecundaria");
    obj.ComboProfissaoSecundaria:setName("ComboProfissaoSecundaria");
    obj.ComboProfissaoSecundaria:setLeft(160);
    obj.ComboProfissaoSecundaria:setTop(5);
    obj.ComboProfissaoSecundaria:setWidth(270);
    obj.ComboProfissaoSecundaria:setHeight(35);
    obj.ComboProfissaoSecundaria:setItems(Profissoes);
    obj.ComboProfissaoSecundaria:setValue("Profissoes");
    obj.ComboProfissaoSecundaria:setHorzTextAlign("center");
    lfm_setPropAsString(obj.ComboProfissaoSecundaria, "fontStyle", "bold");
    obj.ComboProfissaoSecundaria:setFontSize(16);
    obj.ComboProfissaoSecundaria:setTransparent(true);
    obj.ComboProfissaoSecundaria:setOpacity(0);

    obj.LayoutProfissaoSecundaria = GUI.fromHandle(_obj_newObject("layout"));
    obj.LayoutProfissaoSecundaria:setParent(obj.tab4);
    obj.LayoutProfissaoSecundaria:setName("LayoutProfissaoSecundaria");
    obj.LayoutProfissaoSecundaria:setWidth(5000);
    obj.LayoutProfissaoSecundaria:setHeight(1800);
    obj.LayoutProfissaoSecundaria:setVisible(false);

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.LayoutProfissaoSecundaria);
    obj.label20:setLeft(205);
    obj.label20:setTop(193);
    obj.label20:setWidth(40);
    obj.label20:setHeight(30);
    obj.label20:setText("Tier:");
    lfm_setPropAsString(obj.label20, "fontStyle", "bold");
    obj.label20:setFontColor("white");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.LayoutProfissaoSecundaria);
    obj.rectangle46:setLeft(245);
    obj.rectangle46:setTop(201);
    obj.rectangle46:setWidth(27);
    obj.rectangle46:setHeight(15);
    obj.rectangle46:setColor("white");
    obj.rectangle46:setXradius(7);
    obj.rectangle46:setYradius(7);
    obj.rectangle46:setCornerType("round");
    obj.rectangle46:setName("rectangle46");

    obj.TierSecundaria = GUI.fromHandle(_obj_newObject("edit"));
    obj.TierSecundaria:setParent(obj.LayoutProfissaoSecundaria);
    obj.TierSecundaria:setField("tierProfissaoSecundaria");
    obj.TierSecundaria:setName("TierSecundaria");
    obj.TierSecundaria:setLeft(245);
    obj.TierSecundaria:setTop(201);
    obj.TierSecundaria:setWidth(27);
    obj.TierSecundaria:setHeight(15);
    obj.TierSecundaria:setFontColor("black");
    obj.TierSecundaria:setFontSize(12);
    obj.TierSecundaria:setHorzTextAlign("center");
    obj.TierSecundaria:setTransparent(true);
    obj.TierSecundaria:setType("number");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.LayoutProfissaoSecundaria);
    obj.label21:setLeft(285);
    obj.label21:setTop(193);
    obj.label21:setWidth(40);
    obj.label21:setHeight(30);
    obj.label21:setText("%Xp:");
    lfm_setPropAsString(obj.label21, "fontStyle", "bold");
    obj.label21:setFontColor("white");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.LayoutProfissaoSecundaria);
    obj.rectangle47:setLeft(325);
    obj.rectangle47:setTop(201);
    obj.rectangle47:setWidth(80);
    obj.rectangle47:setHeight(15);
    obj.rectangle47:setColor("white");
    obj.rectangle47:setXradius(7);
    obj.rectangle47:setYradius(7);
    obj.rectangle47:setCornerType("round");
    obj.rectangle47:setName("rectangle47");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.LayoutProfissaoSecundaria);
    obj.label22:setLeft(354);
    obj.label22:setTop(192);
    obj.label22:setWidth(17);
    obj.label22:setHeight(30);
    obj.label22:setText("/");
    obj.label22:setFontColor("black");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.LayoutProfissaoSecundaria);
    obj.edit5:setField("xpAtualProfissaoSecundaria");
    obj.edit5:setLeft(325);
    obj.edit5:setTop(201);
    obj.edit5:setWidth(38);
    obj.edit5:setHeight(15);
    obj.edit5:setFontColor("black");
    obj.edit5:setFontSize(12);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setType("number");
    obj.edit5:setTransparent(true);
    obj.edit5:setName("edit5");

    obj.XpMaxSecundaria = GUI.fromHandle(_obj_newObject("edit"));
    obj.XpMaxSecundaria:setParent(obj.LayoutProfissaoSecundaria);
    obj.XpMaxSecundaria:setField("xpMaximaProfissaoSecundaria");
    obj.XpMaxSecundaria:setName("XpMaxSecundaria");
    obj.XpMaxSecundaria:setLeft(364);
    obj.XpMaxSecundaria:setTop(201);
    obj.XpMaxSecundaria:setWidth(38);
    obj.XpMaxSecundaria:setHeight(15);
    obj.XpMaxSecundaria:setFontColor("black");
    obj.XpMaxSecundaria:setFontSize(12);
    obj.XpMaxSecundaria:setHorzTextAlign("center");
    obj.XpMaxSecundaria:setType("number");
    obj.XpMaxSecundaria:setTransparent(true);
    obj.XpMaxSecundaria:setReadOnly(true);

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.LayoutProfissaoSecundaria);
    obj.label23:setLeft(25);
    obj.label23:setTop(221);
    obj.label23:setWidth(102);
    obj.label23:setHeight(30);
    obj.label23:setText("Expecialização:");
    lfm_setPropAsString(obj.label23, "fontStyle", "bold");
    obj.label23:setFontColor("white");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.LayoutProfissaoSecundaria);
    obj.rectangle48:setLeft(129);
    obj.rectangle48:setTop(228);
    obj.rectangle48:setWidth(143);
    obj.rectangle48:setHeight(17);
    obj.rectangle48:setColor("white");
    obj.rectangle48:setXradius(7);
    obj.rectangle48:setYradius(7);
    obj.rectangle48:setCornerType("round");
    obj.rectangle48:setName("rectangle48");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.LayoutProfissaoSecundaria);
    obj.edit6:setField("especializacaoProfissaoSecundaria");
    obj.edit6:setLeft(129);
    obj.edit6:setTop(226);
    obj.edit6:setWidth(143);
    obj.edit6:setHeight(19);
    obj.edit6:setFontColor("black");
    obj.edit6:setFontSize(12);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setTransparent(true);
    obj.edit6:setName("edit6");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.LayoutProfissaoSecundaria);
    obj.label24:setLeft(285);
    obj.label24:setTop(221);
    obj.label24:setWidth(70);
    obj.label24:setHeight(30);
    obj.label24:setText("Dominio:");
    lfm_setPropAsString(obj.label24, "fontStyle", "bold");
    obj.label24:setFontColor("white");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.LayoutProfissaoSecundaria);
    obj.rectangle49:setLeft(355);
    obj.rectangle49:setTop(228);
    obj.rectangle49:setWidth(160);
    obj.rectangle49:setHeight(17);
    obj.rectangle49:setColor("white");
    obj.rectangle49:setXradius(7);
    obj.rectangle49:setYradius(7);
    obj.rectangle49:setCornerType("round");
    obj.rectangle49:setName("rectangle49");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.LayoutProfissaoSecundaria);
    obj.edit7:setField("dominioProfissaoSecundaria");
    obj.edit7:setLeft(355);
    obj.edit7:setTop(226);
    obj.edit7:setWidth(160);
    obj.edit7:setHeight(19);
    obj.edit7:setFontColor("black");
    obj.edit7:setFontSize(12);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setTransparent(true);
    obj.edit7:setName("edit7");

    obj.DescricaoProfissionalSecundaria = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.DescricaoProfissionalSecundaria:setParent(obj.LayoutProfissaoSecundaria);
    obj.DescricaoProfissionalSecundaria:setTop(255);
    obj.DescricaoProfissionalSecundaria:setWidth(604);
    obj.DescricaoProfissionalSecundaria:setScaleX(1);
    obj.DescricaoProfissionalSecundaria:setHeight(521);
    obj.DescricaoProfissionalSecundaria:setScaleY(1);
    obj.DescricaoProfissionalSecundaria:setName("DescricaoProfissionalSecundaria");
    obj.DescricaoProfissionalSecundaria.backgroundColor = "#404040";
    obj.DescricaoProfissionalSecundaria.defaultFontColor = "white";
    obj.DescricaoProfissionalSecundaria:setField("");
    obj.DescricaoProfissionalSecundaria.animateImages = true;
    obj.DescricaoProfissionalSecundaria.readOnly = true;
    obj.DescricaoProfissionalSecundaria.showToolbar = false;

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl3);
    obj.tab5:setTitle("Detalhamento");
    obj.tab5:setName("tab5");

    obj.DetalhamentoSecundario = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.DetalhamentoSecundario:setParent(obj.tab5);
    obj.DetalhamentoSecundario:setName("DetalhamentoSecundario");
    obj.DetalhamentoSecundario:setAlign("client");
    obj.DetalhamentoSecundario.backgroundColor = "#404040";
    obj.DetalhamentoSecundario.defaultFontColor = "white";
    obj.DetalhamentoSecundario:setField("");
    obj.DetalhamentoSecundario.animateImages = true;
    obj.DetalhamentoSecundario.readOnly = true;
    obj.DetalhamentoSecundario.showToolbar = false;

    obj.AbaRaca = GUI.fromHandle(_obj_newObject("layout"));
    obj.AbaRaca:setParent(obj.layout1);
    obj.AbaRaca:setName("AbaRaca");
    obj.AbaRaca:setLeft(5);
    obj.AbaRaca:setTop(10);
    obj.AbaRaca:setWidth(5000);
    obj.AbaRaca:setHeight(1800);
    obj.AbaRaca:setVisible(false);

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.AbaRaca);
    obj.rectangle50:setLeft(665);
    obj.rectangle50:setTop(22);
    obj.rectangle50:setWidth(608);
    obj.rectangle50:setHeight(525);
    obj.rectangle50:setColor("#4169E1");
    obj.rectangle50:setName("rectangle50");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.AbaRaca);
    obj.rectangle51:setLeft(667);
    obj.rectangle51:setTop(24);
    obj.rectangle51:setWidth(604);
    obj.rectangle51:setHeight(521);
    obj.rectangle51:setColor("black");
    obj.rectangle51:setName("rectangle51");

    obj.tabControl4 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl4:setParent(obj.AbaRaca);
    obj.tabControl4:setLeft(667);
    obj.tabControl4:setTop(26);
    obj.tabControl4:setWidth(604);
    obj.tabControl4:setHeight(520);
    obj.tabControl4:setName("tabControl4");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl4);
    obj.tab6:setTitle("Caracteristicas Raciais");
    obj.tab6:setName("tab6");

    obj.Raca = GUI.fromHandle(_obj_newObject("label"));
    obj.Raca:setParent(obj.tab6);
    obj.Raca:setField("raca");
    obj.Raca:setName("Raca");
    obj.Raca:setLeft(-5);
    obj.Raca:setTop(5);
    obj.Raca:setWidth(604);
    obj.Raca:setHeight(35);
    obj.Raca:setText("Escolher");
    obj.Raca:setFontSize(28);
    lfm_setPropAsString(obj.Raca, "fontStyle", "bold");
    obj.Raca:setFontColor("#F5F5DC");
    obj.Raca:setAutoSize(true);
    obj.Raca:setHorzTextAlign("center");
    obj.Raca:setVisible(true);

    obj.ComboRaca = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.ComboRaca:setParent(obj.tab6);
    obj.ComboRaca:setField("comboRaca");
    obj.ComboRaca:setName("ComboRaca");
    obj.ComboRaca:setLeft(170);
    obj.ComboRaca:setTop(5);
    obj.ComboRaca:setWidth(250);
    obj.ComboRaca:setHeight(35);
    obj.ComboRaca:setItems(Racas);
    obj.ComboRaca:setValues(RacasSemCaracteresEspeciais);
    obj.ComboRaca:setHorzTextAlign("center");
    lfm_setPropAsString(obj.ComboRaca, "fontStyle", "bold");
    obj.ComboRaca:setFontSize(16);
    obj.ComboRaca:setTransparent(true);
    obj.ComboRaca:setOpacity(0);

    obj.FotoRaca = GUI.fromHandle(_obj_newObject("image"));
    obj.FotoRaca:setParent(obj.tab6);
    obj.FotoRaca:setField("fotoRaca");
    obj.FotoRaca:setName("FotoRaca");
    obj.FotoRaca:setLeft(125);
    obj.FotoRaca:setTop(50);
    obj.FotoRaca:setWidth(250);
    obj.FotoRaca:setHeight(140);
    obj.FotoRaca:setScaleX(1.4);
    obj.FotoRaca:setStyle("autoFit");
    obj.FotoRaca.animate = true;

    obj.DescricaoRacial = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.DescricaoRacial:setParent(obj.tab6);
    obj.DescricaoRacial:setTop(205);
    obj.DescricaoRacial:setWidth(604);
    obj.DescricaoRacial:setScaleX(1);
    obj.DescricaoRacial:setHeight(521);
    obj.DescricaoRacial:setScaleY(1);
    obj.DescricaoRacial:setName("DescricaoRacial");
    obj.DescricaoRacial.backgroundColor = "#404040";
    obj.DescricaoRacial.defaultFontColor = "white";
    obj.DescricaoRacial:setField("");
    obj.DescricaoRacial.animateImages = true;
    obj.DescricaoRacial.readOnly = true;
    obj.DescricaoRacial.showToolbar = false;

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl4);
    obj.tab7:setTitle("Habilidades Raciais");
    obj.tab7:setName("tab7");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.tab7);
    obj.richEdit1:setField("habilidadesRaciais");
    obj.richEdit1:setAlign("client");
    obj.richEdit1.backgroundColor = "black";
    obj.richEdit1.defaultFontColor = "white";
    obj.richEdit1.animateImages = true;
    obj.richEdit1:setName("richEdit1");

    obj.AbaHistoria = GUI.fromHandle(_obj_newObject("layout"));
    obj.AbaHistoria:setParent(obj.layout1);
    obj.AbaHistoria:setName("AbaHistoria");
    obj.AbaHistoria:setLeft(670);
    obj.AbaHistoria:setTop(10);
    obj.AbaHistoria:setWidth(2000);
    obj.AbaHistoria:setHeight(1800);
    obj.AbaHistoria:setVisible(false);

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.AbaHistoria);
    obj.rectangle52:setLeft(0);
    obj.rectangle52:setTop(22);
    obj.rectangle52:setWidth(608);
    obj.rectangle52:setHeight(525);
    obj.rectangle52:setColor("#4169E1");
    obj.rectangle52:setName("rectangle52");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.AbaHistoria);
    obj.rectangle53:setLeft(2);
    obj.rectangle53:setTop(24);
    obj.rectangle53:setWidth(604);
    obj.rectangle53:setHeight(521);
    obj.rectangle53:setColor("black");
    obj.rectangle53:setName("rectangle53");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.AbaHistoria);
    obj.label25:setLeft(-2);
    obj.label25:setTop(30);
    obj.label25:setWidth(604);
    obj.label25:setHeight(521);
    obj.label25:setText("História");
    obj.label25:setFontSize(24);
    lfm_setPropAsString(obj.label25, "fontStyle", "bold underline");
    obj.label25:setFontColor("#F5F5DC");
    obj.label25:setAutoSize(true);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.AbaHistoria);
    obj.layout5:setLeft(2);
    obj.layout5:setTop(65);
    obj.layout5:setWidth(604);
    obj.layout5:setHeight(480);
    obj.layout5:setVisible(true);
    obj.layout5:setName("layout5");

    obj.editHistoria = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.editHistoria:setParent(obj.layout5);
    obj.editHistoria:setName("editHistoria");
    obj.editHistoria:setTop(35);
    obj.editHistoria:setAlign("client");
    obj.editHistoria.backgroundColor = "black";
    obj.editHistoria.defaultFontColor = "white";
    obj.editHistoria:setField("Historia");
    obj.editHistoria.animateImages = true;

    obj.AbaAnotacoes = GUI.fromHandle(_obj_newObject("layout"));
    obj.AbaAnotacoes:setParent(obj.layout1);
    obj.AbaAnotacoes:setName("AbaAnotacoes");
    obj.AbaAnotacoes:setLeft(670);
    obj.AbaAnotacoes:setTop(10);
    obj.AbaAnotacoes:setWidth(2000);
    obj.AbaAnotacoes:setHeight(1800);
    obj.AbaAnotacoes:setVisible(false);

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.AbaAnotacoes);
    obj.rectangle54:setLeft(0);
    obj.rectangle54:setTop(22);
    obj.rectangle54:setWidth(608);
    obj.rectangle54:setHeight(525);
    obj.rectangle54:setColor("#4169E1");
    obj.rectangle54:setName("rectangle54");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.AbaAnotacoes);
    obj.rectangle55:setLeft(2);
    obj.rectangle55:setTop(24);
    obj.rectangle55:setWidth(604);
    obj.rectangle55:setHeight(521);
    obj.rectangle55:setColor("black");
    obj.rectangle55:setName("rectangle55");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.AbaAnotacoes);
    obj.label26:setLeft(-2);
    obj.label26:setTop(30);
    obj.label26:setWidth(604);
    obj.label26:setHeight(521);
    obj.label26:setText("Anotações");
    obj.label26:setFontSize(24);
    lfm_setPropAsString(obj.label26, "fontStyle", "bold underline");
    obj.label26:setFontColor("#F5F5DC");
    obj.label26:setAutoSize(true);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.AbaAnotacoes);
    obj.layout6:setLeft(2);
    obj.layout6:setTop(65);
    obj.layout6:setWidth(604);
    obj.layout6:setHeight(480);
    obj.layout6:setVisible(true);
    obj.layout6:setName("layout6");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.layout6);
    obj.richEdit2:setTop(35);
    obj.richEdit2:setAlign("client");
    obj.richEdit2.backgroundColor = "black";
    obj.richEdit2.defaultFontColor = "white";
    obj.richEdit2:setField("Anotacao");
    obj.richEdit2.animateImages = true;
    obj.richEdit2:setName("richEdit2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.InfoGerais);
    obj.dataLink1:setField("nomePersonagem");
    obj.dataLink1:setDefaultValue("Nome do Personagem");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.InfoGerais);
    obj.dataLink2:setField("tituloPersonagem");
    obj.dataLink2:setDefaultValue("Titulo");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.InfoGerais);
    obj.dataLink3:setField("nivel");
    obj.dataLink3:setDefaultValue("1");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.InfoGerais);
    obj.dataLink4:setField("expAtual");
    obj.dataLink4:setDefaultValue("0");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.InfoGerais);
    obj.dataLink5:setField("expMax");
    obj.dataLink5:setDefaultValue("300");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.InfoGerais);
    obj.dataLink6:setField("nomeRaca");
    obj.dataLink6:setDefaultValue("Raça");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.InfoGerais);
    obj.dataLink7:setField("raca");
    obj.dataLink7:setDefaultValue("Escolher");
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.InfoGerais);
    obj.dataLink8:setField("comboProfissaoPrincipal");
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.InfoGerais);
    obj.dataLink9:setField("comboProfissaoSecundaria");
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.InfoGerais);
    obj.dataLink10:setField("comboRaca");
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.InfoGerais);
    obj.dataLink11:setField("tierProfissaoPrincipal");
    obj.dataLink11:setDefaultValue("0");
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.InfoGerais);
    obj.dataLink12:setField("tierProfissaoSecundaria");
    obj.dataLink12:setDefaultValue("0");
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.InfoGerais);
    obj.dataLink13:setField("xpAtualProfissaoPrincipal");
    obj.dataLink13:setDefaultValue("0");
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.InfoGerais);
    obj.dataLink14:setField("xpAtualProfissaoSecundaria");
    obj.dataLink14:setDefaultValue("0");
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.InfoGerais);
    obj.dataLink15:setField("xpMaximaProfissaoPrincipal");
    obj.dataLink15:setDefaultValue("10");
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.InfoGerais);
    obj.dataLink16:setField("xpMaximaProfissaoSecundaria");
    obj.dataLink16:setDefaultValue("10");
    obj.dataLink16:setName("dataLink16");

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Atributos & Haki");
    obj.tab8:setName("tab8");

    obj.Atributos = GUI.fromHandle(_obj_newObject("form"));
    obj.Atributos:setParent(obj.tab8);
    obj.Atributos:setFormType("sheetTemplate");
    obj.Atributos:setTitle("Brincadeiras Em Alto Mar");
    obj.Atributos:setName("Atributos");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.Atributos);
    obj.rectangle56:setLeft(0);
    obj.rectangle56:setTop(0);
    obj.rectangle56:setWidth(10000);
    obj.rectangle56:setHeight(10000);
    obj.rectangle56:setColor("black");
    obj.rectangle56:setName("rectangle56");

	
		function AlterarValorTotal(valor)
			-- Variáveis para os campos relacionados ao valor passado como parâmetro
			local valorBase = valor .. "Base"
			local valorPassivo = valor .. "Passivo"
			local valorEquips = valor .. "Equips"
			local valorTreino = valor .. "Treino"
			local valorTotal = valor .. "Total"

			-- Variáveis para os atributos passivos, equipamentos e treino
			local forcaBase = tonumber(sheet.ForcaBase) or 0
			local forcaPassivo = tonumber(sheet.ForcaPassivo) or 0
			local forcaEquips = tonumber(sheet.ForcaEquips) or 0
			local forcaTreino = tonumber(sheet.ForcaTreino) or 0

			local agilidadeBase = tonumber(sheet.AgilidadeBase) or 0
			local agilidadePassivo = tonumber(sheet.AgilidadePassivo) or 0
			local agilidadeEquips = tonumber(sheet.AgilidadeEquips) or 0
			local agilidadeTreino = tonumber(sheet.AgilidadeTreino) or 0

			local vigorBase = tonumber(sheet.VigorBase) or 0
			local vigorPassivo = tonumber(sheet.VigorPassivo) or 0
			local vigorEquips = tonumber(sheet.VigorEquips) or 0
			local vigorTreino = tonumber(sheet.VigorTreino) or 0

			local combateBase = tonumber(sheet.CombateBase) or 0
			local combatePassivo = tonumber(sheet.CombatePassivo) or 0
			local combateEquips = tonumber(sheet.CombateEquips) or 0
			local combateTreino = tonumber(sheet.CombateTreino) or 0
			
			local percepcaoBase = tonumber(sheet.PercepcaoBase) or 0
			local percepcaoPassivo = tonumber(sheet.PercepcaoPassivo) or 0
			local percepcaoEquips = tonumber(sheet.PercepcaoEquips) or 0
			local percepcaoTreino = tonumber(sheet.PercepcaoTreino) or 0

			local carismaBase = tonumber(sheet.CarismaBase) or 0
			local carismaPassivo = tonumber(sheet.CarismaPassivo) or 0
			local carismaEquips = tonumber(sheet.CarismaEquips) or 0
			local carismaTreino = tonumber(sheet.CarismaTreino) or 0

			local inteligenciaBase = tonumber(sheet.InteligenciaBase) or 0
			local inteligenciaPassivo = tonumber(sheet.InteligenciaPassivo) or 0
			local inteligenciaEquips = tonumber(sheet.InteligenciaEquips) or 0
			local inteligenciaTreino = tonumber(sheet.InteligenciaTreino) or 0

			local precisaoBase = tonumber(sheet.PrecisaoBase) or 0
			local precisaoPassivo = tonumber(sheet.PrecisaoPassivo) or 0
			local precisaoEquips = tonumber(sheet.PrecisaoEquips) or 0
			local precisaoTreino = tonumber(sheet.PrecisaoTreino) or 0

			local forcaDeVontadeBase = tonumber(sheet.ForcaDeVontadeBase) or 0
			local forcaDeVontadePassivo = tonumber(sheet.ForcaDeVontadePassivo) or 0
			local forcaDeVontadeEquips = tonumber(sheet.ForcaDeVontadeEquips) or 0
			local forcaDeVontadeTreino = tonumber(sheet.ForcaDeVontadeTreino) or 0
			
			-- Cálculo dos pontos de outros (passivos, equipamentos e treino)
			sheet.PontosOutros = tostring(
				forcaPassivo + forcaEquips + forcaTreino +
				agilidadePassivo + agilidadeEquips + agilidadeTreino +
				vigorPassivo + vigorEquips + vigorTreino +
				combatePassivo + combateEquips + combateTreino +
				percepcaoPassivo + percepcaoEquips + percepcaoTreino +
				carismaPassivo + carismaEquips + carismaTreino +
				inteligenciaPassivo + inteligenciaEquips + inteligenciaTreino +
				precisaoPassivo + precisaoEquips + precisaoTreino +
				forcaDeVontadePassivo + forcaDeVontadeEquips + forcaDeVontadeTreino
			)

			-- Soma dos valores para o total
			local soma = tonumber(sheet[valorBase] or 0) + tonumber(sheet[valorPassivo] or 0) + tonumber(sheet[valorEquips] or 0) + tonumber(sheet[valorTreino] or 0)
			self[valorTotal].text = tostring(soma)
			
			-- Cálculo dos pontos disponíveis
			local nivel = tonumber(sheet.nivel) or 1
			sheet.PontosDisponiveis = tostring(23 + (nivel * 2) - forcaBase - agilidadeBase - vigorBase - combateBase - percepcaoBase - carismaBase - inteligenciaBase - precisaoBase - forcaDeVontadeBase)

			-- Cálculo dos pontos distribuídos
			sheet.PontosDistribuidos = tostring(forcaBase + agilidadeBase + vigorBase + combateBase + percepcaoBase + carismaBase + inteligenciaBase + precisaoBase + forcaDeVontadeBase - 9)
			
			-- Cálculo da defesa
			sheet.Defesa = tostring(math.floor((tonumber(sheet.VigorTotal) or 0) / 2))
			
		end
		
		function CalcularPontosTotais()
			sheet.PontosTotais = (sheet.ForcaTotal or 0) + (sheet.AgilidadeTotal or 0) + (sheet.VigorTotal or 0) + 
								 (sheet.CombateTotal or 0) + (sheet.PercepcaoTotal or 0) + (sheet.CarismaTotal or 0) + 
								 (sheet.InteligenciaTotal or 0) + (sheet.PrecisaoTotal or 0) + (sheet.ForcaDeVontadeTotal or 0)
		end

		function CalcularHpEngHaki()
			sheet.hp = ((sheet.VigorTotal or 0) * 7) + 50 + (5 * (sheet.nivel or 0))
			sheet.eng = ((sheet.VigorTotal or 0) * 7) + 62 + (5 * (sheet.nivel or 0))
			
			if ((sheet.ForcaDeVontadeTotal or 0) >= 20) then 
				sheet.haki = (sheet.ForcaDeVontadeTotal or 0) * 5 
			else 
				sheet.haki = 0 
			end
		end
		
		function RolarAtributo(valor)
			local valorTotal = valor .."Total"
			if (valor == "Forca") then valor = "Força" end
			if (valor == "Precisao") then valor = "Precisão" end
			if (valor == "Percepcao") then valor = "Percepção" end
			if (valor == "Inteligencia") then valor = "Inteligência" end
	
			if (valor == "Rei") then mesas[1].chat:rolarDados("1d20 + " .. sheet.ForcaDeVontadeTotal + sheet.tierConquistador, "Haki do Rei") else
			local mesas = Firecast.getRooms();
			if (valor == "Defesa") then mesas[1].chat:rolarDados("1d20 + " .. sheet.Defesa, "Teste de ".. valor) else
			                            mesas[1].chat:rolarDados("1d20 + " .. sheet[valorTotal], "Teste de ".. valor) end
			end
	end
	


    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.Atributos);
    obj.layout7:setLeft(12);
    obj.layout7:setTop(12);
    obj.layout7:setWidth(4300);
    obj.layout7:setHeight(5250);
    obj.layout7:setName("layout7");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout7);
    obj.rectangle57:setLeft(0);
    obj.rectangle57:setTop(0);
    obj.rectangle57:setWidth(430);
    obj.rectangle57:setHeight(525);
    obj.rectangle57:setColor("#4169E1");
    obj.rectangle57:setName("rectangle57");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout7);
    obj.rectangle58:setLeft(2);
    obj.rectangle58:setTop(2);
    obj.rectangle58:setWidth(426);
    obj.rectangle58:setHeight(521);
    obj.rectangle58:setColor("black");
    obj.rectangle58:setName("rectangle58");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout7);
    obj.label27:setLeft(2);
    obj.label27:setTop(2);
    obj.label27:setWidth(426);
    obj.label27:setHeight(36);
    obj.label27:setText("Atributos");
    obj.label27:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.label27, "fontStyle", "bold underline");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setFontSize(23);
    obj.label27:setName("label27");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout7);
    obj.label28:setLeft(130);
    obj.label28:setTop(54);
    obj.label28:setWidth(45);
    obj.label28:setHeight(20);
    obj.label28:setText("Base");
    obj.label28:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label28, "fontStyle", "bold");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setFontSize(15);
    obj.label28:setName("label28");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout7);
    obj.label29:setLeft(180);
    obj.label29:setTop(54);
    obj.label29:setWidth(65);
    obj.label29:setHeight(20);
    obj.label29:setText("Passivo");
    obj.label29:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label29, "fontStyle", "bold");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setFontSize(15);
    obj.label29:setName("label29");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout7);
    obj.label30:setLeft(240);
    obj.label30:setTop(54);
    obj.label30:setWidth(65);
    obj.label30:setHeight(20);
    obj.label30:setText("Equips");
    obj.label30:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label30, "fontStyle", "bold");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setFontSize(15);
    obj.label30:setName("label30");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout7);
    obj.label31:setLeft(300);
    obj.label31:setTop(54);
    obj.label31:setWidth(65);
    obj.label31:setHeight(20);
    obj.label31:setText("Treino");
    obj.label31:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label31, "fontStyle", "bold");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setFontSize(15);
    obj.label31:setName("label31");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout7);
    obj.label32:setLeft(360);
    obj.label32:setTop(54);
    obj.label32:setWidth(65);
    obj.label32:setHeight(20);
    obj.label32:setText("Total");
    obj.label32:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label32, "fontStyle", "bold");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setFontSize(15);
    obj.label32:setName("label32");

    obj.ForcaButton = GUI.fromHandle(_obj_newObject("button"));
    obj.ForcaButton:setParent(obj.layout7);
    obj.ForcaButton:setName("ForcaButton");
    obj.ForcaButton:setLeft(10);
    obj.ForcaButton:setTop(80);
    obj.ForcaButton:setText("Força");
    obj.ForcaButton:setWidth(110);

    obj.AgilButton = GUI.fromHandle(_obj_newObject("button"));
    obj.AgilButton:setParent(obj.layout7);
    obj.AgilButton:setName("AgilButton");
    obj.AgilButton:setLeft(10);
    obj.AgilButton:setTop(110);
    obj.AgilButton:setText("Agilidade");
    obj.AgilButton:setWidth(110);

    obj.VigorButton = GUI.fromHandle(_obj_newObject("button"));
    obj.VigorButton:setParent(obj.layout7);
    obj.VigorButton:setName("VigorButton");
    obj.VigorButton:setLeft(10);
    obj.VigorButton:setTop(140);
    obj.VigorButton:setText("Vigor");
    obj.VigorButton:setWidth(110);

    obj.ComButton = GUI.fromHandle(_obj_newObject("button"));
    obj.ComButton:setParent(obj.layout7);
    obj.ComButton:setName("ComButton");
    obj.ComButton:setLeft(10);
    obj.ComButton:setTop(170);
    obj.ComButton:setText("Combate");
    obj.ComButton:setWidth(110);

    obj.PercepButton = GUI.fromHandle(_obj_newObject("button"));
    obj.PercepButton:setParent(obj.layout7);
    obj.PercepButton:setName("PercepButton");
    obj.PercepButton:setLeft(10);
    obj.PercepButton:setTop(200);
    obj.PercepButton:setText("Percepção");
    obj.PercepButton:setWidth(110);

    obj.CarisButton = GUI.fromHandle(_obj_newObject("button"));
    obj.CarisButton:setParent(obj.layout7);
    obj.CarisButton:setName("CarisButton");
    obj.CarisButton:setLeft(10);
    obj.CarisButton:setTop(230);
    obj.CarisButton:setText("Carisma");
    obj.CarisButton:setWidth(110);

    obj.IntButton = GUI.fromHandle(_obj_newObject("button"));
    obj.IntButton:setParent(obj.layout7);
    obj.IntButton:setName("IntButton");
    obj.IntButton:setLeft(10);
    obj.IntButton:setTop(260);
    obj.IntButton:setText("Intelegência");
    obj.IntButton:setWidth(110);

    obj.PrecButton = GUI.fromHandle(_obj_newObject("button"));
    obj.PrecButton:setParent(obj.layout7);
    obj.PrecButton:setName("PrecButton");
    obj.PrecButton:setLeft(10);
    obj.PrecButton:setTop(290);
    obj.PrecButton:setText("Precisão");
    obj.PrecButton:setWidth(110);

    obj.ForDVonButton = GUI.fromHandle(_obj_newObject("button"));
    obj.ForDVonButton:setParent(obj.layout7);
    obj.ForDVonButton:setName("ForDVonButton");
    obj.ForDVonButton:setLeft(10);
    obj.ForDVonButton:setTop(320);
    obj.ForDVonButton:setText("Força de Vontade");
    obj.ForDVonButton:setWidth(110);

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout7);
    obj.rectangle59:setLeft(130);
    obj.rectangle59:setTop(79);
    obj.rectangle59:setWidth(45);
    obj.rectangle59:setHeight(24);
    obj.rectangle59:setColor("#F5F5DC");
    obj.rectangle59:setXradius(7);
    obj.rectangle59:setYradius(7);
    obj.rectangle59:setCornerType("round");
    obj.rectangle59:setName("rectangle59");

    obj.ForcaBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForcaBase:setParent(obj.layout7);
    obj.ForcaBase:setField("ForcaBase");
    obj.ForcaBase:setName("ForcaBase");
    obj.ForcaBase:setLeft(130);
    obj.ForcaBase:setTop(79);
    obj.ForcaBase:setWidth(45);
    obj.ForcaBase:setHeight(24);
    obj.ForcaBase:setTransparent(true);
    obj.ForcaBase:setFontColor("black");
    obj.ForcaBase:setFontSize(17);
    obj.ForcaBase:setHorzTextAlign("center");
    obj.ForcaBase:setType("number");
    lfm_setPropAsString(obj.ForcaBase, "fontStyle", "bold");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout7);
    obj.rectangle60:setLeft(130);
    obj.rectangle60:setTop(109);
    obj.rectangle60:setWidth(45);
    obj.rectangle60:setHeight(24);
    obj.rectangle60:setColor("#F5F5DC");
    obj.rectangle60:setXradius(7);
    obj.rectangle60:setYradius(7);
    obj.rectangle60:setCornerType("round");
    obj.rectangle60:setName("rectangle60");

    obj.AgilidadeBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.AgilidadeBase:setParent(obj.layout7);
    obj.AgilidadeBase:setField("AgilidadeBase");
    obj.AgilidadeBase:setName("AgilidadeBase");
    obj.AgilidadeBase:setLeft(130);
    obj.AgilidadeBase:setTop(109);
    obj.AgilidadeBase:setWidth(45);
    obj.AgilidadeBase:setHeight(24);
    obj.AgilidadeBase:setTransparent(true);
    obj.AgilidadeBase:setFontColor("black");
    obj.AgilidadeBase:setFontSize(17);
    obj.AgilidadeBase:setHorzTextAlign("center");
    obj.AgilidadeBase:setType("number");
    lfm_setPropAsString(obj.AgilidadeBase, "fontStyle", "bold");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout7);
    obj.rectangle61:setLeft(130);
    obj.rectangle61:setTop(139);
    obj.rectangle61:setWidth(45);
    obj.rectangle61:setHeight(24);
    obj.rectangle61:setColor("#F5F5DC");
    obj.rectangle61:setXradius(7);
    obj.rectangle61:setYradius(7);
    obj.rectangle61:setCornerType("round");
    obj.rectangle61:setName("rectangle61");

    obj.VigorBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.VigorBase:setParent(obj.layout7);
    obj.VigorBase:setField("VigorBase");
    obj.VigorBase:setName("VigorBase");
    obj.VigorBase:setLeft(130);
    obj.VigorBase:setTop(139);
    obj.VigorBase:setWidth(45);
    obj.VigorBase:setHeight(24);
    obj.VigorBase:setTransparent(true);
    obj.VigorBase:setFontColor("black");
    obj.VigorBase:setFontSize(17);
    obj.VigorBase:setHorzTextAlign("center");
    obj.VigorBase:setType("number");
    lfm_setPropAsString(obj.VigorBase, "fontStyle", "bold");

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout7);
    obj.rectangle62:setLeft(130);
    obj.rectangle62:setTop(169);
    obj.rectangle62:setWidth(45);
    obj.rectangle62:setHeight(24);
    obj.rectangle62:setColor("#F5F5DC");
    obj.rectangle62:setXradius(7);
    obj.rectangle62:setYradius(7);
    obj.rectangle62:setCornerType("round");
    obj.rectangle62:setName("rectangle62");

    obj.CombateBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.CombateBase:setParent(obj.layout7);
    obj.CombateBase:setField("CombateBase");
    obj.CombateBase:setName("CombateBase");
    obj.CombateBase:setLeft(130);
    obj.CombateBase:setTop(169);
    obj.CombateBase:setWidth(45);
    obj.CombateBase:setHeight(24);
    obj.CombateBase:setTransparent(true);
    obj.CombateBase:setFontColor("black");
    obj.CombateBase:setFontSize(17);
    obj.CombateBase:setHorzTextAlign("center");
    obj.CombateBase:setType("number");
    lfm_setPropAsString(obj.CombateBase, "fontStyle", "bold");

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout7);
    obj.rectangle63:setLeft(130);
    obj.rectangle63:setTop(199);
    obj.rectangle63:setWidth(45);
    obj.rectangle63:setHeight(24);
    obj.rectangle63:setColor("#F5F5DC");
    obj.rectangle63:setXradius(7);
    obj.rectangle63:setYradius(7);
    obj.rectangle63:setCornerType("round");
    obj.rectangle63:setName("rectangle63");

    obj.PercepcaoBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.PercepcaoBase:setParent(obj.layout7);
    obj.PercepcaoBase:setField("PercepcaoBase");
    obj.PercepcaoBase:setName("PercepcaoBase");
    obj.PercepcaoBase:setLeft(130);
    obj.PercepcaoBase:setTop(199);
    obj.PercepcaoBase:setWidth(45);
    obj.PercepcaoBase:setHeight(24);
    obj.PercepcaoBase:setTransparent(true);
    obj.PercepcaoBase:setFontColor("black");
    obj.PercepcaoBase:setFontSize(17);
    obj.PercepcaoBase:setHorzTextAlign("center");
    obj.PercepcaoBase:setType("number");
    lfm_setPropAsString(obj.PercepcaoBase, "fontStyle", "bold");

    obj.rectangle64 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout7);
    obj.rectangle64:setLeft(130);
    obj.rectangle64:setTop(229);
    obj.rectangle64:setWidth(45);
    obj.rectangle64:setHeight(24);
    obj.rectangle64:setColor("#F5F5DC");
    obj.rectangle64:setXradius(7);
    obj.rectangle64:setYradius(7);
    obj.rectangle64:setCornerType("round");
    obj.rectangle64:setName("rectangle64");

    obj.CarismaBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.CarismaBase:setParent(obj.layout7);
    obj.CarismaBase:setField("CarismaBase");
    obj.CarismaBase:setName("CarismaBase");
    obj.CarismaBase:setLeft(130);
    obj.CarismaBase:setTop(229);
    obj.CarismaBase:setWidth(45);
    obj.CarismaBase:setHeight(24);
    obj.CarismaBase:setTransparent(true);
    obj.CarismaBase:setFontColor("black");
    obj.CarismaBase:setFontSize(17);
    obj.CarismaBase:setHorzTextAlign("center");
    obj.CarismaBase:setType("number");
    lfm_setPropAsString(obj.CarismaBase, "fontStyle", "bold");

    obj.rectangle65 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout7);
    obj.rectangle65:setLeft(130);
    obj.rectangle65:setTop(259);
    obj.rectangle65:setWidth(45);
    obj.rectangle65:setHeight(24);
    obj.rectangle65:setColor("#F5F5DC");
    obj.rectangle65:setXradius(7);
    obj.rectangle65:setYradius(7);
    obj.rectangle65:setCornerType("round");
    obj.rectangle65:setName("rectangle65");

    obj.InteligenciaBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.InteligenciaBase:setParent(obj.layout7);
    obj.InteligenciaBase:setField("InteligenciaBase");
    obj.InteligenciaBase:setName("InteligenciaBase");
    obj.InteligenciaBase:setLeft(130);
    obj.InteligenciaBase:setTop(259);
    obj.InteligenciaBase:setWidth(45);
    obj.InteligenciaBase:setHeight(24);
    obj.InteligenciaBase:setTransparent(true);
    obj.InteligenciaBase:setFontColor("black");
    obj.InteligenciaBase:setFontSize(17);
    obj.InteligenciaBase:setHorzTextAlign("center");
    obj.InteligenciaBase:setType("number");
    lfm_setPropAsString(obj.InteligenciaBase, "fontStyle", "bold");

    obj.rectangle66 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout7);
    obj.rectangle66:setLeft(130);
    obj.rectangle66:setTop(289);
    obj.rectangle66:setWidth(45);
    obj.rectangle66:setHeight(24);
    obj.rectangle66:setColor("#F5F5DC");
    obj.rectangle66:setXradius(7);
    obj.rectangle66:setYradius(7);
    obj.rectangle66:setCornerType("round");
    obj.rectangle66:setName("rectangle66");

    obj.PrecisaoBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.PrecisaoBase:setParent(obj.layout7);
    obj.PrecisaoBase:setField("PrecisaoBase");
    obj.PrecisaoBase:setName("PrecisaoBase");
    obj.PrecisaoBase:setLeft(130);
    obj.PrecisaoBase:setTop(289);
    obj.PrecisaoBase:setWidth(45);
    obj.PrecisaoBase:setHeight(24);
    obj.PrecisaoBase:setTransparent(true);
    obj.PrecisaoBase:setFontColor("black");
    obj.PrecisaoBase:setFontSize(17);
    obj.PrecisaoBase:setHorzTextAlign("center");
    obj.PrecisaoBase:setType("number");
    lfm_setPropAsString(obj.PrecisaoBase, "fontStyle", "bold");

    obj.rectangle67 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout7);
    obj.rectangle67:setLeft(130);
    obj.rectangle67:setTop(319);
    obj.rectangle67:setWidth(45);
    obj.rectangle67:setHeight(24);
    obj.rectangle67:setColor("#F5F5DC");
    obj.rectangle67:setXradius(7);
    obj.rectangle67:setYradius(7);
    obj.rectangle67:setCornerType("round");
    obj.rectangle67:setName("rectangle67");

    obj.ForcaDeVontadeBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForcaDeVontadeBase:setParent(obj.layout7);
    obj.ForcaDeVontadeBase:setField("ForcaDeVontadeBase");
    obj.ForcaDeVontadeBase:setName("ForcaDeVontadeBase");
    obj.ForcaDeVontadeBase:setLeft(130);
    obj.ForcaDeVontadeBase:setTop(319);
    obj.ForcaDeVontadeBase:setWidth(45);
    obj.ForcaDeVontadeBase:setHeight(24);
    obj.ForcaDeVontadeBase:setTransparent(true);
    obj.ForcaDeVontadeBase:setFontColor("black");
    obj.ForcaDeVontadeBase:setFontSize(17);
    obj.ForcaDeVontadeBase:setHorzTextAlign("center");
    obj.ForcaDeVontadeBase:setType("number");
    lfm_setPropAsString(obj.ForcaDeVontadeBase, "fontStyle", "bold");

    obj.rectangle68 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout7);
    obj.rectangle68:setLeft(190);
    obj.rectangle68:setTop(79);
    obj.rectangle68:setWidth(45);
    obj.rectangle68:setHeight(24);
    obj.rectangle68:setColor("#F5F5DC");
    obj.rectangle68:setXradius(7);
    obj.rectangle68:setYradius(7);
    obj.rectangle68:setCornerType("round");
    obj.rectangle68:setName("rectangle68");

    obj.ForcaPassivo = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForcaPassivo:setParent(obj.layout7);
    obj.ForcaPassivo:setField("ForcaPassivo");
    obj.ForcaPassivo:setName("ForcaPassivo");
    obj.ForcaPassivo:setLeft(190);
    obj.ForcaPassivo:setTop(79);
    obj.ForcaPassivo:setWidth(45);
    obj.ForcaPassivo:setHeight(24);
    obj.ForcaPassivo:setTransparent(true);
    obj.ForcaPassivo:setFontColor("black");
    obj.ForcaPassivo:setFontSize(17);
    obj.ForcaPassivo:setHorzTextAlign("center");
    obj.ForcaPassivo:setType("number");
    lfm_setPropAsString(obj.ForcaPassivo, "fontStyle", "bold");

    obj.rectangle69 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout7);
    obj.rectangle69:setLeft(190);
    obj.rectangle69:setTop(109);
    obj.rectangle69:setWidth(45);
    obj.rectangle69:setHeight(24);
    obj.rectangle69:setColor("#F5F5DC");
    obj.rectangle69:setXradius(7);
    obj.rectangle69:setYradius(7);
    obj.rectangle69:setCornerType("round");
    obj.rectangle69:setName("rectangle69");

    obj.AgilidadePassivo = GUI.fromHandle(_obj_newObject("edit"));
    obj.AgilidadePassivo:setParent(obj.layout7);
    obj.AgilidadePassivo:setField("AgilidadePassivo");
    obj.AgilidadePassivo:setName("AgilidadePassivo");
    obj.AgilidadePassivo:setLeft(190);
    obj.AgilidadePassivo:setTop(109);
    obj.AgilidadePassivo:setWidth(45);
    obj.AgilidadePassivo:setHeight(24);
    obj.AgilidadePassivo:setTransparent(true);
    obj.AgilidadePassivo:setFontColor("black");
    obj.AgilidadePassivo:setFontSize(17);
    obj.AgilidadePassivo:setHorzTextAlign("center");
    obj.AgilidadePassivo:setType("number");
    lfm_setPropAsString(obj.AgilidadePassivo, "fontStyle", "bold");

    obj.rectangle70 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout7);
    obj.rectangle70:setLeft(190);
    obj.rectangle70:setTop(139);
    obj.rectangle70:setWidth(45);
    obj.rectangle70:setHeight(24);
    obj.rectangle70:setColor("#F5F5DC");
    obj.rectangle70:setXradius(7);
    obj.rectangle70:setYradius(7);
    obj.rectangle70:setCornerType("round");
    obj.rectangle70:setName("rectangle70");

    obj.VigorPassivo = GUI.fromHandle(_obj_newObject("edit"));
    obj.VigorPassivo:setParent(obj.layout7);
    obj.VigorPassivo:setField("VigorPassivo");
    obj.VigorPassivo:setName("VigorPassivo");
    obj.VigorPassivo:setLeft(190);
    obj.VigorPassivo:setTop(139);
    obj.VigorPassivo:setWidth(45);
    obj.VigorPassivo:setHeight(24);
    obj.VigorPassivo:setTransparent(true);
    obj.VigorPassivo:setFontColor("black");
    obj.VigorPassivo:setFontSize(17);
    obj.VigorPassivo:setHorzTextAlign("center");
    obj.VigorPassivo:setType("number");
    lfm_setPropAsString(obj.VigorPassivo, "fontStyle", "bold");

    obj.rectangle71 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout7);
    obj.rectangle71:setLeft(190);
    obj.rectangle71:setTop(169);
    obj.rectangle71:setWidth(45);
    obj.rectangle71:setHeight(24);
    obj.rectangle71:setColor("#F5F5DC");
    obj.rectangle71:setXradius(7);
    obj.rectangle71:setYradius(7);
    obj.rectangle71:setCornerType("round");
    obj.rectangle71:setName("rectangle71");

    obj.CombatePassivo = GUI.fromHandle(_obj_newObject("edit"));
    obj.CombatePassivo:setParent(obj.layout7);
    obj.CombatePassivo:setField("CombatePassivo");
    obj.CombatePassivo:setName("CombatePassivo");
    obj.CombatePassivo:setLeft(190);
    obj.CombatePassivo:setTop(169);
    obj.CombatePassivo:setWidth(45);
    obj.CombatePassivo:setHeight(24);
    obj.CombatePassivo:setTransparent(true);
    obj.CombatePassivo:setFontColor("black");
    obj.CombatePassivo:setFontSize(17);
    obj.CombatePassivo:setHorzTextAlign("center");
    obj.CombatePassivo:setType("number");
    lfm_setPropAsString(obj.CombatePassivo, "fontStyle", "bold");

    obj.rectangle72 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout7);
    obj.rectangle72:setLeft(190);
    obj.rectangle72:setTop(199);
    obj.rectangle72:setWidth(45);
    obj.rectangle72:setHeight(24);
    obj.rectangle72:setColor("#F5F5DC");
    obj.rectangle72:setXradius(7);
    obj.rectangle72:setYradius(7);
    obj.rectangle72:setCornerType("round");
    obj.rectangle72:setName("rectangle72");

    obj.PercepcaoPassivo = GUI.fromHandle(_obj_newObject("edit"));
    obj.PercepcaoPassivo:setParent(obj.layout7);
    obj.PercepcaoPassivo:setField("PercepcaoPassivo");
    obj.PercepcaoPassivo:setName("PercepcaoPassivo");
    obj.PercepcaoPassivo:setLeft(190);
    obj.PercepcaoPassivo:setTop(199);
    obj.PercepcaoPassivo:setWidth(45);
    obj.PercepcaoPassivo:setHeight(24);
    obj.PercepcaoPassivo:setTransparent(true);
    obj.PercepcaoPassivo:setFontColor("black");
    obj.PercepcaoPassivo:setFontSize(17);
    obj.PercepcaoPassivo:setHorzTextAlign("center");
    obj.PercepcaoPassivo:setType("number");
    lfm_setPropAsString(obj.PercepcaoPassivo, "fontStyle", "bold");

    obj.rectangle73 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout7);
    obj.rectangle73:setLeft(190);
    obj.rectangle73:setTop(229);
    obj.rectangle73:setWidth(45);
    obj.rectangle73:setHeight(24);
    obj.rectangle73:setColor("#F5F5DC");
    obj.rectangle73:setXradius(7);
    obj.rectangle73:setYradius(7);
    obj.rectangle73:setCornerType("round");
    obj.rectangle73:setName("rectangle73");

    obj.CarismaPassivo = GUI.fromHandle(_obj_newObject("edit"));
    obj.CarismaPassivo:setParent(obj.layout7);
    obj.CarismaPassivo:setField("CarismaPassivo");
    obj.CarismaPassivo:setName("CarismaPassivo");
    obj.CarismaPassivo:setLeft(190);
    obj.CarismaPassivo:setTop(229);
    obj.CarismaPassivo:setWidth(45);
    obj.CarismaPassivo:setHeight(24);
    obj.CarismaPassivo:setTransparent(true);
    obj.CarismaPassivo:setFontColor("black");
    obj.CarismaPassivo:setFontSize(17);
    obj.CarismaPassivo:setHorzTextAlign("center");
    obj.CarismaPassivo:setType("number");
    lfm_setPropAsString(obj.CarismaPassivo, "fontStyle", "bold");

    obj.rectangle74 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout7);
    obj.rectangle74:setLeft(190);
    obj.rectangle74:setTop(259);
    obj.rectangle74:setWidth(45);
    obj.rectangle74:setHeight(24);
    obj.rectangle74:setColor("#F5F5DC");
    obj.rectangle74:setXradius(7);
    obj.rectangle74:setYradius(7);
    obj.rectangle74:setCornerType("round");
    obj.rectangle74:setName("rectangle74");

    obj.InteligenciaPassivo = GUI.fromHandle(_obj_newObject("edit"));
    obj.InteligenciaPassivo:setParent(obj.layout7);
    obj.InteligenciaPassivo:setField("InteligenciaPassivo");
    obj.InteligenciaPassivo:setName("InteligenciaPassivo");
    obj.InteligenciaPassivo:setLeft(190);
    obj.InteligenciaPassivo:setTop(259);
    obj.InteligenciaPassivo:setWidth(45);
    obj.InteligenciaPassivo:setHeight(24);
    obj.InteligenciaPassivo:setTransparent(true);
    obj.InteligenciaPassivo:setFontColor("black");
    obj.InteligenciaPassivo:setFontSize(17);
    obj.InteligenciaPassivo:setHorzTextAlign("center");
    obj.InteligenciaPassivo:setType("number");
    lfm_setPropAsString(obj.InteligenciaPassivo, "fontStyle", "bold");

    obj.rectangle75 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout7);
    obj.rectangle75:setLeft(190);
    obj.rectangle75:setTop(289);
    obj.rectangle75:setWidth(45);
    obj.rectangle75:setHeight(24);
    obj.rectangle75:setColor("#F5F5DC");
    obj.rectangle75:setXradius(7);
    obj.rectangle75:setYradius(7);
    obj.rectangle75:setCornerType("round");
    obj.rectangle75:setName("rectangle75");

    obj.PrecisaoPassivo = GUI.fromHandle(_obj_newObject("edit"));
    obj.PrecisaoPassivo:setParent(obj.layout7);
    obj.PrecisaoPassivo:setField("PrecisaoPassivo");
    obj.PrecisaoPassivo:setName("PrecisaoPassivo");
    obj.PrecisaoPassivo:setLeft(190);
    obj.PrecisaoPassivo:setTop(289);
    obj.PrecisaoPassivo:setWidth(45);
    obj.PrecisaoPassivo:setHeight(24);
    obj.PrecisaoPassivo:setTransparent(true);
    obj.PrecisaoPassivo:setFontColor("black");
    obj.PrecisaoPassivo:setFontSize(17);
    obj.PrecisaoPassivo:setHorzTextAlign("center");
    obj.PrecisaoPassivo:setType("number");
    lfm_setPropAsString(obj.PrecisaoPassivo, "fontStyle", "bold");

    obj.rectangle76 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout7);
    obj.rectangle76:setLeft(190);
    obj.rectangle76:setTop(319);
    obj.rectangle76:setWidth(45);
    obj.rectangle76:setHeight(24);
    obj.rectangle76:setColor("#F5F5DC");
    obj.rectangle76:setXradius(7);
    obj.rectangle76:setYradius(7);
    obj.rectangle76:setCornerType("round");
    obj.rectangle76:setName("rectangle76");

    obj.ForcaDeVontadePassivo = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForcaDeVontadePassivo:setParent(obj.layout7);
    obj.ForcaDeVontadePassivo:setField("ForcaDeVontadePassivo");
    obj.ForcaDeVontadePassivo:setName("ForcaDeVontadePassivo");
    obj.ForcaDeVontadePassivo:setLeft(190);
    obj.ForcaDeVontadePassivo:setTop(319);
    obj.ForcaDeVontadePassivo:setWidth(45);
    obj.ForcaDeVontadePassivo:setHeight(24);
    obj.ForcaDeVontadePassivo:setTransparent(true);
    obj.ForcaDeVontadePassivo:setFontColor("black");
    obj.ForcaDeVontadePassivo:setFontSize(17);
    obj.ForcaDeVontadePassivo:setHorzTextAlign("center");
    obj.ForcaDeVontadePassivo:setType("number");
    lfm_setPropAsString(obj.ForcaDeVontadePassivo, "fontStyle", "bold");

    obj.rectangle77 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout7);
    obj.rectangle77:setLeft(250);
    obj.rectangle77:setTop(79);
    obj.rectangle77:setWidth(45);
    obj.rectangle77:setHeight(24);
    obj.rectangle77:setColor("#F5F5DC");
    obj.rectangle77:setXradius(7);
    obj.rectangle77:setYradius(7);
    obj.rectangle77:setCornerType("round");
    obj.rectangle77:setName("rectangle77");

    obj.ForcaEquips = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForcaEquips:setParent(obj.layout7);
    obj.ForcaEquips:setField("ForcaEquips");
    obj.ForcaEquips:setName("ForcaEquips");
    obj.ForcaEquips:setLeft(250);
    obj.ForcaEquips:setTop(79);
    obj.ForcaEquips:setWidth(45);
    obj.ForcaEquips:setHeight(24);
    obj.ForcaEquips:setTransparent(true);
    obj.ForcaEquips:setFontColor("black");
    obj.ForcaEquips:setFontSize(17);
    obj.ForcaEquips:setHorzTextAlign("center");
    obj.ForcaEquips:setType("number");
    lfm_setPropAsString(obj.ForcaEquips, "fontStyle", "bold");

    obj.rectangle78 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.layout7);
    obj.rectangle78:setLeft(250);
    obj.rectangle78:setTop(109);
    obj.rectangle78:setWidth(45);
    obj.rectangle78:setHeight(24);
    obj.rectangle78:setColor("#F5F5DC");
    obj.rectangle78:setXradius(7);
    obj.rectangle78:setYradius(7);
    obj.rectangle78:setCornerType("round");
    obj.rectangle78:setName("rectangle78");

    obj.AgilidadeEquips = GUI.fromHandle(_obj_newObject("edit"));
    obj.AgilidadeEquips:setParent(obj.layout7);
    obj.AgilidadeEquips:setField("AgilidadeEquips");
    obj.AgilidadeEquips:setName("AgilidadeEquips");
    obj.AgilidadeEquips:setLeft(250);
    obj.AgilidadeEquips:setTop(109);
    obj.AgilidadeEquips:setWidth(45);
    obj.AgilidadeEquips:setHeight(24);
    obj.AgilidadeEquips:setTransparent(true);
    obj.AgilidadeEquips:setFontColor("black");
    obj.AgilidadeEquips:setFontSize(17);
    obj.AgilidadeEquips:setHorzTextAlign("center");
    obj.AgilidadeEquips:setType("number");
    lfm_setPropAsString(obj.AgilidadeEquips, "fontStyle", "bold");

    obj.rectangle79 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout7);
    obj.rectangle79:setLeft(250);
    obj.rectangle79:setTop(139);
    obj.rectangle79:setWidth(45);
    obj.rectangle79:setHeight(24);
    obj.rectangle79:setColor("#F5F5DC");
    obj.rectangle79:setXradius(7);
    obj.rectangle79:setYradius(7);
    obj.rectangle79:setCornerType("round");
    obj.rectangle79:setName("rectangle79");

    obj.VigorEquips = GUI.fromHandle(_obj_newObject("edit"));
    obj.VigorEquips:setParent(obj.layout7);
    obj.VigorEquips:setField("VigorEquips");
    obj.VigorEquips:setName("VigorEquips");
    obj.VigorEquips:setLeft(250);
    obj.VigorEquips:setTop(139);
    obj.VigorEquips:setWidth(45);
    obj.VigorEquips:setHeight(24);
    obj.VigorEquips:setTransparent(true);
    obj.VigorEquips:setFontColor("black");
    obj.VigorEquips:setFontSize(17);
    obj.VigorEquips:setHorzTextAlign("center");
    obj.VigorEquips:setType("number");
    lfm_setPropAsString(obj.VigorEquips, "fontStyle", "bold");

    obj.rectangle80 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.layout7);
    obj.rectangle80:setLeft(250);
    obj.rectangle80:setTop(169);
    obj.rectangle80:setWidth(45);
    obj.rectangle80:setHeight(24);
    obj.rectangle80:setColor("#F5F5DC");
    obj.rectangle80:setXradius(7);
    obj.rectangle80:setYradius(7);
    obj.rectangle80:setCornerType("round");
    obj.rectangle80:setName("rectangle80");

    obj.CombateEquips = GUI.fromHandle(_obj_newObject("edit"));
    obj.CombateEquips:setParent(obj.layout7);
    obj.CombateEquips:setField("CombateEquips");
    obj.CombateEquips:setName("CombateEquips");
    obj.CombateEquips:setLeft(250);
    obj.CombateEquips:setTop(169);
    obj.CombateEquips:setWidth(45);
    obj.CombateEquips:setHeight(24);
    obj.CombateEquips:setTransparent(true);
    obj.CombateEquips:setFontColor("black");
    obj.CombateEquips:setFontSize(17);
    obj.CombateEquips:setHorzTextAlign("center");
    obj.CombateEquips:setType("number");
    lfm_setPropAsString(obj.CombateEquips, "fontStyle", "bold");

    obj.rectangle81 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.layout7);
    obj.rectangle81:setLeft(250);
    obj.rectangle81:setTop(199);
    obj.rectangle81:setWidth(45);
    obj.rectangle81:setHeight(24);
    obj.rectangle81:setColor("#F5F5DC");
    obj.rectangle81:setXradius(7);
    obj.rectangle81:setYradius(7);
    obj.rectangle81:setCornerType("round");
    obj.rectangle81:setName("rectangle81");

    obj.PercepcaoEquips = GUI.fromHandle(_obj_newObject("edit"));
    obj.PercepcaoEquips:setParent(obj.layout7);
    obj.PercepcaoEquips:setField("PercepcaoEquips");
    obj.PercepcaoEquips:setName("PercepcaoEquips");
    obj.PercepcaoEquips:setLeft(250);
    obj.PercepcaoEquips:setTop(199);
    obj.PercepcaoEquips:setWidth(45);
    obj.PercepcaoEquips:setHeight(24);
    obj.PercepcaoEquips:setTransparent(true);
    obj.PercepcaoEquips:setFontColor("black");
    obj.PercepcaoEquips:setFontSize(17);
    obj.PercepcaoEquips:setHorzTextAlign("center");
    obj.PercepcaoEquips:setType("number");
    lfm_setPropAsString(obj.PercepcaoEquips, "fontStyle", "bold");

    obj.rectangle82 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.layout7);
    obj.rectangle82:setLeft(250);
    obj.rectangle82:setTop(229);
    obj.rectangle82:setWidth(45);
    obj.rectangle82:setHeight(24);
    obj.rectangle82:setColor("#F5F5DC");
    obj.rectangle82:setXradius(7);
    obj.rectangle82:setYradius(7);
    obj.rectangle82:setCornerType("round");
    obj.rectangle82:setName("rectangle82");

    obj.CarismaEquips = GUI.fromHandle(_obj_newObject("edit"));
    obj.CarismaEquips:setParent(obj.layout7);
    obj.CarismaEquips:setField("CarismaEquips");
    obj.CarismaEquips:setName("CarismaEquips");
    obj.CarismaEquips:setLeft(250);
    obj.CarismaEquips:setTop(229);
    obj.CarismaEquips:setWidth(45);
    obj.CarismaEquips:setHeight(24);
    obj.CarismaEquips:setTransparent(true);
    obj.CarismaEquips:setFontColor("black");
    obj.CarismaEquips:setFontSize(17);
    obj.CarismaEquips:setHorzTextAlign("center");
    obj.CarismaEquips:setType("number");
    lfm_setPropAsString(obj.CarismaEquips, "fontStyle", "bold");

    obj.rectangle83 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.layout7);
    obj.rectangle83:setLeft(250);
    obj.rectangle83:setTop(259);
    obj.rectangle83:setWidth(45);
    obj.rectangle83:setHeight(24);
    obj.rectangle83:setColor("#F5F5DC");
    obj.rectangle83:setXradius(7);
    obj.rectangle83:setYradius(7);
    obj.rectangle83:setCornerType("round");
    obj.rectangle83:setName("rectangle83");

    obj.InteligenciaEquips = GUI.fromHandle(_obj_newObject("edit"));
    obj.InteligenciaEquips:setParent(obj.layout7);
    obj.InteligenciaEquips:setField("InteligenciaEquips");
    obj.InteligenciaEquips:setName("InteligenciaEquips");
    obj.InteligenciaEquips:setLeft(250);
    obj.InteligenciaEquips:setTop(259);
    obj.InteligenciaEquips:setWidth(45);
    obj.InteligenciaEquips:setHeight(24);
    obj.InteligenciaEquips:setTransparent(true);
    obj.InteligenciaEquips:setFontColor("black");
    obj.InteligenciaEquips:setFontSize(17);
    obj.InteligenciaEquips:setHorzTextAlign("center");
    obj.InteligenciaEquips:setType("number");
    lfm_setPropAsString(obj.InteligenciaEquips, "fontStyle", "bold");

    obj.rectangle84 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.layout7);
    obj.rectangle84:setLeft(250);
    obj.rectangle84:setTop(289);
    obj.rectangle84:setWidth(45);
    obj.rectangle84:setHeight(24);
    obj.rectangle84:setColor("#F5F5DC");
    obj.rectangle84:setXradius(7);
    obj.rectangle84:setYradius(7);
    obj.rectangle84:setCornerType("round");
    obj.rectangle84:setName("rectangle84");

    obj.PrecisaoEquips = GUI.fromHandle(_obj_newObject("edit"));
    obj.PrecisaoEquips:setParent(obj.layout7);
    obj.PrecisaoEquips:setField("PrecisaoEquips");
    obj.PrecisaoEquips:setName("PrecisaoEquips");
    obj.PrecisaoEquips:setLeft(250);
    obj.PrecisaoEquips:setTop(289);
    obj.PrecisaoEquips:setWidth(45);
    obj.PrecisaoEquips:setHeight(24);
    obj.PrecisaoEquips:setTransparent(true);
    obj.PrecisaoEquips:setFontColor("black");
    obj.PrecisaoEquips:setFontSize(17);
    obj.PrecisaoEquips:setHorzTextAlign("center");
    obj.PrecisaoEquips:setType("number");
    lfm_setPropAsString(obj.PrecisaoEquips, "fontStyle", "bold");

    obj.rectangle85 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.layout7);
    obj.rectangle85:setLeft(250);
    obj.rectangle85:setTop(319);
    obj.rectangle85:setWidth(45);
    obj.rectangle85:setHeight(24);
    obj.rectangle85:setColor("#F5F5DC");
    obj.rectangle85:setXradius(7);
    obj.rectangle85:setYradius(7);
    obj.rectangle85:setCornerType("round");
    obj.rectangle85:setName("rectangle85");

    obj.ForcaDeVontadeEquips = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForcaDeVontadeEquips:setParent(obj.layout7);
    obj.ForcaDeVontadeEquips:setField("ForcaDeVontadeEquips");
    obj.ForcaDeVontadeEquips:setName("ForcaDeVontadeEquips");
    obj.ForcaDeVontadeEquips:setLeft(250);
    obj.ForcaDeVontadeEquips:setTop(319);
    obj.ForcaDeVontadeEquips:setWidth(45);
    obj.ForcaDeVontadeEquips:setHeight(24);
    obj.ForcaDeVontadeEquips:setTransparent(true);
    obj.ForcaDeVontadeEquips:setFontColor("black");
    obj.ForcaDeVontadeEquips:setFontSize(17);
    obj.ForcaDeVontadeEquips:setHorzTextAlign("center");
    obj.ForcaDeVontadeEquips:setType("number");
    lfm_setPropAsString(obj.ForcaDeVontadeEquips, "fontStyle", "bold");

    obj.rectangle86 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout7);
    obj.rectangle86:setLeft(310);
    obj.rectangle86:setTop(79);
    obj.rectangle86:setWidth(45);
    obj.rectangle86:setHeight(24);
    obj.rectangle86:setColor("#F5F5DC");
    obj.rectangle86:setXradius(7);
    obj.rectangle86:setYradius(7);
    obj.rectangle86:setCornerType("round");
    obj.rectangle86:setName("rectangle86");

    obj.ForcaTreino = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForcaTreino:setParent(obj.layout7);
    obj.ForcaTreino:setField("ForcaTreino");
    obj.ForcaTreino:setName("ForcaTreino");
    obj.ForcaTreino:setLeft(310);
    obj.ForcaTreino:setTop(79);
    obj.ForcaTreino:setWidth(45);
    obj.ForcaTreino:setHeight(24);
    obj.ForcaTreino:setTransparent(true);
    obj.ForcaTreino:setFontColor("black");
    obj.ForcaTreino:setFontSize(17);
    obj.ForcaTreino:setHorzTextAlign("center");
    obj.ForcaTreino:setType("number");
    lfm_setPropAsString(obj.ForcaTreino, "fontStyle", "bold");

    obj.rectangle87 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.layout7);
    obj.rectangle87:setLeft(310);
    obj.rectangle87:setTop(109);
    obj.rectangle87:setWidth(45);
    obj.rectangle87:setHeight(24);
    obj.rectangle87:setColor("#F5F5DC");
    obj.rectangle87:setXradius(7);
    obj.rectangle87:setYradius(7);
    obj.rectangle87:setCornerType("round");
    obj.rectangle87:setName("rectangle87");

    obj.AgilidadeTreino = GUI.fromHandle(_obj_newObject("edit"));
    obj.AgilidadeTreino:setParent(obj.layout7);
    obj.AgilidadeTreino:setField("AgilidadeTreino");
    obj.AgilidadeTreino:setName("AgilidadeTreino");
    obj.AgilidadeTreino:setLeft(310);
    obj.AgilidadeTreino:setTop(109);
    obj.AgilidadeTreino:setWidth(45);
    obj.AgilidadeTreino:setHeight(24);
    obj.AgilidadeTreino:setTransparent(true);
    obj.AgilidadeTreino:setFontColor("black");
    obj.AgilidadeTreino:setFontSize(17);
    obj.AgilidadeTreino:setHorzTextAlign("center");
    obj.AgilidadeTreino:setType("number");
    lfm_setPropAsString(obj.AgilidadeTreino, "fontStyle", "bold");

    obj.rectangle88 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout7);
    obj.rectangle88:setLeft(310);
    obj.rectangle88:setTop(139);
    obj.rectangle88:setWidth(45);
    obj.rectangle88:setHeight(24);
    obj.rectangle88:setColor("#F5F5DC");
    obj.rectangle88:setXradius(7);
    obj.rectangle88:setYradius(7);
    obj.rectangle88:setCornerType("round");
    obj.rectangle88:setName("rectangle88");

    obj.VigorTreino = GUI.fromHandle(_obj_newObject("edit"));
    obj.VigorTreino:setParent(obj.layout7);
    obj.VigorTreino:setField("VigorTreino");
    obj.VigorTreino:setName("VigorTreino");
    obj.VigorTreino:setLeft(310);
    obj.VigorTreino:setTop(139);
    obj.VigorTreino:setWidth(45);
    obj.VigorTreino:setHeight(24);
    obj.VigorTreino:setTransparent(true);
    obj.VigorTreino:setFontColor("black");
    obj.VigorTreino:setFontSize(17);
    obj.VigorTreino:setHorzTextAlign("center");
    obj.VigorTreino:setType("number");
    lfm_setPropAsString(obj.VigorTreino, "fontStyle", "bold");

    obj.rectangle89 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.layout7);
    obj.rectangle89:setLeft(310);
    obj.rectangle89:setTop(169);
    obj.rectangle89:setWidth(45);
    obj.rectangle89:setHeight(24);
    obj.rectangle89:setColor("#F5F5DC");
    obj.rectangle89:setXradius(7);
    obj.rectangle89:setYradius(7);
    obj.rectangle89:setCornerType("round");
    obj.rectangle89:setName("rectangle89");

    obj.CombateTreino = GUI.fromHandle(_obj_newObject("edit"));
    obj.CombateTreino:setParent(obj.layout7);
    obj.CombateTreino:setField("CombateTreino");
    obj.CombateTreino:setName("CombateTreino");
    obj.CombateTreino:setLeft(310);
    obj.CombateTreino:setTop(169);
    obj.CombateTreino:setWidth(45);
    obj.CombateTreino:setHeight(24);
    obj.CombateTreino:setTransparent(true);
    obj.CombateTreino:setFontColor("black");
    obj.CombateTreino:setFontSize(17);
    obj.CombateTreino:setHorzTextAlign("center");
    obj.CombateTreino:setType("number");
    lfm_setPropAsString(obj.CombateTreino, "fontStyle", "bold");

    obj.rectangle90 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.layout7);
    obj.rectangle90:setLeft(310);
    obj.rectangle90:setTop(199);
    obj.rectangle90:setWidth(45);
    obj.rectangle90:setHeight(24);
    obj.rectangle90:setColor("#F5F5DC");
    obj.rectangle90:setXradius(7);
    obj.rectangle90:setYradius(7);
    obj.rectangle90:setCornerType("round");
    obj.rectangle90:setName("rectangle90");

    obj.PercepcaoTreino = GUI.fromHandle(_obj_newObject("edit"));
    obj.PercepcaoTreino:setParent(obj.layout7);
    obj.PercepcaoTreino:setField("PercepcaoTreino");
    obj.PercepcaoTreino:setName("PercepcaoTreino");
    obj.PercepcaoTreino:setLeft(310);
    obj.PercepcaoTreino:setTop(199);
    obj.PercepcaoTreino:setWidth(45);
    obj.PercepcaoTreino:setHeight(24);
    obj.PercepcaoTreino:setTransparent(true);
    obj.PercepcaoTreino:setFontColor("black");
    obj.PercepcaoTreino:setFontSize(17);
    obj.PercepcaoTreino:setHorzTextAlign("center");
    obj.PercepcaoTreino:setType("number");
    lfm_setPropAsString(obj.PercepcaoTreino, "fontStyle", "bold");

    obj.rectangle91 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.layout7);
    obj.rectangle91:setLeft(310);
    obj.rectangle91:setTop(229);
    obj.rectangle91:setWidth(45);
    obj.rectangle91:setHeight(24);
    obj.rectangle91:setColor("#F5F5DC");
    obj.rectangle91:setXradius(7);
    obj.rectangle91:setYradius(7);
    obj.rectangle91:setCornerType("round");
    obj.rectangle91:setName("rectangle91");

    obj.CarismaTreino = GUI.fromHandle(_obj_newObject("edit"));
    obj.CarismaTreino:setParent(obj.layout7);
    obj.CarismaTreino:setField("CarismaTreino");
    obj.CarismaTreino:setName("CarismaTreino");
    obj.CarismaTreino:setLeft(310);
    obj.CarismaTreino:setTop(229);
    obj.CarismaTreino:setWidth(45);
    obj.CarismaTreino:setHeight(24);
    obj.CarismaTreino:setTransparent(true);
    obj.CarismaTreino:setFontColor("black");
    obj.CarismaTreino:setFontSize(17);
    obj.CarismaTreino:setHorzTextAlign("center");
    obj.CarismaTreino:setType("number");
    lfm_setPropAsString(obj.CarismaTreino, "fontStyle", "bold");

    obj.rectangle92 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.layout7);
    obj.rectangle92:setLeft(310);
    obj.rectangle92:setTop(259);
    obj.rectangle92:setWidth(45);
    obj.rectangle92:setHeight(24);
    obj.rectangle92:setColor("#F5F5DC");
    obj.rectangle92:setXradius(7);
    obj.rectangle92:setYradius(7);
    obj.rectangle92:setCornerType("round");
    obj.rectangle92:setName("rectangle92");

    obj.InteligenciaTreino = GUI.fromHandle(_obj_newObject("edit"));
    obj.InteligenciaTreino:setParent(obj.layout7);
    obj.InteligenciaTreino:setField("InteligenciaTreino");
    obj.InteligenciaTreino:setName("InteligenciaTreino");
    obj.InteligenciaTreino:setLeft(310);
    obj.InteligenciaTreino:setTop(259);
    obj.InteligenciaTreino:setWidth(45);
    obj.InteligenciaTreino:setHeight(24);
    obj.InteligenciaTreino:setTransparent(true);
    obj.InteligenciaTreino:setFontColor("black");
    obj.InteligenciaTreino:setFontSize(17);
    obj.InteligenciaTreino:setHorzTextAlign("center");
    obj.InteligenciaTreino:setType("number");
    lfm_setPropAsString(obj.InteligenciaTreino, "fontStyle", "bold");

    obj.rectangle93 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle93:setParent(obj.layout7);
    obj.rectangle93:setLeft(310);
    obj.rectangle93:setTop(289);
    obj.rectangle93:setWidth(45);
    obj.rectangle93:setHeight(24);
    obj.rectangle93:setColor("#F5F5DC");
    obj.rectangle93:setXradius(7);
    obj.rectangle93:setYradius(7);
    obj.rectangle93:setCornerType("round");
    obj.rectangle93:setName("rectangle93");

    obj.PrecisaoTreino = GUI.fromHandle(_obj_newObject("edit"));
    obj.PrecisaoTreino:setParent(obj.layout7);
    obj.PrecisaoTreino:setField("PrecisaoTreino");
    obj.PrecisaoTreino:setName("PrecisaoTreino");
    obj.PrecisaoTreino:setLeft(310);
    obj.PrecisaoTreino:setTop(289);
    obj.PrecisaoTreino:setWidth(45);
    obj.PrecisaoTreino:setHeight(24);
    obj.PrecisaoTreino:setTransparent(true);
    obj.PrecisaoTreino:setFontColor("black");
    obj.PrecisaoTreino:setFontSize(17);
    obj.PrecisaoTreino:setHorzTextAlign("center");
    obj.PrecisaoTreino:setType("number");
    lfm_setPropAsString(obj.PrecisaoTreino, "fontStyle", "bold");

    obj.rectangle94 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle94:setParent(obj.layout7);
    obj.rectangle94:setLeft(310);
    obj.rectangle94:setTop(319);
    obj.rectangle94:setWidth(45);
    obj.rectangle94:setHeight(24);
    obj.rectangle94:setColor("#F5F5DC");
    obj.rectangle94:setXradius(7);
    obj.rectangle94:setYradius(7);
    obj.rectangle94:setCornerType("round");
    obj.rectangle94:setName("rectangle94");

    obj.ForcaDeVontadeTreino = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForcaDeVontadeTreino:setParent(obj.layout7);
    obj.ForcaDeVontadeTreino:setField("ForcaDeVontadeTreino");
    obj.ForcaDeVontadeTreino:setName("ForcaDeVontadeTreino");
    obj.ForcaDeVontadeTreino:setLeft(310);
    obj.ForcaDeVontadeTreino:setTop(319);
    obj.ForcaDeVontadeTreino:setWidth(45);
    obj.ForcaDeVontadeTreino:setHeight(24);
    obj.ForcaDeVontadeTreino:setTransparent(true);
    obj.ForcaDeVontadeTreino:setFontColor("black");
    obj.ForcaDeVontadeTreino:setFontSize(17);
    obj.ForcaDeVontadeTreino:setHorzTextAlign("center");
    obj.ForcaDeVontadeTreino:setType("number");
    lfm_setPropAsString(obj.ForcaDeVontadeTreino, "fontStyle", "bold");

    obj.rectangle95 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle95:setParent(obj.layout7);
    obj.rectangle95:setLeft(370);
    obj.rectangle95:setTop(79);
    obj.rectangle95:setWidth(45);
    obj.rectangle95:setHeight(24);
    obj.rectangle95:setColor("#F5F5DC");
    obj.rectangle95:setXradius(7);
    obj.rectangle95:setYradius(7);
    obj.rectangle95:setCornerType("round");
    obj.rectangle95:setName("rectangle95");

    obj.ForcaTotal = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForcaTotal:setParent(obj.layout7);
    obj.ForcaTotal:setField("ForcaTotal");
    obj.ForcaTotal:setName("ForcaTotal");
    obj.ForcaTotal:setLeft(370);
    obj.ForcaTotal:setTop(79);
    obj.ForcaTotal:setWidth(45);
    obj.ForcaTotal:setHeight(22);
    obj.ForcaTotal:setTransparent(true);
    obj.ForcaTotal:setFontColor("black");
    obj.ForcaTotal:setFontSize(17);
    obj.ForcaTotal:setHorzTextAlign("center");
    obj.ForcaTotal:setType("number");
    lfm_setPropAsString(obj.ForcaTotal, "fontStyle", "bold");

    obj.rectangle96 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle96:setParent(obj.layout7);
    obj.rectangle96:setLeft(370);
    obj.rectangle96:setTop(109);
    obj.rectangle96:setWidth(45);
    obj.rectangle96:setHeight(24);
    obj.rectangle96:setColor("#F5F5DC");
    obj.rectangle96:setXradius(7);
    obj.rectangle96:setYradius(7);
    obj.rectangle96:setCornerType("round");
    obj.rectangle96:setName("rectangle96");

    obj.AgilidadeTotal = GUI.fromHandle(_obj_newObject("edit"));
    obj.AgilidadeTotal:setParent(obj.layout7);
    obj.AgilidadeTotal:setField("AgilidadeTotal");
    obj.AgilidadeTotal:setName("AgilidadeTotal");
    obj.AgilidadeTotal:setLeft(370);
    obj.AgilidadeTotal:setTop(109);
    obj.AgilidadeTotal:setWidth(45);
    obj.AgilidadeTotal:setHeight(22);
    obj.AgilidadeTotal:setTransparent(true);
    obj.AgilidadeTotal:setFontColor("black");
    obj.AgilidadeTotal:setFontSize(17);
    obj.AgilidadeTotal:setHorzTextAlign("center");
    obj.AgilidadeTotal:setType("number");
    lfm_setPropAsString(obj.AgilidadeTotal, "fontStyle", "bold");

    obj.rectangle97 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle97:setParent(obj.layout7);
    obj.rectangle97:setLeft(370);
    obj.rectangle97:setTop(139);
    obj.rectangle97:setWidth(45);
    obj.rectangle97:setHeight(24);
    obj.rectangle97:setColor("#F5F5DC");
    obj.rectangle97:setXradius(7);
    obj.rectangle97:setYradius(7);
    obj.rectangle97:setCornerType("round");
    obj.rectangle97:setName("rectangle97");

    obj.VigorTotal = GUI.fromHandle(_obj_newObject("edit"));
    obj.VigorTotal:setParent(obj.layout7);
    obj.VigorTotal:setField("VigorTotal");
    obj.VigorTotal:setName("VigorTotal");
    obj.VigorTotal:setLeft(370);
    obj.VigorTotal:setTop(139);
    obj.VigorTotal:setWidth(45);
    obj.VigorTotal:setHeight(22);
    obj.VigorTotal:setTransparent(true);
    obj.VigorTotal:setFontColor("black");
    obj.VigorTotal:setFontSize(17);
    obj.VigorTotal:setHorzTextAlign("center");
    obj.VigorTotal:setType("number");
    lfm_setPropAsString(obj.VigorTotal, "fontStyle", "bold");

    obj.rectangle98 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle98:setParent(obj.layout7);
    obj.rectangle98:setLeft(370);
    obj.rectangle98:setTop(169);
    obj.rectangle98:setWidth(45);
    obj.rectangle98:setHeight(24);
    obj.rectangle98:setColor("#F5F5DC");
    obj.rectangle98:setXradius(7);
    obj.rectangle98:setYradius(7);
    obj.rectangle98:setCornerType("round");
    obj.rectangle98:setName("rectangle98");

    obj.CombateTotal = GUI.fromHandle(_obj_newObject("edit"));
    obj.CombateTotal:setParent(obj.layout7);
    obj.CombateTotal:setField("CombateTotal");
    obj.CombateTotal:setName("CombateTotal");
    obj.CombateTotal:setLeft(370);
    obj.CombateTotal:setTop(169);
    obj.CombateTotal:setWidth(45);
    obj.CombateTotal:setHeight(22);
    obj.CombateTotal:setTransparent(true);
    obj.CombateTotal:setFontColor("black");
    obj.CombateTotal:setFontSize(17);
    obj.CombateTotal:setHorzTextAlign("center");
    obj.CombateTotal:setType("number");
    lfm_setPropAsString(obj.CombateTotal, "fontStyle", "bold");

    obj.rectangle99 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle99:setParent(obj.layout7);
    obj.rectangle99:setLeft(370);
    obj.rectangle99:setTop(199);
    obj.rectangle99:setWidth(45);
    obj.rectangle99:setHeight(24);
    obj.rectangle99:setColor("#F5F5DC");
    obj.rectangle99:setXradius(7);
    obj.rectangle99:setYradius(7);
    obj.rectangle99:setCornerType("round");
    obj.rectangle99:setName("rectangle99");

    obj.PercepcaoTotal = GUI.fromHandle(_obj_newObject("edit"));
    obj.PercepcaoTotal:setParent(obj.layout7);
    obj.PercepcaoTotal:setField("PercepcaoTotal");
    obj.PercepcaoTotal:setName("PercepcaoTotal");
    obj.PercepcaoTotal:setLeft(370);
    obj.PercepcaoTotal:setTop(199);
    obj.PercepcaoTotal:setWidth(45);
    obj.PercepcaoTotal:setHeight(22);
    obj.PercepcaoTotal:setTransparent(true);
    obj.PercepcaoTotal:setFontColor("black");
    obj.PercepcaoTotal:setFontSize(17);
    obj.PercepcaoTotal:setHorzTextAlign("center");
    obj.PercepcaoTotal:setType("number");
    lfm_setPropAsString(obj.PercepcaoTotal, "fontStyle", "bold");

    obj.rectangle100 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle100:setParent(obj.layout7);
    obj.rectangle100:setLeft(370);
    obj.rectangle100:setTop(229);
    obj.rectangle100:setWidth(45);
    obj.rectangle100:setHeight(24);
    obj.rectangle100:setColor("#F5F5DC");
    obj.rectangle100:setXradius(7);
    obj.rectangle100:setYradius(7);
    obj.rectangle100:setCornerType("round");
    obj.rectangle100:setName("rectangle100");

    obj.CarismaTotal = GUI.fromHandle(_obj_newObject("edit"));
    obj.CarismaTotal:setParent(obj.layout7);
    obj.CarismaTotal:setField("CarismaTotal");
    obj.CarismaTotal:setName("CarismaTotal");
    obj.CarismaTotal:setLeft(370);
    obj.CarismaTotal:setTop(229);
    obj.CarismaTotal:setWidth(45);
    obj.CarismaTotal:setHeight(22);
    obj.CarismaTotal:setTransparent(true);
    obj.CarismaTotal:setFontColor("black");
    obj.CarismaTotal:setFontSize(17);
    obj.CarismaTotal:setHorzTextAlign("center");
    obj.CarismaTotal:setType("number");
    lfm_setPropAsString(obj.CarismaTotal, "fontStyle", "bold");

    obj.rectangle101 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle101:setParent(obj.layout7);
    obj.rectangle101:setLeft(370);
    obj.rectangle101:setTop(259);
    obj.rectangle101:setWidth(45);
    obj.rectangle101:setHeight(24);
    obj.rectangle101:setColor("#F5F5DC");
    obj.rectangle101:setXradius(7);
    obj.rectangle101:setYradius(7);
    obj.rectangle101:setCornerType("round");
    obj.rectangle101:setName("rectangle101");

    obj.InteligenciaTotal = GUI.fromHandle(_obj_newObject("edit"));
    obj.InteligenciaTotal:setParent(obj.layout7);
    obj.InteligenciaTotal:setField("InteligenciaTotal");
    obj.InteligenciaTotal:setName("InteligenciaTotal");
    obj.InteligenciaTotal:setLeft(370);
    obj.InteligenciaTotal:setTop(259);
    obj.InteligenciaTotal:setWidth(45);
    obj.InteligenciaTotal:setHeight(22);
    obj.InteligenciaTotal:setTransparent(true);
    obj.InteligenciaTotal:setFontColor("black");
    obj.InteligenciaTotal:setFontSize(17);
    obj.InteligenciaTotal:setHorzTextAlign("center");
    obj.InteligenciaTotal:setType("number");
    lfm_setPropAsString(obj.InteligenciaTotal, "fontStyle", "bold");

    obj.rectangle102 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle102:setParent(obj.layout7);
    obj.rectangle102:setLeft(370);
    obj.rectangle102:setTop(289);
    obj.rectangle102:setWidth(45);
    obj.rectangle102:setHeight(24);
    obj.rectangle102:setColor("#F5F5DC");
    obj.rectangle102:setXradius(7);
    obj.rectangle102:setYradius(7);
    obj.rectangle102:setCornerType("round");
    obj.rectangle102:setName("rectangle102");

    obj.PrecisaoTotal = GUI.fromHandle(_obj_newObject("edit"));
    obj.PrecisaoTotal:setParent(obj.layout7);
    obj.PrecisaoTotal:setField("PrecisaoTotal");
    obj.PrecisaoTotal:setName("PrecisaoTotal");
    obj.PrecisaoTotal:setLeft(370);
    obj.PrecisaoTotal:setTop(289);
    obj.PrecisaoTotal:setWidth(45);
    obj.PrecisaoTotal:setHeight(22);
    obj.PrecisaoTotal:setTransparent(true);
    obj.PrecisaoTotal:setFontColor("black");
    obj.PrecisaoTotal:setFontSize(17);
    obj.PrecisaoTotal:setHorzTextAlign("center");
    obj.PrecisaoTotal:setType("number");
    lfm_setPropAsString(obj.PrecisaoTotal, "fontStyle", "bold");

    obj.rectangle103 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle103:setParent(obj.layout7);
    obj.rectangle103:setLeft(370);
    obj.rectangle103:setTop(319);
    obj.rectangle103:setWidth(45);
    obj.rectangle103:setHeight(24);
    obj.rectangle103:setColor("#F5F5DC");
    obj.rectangle103:setXradius(7);
    obj.rectangle103:setYradius(7);
    obj.rectangle103:setCornerType("round");
    obj.rectangle103:setName("rectangle103");

    obj.ForcaDeVontadeTotal = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForcaDeVontadeTotal:setParent(obj.layout7);
    obj.ForcaDeVontadeTotal:setField("ForcaDeVontadeTotal");
    obj.ForcaDeVontadeTotal:setName("ForcaDeVontadeTotal");
    obj.ForcaDeVontadeTotal:setLeft(370);
    obj.ForcaDeVontadeTotal:setTop(319);
    obj.ForcaDeVontadeTotal:setWidth(45);
    obj.ForcaDeVontadeTotal:setHeight(22);
    obj.ForcaDeVontadeTotal:setTransparent(true);
    obj.ForcaDeVontadeTotal:setFontColor("black");
    obj.ForcaDeVontadeTotal:setFontSize(17);
    obj.ForcaDeVontadeTotal:setHorzTextAlign("center");
    obj.ForcaDeVontadeTotal:setType("number");
    lfm_setPropAsString(obj.ForcaDeVontadeTotal, "fontStyle", "bold");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout7);
    obj.label33:setLeft(15);
    obj.label33:setTop(355);
    obj.label33:setWidth(110);
    obj.label33:setText("Disponíveis:");
    obj.label33:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label33, "fontStyle", "underline");
    obj.label33:setFontSize(12);
    obj.label33:setName("label33");

    obj.rectangle104 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle104:setParent(obj.layout7);
    obj.rectangle104:setLeft(83);
    obj.rectangle104:setTop(355);
    obj.rectangle104:setWidth(40);
    obj.rectangle104:setHeight(19);
    obj.rectangle104:setColor("#5F9EA0");
    obj.rectangle104:setXradius(7);
    obj.rectangle104:setYradius(7);
    obj.rectangle104:setCornerType("round");
    obj.rectangle104:setName("rectangle104");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout7);
    obj.label34:setField("PontosDisponiveis");
    obj.label34:setLeft(83);
    obj.label34:setTop(354);
    obj.label34:setWidth(40);
    obj.label34:setHeight(20);
    obj.label34:setFontColor("black");
    obj.label34:setFontSize(15);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout7);
    obj.label35:setLeft(131);
    obj.label35:setTop(355);
    obj.label35:setWidth(110);
    obj.label35:setText("Distribuídos:");
    obj.label35:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label35, "fontStyle", "underline");
    obj.label35:setFontSize(12);
    obj.label35:setName("label35");

    obj.rectangle105 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle105:setParent(obj.layout7);
    obj.rectangle105:setLeft(202);
    obj.rectangle105:setTop(355);
    obj.rectangle105:setWidth(40);
    obj.rectangle105:setHeight(19);
    obj.rectangle105:setColor("#5F9EA0");
    obj.rectangle105:setXradius(7);
    obj.rectangle105:setYradius(7);
    obj.rectangle105:setCornerType("round");
    obj.rectangle105:setName("rectangle105");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout7);
    obj.label36:setField("PontosDistribuidos");
    obj.label36:setLeft(202);
    obj.label36:setTop(354);
    obj.label36:setWidth(40);
    obj.label36:setHeight(20);
    obj.label36:setFontColor("black");
    obj.label36:setFontSize(15);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout7);
    obj.label37:setLeft(249);
    obj.label37:setTop(355);
    obj.label37:setWidth(110);
    obj.label37:setText("Outros:");
    obj.label37:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label37, "fontStyle", "underline");
    obj.label37:setFontSize(12);
    obj.label37:setName("label37");

    obj.rectangle106 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle106:setParent(obj.layout7);
    obj.rectangle106:setLeft(293);
    obj.rectangle106:setTop(355);
    obj.rectangle106:setWidth(40);
    obj.rectangle106:setHeight(19);
    obj.rectangle106:setColor("#5F9EA0");
    obj.rectangle106:setXradius(7);
    obj.rectangle106:setYradius(7);
    obj.rectangle106:setCornerType("round");
    obj.rectangle106:setName("rectangle106");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout7);
    obj.label38:setField("PontosOutros");
    obj.label38:setLeft(293);
    obj.label38:setTop(354);
    obj.label38:setWidth(40);
    obj.label38:setHeight(20);
    obj.label38:setFontColor("black");
    obj.label38:setFontSize(15);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout7);
    obj.label39:setLeft(341);
    obj.label39:setTop(355);
    obj.label39:setWidth(110);
    obj.label39:setText("Total:");
    obj.label39:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label39, "fontStyle", "underline");
    obj.label39:setFontSize(12);
    obj.label39:setName("label39");

    obj.rectangle107 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle107:setParent(obj.layout7);
    obj.rectangle107:setLeft(375);
    obj.rectangle107:setTop(355);
    obj.rectangle107:setWidth(40);
    obj.rectangle107:setHeight(19);
    obj.rectangle107:setColor("#5F9EA0");
    obj.rectangle107:setXradius(7);
    obj.rectangle107:setYradius(7);
    obj.rectangle107:setCornerType("round");
    obj.rectangle107:setName("rectangle107");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout7);
    obj.label40:setField("PontosTotais");
    obj.label40:setLeft(375);
    obj.label40:setTop(354);
    obj.label40:setWidth(40);
    obj.label40:setHeight(20);
    obj.label40:setFontColor("black");
    obj.label40:setFontSize(15);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.DefButton = GUI.fromHandle(_obj_newObject("button"));
    obj.DefButton:setParent(obj.layout7);
    obj.DefButton:setName("DefButton");
    obj.DefButton:setLeft(10);
    obj.DefButton:setTop(386);
    obj.DefButton:setText("Defesa");
    obj.DefButton:setWidth(110);

    obj.rectangle108 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle108:setParent(obj.layout7);
    obj.rectangle108:setLeft(130);
    obj.rectangle108:setTop(385);
    obj.rectangle108:setWidth(45);
    obj.rectangle108:setHeight(24);
    obj.rectangle108:setColor("#5F9EA0");
    obj.rectangle108:setXradius(7);
    obj.rectangle108:setYradius(7);
    obj.rectangle108:setCornerType("round");
    obj.rectangle108:setName("rectangle108");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout7);
    obj.label41:setField("Defesa");
    obj.label41:setLeft(130);
    obj.label41:setTop(386);
    obj.label41:setWidth(45);
    obj.label41:setHeight(22);
    obj.label41:setFontColor("black");
    obj.label41:setFontSize(17);
    obj.label41:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label41, "fontStyle", "bold");
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout7);
    obj.label42:setLeft(175);
    obj.label42:setTop(384);
    obj.label42:setWidth(250);
    obj.label42:setHeight(24);
    obj.label42:setText(" = 1d20 + Vigor/2");
    obj.label42:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.label42, "fontStyle", "bold");
    obj.label42:setFontSize(15);
    obj.label42:setName("label42");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout7);
    obj.label43:setLeft(10);
    obj.label43:setTop(425);
    obj.label43:setWidth(100);
    obj.label43:setHeight(24);
    obj.label43:setText("HP:");
    obj.label43:setFontColor("#D70000");
    obj.label43:setFontSize(13);
    lfm_setPropAsString(obj.label43, "fontStyle", "bold");
    obj.label43:setName("label43");

    obj.rectangle109 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle109:setParent(obj.layout7);
    obj.rectangle109:setLeft(75);
    obj.rectangle109:setTop(426);
    obj.rectangle109:setWidth(45);
    obj.rectangle109:setHeight(20);
    obj.rectangle109:setColor("#5F9EA0");
    obj.rectangle109:setXradius(7);
    obj.rectangle109:setYradius(7);
    obj.rectangle109:setCornerType("round");
    obj.rectangle109:setName("rectangle109");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout7);
    obj.label44:setField("hp");
    obj.label44:setLeft(75);
    obj.label44:setTop(425);
    obj.label44:setWidth(45);
    obj.label44:setHeight(20);
    obj.label44:setText("");
    obj.label44:setFontColor("black");
    obj.label44:setFontSize(15);
    obj.label44:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label44, "fontStyle", "bold");
    obj.label44:setAutoSize(true);
    obj.label44:setName("label44");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout7);
    obj.label45:setLeft(120);
    obj.label45:setTop(423);
    obj.label45:setWidth(300);
    obj.label45:setHeight(24);
    obj.label45:setText(" = (Vigor X 7) + 50 | A cada nv. = +5");
    obj.label45:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.label45, "fontStyle", "bold");
    obj.label45:setFontSize(15);
    obj.label45:setName("label45");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout7);
    obj.label46:setLeft(10);
    obj.label46:setTop(449);
    obj.label46:setWidth(100);
    obj.label46:setHeight(24);
    obj.label46:setText("ENERGIA:");
    obj.label46:setFontColor("#0080FF");
    obj.label46:setFontSize(13);
    lfm_setPropAsString(obj.label46, "fontStyle", "bold");
    obj.label46:setName("label46");

    obj.rectangle110 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle110:setParent(obj.layout7);
    obj.rectangle110:setLeft(75);
    obj.rectangle110:setTop(450);
    obj.rectangle110:setWidth(45);
    obj.rectangle110:setHeight(20);
    obj.rectangle110:setColor("#5F9EA0");
    obj.rectangle110:setXradius(7);
    obj.rectangle110:setYradius(7);
    obj.rectangle110:setCornerType("round");
    obj.rectangle110:setName("rectangle110");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout7);
    obj.label47:setField("eng");
    obj.label47:setLeft(75);
    obj.label47:setTop(450);
    obj.label47:setWidth(45);
    obj.label47:setHeight(20);
    obj.label47:setText("");
    obj.label47:setFontColor("black");
    obj.label47:setFontSize(15);
    obj.label47:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label47, "fontStyle", "bold");
    obj.label47:setAutoSize(true);
    obj.label47:setName("label47");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout7);
    obj.label48:setLeft(120);
    obj.label48:setTop(447);
    obj.label48:setWidth(300);
    obj.label48:setHeight(24);
    obj.label48:setText(" = (Vigor X 7) + 62 | A cada nv. = +5");
    obj.label48:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.label48, "fontStyle", "bold");
    obj.label48:setFontSize(15);
    obj.label48:setName("label48");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout7);
    obj.label49:setLeft(10);
    obj.label49:setTop(473);
    obj.label49:setWidth(100);
    obj.label49:setHeight(24);
    obj.label49:setText("HAKI:");
    obj.label49:setFontColor("#FAB609");
    obj.label49:setFontSize(13);
    lfm_setPropAsString(obj.label49, "fontStyle", "bold");
    obj.label49:setName("label49");

    obj.rectangle111 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle111:setParent(obj.layout7);
    obj.rectangle111:setLeft(75);
    obj.rectangle111:setTop(474);
    obj.rectangle111:setWidth(45);
    obj.rectangle111:setHeight(20);
    obj.rectangle111:setColor("#5F9EA0");
    obj.rectangle111:setXradius(7);
    obj.rectangle111:setYradius(7);
    obj.rectangle111:setCornerType("round");
    obj.rectangle111:setName("rectangle111");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout7);
    obj.label50:setField("haki");
    obj.label50:setLeft(75);
    obj.label50:setTop(474);
    obj.label50:setWidth(45);
    obj.label50:setHeight(20);
    obj.label50:setText("");
    obj.label50:setFontColor("black");
    obj.label50:setFontSize(15);
    obj.label50:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label50, "fontStyle", "bold");
    obj.label50:setAutoSize(true);
    obj.label50:setName("label50");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout7);
    obj.label51:setLeft(120);
    obj.label51:setTop(472);
    obj.label51:setWidth(300);
    obj.label51:setHeight(24);
    obj.label51:setText(" = FDV x 5 (apartir de FDV = 20)");
    obj.label51:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.label51, "fontStyle", "bold");
    obj.label51:setFontSize(15);
    obj.label51:setName("label51");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.Atributos);
    obj.layout8:setLeft(455);
    obj.layout8:setTop(12);
    obj.layout8:setWidth(400);
    obj.layout8:setHeight(525);
    obj.layout8:setName("layout8");

    obj.rectangle112 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle112:setParent(obj.layout8);
    obj.rectangle112:setLeft(0);
    obj.rectangle112:setTop(0);
    obj.rectangle112:setWidth(400);
    obj.rectangle112:setHeight(525);
    obj.rectangle112:setColor("#4169E1");
    obj.rectangle112:setName("rectangle112");

    obj.rectangle113 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle113:setParent(obj.layout8);
    obj.rectangle113:setLeft(2);
    obj.rectangle113:setTop(2);
    obj.rectangle113:setWidth(396);
    obj.rectangle113:setHeight(521);
    obj.rectangle113:setColor("black");
    obj.rectangle113:setName("rectangle113");

    obj.rectangle114 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle114:setParent(obj.layout8);
    obj.rectangle114:setLeft(12);
    obj.rectangle114:setTop(25);
    obj.rectangle114:setWidth(73);
    obj.rectangle114:setHeight(73);
    obj.rectangle114:setColor("#F5F5DC");
    obj.rectangle114:setName("rectangle114");

    obj.rectangle115 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle115:setParent(obj.layout8);
    obj.rectangle115:setLeft(315);
    obj.rectangle115:setTop(25);
    obj.rectangle115:setWidth(73);
    obj.rectangle115:setHeight(73);
    obj.rectangle115:setColor("#F5F5DC");
    obj.rectangle115:setName("rectangle115");

    obj.rectangle116 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle116:setParent(obj.layout8);
    obj.rectangle116:setLeft(13);
    obj.rectangle116:setTop(26);
    obj.rectangle116:setWidth(71);
    obj.rectangle116:setHeight(71);
    obj.rectangle116:setColor("black");
    obj.rectangle116:setName("rectangle116");

    obj.rectangle117 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle117:setParent(obj.layout8);
    obj.rectangle117:setLeft(316);
    obj.rectangle117:setTop(26);
    obj.rectangle117:setWidth(71);
    obj.rectangle117:setHeight(71);
    obj.rectangle117:setColor("black");
    obj.rectangle117:setName("rectangle117");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout8);
    obj.image5:setField("FotoChapeu");
    obj.image5:setLeft(13);
    obj.image5:setTop(26);
    obj.image5:setWidth(71);
    obj.image5:setHeight(71);
    obj.image5:setName("image5");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.layout8);
    obj.image6:setField("FotoRosto");
    obj.image6:setLeft(316);
    obj.image6:setTop(26);
    obj.image6:setWidth(71);
    obj.image6:setHeight(71);
    obj.image6:setName("image6");

    obj.rectangle118 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle118:setParent(obj.layout8);
    obj.rectangle118:setLeft(12);
    obj.rectangle118:setTop(108);
    obj.rectangle118:setWidth(73);
    obj.rectangle118:setHeight(73);
    obj.rectangle118:setColor("#F5F5DC");
    obj.rectangle118:setName("rectangle118");

    obj.rectangle119 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle119:setParent(obj.layout8);
    obj.rectangle119:setLeft(315);
    obj.rectangle119:setTop(108);
    obj.rectangle119:setWidth(73);
    obj.rectangle119:setHeight(73);
    obj.rectangle119:setColor("#F5F5DC");
    obj.rectangle119:setName("rectangle119");

    obj.rectangle120 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle120:setParent(obj.layout8);
    obj.rectangle120:setLeft(13);
    obj.rectangle120:setTop(109);
    obj.rectangle120:setWidth(71);
    obj.rectangle120:setHeight(71);
    obj.rectangle120:setColor("black");
    obj.rectangle120:setName("rectangle120");

    obj.rectangle121 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle121:setParent(obj.layout8);
    obj.rectangle121:setLeft(316);
    obj.rectangle121:setTop(109);
    obj.rectangle121:setWidth(71);
    obj.rectangle121:setHeight(71);
    obj.rectangle121:setColor("black");
    obj.rectangle121:setName("rectangle121");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.layout8);
    obj.image7:setField("FotoColar");
    obj.image7:setLeft(13);
    obj.image7:setTop(109);
    obj.image7:setWidth(71);
    obj.image7:setHeight(71);
    obj.image7:setName("image7");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.layout8);
    obj.image8:setField("FotoBrinco");
    obj.image8:setLeft(316);
    obj.image8:setTop(109);
    obj.image8:setWidth(71);
    obj.image8:setHeight(71);
    obj.image8:setName("image8");

    obj.rectangle122 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle122:setParent(obj.layout8);
    obj.rectangle122:setLeft(12);
    obj.rectangle122:setTop(191);
    obj.rectangle122:setWidth(73);
    obj.rectangle122:setHeight(73);
    obj.rectangle122:setColor("#F5F5DC");
    obj.rectangle122:setName("rectangle122");

    obj.rectangle123 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle123:setParent(obj.layout8);
    obj.rectangle123:setLeft(315);
    obj.rectangle123:setTop(191);
    obj.rectangle123:setWidth(73);
    obj.rectangle123:setHeight(73);
    obj.rectangle123:setColor("#F5F5DC");
    obj.rectangle123:setName("rectangle123");

    obj.rectangle124 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle124:setParent(obj.layout8);
    obj.rectangle124:setLeft(13);
    obj.rectangle124:setTop(192);
    obj.rectangle124:setWidth(71);
    obj.rectangle124:setHeight(71);
    obj.rectangle124:setColor("black");
    obj.rectangle124:setName("rectangle124");

    obj.rectangle125 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle125:setParent(obj.layout8);
    obj.rectangle125:setLeft(316);
    obj.rectangle125:setTop(192);
    obj.rectangle125:setWidth(71);
    obj.rectangle125:setHeight(71);
    obj.rectangle125:setColor("black");
    obj.rectangle125:setName("rectangle125");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.layout8);
    obj.image9:setField("FotoRoupa");
    obj.image9:setLeft(13);
    obj.image9:setTop(192);
    obj.image9:setWidth(71);
    obj.image9:setHeight(71);
    obj.image9:setName("image9");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.layout8);
    obj.image10:setField("FotoCapa");
    obj.image10:setLeft(316);
    obj.image10:setTop(192);
    obj.image10:setWidth(71);
    obj.image10:setHeight(71);
    obj.image10:setName("image10");

    obj.rectangle126 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle126:setParent(obj.layout8);
    obj.rectangle126:setLeft(12);
    obj.rectangle126:setTop(274);
    obj.rectangle126:setWidth(73);
    obj.rectangle126:setHeight(73);
    obj.rectangle126:setColor("#F5F5DC");
    obj.rectangle126:setName("rectangle126");

    obj.rectangle127 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle127:setParent(obj.layout8);
    obj.rectangle127:setLeft(315);
    obj.rectangle127:setTop(274);
    obj.rectangle127:setWidth(73);
    obj.rectangle127:setHeight(73);
    obj.rectangle127:setColor("#F5F5DC");
    obj.rectangle127:setName("rectangle127");

    obj.rectangle128 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle128:setParent(obj.layout8);
    obj.rectangle128:setLeft(13);
    obj.rectangle128:setTop(275);
    obj.rectangle128:setWidth(71);
    obj.rectangle128:setHeight(71);
    obj.rectangle128:setColor("black");
    obj.rectangle128:setName("rectangle128");

    obj.rectangle129 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle129:setParent(obj.layout8);
    obj.rectangle129:setLeft(316);
    obj.rectangle129:setTop(275);
    obj.rectangle129:setWidth(71);
    obj.rectangle129:setHeight(71);
    obj.rectangle129:setColor("black");
    obj.rectangle129:setName("rectangle129");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.layout8);
    obj.image11:setField("FotoMaoPrimaria");
    obj.image11:setLeft(13);
    obj.image11:setTop(275);
    obj.image11:setWidth(71);
    obj.image11:setHeight(71);
    obj.image11:setName("image11");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.layout8);
    obj.image12:setField("FotoMaoSecundaria");
    obj.image12:setLeft(316);
    obj.image12:setTop(275);
    obj.image12:setWidth(71);
    obj.image12:setHeight(71);
    obj.image12:setName("image12");

    obj.rectangle130 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle130:setParent(obj.layout8);
    obj.rectangle130:setLeft(12);
    obj.rectangle130:setTop(357);
    obj.rectangle130:setWidth(73);
    obj.rectangle130:setHeight(73);
    obj.rectangle130:setColor("#F5F5DC");
    obj.rectangle130:setName("rectangle130");

    obj.rectangle131 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle131:setParent(obj.layout8);
    obj.rectangle131:setLeft(315);
    obj.rectangle131:setTop(357);
    obj.rectangle131:setWidth(73);
    obj.rectangle131:setHeight(73);
    obj.rectangle131:setColor("#F5F5DC");
    obj.rectangle131:setName("rectangle131");

    obj.rectangle132 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle132:setParent(obj.layout8);
    obj.rectangle132:setLeft(13);
    obj.rectangle132:setTop(358);
    obj.rectangle132:setWidth(71);
    obj.rectangle132:setHeight(71);
    obj.rectangle132:setColor("black");
    obj.rectangle132:setName("rectangle132");

    obj.rectangle133 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle133:setParent(obj.layout8);
    obj.rectangle133:setLeft(316);
    obj.rectangle133:setTop(358);
    obj.rectangle133:setWidth(71);
    obj.rectangle133:setHeight(71);
    obj.rectangle133:setColor("black");
    obj.rectangle133:setName("rectangle133");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.layout8);
    obj.image13:setField("FotoCalca");
    obj.image13:setLeft(13);
    obj.image13:setTop(358);
    obj.image13:setWidth(71);
    obj.image13:setHeight(71);
    obj.image13:setName("image13");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.layout8);
    obj.image14:setField("FotoLuva");
    obj.image14:setLeft(316);
    obj.image14:setTop(358);
    obj.image14:setWidth(71);
    obj.image14:setHeight(71);
    obj.image14:setName("image14");

    obj.rectangle134 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle134:setParent(obj.layout8);
    obj.rectangle134:setLeft(12);
    obj.rectangle134:setTop(440);
    obj.rectangle134:setWidth(73);
    obj.rectangle134:setHeight(73);
    obj.rectangle134:setColor("#F5F5DC");
    obj.rectangle134:setName("rectangle134");

    obj.rectangle135 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle135:setParent(obj.layout8);
    obj.rectangle135:setLeft(315);
    obj.rectangle135:setTop(440);
    obj.rectangle135:setWidth(73);
    obj.rectangle135:setHeight(73);
    obj.rectangle135:setColor("#F5F5DC");
    obj.rectangle135:setName("rectangle135");

    obj.rectangle136 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle136:setParent(obj.layout8);
    obj.rectangle136:setLeft(13);
    obj.rectangle136:setTop(441);
    obj.rectangle136:setWidth(71);
    obj.rectangle136:setHeight(71);
    obj.rectangle136:setColor("black");
    obj.rectangle136:setName("rectangle136");

    obj.rectangle137 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle137:setParent(obj.layout8);
    obj.rectangle137:setLeft(316);
    obj.rectangle137:setTop(441);
    obj.rectangle137:setWidth(71);
    obj.rectangle137:setHeight(71);
    obj.rectangle137:setColor("black");
    obj.rectangle137:setName("rectangle137");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.layout8);
    obj.image15:setField("FotoBota");
    obj.image15:setLeft(13);
    obj.image15:setTop(441);
    obj.image15:setWidth(71);
    obj.image15:setHeight(71);
    obj.image15:setName("image15");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.layout8);
    obj.image16:setField("FotoAnel");
    obj.image16:setLeft(316);
    obj.image16:setTop(441);
    obj.image16:setWidth(71);
    obj.image16:setHeight(71);
    obj.image16:setName("image16");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout8);
    obj.button6:setLeft(12);
    obj.button6:setTop(25);
    obj.button6:setWidth(73);
    obj.button6:setHeight(73);
    obj.button6:setOpacity(0);
    obj.button6:setCursor("handPoint");
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout8);
    obj.button7:setLeft(315);
    obj.button7:setTop(25);
    obj.button7:setWidth(73);
    obj.button7:setHeight(73);
    obj.button7:setOpacity(0);
    obj.button7:setCursor("handPoint");
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout8);
    obj.button8:setLeft(12);
    obj.button8:setTop(108);
    obj.button8:setWidth(73);
    obj.button8:setHeight(73);
    obj.button8:setOpacity(0);
    obj.button8:setCursor("handPoint");
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout8);
    obj.button9:setLeft(315);
    obj.button9:setTop(108);
    obj.button9:setWidth(73);
    obj.button9:setHeight(73);
    obj.button9:setOpacity(0);
    obj.button9:setCursor("handPoint");
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout8);
    obj.button10:setLeft(12);
    obj.button10:setTop(191);
    obj.button10:setWidth(73);
    obj.button10:setHeight(73);
    obj.button10:setOpacity(0);
    obj.button10:setCursor("handPoint");
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout8);
    obj.button11:setLeft(315);
    obj.button11:setTop(191);
    obj.button11:setWidth(73);
    obj.button11:setHeight(73);
    obj.button11:setOpacity(0);
    obj.button11:setCursor("handPoint");
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout8);
    obj.button12:setLeft(12);
    obj.button12:setTop(274);
    obj.button12:setWidth(73);
    obj.button12:setHeight(73);
    obj.button12:setOpacity(0);
    obj.button12:setCursor("handPoint");
    obj.button12:setName("button12");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout8);
    obj.button13:setLeft(315);
    obj.button13:setTop(274);
    obj.button13:setWidth(73);
    obj.button13:setHeight(73);
    obj.button13:setOpacity(0);
    obj.button13:setCursor("handPoint");
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout8);
    obj.button14:setLeft(12);
    obj.button14:setTop(357);
    obj.button14:setWidth(73);
    obj.button14:setHeight(73);
    obj.button14:setOpacity(0);
    obj.button14:setCursor("handPoint");
    obj.button14:setName("button14");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout8);
    obj.button15:setLeft(315);
    obj.button15:setTop(357);
    obj.button15:setWidth(73);
    obj.button15:setHeight(73);
    obj.button15:setOpacity(0);
    obj.button15:setCursor("handPoint");
    obj.button15:setName("button15");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout8);
    obj.button16:setLeft(12);
    obj.button16:setTop(440);
    obj.button16:setWidth(73);
    obj.button16:setHeight(73);
    obj.button16:setOpacity(0);
    obj.button16:setCursor("handPoint");
    obj.button16:setName("button16");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout8);
    obj.button17:setLeft(315);
    obj.button17:setTop(440);
    obj.button17:setWidth(73);
    obj.button17:setHeight(73);
    obj.button17:setOpacity(0);
    obj.button17:setCursor("handPoint");
    obj.button17:setName("button17");

    obj.imagem = GUI.fromHandle(_obj_newObject("image"));
    obj.imagem:setParent(obj.layout8);
    obj.imagem:setField("imagemPersonagem");
    obj.imagem:setName("imagem");
    obj.imagem:setLeft(85);
    obj.imagem:setTop(25);
    obj.imagem:setWidth(115);
    obj.imagem:setHeight(244);
    obj.imagem:setScale(2);
    obj.imagem:setSRC("https://blob.firecast.com.br/blobs/RORGTSIN_3738646/Ussop-removebg-preview.png");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.Atributos);
    obj.layout9:setLeft(868);
    obj.layout9:setTop(12);
    obj.layout9:setWidth(650);
    obj.layout9:setHeight(525);
    obj.layout9:setName("layout9");

    obj.rectangle138 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle138:setParent(obj.layout9);
    obj.rectangle138:setLeft(0);
    obj.rectangle138:setTop(0);
    obj.rectangle138:setWidth(430);
    obj.rectangle138:setHeight(167);
    obj.rectangle138:setColor("#4169E1");
    obj.rectangle138:setName("rectangle138");

    obj.rectangle139 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle139:setParent(obj.layout9);
    obj.rectangle139:setLeft(2);
    obj.rectangle139:setTop(2);
    obj.rectangle139:setWidth(426);
    obj.rectangle139:setHeight(163);
    obj.rectangle139:setColor("black");
    obj.rectangle139:setName("rectangle139");

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.layout9);
    obj.image17:setLeft(4);
    obj.image17:setTop(4);
    obj.image17:setWidth(140);
    obj.image17:setHeight(159);
    obj.image17:setSRC("https://i.namu.wiki/i/r0gPa0bB1bcSk6e517nIupj0zyqafzWY1LL1f0lg9dqPzouu57kCiCbG4TxLCyMA0ljPVi5GON2NftSTCkRp8g.gif");
    obj.image17:setShowStyle("autoFit");
    obj.image17.animate = true;
    obj.image17:setName("image17");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout9);
    obj.label52:setLeft(144);
    obj.label52:setTop(5);
    obj.label52:setWidth(286);
    obj.label52:setText("Haki do Armamento");
    obj.label52:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.label52, "fontStyle", "bold underline");
    obj.label52:setFontSize(18);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout9);
    obj.button18:setLeft(2);
    obj.button18:setTop(2);
    obj.button18:setWidth(70);
    obj.button18:setText("Descrição");
    obj.button18:setName("button18");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout9);
    obj.label53:setLeft(162);
    obj.label53:setTop(40);
    obj.label53:setWidth(256);
    obj.label53:setText("Tier:");
    obj.label53:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label53, "fontStyle", "bold");
    obj.label53:setFontSize(16);
    obj.label53:setName("label53");

    obj.rectangle140 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle140:setParent(obj.layout9);
    obj.rectangle140:setLeft(199);
    obj.rectangle140:setTop(41);
    obj.rectangle140:setWidth(35);
    obj.rectangle140:setHeight(18);
    obj.rectangle140:setColor("#F5F5DC");
    obj.rectangle140:setXradius(7);
    obj.rectangle140:setYradius(7);
    obj.rectangle140:setName("rectangle140");

    obj.tierArmamento = GUI.fromHandle(_obj_newObject("edit"));
    obj.tierArmamento:setParent(obj.layout9);
    obj.tierArmamento:setField("tierArmamento");
    obj.tierArmamento:setName("tierArmamento");
    obj.tierArmamento:setLeft(199);
    obj.tierArmamento:setTop(40);
    obj.tierArmamento:setWidth(35);
    obj.tierArmamento:setHeight(18);
    obj.tierArmamento:setTransparent(true);
    obj.tierArmamento:setFontColor("black");
    obj.tierArmamento:setFontSize(15);
    obj.tierArmamento:setHorzTextAlign("center");
    obj.tierArmamento:setType("number");
    obj.tierArmamento:setReadOnly(true);

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout9);
    obj.label54:setLeft(156);
    obj.label54:setTop(65);
    obj.label54:setWidth(256);
    obj.label54:setText("%UP:");
    obj.label54:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label54, "fontStyle", "bold");
    obj.label54:setFontSize(16);
    obj.label54:setName("label54");

    obj.rectangle141 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle141:setParent(obj.layout9);
    obj.rectangle141:setLeft(199);
    obj.rectangle141:setTop(66);
    obj.rectangle141:setWidth(35);
    obj.rectangle141:setHeight(18);
    obj.rectangle141:setColor("#F5F5DC");
    obj.rectangle141:setXradius(7);
    obj.rectangle141:setYradius(7);
    obj.rectangle141:setName("rectangle141");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout9);
    obj.edit8:setField("upArmamento");
    obj.edit8:setLeft(199);
    obj.edit8:setTop(65);
    obj.edit8:setWidth(35);
    obj.edit8:setHeight(18);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontColor("black");
    obj.edit8:setFontSize(15);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setType("number");
    obj.edit8:setReadOnly(true);
    obj.edit8:setName("edit8");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout9);
    obj.label55:setLeft(260);
    obj.label55:setTop(40);
    obj.label55:setWidth(256);
    obj.label55:setText("     Estado:");
    obj.label55:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label55, "fontStyle", "bold");
    obj.label55:setFontSize(15);
    obj.label55:setName("label55");

    obj.rectangle142 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle142:setParent(obj.layout9);
    obj.rectangle142:setLeft(335);
    obj.rectangle142:setTop(41);
    obj.rectangle142:setWidth(80);
    obj.rectangle142:setHeight(18);
    obj.rectangle142:setColor("#F5F5DC");
    obj.rectangle142:setXradius(7);
    obj.rectangle142:setYradius(7);
    obj.rectangle142:setName("rectangle142");

    obj.estadoArmamento = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.estadoArmamento:setParent(obj.layout9);
    obj.estadoArmamento:setField("EstadoArmamento");
    obj.estadoArmamento:setName("estadoArmamento");
    obj.estadoArmamento:setLeft(331);
    obj.estadoArmamento:setTop(38);
    obj.estadoArmamento:setWidth(87);
    obj.estadoArmamento:setTransparent(true);
    obj.estadoArmamento:setFontColor("black");
    obj.estadoArmamento:setItems({'Inexistente','Dormente','Despertado','Controlado'});
    obj.estadoArmamento:setValues({'I','Do','De','C'});
    obj.estadoArmamento:setHorzTextAlign("leading");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout9);
    obj.label56:setLeft(262);
    obj.label56:setTop(65);
    obj.label56:setWidth(256);
    obj.label56:setText("Condição:");
    obj.label56:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label56, "fontStyle", "bold");
    obj.label56:setFontSize(15);
    obj.label56:setName("label56");

    obj.rectangle143 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle143:setParent(obj.layout9);
    obj.rectangle143:setLeft(335);
    obj.rectangle143:setTop(66);
    obj.rectangle143:setWidth(80);
    obj.rectangle143:setHeight(18);
    obj.rectangle143:setColor("#F5F5DC");
    obj.rectangle143:setXradius(7);
    obj.rectangle143:setYradius(7);
    obj.rectangle143:setName("rectangle143");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout9);
    obj.comboBox1:setField("CondArmamento");
    obj.comboBox1:setLeft(331);
    obj.comboBox1:setTop(63);
    obj.comboBox1:setWidth(85);
    obj.comboBox1:setTransparent(true);
    obj.comboBox1:setFontColor("black");
    obj.comboBox1:setItems({'Normal','Avançado'});
    obj.comboBox1:setValues({'N','A'});
    obj.comboBox1:setHorzTextAlign("leading");
    obj.comboBox1:setName("comboBox1");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout9);
    obj.label57:setLeft(152);
    obj.label57:setTop(90);
    obj.label57:setWidth(256);
    obj.label57:setText("Custo:");
    obj.label57:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label57, "fontStyle", "bold");
    obj.label57:setFontSize(12);
    obj.label57:setName("label57");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout9);
    obj.label58:setField("CustoArmamento");
    obj.label58:setLeft(193);
    obj.label58:setTop(90);
    obj.label58:setWidth(237);
    obj.label58:setHeight(40);
    obj.label58:setFontColor("#5F9EA0");
    obj.label58:setFontSize(11);
    obj.label58:setVertTextAlign("leading");
    obj.label58:setName("label58");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout9);
    obj.label59:setLeft(152);
    obj.label59:setTop(110);
    obj.label59:setWidth(256);
    obj.label59:setText("Bônus:");
    obj.label59:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label59, "fontStyle", "bold");
    obj.label59:setFontSize(12);
    obj.label59:setName("label59");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout9);
    obj.label60:setField("BonusArmamento");
    obj.label60:setLeft(192);
    obj.label60:setTop(110);
    obj.label60:setWidth(237);
    obj.label60:setHeight(40);
    obj.label60:setFontColor("#5F9EA0");
    obj.label60:setFontSize(11);
    obj.label60:setVertTextAlign("leading");
    obj.label60:setName("label60");

    obj.rectangle144 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle144:setParent(obj.layout9);
    obj.rectangle144:setLeft(0);
    obj.rectangle144:setTop(179);
    obj.rectangle144:setWidth(430);
    obj.rectangle144:setHeight(167);
    obj.rectangle144:setColor("#4169E1");
    obj.rectangle144:setName("rectangle144");

    obj.rectangle145 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle145:setParent(obj.layout9);
    obj.rectangle145:setLeft(2);
    obj.rectangle145:setTop(181);
    obj.rectangle145:setWidth(426);
    obj.rectangle145:setHeight(163);
    obj.rectangle145:setColor("black");
    obj.rectangle145:setName("rectangle145");

    obj.image18 = GUI.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.layout9);
    obj.image18:setLeft(4);
    obj.image18:setTop(183);
    obj.image18:setWidth(140);
    obj.image18:setHeight(159);
    obj.image18:setSRC("https://blob.firecast.com.br/blobs/EGIIICJG_3736362/BtKz.gif");
    obj.image18:setShowStyle("autoFit");
    obj.image18.animate = true;
    obj.image18:setName("image18");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout9);
    obj.label61:setLeft(144);
    obj.label61:setTop(184);
    obj.label61:setWidth(286);
    obj.label61:setText("Haki da Observação");
    obj.label61:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.label61, "fontStyle", "bold underline");
    obj.label61:setFontSize(18);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout9);
    obj.button19:setLeft(2);
    obj.button19:setTop(181);
    obj.button19:setWidth(70);
    obj.button19:setText("Descrição");
    obj.button19:setName("button19");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout9);
    obj.label62:setLeft(162);
    obj.label62:setTop(210);
    obj.label62:setWidth(256);
    obj.label62:setText("Tier:");
    obj.label62:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label62, "fontStyle", "bold");
    obj.label62:setFontSize(16);
    obj.label62:setName("label62");

    obj.rectangle146 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle146:setParent(obj.layout9);
    obj.rectangle146:setLeft(199);
    obj.rectangle146:setTop(211);
    obj.rectangle146:setWidth(35);
    obj.rectangle146:setHeight(18);
    obj.rectangle146:setColor("#F5F5DC");
    obj.rectangle146:setXradius(7);
    obj.rectangle146:setYradius(7);
    obj.rectangle146:setName("rectangle146");

    obj.tierObservacao = GUI.fromHandle(_obj_newObject("edit"));
    obj.tierObservacao:setParent(obj.layout9);
    obj.tierObservacao:setField("tierObservacao");
    obj.tierObservacao:setName("tierObservacao");
    obj.tierObservacao:setLeft(199);
    obj.tierObservacao:setTop(210);
    obj.tierObservacao:setWidth(35);
    obj.tierObservacao:setHeight(18);
    obj.tierObservacao:setTransparent(true);
    obj.tierObservacao:setFontColor("black");
    obj.tierObservacao:setFontSize(15);
    obj.tierObservacao:setHorzTextAlign("center");
    obj.tierObservacao:setType("number");
    obj.tierObservacao:setReadOnly(true);

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout9);
    obj.label63:setLeft(156);
    obj.label63:setTop(235);
    obj.label63:setWidth(256);
    obj.label63:setText("%UP:");
    obj.label63:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label63, "fontStyle", "bold");
    obj.label63:setFontSize(16);
    obj.label63:setName("label63");

    obj.rectangle147 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle147:setParent(obj.layout9);
    obj.rectangle147:setLeft(199);
    obj.rectangle147:setTop(236);
    obj.rectangle147:setWidth(35);
    obj.rectangle147:setHeight(18);
    obj.rectangle147:setColor("#F5F5DC");
    obj.rectangle147:setXradius(7);
    obj.rectangle147:setYradius(7);
    obj.rectangle147:setName("rectangle147");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout9);
    obj.edit9:setField("upObsevacao");
    obj.edit9:setLeft(199);
    obj.edit9:setTop(235);
    obj.edit9:setWidth(35);
    obj.edit9:setHeight(18);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontColor("black");
    obj.edit9:setFontSize(15);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setType("number");
    obj.edit9:setReadOnly(true);
    obj.edit9:setName("edit9");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout9);
    obj.label64:setLeft(260);
    obj.label64:setTop(210);
    obj.label64:setWidth(256);
    obj.label64:setText("     Estado:");
    obj.label64:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label64, "fontStyle", "bold");
    obj.label64:setFontSize(15);
    obj.label64:setName("label64");

    obj.rectangle148 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle148:setParent(obj.layout9);
    obj.rectangle148:setLeft(335);
    obj.rectangle148:setTop(211);
    obj.rectangle148:setWidth(80);
    obj.rectangle148:setHeight(18);
    obj.rectangle148:setColor("#F5F5DC");
    obj.rectangle148:setXradius(7);
    obj.rectangle148:setYradius(7);
    obj.rectangle148:setName("rectangle148");

    obj.estadoObservacao = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.estadoObservacao:setParent(obj.layout9);
    obj.estadoObservacao:setField("EstadoObservacao");
    obj.estadoObservacao:setName("estadoObservacao");
    obj.estadoObservacao:setLeft(331);
    obj.estadoObservacao:setTop(208);
    obj.estadoObservacao:setWidth(87);
    obj.estadoObservacao:setTransparent(true);
    obj.estadoObservacao:setFontColor("black");
    obj.estadoObservacao:setItems({'Inexistente','Dormente','Despertado','Controlado'});
    obj.estadoObservacao:setValues({'I','Do','De','C'});
    obj.estadoObservacao:setHorzTextAlign("leading");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout9);
    obj.label65:setLeft(262);
    obj.label65:setTop(235);
    obj.label65:setWidth(256);
    obj.label65:setText("Condição:");
    obj.label65:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label65, "fontStyle", "bold");
    obj.label65:setFontSize(15);
    obj.label65:setName("label65");

    obj.rectangle149 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle149:setParent(obj.layout9);
    obj.rectangle149:setLeft(335);
    obj.rectangle149:setTop(236);
    obj.rectangle149:setWidth(80);
    obj.rectangle149:setHeight(18);
    obj.rectangle149:setColor("#F5F5DC");
    obj.rectangle149:setXradius(7);
    obj.rectangle149:setYradius(7);
    obj.rectangle149:setName("rectangle149");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout9);
    obj.comboBox2:setField("CondObsevacao");
    obj.comboBox2:setLeft(331);
    obj.comboBox2:setTop(233);
    obj.comboBox2:setWidth(85);
    obj.comboBox2:setTransparent(true);
    obj.comboBox2:setFontColor("black");
    obj.comboBox2:setItems({'Normal','Avançado'});
    obj.comboBox2:setValues({'N','A'});
    obj.comboBox2:setHorzTextAlign("leading");
    obj.comboBox2:setName("comboBox2");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout9);
    obj.label66:setLeft(152);
    obj.label66:setTop(260);
    obj.label66:setWidth(256);
    obj.label66:setText("Custo:");
    obj.label66:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label66, "fontStyle", "bold");
    obj.label66:setFontSize(12);
    obj.label66:setName("label66");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout9);
    obj.label67:setField("CustoObservacao");
    obj.label67:setLeft(193);
    obj.label67:setTop(260);
    obj.label67:setWidth(237);
    obj.label67:setHeight(40);
    obj.label67:setFontColor("#5F9EA0");
    obj.label67:setFontSize(11);
    obj.label67:setVertTextAlign("leading");
    obj.label67:setName("label67");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout9);
    obj.label68:setLeft(152);
    obj.label68:setTop(280);
    obj.label68:setWidth(256);
    obj.label68:setText("Bônus:");
    obj.label68:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label68, "fontStyle", "bold");
    obj.label68:setFontSize(12);
    obj.label68:setName("label68");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout9);
    obj.label69:setField("BonusObservacao");
    obj.label69:setLeft(192);
    obj.label69:setTop(280);
    obj.label69:setWidth(237);
    obj.label69:setHeight(40);
    obj.label69:setFontColor("#5F9EA0");
    obj.label69:setFontSize(11);
    obj.label69:setVertTextAlign("leading");
    obj.label69:setName("label69");

    obj.rectangle150 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle150:setParent(obj.layout9);
    obj.rectangle150:setLeft(0);
    obj.rectangle150:setTop(358);
    obj.rectangle150:setWidth(430);
    obj.rectangle150:setHeight(167);
    obj.rectangle150:setColor("#4169E1");
    obj.rectangle150:setName("rectangle150");

    obj.rectangle151 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle151:setParent(obj.layout9);
    obj.rectangle151:setLeft(2);
    obj.rectangle151:setTop(360);
    obj.rectangle151:setWidth(426);
    obj.rectangle151:setHeight(163);
    obj.rectangle151:setColor("black");
    obj.rectangle151:setName("rectangle151");

    obj.image19 = GUI.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.layout9);
    obj.image19:setLeft(4);
    obj.image19:setTop(362);
    obj.image19:setWidth(140);
    obj.image19:setHeight(159);
    obj.image19:setSRC("https://blob.firecast.com.br/blobs/TPUWRIHO_3736361/haki-luffy.gif");
    obj.image19:setShowStyle("autoFit");
    obj.image19.animate = true;
    obj.image19:setName("image19");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout9);
    obj.label70:setLeft(144);
    obj.label70:setTop(363);
    obj.label70:setWidth(286);
    obj.label70:setText("Haki do Conquistador");
    obj.label70:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.label70, "fontStyle", "bold underline");
    obj.label70:setFontSize(18);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout9);
    obj.button20:setLeft(2);
    obj.button20:setTop(360);
    obj.button20:setWidth(70);
    obj.button20:setText("Descrição");
    obj.button20:setName("button20");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout9);
    obj.button21:setLeft(75);
    obj.button21:setTop(360);
    obj.button21:setWidth(70);
    obj.button21:setText("Rolar Rei");
    obj.button21:setName("button21");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout9);
    obj.label71:setLeft(162);
    obj.label71:setTop(398);
    obj.label71:setWidth(256);
    obj.label71:setText("Tier:");
    obj.label71:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label71, "fontStyle", "bold");
    obj.label71:setFontSize(16);
    obj.label71:setName("label71");

    obj.rectangle152 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle152:setParent(obj.layout9);
    obj.rectangle152:setLeft(199);
    obj.rectangle152:setTop(399);
    obj.rectangle152:setWidth(35);
    obj.rectangle152:setHeight(18);
    obj.rectangle152:setColor("#F5F5DC");
    obj.rectangle152:setXradius(7);
    obj.rectangle152:setYradius(7);
    obj.rectangle152:setName("rectangle152");

    obj.tierConquistador = GUI.fromHandle(_obj_newObject("edit"));
    obj.tierConquistador:setParent(obj.layout9);
    obj.tierConquistador:setField("tierConquistador");
    obj.tierConquistador:setName("tierConquistador");
    obj.tierConquistador:setLeft(199);
    obj.tierConquistador:setTop(398);
    obj.tierConquistador:setWidth(35);
    obj.tierConquistador:setHeight(18);
    obj.tierConquistador:setTransparent(true);
    obj.tierConquistador:setFontColor("black");
    obj.tierConquistador:setFontSize(15);
    obj.tierConquistador:setHorzTextAlign("center");
    obj.tierConquistador:setType("number");
    obj.tierConquistador:setReadOnly(true);

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout9);
    obj.label72:setLeft(156);
    obj.label72:setTop(423);
    obj.label72:setWidth(256);
    obj.label72:setText("%UP:");
    obj.label72:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label72, "fontStyle", "bold");
    obj.label72:setFontSize(16);
    obj.label72:setName("label72");

    obj.rectangle153 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle153:setParent(obj.layout9);
    obj.rectangle153:setLeft(199);
    obj.rectangle153:setTop(424);
    obj.rectangle153:setWidth(35);
    obj.rectangle153:setHeight(18);
    obj.rectangle153:setColor("#F5F5DC");
    obj.rectangle153:setXradius(7);
    obj.rectangle153:setYradius(7);
    obj.rectangle153:setName("rectangle153");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout9);
    obj.edit10:setField("upConquistador");
    obj.edit10:setLeft(199);
    obj.edit10:setTop(423);
    obj.edit10:setWidth(35);
    obj.edit10:setHeight(18);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontColor("black");
    obj.edit10:setFontSize(15);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setType("number");
    obj.edit10:setReadOnly(true);
    obj.edit10:setName("edit10");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout9);
    obj.label73:setLeft(260);
    obj.label73:setTop(398);
    obj.label73:setWidth(256);
    obj.label73:setText("     Estado:");
    obj.label73:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label73, "fontStyle", "bold");
    obj.label73:setFontSize(15);
    obj.label73:setName("label73");

    obj.rectangle154 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle154:setParent(obj.layout9);
    obj.rectangle154:setLeft(335);
    obj.rectangle154:setTop(399);
    obj.rectangle154:setWidth(80);
    obj.rectangle154:setHeight(18);
    obj.rectangle154:setColor("#F5F5DC");
    obj.rectangle154:setXradius(7);
    obj.rectangle154:setYradius(7);
    obj.rectangle154:setName("rectangle154");

    obj.estadoConquistador = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.estadoConquistador:setParent(obj.layout9);
    obj.estadoConquistador:setField("EstadoConquistador");
    obj.estadoConquistador:setName("estadoConquistador");
    obj.estadoConquistador:setLeft(331);
    obj.estadoConquistador:setTop(396);
    obj.estadoConquistador:setWidth(87);
    obj.estadoConquistador:setTransparent(true);
    obj.estadoConquistador:setFontColor("black");
    obj.estadoConquistador:setItems({'Inexistente','Dormente','Despertado','Controlado'});
    obj.estadoConquistador:setValues({'I','Do','De','C'});
    obj.estadoConquistador:setHorzTextAlign("leading");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout9);
    obj.label74:setLeft(262);
    obj.label74:setTop(423);
    obj.label74:setWidth(256);
    obj.label74:setText("Condição:");
    obj.label74:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label74, "fontStyle", "bold");
    obj.label74:setFontSize(15);
    obj.label74:setName("label74");

    obj.rectangle155 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle155:setParent(obj.layout9);
    obj.rectangle155:setLeft(335);
    obj.rectangle155:setTop(424);
    obj.rectangle155:setWidth(80);
    obj.rectangle155:setHeight(18);
    obj.rectangle155:setColor("#F5F5DC");
    obj.rectangle155:setXradius(7);
    obj.rectangle155:setYradius(7);
    obj.rectangle155:setName("rectangle155");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout9);
    obj.comboBox3:setField("CondConquistador");
    obj.comboBox3:setLeft(331);
    obj.comboBox3:setTop(421);
    obj.comboBox3:setWidth(85);
    obj.comboBox3:setTransparent(true);
    obj.comboBox3:setFontColor("black");
    obj.comboBox3:setItems({'Normal','Avançado'});
    obj.comboBox3:setValues({'N','A'});
    obj.comboBox3:setHorzTextAlign("leading");
    obj.comboBox3:setName("comboBox3");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout9);
    obj.label75:setLeft(152);
    obj.label75:setTop(448);
    obj.label75:setWidth(256);
    obj.label75:setText("Custo:");
    obj.label75:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label75, "fontStyle", "bold");
    obj.label75:setFontSize(12);
    obj.label75:setName("label75");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout9);
    obj.label76:setField("CustoConquistador");
    obj.label76:setLeft(193);
    obj.label76:setTop(448);
    obj.label76:setWidth(237);
    obj.label76:setHeight(40);
    obj.label76:setFontColor("#5F9EA0");
    obj.label76:setFontSize(11);
    obj.label76:setVertTextAlign("leading");
    obj.label76:setName("label76");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout9);
    obj.label77:setLeft(152);
    obj.label77:setTop(468);
    obj.label77:setWidth(256);
    obj.label77:setText("Bônus:");
    obj.label77:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label77, "fontStyle", "bold");
    obj.label77:setFontSize(12);
    obj.label77:setName("label77");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout9);
    obj.label78:setField("BonusConquistador");
    obj.label78:setLeft(192);
    obj.label78:setTop(468);
    obj.label78:setWidth(237);
    obj.label78:setHeight(60);
    obj.label78:setFontColor("#5F9EA0");
    obj.label78:setFontSize(11);
    obj.label78:setVertTextAlign("leading");
    obj.label78:setName("label78");

    obj.Equipamento = GUI.fromHandle(_obj_newObject("layout"));
    obj.Equipamento:setParent(obj.Atributos);
    obj.Equipamento:setName("Equipamento");
    obj.Equipamento:setLeft(600);
    obj.Equipamento:setTop(150);
    obj.Equipamento:setWidth(600);
    obj.Equipamento:setHeight(550);
    obj.Equipamento:setVisible(false);

    obj.rectangle156 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle156:setParent(obj.Equipamento);
    obj.rectangle156:setAlign("client");
    obj.rectangle156:setColor("#404040");
    obj.rectangle156:setXradius(7);
    obj.rectangle156:setYradius(7);
    obj.rectangle156:setName("rectangle156");

    obj.buttonSair = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.buttonSair:setParent(obj.Equipamento);
    obj.buttonSair:setName("buttonSair");
    obj.buttonSair:setLeft(530);
    obj.buttonSair:setTop(2);
    obj.buttonSair:setWidth(60);
    obj.buttonSair:setHeight(25);
    obj.buttonSair:setColor("crimson");
    obj.buttonSair:setXradius(7);
    obj.buttonSair:setYradius(7);

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.Equipamento);
    obj.label79:setLeft(530);
    obj.label79:setTop(-1);
    obj.label79:setWidth(60);
    obj.label79:setHeight(25);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setText("x");
    obj.label79:setFontColor("Black");
    obj.label79:setFontSize(21);
    obj.label79:setName("label79");

    obj.rectangle157 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle157:setParent(obj.Equipamento);
    obj.rectangle157:setLeft(1);
    obj.rectangle157:setTop(28);
    obj.rectangle157:setWidth(208);
    obj.rectangle157:setHeight(520);
    obj.rectangle157:setColor("black");
    obj.rectangle157:setXradius(4);
    obj.rectangle157:setYradius(4);
    obj.rectangle157:setName("rectangle157");

    obj.rectangle158 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle158:setParent(obj.Equipamento);
    obj.rectangle158:setLeft(5);
    obj.rectangle158:setTop(32);
    obj.rectangle158:setWidth(200);
    obj.rectangle158:setHeight(512);
    obj.rectangle158:setColor("#404040");
    obj.rectangle158:setXradius(4);
    obj.rectangle158:setYradius(4);
    obj.rectangle158:setName("rectangle158");

    obj.fotoEquip = GUI.fromHandle(_obj_newObject("image"));
    obj.fotoEquip:setParent(obj.Equipamento);
    obj.fotoEquip:setName("fotoEquip");
    obj.fotoEquip:setLeft(5);
    obj.fotoEquip:setTop(32);
    obj.fotoEquip:setWidth(50);
    obj.fotoEquip:setHeight(128);
    obj.fotoEquip:setScale(4);
    obj.fotoEquip:setEditable(true);
    obj.fotoEquip:setStyle("proportional");

    obj.rectangle159 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle159:setParent(obj.Equipamento);
    obj.rectangle159:setLeft(205);
    obj.rectangle159:setTop(28);
    obj.rectangle159:setWidth(5);
    obj.rectangle159:setHeight(520);
    obj.rectangle159:setColor("black");
    obj.rectangle159:setName("rectangle159");

    obj.editEquip = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.editEquip:setParent(obj.Equipamento);
    obj.editEquip:setName("editEquip");
    obj.editEquip:setField("");
    obj.editEquip:setLeft(210);
    obj.editEquip:setTop(28);
    obj.editEquip:setWidth(390);
    obj.editEquip:setHeight(520);
    obj.editEquip.backgroundColor = "black";
    obj.editEquip.defaultFontColor = "white";
    obj.editEquip.animateImages = true;

    obj.Haki = GUI.fromHandle(_obj_newObject("layout"));
    obj.Haki:setParent(obj.Atributos);
    obj.Haki:setName("Haki");
    obj.Haki:setLeft(600);
    obj.Haki:setTop(150);
    obj.Haki:setWidth(600);
    obj.Haki:setHeight(550);
    obj.Haki:setVisible(false);

    obj.rectangle160 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle160:setParent(obj.Haki);
    obj.rectangle160:setAlign("client");
    obj.rectangle160:setColor("#404040");
    obj.rectangle160:setXradius(7);
    obj.rectangle160:setYradius(7);
    obj.rectangle160:setName("rectangle160");

    obj.buttonExit = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.buttonExit:setParent(obj.Haki);
    obj.buttonExit:setName("buttonExit");
    obj.buttonExit:setLeft(530);
    obj.buttonExit:setTop(2);
    obj.buttonExit:setWidth(60);
    obj.buttonExit:setHeight(25);
    obj.buttonExit:setColor("crimson");
    obj.buttonExit:setXradius(7);
    obj.buttonExit:setYradius(7);

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.Haki);
    obj.label80:setLeft(530);
    obj.label80:setTop(-1);
    obj.label80:setWidth(60);
    obj.label80:setHeight(25);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setText("x");
    obj.label80:setFontColor("Black");
    obj.label80:setFontSize(21);
    obj.label80:setName("label80");

    obj.editHaki = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.editHaki:setParent(obj.Haki);
    obj.editHaki:setName("editHaki");
    obj.editHaki:setField("");
    obj.editHaki:setLeft(2);
    obj.editHaki:setTop(30);
    obj.editHaki:setWidth(598);
    obj.editHaki:setHeight(520);
    obj.editHaki.backgroundColor = "#404040";
    obj.editHaki.defaultFontColor = "white";
    obj.editHaki.animateImages = true;
    obj.editHaki.readOnly = false;
    obj.editHaki.showToolbar = true;

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.Atributos);
    obj.dataLink17:setField("ForcaBase");
    obj.dataLink17:setDefaultValue("1");
    obj.dataLink17:setName("dataLink17");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.Atributos);
    obj.dataLink18:setField("AgilidadeBase");
    obj.dataLink18:setDefaultValue("1");
    obj.dataLink18:setName("dataLink18");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.Atributos);
    obj.dataLink19:setField("VigorBase");
    obj.dataLink19:setDefaultValue("1");
    obj.dataLink19:setName("dataLink19");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.Atributos);
    obj.dataLink20:setField("CombateBase");
    obj.dataLink20:setDefaultValue("1");
    obj.dataLink20:setName("dataLink20");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.Atributos);
    obj.dataLink21:setField("PercepcaoBase");
    obj.dataLink21:setDefaultValue("1");
    obj.dataLink21:setName("dataLink21");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.Atributos);
    obj.dataLink22:setField("CarismaBase");
    obj.dataLink22:setDefaultValue("1");
    obj.dataLink22:setName("dataLink22");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.Atributos);
    obj.dataLink23:setField("InteligenciaBase");
    obj.dataLink23:setDefaultValue("1");
    obj.dataLink23:setName("dataLink23");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.Atributos);
    obj.dataLink24:setField("PrecisaoBase");
    obj.dataLink24:setDefaultValue("1");
    obj.dataLink24:setName("dataLink24");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.Atributos);
    obj.dataLink25:setField("ForcaDeVontadeBase");
    obj.dataLink25:setDefaultValue("1");
    obj.dataLink25:setName("dataLink25");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.Atributos);
    obj.dataLink26:setField("ForcaPassivo");
    obj.dataLink26:setDefaultValue("0");
    obj.dataLink26:setName("dataLink26");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.Atributos);
    obj.dataLink27:setField("AgilidadePassivo");
    obj.dataLink27:setDefaultValue("0");
    obj.dataLink27:setName("dataLink27");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.Atributos);
    obj.dataLink28:setField("VigorPassivo");
    obj.dataLink28:setDefaultValue("0");
    obj.dataLink28:setName("dataLink28");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.Atributos);
    obj.dataLink29:setField("CombatePassivo");
    obj.dataLink29:setDefaultValue("0");
    obj.dataLink29:setName("dataLink29");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.Atributos);
    obj.dataLink30:setField("PercepcaoPassivo");
    obj.dataLink30:setDefaultValue("0");
    obj.dataLink30:setName("dataLink30");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.Atributos);
    obj.dataLink31:setField("CarismaPassivo");
    obj.dataLink31:setDefaultValue("0");
    obj.dataLink31:setName("dataLink31");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.Atributos);
    obj.dataLink32:setField("InteligenciaPassivo");
    obj.dataLink32:setDefaultValue("0");
    obj.dataLink32:setName("dataLink32");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.Atributos);
    obj.dataLink33:setField("PrecisaoPassivo");
    obj.dataLink33:setDefaultValue("0");
    obj.dataLink33:setName("dataLink33");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.Atributos);
    obj.dataLink34:setField("ForcaDeVontadePassivo");
    obj.dataLink34:setDefaultValue("0");
    obj.dataLink34:setName("dataLink34");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.Atributos);
    obj.dataLink35:setField("ForcaEquips");
    obj.dataLink35:setDefaultValue("0");
    obj.dataLink35:setName("dataLink35");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.Atributos);
    obj.dataLink36:setField("AgilidadeEquips");
    obj.dataLink36:setDefaultValue("0");
    obj.dataLink36:setName("dataLink36");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.Atributos);
    obj.dataLink37:setField("VigorEquips");
    obj.dataLink37:setDefaultValue("0");
    obj.dataLink37:setName("dataLink37");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.Atributos);
    obj.dataLink38:setField("CombateEquips");
    obj.dataLink38:setDefaultValue("0");
    obj.dataLink38:setName("dataLink38");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.Atributos);
    obj.dataLink39:setField("PercepcaoEquips");
    obj.dataLink39:setDefaultValue("0");
    obj.dataLink39:setName("dataLink39");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.Atributos);
    obj.dataLink40:setField("CarismaEquips");
    obj.dataLink40:setDefaultValue("0");
    obj.dataLink40:setName("dataLink40");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.Atributos);
    obj.dataLink41:setField("InteligenciaEquips");
    obj.dataLink41:setDefaultValue("0");
    obj.dataLink41:setName("dataLink41");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.Atributos);
    obj.dataLink42:setField("PrecisaoEquips");
    obj.dataLink42:setDefaultValue("0");
    obj.dataLink42:setName("dataLink42");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.Atributos);
    obj.dataLink43:setField("ForcaDeVontadeEquips");
    obj.dataLink43:setDefaultValue("0");
    obj.dataLink43:setName("dataLink43");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.Atributos);
    obj.dataLink44:setField("ForcaTreino");
    obj.dataLink44:setDefaultValue("0");
    obj.dataLink44:setName("dataLink44");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.Atributos);
    obj.dataLink45:setField("AgilidadeTreino");
    obj.dataLink45:setDefaultValue("0");
    obj.dataLink45:setName("dataLink45");

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.Atributos);
    obj.dataLink46:setField("VigorTreino");
    obj.dataLink46:setDefaultValue("0");
    obj.dataLink46:setName("dataLink46");

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.Atributos);
    obj.dataLink47:setField("CombateTreino");
    obj.dataLink47:setDefaultValue("0");
    obj.dataLink47:setName("dataLink47");

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.Atributos);
    obj.dataLink48:setField("PercepcaoTreino");
    obj.dataLink48:setDefaultValue("0");
    obj.dataLink48:setName("dataLink48");

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.Atributos);
    obj.dataLink49:setField("CarismaTreino");
    obj.dataLink49:setDefaultValue("0");
    obj.dataLink49:setName("dataLink49");

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.Atributos);
    obj.dataLink50:setField("InteligenciaTreino");
    obj.dataLink50:setDefaultValue("0");
    obj.dataLink50:setName("dataLink50");

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.Atributos);
    obj.dataLink51:setField("PrecisaoTreino");
    obj.dataLink51:setDefaultValue("0");
    obj.dataLink51:setName("dataLink51");

    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.Atributos);
    obj.dataLink52:setField("ForcaDeVontadeTreino");
    obj.dataLink52:setDefaultValue("0");
    obj.dataLink52:setName("dataLink52");

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.Atributos);
    obj.dataLink53:setField("FotoChapeu");
    obj.dataLink53:setDefaultValue("https://blob.firecast.com.br/blobs/BSEWIEVG_3735362/Chapeu.png");
    obj.dataLink53:setName("dataLink53");

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.Atributos);
    obj.dataLink54:setField("FotoColar");
    obj.dataLink54:setDefaultValue("https://blob.firecast.com.br/blobs/ELGUBICD_3735361/Colar.png");
    obj.dataLink54:setName("dataLink54");

    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.Atributos);
    obj.dataLink55:setField("FotoRoupa");
    obj.dataLink55:setDefaultValue("https://blob.firecast.com.br/blobs/SIRPGIRT_3735359/Ropa.png");
    obj.dataLink55:setName("dataLink55");

    obj.dataLink56 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.Atributos);
    obj.dataLink56:setField("FotoMaoPrimaria");
    obj.dataLink56:setDefaultValue("https://blob.firecast.com.br/blobs/SMOQJGJO_3735363/M_o.png");
    obj.dataLink56:setName("dataLink56");

    obj.dataLink57 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.Atributos);
    obj.dataLink57:setField("FotoCalca");
    obj.dataLink57:setDefaultValue("https://blob.firecast.com.br/blobs/TQPAWOQT_3735360/Car_a.png");
    obj.dataLink57:setName("dataLink57");

    obj.dataLink58 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.Atributos);
    obj.dataLink58:setField("FotoBota");
    obj.dataLink58:setDefaultValue("https://blob.firecast.com.br/blobs/OHNVCDNS_3735367/Bota.png");
    obj.dataLink58:setName("dataLink58");

    obj.dataLink59 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.Atributos);
    obj.dataLink59:setField("FotoRosto");
    obj.dataLink59:setDefaultValue("https://blob.firecast.com.br/blobs/NHQFHSIH_3735364/Mascara.png");
    obj.dataLink59:setName("dataLink59");

    obj.dataLink60 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.Atributos);
    obj.dataLink60:setField("FotoBrinco");
    obj.dataLink60:setDefaultValue("https://blob.firecast.com.br/blobs/LQUKWDCJ_3735365/Binco.png");
    obj.dataLink60:setName("dataLink60");

    obj.dataLink61 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.Atributos);
    obj.dataLink61:setField("FotoCapa");
    obj.dataLink61:setDefaultValue("https://blob.firecast.com.br/blobs/SEKLBTCI_3735802/Kapa.png");
    obj.dataLink61:setName("dataLink61");

    obj.dataLink62 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink62:setParent(obj.Atributos);
    obj.dataLink62:setField("FotoMaoSecundaria");
    obj.dataLink62:setDefaultValue("https://blob.firecast.com.br/blobs/RRQKGODJ_3735460/M_o.png");
    obj.dataLink62:setName("dataLink62");

    obj.dataLink63 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink63:setParent(obj.Atributos);
    obj.dataLink63:setField("FotoLuva");
    obj.dataLink63:setDefaultValue("https://blob.firecast.com.br/blobs/BCNCKKRT_3735366/Luva.png");
    obj.dataLink63:setName("dataLink63");

    obj.dataLink64 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink64:setParent(obj.Atributos);
    obj.dataLink64:setField("FotoAnel");
    obj.dataLink64:setDefaultValue("https://blob.firecast.com.br/blobs/QLBWNJUT_3735368/Anal.png");
    obj.dataLink64:setName("dataLink64");

    obj.dataLink65 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink65:setParent(obj.Atributos);
    obj.dataLink65:setField("tierArmamento");
    obj.dataLink65:setDefaultValue("0");
    obj.dataLink65:setName("dataLink65");

    obj.dataLink66 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink66:setParent(obj.Atributos);
    obj.dataLink66:setField("EstadoArmamento");
    obj.dataLink66:setDefaultValue("I");
    obj.dataLink66:setName("dataLink66");

    obj.dataLink67 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink67:setParent(obj.Atributos);
    obj.dataLink67:setField("upArmamento");
    obj.dataLink67:setDefaultValue("0");
    obj.dataLink67:setName("dataLink67");

    obj.dataLink68 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink68:setParent(obj.Atributos);
    obj.dataLink68:setField("CondArmamento");
    obj.dataLink68:setDefaultValue("N");
    obj.dataLink68:setName("dataLink68");

    obj.dataLink69 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink69:setParent(obj.Atributos);
    obj.dataLink69:setField("tierObservacao");
    obj.dataLink69:setDefaultValue("0");
    obj.dataLink69:setName("dataLink69");

    obj.dataLink70 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink70:setParent(obj.Atributos);
    obj.dataLink70:setField("EstadoObservacao");
    obj.dataLink70:setDefaultValue("I");
    obj.dataLink70:setName("dataLink70");

    obj.dataLink71 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink71:setParent(obj.Atributos);
    obj.dataLink71:setField("upObsevacao");
    obj.dataLink71:setDefaultValue("0");
    obj.dataLink71:setName("dataLink71");

    obj.dataLink72 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink72:setParent(obj.Atributos);
    obj.dataLink72:setField("CondObsevacao");
    obj.dataLink72:setDefaultValue("N");
    obj.dataLink72:setName("dataLink72");

    obj.dataLink73 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink73:setParent(obj.Atributos);
    obj.dataLink73:setField("tierConquistador");
    obj.dataLink73:setDefaultValue("0");
    obj.dataLink73:setName("dataLink73");

    obj.dataLink74 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink74:setParent(obj.Atributos);
    obj.dataLink74:setField("EstadoConquistador");
    obj.dataLink74:setDefaultValue("I");
    obj.dataLink74:setName("dataLink74");

    obj.dataLink75 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink75:setParent(obj.Atributos);
    obj.dataLink75:setField("upConquistador");
    obj.dataLink75:setDefaultValue("0");
    obj.dataLink75:setName("dataLink75");

    obj.dataLink76 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink76:setParent(obj.Atributos);
    obj.dataLink76:setField("CondConquistador");
    obj.dataLink76:setDefaultValue("N");
    obj.dataLink76:setName("dataLink76");

    obj.tab9 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl1);
    obj.tab9:setTitle("Estilo de Luta & Akuma");
    obj.tab9:setName("tab9");

    obj.EdLeAkuma = GUI.fromHandle(_obj_newObject("form"));
    obj.EdLeAkuma:setParent(obj.tab9);
    obj.EdLeAkuma:setFormType("sheetTemplate");
    obj.EdLeAkuma:setTitle("Brincadeiras Em Alto Mar");
    obj.EdLeAkuma:setName("EdLeAkuma");

    obj.rectangle161 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle161:setParent(obj.EdLeAkuma);
    obj.rectangle161:setLeft(0);
    obj.rectangle161:setTop(0);
    obj.rectangle161:setWidth(10000);
    obj.rectangle161:setHeight(10000);
    obj.rectangle161:setColor("black");
    obj.rectangle161:setName("rectangle161");


	EdLImagens = {
		BlackLeg = {
			imagem = "https://media.tenor.com/0qQyt427SHkAAAAC/one-piece-sanji.gif"
		},
		BoFudoRyu = {
			imagem = "https://blob.firecast.com.br/blobs/WFPKKTJD_3733833/yamato.gif"
		},
		BoKenryu = {
			imagem = "https://blob.firecast.com.br/blobs/CJFVPMIU_3733719/Sem_t_tul13123123o.jpg"
		},
		Boxe = {
			imagem = "https://pa1.aminoapps.com/6326/b952dd643c8bc613840ce082d0927e2655803f5a_hq.gif"
		},
		Capoeira = {
			imagem = "https://blob.firecast.com.br/blobs/SLLOFDJF_3733730/dancing.gif"
		},
		ColorsTrap = {
			imagem = "https://media.tenor.com/t_HGhrVJns8AAAAM/one-piece-marianne.gif"
		},
		Demonharubado = {
			imagem = "https://pa1.narvii.com/6868/542b309968267825692736c8674ce0b6fcc67a1ar1-500-281_hq.gif"
		},
		EngeinoFureteRyu = {
			imagem = "https://blob.firecast.com.br/blobs/FKTCTWGL_3733800/sword.gif"
		},
		FrogLeg = {
			imagem = "https://blob.firecast.com.br/blobs/KBFNPWKL_3702865/greninja-pokemon.gif"
		},
		Hachitoryu = {
			imagem = "https://onepiecebytheghosthunter.weebly.com/uploads/2/7/1/1/27112571/2940841_orig.jpg"
		},
		HaganeNoKiba = {
			imagem = "https://blob.firecast.com.br/blobs/HSWHCKOE_3733810/matchups-for-vega-balrog-street-fighter-v0.gif"
		},
		Hasshoken = {
			imagem = "https://pa1.narvii.com/6411/0f53e382be8557160d2d5cf570f38afe62225ea8_hq.gif"
		},
		Ittoryu = {
			imagem = "https://media.tenor.com/tgevhaBd3g0AAAAC/ittoryu.gif"
		},
		JaoKunDo = {
			imagem = "https://media.tenor.com/QxEuc6YNYf8AAAAd/jao-kun-do.gif"
		},
		JioKen = {
			imagem = "https://blob.firecast.com.br/blobs/TPQAWDPD_3727751/tumblr_nfh452KyYK1rr37qoo4_r1_500.gif"
		},
		KarateTritao = {
			imagem = "https://pa1.narvii.com/6708/34262be4d9d8776b5a5b0b073374450b30eecbcf_hq.gif"
		},
		Kapparyu = {
			imagem = "https://media.tenor.com/q2PHPRDB9TwAAAAC/amano-gawa-kawamatsu.gif"
		},
		KenkinoGattsu = {
			imagem = "http://blob.firecast.com.br/blobs/CEMKQKNK_3065178/guts-berserk.gif"
		},
		KikaiKoboRyu = {
			imagem = "https://blob.firecast.com.br/blobs/OOHIHPTD_3733191/stark-frieren.gif"
		},
		Kitsunebiryu = {
			imagem = "https://blob.firecast.com.br/blobs/HPKTINEF_3637389/e8cb549a0e3b80058a21110154e3f6ff6adc22e7_h.gif"
		},
		KoenoEnseiRyu = {
			imagem = "https://giffiles.alphacoders.com/136/136090.gif"
		},
		KosenjuRyu = {
			imagem = "https://pa1.aminoapps.com/6264/eecfa19e2fd02dcddfd20b58dc6d3f1f76fd8c9f_hq.gif"
		},
		Kyokugi = {
			imagem = "http://blob.firecast.com.br/blobs/UVBHBWGK_3110025/00_-_Kyokugi_Apresentacao.gif"
		},
		MermanCombat = {
			imagem = "https://static.wikia.nocookie.net/powerlisting/images/4/4e/Merman_Combat_Ultramarine_2_%28One_Piece%29.gif/revision/latest/scale-to-width-down/250?cb=20180707050855"
		},
		NingyoGujutsu = {
			imagem = "https://blob.firecast.com.br/blobs/KNHEGOEM_3733080/images.jpg"
		},
		Nitoryu = {
			imagem = "https://media.tenor.com/Ztnilz9RI6UAAAAd/oden-nitoryu-oden-two-sword-style.gif"
		},
		OkamaKenpo = {
			imagem = "https://pa1.narvii.com/7230/3b4538d2abcf8f8cc99f7b1a50490053be678b30r1-435-250_hq.gif"
		},
		RairyuuRyu = {
			imagem = "https://blob.firecast.com.br/blobs/AIKOQSUR_3391738/lancer-fate-diarmuid.gif"
		},
		RamenKenpo = {
			imagem = "http://blob.firecast.com.br/blobs/AOUWPLSN_3076631/one-piece-wanze.gif"
		},
		ReitetsunoKen = {
			imagem = "http://blob.firecast.com.br/blobs/PRCKFKTL_3110154/00_-_Reitetsu_no_Ken_Apresentacao.gif"
		},
		Rokushiki = {
			imagem = "https://static.wikia.nocookie.net/onepiece/images/6/65/Rankyaku.gif/revision/latest?cb=20160626195046&path-prefix=pt"
		},
		Rokutoryu = {
			imagem = "http://blob.firecast.com.br/blobs/HBRCSGEV_2627847/6437283b9f3d3e1e0105375f.jpg"
		},
		Ryusoken = {
			imagem = "https://static.wikia.nocookie.net/onepiece/images/b/b5/Punho_da_Garra_do_Drag%C3%A3o.gif/revision/latest?cb=20160415153631&path-prefix=pt"
		},
		Sakejutsu = {
			imagem = "http://blob.firecast.com.br/blobs/WWPNLULN_3210353/naruto-rock-lee.gif"
		},
		Santoryu = {
			imagem = "https://media.tenor.com/QIzUoOtRWGgAAAAC/one-piece-santoryu.gif"
		},
		SeiginoTokenRyu = {
			imagem = "http://blob.firecast.com.br/blobs/LREEFFNW_3133574/one-piece-justice.gif"
		},
		Senritsuken = {
			imagem = "https://64.media.tumblr.com/7e14767ef57464e24be00c23bb7b8a68/cd199a8845b2618e-62/s640x960/ea553ade2692a9b29750f291ef0585c87ffaa10b.gif"
		},
		SonGokunoUgoki = {
			imagem = "https://steamuserimages-a.akamaihd.net/ugc/608350301004475238/027316ACF082A6EFC7EAEFDA6CEABE092EA70BE1/?imw=5000&imh=5000&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false"
		},
		StreetBrawling = {
			imagem = "https://i0.wp.com/the-avocado.org/wp-content/uploads/2020/07/0d2f2e25384393037370749e50b9a82c.gif?fit=500%2C269&ssl=1"
		},
		SumoRyu = {
			imagem = "https://64.media.tumblr.com/3289a22883915af6d0829451f0d33426/tumblr_pjfc9i5Rr81sau2q2o2_640.gif"
		},
		TatenoMamoriRyu = {
			imagem = "https://blob.firecast.com.br/blobs/OKQFBLVC_3039337/braum-lol.gif"
		},
		TenshiNunchakuRyu = {
			imagem = "https://pa1.aminoapps.com/6543/2b523ace978ad8b0366019e9b1f8fd20a3a4eeed_00.gif"
		},
		TeppanyakinoKen = {
			imagem = "http://blob.firecast.com.br/blobs/CTPNDVHM_3076650/black-butler-sebastian.gif"
		},
		TontattaCombat = {
			imagem = "https://blob.firecast.com.br/blobs/KLBHRSKN_3702972/123.jpg"
		},
		Tokarado = {
			imagem = "https://i.pinimg.com/originals/e9/65/a8/e965a8c9e5c755cefdcd034f0e3a20bf.gif"
		},
		Tsuinburedo = {
			imagem = "https://media.tenor.com/7wqsMTZpOGkAAAAM/darth-maul.gif"
		},
		Yontoryu = {
			imagem = "https://media.tenor.com/8fumyVdhRJ8AAAAC/kaku-one-piece.gif"
		}
	}
	


    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.EdLeAkuma);
    obj.layout10:setLeft(12);
    obj.layout10:setTop(12);
    obj.layout10:setWidth(175);
    obj.layout10:setHeight(525);
    obj.layout10:setName("layout10");

    obj.rectangle162 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle162:setParent(obj.layout10);
    obj.rectangle162:setLeft(0);
    obj.rectangle162:setTop(0);
    obj.rectangle162:setWidth(175);
    obj.rectangle162:setHeight(525);
    obj.rectangle162:setColor("#4169E1");
    obj.rectangle162:setName("rectangle162");

    obj.rectangle163 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle163:setParent(obj.layout10);
    obj.rectangle163:setLeft(2);
    obj.rectangle163:setTop(2);
    obj.rectangle163:setWidth(171);
    obj.rectangle163:setHeight(521);
    obj.rectangle163:setColor("black");
    obj.rectangle163:setName("rectangle163");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout10);
    obj.label81:setLeft(10);
    obj.label81:setTop(10);
    obj.label81:setWidth(155);
    obj.label81:setHeight(25);
    obj.label81:setText("Estilo De Luta");
    obj.label81:setFontSize(18);
    lfm_setPropAsString(obj.label81, "fontStyle", "bold underline");
    obj.label81:setFontColor("#5F9EA0");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.rectangle164 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle164:setParent(obj.layout10);
    obj.rectangle164:setLeft(10);
    obj.rectangle164:setTop(40);
    obj.rectangle164:setWidth(155);
    obj.rectangle164:setHeight(105);
    obj.rectangle164:setColor("#F5F5DC");
    obj.rectangle164:setName("rectangle164");

    obj.EstLuta = GUI.fromHandle(_obj_newObject("edit"));
    obj.EstLuta:setParent(obj.layout10);
    obj.EstLuta:setName("EstLuta");
    obj.EstLuta:setLeft(12);
    obj.EstLuta:setTop(119);
    obj.EstLuta:setWidth(151);
    obj.EstLuta:setHeight(24);
    obj.EstLuta:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.EstLuta, "fontStyle", "bold");
    obj.EstLuta:setHorzTextAlign("center");

    obj.rectangle165 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle165:setParent(obj.layout10);
    obj.rectangle165:setLeft(12);
    obj.rectangle165:setTop(42);
    obj.rectangle165:setWidth(151);
    obj.rectangle165:setHeight(77);
    obj.rectangle165:setColor("black");
    obj.rectangle165:setName("rectangle165");

    obj.imagemEdL = GUI.fromHandle(_obj_newObject("image"));
    obj.imagemEdL:setParent(obj.layout10);
    obj.imagemEdL:setField("imagemEdL");
    obj.imagemEdL:setName("imagemEdL");
    obj.imagemEdL:setLeft(12);
    obj.imagemEdL:setTop(42);
    obj.imagemEdL:setWidth(151);
    obj.imagemEdL:setHeight(77);
    obj.imagemEdL:setEditable(true);
    obj.imagemEdL.animate = true;
    obj.imagemEdL:setStyle("autoFit");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout10);
    obj.button22:setLeft(12);
    obj.button22:setTop(42);
    obj.button22:setWidth(40);
    obj.button22:setHeight(20);
    obj.button22:setText("Ver");
    obj.button22:setName("button22");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout10);
    obj.label82:setLeft(10);
    obj.label82:setTop(159);
    obj.label82:setWidth(155);
    obj.label82:setHeight(25);
    obj.label82:setText("Akuma no Mi");
    obj.label82:setFontSize(18);
    lfm_setPropAsString(obj.label82, "fontStyle", "bold underline");
    obj.label82:setFontColor("#5F9EA0");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.rectangle166 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle166:setParent(obj.layout10);
    obj.rectangle166:setLeft(10);
    obj.rectangle166:setTop(189);
    obj.rectangle166:setWidth(155);
    obj.rectangle166:setHeight(105);
    obj.rectangle166:setColor("#F5F5DC");
    obj.rectangle166:setName("rectangle166");

    obj.Akuma = GUI.fromHandle(_obj_newObject("edit"));
    obj.Akuma:setParent(obj.layout10);
    obj.Akuma:setName("Akuma");
    obj.Akuma:setField("Akuma");
    obj.Akuma:setLeft(12);
    obj.Akuma:setTop(268);
    obj.Akuma:setWidth(151);
    obj.Akuma:setHeight(24);
    obj.Akuma:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.Akuma, "fontStyle", "bold");
    obj.Akuma:setFontSize(10);
    obj.Akuma:setHorzTextAlign("center");

    obj.rectangle167 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle167:setParent(obj.layout10);
    obj.rectangle167:setLeft(12);
    obj.rectangle167:setTop(191);
    obj.rectangle167:setWidth(151);
    obj.rectangle167:setHeight(77);
    obj.rectangle167:setColor("black");
    obj.rectangle167:setName("rectangle167");

    obj.image20 = GUI.fromHandle(_obj_newObject("image"));
    obj.image20:setParent(obj.layout10);
    obj.image20:setField("imagemAkuma");
    obj.image20:setLeft(12);
    obj.image20:setTop(191);
    obj.image20:setWidth(151);
    obj.image20:setHeight(77);
    obj.image20:setEditable(true);
    obj.image20.animate = true;
    obj.image20:setStyle("autoFit");
    obj.image20:setName("image20");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout10);
    obj.button23:setLeft(12);
    obj.button23:setTop(191);
    obj.button23:setWidth(40);
    obj.button23:setHeight(20);
    obj.button23:setText("Ver");
    obj.button23:setName("button23");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout10);
    obj.label83:setLeft(10);
    obj.label83:setTop(308);
    obj.label83:setWidth(155);
    obj.label83:setHeight(25);
    obj.label83:setText("Miscelânea");
    obj.label83:setFontSize(18);
    lfm_setPropAsString(obj.label83, "fontStyle", "bold underline");
    obj.label83:setFontColor("#5F9EA0");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.rectangle168 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle168:setParent(obj.layout10);
    obj.rectangle168:setLeft(10);
    obj.rectangle168:setTop(338);
    obj.rectangle168:setWidth(155);
    obj.rectangle168:setHeight(105);
    obj.rectangle168:setColor("#F5F5DC");
    obj.rectangle168:setName("rectangle168");

    obj.Misc = GUI.fromHandle(_obj_newObject("edit"));
    obj.Misc:setParent(obj.layout10);
    obj.Misc:setName("Misc");
    obj.Misc:setField("Misc");
    obj.Misc:setLeft(12);
    obj.Misc:setTop(417);
    obj.Misc:setWidth(151);
    obj.Misc:setHeight(24);
    obj.Misc:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.Misc, "fontStyle", "bold");
    obj.Misc:setHorzTextAlign("center");

    obj.rectangle169 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle169:setParent(obj.layout10);
    obj.rectangle169:setLeft(12);
    obj.rectangle169:setTop(340);
    obj.rectangle169:setWidth(151);
    obj.rectangle169:setHeight(77);
    obj.rectangle169:setColor("black");
    obj.rectangle169:setName("rectangle169");

    obj.image21 = GUI.fromHandle(_obj_newObject("image"));
    obj.image21:setParent(obj.layout10);
    obj.image21:setField("imagemMisc");
    obj.image21:setLeft(12);
    obj.image21:setTop(340);
    obj.image21:setWidth(151);
    obj.image21:setHeight(77);
    obj.image21:setEditable(true);
    obj.image21.animate = true;
    obj.image21:setStyle("autoFit");
    obj.image21:setName("image21");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout10);
    obj.button24:setLeft(12);
    obj.button24:setTop(340);
    obj.button24:setWidth(40);
    obj.button24:setHeight(20);
    obj.button24:setText("Ver");
    obj.button24:setName("button24");

    obj.EstilosDeLuta = GUI.fromHandle(_obj_newObject("layout"));
    obj.EstilosDeLuta:setParent(obj.EdLeAkuma);
    obj.EstilosDeLuta:setName("EstilosDeLuta");
    obj.EstilosDeLuta:setLeft(197);
    obj.EstilosDeLuta:setTop(12);
    obj.EstilosDeLuta:setWidth(1000);
    obj.EstilosDeLuta:setHeight(525);

    obj.rectangle170 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle170:setParent(obj.EstilosDeLuta);
    obj.rectangle170:setLeft(0);
    obj.rectangle170:setTop(0);
    obj.rectangle170:setWidth(1000);
    obj.rectangle170:setHeight(525);
    obj.rectangle170:setColor("#4169E1");
    obj.rectangle170:setName("rectangle170");

    obj.rectangle171 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle171:setParent(obj.EstilosDeLuta);
    obj.rectangle171:setLeft(2);
    obj.rectangle171:setTop(2);
    obj.rectangle171:setWidth(996);
    obj.rectangle171:setHeight(521);
    obj.rectangle171:setColor("black");
    obj.rectangle171:setName("rectangle171");

    obj.tabControl5 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl5:setParent(obj.EstilosDeLuta);
    obj.tabControl5:setLeft(2);
    obj.tabControl5:setTop(2);
    obj.tabControl5:setWidth(996);
    obj.tabControl5:setHeight(521);
    obj.tabControl5:setName("tabControl5");

    obj.tab10 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab10:setParent(obj.tabControl5);
    obj.tab10:setTitle("Principal");
    obj.tab10:setName("tab10");

    obj.rectangle172 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle172:setParent(obj.tab10);
    obj.rectangle172:setLeft(0);
    obj.rectangle172:setTop(0);
    obj.rectangle172:setWidth(996);
    obj.rectangle172:setHeight(525);
    obj.rectangle172:setColor("black");
    obj.rectangle172:setName("rectangle172");

    obj.estLPrincipal = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.estLPrincipal:setParent(obj.tab10);
    obj.estLPrincipal:setName("estLPrincipal");
    obj.estLPrincipal:setField("");
    obj.estLPrincipal:setAlign("client");
    obj.estLPrincipal.backgroundColor = "black";
    obj.estLPrincipal.defaultFontColor = "white";
    obj.estLPrincipal.animateImages = true;

    obj.estiloDeLuta = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.estiloDeLuta:setParent(obj.tab10);
    obj.estiloDeLuta:setField("estiloDeLuta");
    obj.estiloDeLuta:setName("estiloDeLuta");
    obj.estiloDeLuta:setValues(EdLSemCaracteresEspeciais);
    obj.estiloDeLuta:setLeft(750);
    obj.estiloDeLuta:setTop(1.2);
    obj.estiloDeLuta:setWidth(150);
    obj.estiloDeLuta:setHeight(29);
    obj.estiloDeLuta:setFontColor("white");
    obj.estiloDeLuta:setHorzTextAlign("center");
    obj.estiloDeLuta:setItems(EstilosDeLuta);

    obj.tab11 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab11:setParent(obj.tabControl5);
    obj.tab11:setTitle("Secundario");
    obj.tab11:setName("tab11");

    obj.rectangle173 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle173:setParent(obj.tab11);
    obj.rectangle173:setLeft(0);
    obj.rectangle173:setTop(0);
    obj.rectangle173:setWidth(996);
    obj.rectangle173:setHeight(525);
    obj.rectangle173:setColor("black");
    obj.rectangle173:setName("rectangle173");

    obj.estLSecundario = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.estLSecundario:setParent(obj.tab11);
    obj.estLSecundario:setName("estLSecundario");
    obj.estLSecundario:setAlign("client");
    obj.estLSecundario.backgroundColor = "black";
    obj.estLSecundario.defaultFontColor = "white";
    obj.estLSecundario.animateImages = true;

    obj.estiloDeLutaSec = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.estiloDeLutaSec:setParent(obj.tab11);
    obj.estiloDeLutaSec:setField("estiloDeLutaSec");
    obj.estiloDeLutaSec:setName("estiloDeLutaSec");
    obj.estiloDeLutaSec:setValues(EdLSemCaracteresEspeciais);
    obj.estiloDeLutaSec:setLeft(750);
    obj.estiloDeLutaSec:setTop(1.2);
    obj.estiloDeLutaSec:setWidth(150);
    obj.estiloDeLutaSec:setHeight(29);
    obj.estiloDeLutaSec:setFontColor("white");
    obj.estiloDeLutaSec:setHorzTextAlign("center");
    obj.estiloDeLutaSec:setItems(EstilosDeLuta);

    obj.AkumaLayout = GUI.fromHandle(_obj_newObject("layout"));
    obj.AkumaLayout:setParent(obj.EdLeAkuma);
    obj.AkumaLayout:setName("AkumaLayout");
    obj.AkumaLayout:setLeft(197);
    obj.AkumaLayout:setTop(12);
    obj.AkumaLayout:setWidth(1000);
    obj.AkumaLayout:setHeight(525);
    obj.AkumaLayout:setVisible(false);

    obj.rectangle174 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle174:setParent(obj.AkumaLayout);
    obj.rectangle174:setLeft(0);
    obj.rectangle174:setTop(0);
    obj.rectangle174:setWidth(1000);
    obj.rectangle174:setHeight(525);
    obj.rectangle174:setColor("#4169E1");
    obj.rectangle174:setName("rectangle174");

    obj.rectangle175 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle175:setParent(obj.AkumaLayout);
    obj.rectangle175:setLeft(2);
    obj.rectangle175:setTop(2);
    obj.rectangle175:setWidth(996);
    obj.rectangle175:setHeight(521);
    obj.rectangle175:setColor("black");
    obj.rectangle175:setName("rectangle175");

    obj.tabControl6 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl6:setParent(obj.AkumaLayout);
    obj.tabControl6:setLeft(2);
    obj.tabControl6:setTop(2);
    obj.tabControl6:setWidth(996);
    obj.tabControl6:setHeight(521);
    obj.tabControl6:setName("tabControl6");

    obj.tab12 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab12:setParent(obj.tabControl6);
    obj.tab12:setTitle("Descrição");
    obj.tab12:setName("tab12");

    obj.richEdit3 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.tab12);
    obj.richEdit3:setField("editDescri");
    obj.richEdit3:setWidth(996);
    obj.richEdit3:setHeight(521);
    obj.richEdit3.backgroundColor = "black";
    obj.richEdit3.defaultFontColor = "white";
    obj.richEdit3.animateImages = true;
    obj.richEdit3:setName("richEdit3");

    obj.tab13 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab13:setParent(obj.tabControl6);
    obj.tab13:setTitle("Formas");
    obj.tab13:setName("tab13");

    obj.richEdit4 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit4:setParent(obj.tab13);
    obj.richEdit4:setField("editFormas");
    obj.richEdit4:setWidth(996);
    obj.richEdit4:setHeight(521);
    obj.richEdit4.backgroundColor = "black";
    obj.richEdit4.defaultFontColor = "white";
    obj.richEdit4.animateImages = true;
    obj.richEdit4:setName("richEdit4");

    obj.tab14 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab14:setParent(obj.tabControl6);
    obj.tab14:setTitle("Golpes");
    obj.tab14:setName("tab14");

    obj.richEdit5 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit5:setParent(obj.tab14);
    obj.richEdit5:setField("editGolpes");
    obj.richEdit5:setWidth(996);
    obj.richEdit5:setHeight(521);
    obj.richEdit5.backgroundColor = "black";
    obj.richEdit5.defaultFontColor = "white";
    obj.richEdit5.animateImages = true;
    obj.richEdit5:setName("richEdit5");

    obj.MiscLayout = GUI.fromHandle(_obj_newObject("layout"));
    obj.MiscLayout:setParent(obj.EdLeAkuma);
    obj.MiscLayout:setName("MiscLayout");
    obj.MiscLayout:setLeft(197);
    obj.MiscLayout:setTop(12);
    obj.MiscLayout:setWidth(1000);
    obj.MiscLayout:setHeight(525);
    obj.MiscLayout:setVisible(false);

    obj.rectangle176 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle176:setParent(obj.MiscLayout);
    obj.rectangle176:setLeft(0);
    obj.rectangle176:setTop(0);
    obj.rectangle176:setWidth(1000);
    obj.rectangle176:setHeight(525);
    obj.rectangle176:setColor("#4169E1");
    obj.rectangle176:setName("rectangle176");

    obj.rectangle177 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle177:setParent(obj.MiscLayout);
    obj.rectangle177:setLeft(2);
    obj.rectangle177:setTop(2);
    obj.rectangle177:setWidth(996);
    obj.rectangle177:setHeight(521);
    obj.rectangle177:setColor("black");
    obj.rectangle177:setName("rectangle177");

    obj.richEdit6 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit6:setParent(obj.MiscLayout);
    obj.richEdit6:setField("MiscAkuma");
    obj.richEdit6:setLeft(2);
    obj.richEdit6:setTop(2);
    obj.richEdit6:setWidth(996);
    obj.richEdit6:setHeight(521);
    obj.richEdit6.backgroundColor = "black";
    obj.richEdit6.defaultFontColor = "white";
    obj.richEdit6.animateImages = true;
    obj.richEdit6:setName("richEdit6");

    obj.dataLink77 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink77:setParent(obj.EdLeAkuma);
    obj.dataLink77:setField("estiloDeLuta");
    obj.dataLink77:setName("dataLink77");

    obj.dataLink78 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink78:setParent(obj.EdLeAkuma);
    obj.dataLink78:setField("estiloDeLutaSec");
    obj.dataLink78:setName("dataLink78");

    obj.tab15 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab15:setParent(obj.tabControl1);
    obj.tab15:setTitle("Vinculos");
    obj.tab15:setName("tab15");

    obj.Vinculos = GUI.fromHandle(_obj_newObject("form"));
    obj.Vinculos:setParent(obj.tab15);
    obj.Vinculos:setFormType("sheetTemplate");
    obj.Vinculos:setTitle("Brincadeiras Em Alto Mar");
    obj.Vinculos:setName("Vinculos");


		function criarListagem(nodo)
			local node = self[nodo]:append()
			node.id = tostring(node)
		end
	


    obj.rectangle178 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle178:setParent(obj.Vinculos);
    obj.rectangle178:setLeft(0);
    obj.rectangle178:setTop(0);
    obj.rectangle178:setWidth(5000);
    obj.rectangle178:setHeight(3000);
    obj.rectangle178:setColor("black");
    obj.rectangle178:setName("rectangle178");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.Vinculos);
    obj.layout11:setLeft(12);
    obj.layout11:setTop(12);
    obj.layout11:setWidth(200);
    obj.layout11:setHeight(525);
    obj.layout11:setName("layout11");

    obj.rectangle179 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle179:setParent(obj.layout11);
    obj.rectangle179:setLeft(0);
    obj.rectangle179:setTop(0);
    obj.rectangle179:setWidth(200);
    obj.rectangle179:setHeight(525);
    obj.rectangle179:setColor("#4169E1");
    obj.rectangle179:setName("rectangle179");

    obj.rectangle180 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle180:setParent(obj.layout11);
    obj.rectangle180:setLeft(2);
    obj.rectangle180:setTop(2);
    obj.rectangle180:setWidth(196);
    obj.rectangle180:setHeight(521);
    obj.rectangle180:setColor("black");
    obj.rectangle180:setName("rectangle180");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout11);
    obj.label84:setLeft(10);
    obj.label84:setTop(10);
    obj.label84:setWidth(180);
    obj.label84:setHeight(25);
    obj.label84:setText("Vinculos");
    obj.label84:setFontSize(18);
    lfm_setPropAsString(obj.label84, "fontStyle", "bold underline");
    obj.label84:setFontColor("#5F9EA0");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setName("label84");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout11);
    obj.button25:setLeft(50);
    obj.button25:setTop(40);
    obj.button25:setHeight(25);
    obj.button25:setText("Nova Listagem");
    obj.button25:setWidth(100);
    obj.button25:setName("button25");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.layout11);
    obj.scrollBox1:setLeft(5);
    obj.scrollBox1:setTop(70);
    obj.scrollBox1:setWidth(193);
    obj.scrollBox1:setHeight(460);
    obj.scrollBox1:setName("scrollBox1");

    obj.Vinculo = GUI.fromHandle(_obj_newObject("recordList"));
    obj.Vinculo:setParent(obj.scrollBox1);
    obj.Vinculo:setName("Vinculo");
    obj.Vinculo:setField("vinculos");
    obj.Vinculo:setTemplateForm("ListagemVinculos");
    obj.Vinculo:setWidth(190);
    obj.Vinculo:setAutoHeight(true);
    obj.Vinculo:setSelectable(true);

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.Vinculos);
    obj.layout12:setLeft(222);
    obj.layout12:setTop(12);
    obj.layout12:setWidth(620);
    obj.layout12:setHeight(525);
    obj.layout12:setName("layout12");

    obj.rectangle181 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle181:setParent(obj.layout12);
    obj.rectangle181:setLeft(0);
    obj.rectangle181:setTop(0);
    obj.rectangle181:setWidth(600);
    obj.rectangle181:setHeight(525);
    obj.rectangle181:setColor("#4169E1");
    obj.rectangle181:setName("rectangle181");

    obj.rectangle182 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle182:setParent(obj.layout12);
    obj.rectangle182:setLeft(2);
    obj.rectangle182:setTop(2);
    obj.rectangle182:setWidth(596);
    obj.rectangle182:setHeight(521);
    obj.rectangle182:setColor("black");
    obj.rectangle182:setName("rectangle182");

    obj.labelListagem = GUI.fromHandle(_obj_newObject("label"));
    obj.labelListagem:setParent(obj.layout12);
    obj.labelListagem:setName("labelListagem");
    obj.labelListagem:setLeft(95);
    obj.labelListagem:setTop(9);
    obj.labelListagem:setWidth(501);
    obj.labelListagem:setHeight(40);
    obj.labelListagem:setFontColor("#D1B27E");
    obj.labelListagem:setFontSize(22);
    lfm_setPropAsString(obj.labelListagem, "fontStyle", "bold");
    obj.labelListagem:setHorzTextAlign("center");
    obj.labelListagem:setVertTextAlign("center");

    obj.nomeListagem = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeListagem:setParent(obj.layout12);
    obj.nomeListagem:setName("nomeListagem");
    obj.nomeListagem:setReadOnly(true);
    obj.nomeListagem:setLeft(95);
    obj.nomeListagem:setTop(9);
    obj.nomeListagem:setWidth(521);
    obj.nomeListagem:setHeight(40);
    obj.nomeListagem:setFontSize(22);
    lfm_setPropAsString(obj.nomeListagem, "fontStyle", "bold");
    obj.nomeListagem:setHorzTextAlign("center");
    obj.nomeListagem:setTransparent(true);
    obj.nomeListagem:setVertTextAlign("center");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout12);
    obj.button26:setLeft(15);
    obj.button26:setTop(15);
    obj.button26:setText("Novo Npc");
    obj.button26:setWidth(80);
    obj.button26:setHeight(30);
    obj.button26:setName("button26");

    obj.Npcs = GUI.fromHandle(_obj_newObject("recordList"));
    obj.Npcs:setParent(obj.layout12);
    obj.Npcs:setName("Npcs");
    obj.Npcs:setLeft(5);
    obj.Npcs:setTop(60);
    obj.Npcs:setWidth(590);
    obj.Npcs:setHeight(431);
    obj.Npcs:setTemplateForm("ListagemNpcs");
    obj.Npcs:setAutoHeight(false);
    obj.Npcs:setSelectable(true);
    obj.Npcs:setLayout("horizontalTiles");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.Vinculos);
    obj.layout13:setLeft(832);
    obj.layout13:setTop(12);
    obj.layout13:setWidth(300);
    obj.layout13:setHeight(525);
    obj.layout13:setName("layout13");

    obj.rectangle183 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle183:setParent(obj.layout13);
    obj.rectangle183:setLeft(0);
    obj.rectangle183:setTop(0);
    obj.rectangle183:setWidth(300);
    obj.rectangle183:setHeight(525);
    obj.rectangle183:setColor("#4169E1");
    obj.rectangle183:setName("rectangle183");

    obj.rectangle184 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle184:setParent(obj.layout13);
    obj.rectangle184:setLeft(2);
    obj.rectangle184:setTop(2);
    obj.rectangle184:setWidth(296);
    obj.rectangle184:setHeight(521);
    obj.rectangle184:setColor("black");
    obj.rectangle184:setName("rectangle184");

    obj.LayoutNpc = GUI.fromHandle(_obj_newObject("layout"));
    obj.LayoutNpc:setParent(obj.layout13);
    obj.LayoutNpc:setName("LayoutNpc");
    obj.LayoutNpc:setLeft(0);
    obj.LayoutNpc:setTop(0);
    obj.LayoutNpc:setWidth(300);
    obj.LayoutNpc:setHeight(525);
    obj.LayoutNpc:setVisible(false);

    obj.NomeNpc = GUI.fromHandle(_obj_newObject("edit"));
    obj.NomeNpc:setParent(obj.LayoutNpc);
    obj.NomeNpc:setName("NomeNpc");
    obj.NomeNpc:setAlign("top");
    obj.NomeNpc:setFontSize(25);
    lfm_setPropAsString(obj.NomeNpc, "fontStyle", "bold");
    obj.NomeNpc:setMargins({top=18,left=3,right=3});
    obj.NomeNpc:setText("Nome");
    obj.NomeNpc:setTransparent(true);
    obj.NomeNpc:setHorzTextAlign("center");

    obj.rectangle185 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle185:setParent(obj.LayoutNpc);
    obj.rectangle185:setLeft(28);
    obj.rectangle185:setTop(77);
    obj.rectangle185:setWidth(244);
    obj.rectangle185:setHeight(144);
    obj.rectangle185:setColor("#D1B27E");
    obj.rectangle185:setName("rectangle185");

    obj.rectangle186 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle186:setParent(obj.LayoutNpc);
    obj.rectangle186:setLeft(30);
    obj.rectangle186:setTop(78);
    obj.rectangle186:setWidth(240);
    obj.rectangle186:setHeight(140);
    obj.rectangle186:setColor("black");
    obj.rectangle186:setName("rectangle186");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.LayoutNpc);
    obj.label85:setLeft(30);
    obj.label85:setTop(78);
    obj.label85:setWidth(240);
    obj.label85:setHeight(140);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setText("Clique para adicionar imagem");
    obj.label85:setFontSize(14);
    obj.label85:setFontColor("#D1B27E");
    obj.label85:setName("label85");

    obj.ImagemNpc = GUI.fromHandle(_obj_newObject("image"));
    obj.ImagemNpc:setParent(obj.LayoutNpc);
    obj.ImagemNpc:setName("ImagemNpc");
    obj.ImagemNpc:setLeft(30);
    obj.ImagemNpc:setTop(78);
    obj.ImagemNpc:setWidth(240);
    obj.ImagemNpc:setHeight(140);
    obj.ImagemNpc:setStyle("autoFit");
    obj.ImagemNpc:setEditable(true);

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.LayoutNpc);
    obj.label86:setLeft(10);
    obj.label86:setTop(230);
    obj.label86:setWidth(280);
    obj.label86:setHeight(270);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setText("Descrição");
    obj.label86:setFontSize(15);
    obj.label86:setFontColor("#D1B27E");
    obj.label86:setName("label86");

    obj.DescriNpc = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.DescriNpc:setParent(obj.LayoutNpc);
    obj.DescriNpc:setName("DescriNpc");
    obj.DescriNpc:setField("");
    obj.DescriNpc:setLeft(10);
    obj.DescriNpc:setTop(245);
    obj.DescriNpc:setWidth(280);
    obj.DescriNpc:setHeight(270);
    obj.DescriNpc:setFontSize(14);

    obj.tab16 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab16:setParent(obj.tabControl1);
    obj.tab16:setTitle("Inventario");
    obj.tab16:setName("tab16");

    obj.Inventario = GUI.fromHandle(_obj_newObject("form"));
    obj.Inventario:setParent(obj.tab16);
    obj.Inventario:setFormType("sheetTemplate");
    obj.Inventario:setTitle("Brincadeiras Em Alto Mar");
    obj.Inventario:setName("Inventario");

    obj.rectangle187 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle187:setParent(obj.Inventario);
    obj.rectangle187:setLeft(0);
    obj.rectangle187:setTop(0);
    obj.rectangle187:setWidth(5000);
    obj.rectangle187:setHeight(3000);
    obj.rectangle187:setColor("black");
    obj.rectangle187:setName("rectangle187");


		function criarListagem(nodo)
			local node = self[nodo]:append()
			node.id = tostring(node)
		end
	


    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.Inventario);
    obj.layout14:setLeft(12);
    obj.layout14:setTop(12);
    obj.layout14:setWidth(1185);
    obj.layout14:setHeight(525);
    obj.layout14:setName("layout14");

    obj.rectangle188 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle188:setParent(obj.layout14);
    obj.rectangle188:setLeft(0);
    obj.rectangle188:setTop(0);
    obj.rectangle188:setWidth(1185);
    obj.rectangle188:setHeight(525);
    obj.rectangle188:setColor("#4169E1");
    obj.rectangle188:setName("rectangle188");

    obj.rectangle189 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle189:setParent(obj.layout14);
    obj.rectangle189:setLeft(2);
    obj.rectangle189:setTop(2);
    obj.rectangle189:setWidth(1181);
    obj.rectangle189:setHeight(521);
    obj.rectangle189:setColor("black");
    obj.rectangle189:setName("rectangle189");

    obj.tabControl7 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl7:setParent(obj.layout14);
    obj.tabControl7:setLeft(2);
    obj.tabControl7:setTop(3);
    obj.tabControl7:setWidth(1180);
    obj.tabControl7:setHeight(519);
    obj.tabControl7:setName("tabControl7");

    obj.tab17 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab17:setParent(obj.tabControl7);
    obj.tab17:setTitle("Diversos");
    obj.tab17:setName("tab17");

    obj.rectangle190 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle190:setParent(obj.tab17);
    obj.rectangle190:setLeft(2);
    obj.rectangle190:setTop(2);
    obj.rectangle190:setWidth(1181);
    obj.rectangle190:setHeight(521);
    obj.rectangle190:setColor("black");
    obj.rectangle190:setName("rectangle190");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.tab17);
    obj.label87:setLeft(10);
    obj.label87:setTop(10);
    obj.label87:setWidth(200);
    obj.label87:setHeight(25);
    obj.label87:setText("Diversos");
    obj.label87:setFontSize(18);
    lfm_setPropAsString(obj.label87, "fontStyle", "bold underline");
    obj.label87:setFontColor("#5F9EA0");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.tab17);
    obj.button27:setLeft(60);
    obj.button27:setTop(40);
    obj.button27:setHeight(25);
    obj.button27:setText("Novo Item");
    obj.button27:setWidth(100);
    obj.button27:setName("button27");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.tab17);
    obj.scrollBox2:setLeft(5);
    obj.scrollBox2:setTop(70);
    obj.scrollBox2:setWidth(205);
    obj.scrollBox2:setHeight(460);
    obj.scrollBox2:setName("scrollBox2");

    obj.Diversos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.Diversos:setParent(obj.scrollBox2);
    obj.Diversos:setName("Diversos");
    obj.Diversos:setField("diversos");
    obj.Diversos:setTemplateForm("Items");
    obj.Diversos:setWidth(205);
    obj.Diversos:setAutoHeight(true);
    obj.Diversos:setSelectable(true);

    obj.rectangle191 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle191:setParent(obj.tab17);
    obj.rectangle191:setLeft(218);
    obj.rectangle191:setTop(23);
    obj.rectangle191:setWidth(954);
    obj.rectangle191:setHeight(465);
    obj.rectangle191:setColor("#4169E1");
    obj.rectangle191:setName("rectangle191");

    obj.rectangle192 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle192:setParent(obj.tab17);
    obj.rectangle192:setLeft(220);
    obj.rectangle192:setTop(25);
    obj.rectangle192:setWidth(950);
    obj.rectangle192:setHeight(461);
    obj.rectangle192:setColor("black");
    obj.rectangle192:setName("rectangle192");

    obj.LayoutDiversos = GUI.fromHandle(_obj_newObject("layout"));
    obj.LayoutDiversos:setParent(obj.tab17);
    obj.LayoutDiversos:setName("LayoutDiversos");
    obj.LayoutDiversos:setLeft(220);
    obj.LayoutDiversos:setTop(25);
    obj.LayoutDiversos:setWidth(950);
    obj.LayoutDiversos:setHeight(461);
    obj.LayoutDiversos:setVisible(false);

    obj.editDiversos = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.editDiversos:setParent(obj.LayoutDiversos);
    obj.editDiversos:setName("editDiversos");
    obj.editDiversos:setAlign("client");
    obj.editDiversos.backgroundColor = "black";
    obj.editDiversos.defaultFontColor = "white";
    obj.editDiversos.animateImages = true;

    obj.tab18 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab18:setParent(obj.tabControl7);
    obj.tab18:setTitle("Consumíveis");
    obj.tab18:setName("tab18");

    obj.rectangle193 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle193:setParent(obj.tab18);
    obj.rectangle193:setLeft(2);
    obj.rectangle193:setTop(2);
    obj.rectangle193:setWidth(1181);
    obj.rectangle193:setHeight(521);
    obj.rectangle193:setColor("black");
    obj.rectangle193:setName("rectangle193");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.tab18);
    obj.label88:setLeft(10);
    obj.label88:setTop(10);
    obj.label88:setWidth(200);
    obj.label88:setHeight(25);
    obj.label88:setText("Consumíveis");
    obj.label88:setFontSize(18);
    lfm_setPropAsString(obj.label88, "fontStyle", "bold underline");
    obj.label88:setFontColor("#5F9EA0");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.tab18);
    obj.button28:setLeft(60);
    obj.button28:setTop(40);
    obj.button28:setHeight(25);
    obj.button28:setText("Novo Item");
    obj.button28:setWidth(100);
    obj.button28:setName("button28");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.tab18);
    obj.scrollBox3:setLeft(5);
    obj.scrollBox3:setTop(70);
    obj.scrollBox3:setWidth(205);
    obj.scrollBox3:setHeight(460);
    obj.scrollBox3:setName("scrollBox3");

    obj.Consumiveis = GUI.fromHandle(_obj_newObject("recordList"));
    obj.Consumiveis:setParent(obj.scrollBox3);
    obj.Consumiveis:setName("Consumiveis");
    obj.Consumiveis:setField("consumiveis");
    obj.Consumiveis:setTemplateForm("Items");
    obj.Consumiveis:setWidth(205);
    obj.Consumiveis:setAutoHeight(true);
    obj.Consumiveis:setSelectable(true);

    obj.rectangle194 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle194:setParent(obj.tab18);
    obj.rectangle194:setLeft(218);
    obj.rectangle194:setTop(23);
    obj.rectangle194:setWidth(954);
    obj.rectangle194:setHeight(465);
    obj.rectangle194:setColor("#4169E1");
    obj.rectangle194:setName("rectangle194");

    obj.rectangle195 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle195:setParent(obj.tab18);
    obj.rectangle195:setLeft(220);
    obj.rectangle195:setTop(25);
    obj.rectangle195:setWidth(950);
    obj.rectangle195:setHeight(461);
    obj.rectangle195:setColor("black");
    obj.rectangle195:setName("rectangle195");

    obj.LayoutConsumiveis = GUI.fromHandle(_obj_newObject("layout"));
    obj.LayoutConsumiveis:setParent(obj.tab18);
    obj.LayoutConsumiveis:setName("LayoutConsumiveis");
    obj.LayoutConsumiveis:setLeft(220);
    obj.LayoutConsumiveis:setTop(25);
    obj.LayoutConsumiveis:setWidth(950);
    obj.LayoutConsumiveis:setHeight(461);
    obj.LayoutConsumiveis:setVisible(false);

    obj.editConsumiveis = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.editConsumiveis:setParent(obj.LayoutConsumiveis);
    obj.editConsumiveis:setName("editConsumiveis");
    obj.editConsumiveis:setAlign("client");
    obj.editConsumiveis.backgroundColor = "black";
    obj.editConsumiveis.defaultFontColor = "white";
    obj.editConsumiveis.animateImages = true;

    obj.tab19 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab19:setParent(obj.tabControl7);
    obj.tab19:setTitle("Armamentos");
    obj.tab19:setName("tab19");

    obj.rectangle196 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle196:setParent(obj.tab19);
    obj.rectangle196:setLeft(2);
    obj.rectangle196:setTop(2);
    obj.rectangle196:setWidth(1181);
    obj.rectangle196:setHeight(521);
    obj.rectangle196:setColor("black");
    obj.rectangle196:setName("rectangle196");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.tab19);
    obj.label89:setLeft(10);
    obj.label89:setTop(10);
    obj.label89:setWidth(200);
    obj.label89:setHeight(25);
    obj.label89:setText("Armamentos");
    obj.label89:setFontSize(18);
    lfm_setPropAsString(obj.label89, "fontStyle", "bold underline");
    obj.label89:setFontColor("#5F9EA0");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.tab19);
    obj.button29:setLeft(60);
    obj.button29:setTop(40);
    obj.button29:setHeight(25);
    obj.button29:setText("Novo Item");
    obj.button29:setWidth(100);
    obj.button29:setName("button29");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.tab19);
    obj.scrollBox4:setLeft(5);
    obj.scrollBox4:setTop(70);
    obj.scrollBox4:setWidth(205);
    obj.scrollBox4:setHeight(460);
    obj.scrollBox4:setName("scrollBox4");

    obj.Armamentos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.Armamentos:setParent(obj.scrollBox4);
    obj.Armamentos:setName("Armamentos");
    obj.Armamentos:setField("armamentos");
    obj.Armamentos:setTemplateForm("Items");
    obj.Armamentos:setWidth(205);
    obj.Armamentos:setAutoHeight(true);
    obj.Armamentos:setSelectable(true);

    obj.rectangle197 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle197:setParent(obj.tab19);
    obj.rectangle197:setLeft(218);
    obj.rectangle197:setTop(23);
    obj.rectangle197:setWidth(954);
    obj.rectangle197:setHeight(465);
    obj.rectangle197:setColor("#4169E1");
    obj.rectangle197:setName("rectangle197");

    obj.rectangle198 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle198:setParent(obj.tab19);
    obj.rectangle198:setLeft(220);
    obj.rectangle198:setTop(25);
    obj.rectangle198:setWidth(950);
    obj.rectangle198:setHeight(461);
    obj.rectangle198:setColor("black");
    obj.rectangle198:setName("rectangle198");

    obj.LayoutArmamentos = GUI.fromHandle(_obj_newObject("layout"));
    obj.LayoutArmamentos:setParent(obj.tab19);
    obj.LayoutArmamentos:setName("LayoutArmamentos");
    obj.LayoutArmamentos:setLeft(220);
    obj.LayoutArmamentos:setTop(25);
    obj.LayoutArmamentos:setWidth(950);
    obj.LayoutArmamentos:setHeight(461);
    obj.LayoutArmamentos:setVisible(false);

    obj.editArmamentos = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.editArmamentos:setParent(obj.LayoutArmamentos);
    obj.editArmamentos:setName("editArmamentos");
    obj.editArmamentos:setAlign("client");
    obj.editArmamentos.backgroundColor = "black";
    obj.editArmamentos.defaultFontColor = "white";
    obj.editArmamentos.animateImages = true;

    obj.tab20 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab20:setParent(obj.tabControl7);
    obj.tab20:setTitle("Equipamentos");
    obj.tab20:setName("tab20");

    obj.rectangle199 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle199:setParent(obj.tab20);
    obj.rectangle199:setLeft(2);
    obj.rectangle199:setTop(2);
    obj.rectangle199:setWidth(1181);
    obj.rectangle199:setHeight(521);
    obj.rectangle199:setColor("black");
    obj.rectangle199:setName("rectangle199");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.tab20);
    obj.label90:setLeft(10);
    obj.label90:setTop(10);
    obj.label90:setWidth(200);
    obj.label90:setHeight(25);
    obj.label90:setText("Equipamentos");
    obj.label90:setFontSize(18);
    lfm_setPropAsString(obj.label90, "fontStyle", "bold underline");
    obj.label90:setFontColor("#5F9EA0");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.tab20);
    obj.button30:setLeft(60);
    obj.button30:setTop(40);
    obj.button30:setHeight(25);
    obj.button30:setText("Novo Item");
    obj.button30:setWidth(100);
    obj.button30:setName("button30");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.tab20);
    obj.scrollBox5:setLeft(5);
    obj.scrollBox5:setTop(70);
    obj.scrollBox5:setWidth(205);
    obj.scrollBox5:setHeight(460);
    obj.scrollBox5:setName("scrollBox5");

    obj.Equipamentos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.Equipamentos:setParent(obj.scrollBox5);
    obj.Equipamentos:setName("Equipamentos");
    obj.Equipamentos:setField("equipamentos");
    obj.Equipamentos:setTemplateForm("Items");
    obj.Equipamentos:setWidth(205);
    obj.Equipamentos:setAutoHeight(true);
    obj.Equipamentos:setSelectable(true);

    obj.rectangle200 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle200:setParent(obj.tab20);
    obj.rectangle200:setLeft(218);
    obj.rectangle200:setTop(23);
    obj.rectangle200:setWidth(954);
    obj.rectangle200:setHeight(465);
    obj.rectangle200:setColor("#4169E1");
    obj.rectangle200:setName("rectangle200");

    obj.rectangle201 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle201:setParent(obj.tab20);
    obj.rectangle201:setLeft(220);
    obj.rectangle201:setTop(25);
    obj.rectangle201:setWidth(950);
    obj.rectangle201:setHeight(461);
    obj.rectangle201:setColor("black");
    obj.rectangle201:setName("rectangle201");

    obj.LayoutEquipamentos = GUI.fromHandle(_obj_newObject("layout"));
    obj.LayoutEquipamentos:setParent(obj.tab20);
    obj.LayoutEquipamentos:setName("LayoutEquipamentos");
    obj.LayoutEquipamentos:setLeft(220);
    obj.LayoutEquipamentos:setTop(25);
    obj.LayoutEquipamentos:setWidth(950);
    obj.LayoutEquipamentos:setHeight(461);
    obj.LayoutEquipamentos:setVisible(false);

    obj.editEquipamentos = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.editEquipamentos:setParent(obj.LayoutEquipamentos);
    obj.editEquipamentos:setName("editEquipamentos");
    obj.editEquipamentos:setAlign("client");
    obj.editEquipamentos.backgroundColor = "black";
    obj.editEquipamentos.defaultFontColor = "white";
    obj.editEquipamentos.animateImages = true;

    obj.ExportImport = GUI.fromHandle(_obj_newObject("layout"));
    obj.ExportImport:setParent(obj);
    obj.ExportImport:setName("ExportImport");
    obj.ExportImport:setLeft(0);
    obj.ExportImport:setTop(0);
    obj.ExportImport:setWidth(300);
    obj.ExportImport:setHeight(1000);
    obj.ExportImport:setVisible(false);

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.ExportImport);
    obj.button31:setWidth(100);
    obj.button31:setTop(570);
    obj.button31:setText("Exportar Ficha");
    obj.button31:setName("button31");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.ExportImport);
    obj.button32:setWidth(100);
    obj.button32:setLeft(110);
    obj.button32:setTop(570);
    obj.button32:setText("Importar Ficha");
    obj.button32:setName("button32");


		mesas = Firecast.getMesas()
		local mesa = mesas[1]

		if mesa.me.isMestre then
			self.ExportImport.visible = true
		else
			self.ExportImport.visible = false
		end    
	


    obj._e_event0 = obj.Nivel:addEventListener("onChange",
        function ()
            AtualizarExp()
        end);

    obj._e_event1 = obj.ExpAtual:addEventListener("onChange",
        function ()
            AtualizarExp()
        end);

    obj._e_event2 = obj.estluta:addEventListener("onChange",
        function ()
            self.LabelEdL.text = self.estluta.text
        end);

    obj._e_event3 = obj.listaOrganizacoes:addEventListener("onChange",
        function ()
            MudarBandeira()
        end);

    obj._e_event4 = obj.button1:addEventListener("onClick",
        function (event)
            self.AbaProfissaoPrincipal.visible = true; self.AbaProfissaoSecundaria.visible = false; self.AbaRaca.visible = false; self.AbaHistoria.visible = false; self.AbaAnotacoes.visible = false
            				CheckIfEmpregado(self.ProfissaoPrincipal.text); sheet.fotoProfissaoPrincipal = self.ImagemProfissaoPrincipal.src
        end);

    obj._e_event5 = obj.button2:addEventListener("onClick",
        function (event)
            self.AbaProfissaoSecundaria.visible = true; self.AbaProfissaoPrincipal.visible = false; self.AbaRaca.visible = false; self.AbaHistoria.visible = false; self.AbaAnotacoes.visible = false
            				CheckIfEmpregado(self.ProfissaoSecundaria.text); sheet.fotoProfissaoSecundaria = self.ImagemProfissaoSecundaria.src
        end);

    obj._e_event6 = obj.button3:addEventListener("onClick",
        function (event)
            self.AbaRaca.visible = true; self.AbaProfissaoPrincipal.visible = false; self.AbaProfissaoSecundaria.visible = false; self.AbaHistoria.visible = false; self.AbaAnotacoes.visible = false
            				sheet.fotoRaca= self.ImagemRaca.src
        end);

    obj._e_event7 = obj.ImagemBandeira:addEventListener("onLoad",
        function ()
            sheet.imagemBandeira = self.ImagemBandeira.src
        end);

    obj._e_event8 = obj.button4:addEventListener("onClick",
        function (event)
            self.AbaHistoria.visible = true;self.AbaRaca.visible = false; self.AbaProfissaoPrincipal.visible = false; self.AbaProfissaoSecundaria.visible = false; self.AbaAnotacoes.visible = false
        end);

    obj._e_event9 = obj.button5:addEventListener("onClick",
        function (event)
            self.AbaAnotacoes.visible = true;self.AbaHistoria.visible = false;self.AbaRaca.visible = false; self.AbaProfissaoPrincipal.visible = false; self.AbaProfissaoSecundaria.visible = false
        end);

    obj._e_event10 = obj.ComboProfissaoPrincipal:addEventListener("onChange",
        function ()
            
            						MudarProfissao1(); self.DetalhamentoPrimario.field = self.ComboProfissaoPrincipal.value; self.DescricaoProfissionalPrimaria.field = self.ComboProfissaoPrincipal.value..'descri'
        end);

    obj._e_event11 = obj.TierPrincipal:addEventListener("onChange",
        function ()
            AtualizarTier('TierPrincipal','XpMaxPrincipal')
        end);

    obj._e_event12 = obj.ComboProfissaoSecundaria:addEventListener("onChange",
        function ()
            MudarProfissao2();
        end);

    obj._e_event13 = obj.TierSecundaria:addEventListener("onChange",
        function ()
            AtualizarTier('TierSecundaria','XpMaxSecundaria')
        end);

    obj._e_event14 = obj.ComboRaca:addEventListener("onChange",
        function ()
            MudarRaca(); self.DescricaoRacial.field = self.ComboRaca.value
        end);

    obj._e_event15 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.nomePersonagem == "" then sheet.nomePersonagem = "Nome do Personagem" end
        end);

    obj._e_event16 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.tituloPersonagem == "" then sheet.tituloPersonagem = "Titulo" end
        end);

    obj._e_event17 = obj.dataLink3:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.nivel == "" then sheet.nivel = "1" end
            			CalcularHpEngHaki()
            			AlterarValorTotal("Carisma")
        end);

    obj._e_event18 = obj.dataLink4:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.expAtual == "" then sheet.expAtual = "0" end
        end);

    obj._e_event19 = obj.dataLink5:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.expMax == "" then sheet.expMax = "300" end
        end);

    obj._e_event20 = obj.dataLink6:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.nomeRaca == "" then sheet.nomeRaca = "Raça" end
        end);

    obj._e_event21 = obj.dataLink7:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.raca == "" then sheet.raca = "Escolher" end
        end);

    obj._e_event22 = obj.dataLink8:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.DetalhamentoPrimario.field = self.ComboProfissaoPrincipal.value
            			self.DescricaoProfissionalPrimaria.field = self.ComboProfissaoPrincipal.value..'descri'
            			
            			self.DetalhamentoSecundario.field = CheckIfEmpregado(self.ProfissaoPrincipal.text)
            			sheet.imagemPrincipal = self.ImagemProfissaoPrincipal.src
            			sheet.nomePrincipal = self.NomeProfissaoPrincipal.text
            			if (sheet.nomePrincipal == "Profissão 1") then sheet.profissaoPrincipal = "Escolher" else
            			sheet.profissaoPrincipal = sheet.nomePrincipal end
        end);

    obj._e_event23 = obj.dataLink9:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.DetalhamentoSecundario.field = self.ComboProfissaoSecundaria.value
            			self.DescricaoProfissionalSecundaria.field = self.ComboProfissaoSecundaria.value..'descri'
            			
            			CheckIfEmpregado(self.ProfissaoSecundaria.text)
            			sheet.imagemSecundaria = self.ImagemProfissaoSecundaria.src
            			sheet.nomeSecundaria = self.NomeProfissaoSecundaria.text
            			if (sheet.nomeSecundaria == "Profissão 2") then sheet.profissaoSecundaria = "Escolher" else
            			sheet.profissaoSecundaria = sheet.nomeSecundaria end
        end);

    obj._e_event24 = obj.dataLink10:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.DescricaoRacial.field = self.ComboRaca.value
            			
            			sheet.ImagemRaca = self.ImagemRaca.src
            			sheet.nomeRaca = self.NomeRaca.text
            			sheet.raca = (RacasInfo[self.ComboRaca.value]).nomeNormal
            			sheet.fotoRaca = self.ImagemRaca.src
        end);

    obj._e_event25 = obj.dataLink11:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.tierProfissaoPrincipal == "" then sheet.tierProfissaoPrincipal = "0" end
        end);

    obj._e_event26 = obj.dataLink12:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.tierProfissaoSecundaria == "" then sheet.tierProfissaoSecundaria = "0" end
        end);

    obj._e_event27 = obj.dataLink13:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.xpAtualProfissaoPrincipal == "" then sheet.xpAtualProfissaoPrincipal = "0" end
        end);

    obj._e_event28 = obj.dataLink14:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.xpAtualProfissaoSecundaria == "" then sheet.xpAtualProfissaoSecundaria = "0" end
        end);

    obj._e_event29 = obj.dataLink15:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.xpMaximaProfissaoPrincipal == "" then sheet.xpMaximaProfissaoPrincipal = "10" end
        end);

    obj._e_event30 = obj.dataLink16:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.xpMaximaProfissaoPrincipal == "" then sheet.xpMaximaProfissaoPrincipal = "10" end
        end);

    obj._e_event31 = obj.ForcaButton:addEventListener("onMouseEnter",
        function ()
            self.ForcaButton.text = 'Rolar FOR'
        end);

    obj._e_event32 = obj.ForcaButton:addEventListener("onMouseLeave",
        function ()
            self.ForcaButton.text = 'Força'
        end);

    obj._e_event33 = obj.ForcaButton:addEventListener("onClick",
        function (event)
            RolarAtributo('Forca')
        end);

    obj._e_event34 = obj.AgilButton:addEventListener("onMouseEnter",
        function ()
            self.AgilButton.text = 'Rolar AGI'
        end);

    obj._e_event35 = obj.AgilButton:addEventListener("onMouseLeave",
        function ()
            self.AgilButton.text = 'Agilidade'
        end);

    obj._e_event36 = obj.AgilButton:addEventListener("onClick",
        function (event)
            RolarAtributo('Agilidade')
        end);

    obj._e_event37 = obj.VigorButton:addEventListener("onMouseEnter",
        function ()
            self.VigorButton.text = 'Rolar VIG'
        end);

    obj._e_event38 = obj.VigorButton:addEventListener("onMouseLeave",
        function ()
            self.VigorButton.text = 'Vigor'
        end);

    obj._e_event39 = obj.VigorButton:addEventListener("onClick",
        function (event)
            RolarAtributo('Vigor')
        end);

    obj._e_event40 = obj.ComButton:addEventListener("onMouseEnter",
        function ()
            self.ComButton.text = 'Rolar COM'
        end);

    obj._e_event41 = obj.ComButton:addEventListener("onMouseLeave",
        function ()
            self.ComButton.text = 'Combate'
        end);

    obj._e_event42 = obj.ComButton:addEventListener("onClick",
        function (event)
            RolarAtributo('Combate')
        end);

    obj._e_event43 = obj.PercepButton:addEventListener("onMouseEnter",
        function ()
            self.PercepButton.text = 'Rolar PER'
        end);

    obj._e_event44 = obj.PercepButton:addEventListener("onMouseLeave",
        function ()
            self.PercepButton.text = 'Percepção'
        end);

    obj._e_event45 = obj.PercepButton:addEventListener("onClick",
        function (event)
            RolarAtributo('Percepcao')
        end);

    obj._e_event46 = obj.CarisButton:addEventListener("onMouseEnter",
        function ()
            self.CarisButton.text = 'Rolar CAR'
        end);

    obj._e_event47 = obj.CarisButton:addEventListener("onMouseLeave",
        function ()
            self.CarisButton.text = 'Carisma'
        end);

    obj._e_event48 = obj.CarisButton:addEventListener("onClick",
        function (event)
            RolarAtributo('Carisma')
        end);

    obj._e_event49 = obj.IntButton:addEventListener("onMouseEnter",
        function ()
            self.IntButton.text = 'Rolar INT'
        end);

    obj._e_event50 = obj.IntButton:addEventListener("onMouseLeave",
        function ()
            self.IntButton.text = 'Intelegência'
        end);

    obj._e_event51 = obj.IntButton:addEventListener("onClick",
        function (event)
            RolarAtributo('Inteligencia')
        end);

    obj._e_event52 = obj.PrecButton:addEventListener("onMouseEnter",
        function ()
            self.PrecButton.text = 'Rolar PRE'
        end);

    obj._e_event53 = obj.PrecButton:addEventListener("onMouseLeave",
        function ()
            self.PrecButton.text = 'Precisão'
        end);

    obj._e_event54 = obj.PrecButton:addEventListener("onClick",
        function (event)
            RolarAtributo('Precisao')
        end);

    obj._e_event55 = obj.ForDVonButton:addEventListener("onMouseEnter",
        function ()
            self.ForDVonButton.text = 'Rolar FDV'
        end);

    obj._e_event56 = obj.ForDVonButton:addEventListener("onMouseLeave",
        function ()
            self.ForDVonButton.text = 'Força de Vontade'
        end);

    obj._e_event57 = obj.ForDVonButton:addEventListener("onClick",
        function (event)
            RolarAtributo('ForcaDeVontade')
        end);

    obj._e_event58 = obj.ForcaBase:addEventListener("onChange",
        function ()
            AlterarValorTotal('Forca')
        end);

    obj._e_event59 = obj.AgilidadeBase:addEventListener("onChange",
        function ()
            AlterarValorTotal('Agilidade')
        end);

    obj._e_event60 = obj.VigorBase:addEventListener("onChange",
        function ()
            AlterarValorTotal('Vigor')
        end);

    obj._e_event61 = obj.CombateBase:addEventListener("onChange",
        function ()
            AlterarValorTotal('Combate')
        end);

    obj._e_event62 = obj.PercepcaoBase:addEventListener("onChange",
        function ()
            AlterarValorTotal('Percepcao')
        end);

    obj._e_event63 = obj.CarismaBase:addEventListener("onChange",
        function ()
            AlterarValorTotal('Carisma')
        end);

    obj._e_event64 = obj.InteligenciaBase:addEventListener("onChange",
        function ()
            AlterarValorTotal('Inteligencia')
        end);

    obj._e_event65 = obj.PrecisaoBase:addEventListener("onChange",
        function ()
            AlterarValorTotal('Precisao')
        end);

    obj._e_event66 = obj.ForcaDeVontadeBase:addEventListener("onChange",
        function ()
            AlterarValorTotal('ForcaDeVontade')
        end);

    obj._e_event67 = obj.ForcaPassivo:addEventListener("onChange",
        function ()
            AlterarValorTotal('Forca')
        end);

    obj._e_event68 = obj.AgilidadePassivo:addEventListener("onChange",
        function ()
            AlterarValorTotal('Agilidade')
        end);

    obj._e_event69 = obj.VigorPassivo:addEventListener("onChange",
        function ()
            AlterarValorTotal('Vigor')
        end);

    obj._e_event70 = obj.CombatePassivo:addEventListener("onChange",
        function ()
            AlterarValorTotal('Combate')
        end);

    obj._e_event71 = obj.PercepcaoPassivo:addEventListener("onChange",
        function ()
            AlterarValorTotal('Percepcao')
        end);

    obj._e_event72 = obj.CarismaPassivo:addEventListener("onChange",
        function ()
            AlterarValorTotal('Carisma')
        end);

    obj._e_event73 = obj.InteligenciaPassivo:addEventListener("onChange",
        function ()
            AlterarValorTotal('Inteligencia')
        end);

    obj._e_event74 = obj.PrecisaoPassivo:addEventListener("onChange",
        function ()
            AlterarValorTotal('Precisao')
        end);

    obj._e_event75 = obj.ForcaDeVontadePassivo:addEventListener("onChange",
        function ()
            AlterarValorTotal('ForcaDeVontade')
        end);

    obj._e_event76 = obj.ForcaEquips:addEventListener("onChange",
        function ()
            AlterarValorTotal('Forca')
        end);

    obj._e_event77 = obj.AgilidadeEquips:addEventListener("onChange",
        function ()
            AlterarValorTotal('Agilidade')
        end);

    obj._e_event78 = obj.VigorEquips:addEventListener("onChange",
        function ()
            AlterarValorTotal('Vigor')
        end);

    obj._e_event79 = obj.CombateEquips:addEventListener("onChange",
        function ()
            AlterarValorTotal('Combate')
        end);

    obj._e_event80 = obj.PercepcaoEquips:addEventListener("onChange",
        function ()
            AlterarValorTotal('Percepcao')
        end);

    obj._e_event81 = obj.CarismaEquips:addEventListener("onChange",
        function ()
            AlterarValorTotal('Carisma')
        end);

    obj._e_event82 = obj.InteligenciaEquips:addEventListener("onChange",
        function ()
            AlterarValorTotal('Inteligencia')
        end);

    obj._e_event83 = obj.PrecisaoEquips:addEventListener("onChange",
        function ()
            AlterarValorTotal('Precisao')
        end);

    obj._e_event84 = obj.ForcaDeVontadeEquips:addEventListener("onChange",
        function ()
            AlterarValorTotal('ForcaDeVontade')
        end);

    obj._e_event85 = obj.ForcaTreino:addEventListener("onChange",
        function ()
            AlterarValorTotal('Forca')
        end);

    obj._e_event86 = obj.AgilidadeTreino:addEventListener("onChange",
        function ()
            AlterarValorTotal('Agilidade')
        end);

    obj._e_event87 = obj.VigorTreino:addEventListener("onChange",
        function ()
            AlterarValorTotal('Vigor')
        end);

    obj._e_event88 = obj.CombateTreino:addEventListener("onChange",
        function ()
            AlterarValorTotal('Combate')
        end);

    obj._e_event89 = obj.PercepcaoTreino:addEventListener("onChange",
        function ()
            AlterarValorTotal('Percepcao')
        end);

    obj._e_event90 = obj.CarismaTreino:addEventListener("onChange",
        function ()
            AlterarValorTotal('Carisma')
        end);

    obj._e_event91 = obj.InteligenciaTreino:addEventListener("onChange",
        function ()
            AlterarValorTotal('Inteligencia')
        end);

    obj._e_event92 = obj.PrecisaoTreino:addEventListener("onChange",
        function ()
            AlterarValorTotal('Precisao')
        end);

    obj._e_event93 = obj.ForcaDeVontadeTreino:addEventListener("onChange",
        function ()
            AlterarValorTotal('ForcaDeVontade')
        end);

    obj._e_event94 = obj.ForcaTotal:addEventListener("onChange",
        function ()
            CalcularPontosTotais()
        end);

    obj._e_event95 = obj.AgilidadeTotal:addEventListener("onChange",
        function ()
            CalcularPontosTotais()
        end);

    obj._e_event96 = obj.VigorTotal:addEventListener("onChange",
        function ()
            CalcularPontosTotais(); CalcularHpEngHaki()
        end);

    obj._e_event97 = obj.CombateTotal:addEventListener("onChange",
        function ()
            CalcularPontosTotais()
        end);

    obj._e_event98 = obj.PercepcaoTotal:addEventListener("onChange",
        function ()
            CalcularPontosTotais()
        end);

    obj._e_event99 = obj.CarismaTotal:addEventListener("onChange",
        function ()
            CalcularPontosTotais()
        end);

    obj._e_event100 = obj.InteligenciaTotal:addEventListener("onChange",
        function ()
            CalcularPontosTotais()
        end);

    obj._e_event101 = obj.PrecisaoTotal:addEventListener("onChange",
        function ()
            CalcularPontosTotais()
        end);

    obj._e_event102 = obj.ForcaDeVontadeTotal:addEventListener("onChange",
        function ()
            CalcularPontosTotais(); CalcularHpEngHaki()
        end);

    obj._e_event103 = obj.DefButton:addEventListener("onMouseEnter",
        function ()
            self.DefButton.text = 'Rolar Defesa'
        end);

    obj._e_event104 = obj.DefButton:addEventListener("onMouseLeave",
        function ()
            self.DefButton.text = 'Defesa'
        end);

    obj._e_event105 = obj.DefButton:addEventListener("onClick",
        function (event)
            RolarAtributo('Defesa')
        end);

    obj._e_event106 = obj.button6:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoChapeu'; self.editEquip.field = 'Chapeu'
        end);

    obj._e_event107 = obj.button7:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoRosto'; self.editEquip.field = 'Rosto'
        end);

    obj._e_event108 = obj.button8:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoColar'; self.editEquip.field = 'Colar'
        end);

    obj._e_event109 = obj.button9:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoBrinco'; self.editEquip.field = 'Brinco'
        end);

    obj._e_event110 = obj.button10:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoRoupa'; self.editEquip.field = 'Roupa'
        end);

    obj._e_event111 = obj.button11:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoCapa'; self.editEquip.field = 'Capa'
        end);

    obj._e_event112 = obj.button12:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoMaoPrimaria'; self.editEquip.field = 'MaoP'
        end);

    obj._e_event113 = obj.button13:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoMaoSecundaria'; self.editEquip.field = 'MaoS'
        end);

    obj._e_event114 = obj.button14:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoCalca'; self.editEquip.field = 'Calca'
        end);

    obj._e_event115 = obj.button15:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoLuva'; self.editEquip.field = 'Luva'
        end);

    obj._e_event116 = obj.button16:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoBota'; self.editEquip.field = 'Bota'
        end);

    obj._e_event117 = obj.button17:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoAnel'; self.editEquip.field = 'Anel'
        end);

    obj._e_event118 = obj.button18:addEventListener("onClick",
        function (event)
            self.Haki.visible = true; self.editHaki.field = 'Armamento'
        end);

    obj._e_event119 = obj.button19:addEventListener("onClick",
        function (event)
            self.Haki.visible = true; self.editHaki.field = 'Observacao'
        end);

    obj._e_event120 = obj.button20:addEventListener("onClick",
        function (event)
            self.Haki.visible = true; self.editHaki.field = 'Conquistador'
        end);

    obj._e_event121 = obj.button21:addEventListener("onClick",
        function (event)
            RolarAtributo('Rei')
        end);

    obj._e_event122 = obj.buttonSair:addEventListener("onMouseEnter",
        function ()
            self.buttonSair.color = '#f3214b'
        end);

    obj._e_event123 = obj.buttonSair:addEventListener("onMouseLeave",
        function ()
            self.buttonSair.color = 'crimson'
        end);

    obj._e_event124 = obj.buttonSair:addEventListener("onClick",
        function (event)
            self.Equipamento.visible= false
        end);

    obj._e_event125 = obj.buttonExit:addEventListener("onMouseEnter",
        function ()
            self.buttonExit.color = '#f3214b'
        end);

    obj._e_event126 = obj.buttonExit:addEventListener("onMouseLeave",
        function ()
            self.buttonExit.color = 'crimson'
        end);

    obj._e_event127 = obj.buttonExit:addEventListener("onClick",
        function (event)
            self.Haki.visible= false
        end);

    obj._e_event128 = obj.dataLink17:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaBase == "" then sheet.ForcaBase = 1 end
        end);

    obj._e_event129 = obj.dataLink18:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.AgilidadeBase == "" then sheet.AgilidadeBase = 1 end
        end);

    obj._e_event130 = obj.dataLink19:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.VigorBase == "" then sheet.VigorBase = 1 end
        end);

    obj._e_event131 = obj.dataLink20:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CombateBase == "" then sheet.CombateBase = 1 end
        end);

    obj._e_event132 = obj.dataLink21:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PercepcaoBase == "" then sheet.PercepcaoBase = 1 end
        end);

    obj._e_event133 = obj.dataLink22:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CarismaBase == "" then sheet.CarismaBase = 1 end
        end);

    obj._e_event134 = obj.dataLink23:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.InteligenciaBase == "" then sheet.InteligenciaBase = 1 end
        end);

    obj._e_event135 = obj.dataLink24:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PrecisaoBase == "" then sheet.PrecisaoBase = 1 end
        end);

    obj._e_event136 = obj.dataLink25:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaDeVontadeBase == "" then sheet.ForcaDeVontadeBase = 1 end
        end);

    obj._e_event137 = obj.dataLink26:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaPassivo == "" then sheet.ForcaPassivo = 0 end
        end);

    obj._e_event138 = obj.dataLink27:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.AgilidadePassivo == "" then sheet.AgilidadePassivo = 0 end
        end);

    obj._e_event139 = obj.dataLink28:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.VigorPassivo == "" then sheet.VigorPassivo = 0 end
        end);

    obj._e_event140 = obj.dataLink29:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CombatePassivo == "" then sheet.CombatePassivo = 0 end
        end);

    obj._e_event141 = obj.dataLink30:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PercepcaoPassivo == "" then sheet.PercepcaoPassivo = 0 end
        end);

    obj._e_event142 = obj.dataLink31:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CarismaPassivo == "" then sheet.CarismaPassivo = 0 end
        end);

    obj._e_event143 = obj.dataLink32:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.InteligenciaPassivo == "" then sheet.InteligenciaPassivo = 0 end
        end);

    obj._e_event144 = obj.dataLink33:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PrecisaoPassivo == "" then sheet.PrecisaoPassivo = 0 end
        end);

    obj._e_event145 = obj.dataLink34:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaDeVontadePassivo == "" then sheet.ForcaDeVontadePassivo = 0 end
        end);

    obj._e_event146 = obj.dataLink35:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaEquips == "" then sheet.ForcaEquips = 0 end
        end);

    obj._e_event147 = obj.dataLink36:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.AgilidadeEquips == "" then sheet.AgilidadeEquips = 0 end
        end);

    obj._e_event148 = obj.dataLink37:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.VigorEquips == "" then sheet.VigorEquips = 0 end
        end);

    obj._e_event149 = obj.dataLink38:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CombateEquips == "" then sheet.CombateEquips = 0 end
        end);

    obj._e_event150 = obj.dataLink39:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PercepcaoEquips == "" then sheet.PercepcaoEquips = 0 end
        end);

    obj._e_event151 = obj.dataLink40:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CarismaEquips == "" then sheet.CarismaEquips = 0 end
        end);

    obj._e_event152 = obj.dataLink41:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.InteligenciaEquips == "" then sheet.InteligenciaEquips = 0 end
        end);

    obj._e_event153 = obj.dataLink42:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PrecisaoEquips == "" then sheet.PrecisaoEquips = 0 end
        end);

    obj._e_event154 = obj.dataLink43:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaDeVontadeEquips == "" then sheet.ForcaDeVontadeEquips = 0 end
        end);

    obj._e_event155 = obj.dataLink44:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaTreino == "" then sheet.ForcaTreino = 0 end
        end);

    obj._e_event156 = obj.dataLink45:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.AgilidadeTreino == "" then sheet.AgilidadeTreino = 0 end
        end);

    obj._e_event157 = obj.dataLink46:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.VigorTreino == "" then sheet.VigorTreino = 0 end
        end);

    obj._e_event158 = obj.dataLink47:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CombateTreino == "" then sheet.CombateTreino = 0 end
        end);

    obj._e_event159 = obj.dataLink48:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PercepcaoTreino == "" then sheet.PercepcaoTreino = 0 end
        end);

    obj._e_event160 = obj.dataLink49:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CarismaTreino == "" then sheet.CarismaTreino = 0 end
        end);

    obj._e_event161 = obj.dataLink50:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.InteligenciaTreino == "" then sheet.InteligenciaTreino = 0 end
        end);

    obj._e_event162 = obj.dataLink51:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PrecisaoTreino == "" then sheet.PrecisaoTreino = 0 end
        end);

    obj._e_event163 = obj.dataLink52:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaDeVontadeTreino == "" then sheet.ForcaDeVontadeTreino = 0 end
        end);

    obj._e_event164 = obj.dataLink53:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoChapeu == nil then sheet.FotoChapeu = "https://blob.firecast.com.br/blobs/BSEWIEVG_3735362/Chapeu.png" end
        end);

    obj._e_event165 = obj.dataLink54:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoColar == nil then sheet.FotoColar = "https://blob.firecast.com.br/blobs/ELGUBICD_3735361/Colar.png" end
        end);

    obj._e_event166 = obj.dataLink55:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoRoupa == nil then sheet.FotoRoupa = "https://blob.firecast.com.br/blobs/SIRPGIRT_3735359/Ropa.png" end
        end);

    obj._e_event167 = obj.dataLink56:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoMaoPrimaria == nil then sheet.FotoMaoPrimaria = "https://blob.firecast.com.br/blobs/SMOQJGJO_3735363/M_o.png" end
        end);

    obj._e_event168 = obj.dataLink57:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoCalca == nil then sheet.FotoCalca = "https://blob.firecast.com.br/blobs/TQPAWOQT_3735360/Car_a.png" end
        end);

    obj._e_event169 = obj.dataLink58:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoBota == nil then sheet.FotoBota = "https://blob.firecast.com.br/blobs/OHNVCDNS_3735367/Bota.png" end
        end);

    obj._e_event170 = obj.dataLink59:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoRosto == nil then sheet.FotoRosto = "https://blob.firecast.com.br/blobs/NHQFHSIH_3735364/Mascara.png" end
        end);

    obj._e_event171 = obj.dataLink60:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoBrinco == nil then sheet.FotoBrinco = "https://blob.firecast.com.br/blobs/LQUKWDCJ_3735365/Binco.png" end
        end);

    obj._e_event172 = obj.dataLink61:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoCapa == nil then sheet.FotoCapa = "https://blob.firecast.com.br/blobs/SEKLBTCI_3735802/Kapa.png" end
        end);

    obj._e_event173 = obj.dataLink62:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoMaoSecundaria == nil then sheet.FotoMaoSecundaria = "https://blob.firecast.com.br/blobs/RRQKGODJ_3735460/M_o.png" end
        end);

    obj._e_event174 = obj.dataLink63:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoCinto == nil then sheet.FotoCinto = "https://blob.firecast.com.br/blobs/BCNCKKRT_3735366/Luva.png" end
        end);

    obj._e_event175 = obj.dataLink64:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoAnel == nil then sheet.FotoAnel = "https://blob.firecast.com.br/blobs/QLBWNJUT_3735368/Anal.png" end
        end);

    obj._e_event176 = obj.dataLink65:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.BonusArmamento = "+".. (sheet.tierArmamento * 5) .." de dano ou em rolagens de resistência"
            			sheet.CustoArmamento = "-".. (sheet.tierArmamento * 3) .." da barra de haki"
        end);

    obj._e_event177 = obj.dataLink66:addEventListener("onChange",
        function (field, oldValue, newValue)
            if (self.estadoArmamento.value == "De" or self.estadoArmamento.value == "C") then
            				self.tierArmamento.readOnly = false
            				self.tierArmamento.text = '1'
            			else
            				self.tierArmamento.readOnly = true
            				self.tierArmamento.text = '0'
            			end
        end);

    obj._e_event178 = obj.dataLink69:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.BonusObservacao = "+".. (sheet.tierObservacao) .." de acerto, esquiva ou em rolagens de     percepção."
            			sheet.CustoObservacao = "-".. (sheet.tierObservacao * 3) .." da barra de haki"
        end);

    obj._e_event179 = obj.dataLink70:addEventListener("onChange",
        function (field, oldValue, newValue)
            if (self.estadoObservacao.value == "De" or self.estadoObservacao.value == "C") then
            				self.tierObservacao.readOnly = false
            				self.tierObservacao.text = '1'
            			else
            				self.tierObservacao.readOnly = true
            				self.tierObservacao.text = '0'
            			end
        end);

    obj._e_event180 = obj.dataLink73:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.BonusConquistador = "Numa área de 12m, todos fazem um teste de resistência (DT 1d20+ FdV("..sheet.ForcaDeVontadeTotal..")+ ".. sheet.tierConquistador .."). Se passarem ficam acordados; se falharem desmaiam."
            			sheet.CustoConquistador = "-".. (sheet.tierConquistador * 3) .." da barra de haki"
        end);

    obj._e_event181 = obj.dataLink74:addEventListener("onChange",
        function (field, oldValue, newValue)
            if (self.estadoConquistador.value == "De" or self.estadoConquistador.value == "C") then
            				self.tierConquistador.readOnly = false
            				self.tierConquistador.text = '1'
            			else
            				self.tierConquistador.readOnly = true
            				self.tierConquistador.text = '0'
            			end
        end);

    obj._e_event182 = obj.button22:addEventListener("onClick",
        function (event)
            self.EstilosDeLuta.visible = true; self.AkumaLayout.visible = false; self.MiscLayout.visible = false
        end);

    obj._e_event183 = obj.button23:addEventListener("onClick",
        function (event)
            self.EstilosDeLuta.visible = false; self.AkumaLayout.visible = true; self.MiscLayout.visible = false
        end);

    obj._e_event184 = obj.button24:addEventListener("onClick",
        function (event)
            self.EstilosDeLuta.visible = false; self.AkumaLayout.visible = false; self.MiscLayout.visible = true
        end);

    obj._e_event185 = obj.dataLink77:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.EstLuta.text = self.estiloDeLuta.text
            			self.estLPrincipal.field = self.estiloDeLuta.value
            			self.LabelEdL.text = self.estluta.text
            			self.imagemEdL.src = EdLImagens[self.estiloDeLuta.value].imagem
        end);

    obj._e_event186 = obj.dataLink78:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.estLSecundario.field = self.estiloDeLutaSec.value
        end);

    obj._e_event187 = obj.button25:addEventListener("onClick",
        function (event)
            criarListagem('Vinculo'); self.Npcs.field = self.Vinculo.selectedNode
        end);

    obj._e_event188 = obj.Vinculo:addEventListener("onSelect",
        function ()
            
            					if self.Vinculo.selectedNode then
            						self.nomeListagem.readOnly = false;
            						self.LayoutNpc.visible=false
            						
            						local Field = tostring(self.Vinculo.selectedNode.id)
            						
            						self.nomeListagem.field = self.Vinculo.selectedNode;
            						self.Npcs.field = Field;
            						
            						self.nomeListagem.text = self.Vinculo.selectedNode.nomeListagem;
            					end
        end);

    obj._e_event189 = obj.Vinculo:addEventListener("onItemRemoved",
        function (node, form)
            self.nomeListagem.text = nil; self.nomeListagem.readOnly = true; self.Npcs.field = ''; self.LayoutNpc.visible=false
        end);

    obj._e_event190 = obj.Vinculo:addEventListener("onItemAdded",
        function (node, form)
            self.Vinculo.selectedNode = nil; self.LayoutNpc.visible=false
        end);

    obj._e_event191 = obj.nomeListagem:addEventListener("onChange",
        function ()
        end);

    obj._e_event192 = obj.button26:addEventListener("onClick",
        function (event)
            if (self.Vinculo.selectedNode) then criarListagem('Npcs') end
        end);

    obj._e_event193 = obj.Npcs:addEventListener("onSelect",
        function ()
            
            							if (self.Npcs.selectedNode) then
            								local Field = tostring(self.Npcs.selectedNode.id)
            								self.Npcs.selectedNode.id = Field;
            								
            								self.LayoutNpc.visible=true
            								
            								self.ImagemNpc.src = self.Npcs.selectedNode.imagemNpc
            								self.NomeNpc.text = self.Npcs.selectedNode.nomeNpc
            								self.DescriNpc.text = self.Npcs.selectedNode.descriNpc
            							end
        end);

    obj._e_event194 = obj.Npcs:addEventListener("onItemRemoved",
        function (node, form)
            self.LayoutNpc.visible=false
        end);

    obj._e_event195 = obj.NomeNpc:addEventListener("onChange",
        function ()
            self.Npcs.selectedNode.nomeNpc = self.NomeNpc.text
        end);

    obj._e_event196 = obj.ImagemNpc:addEventListener("onPictureLoadedChange",
        function ()
            self.Npcs.selectedNode.imagemNpc = self.ImagemNpc.src
        end);

    obj._e_event197 = obj.DescriNpc:addEventListener("onChange",
        function ()
            self.Npcs.selectedNode.descriNpc = self.DescriNpc.text
        end);

    obj._e_event198 = obj.button27:addEventListener("onClick",
        function (event)
            criarListagem('Diversos');
        end);

    obj._e_event199 = obj.Diversos:addEventListener("onSelect",
        function ()
            
            						if self.Diversos.selectedNode then
            							self.LayoutDiversos.visible = true
            							self.editDiversos.field = self.Diversos.selectedNode.id
            						end
        end);

    obj._e_event200 = obj.button28:addEventListener("onClick",
        function (event)
            criarListagem('Consumiveis');
        end);

    obj._e_event201 = obj.Consumiveis:addEventListener("onSelect",
        function ()
            
            						if self.Consumiveis.selectedNode then
            							self.LayoutConsumiveis.visible = true
            							self.editConsumiveis.field = self.Consumiveis.selectedNode.id
            						end
        end);

    obj._e_event202 = obj.button29:addEventListener("onClick",
        function (event)
            criarListagem('Armamentos');
        end);

    obj._e_event203 = obj.Armamentos:addEventListener("onSelect",
        function ()
            
            						if self.Armamentos.selectedNode then
            							self.LayoutArmamentos.visible = true
            							self.editArmamentos.field = self.Armamentos.selectedNode.id
            						end
        end);

    obj._e_event204 = obj.button30:addEventListener("onClick",
        function (event)
            criarListagem('Equipamentos');
        end);

    obj._e_event205 = obj.Equipamentos:addEventListener("onSelect",
        function ()
            
            						if self.Equipamentos.selectedNode then
            							self.LayoutEquipamentos.visible = true
            							self.editEquipamentos.field = self.Equipamentos.selectedNode.id
            						end
        end);

    obj._e_event206 = obj.button31:addEventListener("onClick",
        function (event)
            -- Criar uma tabela com as informações específicas
            				local node = NDB.createChildNode(sheet, "listaNodes")
            
            				-- Preenchendo a tabela com os valores de RacasSemCaracteresEspeciais
            				for _, raca in ipairs(RacasSemCaracteresEspeciais) do
            					node[raca] = sheet[raca]
            				end
            
            				-- Preenchendo a tabela com os valores de Profissoes
            				for _, profissao in ipairs(Profissoes) do
            					node[profissao] = sheet[profissao]
            					node[profissao .. "descri"] = sheet[profissao .. "descri"]
            				end
            				
            				-- Preenchendo a tabela com os valores de Estilos de Luta
            				for _, est in ipairs(EdLSemCaracteresEspeciais) do
            					node[est] = sheet[est]
            				end
            
            				node.Armamento = sheet.Armamento
            				node.Observacao = sheet.Observacao
            				node.Conquistador = sheet.Conquistador
            				
            				-- Converter essa tabela para XML
            				local xml = NDB.exportXML(node)
            
            				local export = {}
            				local bytes = Utils.binaryEncode(export, "utf8", xml)
            
            				local stream = Utils.newMemoryStream()
            				stream:write(export)
            
            				Dialogs.saveFile("Salvar Ficha como XML", stream, "ficha.xml", "application/xml", function()
            					stream:close()
            					showMessage("Ficha Exportada.")
            				end)
        end);

    obj._e_event207 = obj.button32:addEventListener("onClick",
        function (event)
            Dialogs.openFile("Importar Ficha", "application/xml", false, 
            			function(arquivos)
            			local arq = arquivos[1];
            
            			local import = {};
            			local bytes = arq.stream:read(import, arq.stream.size);
            
            			local xml = Utils.binaryDecode(import, "utf8");
            			
            			NDB.createChildNode(sheet, "listaInformacoes")
            			NDB.importXML(sheet.listaInformacoes, xml);
            			
            			-- Preenchendo a tabela com os valores de RacasSemCaracteresEspeciais
            				for _, raca in ipairs(RacasSemCaracteresEspeciais) do
            					sheet[raca] = sheet.listaInformacoes[raca]
            				end
            
            				-- Preenchendo a tabela com os valores de Profissoes
            				for _, profissao in ipairs(Profissoes) do
            					sheet[profissao] = sheet.listaInformacoes[profissao]
            					sheet[profissao .. "descri"] = sheet.listaInformacoes[profissao .. "descri"]
            				end
            				
            				for _, est in ipairs(EdLSemCaracteresEspeciais) do
            					sheet[est] = sheet.listaInformacoes[est]
            				end
            				
            				sheet.Armamento = sheet.listaInformacoes.Armamento
            				sheet.Observacao = sheet.listaInformacoes.Observacao
            				sheet.Conquistador = sheet.listaInformacoes.Conquistador
            			end);
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event207);
        __o_rrpgObjs.removeEventListenerById(self._e_event206);
        __o_rrpgObjs.removeEventListenerById(self._e_event205);
        __o_rrpgObjs.removeEventListenerById(self._e_event204);
        __o_rrpgObjs.removeEventListenerById(self._e_event203);
        __o_rrpgObjs.removeEventListenerById(self._e_event202);
        __o_rrpgObjs.removeEventListenerById(self._e_event201);
        __o_rrpgObjs.removeEventListenerById(self._e_event200);
        __o_rrpgObjs.removeEventListenerById(self._e_event199);
        __o_rrpgObjs.removeEventListenerById(self._e_event198);
        __o_rrpgObjs.removeEventListenerById(self._e_event197);
        __o_rrpgObjs.removeEventListenerById(self._e_event196);
        __o_rrpgObjs.removeEventListenerById(self._e_event195);
        __o_rrpgObjs.removeEventListenerById(self._e_event194);
        __o_rrpgObjs.removeEventListenerById(self._e_event193);
        __o_rrpgObjs.removeEventListenerById(self._e_event192);
        __o_rrpgObjs.removeEventListenerById(self._e_event191);
        __o_rrpgObjs.removeEventListenerById(self._e_event190);
        __o_rrpgObjs.removeEventListenerById(self._e_event189);
        __o_rrpgObjs.removeEventListenerById(self._e_event188);
        __o_rrpgObjs.removeEventListenerById(self._e_event187);
        __o_rrpgObjs.removeEventListenerById(self._e_event186);
        __o_rrpgObjs.removeEventListenerById(self._e_event185);
        __o_rrpgObjs.removeEventListenerById(self._e_event184);
        __o_rrpgObjs.removeEventListenerById(self._e_event183);
        __o_rrpgObjs.removeEventListenerById(self._e_event182);
        __o_rrpgObjs.removeEventListenerById(self._e_event181);
        __o_rrpgObjs.removeEventListenerById(self._e_event180);
        __o_rrpgObjs.removeEventListenerById(self._e_event179);
        __o_rrpgObjs.removeEventListenerById(self._e_event178);
        __o_rrpgObjs.removeEventListenerById(self._e_event177);
        __o_rrpgObjs.removeEventListenerById(self._e_event176);
        __o_rrpgObjs.removeEventListenerById(self._e_event175);
        __o_rrpgObjs.removeEventListenerById(self._e_event174);
        __o_rrpgObjs.removeEventListenerById(self._e_event173);
        __o_rrpgObjs.removeEventListenerById(self._e_event172);
        __o_rrpgObjs.removeEventListenerById(self._e_event171);
        __o_rrpgObjs.removeEventListenerById(self._e_event170);
        __o_rrpgObjs.removeEventListenerById(self._e_event169);
        __o_rrpgObjs.removeEventListenerById(self._e_event168);
        __o_rrpgObjs.removeEventListenerById(self._e_event167);
        __o_rrpgObjs.removeEventListenerById(self._e_event166);
        __o_rrpgObjs.removeEventListenerById(self._e_event165);
        __o_rrpgObjs.removeEventListenerById(self._e_event164);
        __o_rrpgObjs.removeEventListenerById(self._e_event163);
        __o_rrpgObjs.removeEventListenerById(self._e_event162);
        __o_rrpgObjs.removeEventListenerById(self._e_event161);
        __o_rrpgObjs.removeEventListenerById(self._e_event160);
        __o_rrpgObjs.removeEventListenerById(self._e_event159);
        __o_rrpgObjs.removeEventListenerById(self._e_event158);
        __o_rrpgObjs.removeEventListenerById(self._e_event157);
        __o_rrpgObjs.removeEventListenerById(self._e_event156);
        __o_rrpgObjs.removeEventListenerById(self._e_event155);
        __o_rrpgObjs.removeEventListenerById(self._e_event154);
        __o_rrpgObjs.removeEventListenerById(self._e_event153);
        __o_rrpgObjs.removeEventListenerById(self._e_event152);
        __o_rrpgObjs.removeEventListenerById(self._e_event151);
        __o_rrpgObjs.removeEventListenerById(self._e_event150);
        __o_rrpgObjs.removeEventListenerById(self._e_event149);
        __o_rrpgObjs.removeEventListenerById(self._e_event148);
        __o_rrpgObjs.removeEventListenerById(self._e_event147);
        __o_rrpgObjs.removeEventListenerById(self._e_event146);
        __o_rrpgObjs.removeEventListenerById(self._e_event145);
        __o_rrpgObjs.removeEventListenerById(self._e_event144);
        __o_rrpgObjs.removeEventListenerById(self._e_event143);
        __o_rrpgObjs.removeEventListenerById(self._e_event142);
        __o_rrpgObjs.removeEventListenerById(self._e_event141);
        __o_rrpgObjs.removeEventListenerById(self._e_event140);
        __o_rrpgObjs.removeEventListenerById(self._e_event139);
        __o_rrpgObjs.removeEventListenerById(self._e_event138);
        __o_rrpgObjs.removeEventListenerById(self._e_event137);
        __o_rrpgObjs.removeEventListenerById(self._e_event136);
        __o_rrpgObjs.removeEventListenerById(self._e_event135);
        __o_rrpgObjs.removeEventListenerById(self._e_event134);
        __o_rrpgObjs.removeEventListenerById(self._e_event133);
        __o_rrpgObjs.removeEventListenerById(self._e_event132);
        __o_rrpgObjs.removeEventListenerById(self._e_event131);
        __o_rrpgObjs.removeEventListenerById(self._e_event130);
        __o_rrpgObjs.removeEventListenerById(self._e_event129);
        __o_rrpgObjs.removeEventListenerById(self._e_event128);
        __o_rrpgObjs.removeEventListenerById(self._e_event127);
        __o_rrpgObjs.removeEventListenerById(self._e_event126);
        __o_rrpgObjs.removeEventListenerById(self._e_event125);
        __o_rrpgObjs.removeEventListenerById(self._e_event124);
        __o_rrpgObjs.removeEventListenerById(self._e_event123);
        __o_rrpgObjs.removeEventListenerById(self._e_event122);
        __o_rrpgObjs.removeEventListenerById(self._e_event121);
        __o_rrpgObjs.removeEventListenerById(self._e_event120);
        __o_rrpgObjs.removeEventListenerById(self._e_event119);
        __o_rrpgObjs.removeEventListenerById(self._e_event118);
        __o_rrpgObjs.removeEventListenerById(self._e_event117);
        __o_rrpgObjs.removeEventListenerById(self._e_event116);
        __o_rrpgObjs.removeEventListenerById(self._e_event115);
        __o_rrpgObjs.removeEventListenerById(self._e_event114);
        __o_rrpgObjs.removeEventListenerById(self._e_event113);
        __o_rrpgObjs.removeEventListenerById(self._e_event112);
        __o_rrpgObjs.removeEventListenerById(self._e_event111);
        __o_rrpgObjs.removeEventListenerById(self._e_event110);
        __o_rrpgObjs.removeEventListenerById(self._e_event109);
        __o_rrpgObjs.removeEventListenerById(self._e_event108);
        __o_rrpgObjs.removeEventListenerById(self._e_event107);
        __o_rrpgObjs.removeEventListenerById(self._e_event106);
        __o_rrpgObjs.removeEventListenerById(self._e_event105);
        __o_rrpgObjs.removeEventListenerById(self._e_event104);
        __o_rrpgObjs.removeEventListenerById(self._e_event103);
        __o_rrpgObjs.removeEventListenerById(self._e_event102);
        __o_rrpgObjs.removeEventListenerById(self._e_event101);
        __o_rrpgObjs.removeEventListenerById(self._e_event100);
        __o_rrpgObjs.removeEventListenerById(self._e_event99);
        __o_rrpgObjs.removeEventListenerById(self._e_event98);
        __o_rrpgObjs.removeEventListenerById(self._e_event97);
        __o_rrpgObjs.removeEventListenerById(self._e_event96);
        __o_rrpgObjs.removeEventListenerById(self._e_event95);
        __o_rrpgObjs.removeEventListenerById(self._e_event94);
        __o_rrpgObjs.removeEventListenerById(self._e_event93);
        __o_rrpgObjs.removeEventListenerById(self._e_event92);
        __o_rrpgObjs.removeEventListenerById(self._e_event91);
        __o_rrpgObjs.removeEventListenerById(self._e_event90);
        __o_rrpgObjs.removeEventListenerById(self._e_event89);
        __o_rrpgObjs.removeEventListenerById(self._e_event88);
        __o_rrpgObjs.removeEventListenerById(self._e_event87);
        __o_rrpgObjs.removeEventListenerById(self._e_event86);
        __o_rrpgObjs.removeEventListenerById(self._e_event85);
        __o_rrpgObjs.removeEventListenerById(self._e_event84);
        __o_rrpgObjs.removeEventListenerById(self._e_event83);
        __o_rrpgObjs.removeEventListenerById(self._e_event82);
        __o_rrpgObjs.removeEventListenerById(self._e_event81);
        __o_rrpgObjs.removeEventListenerById(self._e_event80);
        __o_rrpgObjs.removeEventListenerById(self._e_event79);
        __o_rrpgObjs.removeEventListenerById(self._e_event78);
        __o_rrpgObjs.removeEventListenerById(self._e_event77);
        __o_rrpgObjs.removeEventListenerById(self._e_event76);
        __o_rrpgObjs.removeEventListenerById(self._e_event75);
        __o_rrpgObjs.removeEventListenerById(self._e_event74);
        __o_rrpgObjs.removeEventListenerById(self._e_event73);
        __o_rrpgObjs.removeEventListenerById(self._e_event72);
        __o_rrpgObjs.removeEventListenerById(self._e_event71);
        __o_rrpgObjs.removeEventListenerById(self._e_event70);
        __o_rrpgObjs.removeEventListenerById(self._e_event69);
        __o_rrpgObjs.removeEventListenerById(self._e_event68);
        __o_rrpgObjs.removeEventListenerById(self._e_event67);
        __o_rrpgObjs.removeEventListenerById(self._e_event66);
        __o_rrpgObjs.removeEventListenerById(self._e_event65);
        __o_rrpgObjs.removeEventListenerById(self._e_event64);
        __o_rrpgObjs.removeEventListenerById(self._e_event63);
        __o_rrpgObjs.removeEventListenerById(self._e_event62);
        __o_rrpgObjs.removeEventListenerById(self._e_event61);
        __o_rrpgObjs.removeEventListenerById(self._e_event60);
        __o_rrpgObjs.removeEventListenerById(self._e_event59);
        __o_rrpgObjs.removeEventListenerById(self._e_event58);
        __o_rrpgObjs.removeEventListenerById(self._e_event57);
        __o_rrpgObjs.removeEventListenerById(self._e_event56);
        __o_rrpgObjs.removeEventListenerById(self._e_event55);
        __o_rrpgObjs.removeEventListenerById(self._e_event54);
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.rectangle193 ~= nil then self.rectangle193:destroy(); self.rectangle193 = nil; end;
        if self.Exp ~= nil then self.Exp:destroy(); self.Exp = nil; end;
        if self.genero ~= nil then self.genero:destroy(); self.genero = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.rectangle95 ~= nil then self.rectangle95:destroy(); self.rectangle95 = nil; end;
        if self.PrecisaoPassivo ~= nil then self.PrecisaoPassivo:destroy(); self.PrecisaoPassivo = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.rectangle160 ~= nil then self.rectangle160:destroy(); self.rectangle160 = nil; end;
        if self.rectangle176 ~= nil then self.rectangle176:destroy(); self.rectangle176 = nil; end;
        if self.ForcaPassivo ~= nil then self.ForcaPassivo:destroy(); self.ForcaPassivo = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.ComboRaca ~= nil then self.ComboRaca:destroy(); self.ComboRaca = nil; end;
        if self.editEquipamentos ~= nil then self.editEquipamentos:destroy(); self.editEquipamentos = nil; end;
        if self.ForcaDeVontadeBase ~= nil then self.ForcaDeVontadeBase:destroy(); self.ForcaDeVontadeBase = nil; end;
        if self.ForcaDeVontadeTotal ~= nil then self.ForcaDeVontadeTotal:destroy(); self.ForcaDeVontadeTotal = nil; end;
        if self.tabControl6 ~= nil then self.tabControl6:destroy(); self.tabControl6 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.rectangle126 ~= nil then self.rectangle126:destroy(); self.rectangle126 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.VigorEquips ~= nil then self.VigorEquips:destroy(); self.VigorEquips = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.rectangle151 ~= nil then self.rectangle151:destroy(); self.rectangle151 = nil; end;
        if self.rectangle186 ~= nil then self.rectangle186:destroy(); self.rectangle186 = nil; end;
        if self.NomeRaca ~= nil then self.NomeRaca:destroy(); self.NomeRaca = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.rectangle121 ~= nil then self.rectangle121:destroy(); self.rectangle121 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.tab11 ~= nil then self.tab11:destroy(); self.tab11 = nil; end;
        if self.rectangle200 ~= nil then self.rectangle200:destroy(); self.rectangle200 = nil; end;
        if self.ImagemRaca ~= nil then self.ImagemRaca:destroy(); self.ImagemRaca = nil; end;
        if self.rectangle156 ~= nil then self.rectangle156:destroy(); self.rectangle156 = nil; end;
        if self.NomeProfissaoSecundaria ~= nil then self.NomeProfissaoSecundaria:destroy(); self.NomeProfissaoSecundaria = nil; end;
        if self.Atributos ~= nil then self.Atributos:destroy(); self.Atributos = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.tab14 ~= nil then self.tab14:destroy(); self.tab14 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle106 ~= nil then self.rectangle106:destroy(); self.rectangle106 = nil; end;
        if self.rectangle110 ~= nil then self.rectangle110:destroy(); self.rectangle110 = nil; end;
        if self.rectangle188 ~= nil then self.rectangle188:destroy(); self.rectangle188 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.AbaProfissaoPrincipal ~= nil then self.AbaProfissaoPrincipal:destroy(); self.AbaProfissaoPrincipal = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.DescricaoProfissionalPrimaria ~= nil then self.DescricaoProfissionalPrimaria:destroy(); self.DescricaoProfissionalPrimaria = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.DescriNpc ~= nil then self.DescriNpc:destroy(); self.DescriNpc = nil; end;
        if self.TierSecundaria ~= nil then self.TierSecundaria:destroy(); self.TierSecundaria = nil; end;
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.estadoArmamento ~= nil then self.estadoArmamento:destroy(); self.estadoArmamento = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.rectangle132 ~= nil then self.rectangle132:destroy(); self.rectangle132 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.dataLink68 ~= nil then self.dataLink68:destroy(); self.dataLink68 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.AbaHistoria ~= nil then self.AbaHistoria:destroy(); self.AbaHistoria = nil; end;
        if self.PrecisaoEquips ~= nil then self.PrecisaoEquips:destroy(); self.PrecisaoEquips = nil; end;
        if self.ForcaEquips ~= nil then self.ForcaEquips:destroy(); self.ForcaEquips = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.estLSecundario ~= nil then self.estLSecundario:destroy(); self.estLSecundario = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.dataLink63 ~= nil then self.dataLink63:destroy(); self.dataLink63 = nil; end;
        if self.dataLink73 ~= nil then self.dataLink73:destroy(); self.dataLink73 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.richEdit4 ~= nil then self.richEdit4:destroy(); self.richEdit4 = nil; end;
        if self.rectangle138 ~= nil then self.rectangle138:destroy(); self.rectangle138 = nil; end;
        if self.tripulacao ~= nil then self.tripulacao:destroy(); self.tripulacao = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.dataLink66 ~= nil then self.dataLink66:destroy(); self.dataLink66 = nil; end;
        if self.dataLink74 ~= nil then self.dataLink74:destroy(); self.dataLink74 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.ExportImport ~= nil then self.ExportImport:destroy(); self.ExportImport = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.rectangle141 ~= nil then self.rectangle141:destroy(); self.rectangle141 = nil; end;
        if self.MiscLayout ~= nil then self.MiscLayout:destroy(); self.MiscLayout = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.ComboProfissaoSecundaria ~= nil then self.ComboProfissaoSecundaria:destroy(); self.ComboProfissaoSecundaria = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.rectangle144 ~= nil then self.rectangle144:destroy(); self.rectangle144 = nil; end;
        if self.Akuma ~= nil then self.Akuma:destroy(); self.Akuma = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.LayoutProfissaoSecundaria ~= nil then self.LayoutProfissaoSecundaria:destroy(); self.LayoutProfissaoSecundaria = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.CombateTreino ~= nil then self.CombateTreino:destroy(); self.CombateTreino = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.ForcaDeVontadePassivo ~= nil then self.ForcaDeVontadePassivo:destroy(); self.ForcaDeVontadePassivo = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.tituloDoPersonagem ~= nil then self.tituloDoPersonagem:destroy(); self.tituloDoPersonagem = nil; end;
        if self.rectangle168 ~= nil then self.rectangle168:destroy(); self.rectangle168 = nil; end;
        if self.rectangle190 ~= nil then self.rectangle190:destroy(); self.rectangle190 = nil; end;
        if self.rectangle98 ~= nil then self.rectangle98:destroy(); self.rectangle98 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.AgilidadeTotal ~= nil then self.AgilidadeTotal:destroy(); self.AgilidadeTotal = nil; end;
        if self.rectangle163 ~= nil then self.rectangle163:destroy(); self.rectangle163 = nil; end;
        if self.rectangle173 ~= nil then self.rectangle173:destroy(); self.rectangle173 = nil; end;
        if self.rectangle97 ~= nil then self.rectangle97:destroy(); self.rectangle97 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.buttonExit ~= nil then self.buttonExit:destroy(); self.buttonExit = nil; end;
        if self.tabControl5 ~= nil then self.tabControl5:destroy(); self.tabControl5 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.rectangle166 ~= nil then self.rectangle166:destroy(); self.rectangle166 = nil; end;
        if self.rectangle129 ~= nil then self.rectangle129:destroy(); self.rectangle129 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.rectangle174 ~= nil then self.rectangle174:destroy(); self.rectangle174 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.XpMaxSecundaria ~= nil then self.XpMaxSecundaria:destroy(); self.XpMaxSecundaria = nil; end;
        if self.rectangle185 ~= nil then self.rectangle185:destroy(); self.rectangle185 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.rectangle124 ~= nil then self.rectangle124:destroy(); self.rectangle124 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.rectangle179 ~= nil then self.rectangle179:destroy(); self.rectangle179 = nil; end;
        if self.rectangle153 ~= nil then self.rectangle153:destroy(); self.rectangle153 = nil; end;
        if self.rectangle180 ~= nil then self.rectangle180:destroy(); self.rectangle180 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.tab17 ~= nil then self.tab17:destroy(); self.tab17 = nil; end;
        if self.CarismaBase ~= nil then self.CarismaBase:destroy(); self.CarismaBase = nil; end;
        if self.rectangle105 ~= nil then self.rectangle105:destroy(); self.rectangle105 = nil; end;
        if self.rectangle115 ~= nil then self.rectangle115:destroy(); self.rectangle115 = nil; end;
        if self.Equipamento ~= nil then self.Equipamento:destroy(); self.Equipamento = nil; end;
        if self.rectangle158 ~= nil then self.rectangle158:destroy(); self.rectangle158 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.TierPrincipal ~= nil then self.TierPrincipal:destroy(); self.TierPrincipal = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.rectangle100 ~= nil then self.rectangle100:destroy(); self.rectangle100 = nil; end;
        if self.DescricaoRacial ~= nil then self.DescricaoRacial:destroy(); self.DescricaoRacial = nil; end;
        if self.rectangle112 ~= nil then self.rectangle112:destroy(); self.rectangle112 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.Nivel ~= nil then self.Nivel:destroy(); self.Nivel = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.Vinculo ~= nil then self.Vinculo:destroy(); self.Vinculo = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.idade ~= nil then self.idade:destroy(); self.idade = nil; end;
        if self.CarismaTotal ~= nil then self.CarismaTotal:destroy(); self.CarismaTotal = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.PrecisaoTotal ~= nil then self.PrecisaoTotal:destroy(); self.PrecisaoTotal = nil; end;
        if self.InteligenciaBase ~= nil then self.InteligenciaBase:destroy(); self.InteligenciaBase = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.rectangle137 ~= nil then self.rectangle137:destroy(); self.rectangle137 = nil; end;
        if self.estadoConquistador ~= nil then self.estadoConquistador:destroy(); self.estadoConquistador = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.LayoutProfissaoPrincipal ~= nil then self.LayoutProfissaoPrincipal:destroy(); self.LayoutProfissaoPrincipal = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.rectangle130 ~= nil then self.rectangle130:destroy(); self.rectangle130 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.ForDVonButton ~= nil then self.ForDVonButton:destroy(); self.ForDVonButton = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.AbaAnotacoes ~= nil then self.AbaAnotacoes:destroy(); self.AbaAnotacoes = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.ForcaButton ~= nil then self.ForcaButton:destroy(); self.ForcaButton = nil; end;
        if self.richEdit3 ~= nil then self.richEdit3:destroy(); self.richEdit3 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.FotoProfissaoPrincipal ~= nil then self.FotoProfissaoPrincipal:destroy(); self.FotoProfissaoPrincipal = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.dataLink71 ~= nil then self.dataLink71:destroy(); self.dataLink71 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.AgilidadeBase ~= nil then self.AgilidadeBase:destroy(); self.AgilidadeBase = nil; end;
        if self.richEdit6 ~= nil then self.richEdit6:destroy(); self.richEdit6 = nil; end;
        if self.rectangle149 ~= nil then self.rectangle149:destroy(); self.rectangle149 = nil; end;
        if self.LayoutEquipamentos ~= nil then self.LayoutEquipamentos:destroy(); self.LayoutEquipamentos = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.FotoRaca ~= nil then self.FotoRaca:destroy(); self.FotoRaca = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.buttonSair ~= nil then self.buttonSair:destroy(); self.buttonSair = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.tab20 ~= nil then self.tab20:destroy(); self.tab20 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.rectangle143 ~= nil then self.rectangle143:destroy(); self.rectangle143 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.rectangle198 ~= nil then self.rectangle198:destroy(); self.rectangle198 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.rectangle146 ~= nil then self.rectangle146:destroy(); self.rectangle146 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.EdLeAkuma ~= nil then self.EdLeAkuma:destroy(); self.EdLeAkuma = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.rectangle195 ~= nil then self.rectangle195:destroy(); self.rectangle195 = nil; end;
        if self.AbaProfissaoSecundaria ~= nil then self.AbaProfissaoSecundaria:destroy(); self.AbaProfissaoSecundaria = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.estiloDeLutaSec ~= nil then self.estiloDeLutaSec:destroy(); self.estiloDeLutaSec = nil; end;
        if self.ForcaBase ~= nil then self.ForcaBase:destroy(); self.ForcaBase = nil; end;
        if self.rectangle192 ~= nil then self.rectangle192:destroy(); self.rectangle192 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.VigorTotal ~= nil then self.VigorTotal:destroy(); self.VigorTotal = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.rectangle161 ~= nil then self.rectangle161:destroy(); self.rectangle161 = nil; end;
        if self.EstLuta ~= nil then self.EstLuta:destroy(); self.EstLuta = nil; end;
        if self.rectangle91 ~= nil then self.rectangle91:destroy(); self.rectangle91 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.rectangle171 ~= nil then self.rectangle171:destroy(); self.rectangle171 = nil; end;
        if self.CarismaPassivo ~= nil then self.CarismaPassivo:destroy(); self.CarismaPassivo = nil; end;
        if self.tabControl7 ~= nil then self.tabControl7:destroy(); self.tabControl7 = nil; end;
        if self.ExpAtual ~= nil then self.ExpAtual:destroy(); self.ExpAtual = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.ForcaDeVontadeTreino ~= nil then self.ForcaDeVontadeTreino:destroy(); self.ForcaDeVontadeTreino = nil; end;
        if self.InteligenciaPassivo ~= nil then self.InteligenciaPassivo:destroy(); self.InteligenciaPassivo = nil; end;
        if self.rectangle127 ~= nil then self.rectangle127:destroy(); self.rectangle127 = nil; end;
        if self.editHistoria ~= nil then self.editHistoria:destroy(); self.editHistoria = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.rectangle164 ~= nil then self.rectangle164:destroy(); self.rectangle164 = nil; end;
        if self.estLPrincipal ~= nil then self.estLPrincipal:destroy(); self.estLPrincipal = nil; end;
        if self.tabControl2 ~= nil then self.tabControl2:destroy(); self.tabControl2 = nil; end;
        if self.rectangle150 ~= nil then self.rectangle150:destroy(); self.rectangle150 = nil; end;
        if self.NomeProfissaoPrincipal ~= nil then self.NomeProfissaoPrincipal:destroy(); self.NomeProfissaoPrincipal = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle122 ~= nil then self.rectangle122:destroy(); self.rectangle122 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.rectangle187 ~= nil then self.rectangle187:destroy(); self.rectangle187 = nil; end;
        if self.VigorPassivo ~= nil then self.VigorPassivo:destroy(); self.VigorPassivo = nil; end;
        if self.AgilidadePassivo ~= nil then self.AgilidadePassivo:destroy(); self.AgilidadePassivo = nil; end;
        if self.tab12 ~= nil then self.tab12:destroy(); self.tab12 = nil; end;
        if self.rectangle108 ~= nil then self.rectangle108:destroy(); self.rectangle108 = nil; end;
        if self.DetalhamentoSecundario ~= nil then self.DetalhamentoSecundario:destroy(); self.DetalhamentoSecundario = nil; end;
        if self.rectangle155 ~= nil then self.rectangle155:destroy(); self.rectangle155 = nil; end;
        if self.rectangle182 ~= nil then self.rectangle182:destroy(); self.rectangle182 = nil; end;
        if self.tab15 ~= nil then self.tab15:destroy(); self.tab15 = nil; end;
        if self.LayoutArmamentos ~= nil then self.LayoutArmamentos:destroy(); self.LayoutArmamentos = nil; end;
        if self.CarisButton ~= nil then self.CarisButton:destroy(); self.CarisButton = nil; end;
        if self.rectangle107 ~= nil then self.rectangle107:destroy(); self.rectangle107 = nil; end;
        if self.rectangle117 ~= nil then self.rectangle117:destroy(); self.rectangle117 = nil; end;
        if self.rectangle189 ~= nil then self.rectangle189:destroy(); self.rectangle189 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.PercepcaoTreino ~= nil then self.PercepcaoTreino:destroy(); self.PercepcaoTreino = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.Raca ~= nil then self.Raca:destroy(); self.Raca = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle102 ~= nil then self.rectangle102:destroy(); self.rectangle102 = nil; end;
        if self.Diversos ~= nil then self.Diversos:destroy(); self.Diversos = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.Vinculos ~= nil then self.Vinculos:destroy(); self.Vinculos = nil; end;
        if self.estluta ~= nil then self.estluta:destroy(); self.estluta = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.tab18 ~= nil then self.tab18:destroy(); self.tab18 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.rectangle119 ~= nil then self.rectangle119:destroy(); self.rectangle119 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.PercepcaoPassivo ~= nil then self.PercepcaoPassivo:destroy(); self.PercepcaoPassivo = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.editEquip ~= nil then self.editEquip:destroy(); self.editEquip = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.PercepcaoBase ~= nil then self.PercepcaoBase:destroy(); self.PercepcaoBase = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.image21 ~= nil then self.image21:destroy(); self.image21 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.InteligenciaEquips ~= nil then self.InteligenciaEquips:destroy(); self.InteligenciaEquips = nil; end;
        if self.listaOrganizacoes ~= nil then self.listaOrganizacoes:destroy(); self.listaOrganizacoes = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.CombateEquips ~= nil then self.CombateEquips:destroy(); self.CombateEquips = nil; end;
        if self.rectangle135 ~= nil then self.rectangle135:destroy(); self.rectangle135 = nil; end;
        if self.imagemEdL ~= nil then self.imagemEdL:destroy(); self.imagemEdL = nil; end;
        if self.dataLink69 ~= nil then self.dataLink69:destroy(); self.dataLink69 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.imagem ~= nil then self.imagem:destroy(); self.imagem = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.DescricaoProfissionalSecundaria ~= nil then self.DescricaoProfissionalSecundaria:destroy(); self.DescricaoProfissionalSecundaria = nil; end;
        if self.dataLink72 ~= nil then self.dataLink72:destroy(); self.dataLink72 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.InteligenciaTreino ~= nil then self.InteligenciaTreino:destroy(); self.InteligenciaTreino = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.richEdit5 ~= nil then self.richEdit5:destroy(); self.richEdit5 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.ImagemProfissaoPrincipal ~= nil then self.ImagemProfissaoPrincipal:destroy(); self.ImagemProfissaoPrincipal = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.dataLink67 ~= nil then self.dataLink67:destroy(); self.dataLink67 = nil; end;
        if self.dataLink77 ~= nil then self.dataLink77:destroy(); self.dataLink77 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.estiloDeLuta ~= nil then self.estiloDeLuta:destroy(); self.estiloDeLuta = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.ProfissaoPrincipal ~= nil then self.ProfissaoPrincipal:destroy(); self.ProfissaoPrincipal = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.tierArmamento ~= nil then self.tierArmamento:destroy(); self.tierArmamento = nil; end;
        if self.dataLink78 ~= nil then self.dataLink78:destroy(); self.dataLink78 = nil; end;
        if self.nomeListagem ~= nil then self.nomeListagem:destroy(); self.nomeListagem = nil; end;
        if self.CarismaEquips ~= nil then self.CarismaEquips:destroy(); self.CarismaEquips = nil; end;
        if self.moedas ~= nil then self.moedas:destroy(); self.moedas = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.ImagemBandeira ~= nil then self.ImagemBandeira:destroy(); self.ImagemBandeira = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.CombateBase ~= nil then self.CombateBase:destroy(); self.CombateBase = nil; end;
        if self.rectangle145 ~= nil then self.rectangle145:destroy(); self.rectangle145 = nil; end;
        if self.AbaRaca ~= nil then self.AbaRaca:destroy(); self.AbaRaca = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.nomeDoPersonagem ~= nil then self.nomeDoPersonagem:destroy(); self.nomeDoPersonagem = nil; end;
        if self.DefButton ~= nil then self.DefButton:destroy(); self.DefButton = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.FotoProfissaoSecundaria ~= nil then self.FotoProfissaoSecundaria:destroy(); self.FotoProfissaoSecundaria = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle169 ~= nil then self.rectangle169:destroy(); self.rectangle169 = nil; end;
        if self.XpMaxPrincipal ~= nil then self.XpMaxPrincipal:destroy(); self.XpMaxPrincipal = nil; end;
        if self.rectangle99 ~= nil then self.rectangle99:destroy(); self.rectangle99 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.PrecButton ~= nil then self.PrecButton:destroy(); self.PrecButton = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.rectangle197 ~= nil then self.rectangle197:destroy(); self.rectangle197 = nil; end;
        if self.Haki ~= nil then self.Haki:destroy(); self.Haki = nil; end;
        if self.rectangle172 ~= nil then self.rectangle172:destroy(); self.rectangle172 = nil; end;
        if self.rectangle94 ~= nil then self.rectangle94:destroy(); self.rectangle94 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.CarismaTreino ~= nil then self.CarismaTreino:destroy(); self.CarismaTreino = nil; end;
        if self.NomeNpc ~= nil then self.NomeNpc:destroy(); self.NomeNpc = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.rectangle167 ~= nil then self.rectangle167:destroy(); self.rectangle167 = nil; end;
        if self.rectangle177 ~= nil then self.rectangle177:destroy(); self.rectangle177 = nil; end;
        if self.rectangle93 ~= nil then self.rectangle93:destroy(); self.rectangle93 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.ProfissaoSecundaria ~= nil then self.ProfissaoSecundaria:destroy(); self.ProfissaoSecundaria = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.rectangle125 ~= nil then self.rectangle125:destroy(); self.rectangle125 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.VigorButton ~= nil then self.VigorButton:destroy(); self.VigorButton = nil; end;
        if self.rectangle178 ~= nil then self.rectangle178:destroy(); self.rectangle178 = nil; end;
        if self.rectangle152 ~= nil then self.rectangle152:destroy(); self.rectangle152 = nil; end;
        if self.rectangle181 ~= nil then self.rectangle181:destroy(); self.rectangle181 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.rectangle120 ~= nil then self.rectangle120:destroy(); self.rectangle120 = nil; end;
        if self.rectangle201 ~= nil then self.rectangle201:destroy(); self.rectangle201 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.tab10 ~= nil then self.tab10:destroy(); self.tab10 = nil; end;
        if self.LayoutDiversos ~= nil then self.LayoutDiversos:destroy(); self.LayoutDiversos = nil; end;
        if self.estadoObservacao ~= nil then self.estadoObservacao:destroy(); self.estadoObservacao = nil; end;
        if self.rectangle157 ~= nil then self.rectangle157:destroy(); self.rectangle157 = nil; end;
        if self.rectangle114 ~= nil then self.rectangle114:destroy(); self.rectangle114 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.PercepcaoTotal ~= nil then self.PercepcaoTotal:destroy(); self.PercepcaoTotal = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.rectangle101 ~= nil then self.rectangle101:destroy(); self.rectangle101 = nil; end;
        if self.rectangle111 ~= nil then self.rectangle111:destroy(); self.rectangle111 = nil; end;
        if self.labelListagem ~= nil then self.labelListagem:destroy(); self.labelListagem = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.DetalhamentoPrimario ~= nil then self.DetalhamentoPrimario:destroy(); self.DetalhamentoPrimario = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.ComboProfissaoPrincipal ~= nil then self.ComboProfissaoPrincipal:destroy(); self.ComboProfissaoPrincipal = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.rectangle136 ~= nil then self.rectangle136:destroy(); self.rectangle136 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.VigorBase ~= nil then self.VigorBase:destroy(); self.VigorBase = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.rectangle133 ~= nil then self.rectangle133:destroy(); self.rectangle133 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.editDiversos ~= nil then self.editDiversos:destroy(); self.editDiversos = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.dataLink70 ~= nil then self.dataLink70:destroy(); self.dataLink70 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.Npcs ~= nil then self.Npcs:destroy(); self.Npcs = nil; end;
        if self.rectangle139 ~= nil then self.rectangle139:destroy(); self.rectangle139 = nil; end;
        if self.VigorTreino ~= nil then self.VigorTreino:destroy(); self.VigorTreino = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.ForcaDeVontadeEquips ~= nil then self.ForcaDeVontadeEquips:destroy(); self.ForcaDeVontadeEquips = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.dataLink65 ~= nil then self.dataLink65:destroy(); self.dataLink65 = nil; end;
        if self.dataLink75 ~= nil then self.dataLink75:destroy(); self.dataLink75 = nil; end;
        if self.LayoutNpc ~= nil then self.LayoutNpc:destroy(); self.LayoutNpc = nil; end;
        if self.PrecisaoBase ~= nil then self.PrecisaoBase:destroy(); self.PrecisaoBase = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.Equipamentos ~= nil then self.Equipamentos:destroy(); self.Equipamentos = nil; end;
        if self.ForcaTotal ~= nil then self.ForcaTotal:destroy(); self.ForcaTotal = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.rectangle140 ~= nil then self.rectangle140:destroy(); self.rectangle140 = nil; end;
        if self.Misc ~= nil then self.Misc:destroy(); self.Misc = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.tierObservacao ~= nil then self.tierObservacao:destroy(); self.tierObservacao = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle147 ~= nil then self.rectangle147:destroy(); self.rectangle147 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.ComButton ~= nil then self.ComButton:destroy(); self.ComButton = nil; end;
        if self.rectangle194 ~= nil then self.rectangle194:destroy(); self.rectangle194 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.ImagemProfissaoSecundaria ~= nil then self.ImagemProfissaoSecundaria:destroy(); self.ImagemProfissaoSecundaria = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.Inventario ~= nil then self.Inventario:destroy(); self.Inventario = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.rectangle191 ~= nil then self.rectangle191:destroy(); self.rectangle191 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.fotoEquip ~= nil then self.fotoEquip:destroy(); self.fotoEquip = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.Armamentos ~= nil then self.Armamentos:destroy(); self.Armamentos = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.rectangle162 ~= nil then self.rectangle162:destroy(); self.rectangle162 = nil; end;
        if self.rectangle170 ~= nil then self.rectangle170:destroy(); self.rectangle170 = nil; end;
        if self.rectangle96 ~= nil then self.rectangle96:destroy(); self.rectangle96 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.editConsumiveis ~= nil then self.editConsumiveis:destroy(); self.editConsumiveis = nil; end;
        if self.tabControl4 ~= nil then self.tabControl4:destroy(); self.tabControl4 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.rectangle165 ~= nil then self.rectangle165:destroy(); self.rectangle165 = nil; end;
        if self.rectangle128 ~= nil then self.rectangle128:destroy(); self.rectangle128 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.rectangle175 ~= nil then self.rectangle175:destroy(); self.rectangle175 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.tabControl3 ~= nil then self.tabControl3:destroy(); self.tabControl3 = nil; end;
        if self.rectangle184 ~= nil then self.rectangle184:destroy(); self.rectangle184 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.rectangle123 ~= nil then self.rectangle123:destroy(); self.rectangle123 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.tab13 ~= nil then self.tab13:destroy(); self.tab13 = nil; end;
        if self.InteligenciaTotal ~= nil then self.InteligenciaTotal:destroy(); self.InteligenciaTotal = nil; end;
        if self.rectangle109 ~= nil then self.rectangle109:destroy(); self.rectangle109 = nil; end;
        if self.rectangle154 ~= nil then self.rectangle154:destroy(); self.rectangle154 = nil; end;
        if self.rectangle183 ~= nil then self.rectangle183:destroy(); self.rectangle183 = nil; end;
        if self.AgilidadeEquips ~= nil then self.AgilidadeEquips:destroy(); self.AgilidadeEquips = nil; end;
        if self.ImagemNpc ~= nil then self.ImagemNpc:destroy(); self.ImagemNpc = nil; end;
        if self.tab16 ~= nil then self.tab16:destroy(); self.tab16 = nil; end;
        if self.rectangle104 ~= nil then self.rectangle104:destroy(); self.rectangle104 = nil; end;
        if self.rectangle116 ~= nil then self.rectangle116:destroy(); self.rectangle116 = nil; end;
        if self.rectangle159 ~= nil then self.rectangle159:destroy(); self.rectangle159 = nil; end;
        if self.EstilosDeLuta ~= nil then self.EstilosDeLuta:destroy(); self.EstilosDeLuta = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tab19 ~= nil then self.tab19:destroy(); self.tab19 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.rectangle103 ~= nil then self.rectangle103:destroy(); self.rectangle103 = nil; end;
        if self.rectangle113 ~= nil then self.rectangle113:destroy(); self.rectangle113 = nil; end;
        if self.InfoGerais ~= nil then self.InfoGerais:destroy(); self.InfoGerais = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.PercepButton ~= nil then self.PercepButton:destroy(); self.PercepButton = nil; end;
        if self.rectangle118 ~= nil then self.rectangle118:destroy(); self.rectangle118 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.image20 ~= nil then self.image20:destroy(); self.image20 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.CombatePassivo ~= nil then self.CombatePassivo:destroy(); self.CombatePassivo = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.tierConquistador ~= nil then self.tierConquistador:destroy(); self.tierConquistador = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.rectangle134 ~= nil then self.rectangle134:destroy(); self.rectangle134 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.IntButton ~= nil then self.IntButton:destroy(); self.IntButton = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.CombateTotal ~= nil then self.CombateTotal:destroy(); self.CombateTotal = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle131 ~= nil then self.rectangle131:destroy(); self.rectangle131 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.sex ~= nil then self.sex:destroy(); self.sex = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.AgilidadeTreino ~= nil then self.AgilidadeTreino:destroy(); self.AgilidadeTreino = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.editHaki ~= nil then self.editHaki:destroy(); self.editHaki = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.dataLink76 ~= nil then self.dataLink76:destroy(); self.dataLink76 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.editArmamentos ~= nil then self.editArmamentos:destroy(); self.editArmamentos = nil; end;
        if self.rectangle148 ~= nil then self.rectangle148:destroy(); self.rectangle148 = nil; end;
        if self.PercepcaoEquips ~= nil then self.PercepcaoEquips:destroy(); self.PercepcaoEquips = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.LabelEdL ~= nil then self.LabelEdL:destroy(); self.LabelEdL = nil; end;
        if self.PrecisaoTreino ~= nil then self.PrecisaoTreino:destroy(); self.PrecisaoTreino = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.rectangle142 ~= nil then self.rectangle142:destroy(); self.rectangle142 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.LayoutConsumiveis ~= nil then self.LayoutConsumiveis:destroy(); self.LayoutConsumiveis = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.AkumaLayout ~= nil then self.AkumaLayout:destroy(); self.AkumaLayout = nil; end;
        if self.Consumiveis ~= nil then self.Consumiveis:destroy(); self.Consumiveis = nil; end;
        if self.rectangle199 ~= nil then self.rectangle199:destroy(); self.rectangle199 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.AgilButton ~= nil then self.AgilButton:destroy(); self.AgilButton = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.ForcaTreino ~= nil then self.ForcaTreino:destroy(); self.ForcaTreino = nil; end;
        if self.rectangle196 ~= nil then self.rectangle196:destroy(); self.rectangle196 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfmlBrincadeirasEmAltoMar()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_fmlBrincadeirasEmAltoMar();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _fmlBrincadeirasEmAltoMar = {
    newEditor = newfmlBrincadeirasEmAltoMar, 
    new = newfmlBrincadeirasEmAltoMar, 
    name = "fmlBrincadeirasEmAltoMar", 
    dataType = "B.A.M", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "Brincadeiras Em Alto Mar", 
    description=""};

fmlBrincadeirasEmAltoMar = _fmlBrincadeirasEmAltoMar;
Firecast.registrarForm(_fmlBrincadeirasEmAltoMar);
Firecast.registrarDataType(_fmlBrincadeirasEmAltoMar);

return _fmlBrincadeirasEmAltoMar;
