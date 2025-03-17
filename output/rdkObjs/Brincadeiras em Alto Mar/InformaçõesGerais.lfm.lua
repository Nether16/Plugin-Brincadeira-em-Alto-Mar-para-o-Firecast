require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_InfoGerais()
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
    obj:setFormType("sheetTemplate");
    obj:setTitle("Brincadeiras Em Alto Mar");
    obj:setName("InfoGerais");


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
	


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setWidth(10000);
    obj.rectangle1:setHeight(10000);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
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

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setLeft(2);
    obj.rectangle2:setTop(22);
    obj.rectangle2:setWidth(177);
    obj.rectangle2:setHeight(255);
    obj.rectangle2:setColor("#4169E1");
    obj.rectangle2:setName("rectangle2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout2);
    obj.rectangle3:setLeft(4);
    obj.rectangle3:setTop(24);
    obj.rectangle3:setWidth(173);
    obj.rectangle3:setHeight(251);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

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

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout2);
    obj.rectangle4:setLeft(2);
    obj.rectangle4:setTop(292);
    obj.rectangle4:setWidth(177);
    obj.rectangle4:setHeight(255);
    obj.rectangle4:setColor("#4169E1");
    obj.rectangle4:setName("rectangle4");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout2);
    obj.rectangle5:setLeft(4);
    obj.rectangle5:setTop(294);
    obj.rectangle5:setWidth(173);
    obj.rectangle5:setHeight(251);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setName("rectangle5");

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

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout3);
    obj.rectangle6:setLeft(192);
    obj.rectangle6:setTop(22);
    obj.rectangle6:setWidth(460);
    obj.rectangle6:setHeight(255);
    obj.rectangle6:setColor("#4169E1");
    obj.rectangle6:setName("rectangle6");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout3);
    obj.rectangle7:setLeft(194);
    obj.rectangle7:setTop(24);
    obj.rectangle7:setWidth(456);
    obj.rectangle7:setHeight(251);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setName("rectangle7");

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

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout3);
    obj.rectangle8:setLeft(315);
    obj.rectangle8:setTop(145);
    obj.rectangle8:setWidth(80);
    obj.rectangle8:setHeight(18);
    obj.rectangle8:setColor("#F5F5DC");
    obj.rectangle8:setXradius(7);
    obj.rectangle8:setYradius(7);
    obj.rectangle8:setCornerType("round");
    obj.rectangle8:setName("rectangle8");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout3);
    obj.rectangle9:setLeft(275);
    obj.rectangle9:setTop(145);
    obj.rectangle9:setWidth(35);
    obj.rectangle9:setHeight(18);
    obj.rectangle9:setColor("#F5F5DC");
    obj.rectangle9:setXradius(7);
    obj.rectangle9:setYradius(7);
    obj.rectangle9:setCornerType("round");
    obj.rectangle9:setName("rectangle9");

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

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout3);
    obj.rectangle10:setLeft(275);
    obj.rectangle10:setTop(176);
    obj.rectangle10:setWidth(120);
    obj.rectangle10:setHeight(17);
    obj.rectangle10:setColor("#F5F5DC");
    obj.rectangle10:setXradius(7);
    obj.rectangle10:setYradius(7);
    obj.rectangle10:setCornerType("round");
    obj.rectangle10:setName("rectangle10");

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

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout3);
    obj.rectangle11:setLeft(275);
    obj.rectangle11:setTop(206);
    obj.rectangle11:setWidth(120);
    obj.rectangle11:setHeight(17);
    obj.rectangle11:setColor("#F5F5DC");
    obj.rectangle11:setXradius(7);
    obj.rectangle11:setYradius(7);
    obj.rectangle11:setCornerType("round");
    obj.rectangle11:setName("rectangle11");

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

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout3);
    obj.rectangle12:setLeft(275);
    obj.rectangle12:setTop(236);
    obj.rectangle12:setWidth(120);
    obj.rectangle12:setHeight(17);
    obj.rectangle12:setColor("#F5F5DC");
    obj.rectangle12:setXradius(7);
    obj.rectangle12:setYradius(7);
    obj.rectangle12:setCornerType("round");
    obj.rectangle12:setName("rectangle12");

    obj.moedas = GUI.fromHandle(_obj_newObject("edit"));
    obj.moedas:setParent(obj.layout3);
    obj.moedas:setField("moedas");
    obj.moedas:setName("moedas");
    obj.moedas:setLeft(275);
    obj.moedas:setTop(234);
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

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout3);
    obj.rectangle13:setLeft(505);
    obj.rectangle13:setTop(146);
    obj.rectangle13:setWidth(120);
    obj.rectangle13:setHeight(17);
    obj.rectangle13:setColor("#F5F5DC");
    obj.rectangle13:setXradius(7);
    obj.rectangle13:setYradius(7);
    obj.rectangle13:setCornerType("round");
    obj.rectangle13:setName("rectangle13");

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

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout3);
    obj.rectangle14:setLeft(505);
    obj.rectangle14:setTop(176);
    obj.rectangle14:setWidth(120);
    obj.rectangle14:setHeight(17);
    obj.rectangle14:setColor("#F5F5DC");
    obj.rectangle14:setXradius(7);
    obj.rectangle14:setYradius(7);
    obj.rectangle14:setCornerType("round");
    obj.rectangle14:setName("rectangle14");

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

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout3);
    obj.rectangle15:setLeft(505);
    obj.rectangle15:setTop(206);
    obj.rectangle15:setWidth(120);
    obj.rectangle15:setHeight(17);
    obj.rectangle15:setColor("#F5F5DC");
    obj.rectangle15:setXradius(7);
    obj.rectangle15:setYradius(7);
    obj.rectangle15:setCornerType("round");
    obj.rectangle15:setName("rectangle15");

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

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout3);
    obj.rectangle16:setLeft(505);
    obj.rectangle16:setTop(236);
    obj.rectangle16:setWidth(120);
    obj.rectangle16:setHeight(17);
    obj.rectangle16:setColor("#F5F5DC");
    obj.rectangle16:setXradius(7);
    obj.rectangle16:setYradius(7);
    obj.rectangle16:setCornerType("round");
    obj.rectangle16:setName("rectangle16");

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

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout4);
    obj.rectangle17:setLeft(192);
    obj.rectangle17:setTop(292);
    obj.rectangle17:setWidth(97);
    obj.rectangle17:setHeight(123);
    obj.rectangle17:setColor("#4169E1");
    obj.rectangle17:setName("rectangle17");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout4);
    obj.rectangle18:setLeft(194);
    obj.rectangle18:setTop(294);
    obj.rectangle18:setWidth(93);
    obj.rectangle18:setHeight(119);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setName("rectangle18");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout4);
    obj.rectangle19:setLeft(196);
    obj.rectangle19:setTop(296);
    obj.rectangle19:setWidth(89);
    obj.rectangle19:setHeight(115);
    obj.rectangle19:setColor("#F5F5DC");
    obj.rectangle19:setName("rectangle19");

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

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout4);
    obj.rectangle20:setLeft(199.5);
    obj.rectangle20:setTop(300);
    obj.rectangle20:setWidth(82);
    obj.rectangle20:setHeight(92);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setName("rectangle20");

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

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout4);
    obj.rectangle21:setLeft(555);
    obj.rectangle21:setTop(292);
    obj.rectangle21:setWidth(97);
    obj.rectangle21:setHeight(123);
    obj.rectangle21:setColor("#4169E1");
    obj.rectangle21:setName("rectangle21");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout4);
    obj.rectangle22:setLeft(557);
    obj.rectangle22:setTop(294);
    obj.rectangle22:setWidth(93);
    obj.rectangle22:setHeight(119);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setName("rectangle22");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout4);
    obj.rectangle23:setLeft(559);
    obj.rectangle23:setTop(296);
    obj.rectangle23:setWidth(89);
    obj.rectangle23:setHeight(115);
    obj.rectangle23:setColor("#F5F5DC");
    obj.rectangle23:setName("rectangle23");

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

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout4);
    obj.rectangle24:setLeft(562.5);
    obj.rectangle24:setTop(300);
    obj.rectangle24:setWidth(82);
    obj.rectangle24:setHeight(92);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setName("rectangle24");

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

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout4);
    obj.rectangle25:setLeft(302);
    obj.rectangle25:setTop(292);
    obj.rectangle25:setWidth(240);
    obj.rectangle25:setHeight(123);
    obj.rectangle25:setColor("#4169E1");
    obj.rectangle25:setName("rectangle25");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout4);
    obj.rectangle26:setLeft(304);
    obj.rectangle26:setTop(294);
    obj.rectangle26:setWidth(236);
    obj.rectangle26:setHeight(119);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setName("rectangle26");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout4);
    obj.rectangle27:setLeft(306);
    obj.rectangle27:setTop(296);
    obj.rectangle27:setWidth(232);
    obj.rectangle27:setHeight(115);
    obj.rectangle27:setColor("#F5F5DC");
    obj.rectangle27:setName("rectangle27");

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

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout4);
    obj.rectangle28:setLeft(310);
    obj.rectangle28:setTop(300);
    obj.rectangle28:setWidth(225);
    obj.rectangle28:setHeight(92);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setName("rectangle28");

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

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout4);
    obj.rectangle29:setLeft(302);
    obj.rectangle29:setTop(424);
    obj.rectangle29:setWidth(240);
    obj.rectangle29:setHeight(123);
    obj.rectangle29:setColor("#4169E1");
    obj.rectangle29:setName("rectangle29");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout4);
    obj.rectangle30:setLeft(304);
    obj.rectangle30:setTop(426);
    obj.rectangle30:setWidth(236);
    obj.rectangle30:setHeight(119);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setName("rectangle30");

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

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout4);
    obj.rectangle31:setLeft(192);
    obj.rectangle31:setTop(424);
    obj.rectangle31:setWidth(97);
    obj.rectangle31:setHeight(123);
    obj.rectangle31:setColor("#4169E1");
    obj.rectangle31:setName("rectangle31");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout4);
    obj.rectangle32:setLeft(194);
    obj.rectangle32:setTop(426);
    obj.rectangle32:setWidth(93);
    obj.rectangle32:setHeight(119);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setName("rectangle32");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout4);
    obj.rectangle33:setLeft(196);
    obj.rectangle33:setTop(428);
    obj.rectangle33:setWidth(89);
    obj.rectangle33:setHeight(115);
    obj.rectangle33:setColor("#F5F5DC");
    obj.rectangle33:setName("rectangle33");

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

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout4);
    obj.rectangle34:setLeft(555);
    obj.rectangle34:setTop(424);
    obj.rectangle34:setWidth(97);
    obj.rectangle34:setHeight(123);
    obj.rectangle34:setColor("#4169E1");
    obj.rectangle34:setName("rectangle34");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout4);
    obj.rectangle35:setLeft(557);
    obj.rectangle35:setTop(426);
    obj.rectangle35:setWidth(93);
    obj.rectangle35:setHeight(119);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setName("rectangle35");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout4);
    obj.rectangle36:setLeft(559);
    obj.rectangle36:setTop(428);
    obj.rectangle36:setWidth(89);
    obj.rectangle36:setHeight(115);
    obj.rectangle36:setColor("#F5F5DC");
    obj.rectangle36:setName("rectangle36");

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

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.AbaProfissaoPrincipal);
    obj.rectangle37:setLeft(665);
    obj.rectangle37:setTop(22);
    obj.rectangle37:setWidth(608);
    obj.rectangle37:setHeight(525);
    obj.rectangle37:setColor("#4169E1");
    obj.rectangle37:setName("rectangle37");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.AbaProfissaoPrincipal);
    obj.rectangle38:setLeft(667);
    obj.rectangle38:setTop(24);
    obj.rectangle38:setWidth(604);
    obj.rectangle38:setHeight(521);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setName("rectangle38");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj.AbaProfissaoPrincipal);
    obj.tabControl1:setLeft(667);
    obj.tabControl1:setTop(26);
    obj.tabControl1:setWidth(604);
    obj.tabControl1:setHeight(520);
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Informações Profissionais");
    obj.tab1:setName("tab1");

    obj.ProfissaoPrincipal = GUI.fromHandle(_obj_newObject("label"));
    obj.ProfissaoPrincipal:setParent(obj.tab1);
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
    obj.FotoProfissaoPrincipal:setParent(obj.tab1);
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
    obj.ComboProfissaoPrincipal:setParent(obj.tab1);
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
    obj.LayoutProfissaoPrincipal:setParent(obj.tab1);
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

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.LayoutProfissaoPrincipal);
    obj.rectangle39:setLeft(245);
    obj.rectangle39:setTop(201);
    obj.rectangle39:setWidth(27);
    obj.rectangle39:setHeight(15);
    obj.rectangle39:setColor("white");
    obj.rectangle39:setXradius(7);
    obj.rectangle39:setYradius(7);
    obj.rectangle39:setCornerType("round");
    obj.rectangle39:setName("rectangle39");

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

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.LayoutProfissaoPrincipal);
    obj.rectangle40:setLeft(325);
    obj.rectangle40:setTop(201);
    obj.rectangle40:setWidth(80);
    obj.rectangle40:setHeight(15);
    obj.rectangle40:setColor("white");
    obj.rectangle40:setXradius(7);
    obj.rectangle40:setYradius(7);
    obj.rectangle40:setCornerType("round");
    obj.rectangle40:setName("rectangle40");

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

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.LayoutProfissaoPrincipal);
    obj.rectangle41:setLeft(129);
    obj.rectangle41:setTop(228);
    obj.rectangle41:setWidth(143);
    obj.rectangle41:setHeight(17);
    obj.rectangle41:setColor("white");
    obj.rectangle41:setXradius(7);
    obj.rectangle41:setYradius(7);
    obj.rectangle41:setCornerType("round");
    obj.rectangle41:setName("rectangle41");

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

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.LayoutProfissaoPrincipal);
    obj.rectangle42:setLeft(355);
    obj.rectangle42:setTop(228);
    obj.rectangle42:setWidth(160);
    obj.rectangle42:setHeight(17);
    obj.rectangle42:setColor("white");
    obj.rectangle42:setXradius(7);
    obj.rectangle42:setYradius(7);
    obj.rectangle42:setCornerType("round");
    obj.rectangle42:setName("rectangle42");

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

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Detalhamento");
    obj.tab2:setName("tab2");

    obj.DetalhamentoPrimario = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.DetalhamentoPrimario:setParent(obj.tab2);
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

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.AbaProfissaoSecundaria);
    obj.rectangle43:setLeft(665);
    obj.rectangle43:setTop(22);
    obj.rectangle43:setWidth(608);
    obj.rectangle43:setHeight(525);
    obj.rectangle43:setColor("#4169E1");
    obj.rectangle43:setName("rectangle43");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.AbaProfissaoSecundaria);
    obj.rectangle44:setLeft(667);
    obj.rectangle44:setTop(24);
    obj.rectangle44:setWidth(604);
    obj.rectangle44:setHeight(521);
    obj.rectangle44:setColor("black");
    obj.rectangle44:setName("rectangle44");

    obj.tabControl2 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl2:setParent(obj.AbaProfissaoSecundaria);
    obj.tabControl2:setLeft(667);
    obj.tabControl2:setTop(26);
    obj.tabControl2:setWidth(604);
    obj.tabControl2:setHeight(520);
    obj.tabControl2:setName("tabControl2");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl2);
    obj.tab3:setTitle("Informações Profissionais");
    obj.tab3:setName("tab3");

    obj.ProfissaoSecundaria = GUI.fromHandle(_obj_newObject("label"));
    obj.ProfissaoSecundaria:setParent(obj.tab3);
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
    obj.FotoProfissaoSecundaria:setParent(obj.tab3);
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
    obj.ComboProfissaoSecundaria:setParent(obj.tab3);
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
    obj.LayoutProfissaoSecundaria:setParent(obj.tab3);
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

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.LayoutProfissaoSecundaria);
    obj.rectangle45:setLeft(245);
    obj.rectangle45:setTop(201);
    obj.rectangle45:setWidth(27);
    obj.rectangle45:setHeight(15);
    obj.rectangle45:setColor("white");
    obj.rectangle45:setXradius(7);
    obj.rectangle45:setYradius(7);
    obj.rectangle45:setCornerType("round");
    obj.rectangle45:setName("rectangle45");

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

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.LayoutProfissaoSecundaria);
    obj.rectangle46:setLeft(325);
    obj.rectangle46:setTop(201);
    obj.rectangle46:setWidth(80);
    obj.rectangle46:setHeight(15);
    obj.rectangle46:setColor("white");
    obj.rectangle46:setXradius(7);
    obj.rectangle46:setYradius(7);
    obj.rectangle46:setCornerType("round");
    obj.rectangle46:setName("rectangle46");

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

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.LayoutProfissaoSecundaria);
    obj.rectangle47:setLeft(129);
    obj.rectangle47:setTop(228);
    obj.rectangle47:setWidth(143);
    obj.rectangle47:setHeight(17);
    obj.rectangle47:setColor("white");
    obj.rectangle47:setXradius(7);
    obj.rectangle47:setYradius(7);
    obj.rectangle47:setCornerType("round");
    obj.rectangle47:setName("rectangle47");

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

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.LayoutProfissaoSecundaria);
    obj.rectangle48:setLeft(355);
    obj.rectangle48:setTop(228);
    obj.rectangle48:setWidth(160);
    obj.rectangle48:setHeight(17);
    obj.rectangle48:setColor("white");
    obj.rectangle48:setXradius(7);
    obj.rectangle48:setYradius(7);
    obj.rectangle48:setCornerType("round");
    obj.rectangle48:setName("rectangle48");

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

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl2);
    obj.tab4:setTitle("Detalhamento");
    obj.tab4:setName("tab4");

    obj.DetalhamentoSecundario = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.DetalhamentoSecundario:setParent(obj.tab4);
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

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.AbaRaca);
    obj.rectangle49:setLeft(665);
    obj.rectangle49:setTop(22);
    obj.rectangle49:setWidth(608);
    obj.rectangle49:setHeight(525);
    obj.rectangle49:setColor("#4169E1");
    obj.rectangle49:setName("rectangle49");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.AbaRaca);
    obj.rectangle50:setLeft(667);
    obj.rectangle50:setTop(24);
    obj.rectangle50:setWidth(604);
    obj.rectangle50:setHeight(521);
    obj.rectangle50:setColor("black");
    obj.rectangle50:setName("rectangle50");

    obj.tabControl3 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl3:setParent(obj.AbaRaca);
    obj.tabControl3:setLeft(667);
    obj.tabControl3:setTop(26);
    obj.tabControl3:setWidth(604);
    obj.tabControl3:setHeight(520);
    obj.tabControl3:setName("tabControl3");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl3);
    obj.tab5:setTitle("Caracteristicas Raciais");
    obj.tab5:setName("tab5");

    obj.Raca = GUI.fromHandle(_obj_newObject("label"));
    obj.Raca:setParent(obj.tab5);
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
    obj.ComboRaca:setParent(obj.tab5);
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
    obj.FotoRaca:setParent(obj.tab5);
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
    obj.DescricaoRacial:setParent(obj.tab5);
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

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl3);
    obj.tab6:setTitle("Habilidades Raciais");
    obj.tab6:setName("tab6");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.tab6);
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

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.AbaHistoria);
    obj.rectangle51:setLeft(0);
    obj.rectangle51:setTop(22);
    obj.rectangle51:setWidth(608);
    obj.rectangle51:setHeight(525);
    obj.rectangle51:setColor("#4169E1");
    obj.rectangle51:setName("rectangle51");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.AbaHistoria);
    obj.rectangle52:setLeft(2);
    obj.rectangle52:setTop(24);
    obj.rectangle52:setWidth(604);
    obj.rectangle52:setHeight(521);
    obj.rectangle52:setColor("black");
    obj.rectangle52:setName("rectangle52");

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

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.AbaAnotacoes);
    obj.rectangle53:setLeft(0);
    obj.rectangle53:setTop(22);
    obj.rectangle53:setWidth(608);
    obj.rectangle53:setHeight(525);
    obj.rectangle53:setColor("#4169E1");
    obj.rectangle53:setName("rectangle53");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.AbaAnotacoes);
    obj.rectangle54:setLeft(2);
    obj.rectangle54:setTop(24);
    obj.rectangle54:setWidth(604);
    obj.rectangle54:setHeight(521);
    obj.rectangle54:setColor("black");
    obj.rectangle54:setName("rectangle54");

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
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("nomePersonagem");
    obj.dataLink1:setDefaultValue("Nome do Personagem");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("tituloPersonagem");
    obj.dataLink2:setDefaultValue("Titulo");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setField("nivel");
    obj.dataLink3:setDefaultValue("1");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setField("expAtual");
    obj.dataLink4:setDefaultValue("0");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setField("expMax");
    obj.dataLink5:setDefaultValue("300");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setField("nomeRaca");
    obj.dataLink6:setDefaultValue("Raça");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setField("raca");
    obj.dataLink7:setDefaultValue("Escolher");
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj);
    obj.dataLink8:setField("comboProfissaoPrincipal");
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj);
    obj.dataLink9:setField("comboProfissaoSecundaria");
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj);
    obj.dataLink10:setField("comboRaca");
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj);
    obj.dataLink11:setField("tierProfissaoPrincipal");
    obj.dataLink11:setDefaultValue("0");
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj);
    obj.dataLink12:setField("tierProfissaoSecundaria");
    obj.dataLink12:setDefaultValue("0");
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj);
    obj.dataLink13:setField("xpAtualProfissaoPrincipal");
    obj.dataLink13:setDefaultValue("0");
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj);
    obj.dataLink14:setField("xpAtualProfissaoSecundaria");
    obj.dataLink14:setDefaultValue("0");
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj);
    obj.dataLink15:setField("xpMaximaProfissaoPrincipal");
    obj.dataLink15:setDefaultValue("10");
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj);
    obj.dataLink16:setField("xpMaximaProfissaoSecundaria");
    obj.dataLink16:setDefaultValue("10");
    obj.dataLink16:setName("dataLink16");

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
            																		self.EstLuta.text = self.estiloDeLuta.text
            																		self.imagemEdL.src = EdLImagens[self.estiloDeLuta.value].imagem
            			
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

    function obj:_releaseEvents()
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

        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.Exp ~= nil then self.Exp:destroy(); self.Exp = nil; end;
        if self.genero ~= nil then self.genero:destroy(); self.genero = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.listaOrganizacoes ~= nil then self.listaOrganizacoes:destroy(); self.listaOrganizacoes = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.TierPrincipal ~= nil then self.TierPrincipal:destroy(); self.TierPrincipal = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.DescricaoRacial ~= nil then self.DescricaoRacial:destroy(); self.DescricaoRacial = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.ComboRaca ~= nil then self.ComboRaca:destroy(); self.ComboRaca = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.DescricaoProfissionalSecundaria ~= nil then self.DescricaoProfissionalSecundaria:destroy(); self.DescricaoProfissionalSecundaria = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.Nivel ~= nil then self.Nivel:destroy(); self.Nivel = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.ImagemProfissaoPrincipal ~= nil then self.ImagemProfissaoPrincipal:destroy(); self.ImagemProfissaoPrincipal = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.ImagemProfissaoSecundaria ~= nil then self.ImagemProfissaoSecundaria:destroy(); self.ImagemProfissaoSecundaria = nil; end;
        if self.NomeRaca ~= nil then self.NomeRaca:destroy(); self.NomeRaca = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.ImagemRaca ~= nil then self.ImagemRaca:destroy(); self.ImagemRaca = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.idade ~= nil then self.idade:destroy(); self.idade = nil; end;
        if self.NomeProfissaoSecundaria ~= nil then self.NomeProfissaoSecundaria:destroy(); self.NomeProfissaoSecundaria = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.ProfissaoPrincipal ~= nil then self.ProfissaoPrincipal:destroy(); self.ProfissaoPrincipal = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.LayoutProfissaoPrincipal ~= nil then self.LayoutProfissaoPrincipal:destroy(); self.LayoutProfissaoPrincipal = nil; end;
        if self.moedas ~= nil then self.moedas:destroy(); self.moedas = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.ImagemBandeira ~= nil then self.ImagemBandeira:destroy(); self.ImagemBandeira = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.AbaRaca ~= nil then self.AbaRaca:destroy(); self.AbaRaca = nil; end;
        if self.AbaAnotacoes ~= nil then self.AbaAnotacoes:destroy(); self.AbaAnotacoes = nil; end;
        if self.AbaProfissaoPrincipal ~= nil then self.AbaProfissaoPrincipal:destroy(); self.AbaProfissaoPrincipal = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.nomeDoPersonagem ~= nil then self.nomeDoPersonagem:destroy(); self.nomeDoPersonagem = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.tabControl3 ~= nil then self.tabControl3:destroy(); self.tabControl3 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.FotoProfissaoPrincipal ~= nil then self.FotoProfissaoPrincipal:destroy(); self.FotoProfissaoPrincipal = nil; end;
        if self.DescricaoProfissionalPrimaria ~= nil then self.DescricaoProfissionalPrimaria:destroy(); self.DescricaoProfissionalPrimaria = nil; end;
        if self.FotoProfissaoSecundaria ~= nil then self.FotoProfissaoSecundaria:destroy(); self.FotoProfissaoSecundaria = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.XpMaxPrincipal ~= nil then self.XpMaxPrincipal:destroy(); self.XpMaxPrincipal = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.FotoRaca ~= nil then self.FotoRaca:destroy(); self.FotoRaca = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.TierSecundaria ~= nil then self.TierSecundaria:destroy(); self.TierSecundaria = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.AbaHistoria ~= nil then self.AbaHistoria:destroy(); self.AbaHistoria = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.ProfissaoSecundaria ~= nil then self.ProfissaoSecundaria:destroy(); self.ProfissaoSecundaria = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.tripulacao ~= nil then self.tripulacao:destroy(); self.tripulacao = nil; end;
        if self.AbaProfissaoSecundaria ~= nil then self.AbaProfissaoSecundaria:destroy(); self.AbaProfissaoSecundaria = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.ComboProfissaoSecundaria ~= nil then self.ComboProfissaoSecundaria:destroy(); self.ComboProfissaoSecundaria = nil; end;
        if self.ExpAtual ~= nil then self.ExpAtual:destroy(); self.ExpAtual = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.DetalhamentoPrimario ~= nil then self.DetalhamentoPrimario:destroy(); self.DetalhamentoPrimario = nil; end;
        if self.sex ~= nil then self.sex:destroy(); self.sex = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.editHistoria ~= nil then self.editHistoria:destroy(); self.editHistoria = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.tabControl2 ~= nil then self.tabControl2:destroy(); self.tabControl2 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.NomeProfissaoPrincipal ~= nil then self.NomeProfissaoPrincipal:destroy(); self.NomeProfissaoPrincipal = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.ComboProfissaoPrincipal ~= nil then self.ComboProfissaoPrincipal:destroy(); self.ComboProfissaoPrincipal = nil; end;
        if self.LayoutProfissaoSecundaria ~= nil then self.LayoutProfissaoSecundaria:destroy(); self.LayoutProfissaoSecundaria = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.tituloDoPersonagem ~= nil then self.tituloDoPersonagem:destroy(); self.tituloDoPersonagem = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.DetalhamentoSecundario ~= nil then self.DetalhamentoSecundario:destroy(); self.DetalhamentoSecundario = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.LabelEdL ~= nil then self.LabelEdL:destroy(); self.LabelEdL = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.Raca ~= nil then self.Raca:destroy(); self.Raca = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.estluta ~= nil then self.estluta:destroy(); self.estluta = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.XpMaxSecundaria ~= nil then self.XpMaxSecundaria:destroy(); self.XpMaxSecundaria = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newInfoGerais()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_InfoGerais();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _InfoGerais = {
    newEditor = newInfoGerais, 
    new = newInfoGerais, 
    name = "InfoGerais", 
    dataType = "", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "Brincadeiras Em Alto Mar", 
    description=""};

InfoGerais = _InfoGerais;
Firecast.registrarForm(_InfoGerais);

return _InfoGerais;
