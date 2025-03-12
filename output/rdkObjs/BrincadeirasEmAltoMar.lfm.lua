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
			'Atirador', 'Karatê Tritão', 'Okama Kenpo', 'Rokushiki', 'Boxe', 
			'Hasshoken', 'Merman Combat', 'Tontatta Combat', 'Black Leg', 
			'Ramen Kenpo', 'Jao Kun Do', 'Ryusoken', 'Jio-Ken', 'Santoryu', 
			'Nitoryu', 'Ittoryu', 'Hachitoryu', 'Yontoryu', 'Kappa-ryu', 
			'Kitsunebi-ryu', 'Rokutoryu', 'Ningyo Gujutsu', 'Son Goku no Ugoki', 
			'Kurobara-Ryū', 'Street Brawling', 'Demonharubādo', 'Sumo-Ryu', 
			'Senritsuken', 'Kikai Kōbō-Ryū', 'Kōsenjū-Ryū', 'Tenshi Nunchaku-Ryū', 
			'Kyokugi', 'Koe no Ensei-Ryū', 'Tōkaradō', 'Reitetsu no Ken', 
			'Kenki no Gattsu', 'Teppanyaki no Ken', 'Seigi no Tōken-Ryū', 
			'Tsuinburēdo', 'Sakejutsu', 'Rairyū-Ryū', 'Frog Leg'
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
    obj.idade:setTop(173);
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
    obj.genero:setTop(203);
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
    obj.moedas:setTop(233);
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

    obj.estluta = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.estluta:setParent(obj.layout3);
    obj.estluta:setField("estiloDeLuta");
    obj.estluta:setName("estluta");
    obj.estluta:setLeft(505);
    obj.estluta:setTop(176);
    obj.estluta:setWidth(120);
    obj.estluta:setHeight(17);
    obj.estluta:setTransparent(true);
    obj.estluta:setFontColor("black");
    obj.estluta:setFontSize(12);
    obj.estluta:setHorzTextAlign("center");
    obj.estluta:setItems(EstilosDeLuta);

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
    obj.sex:setTop(203);
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

    obj.ImagemProfissaoPrincipal = GUI.fromHandle(_obj_newObject("image"));
    obj.ImagemProfissaoPrincipal:setParent(obj.layout4);
    obj.ImagemProfissaoPrincipal:setField("imagemPrincipal");
    obj.ImagemProfissaoPrincipal:setName("ImagemProfissaoPrincipal");
    obj.ImagemProfissaoPrincipal:setLeft(199);
    obj.ImagemProfissaoPrincipal:setTop(300);
    obj.ImagemProfissaoPrincipal:setWidth(82);
    obj.ImagemProfissaoPrincipal:setHeight(92);
    obj.ImagemProfissaoPrincipal:setStyle("autoFit");
    obj.ImagemProfissaoPrincipal.animate = true;

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout4);
    obj.button1:setLeft(192);
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

    obj.ImagemProfissaoSecundaria = GUI.fromHandle(_obj_newObject("image"));
    obj.ImagemProfissaoSecundaria:setParent(obj.layout4);
    obj.ImagemProfissaoSecundaria:setField("imagemSecundaria");
    obj.ImagemProfissaoSecundaria:setName("ImagemProfissaoSecundaria");
    obj.ImagemProfissaoSecundaria:setLeft(562);
    obj.ImagemProfissaoSecundaria:setTop(300);
    obj.ImagemProfissaoSecundaria:setWidth(82);
    obj.ImagemProfissaoSecundaria:setHeight(92);
    obj.ImagemProfissaoSecundaria:setStyle("autoFit");
    obj.ImagemProfissaoSecundaria.animate = true;

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout4);
    obj.button2:setLeft(555);
    obj.button2:setTop(292);
    obj.button2:setWidth(97);
    obj.button2:setHeight(123);
    obj.button2:setOpacity(0);
    obj.button2:setCursor("handPoint");
    obj.button2:setName("button2");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout4);
    obj.rectangle24:setLeft(302);
    obj.rectangle24:setTop(292);
    obj.rectangle24:setWidth(240);
    obj.rectangle24:setHeight(123);
    obj.rectangle24:setColor("#4169E1");
    obj.rectangle24:setName("rectangle24");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout4);
    obj.rectangle25:setLeft(304);
    obj.rectangle25:setTop(294);
    obj.rectangle25:setWidth(236);
    obj.rectangle25:setHeight(119);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setName("rectangle25");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout4);
    obj.rectangle26:setLeft(306);
    obj.rectangle26:setTop(296);
    obj.rectangle26:setWidth(232);
    obj.rectangle26:setHeight(115);
    obj.rectangle26:setColor("#F5F5DC");
    obj.rectangle26:setName("rectangle26");

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

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout4);
    obj.rectangle27:setLeft(302);
    obj.rectangle27:setTop(424);
    obj.rectangle27:setWidth(240);
    obj.rectangle27:setHeight(123);
    obj.rectangle27:setColor("#4169E1");
    obj.rectangle27:setName("rectangle27");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout4);
    obj.rectangle28:setLeft(304);
    obj.rectangle28:setTop(426);
    obj.rectangle28:setWidth(236);
    obj.rectangle28:setHeight(119);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setName("rectangle28");

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

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout4);
    obj.rectangle29:setLeft(192);
    obj.rectangle29:setTop(424);
    obj.rectangle29:setWidth(97);
    obj.rectangle29:setHeight(123);
    obj.rectangle29:setColor("#4169E1");
    obj.rectangle29:setName("rectangle29");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout4);
    obj.rectangle30:setLeft(194);
    obj.rectangle30:setTop(426);
    obj.rectangle30:setWidth(93);
    obj.rectangle30:setHeight(119);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setName("rectangle30");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout4);
    obj.rectangle31:setLeft(196);
    obj.rectangle31:setTop(428);
    obj.rectangle31:setWidth(89);
    obj.rectangle31:setHeight(115);
    obj.rectangle31:setColor("#F5F5DC");
    obj.rectangle31:setName("rectangle31");

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

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout4);
    obj.rectangle32:setLeft(555);
    obj.rectangle32:setTop(424);
    obj.rectangle32:setWidth(97);
    obj.rectangle32:setHeight(123);
    obj.rectangle32:setColor("#4169E1");
    obj.rectangle32:setName("rectangle32");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout4);
    obj.rectangle33:setLeft(557);
    obj.rectangle33:setTop(426);
    obj.rectangle33:setWidth(93);
    obj.rectangle33:setHeight(119);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setName("rectangle33");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout4);
    obj.rectangle34:setLeft(559);
    obj.rectangle34:setTop(428);
    obj.rectangle34:setWidth(89);
    obj.rectangle34:setHeight(115);
    obj.rectangle34:setColor("#F5F5DC");
    obj.rectangle34:setName("rectangle34");

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

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.AbaProfissaoPrincipal);
    obj.rectangle35:setLeft(665);
    obj.rectangle35:setTop(22);
    obj.rectangle35:setWidth(608);
    obj.rectangle35:setHeight(525);
    obj.rectangle35:setColor("#4169E1");
    obj.rectangle35:setName("rectangle35");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.AbaProfissaoPrincipal);
    obj.rectangle36:setLeft(667);
    obj.rectangle36:setTop(24);
    obj.rectangle36:setWidth(604);
    obj.rectangle36:setHeight(521);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setName("rectangle36");

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

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.LayoutProfissaoPrincipal);
    obj.rectangle37:setLeft(245);
    obj.rectangle37:setTop(201);
    obj.rectangle37:setWidth(27);
    obj.rectangle37:setHeight(15);
    obj.rectangle37:setColor("white");
    obj.rectangle37:setXradius(7);
    obj.rectangle37:setYradius(7);
    obj.rectangle37:setCornerType("round");
    obj.rectangle37:setName("rectangle37");

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

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.LayoutProfissaoPrincipal);
    obj.rectangle38:setLeft(325);
    obj.rectangle38:setTop(201);
    obj.rectangle38:setWidth(80);
    obj.rectangle38:setHeight(15);
    obj.rectangle38:setColor("white");
    obj.rectangle38:setXradius(7);
    obj.rectangle38:setYradius(7);
    obj.rectangle38:setCornerType("round");
    obj.rectangle38:setName("rectangle38");

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

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.LayoutProfissaoPrincipal);
    obj.rectangle39:setLeft(129);
    obj.rectangle39:setTop(228);
    obj.rectangle39:setWidth(143);
    obj.rectangle39:setHeight(17);
    obj.rectangle39:setColor("white");
    obj.rectangle39:setXradius(7);
    obj.rectangle39:setYradius(7);
    obj.rectangle39:setCornerType("round");
    obj.rectangle39:setName("rectangle39");

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

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.LayoutProfissaoPrincipal);
    obj.rectangle40:setLeft(355);
    obj.rectangle40:setTop(228);
    obj.rectangle40:setWidth(160);
    obj.rectangle40:setHeight(17);
    obj.rectangle40:setColor("white");
    obj.rectangle40:setXradius(7);
    obj.rectangle40:setYradius(7);
    obj.rectangle40:setCornerType("round");
    obj.rectangle40:setName("rectangle40");

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

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.AbaProfissaoSecundaria);
    obj.rectangle41:setLeft(665);
    obj.rectangle41:setTop(22);
    obj.rectangle41:setWidth(608);
    obj.rectangle41:setHeight(525);
    obj.rectangle41:setColor("#4169E1");
    obj.rectangle41:setName("rectangle41");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.AbaProfissaoSecundaria);
    obj.rectangle42:setLeft(667);
    obj.rectangle42:setTop(24);
    obj.rectangle42:setWidth(604);
    obj.rectangle42:setHeight(521);
    obj.rectangle42:setColor("black");
    obj.rectangle42:setName("rectangle42");

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

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.LayoutProfissaoSecundaria);
    obj.rectangle43:setLeft(245);
    obj.rectangle43:setTop(201);
    obj.rectangle43:setWidth(27);
    obj.rectangle43:setHeight(15);
    obj.rectangle43:setColor("white");
    obj.rectangle43:setXradius(7);
    obj.rectangle43:setYradius(7);
    obj.rectangle43:setCornerType("round");
    obj.rectangle43:setName("rectangle43");

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

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.LayoutProfissaoSecundaria);
    obj.rectangle44:setLeft(325);
    obj.rectangle44:setTop(201);
    obj.rectangle44:setWidth(80);
    obj.rectangle44:setHeight(15);
    obj.rectangle44:setColor("white");
    obj.rectangle44:setXradius(7);
    obj.rectangle44:setYradius(7);
    obj.rectangle44:setCornerType("round");
    obj.rectangle44:setName("rectangle44");

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

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.LayoutProfissaoSecundaria);
    obj.rectangle45:setLeft(129);
    obj.rectangle45:setTop(228);
    obj.rectangle45:setWidth(143);
    obj.rectangle45:setHeight(17);
    obj.rectangle45:setColor("white");
    obj.rectangle45:setXradius(7);
    obj.rectangle45:setYradius(7);
    obj.rectangle45:setCornerType("round");
    obj.rectangle45:setName("rectangle45");

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

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.LayoutProfissaoSecundaria);
    obj.rectangle46:setLeft(355);
    obj.rectangle46:setTop(228);
    obj.rectangle46:setWidth(160);
    obj.rectangle46:setHeight(17);
    obj.rectangle46:setColor("white");
    obj.rectangle46:setXradius(7);
    obj.rectangle46:setYradius(7);
    obj.rectangle46:setCornerType("round");
    obj.rectangle46:setName("rectangle46");

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

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.AbaRaca);
    obj.rectangle47:setLeft(665);
    obj.rectangle47:setTop(22);
    obj.rectangle47:setWidth(608);
    obj.rectangle47:setHeight(525);
    obj.rectangle47:setColor("#4169E1");
    obj.rectangle47:setName("rectangle47");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.AbaRaca);
    obj.rectangle48:setLeft(667);
    obj.rectangle48:setTop(24);
    obj.rectangle48:setWidth(604);
    obj.rectangle48:setHeight(521);
    obj.rectangle48:setColor("black");
    obj.rectangle48:setName("rectangle48");

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
    obj.DescricaoRacial.readOnly = false;
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

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.AbaHistoria);
    obj.rectangle49:setLeft(0);
    obj.rectangle49:setTop(22);
    obj.rectangle49:setWidth(608);
    obj.rectangle49:setHeight(525);
    obj.rectangle49:setColor("#4169E1");
    obj.rectangle49:setName("rectangle49");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.AbaHistoria);
    obj.rectangle50:setLeft(2);
    obj.rectangle50:setTop(24);
    obj.rectangle50:setWidth(604);
    obj.rectangle50:setHeight(521);
    obj.rectangle50:setColor("black");
    obj.rectangle50:setName("rectangle50");

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

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout5);
    obj.button6:setName("button6");

    obj.AbaAnotacoes = GUI.fromHandle(_obj_newObject("layout"));
    obj.AbaAnotacoes:setParent(obj.layout1);
    obj.AbaAnotacoes:setName("AbaAnotacoes");
    obj.AbaAnotacoes:setLeft(670);
    obj.AbaAnotacoes:setTop(10);
    obj.AbaAnotacoes:setWidth(2000);
    obj.AbaAnotacoes:setHeight(1800);
    obj.AbaAnotacoes:setVisible(false);

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.AbaAnotacoes);
    obj.rectangle51:setLeft(0);
    obj.rectangle51:setTop(22);
    obj.rectangle51:setWidth(608);
    obj.rectangle51:setHeight(525);
    obj.rectangle51:setColor("#4169E1");
    obj.rectangle51:setName("rectangle51");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.AbaAnotacoes);
    obj.rectangle52:setLeft(2);
    obj.rectangle52:setTop(24);
    obj.rectangle52:setWidth(604);
    obj.rectangle52:setHeight(521);
    obj.rectangle52:setColor("black");
    obj.rectangle52:setName("rectangle52");

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

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.Atributos);
    obj.rectangle53:setLeft(0);
    obj.rectangle53:setTop(0);
    obj.rectangle53:setWidth(10000);
    obj.rectangle53:setHeight(10000);
    obj.rectangle53:setColor("black");
    obj.rectangle53:setName("rectangle53");


		function AlterarValorTotal(valor)
			local valorBase = valor .."Base"
			local valorPassivo = valor .."Passivo"
			local valorEquips = valor .."Equips"
			local valorTreino = valor .."Treino"
			local valorTotal = valor .."Total"
			
			local soma = tonumber(sheet[valorBase]) + tonumber(sheet[valorPassivo]) + tonumber(sheet[valorEquips]) + tonumber(sheet[valorTreino])
			self[valorTotal].text = tostring(soma)
			sheet.Defesa = tostring(math.floor(sheet.VigorBase / 2))
			
			sheet.PontosDisponiveis = tostring(23 + (sheet.nivel * 2) -sheet.ForcaBase - sheet.AgilidadeBase -sheet.VigorBase -sheet.CombateBase -sheet.PercepcaoBase -sheet.CarismaBase -sheet.InteligenciaBase -sheet.PrecisaoBase -sheet.ForcaDeVontadeBase)
			sheet.PontosDistribuidos = tostring(sheet.ForcaBase + sheet.AgilidadeBase + sheet.VigorBase + sheet.CombateBase + sheet.PercepcaoBase + sheet.CarismaBase + sheet.InteligenciaBase + sheet.PrecisaoBase + sheet.ForcaDeVontadeBase - 9)
			sheet.PontosOutros = tostring(tonumber(sheet.ForcaPassivo) + tonumber(sheet.ForcaEquips) + tonumber(sheet.ForcaTreino) +
										  tonumber(sheet.AgilidadePassivo) + tonumber(sheet.AgilidadeEquips) + tonumber(sheet.AgilidadeTreino) +
										  tonumber(sheet.VigorPassivo) + tonumber(sheet.VigorEquips) + tonumber(sheet.VigorTreino) +
										  tonumber(sheet.CombatePassivo) + tonumber(sheet.CombateEquips) + tonumber(sheet.CombateTreino) +
										  tonumber(sheet.PercepcaoPassivo) + tonumber(sheet.PercepcaoEquips) + tonumber(sheet.PercepcaoTreino) +
										  tonumber(sheet.CarismaPassivo) + tonumber(sheet.CarismaEquips) + tonumber(sheet.CarismaTreino) +
										  tonumber(sheet.InteligenciaPassivo) + tonumber(sheet.InteligenciaEquips) + tonumber(sheet.InteligenciaTreino) +
										  tonumber(sheet.PrecisaoPassivo) + tonumber(sheet.PrecisaoEquips) + tonumber(sheet.PrecisaoTreino) +
										  tonumber(sheet.ForcaDeVontadePassivo) + tonumber(sheet.ForcaDeVontadeEquips) + tonumber(sheet.ForcaDeVontadeTreino)
										 ) 
			sheet.PontosTotais = tostring(sheet.ForcaTotal + sheet.AgilidadeTotal + sheet.VigorTotal + sheet.CombateTotal + sheet.PercepcaoTotal + sheet.CarismaTotal + sheet.InteligenciaTotal + sheet.PrecisaoTotal + sheet.ForcaDeVontadeTotal)

			sheet.hp = (sheet.VigorTotal * 7) + 45 + (5 * sheet.nivel)
			sheet.eng = (sheet.VigorTotal * 7) + 57 + (5 * sheet.nivel)
			if (sheet.ForcaDeVontadeTotal >= 20) then sheet.haki = sheet.ForcaDeVontadeTotal * 5 else sheet.haki = 0 end
		end
		
		function RolarAtributo(valor)
			local valorTotal = valor .."Total"
			if (valor == "Forca") then valor = "Força" end
			if (valor == "Precisao") then valor = "Precisão" end
			if (valor == "Percepcao") then valor = "Percepção" end
			if (valor == "Inteligencia") then valor = "Inteligência" end
	
			local mesas = Firecast.getRooms();
			if (valor == "Defesa") then mesas[1].chat:rolarDados("1d20 + " .. sheet.Defesa, "Teste de ".. valor) else
			                            mesas[1].chat:rolarDados("1d20 + " .. sheet[valorTotal], "Teste de ".. valor) end
		end
	


    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.Atributos);
    obj.layout7:setLeft(12);
    obj.layout7:setTop(12);
    obj.layout7:setWidth(430);
    obj.layout7:setHeight(525);
    obj.layout7:setName("layout7");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout7);
    obj.rectangle54:setLeft(0);
    obj.rectangle54:setTop(0);
    obj.rectangle54:setWidth(430);
    obj.rectangle54:setHeight(525);
    obj.rectangle54:setColor("#4169E1");
    obj.rectangle54:setName("rectangle54");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout7);
    obj.rectangle55:setLeft(2);
    obj.rectangle55:setTop(2);
    obj.rectangle55:setWidth(426);
    obj.rectangle55:setHeight(521);
    obj.rectangle55:setColor("black");
    obj.rectangle55:setName("rectangle55");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout7);
    obj.label27:setLeft(2);
    obj.label27:setTop(2);
    obj.label27:setWidth(426);
    obj.label27:setHeight(36);
    obj.label27:setText("Atributos");
    obj.label27:setFontColor("#5F9EA0");
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

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout7);
    obj.rectangle56:setLeft(130);
    obj.rectangle56:setTop(79);
    obj.rectangle56:setWidth(45);
    obj.rectangle56:setHeight(24);
    obj.rectangle56:setColor("#F5F5DC");
    obj.rectangle56:setXradius(7);
    obj.rectangle56:setYradius(7);
    obj.rectangle56:setCornerType("round");
    obj.rectangle56:setName("rectangle56");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout7);
    obj.edit8:setField("ForcaBase");
    obj.edit8:setLeft(130);
    obj.edit8:setTop(79);
    obj.edit8:setWidth(45);
    obj.edit8:setHeight(24);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontColor("black");
    obj.edit8:setFontSize(17);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setType("number");
    lfm_setPropAsString(obj.edit8, "fontStyle", "bold");
    obj.edit8:setName("edit8");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout7);
    obj.rectangle57:setLeft(130);
    obj.rectangle57:setTop(109);
    obj.rectangle57:setWidth(45);
    obj.rectangle57:setHeight(24);
    obj.rectangle57:setColor("#F5F5DC");
    obj.rectangle57:setXradius(7);
    obj.rectangle57:setYradius(7);
    obj.rectangle57:setCornerType("round");
    obj.rectangle57:setName("rectangle57");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout7);
    obj.edit9:setField("AgilidadeBase");
    obj.edit9:setLeft(130);
    obj.edit9:setTop(109);
    obj.edit9:setWidth(45);
    obj.edit9:setHeight(24);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontColor("black");
    obj.edit9:setFontSize(17);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setType("number");
    lfm_setPropAsString(obj.edit9, "fontStyle", "bold");
    obj.edit9:setName("edit9");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout7);
    obj.rectangle58:setLeft(130);
    obj.rectangle58:setTop(139);
    obj.rectangle58:setWidth(45);
    obj.rectangle58:setHeight(24);
    obj.rectangle58:setColor("#F5F5DC");
    obj.rectangle58:setXradius(7);
    obj.rectangle58:setYradius(7);
    obj.rectangle58:setCornerType("round");
    obj.rectangle58:setName("rectangle58");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout7);
    obj.edit10:setField("VigorBase");
    obj.edit10:setLeft(130);
    obj.edit10:setTop(139);
    obj.edit10:setWidth(45);
    obj.edit10:setHeight(24);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontColor("black");
    obj.edit10:setFontSize(17);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setType("number");
    lfm_setPropAsString(obj.edit10, "fontStyle", "bold");
    obj.edit10:setName("edit10");

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout7);
    obj.rectangle59:setLeft(130);
    obj.rectangle59:setTop(169);
    obj.rectangle59:setWidth(45);
    obj.rectangle59:setHeight(24);
    obj.rectangle59:setColor("#F5F5DC");
    obj.rectangle59:setXradius(7);
    obj.rectangle59:setYradius(7);
    obj.rectangle59:setCornerType("round");
    obj.rectangle59:setName("rectangle59");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout7);
    obj.edit11:setField("CombateBase");
    obj.edit11:setLeft(130);
    obj.edit11:setTop(169);
    obj.edit11:setWidth(45);
    obj.edit11:setHeight(24);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontColor("black");
    obj.edit11:setFontSize(17);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setType("number");
    lfm_setPropAsString(obj.edit11, "fontStyle", "bold");
    obj.edit11:setName("edit11");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout7);
    obj.rectangle60:setLeft(130);
    obj.rectangle60:setTop(199);
    obj.rectangle60:setWidth(45);
    obj.rectangle60:setHeight(24);
    obj.rectangle60:setColor("#F5F5DC");
    obj.rectangle60:setXradius(7);
    obj.rectangle60:setYradius(7);
    obj.rectangle60:setCornerType("round");
    obj.rectangle60:setName("rectangle60");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout7);
    obj.edit12:setField("PercepcaoBase");
    obj.edit12:setLeft(130);
    obj.edit12:setTop(199);
    obj.edit12:setWidth(45);
    obj.edit12:setHeight(24);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontColor("black");
    obj.edit12:setFontSize(17);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setType("number");
    lfm_setPropAsString(obj.edit12, "fontStyle", "bold");
    obj.edit12:setName("edit12");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout7);
    obj.rectangle61:setLeft(130);
    obj.rectangle61:setTop(229);
    obj.rectangle61:setWidth(45);
    obj.rectangle61:setHeight(24);
    obj.rectangle61:setColor("#F5F5DC");
    obj.rectangle61:setXradius(7);
    obj.rectangle61:setYradius(7);
    obj.rectangle61:setCornerType("round");
    obj.rectangle61:setName("rectangle61");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout7);
    obj.edit13:setField("CarismaBase");
    obj.edit13:setLeft(130);
    obj.edit13:setTop(229);
    obj.edit13:setWidth(45);
    obj.edit13:setHeight(24);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontColor("black");
    obj.edit13:setFontSize(17);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setType("number");
    lfm_setPropAsString(obj.edit13, "fontStyle", "bold");
    obj.edit13:setName("edit13");

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout7);
    obj.rectangle62:setLeft(130);
    obj.rectangle62:setTop(259);
    obj.rectangle62:setWidth(45);
    obj.rectangle62:setHeight(24);
    obj.rectangle62:setColor("#F5F5DC");
    obj.rectangle62:setXradius(7);
    obj.rectangle62:setYradius(7);
    obj.rectangle62:setCornerType("round");
    obj.rectangle62:setName("rectangle62");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout7);
    obj.edit14:setField("InteligenciaBase");
    obj.edit14:setLeft(130);
    obj.edit14:setTop(259);
    obj.edit14:setWidth(45);
    obj.edit14:setHeight(24);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontColor("black");
    obj.edit14:setFontSize(17);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setType("number");
    lfm_setPropAsString(obj.edit14, "fontStyle", "bold");
    obj.edit14:setName("edit14");

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout7);
    obj.rectangle63:setLeft(130);
    obj.rectangle63:setTop(289);
    obj.rectangle63:setWidth(45);
    obj.rectangle63:setHeight(24);
    obj.rectangle63:setColor("#F5F5DC");
    obj.rectangle63:setXradius(7);
    obj.rectangle63:setYradius(7);
    obj.rectangle63:setCornerType("round");
    obj.rectangle63:setName("rectangle63");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout7);
    obj.edit15:setField("PrecisaoBase");
    obj.edit15:setLeft(130);
    obj.edit15:setTop(289);
    obj.edit15:setWidth(45);
    obj.edit15:setHeight(24);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontColor("black");
    obj.edit15:setFontSize(17);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setType("number");
    lfm_setPropAsString(obj.edit15, "fontStyle", "bold");
    obj.edit15:setName("edit15");

    obj.rectangle64 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout7);
    obj.rectangle64:setLeft(130);
    obj.rectangle64:setTop(319);
    obj.rectangle64:setWidth(45);
    obj.rectangle64:setHeight(24);
    obj.rectangle64:setColor("#F5F5DC");
    obj.rectangle64:setXradius(7);
    obj.rectangle64:setYradius(7);
    obj.rectangle64:setCornerType("round");
    obj.rectangle64:setName("rectangle64");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout7);
    obj.edit16:setField("ForcaDeVontadeBase");
    obj.edit16:setLeft(130);
    obj.edit16:setTop(319);
    obj.edit16:setWidth(45);
    obj.edit16:setHeight(24);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontColor("black");
    obj.edit16:setFontSize(17);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setType("number");
    lfm_setPropAsString(obj.edit16, "fontStyle", "bold");
    obj.edit16:setName("edit16");

    obj.rectangle65 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout7);
    obj.rectangle65:setLeft(190);
    obj.rectangle65:setTop(79);
    obj.rectangle65:setWidth(45);
    obj.rectangle65:setHeight(24);
    obj.rectangle65:setColor("#F5F5DC");
    obj.rectangle65:setXradius(7);
    obj.rectangle65:setYradius(7);
    obj.rectangle65:setCornerType("round");
    obj.rectangle65:setName("rectangle65");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout7);
    obj.edit17:setField("ForcaPassivo");
    obj.edit17:setLeft(190);
    obj.edit17:setTop(79);
    obj.edit17:setWidth(45);
    obj.edit17:setHeight(24);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontColor("black");
    obj.edit17:setFontSize(17);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setType("number");
    lfm_setPropAsString(obj.edit17, "fontStyle", "bold");
    obj.edit17:setName("edit17");

    obj.rectangle66 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout7);
    obj.rectangle66:setLeft(190);
    obj.rectangle66:setTop(109);
    obj.rectangle66:setWidth(45);
    obj.rectangle66:setHeight(24);
    obj.rectangle66:setColor("#F5F5DC");
    obj.rectangle66:setXradius(7);
    obj.rectangle66:setYradius(7);
    obj.rectangle66:setCornerType("round");
    obj.rectangle66:setName("rectangle66");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout7);
    obj.edit18:setField("AgilidadePassivo");
    obj.edit18:setLeft(190);
    obj.edit18:setTop(109);
    obj.edit18:setWidth(45);
    obj.edit18:setHeight(24);
    obj.edit18:setTransparent(true);
    obj.edit18:setFontColor("black");
    obj.edit18:setFontSize(17);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setType("number");
    lfm_setPropAsString(obj.edit18, "fontStyle", "bold");
    obj.edit18:setName("edit18");

    obj.rectangle67 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout7);
    obj.rectangle67:setLeft(190);
    obj.rectangle67:setTop(139);
    obj.rectangle67:setWidth(45);
    obj.rectangle67:setHeight(24);
    obj.rectangle67:setColor("#F5F5DC");
    obj.rectangle67:setXradius(7);
    obj.rectangle67:setYradius(7);
    obj.rectangle67:setCornerType("round");
    obj.rectangle67:setName("rectangle67");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout7);
    obj.edit19:setField("VigorPassivo");
    obj.edit19:setLeft(190);
    obj.edit19:setTop(139);
    obj.edit19:setWidth(45);
    obj.edit19:setHeight(24);
    obj.edit19:setTransparent(true);
    obj.edit19:setFontColor("black");
    obj.edit19:setFontSize(17);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setType("number");
    lfm_setPropAsString(obj.edit19, "fontStyle", "bold");
    obj.edit19:setName("edit19");

    obj.rectangle68 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout7);
    obj.rectangle68:setLeft(190);
    obj.rectangle68:setTop(169);
    obj.rectangle68:setWidth(45);
    obj.rectangle68:setHeight(24);
    obj.rectangle68:setColor("#F5F5DC");
    obj.rectangle68:setXradius(7);
    obj.rectangle68:setYradius(7);
    obj.rectangle68:setCornerType("round");
    obj.rectangle68:setName("rectangle68");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout7);
    obj.edit20:setField("CombatePassivo");
    obj.edit20:setLeft(190);
    obj.edit20:setTop(169);
    obj.edit20:setWidth(45);
    obj.edit20:setHeight(24);
    obj.edit20:setTransparent(true);
    obj.edit20:setFontColor("black");
    obj.edit20:setFontSize(17);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setType("number");
    lfm_setPropAsString(obj.edit20, "fontStyle", "bold");
    obj.edit20:setName("edit20");

    obj.rectangle69 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout7);
    obj.rectangle69:setLeft(190);
    obj.rectangle69:setTop(199);
    obj.rectangle69:setWidth(45);
    obj.rectangle69:setHeight(24);
    obj.rectangle69:setColor("#F5F5DC");
    obj.rectangle69:setXradius(7);
    obj.rectangle69:setYradius(7);
    obj.rectangle69:setCornerType("round");
    obj.rectangle69:setName("rectangle69");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout7);
    obj.edit21:setField("PercepcaoPassivo");
    obj.edit21:setLeft(190);
    obj.edit21:setTop(199);
    obj.edit21:setWidth(45);
    obj.edit21:setHeight(24);
    obj.edit21:setTransparent(true);
    obj.edit21:setFontColor("black");
    obj.edit21:setFontSize(17);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setType("number");
    lfm_setPropAsString(obj.edit21, "fontStyle", "bold");
    obj.edit21:setName("edit21");

    obj.rectangle70 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout7);
    obj.rectangle70:setLeft(190);
    obj.rectangle70:setTop(229);
    obj.rectangle70:setWidth(45);
    obj.rectangle70:setHeight(24);
    obj.rectangle70:setColor("#F5F5DC");
    obj.rectangle70:setXradius(7);
    obj.rectangle70:setYradius(7);
    obj.rectangle70:setCornerType("round");
    obj.rectangle70:setName("rectangle70");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout7);
    obj.edit22:setField("CarismaPassivo");
    obj.edit22:setLeft(190);
    obj.edit22:setTop(229);
    obj.edit22:setWidth(45);
    obj.edit22:setHeight(24);
    obj.edit22:setTransparent(true);
    obj.edit22:setFontColor("black");
    obj.edit22:setFontSize(17);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setType("number");
    lfm_setPropAsString(obj.edit22, "fontStyle", "bold");
    obj.edit22:setName("edit22");

    obj.rectangle71 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout7);
    obj.rectangle71:setLeft(190);
    obj.rectangle71:setTop(259);
    obj.rectangle71:setWidth(45);
    obj.rectangle71:setHeight(24);
    obj.rectangle71:setColor("#F5F5DC");
    obj.rectangle71:setXradius(7);
    obj.rectangle71:setYradius(7);
    obj.rectangle71:setCornerType("round");
    obj.rectangle71:setName("rectangle71");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout7);
    obj.edit23:setField("InteligenciaPassivo");
    obj.edit23:setLeft(190);
    obj.edit23:setTop(259);
    obj.edit23:setWidth(45);
    obj.edit23:setHeight(24);
    obj.edit23:setTransparent(true);
    obj.edit23:setFontColor("black");
    obj.edit23:setFontSize(17);
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setType("number");
    lfm_setPropAsString(obj.edit23, "fontStyle", "bold");
    obj.edit23:setName("edit23");

    obj.rectangle72 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout7);
    obj.rectangle72:setLeft(190);
    obj.rectangle72:setTop(289);
    obj.rectangle72:setWidth(45);
    obj.rectangle72:setHeight(24);
    obj.rectangle72:setColor("#F5F5DC");
    obj.rectangle72:setXradius(7);
    obj.rectangle72:setYradius(7);
    obj.rectangle72:setCornerType("round");
    obj.rectangle72:setName("rectangle72");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout7);
    obj.edit24:setField("PrecisaoPassivo");
    obj.edit24:setLeft(190);
    obj.edit24:setTop(289);
    obj.edit24:setWidth(45);
    obj.edit24:setHeight(24);
    obj.edit24:setTransparent(true);
    obj.edit24:setFontColor("black");
    obj.edit24:setFontSize(17);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setType("number");
    lfm_setPropAsString(obj.edit24, "fontStyle", "bold");
    obj.edit24:setName("edit24");

    obj.rectangle73 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout7);
    obj.rectangle73:setLeft(190);
    obj.rectangle73:setTop(319);
    obj.rectangle73:setWidth(45);
    obj.rectangle73:setHeight(24);
    obj.rectangle73:setColor("#F5F5DC");
    obj.rectangle73:setXradius(7);
    obj.rectangle73:setYradius(7);
    obj.rectangle73:setCornerType("round");
    obj.rectangle73:setName("rectangle73");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout7);
    obj.edit25:setField("ForcaDeVontadePassivo");
    obj.edit25:setLeft(190);
    obj.edit25:setTop(319);
    obj.edit25:setWidth(45);
    obj.edit25:setHeight(24);
    obj.edit25:setTransparent(true);
    obj.edit25:setFontColor("black");
    obj.edit25:setFontSize(17);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setType("number");
    lfm_setPropAsString(obj.edit25, "fontStyle", "bold");
    obj.edit25:setName("edit25");

    obj.rectangle74 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout7);
    obj.rectangle74:setLeft(250);
    obj.rectangle74:setTop(79);
    obj.rectangle74:setWidth(45);
    obj.rectangle74:setHeight(24);
    obj.rectangle74:setColor("#F5F5DC");
    obj.rectangle74:setXradius(7);
    obj.rectangle74:setYradius(7);
    obj.rectangle74:setCornerType("round");
    obj.rectangle74:setName("rectangle74");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout7);
    obj.edit26:setField("ForcaEquips");
    obj.edit26:setLeft(250);
    obj.edit26:setTop(79);
    obj.edit26:setWidth(45);
    obj.edit26:setHeight(24);
    obj.edit26:setTransparent(true);
    obj.edit26:setFontColor("black");
    obj.edit26:setFontSize(17);
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setType("number");
    lfm_setPropAsString(obj.edit26, "fontStyle", "bold");
    obj.edit26:setName("edit26");

    obj.rectangle75 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout7);
    obj.rectangle75:setLeft(250);
    obj.rectangle75:setTop(109);
    obj.rectangle75:setWidth(45);
    obj.rectangle75:setHeight(24);
    obj.rectangle75:setColor("#F5F5DC");
    obj.rectangle75:setXradius(7);
    obj.rectangle75:setYradius(7);
    obj.rectangle75:setCornerType("round");
    obj.rectangle75:setName("rectangle75");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout7);
    obj.edit27:setField("AgilidadeEquips");
    obj.edit27:setLeft(250);
    obj.edit27:setTop(109);
    obj.edit27:setWidth(45);
    obj.edit27:setHeight(24);
    obj.edit27:setTransparent(true);
    obj.edit27:setFontColor("black");
    obj.edit27:setFontSize(17);
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setType("number");
    lfm_setPropAsString(obj.edit27, "fontStyle", "bold");
    obj.edit27:setName("edit27");

    obj.rectangle76 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout7);
    obj.rectangle76:setLeft(250);
    obj.rectangle76:setTop(139);
    obj.rectangle76:setWidth(45);
    obj.rectangle76:setHeight(24);
    obj.rectangle76:setColor("#F5F5DC");
    obj.rectangle76:setXradius(7);
    obj.rectangle76:setYradius(7);
    obj.rectangle76:setCornerType("round");
    obj.rectangle76:setName("rectangle76");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout7);
    obj.edit28:setField("VigorEquips");
    obj.edit28:setLeft(250);
    obj.edit28:setTop(139);
    obj.edit28:setWidth(45);
    obj.edit28:setHeight(24);
    obj.edit28:setTransparent(true);
    obj.edit28:setFontColor("black");
    obj.edit28:setFontSize(17);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setType("number");
    lfm_setPropAsString(obj.edit28, "fontStyle", "bold");
    obj.edit28:setName("edit28");

    obj.rectangle77 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout7);
    obj.rectangle77:setLeft(250);
    obj.rectangle77:setTop(169);
    obj.rectangle77:setWidth(45);
    obj.rectangle77:setHeight(24);
    obj.rectangle77:setColor("#F5F5DC");
    obj.rectangle77:setXradius(7);
    obj.rectangle77:setYradius(7);
    obj.rectangle77:setCornerType("round");
    obj.rectangle77:setName("rectangle77");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout7);
    obj.edit29:setField("CombateEquips");
    obj.edit29:setLeft(250);
    obj.edit29:setTop(169);
    obj.edit29:setWidth(45);
    obj.edit29:setHeight(24);
    obj.edit29:setTransparent(true);
    obj.edit29:setFontColor("black");
    obj.edit29:setFontSize(17);
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setType("number");
    lfm_setPropAsString(obj.edit29, "fontStyle", "bold");
    obj.edit29:setName("edit29");

    obj.rectangle78 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.layout7);
    obj.rectangle78:setLeft(250);
    obj.rectangle78:setTop(199);
    obj.rectangle78:setWidth(45);
    obj.rectangle78:setHeight(24);
    obj.rectangle78:setColor("#F5F5DC");
    obj.rectangle78:setXradius(7);
    obj.rectangle78:setYradius(7);
    obj.rectangle78:setCornerType("round");
    obj.rectangle78:setName("rectangle78");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout7);
    obj.edit30:setField("PercepcaoEquips");
    obj.edit30:setLeft(250);
    obj.edit30:setTop(199);
    obj.edit30:setWidth(45);
    obj.edit30:setHeight(24);
    obj.edit30:setTransparent(true);
    obj.edit30:setFontColor("black");
    obj.edit30:setFontSize(17);
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setType("number");
    lfm_setPropAsString(obj.edit30, "fontStyle", "bold");
    obj.edit30:setName("edit30");

    obj.rectangle79 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout7);
    obj.rectangle79:setLeft(250);
    obj.rectangle79:setTop(229);
    obj.rectangle79:setWidth(45);
    obj.rectangle79:setHeight(24);
    obj.rectangle79:setColor("#F5F5DC");
    obj.rectangle79:setXradius(7);
    obj.rectangle79:setYradius(7);
    obj.rectangle79:setCornerType("round");
    obj.rectangle79:setName("rectangle79");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout7);
    obj.edit31:setField("CarismaEquips");
    obj.edit31:setLeft(250);
    obj.edit31:setTop(229);
    obj.edit31:setWidth(45);
    obj.edit31:setHeight(24);
    obj.edit31:setTransparent(true);
    obj.edit31:setFontColor("black");
    obj.edit31:setFontSize(17);
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setType("number");
    lfm_setPropAsString(obj.edit31, "fontStyle", "bold");
    obj.edit31:setName("edit31");

    obj.rectangle80 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.layout7);
    obj.rectangle80:setLeft(250);
    obj.rectangle80:setTop(259);
    obj.rectangle80:setWidth(45);
    obj.rectangle80:setHeight(24);
    obj.rectangle80:setColor("#F5F5DC");
    obj.rectangle80:setXradius(7);
    obj.rectangle80:setYradius(7);
    obj.rectangle80:setCornerType("round");
    obj.rectangle80:setName("rectangle80");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout7);
    obj.edit32:setField("InteligenciaEquips");
    obj.edit32:setLeft(250);
    obj.edit32:setTop(259);
    obj.edit32:setWidth(45);
    obj.edit32:setHeight(24);
    obj.edit32:setTransparent(true);
    obj.edit32:setFontColor("black");
    obj.edit32:setFontSize(17);
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setType("number");
    lfm_setPropAsString(obj.edit32, "fontStyle", "bold");
    obj.edit32:setName("edit32");

    obj.rectangle81 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.layout7);
    obj.rectangle81:setLeft(250);
    obj.rectangle81:setTop(289);
    obj.rectangle81:setWidth(45);
    obj.rectangle81:setHeight(24);
    obj.rectangle81:setColor("#F5F5DC");
    obj.rectangle81:setXradius(7);
    obj.rectangle81:setYradius(7);
    obj.rectangle81:setCornerType("round");
    obj.rectangle81:setName("rectangle81");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout7);
    obj.edit33:setField("PrecisaoEquips");
    obj.edit33:setLeft(250);
    obj.edit33:setTop(289);
    obj.edit33:setWidth(45);
    obj.edit33:setHeight(24);
    obj.edit33:setTransparent(true);
    obj.edit33:setFontColor("black");
    obj.edit33:setFontSize(17);
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setType("number");
    lfm_setPropAsString(obj.edit33, "fontStyle", "bold");
    obj.edit33:setName("edit33");

    obj.rectangle82 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.layout7);
    obj.rectangle82:setLeft(250);
    obj.rectangle82:setTop(319);
    obj.rectangle82:setWidth(45);
    obj.rectangle82:setHeight(24);
    obj.rectangle82:setColor("#F5F5DC");
    obj.rectangle82:setXradius(7);
    obj.rectangle82:setYradius(7);
    obj.rectangle82:setCornerType("round");
    obj.rectangle82:setName("rectangle82");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout7);
    obj.edit34:setField("ForcaDeVontadeEquips");
    obj.edit34:setLeft(250);
    obj.edit34:setTop(319);
    obj.edit34:setWidth(45);
    obj.edit34:setHeight(24);
    obj.edit34:setTransparent(true);
    obj.edit34:setFontColor("black");
    obj.edit34:setFontSize(17);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setType("number");
    lfm_setPropAsString(obj.edit34, "fontStyle", "bold");
    obj.edit34:setName("edit34");

    obj.rectangle83 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.layout7);
    obj.rectangle83:setLeft(310);
    obj.rectangle83:setTop(79);
    obj.rectangle83:setWidth(45);
    obj.rectangle83:setHeight(24);
    obj.rectangle83:setColor("#F5F5DC");
    obj.rectangle83:setXradius(7);
    obj.rectangle83:setYradius(7);
    obj.rectangle83:setCornerType("round");
    obj.rectangle83:setName("rectangle83");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout7);
    obj.edit35:setField("ForcaTreino");
    obj.edit35:setLeft(310);
    obj.edit35:setTop(79);
    obj.edit35:setWidth(45);
    obj.edit35:setHeight(24);
    obj.edit35:setTransparent(true);
    obj.edit35:setFontColor("black");
    obj.edit35:setFontSize(17);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setType("number");
    lfm_setPropAsString(obj.edit35, "fontStyle", "bold");
    obj.edit35:setName("edit35");

    obj.rectangle84 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.layout7);
    obj.rectangle84:setLeft(310);
    obj.rectangle84:setTop(109);
    obj.rectangle84:setWidth(45);
    obj.rectangle84:setHeight(24);
    obj.rectangle84:setColor("#F5F5DC");
    obj.rectangle84:setXradius(7);
    obj.rectangle84:setYradius(7);
    obj.rectangle84:setCornerType("round");
    obj.rectangle84:setName("rectangle84");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout7);
    obj.edit36:setField("AgilidadeTreino");
    obj.edit36:setLeft(310);
    obj.edit36:setTop(109);
    obj.edit36:setWidth(45);
    obj.edit36:setHeight(24);
    obj.edit36:setTransparent(true);
    obj.edit36:setFontColor("black");
    obj.edit36:setFontSize(17);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setType("number");
    lfm_setPropAsString(obj.edit36, "fontStyle", "bold");
    obj.edit36:setName("edit36");

    obj.rectangle85 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.layout7);
    obj.rectangle85:setLeft(310);
    obj.rectangle85:setTop(139);
    obj.rectangle85:setWidth(45);
    obj.rectangle85:setHeight(24);
    obj.rectangle85:setColor("#F5F5DC");
    obj.rectangle85:setXradius(7);
    obj.rectangle85:setYradius(7);
    obj.rectangle85:setCornerType("round");
    obj.rectangle85:setName("rectangle85");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout7);
    obj.edit37:setField("VigorTreino");
    obj.edit37:setLeft(310);
    obj.edit37:setTop(139);
    obj.edit37:setWidth(45);
    obj.edit37:setHeight(24);
    obj.edit37:setTransparent(true);
    obj.edit37:setFontColor("black");
    obj.edit37:setFontSize(17);
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setType("number");
    lfm_setPropAsString(obj.edit37, "fontStyle", "bold");
    obj.edit37:setName("edit37");

    obj.rectangle86 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout7);
    obj.rectangle86:setLeft(310);
    obj.rectangle86:setTop(169);
    obj.rectangle86:setWidth(45);
    obj.rectangle86:setHeight(24);
    obj.rectangle86:setColor("#F5F5DC");
    obj.rectangle86:setXradius(7);
    obj.rectangle86:setYradius(7);
    obj.rectangle86:setCornerType("round");
    obj.rectangle86:setName("rectangle86");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout7);
    obj.edit38:setField("CombateTreino");
    obj.edit38:setLeft(310);
    obj.edit38:setTop(169);
    obj.edit38:setWidth(45);
    obj.edit38:setHeight(24);
    obj.edit38:setTransparent(true);
    obj.edit38:setFontColor("black");
    obj.edit38:setFontSize(17);
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setType("number");
    lfm_setPropAsString(obj.edit38, "fontStyle", "bold");
    obj.edit38:setName("edit38");

    obj.rectangle87 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.layout7);
    obj.rectangle87:setLeft(310);
    obj.rectangle87:setTop(199);
    obj.rectangle87:setWidth(45);
    obj.rectangle87:setHeight(24);
    obj.rectangle87:setColor("#F5F5DC");
    obj.rectangle87:setXradius(7);
    obj.rectangle87:setYradius(7);
    obj.rectangle87:setCornerType("round");
    obj.rectangle87:setName("rectangle87");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout7);
    obj.edit39:setField("PercepcaoTreino");
    obj.edit39:setLeft(310);
    obj.edit39:setTop(199);
    obj.edit39:setWidth(45);
    obj.edit39:setHeight(24);
    obj.edit39:setTransparent(true);
    obj.edit39:setFontColor("black");
    obj.edit39:setFontSize(17);
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setType("number");
    lfm_setPropAsString(obj.edit39, "fontStyle", "bold");
    obj.edit39:setName("edit39");

    obj.rectangle88 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout7);
    obj.rectangle88:setLeft(310);
    obj.rectangle88:setTop(229);
    obj.rectangle88:setWidth(45);
    obj.rectangle88:setHeight(24);
    obj.rectangle88:setColor("#F5F5DC");
    obj.rectangle88:setXradius(7);
    obj.rectangle88:setYradius(7);
    obj.rectangle88:setCornerType("round");
    obj.rectangle88:setName("rectangle88");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout7);
    obj.edit40:setField("CarismaTreino");
    obj.edit40:setLeft(310);
    obj.edit40:setTop(229);
    obj.edit40:setWidth(45);
    obj.edit40:setHeight(24);
    obj.edit40:setTransparent(true);
    obj.edit40:setFontColor("black");
    obj.edit40:setFontSize(17);
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setType("number");
    lfm_setPropAsString(obj.edit40, "fontStyle", "bold");
    obj.edit40:setName("edit40");

    obj.rectangle89 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.layout7);
    obj.rectangle89:setLeft(310);
    obj.rectangle89:setTop(259);
    obj.rectangle89:setWidth(45);
    obj.rectangle89:setHeight(24);
    obj.rectangle89:setColor("#F5F5DC");
    obj.rectangle89:setXradius(7);
    obj.rectangle89:setYradius(7);
    obj.rectangle89:setCornerType("round");
    obj.rectangle89:setName("rectangle89");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout7);
    obj.edit41:setField("InteligenciaTreino");
    obj.edit41:setLeft(310);
    obj.edit41:setTop(259);
    obj.edit41:setWidth(45);
    obj.edit41:setHeight(24);
    obj.edit41:setTransparent(true);
    obj.edit41:setFontColor("black");
    obj.edit41:setFontSize(17);
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setType("number");
    lfm_setPropAsString(obj.edit41, "fontStyle", "bold");
    obj.edit41:setName("edit41");

    obj.rectangle90 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.layout7);
    obj.rectangle90:setLeft(310);
    obj.rectangle90:setTop(289);
    obj.rectangle90:setWidth(45);
    obj.rectangle90:setHeight(24);
    obj.rectangle90:setColor("#F5F5DC");
    obj.rectangle90:setXradius(7);
    obj.rectangle90:setYradius(7);
    obj.rectangle90:setCornerType("round");
    obj.rectangle90:setName("rectangle90");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout7);
    obj.edit42:setField("PrecisaoTreino");
    obj.edit42:setLeft(310);
    obj.edit42:setTop(289);
    obj.edit42:setWidth(45);
    obj.edit42:setHeight(24);
    obj.edit42:setTransparent(true);
    obj.edit42:setFontColor("black");
    obj.edit42:setFontSize(17);
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setType("number");
    lfm_setPropAsString(obj.edit42, "fontStyle", "bold");
    obj.edit42:setName("edit42");

    obj.rectangle91 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.layout7);
    obj.rectangle91:setLeft(310);
    obj.rectangle91:setTop(319);
    obj.rectangle91:setWidth(45);
    obj.rectangle91:setHeight(24);
    obj.rectangle91:setColor("#F5F5DC");
    obj.rectangle91:setXradius(7);
    obj.rectangle91:setYradius(7);
    obj.rectangle91:setCornerType("round");
    obj.rectangle91:setName("rectangle91");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout7);
    obj.edit43:setField("ForcaDeVontadeTreino");
    obj.edit43:setLeft(310);
    obj.edit43:setTop(319);
    obj.edit43:setWidth(45);
    obj.edit43:setHeight(24);
    obj.edit43:setTransparent(true);
    obj.edit43:setFontColor("black");
    obj.edit43:setFontSize(17);
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setType("number");
    lfm_setPropAsString(obj.edit43, "fontStyle", "bold");
    obj.edit43:setName("edit43");

    obj.rectangle92 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.layout7);
    obj.rectangle92:setLeft(370);
    obj.rectangle92:setTop(79);
    obj.rectangle92:setWidth(45);
    obj.rectangle92:setHeight(24);
    obj.rectangle92:setColor("#F5F5DC");
    obj.rectangle92:setXradius(7);
    obj.rectangle92:setYradius(7);
    obj.rectangle92:setCornerType("round");
    obj.rectangle92:setName("rectangle92");

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

    obj.rectangle93 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle93:setParent(obj.layout7);
    obj.rectangle93:setLeft(370);
    obj.rectangle93:setTop(109);
    obj.rectangle93:setWidth(45);
    obj.rectangle93:setHeight(24);
    obj.rectangle93:setColor("#F5F5DC");
    obj.rectangle93:setXradius(7);
    obj.rectangle93:setYradius(7);
    obj.rectangle93:setCornerType("round");
    obj.rectangle93:setName("rectangle93");

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

    obj.rectangle94 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle94:setParent(obj.layout7);
    obj.rectangle94:setLeft(370);
    obj.rectangle94:setTop(139);
    obj.rectangle94:setWidth(45);
    obj.rectangle94:setHeight(24);
    obj.rectangle94:setColor("#F5F5DC");
    obj.rectangle94:setXradius(7);
    obj.rectangle94:setYradius(7);
    obj.rectangle94:setCornerType("round");
    obj.rectangle94:setName("rectangle94");

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

    obj.rectangle95 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle95:setParent(obj.layout7);
    obj.rectangle95:setLeft(370);
    obj.rectangle95:setTop(169);
    obj.rectangle95:setWidth(45);
    obj.rectangle95:setHeight(24);
    obj.rectangle95:setColor("#F5F5DC");
    obj.rectangle95:setXradius(7);
    obj.rectangle95:setYradius(7);
    obj.rectangle95:setCornerType("round");
    obj.rectangle95:setName("rectangle95");

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

    obj.rectangle96 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle96:setParent(obj.layout7);
    obj.rectangle96:setLeft(370);
    obj.rectangle96:setTop(199);
    obj.rectangle96:setWidth(45);
    obj.rectangle96:setHeight(24);
    obj.rectangle96:setColor("#F5F5DC");
    obj.rectangle96:setXradius(7);
    obj.rectangle96:setYradius(7);
    obj.rectangle96:setCornerType("round");
    obj.rectangle96:setName("rectangle96");

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

    obj.rectangle97 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle97:setParent(obj.layout7);
    obj.rectangle97:setLeft(370);
    obj.rectangle97:setTop(229);
    obj.rectangle97:setWidth(45);
    obj.rectangle97:setHeight(24);
    obj.rectangle97:setColor("#F5F5DC");
    obj.rectangle97:setXradius(7);
    obj.rectangle97:setYradius(7);
    obj.rectangle97:setCornerType("round");
    obj.rectangle97:setName("rectangle97");

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

    obj.rectangle98 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle98:setParent(obj.layout7);
    obj.rectangle98:setLeft(370);
    obj.rectangle98:setTop(259);
    obj.rectangle98:setWidth(45);
    obj.rectangle98:setHeight(24);
    obj.rectangle98:setColor("#F5F5DC");
    obj.rectangle98:setXradius(7);
    obj.rectangle98:setYradius(7);
    obj.rectangle98:setCornerType("round");
    obj.rectangle98:setName("rectangle98");

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

    obj.rectangle99 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle99:setParent(obj.layout7);
    obj.rectangle99:setLeft(370);
    obj.rectangle99:setTop(289);
    obj.rectangle99:setWidth(45);
    obj.rectangle99:setHeight(24);
    obj.rectangle99:setColor("#F5F5DC");
    obj.rectangle99:setXradius(7);
    obj.rectangle99:setYradius(7);
    obj.rectangle99:setCornerType("round");
    obj.rectangle99:setName("rectangle99");

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

    obj.rectangle100 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle100:setParent(obj.layout7);
    obj.rectangle100:setLeft(370);
    obj.rectangle100:setTop(319);
    obj.rectangle100:setWidth(45);
    obj.rectangle100:setHeight(24);
    obj.rectangle100:setColor("#F5F5DC");
    obj.rectangle100:setXradius(7);
    obj.rectangle100:setYradius(7);
    obj.rectangle100:setCornerType("round");
    obj.rectangle100:setName("rectangle100");

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

    obj.rectangle101 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle101:setParent(obj.layout7);
    obj.rectangle101:setLeft(83);
    obj.rectangle101:setTop(355);
    obj.rectangle101:setWidth(40);
    obj.rectangle101:setHeight(19);
    obj.rectangle101:setColor("#5F9EA0");
    obj.rectangle101:setXradius(7);
    obj.rectangle101:setYradius(7);
    obj.rectangle101:setCornerType("round");
    obj.rectangle101:setName("rectangle101");

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

    obj.rectangle102 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle102:setParent(obj.layout7);
    obj.rectangle102:setLeft(202);
    obj.rectangle102:setTop(355);
    obj.rectangle102:setWidth(40);
    obj.rectangle102:setHeight(19);
    obj.rectangle102:setColor("#5F9EA0");
    obj.rectangle102:setXradius(7);
    obj.rectangle102:setYradius(7);
    obj.rectangle102:setCornerType("round");
    obj.rectangle102:setName("rectangle102");

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

    obj.rectangle103 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle103:setParent(obj.layout7);
    obj.rectangle103:setLeft(293);
    obj.rectangle103:setTop(355);
    obj.rectangle103:setWidth(40);
    obj.rectangle103:setHeight(19);
    obj.rectangle103:setColor("#5F9EA0");
    obj.rectangle103:setXradius(7);
    obj.rectangle103:setYradius(7);
    obj.rectangle103:setCornerType("round");
    obj.rectangle103:setName("rectangle103");

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

    obj.rectangle104 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle104:setParent(obj.layout7);
    obj.rectangle104:setLeft(375);
    obj.rectangle104:setTop(355);
    obj.rectangle104:setWidth(40);
    obj.rectangle104:setHeight(19);
    obj.rectangle104:setColor("#5F9EA0");
    obj.rectangle104:setXradius(7);
    obj.rectangle104:setYradius(7);
    obj.rectangle104:setCornerType("round");
    obj.rectangle104:setName("rectangle104");

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

    obj.rectangle105 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle105:setParent(obj.layout7);
    obj.rectangle105:setLeft(130);
    obj.rectangle105:setTop(385);
    obj.rectangle105:setWidth(45);
    obj.rectangle105:setHeight(24);
    obj.rectangle105:setColor("#5F9EA0");
    obj.rectangle105:setXradius(7);
    obj.rectangle105:setYradius(7);
    obj.rectangle105:setCornerType("round");
    obj.rectangle105:setName("rectangle105");

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

    obj.rectangle106 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle106:setParent(obj.layout7);
    obj.rectangle106:setLeft(75);
    obj.rectangle106:setTop(426);
    obj.rectangle106:setWidth(45);
    obj.rectangle106:setHeight(20);
    obj.rectangle106:setColor("#5F9EA0");
    obj.rectangle106:setXradius(7);
    obj.rectangle106:setYradius(7);
    obj.rectangle106:setCornerType("round");
    obj.rectangle106:setName("rectangle106");

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
    obj.label44:setName("label44");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout7);
    obj.label45:setLeft(120);
    obj.label45:setTop(425);
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

    obj.rectangle107 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle107:setParent(obj.layout7);
    obj.rectangle107:setLeft(75);
    obj.rectangle107:setTop(450);
    obj.rectangle107:setWidth(45);
    obj.rectangle107:setHeight(20);
    obj.rectangle107:setColor("#5F9EA0");
    obj.rectangle107:setXradius(7);
    obj.rectangle107:setYradius(7);
    obj.rectangle107:setCornerType("round");
    obj.rectangle107:setName("rectangle107");

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
    obj.label47:setName("label47");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout7);
    obj.label48:setLeft(120);
    obj.label48:setTop(448);
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

    obj.rectangle108 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle108:setParent(obj.layout7);
    obj.rectangle108:setLeft(75);
    obj.rectangle108:setTop(474);
    obj.rectangle108:setWidth(45);
    obj.rectangle108:setHeight(20);
    obj.rectangle108:setColor("#5F9EA0");
    obj.rectangle108:setXradius(7);
    obj.rectangle108:setYradius(7);
    obj.rectangle108:setCornerType("round");
    obj.rectangle108:setName("rectangle108");

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
    obj.layout8:setWidth(450);
    obj.layout8:setHeight(525);
    obj.layout8:setName("layout8");

    obj.rectangle109 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle109:setParent(obj.layout8);
    obj.rectangle109:setLeft(0);
    obj.rectangle109:setTop(0);
    obj.rectangle109:setWidth(250);
    obj.rectangle109:setHeight(525);
    obj.rectangle109:setColor("#4169E1");
    obj.rectangle109:setName("rectangle109");

    obj.rectangle110 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle110:setParent(obj.layout8);
    obj.rectangle110:setLeft(2);
    obj.rectangle110:setTop(2);
    obj.rectangle110:setWidth(246);
    obj.rectangle110:setHeight(521);
    obj.rectangle110:setColor("black");
    obj.rectangle110:setName("rectangle110");

    obj.rectangle111 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle111:setParent(obj.layout8);
    obj.rectangle111:setLeft(12);
    obj.rectangle111:setTop(19);
    obj.rectangle111:setWidth(73);
    obj.rectangle111:setHeight(73);
    obj.rectangle111:setColor("#F5F5DC");
    obj.rectangle111:setName("rectangle111");

    obj.rectangle112 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle112:setParent(obj.layout8);
    obj.rectangle112:setLeft(13);
    obj.rectangle112:setTop(20);
    obj.rectangle112:setWidth(71);
    obj.rectangle112:setHeight(71);
    obj.rectangle112:setColor("black");
    obj.rectangle112:setName("rectangle112");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout8);
    obj.image5:setField("FotoChapeu");
    obj.image5:setLeft(13);
    obj.image5:setTop(20);
    obj.image5:setWidth(71);
    obj.image5:setHeight(71);
    obj.image5:setName("image5");

    obj.rectangle113 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle113:setParent(obj.layout8);
    obj.rectangle113:setLeft(12);
    obj.rectangle113:setTop(102);
    obj.rectangle113:setWidth(73);
    obj.rectangle113:setHeight(73);
    obj.rectangle113:setColor("#F5F5DC");
    obj.rectangle113:setName("rectangle113");

    obj.rectangle114 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle114:setParent(obj.layout8);
    obj.rectangle114:setLeft(13);
    obj.rectangle114:setTop(103);
    obj.rectangle114:setWidth(71);
    obj.rectangle114:setHeight(71);
    obj.rectangle114:setColor("black");
    obj.rectangle114:setName("rectangle114");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.layout8);
    obj.image6:setField("FotoColar");
    obj.image6:setLeft(13);
    obj.image6:setTop(103);
    obj.image6:setWidth(71);
    obj.image6:setHeight(71);
    obj.image6:setName("image6");

    obj.rectangle115 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle115:setParent(obj.layout8);
    obj.rectangle115:setLeft(12);
    obj.rectangle115:setTop(185);
    obj.rectangle115:setWidth(73);
    obj.rectangle115:setHeight(73);
    obj.rectangle115:setColor("#F5F5DC");
    obj.rectangle115:setName("rectangle115");

    obj.rectangle116 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle116:setParent(obj.layout8);
    obj.rectangle116:setLeft(13);
    obj.rectangle116:setTop(186);
    obj.rectangle116:setWidth(71);
    obj.rectangle116:setHeight(71);
    obj.rectangle116:setColor("black");
    obj.rectangle116:setName("rectangle116");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.layout8);
    obj.image7:setField("FotoRoupa");
    obj.image7:setLeft(13);
    obj.image7:setTop(186);
    obj.image7:setWidth(71);
    obj.image7:setHeight(71);
    obj.image7:setName("image7");

    obj.rectangle117 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle117:setParent(obj.layout8);
    obj.rectangle117:setLeft(12);
    obj.rectangle117:setTop(268);
    obj.rectangle117:setWidth(73);
    obj.rectangle117:setHeight(73);
    obj.rectangle117:setColor("#F5F5DC");
    obj.rectangle117:setName("rectangle117");

    obj.rectangle118 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle118:setParent(obj.layout8);
    obj.rectangle118:setLeft(13);
    obj.rectangle118:setTop(269);
    obj.rectangle118:setWidth(71);
    obj.rectangle118:setHeight(71);
    obj.rectangle118:setColor("black");
    obj.rectangle118:setName("rectangle118");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.layout8);
    obj.image8:setField("FotoMaoPrimaria");
    obj.image8:setLeft(13);
    obj.image8:setTop(269);
    obj.image8:setWidth(71);
    obj.image8:setHeight(71);
    obj.image8:setName("image8");

    obj.rectangle119 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle119:setParent(obj.layout8);
    obj.rectangle119:setLeft(12);
    obj.rectangle119:setTop(351);
    obj.rectangle119:setWidth(73);
    obj.rectangle119:setHeight(73);
    obj.rectangle119:setColor("#F5F5DC");
    obj.rectangle119:setName("rectangle119");

    obj.rectangle120 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle120:setParent(obj.layout8);
    obj.rectangle120:setLeft(13);
    obj.rectangle120:setTop(352);
    obj.rectangle120:setWidth(71);
    obj.rectangle120:setHeight(71);
    obj.rectangle120:setColor("black");
    obj.rectangle120:setName("rectangle120");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.layout8);
    obj.image9:setField("FotoCalca");
    obj.image9:setLeft(13);
    obj.image9:setTop(352);
    obj.image9:setWidth(71);
    obj.image9:setHeight(71);
    obj.image9:setName("image9");

    obj.rectangle121 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle121:setParent(obj.layout8);
    obj.rectangle121:setLeft(12);
    obj.rectangle121:setTop(434);
    obj.rectangle121:setWidth(73);
    obj.rectangle121:setHeight(73);
    obj.rectangle121:setColor("#F5F5DC");
    obj.rectangle121:setName("rectangle121");

    obj.rectangle122 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle122:setParent(obj.layout8);
    obj.rectangle122:setLeft(13);
    obj.rectangle122:setTop(435);
    obj.rectangle122:setWidth(71);
    obj.rectangle122:setHeight(71);
    obj.rectangle122:setColor("black");
    obj.rectangle122:setName("rectangle122");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.layout8);
    obj.image10:setField("FotoBota");
    obj.image10:setLeft(13);
    obj.image10:setTop(435);
    obj.image10:setWidth(71);
    obj.image10:setHeight(71);
    obj.image10:setName("image10");

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
    obj.dataLink52:setField("PontosDisponiveis");
    obj.dataLink52:setDefaultValue("16");
    obj.dataLink52:setName("dataLink52");

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.Atributos);
    obj.dataLink53:setField("PontosDistribuidos");
    obj.dataLink53:setDefaultValue("0");
    obj.dataLink53:setName("dataLink53");

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.Atributos);
    obj.dataLink54:setField("PontosOutros");
    obj.dataLink54:setDefaultValue("0");
    obj.dataLink54:setName("dataLink54");

    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.Atributos);
    obj.dataLink55:setField("PontosTotais");
    obj.dataLink55:setDefaultValue("0");
    obj.dataLink55:setName("dataLink55");

    obj.dataLink56 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.Atributos);
    obj.dataLink56:setField("FotoChapeu");
    obj.dataLink56:setDefaultValue("https://blob.firecast.com.br/blobs/BSEWIEVG_3735362/Chapeu.png");
    obj.dataLink56:setName("dataLink56");

    obj.dataLink57 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.Atributos);
    obj.dataLink57:setField("FotoColar");
    obj.dataLink57:setDefaultValue("https://blob.firecast.com.br/blobs/ELGUBICD_3735361/Colar.png");
    obj.dataLink57:setName("dataLink57");

    obj.dataLink58 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.Atributos);
    obj.dataLink58:setField("FotoRoupa");
    obj.dataLink58:setDefaultValue("https://blob.firecast.com.br/blobs/SIRPGIRT_3735359/Ropa.png");
    obj.dataLink58:setName("dataLink58");

    obj.dataLink59 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.Atributos);
    obj.dataLink59:setField("FotoMaoPrimaria");
    obj.dataLink59:setDefaultValue("https://blob.firecast.com.br/blobs/SMOQJGJO_3735363/M_o.png");
    obj.dataLink59:setName("dataLink59");

    obj.dataLink60 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.Atributos);
    obj.dataLink60:setField("FotoCalca");
    obj.dataLink60:setDefaultValue("https://blob.firecast.com.br/blobs/TQPAWOQT_3735360/Car_a.png");
    obj.dataLink60:setName("dataLink60");

    obj.dataLink61 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.Atributos);
    obj.dataLink61:setField("FotoBota");
    obj.dataLink61:setDefaultValue("0");
    obj.dataLink61:setName("dataLink61");

    obj.tab9 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl1);
    obj.tab9:setTitle("Estilo de Luta & Akuma");
    obj.tab9:setName("tab9");

    obj.EdLeAkuma = GUI.fromHandle(_obj_newObject("form"));
    obj.EdLeAkuma:setParent(obj.tab9);
    obj.EdLeAkuma:setFormType("sheetTemplate");
    obj.EdLeAkuma:setTitle("Brincadeiras Em Alto Mar");
    obj.EdLeAkuma:setName("EdLeAkuma");

    obj.tab10 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab10:setParent(obj.tabControl1);
    obj.tab10:setTitle("Inventario");
    obj.tab10:setName("tab10");

    obj.ExportImport = GUI.fromHandle(_obj_newObject("layout"));
    obj.ExportImport:setParent(obj);
    obj.ExportImport:setName("ExportImport");
    obj.ExportImport:setLeft(0);
    obj.ExportImport:setTop(0);
    obj.ExportImport:setWidth(100);
    obj.ExportImport:setHeight(1000);
    obj.ExportImport:setVisible(false);

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.ExportImport);
    obj.button7:setWidth(100);
    obj.button7:setTop(800);
    obj.button7:setText("Exportar Ficha");
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.ExportImport);
    obj.button8:setWidth(100);
    obj.button8:setTop(830);
    obj.button8:setText("Importar Ficha");
    obj.button8:setName("button8");


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

    obj._e_event2 = obj.listaOrganizacoes:addEventListener("onChange",
        function ()
            MudarBandeira()
        end);

    obj._e_event3 = obj.button1:addEventListener("onClick",
        function (event)
            self.AbaProfissaoPrincipal.visible = true; self.AbaProfissaoSecundaria.visible = false; self.AbaRaca.visible = false; self.AbaHistoria.visible = false; self.AbaAnotacoes.visible = false
            				CheckIfEmpregado(self.ProfissaoPrincipal.text); sheet.fotoProfissaoPrincipal = self.ImagemProfissaoPrincipal.src
        end);

    obj._e_event4 = obj.button2:addEventListener("onClick",
        function (event)
            self.AbaProfissaoSecundaria.visible = true; self.AbaProfissaoPrincipal.visible = false; self.AbaRaca.visible = false; self.AbaHistoria.visible = false; self.AbaAnotacoes.visible = false
            				CheckIfEmpregado(self.ProfissaoSecundaria.text); sheet.fotoProfissaoSecundaria = self.ImagemProfissaoSecundaria.src
        end);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (event)
            self.AbaRaca.visible = true; self.AbaProfissaoPrincipal.visible = false; self.AbaProfissaoSecundaria.visible = false; self.AbaHistoria.visible = false; self.AbaAnotacoes.visible = false
            				sheet.fotoRaca= self.ImagemRaca.src
        end);

    obj._e_event6 = obj.ImagemBandeira:addEventListener("onLoad",
        function ()
            sheet.imagemBandeira = self.ImagemBandeira.src
        end);

    obj._e_event7 = obj.button4:addEventListener("onClick",
        function (event)
            self.AbaHistoria.visible = true;self.AbaRaca.visible = false; self.AbaProfissaoPrincipal.visible = false; self.AbaProfissaoSecundaria.visible = false; self.AbaAnotacoes.visible = false
        end);

    obj._e_event8 = obj.button5:addEventListener("onClick",
        function (event)
            self.AbaAnotacoes.visible = true;self.AbaHistoria.visible = false;self.AbaRaca.visible = false; self.AbaProfissaoPrincipal.visible = false; self.AbaProfissaoSecundaria.visible = false
        end);

    obj._e_event9 = obj.ComboProfissaoPrincipal:addEventListener("onChange",
        function ()
            
            						MudarProfissao1(); self.DetalhamentoPrimario.field = self.ComboProfissaoPrincipal.value; self.DescricaoProfissionalPrimaria.field = self.ComboProfissaoPrincipal.value..'descri'
        end);

    obj._e_event10 = obj.TierPrincipal:addEventListener("onChange",
        function ()
            AtualizarTier('TierPrincipal','XpMaxPrincipal')
        end);

    obj._e_event11 = obj.ComboProfissaoSecundaria:addEventListener("onChange",
        function ()
            MudarProfissao2();
        end);

    obj._e_event12 = obj.TierSecundaria:addEventListener("onChange",
        function ()
            AtualizarTier('TierSecundaria','XpMaxSecundaria')
        end);

    obj._e_event13 = obj.ComboRaca:addEventListener("onChange",
        function ()
            MudarRaca(); self.DescricaoRacial.field = self.ComboRaca.value
        end);

    obj._e_event14 = obj.button6:addEventListener("onClick",
        function (event)
            showMessage(self.editHistoria:getText())
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

    obj._e_event58 = obj.DefButton:addEventListener("onMouseEnter",
        function ()
            self.DefButton.text = 'Rolar Defesa'
        end);

    obj._e_event59 = obj.DefButton:addEventListener("onMouseLeave",
        function ()
            self.DefButton.text = 'Defesa'
        end);

    obj._e_event60 = obj.DefButton:addEventListener("onClick",
        function (event)
            RolarAtributo('Defesa')
        end);

    obj._e_event61 = obj.dataLink17:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaBase == "" then sheet.ForcaBase = 1 end
            		AlterarValorTotal("Forca")
        end);

    obj._e_event62 = obj.dataLink18:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.AgilidadeBase == "" then sheet.AgilidadeBase = 1 end
            			AlterarValorTotal("Agilidade")
        end);

    obj._e_event63 = obj.dataLink19:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.VigorBase == "" then sheet.VigorBase = 1 end
            			AlterarValorTotal("Vigor")
        end);

    obj._e_event64 = obj.dataLink20:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CombateBase == "" then sheet.CombateBase = 1 end
            			AlterarValorTotal("Combate")
        end);

    obj._e_event65 = obj.dataLink21:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PercepcaoBase == "" then sheet.PercepcaoBase = 1 end
            			AlterarValorTotal("Percepcao")
        end);

    obj._e_event66 = obj.dataLink22:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CarismaBase == "" then sheet.CarismaBase = 1 end
            			AlterarValorTotal("Carisma")
        end);

    obj._e_event67 = obj.dataLink23:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.InteligenciaBase == "" then sheet.InteligenciaBase = 1 end
            			AlterarValorTotal("Inteligencia")
        end);

    obj._e_event68 = obj.dataLink24:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PrecisaoBase == "" then sheet.PrecisaoBase = 1 end
            			AlterarValorTotal("Precisao")
        end);

    obj._e_event69 = obj.dataLink25:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaDeVontadeBase == "" then sheet.ForcaDeVontadeBase = 1 end
            			AlterarValorTotal("ForcaDeVontade")
        end);

    obj._e_event70 = obj.dataLink26:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaPassivo == "" then sheet.ForcaPassivo = 0 end
            			AlterarValorTotal("Forca")
        end);

    obj._e_event71 = obj.dataLink27:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.AgilidadePassivo == "" then sheet.AgilidadePassivo = 0 end
            			AlterarValorTotal("Agilidade")
        end);

    obj._e_event72 = obj.dataLink28:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.VigorPassivo == "" then sheet.VigorPassivo = 0 end
            			AlterarValorTotal("Vigor")
        end);

    obj._e_event73 = obj.dataLink29:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CombatePassivo == "" then sheet.CombatePassivo = 0 end
            			AlterarValorTotal("Combate")
        end);

    obj._e_event74 = obj.dataLink30:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PercepcaoPassivo == "" then sheet.PercepcaoPassivo = 0 end
            			AlterarValorTotal("Percepcao")
        end);

    obj._e_event75 = obj.dataLink31:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CarismaPassivo == "" then sheet.CarismaPassivo = 0 end
            			AlterarValorTotal("Carisma")
        end);

    obj._e_event76 = obj.dataLink32:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.InteligenciaPassivo == "" then sheet.InteligenciaPassivo = 0 end
            			AlterarValorTotal("Inteligencia")
        end);

    obj._e_event77 = obj.dataLink33:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PrecisaoPassivo == "" then sheet.PrecisaoPassivo = 0 end
            			AlterarValorTotal("Precisao")
        end);

    obj._e_event78 = obj.dataLink34:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaDeVontadePassivo == "" then sheet.ForcaDeVontadePassivo = 0 end
            			AlterarValorTotal("ForcaDeVontade")
        end);

    obj._e_event79 = obj.dataLink35:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaEquips == "" then sheet.ForcaEquips = 0 end
            			AlterarValorTotal("Forca")
        end);

    obj._e_event80 = obj.dataLink36:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.AgilidadeEquips == "" then sheet.AgilidadeEquips = 0 end
            			AlterarValorTotal("Agilidade")
        end);

    obj._e_event81 = obj.dataLink37:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.VigorEquips == "" then sheet.VigorEquips = 0 end
            			AlterarValorTotal("Vigor")
        end);

    obj._e_event82 = obj.dataLink38:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CombateEquips == "" then sheet.CombateEquips = 0 end
            			AlterarValorTotal("Combate")
        end);

    obj._e_event83 = obj.dataLink39:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PercepcaoEquips == "" then sheet.PercepcaoEquips = 0 end
            			AlterarValorTotal("Percepcao")
        end);

    obj._e_event84 = obj.dataLink40:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CarismaEquips == "" then sheet.CarismaEquips = 0 end
            			AlterarValorTotal("Carisma")
        end);

    obj._e_event85 = obj.dataLink41:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.InteligenciaEquips == "" then sheet.InteligenciaEquips = 0 end
            			AlterarValorTotal("Inteligencia")
        end);

    obj._e_event86 = obj.dataLink42:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PrecisaoEquips == "" then sheet.PrecisaoEquips = 0 end
            			AlterarValorTotal("Precisao")
        end);

    obj._e_event87 = obj.dataLink43:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaDeVontadeEquips == "" then sheet.ForcaDeVontadeEquips = 0 end
            			AlterarValorTotal("ForcaDeVontade")
        end);

    obj._e_event88 = obj.dataLink44:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaTreino == "" then sheet.ForcaTreino = 0 end
            			AlterarValorTotal("Forca")
        end);

    obj._e_event89 = obj.dataLink45:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.AgilidadeTreino == "" then sheet.AgilidadeTreino = 0 end
            			AlterarValorTotal("Agilidade")
        end);

    obj._e_event90 = obj.dataLink46:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.VigorTreino == "" then sheet.VigorTreino = 0 end
            			AlterarValorTotal("Vigor")
        end);

    obj._e_event91 = obj.dataLink47:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CombateTreino == "" then sheet.CombateTreino = 0 end
            			AlterarValorTotal("Combate")
        end);

    obj._e_event92 = obj.dataLink48:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PercepcaoTreino == "" then sheet.PercepcaoTreino = 0 end
            			AlterarValorTotal("Percepcao")
        end);

    obj._e_event93 = obj.dataLink49:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CarismaTreino == "" then sheet.CarismaTreino = 0 end
            			AlterarValorTotal("Carisma")
        end);

    obj._e_event94 = obj.dataLink50:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.InteligenciaTreino == "" then sheet.InteligenciaTreino = 0 end
            			AlterarValorTotal("Inteligencia")
        end);

    obj._e_event95 = obj.dataLink51:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PrecisaoTreino == "" then sheet.PrecisaoTreino = 0 end
            			AlterarValorTotal("Precisao")
        end);

    obj._e_event96 = obj.dataLink56:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoChapeu == nil then sheet.FotoChapeu = "https://blob.firecast.com.br/blobs/BSEWIEVG_3735362/Chapeu.png" end
        end);

    obj._e_event97 = obj.dataLink57:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoColar == nil then sheet.FotoColar = "https://blob.firecast.com.br/blobs/ELGUBICD_3735361/Colar.png" end
        end);

    obj._e_event98 = obj.dataLink58:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoRoupa == nil then sheet.FotoRoupa = "https://blob.firecast.com.br/blobs/SIRPGIRT_3735359/Ropa.png" end
        end);

    obj._e_event99 = obj.dataLink59:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoMaoPrimaria == nil then sheet.FotoMaoPrimaria = "https://blob.firecast.com.br/blobs/SMOQJGJO_3735363/M_o.png" end
        end);

    obj._e_event100 = obj.dataLink60:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoCalca == nil then sheet.FotoCalca = "https://blob.firecast.com.br/blobs/TQPAWOQT_3735360/Car_a.png" end
        end);

    obj._e_event101 = obj.dataLink61:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoBota == nil then sheet.FotoBota = "https://blob.firecast.com.br/blobs/OHNVCDNS_3735367/Bota.png" end
        end);

    obj._e_event102 = obj.button7:addEventListener("onClick",
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

    obj._e_event103 = obj.button8:addEventListener("onClick",
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
            			end);
        end);

    function obj:_releaseEvents()
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

        if self.Exp ~= nil then self.Exp:destroy(); self.Exp = nil; end;
        if self.genero ~= nil then self.genero:destroy(); self.genero = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.rectangle95 ~= nil then self.rectangle95:destroy(); self.rectangle95 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.ComboRaca ~= nil then self.ComboRaca:destroy(); self.ComboRaca = nil; end;
        if self.ForcaDeVontadeTotal ~= nil then self.ForcaDeVontadeTotal:destroy(); self.ForcaDeVontadeTotal = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.NomeRaca ~= nil then self.NomeRaca:destroy(); self.NomeRaca = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.rectangle121 ~= nil then self.rectangle121:destroy(); self.rectangle121 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.ImagemRaca ~= nil then self.ImagemRaca:destroy(); self.ImagemRaca = nil; end;
        if self.NomeProfissaoSecundaria ~= nil then self.NomeProfissaoSecundaria:destroy(); self.NomeProfissaoSecundaria = nil; end;
        if self.Atributos ~= nil then self.Atributos:destroy(); self.Atributos = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle106 ~= nil then self.rectangle106:destroy(); self.rectangle106 = nil; end;
        if self.rectangle110 ~= nil then self.rectangle110:destroy(); self.rectangle110 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
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
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.TierSecundaria ~= nil then self.TierSecundaria:destroy(); self.TierSecundaria = nil; end;
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.AbaHistoria ~= nil then self.AbaHistoria:destroy(); self.AbaHistoria = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.tripulacao ~= nil then self.tripulacao:destroy(); self.tripulacao = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.ExportImport ~= nil then self.ExportImport:destroy(); self.ExportImport = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.ComboProfissaoSecundaria ~= nil then self.ComboProfissaoSecundaria:destroy(); self.ComboProfissaoSecundaria = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.LayoutProfissaoSecundaria ~= nil then self.LayoutProfissaoSecundaria:destroy(); self.LayoutProfissaoSecundaria = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.tituloDoPersonagem ~= nil then self.tituloDoPersonagem:destroy(); self.tituloDoPersonagem = nil; end;
        if self.rectangle98 ~= nil then self.rectangle98:destroy(); self.rectangle98 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.AgilidadeTotal ~= nil then self.AgilidadeTotal:destroy(); self.AgilidadeTotal = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.rectangle97 ~= nil then self.rectangle97:destroy(); self.rectangle97 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.XpMaxSecundaria ~= nil then self.XpMaxSecundaria:destroy(); self.XpMaxSecundaria = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.rectangle105 ~= nil then self.rectangle105:destroy(); self.rectangle105 = nil; end;
        if self.rectangle115 ~= nil then self.rectangle115:destroy(); self.rectangle115 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.TierPrincipal ~= nil then self.TierPrincipal:destroy(); self.TierPrincipal = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle100 ~= nil then self.rectangle100:destroy(); self.rectangle100 = nil; end;
        if self.DescricaoRacial ~= nil then self.DescricaoRacial:destroy(); self.DescricaoRacial = nil; end;
        if self.rectangle112 ~= nil then self.rectangle112:destroy(); self.rectangle112 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.Nivel ~= nil then self.Nivel:destroy(); self.Nivel = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.idade ~= nil then self.idade:destroy(); self.idade = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.CarismaTotal ~= nil then self.CarismaTotal:destroy(); self.CarismaTotal = nil; end;
        if self.PrecisaoTotal ~= nil then self.PrecisaoTotal:destroy(); self.PrecisaoTotal = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.LayoutProfissaoPrincipal ~= nil then self.LayoutProfissaoPrincipal:destroy(); self.LayoutProfissaoPrincipal = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.ForDVonButton ~= nil then self.ForDVonButton:destroy(); self.ForDVonButton = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.AbaAnotacoes ~= nil then self.AbaAnotacoes:destroy(); self.AbaAnotacoes = nil; end;
        if self.ForcaButton ~= nil then self.ForcaButton:destroy(); self.ForcaButton = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.FotoProfissaoPrincipal ~= nil then self.FotoProfissaoPrincipal:destroy(); self.FotoProfissaoPrincipal = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.FotoRaca ~= nil then self.FotoRaca:destroy(); self.FotoRaca = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.EdLeAkuma ~= nil then self.EdLeAkuma:destroy(); self.EdLeAkuma = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.AbaProfissaoSecundaria ~= nil then self.AbaProfissaoSecundaria:destroy(); self.AbaProfissaoSecundaria = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.VigorTotal ~= nil then self.VigorTotal:destroy(); self.VigorTotal = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.rectangle91 ~= nil then self.rectangle91:destroy(); self.rectangle91 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.ExpAtual ~= nil then self.ExpAtual:destroy(); self.ExpAtual = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.editHistoria ~= nil then self.editHistoria:destroy(); self.editHistoria = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.tabControl2 ~= nil then self.tabControl2:destroy(); self.tabControl2 = nil; end;
        if self.NomeProfissaoPrincipal ~= nil then self.NomeProfissaoPrincipal:destroy(); self.NomeProfissaoPrincipal = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle122 ~= nil then self.rectangle122:destroy(); self.rectangle122 = nil; end;
        if self.rectangle108 ~= nil then self.rectangle108:destroy(); self.rectangle108 = nil; end;
        if self.DetalhamentoSecundario ~= nil then self.DetalhamentoSecundario:destroy(); self.DetalhamentoSecundario = nil; end;
        if self.CarisButton ~= nil then self.CarisButton:destroy(); self.CarisButton = nil; end;
        if self.rectangle107 ~= nil then self.rectangle107:destroy(); self.rectangle107 = nil; end;
        if self.rectangle117 ~= nil then self.rectangle117:destroy(); self.rectangle117 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.Raca ~= nil then self.Raca:destroy(); self.Raca = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle102 ~= nil then self.rectangle102:destroy(); self.rectangle102 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.estluta ~= nil then self.estluta:destroy(); self.estluta = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.rectangle119 ~= nil then self.rectangle119:destroy(); self.rectangle119 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.listaOrganizacoes ~= nil then self.listaOrganizacoes:destroy(); self.listaOrganizacoes = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.DescricaoProfissionalSecundaria ~= nil then self.DescricaoProfissionalSecundaria:destroy(); self.DescricaoProfissionalSecundaria = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.ImagemProfissaoPrincipal ~= nil then self.ImagemProfissaoPrincipal:destroy(); self.ImagemProfissaoPrincipal = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.ProfissaoPrincipal ~= nil then self.ProfissaoPrincipal:destroy(); self.ProfissaoPrincipal = nil; end;
        if self.moedas ~= nil then self.moedas:destroy(); self.moedas = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.ImagemBandeira ~= nil then self.ImagemBandeira:destroy(); self.ImagemBandeira = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.AbaRaca ~= nil then self.AbaRaca:destroy(); self.AbaRaca = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.nomeDoPersonagem ~= nil then self.nomeDoPersonagem:destroy(); self.nomeDoPersonagem = nil; end;
        if self.DefButton ~= nil then self.DefButton:destroy(); self.DefButton = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.FotoProfissaoSecundaria ~= nil then self.FotoProfissaoSecundaria:destroy(); self.FotoProfissaoSecundaria = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.XpMaxPrincipal ~= nil then self.XpMaxPrincipal:destroy(); self.XpMaxPrincipal = nil; end;
        if self.rectangle99 ~= nil then self.rectangle99:destroy(); self.rectangle99 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.PrecButton ~= nil then self.PrecButton:destroy(); self.PrecButton = nil; end;
        if self.rectangle94 ~= nil then self.rectangle94:destroy(); self.rectangle94 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.rectangle93 ~= nil then self.rectangle93:destroy(); self.rectangle93 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.ProfissaoSecundaria ~= nil then self.ProfissaoSecundaria:destroy(); self.ProfissaoSecundaria = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.VigorButton ~= nil then self.VigorButton:destroy(); self.VigorButton = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.rectangle120 ~= nil then self.rectangle120:destroy(); self.rectangle120 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.tab10 ~= nil then self.tab10:destroy(); self.tab10 = nil; end;
        if self.rectangle114 ~= nil then self.rectangle114:destroy(); self.rectangle114 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.PercepcaoTotal ~= nil then self.PercepcaoTotal:destroy(); self.PercepcaoTotal = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.rectangle101 ~= nil then self.rectangle101:destroy(); self.rectangle101 = nil; end;
        if self.rectangle111 ~= nil then self.rectangle111:destroy(); self.rectangle111 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.DetalhamentoPrimario ~= nil then self.DetalhamentoPrimario:destroy(); self.DetalhamentoPrimario = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.ComboProfissaoPrincipal ~= nil then self.ComboProfissaoPrincipal:destroy(); self.ComboProfissaoPrincipal = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.ForcaTotal ~= nil then self.ForcaTotal:destroy(); self.ForcaTotal = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.ComButton ~= nil then self.ComButton:destroy(); self.ComButton = nil; end;
        if self.ImagemProfissaoSecundaria ~= nil then self.ImagemProfissaoSecundaria:destroy(); self.ImagemProfissaoSecundaria = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.rectangle96 ~= nil then self.rectangle96:destroy(); self.rectangle96 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.tabControl4 ~= nil then self.tabControl4:destroy(); self.tabControl4 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.tabControl3 ~= nil then self.tabControl3:destroy(); self.tabControl3 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.InteligenciaTotal ~= nil then self.InteligenciaTotal:destroy(); self.InteligenciaTotal = nil; end;
        if self.rectangle109 ~= nil then self.rectangle109:destroy(); self.rectangle109 = nil; end;
        if self.rectangle104 ~= nil then self.rectangle104:destroy(); self.rectangle104 = nil; end;
        if self.rectangle116 ~= nil then self.rectangle116:destroy(); self.rectangle116 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.rectangle103 ~= nil then self.rectangle103:destroy(); self.rectangle103 = nil; end;
        if self.rectangle113 ~= nil then self.rectangle113:destroy(); self.rectangle113 = nil; end;
        if self.InfoGerais ~= nil then self.InfoGerais:destroy(); self.InfoGerais = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.PercepButton ~= nil then self.PercepButton:destroy(); self.PercepButton = nil; end;
        if self.rectangle118 ~= nil then self.rectangle118:destroy(); self.rectangle118 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.IntButton ~= nil then self.IntButton:destroy(); self.IntButton = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.CombateTotal ~= nil then self.CombateTotal:destroy(); self.CombateTotal = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.sex ~= nil then self.sex:destroy(); self.sex = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.AgilButton ~= nil then self.AgilButton:destroy(); self.AgilButton = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
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
