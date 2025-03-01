require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_RpgProd()
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
    obj:setDataType("DATA_TYPE_AQUI");
    obj:setTitle("Brincadeiras Em Alto Mar");
    obj:setName("RpgProd");


			-- Listas de dados
			local Organizacoes = {'Kurokage', 'Revolucionario', 'Governo Mundial', 'Marinha', 'Pirata', 'Não Definido'}
			
			local EstilosDeLuta = {
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
			
			local Profissoes = {
				'Escolher', 'Armador', 'Artista', 'Atirador', 'Biologo', 'Cientista',
				'Cozinheiro', 'Espadachim', 'Ferreiro', 'Lutador', 'Navegador', 'Timoneiro'
			}
			
			local Racas = {
				'Humanos', 'Kujas', 'Kumates', 'Braços-Longos', 'Pernas-Longas', 
				'Meios-Gigante', 'Gigantes', 'Tritoes', 'Sereianos', 'Skypeanos', 
				'Tontattas', 'Ciborgues', 'Tres Olhos', 'Minks', 'Onis', 'Lunares', 
				'Wotans', 'Humanos-Tritoes', 'Torinos', 'Tenryubitos', 'Humanos-Mink', 
				'Nordicos', 'Misticos', 'Anfites', 'Dolkins', 'Glacies', 'Licantropos', 
				'Drakumiras', 'Andarilhos do Sol', 'Amigo dos Elementos', 'Serpentiuns', 
				'Devotos da Chama Sombria', 'Cinzentos', 'Gladios', 'Hamonianos', 
				'Anoes', 'Drakos', 'Vulcanuns', 'Viridianos'
			}

			-- Informações das profissões
			ProfissoesInfo = {
				Armador = {
					descricao = "Os armadores são indivíduos que vivem de sua criatividade, colocando em prática seus conhecimentos de carpintaria para fazer grandes criações com seu trabalho em madeira.",
					especializacao = "Inicialmente, os personagens que seguem este caminho iniciam na profissão Armador, e eventualmente podem se especializar e se tornar Construtor ou Aprimorador.",
					dominio = "Caso se torne um Construtor, evolui para o domínio Monarca do Carvalho ou Operador de Ébano. Caso se torne um Aprimorador, evolui para o domínio Mestre de Artilharia ou Inspetor Bugiganga.",
					imagem = "https://i.pinimg.com/originals/b6/a0/a4/b6a0a41ec6037bf11a744626f346a325.gif"
				},
				Artista = {
					descricao = "Os artistas são indivíduos talentosos que são capazes de sobreviver e fazer grande quantidade de dinheiro através de manifestações artísticas especializadas.",
					especializacao = "Inicialmente, os personagens que seguem este caminho iniciam na profissão Artista, e eventualmente podem se especializar e se tornar Performáticos ou Criadores.",
					dominio = "Caso se torne um Performático, evolui para o domínio Showman ou Charlatão. Caso se torne um Criador, evolui para o domínio Midas ou Mímico.",
					imagem = "https://blob.firecast.com.br/blobs/GQSBFKNR_3714276/one-piece-brook.gif"
				},
				Atirador = {
					descricao = "Atirador é uma pessoa adepta a utilizar armamentos de longa distancia que atiram projeteis de diferentes tamanhos, formas e utilidades. Muito parecido com os músicos, atiradores furtivos, em série, são uma ocupação opcional e alternativos para qualquer Marinheiro ou pirata. Atiradores geralmente têm grande acuidade visual e precisão, o que lhes permite atingir alvos difíceis de uma distância considerável. Devido à sua escolha de armas, atiradores são melhores no combate de longo alcance.",
					especializacao = "",
					dominio = "",
					imagem = "https://blob.firecast.com.br/blobs/QFIOHLHK_3700975/pont.gif"
				},
				Biologo = {
					descricao = "Os biólogos são sujeitos que se inclinam à produção de conhecimento acerca de métodos de intervenção em seres vivos, se especializando no cuidado de ferimentos e doenças que afligem as raças humanóides. Os biólogos são os indivíduos mais capacitados em identificar ferimentos e arquitetar planos para tratar tais ferimentos, representando uma figura de valor inestimável para qualquer grupo.",
					especializacao = "Inicialmente, os personagens que seguem este caminho iniciam na profissão Biólogo, e eventualmente podem se especializar e se tornar Médico ou Pesquisador.",
					dominio = "Caso se torne um Médico, evolui para o domínio Dominador de Imprevistos ou Minucioso Absoluto. Caso se torne um Pesquisador, evolui para o domínio Antagonista da Praga ou Explorador Psíquico.",
					imagem = "https://blob.firecast.com.br/blobs/COLJVQKI_3714278/1VTa.gif"
				},
				Cientista = {
					descricao = "Os Cientistas são, geralmente, indivíduos com capacidades intelectuais muito acima da média, capazes de realizar invenções de extrema importância para o avanço do mundo e da sociedade humana como um todo. São os responsáveis pelo avanço da tecnologia, melhorando a qualidade de vida dos humanos com suas invenções e concedendo um leque diverso de dispositivos e armamentos para serem utilizados por sua tripulação ou grupo afiliado.",
					especializacao = "Inicialmente, os personagens que seguem este caminho iniciam na profissão Cientista, e eventualmente podem se especializar e se tornar Químicos ou Físicos.",
					dominio = "Caso se torne um Químico, evolui para o domínio Gênesis ou Oppenheimer. Caso se torne um Físico, evolui para o domínio Supremacista Robótico ou Stark.",
					imagem = "https://media.tenor.com/uLEe97tKW2UAAAAM/vegapunk-vegapunk-one-piece.gif"
				},
				Cozinheiro = {
					descricao = "Os cozinheiros são indivíduos que se especializam no preparo de alimentos e refeições harmônicas e reconfortantes, que apaziguam a fome e os sentimentos daqueles que as saboreiam. Os profissionais dessa área são capazes de aprender receitas criadas por outros indivíduos ou até mesmo desenvolver seus próprios pratos, alcançando fama no mundo através dos sabores que suas refeições transpassam.",
					especializacao = "Inicialmente, os personagens que seguem este caminho iniciam na profissão Cozinheiro, e eventualmente podem se especializar e se tornar Gastrônomo ou Coqueteleiro.",
					dominio = "Caso se torne um Gastrônomo, evolui para o domínio Confeiteiro ou Mestre Cuca. Caso se torne um Coqueteleiro, evolui para o domínio Alquimista dos Drinks ou Mixologista Maestral.",
					imagem = "https://blob.firecast.com.br/blobs/JDMTSCLP_3714279/f0436d2a80aebd709b98574d859fa915.gif"
				},
				Espadachim = {
					descricao = "Existem aqueles que dividem seu tempo entre aprimorar habilidades combativas e profissionais, e os que se especializam em uma área do combate, como o tiro ou a espada. A diferença entre um indivíduo que porta uma arma e um que se dedica a um estilo específico, como espadachim ou atirador, é notável. O progresso nesse caminho depende do Tier do personagem, sendo que ao atingir o nível 10, um personagem se torna de Tier I, o que reflete sua especialização no combate.",
					especializacao = "",
					dominio = "",
					imagem = "https://i.pinimg.com/originals/4d/64/08/4d6408285378256a5080815dad34d608.gif"
				},
				Ferreiro = {
					descricao = "Os ferreiros são artesãos habilidosos que dedicam suas vidas à metalurgia e ao trabalho com metais. Eles são capazes de forjar armas, armaduras e ferramentas de qualidade, utilizando seu conhecimento sobre diferentes materiais e técnicas de fundição. Os ferreiros ganham respeito e fama na comunidade, e seus produtos podem se tornar objetos de desejo entre aventureiros e nobres.",
					especializacao = "Inicialmente, os personagens que seguem este caminho iniciam na profissão Ferreiro, e eventualmente podem se especializar e se tornar Adepto da Metalurgia ou Ferreiro Rúnico.",
					dominio = "Caso se torne um Adepto, evolui para o domínio Monarca do Carvalho ou Operador de Ébano. Caso se torne um Ferreiro Rúnico, evolui para o domínio Mestre de Artilharia ou Manipulador de Runas.",
					imagem = "https://blob.firecast.com.br/blobs/FKKGJJIJ_3714281/V_deo_sem_t_tulo___Feito_com_o_Clipchamp.gif"
				},
				Lutador = {
					descricao = "Existem aqueles que dividem seu tempo entre aprimorar habilidades combativas e profissionais, e os que se especializam em uma área do combate, como o tiro ou a espada. A diferença entre um indivíduo que porta uma arma e um que se dedica a um estilo específico, como espadachim ou atirador, é notável. O progresso nesse caminho depende do Tier do personagem, sendo que ao atingir o nível 10, um personagem se torna de Tier I, o que reflete sua especialização no combate.",
					especializacao = "",
					dominio = "",
					imagem = "https://i.pinimg.com/originals/d3/78/9f/d3789ff69a5bc82b336720427dcccc61.gif"
				},
				Navegador = {
					descricao = "Os navegadores são indivíduos que se especializam na confecção e leitura de mapas, sendo capazes de utilizar seus conhecimentos amplos a respeito da geografia local e dos mares para criar rotas marítimas que podem ser utilizadas para se locomover de maneira segura pelos mares. É sabido que uma embarcação sem um navegador é uma embarcação à deriva, pois somente esses sujeitos são capazes de se localizar com precisão na vastidão dos mares.",
					especializacao = "Inicialmente, os personagens que seguem este caminho iniciam na profissão Navegador, e eventualmente podem se especializar e se tornar Astrônomo ou Cartógrafo..",
					dominio = "Caso se torne um Astrônomo, evolui para o domínio Viajante Astral ou Oráculo do Clima. Caso se torne um Cartógrafo, evolui para o domínio Desbravador de Biomas ou Desvendador de Legados.",
					imagem = "https://pa1.narvii.com/6407/0f7d976a3661b43b1dc25c3184c3827067f00262_hq.gif"
				},
				Timoneiro = {
					descricao = "Timoneiros são os mestres do controle do navio, sendo os responsáveis por manobras rápidas e precisas em batalhas ou durante tempestades. Eles possuem grande habilidade em orientar a tripulação durante o navegar.",
					especializacao = "Inicialmente, os personagens que seguem este caminho iniciam na profissão Timoneiro, e podem se especializar em Capitão de Navio ou Mestre das Manobras.",
					dominio = "Caso se torne um Capitão de Navio, evolui para o domínio Senhor dos Mares ou Comandante Imbatível. Caso se torne um Mestre das Manobras, evolui para o domínio Mestre Timoneiro ou Lorde dos Ventos.",
					imagem = "https://blob.firecast.com.br/blobs/GQSBFKNR_3714276/one-piece-brook.gif"
				}
			}
			
			--Informaçoes de raças
			local RacasInfo = {
				Humanos = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Kujas = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Kumates = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				["Braços-Longos"] = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				["Pernas-Longas"] = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				["Meios-Gigante"] = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Gigantes = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Tritoes = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Sereianos = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Skypeanos = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Tontattas = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Ciborgues = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				["Tres Olhos"] = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Minks = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Onis = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Lunares = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Wotans = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				["Humanos-Tritoes"] = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Torinos  = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Tenryubitos = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				["Humanos-Mink"] = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Nordicos = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Misticos  = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Anfites = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Dolkins = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Glacies  = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Licantropos = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Drakumiras = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				["Andarilhos do Sol"] = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				["Amigo dos Elementos"] = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Serpentiuns = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				["Devotos da Chama Sombria"] = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Cinzentos = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Gladios = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Hamonianos = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Anoes = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Drakos = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Vulcanuns = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				},
				Viridianos = {
					descricao = "aaaaaa",
					bonus = "aaaa",
					imagem = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
				}
			}
			
			--Função Para Atualizar o Xp
			function AtualizarExp()
				local nivel = tonumber(self.Nivel.text) or 1
				self.Exp.text = tostring(300 + (100 * (nivel - 1)))
			end
			
			-- Função para mudar a bandeira
			local bandeiras = {Kurokage = "https://blob.firecast.com.br/blobs/BUJUONIQ_3579179/_82bd8847-4e74-4b5b-80aa-a03f51baf153.jpg",
				Revolucionario = "https://blob.firecast.com.br/blobs/LDWMSERB_3713983/revolutionary_army_jolly_roger_by_jormxdos.jpg",
				["Governo Mundial"] = "https://blob.firecast.com.br/blobs/CJTSDRKM_3713984/eba.png",
				Marinha = "https://blob.firecast.com.br/blobs/FIMRMEGR_3713982/marine_jolly_roger_by_jormxdos_dfgi7jt-pre.jpg"
			}

			function MudarBandeira()
				organizacao = self.listaOrganizacoes.value
				self.ImagemBandeira.src = bandeiras[organizacao]
				
				if (self.ImagemBandeira.src == "") then
					self.ImagemBandeira.editable = true
				else
					self.ImagemBandeira.editable = false
				end
			end

			-- Função para mudar profissão
			function MudarProfissao(profissaoId, nomeProfissao, profissaoField, descricaoField, especializacaoField, dominioField, imagemField, layoutField, fotoField, nomeField)
				local profissaoSelecionada = self[profissaoField].value
				local profissao = ProfissoesInfo[profissaoSelecionada]
				
				self[nomeProfissao].text = self[profissaoField].value
				if profissao then
					self[descricaoField].text = "                                       " .. profissao.descricao
					self[especializacaoField].text = "                             " .. profissao.especializacao
					self[dominioField].text = "                  " .. profissao.dominio
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
				MudarProfissao("1", "ProfissaoPrincipal", "ComboProfissaoPrincipal", "DescricaoProfissaoPrincipal", "ExpecializacaoPrincipal", "DominioPrincipal", "FotoProfissaoPrincipal", "LayoutProfissaoPrincipal", "ImagemProfissaoPrincipal", "NomeProfissaoPrincipal")
			end

			function MudarProfissao2()
				MudarProfissao("2", "ProfissaoSecundaria", "ComboProfissaoSecundaria", "DescricaoProfissaoSecundaria", "ExpecializacaoSecundaria", "DominioSecundaria", "FotoProfissaoSecundaria", "LayoutProfissaoSecundaria", "ImagemProfissaoSecundaria", "NomeProfissaoSecundaria")
			end
			
			function MudarRaca()
				local racaSelecionada = self.ComboRaca.value
				local raca = RacasInfo[racaSelecionada]
				
				self.Raca.text = self.ComboRaca.value
				if raca then
					self.DescricaoRaca.text = "                                       " .. raca.descricao
					self.BonusRaca.text = "                             " .. raca.bonus
					self.FotoRaca.src = raca.imagem
					self.LayoutRaca.visible = true
					
					self.ImagemRaca.src = raca.imagem
					self.NomeRaca.text = self.ComboRaca.value
				end
			end
		


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
    obj.tabControl1:setLeft(2);
    obj.tabControl1:setTop(15);
    obj.tabControl1:setWidth(10000);
    obj.tabControl1:setHeight(8000);
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Informações Gerais");
    obj.tab1:setName("tab1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.tab1);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(10000);
    obj.rectangle2:setHeight(10000);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.tab1);
    obj.layout1:setLeft(5);
    obj.layout1:setTop(10);
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
    obj.rectangle3:setColor("navajowhite");
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
    obj.label1:setText("Clique para   adicionar seu personagem");
    obj.label1:setFontSize(12.5);
    lfm_setPropAsString(obj.label1, "fontStyle", "bold");
    obj.label1:setFontColor("navajowhite");
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
    obj.rectangle5:setColor("navajowhite");
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
    obj.label2:setText("Clique para   adicionar seu cartaz de recompensa");
    obj.label2:setFontSize(12.5);
    lfm_setPropAsString(obj.label2, "fontStyle", "bold");
    obj.label2:setFontColor("navajowhite");
    obj.label2:setAutoSize(true);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout2);
    obj.image2:setField("CartazdeRecompensa");
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
    obj.rectangle7:setColor("navajowhite");
    obj.rectangle7:setName("rectangle7");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout3);
    obj.rectangle8:setLeft(194);
    obj.rectangle8:setTop(24);
    obj.rectangle8:setWidth(456);
    obj.rectangle8:setHeight(251);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setName("rectangle8");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setLeft(255);
    obj.edit1:setTop(30);
    obj.edit1:setWidth(320);
    obj.edit1:setHeight(50);
    obj.edit1:setTransparent(true);
    obj.edit1:setText("Nome do Personagem");
    obj.edit1:setFontColor("navajowhite");
    obj.edit1:setFontSize(25);
    lfm_setPropAsString(obj.edit1, "fontStyle", "bold");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setLeft(275);
    obj.edit2:setTop(70);
    obj.edit2:setWidth(280);
    obj.edit2:setHeight(23);
    obj.edit2:setTransparent(true);
    obj.edit2:setText("Titulo");
    obj.edit2:setFontColor("navajowhite");
    obj.edit2:setFontSize(15);
    lfm_setPropAsString(obj.edit2, "fontStyle", "bold");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setLeft(285);
    obj.label3:setTop(95);
    obj.label3:setWidth(260);
    obj.label3:setHeight(50);
    obj.label3:setText("Dados Basicos");
    obj.label3:setFontColor("navajowhite");
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
    obj.label4:setFontColor("navajowhite");
    obj.label4:setFontSize(14);
    lfm_setPropAsString(obj.label4, "fontStyle", "bold");
    obj.label4:setName("label4");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout3);
    obj.rectangle9:setLeft(315);
    obj.rectangle9:setTop(146);
    obj.rectangle9:setWidth(80);
    obj.rectangle9:setHeight(18);
    obj.rectangle9:setColor("navajowhite");
    obj.rectangle9:setXradius(7);
    obj.rectangle9:setYradius(7);
    obj.rectangle9:setCornerType("round");
    obj.rectangle9:setName("rectangle9");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout3);
    obj.rectangle10:setLeft(275);
    obj.rectangle10:setTop(147);
    obj.rectangle10:setWidth(35);
    obj.rectangle10:setHeight(18);
    obj.rectangle10:setColor("navajowhite");
    obj.rectangle10:setXradius(7);
    obj.rectangle10:setYradius(7);
    obj.rectangle10:setCornerType("round");
    obj.rectangle10:setName("rectangle10");

    obj.Nivel = GUI.fromHandle(_obj_newObject("edit"));
    obj.Nivel:setParent(obj.layout3);
    obj.Nivel:setName("Nivel");
    obj.Nivel:setLeft(275);
    obj.Nivel:setTop(146);
    obj.Nivel:setWidth(35);
    obj.Nivel:setHeight(17);
    obj.Nivel:setText("1");
    obj.Nivel:setFontColor("black");
    obj.Nivel:setFontSize(12);
    obj.Nivel:setHorzTextAlign("center");
    obj.Nivel:setType("number");
    obj.Nivel:setTransparent(true);

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setLeft(315);
    obj.edit3:setTop(147);
    obj.edit3:setWidth(40);
    obj.edit3:setHeight(17);
    obj.edit3:setText("0");
    obj.edit3:setFontColor("black");
    obj.edit3:setFontSize(12);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setType("number");
    obj.edit3:setTransparent(true);
    obj.edit3:setName("edit3");

    obj.Exp = GUI.fromHandle(_obj_newObject("edit"));
    obj.Exp:setParent(obj.layout3);
    obj.Exp:setName("Exp");
    obj.Exp:setLeft(356);
    obj.Exp:setTop(146);
    obj.Exp:setWidth(40);
    obj.Exp:setHeight(17);
    obj.Exp:setText("300");
    obj.Exp:setFontColor("black");
    obj.Exp:setFontSize(12);
    obj.Exp:setReadOnly(false);
    obj.Exp:setHorzTextAlign("center");
    obj.Exp:setTransparent(true);

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout3);
    obj.edit4:setLeft(350);
    obj.edit4:setTop(147);
    obj.edit4:setWidth(17);
    obj.edit4:setHeight(17);
    obj.edit4:setText("/");
    obj.edit4:setFontColor("black");
    obj.edit4:setFontSize(12);
    obj.edit4:setReadOnly(false);
    obj.edit4:setTransparent(true);
    obj.edit4:setName("edit4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout3);
    obj.label5:setLeft(215);
    obj.label5:setTop(158);
    obj.label5:setWidth(100);
    obj.label5:setHeight(50);
    obj.label5:setText("Idade:");
    obj.label5:setFontColor("navajowhite");
    obj.label5:setFontSize(14);
    lfm_setPropAsString(obj.label5, "fontStyle", "bold");
    obj.label5:setName("label5");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout3);
    obj.rectangle11:setLeft(275);
    obj.rectangle11:setTop(176);
    obj.rectangle11:setWidth(120);
    obj.rectangle11:setHeight(17);
    obj.rectangle11:setColor("navajowhite");
    obj.rectangle11:setXradius(7);
    obj.rectangle11:setYradius(7);
    obj.rectangle11:setCornerType("round");
    obj.rectangle11:setName("rectangle11");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout3);
    obj.edit5:setLeft(275);
    obj.edit5:setTop(176);
    obj.edit5:setWidth(120);
    obj.edit5:setHeight(17);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontColor("black");
    obj.edit5:setFontSize(12);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout3);
    obj.label6:setLeft(215);
    obj.label6:setTop(188);
    obj.label6:setWidth(100);
    obj.label6:setHeight(50);
    obj.label6:setText("Gênero:");
    obj.label6:setFontColor("navajowhite");
    obj.label6:setFontSize(14);
    lfm_setPropAsString(obj.label6, "fontStyle", "bold");
    obj.label6:setName("label6");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout3);
    obj.rectangle12:setLeft(275);
    obj.rectangle12:setTop(206);
    obj.rectangle12:setWidth(120);
    obj.rectangle12:setHeight(17);
    obj.rectangle12:setColor("navajowhite");
    obj.rectangle12:setXradius(7);
    obj.rectangle12:setYradius(7);
    obj.rectangle12:setCornerType("round");
    obj.rectangle12:setName("rectangle12");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout3);
    obj.edit6:setLeft(275);
    obj.edit6:setTop(206);
    obj.edit6:setWidth(120);
    obj.edit6:setHeight(17);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontColor("black");
    obj.edit6:setFontSize(12);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout3);
    obj.label7:setLeft(215);
    obj.label7:setTop(218);
    obj.label7:setWidth(100);
    obj.label7:setHeight(50);
    obj.label7:setText("Moedas:");
    obj.label7:setFontColor("navajowhite");
    obj.label7:setFontSize(14);
    lfm_setPropAsString(obj.label7, "fontStyle", "bold");
    obj.label7:setName("label7");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout3);
    obj.rectangle13:setLeft(275);
    obj.rectangle13:setTop(236);
    obj.rectangle13:setWidth(120);
    obj.rectangle13:setHeight(17);
    obj.rectangle13:setColor("navajowhite");
    obj.rectangle13:setXradius(7);
    obj.rectangle13:setYradius(7);
    obj.rectangle13:setCornerType("round");
    obj.rectangle13:setName("rectangle13");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout3);
    obj.edit7:setLeft(275);
    obj.edit7:setTop(236);
    obj.edit7:setWidth(120);
    obj.edit7:setHeight(17);
    obj.edit7:setTransparent(true);
    obj.edit7:setText("0");
    obj.edit7:setFontColor("black");
    obj.edit7:setFontSize(12);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout3);
    obj.label8:setLeft(415);
    obj.label8:setTop(128);
    obj.label8:setWidth(100);
    obj.label8:setHeight(50);
    obj.label8:setText("Tripulação:");
    obj.label8:setFontColor("navajowhite");
    obj.label8:setFontSize(14);
    lfm_setPropAsString(obj.label8, "fontStyle", "bold");
    obj.label8:setName("label8");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout3);
    obj.rectangle14:setLeft(505);
    obj.rectangle14:setTop(146);
    obj.rectangle14:setWidth(120);
    obj.rectangle14:setHeight(17);
    obj.rectangle14:setColor("navajowhite");
    obj.rectangle14:setXradius(7);
    obj.rectangle14:setYradius(7);
    obj.rectangle14:setCornerType("round");
    obj.rectangle14:setName("rectangle14");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout3);
    obj.edit8:setLeft(505);
    obj.edit8:setTop(146);
    obj.edit8:setWidth(120);
    obj.edit8:setHeight(17);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontColor("black");
    obj.edit8:setFontSize(12);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout3);
    obj.label9:setLeft(415);
    obj.label9:setTop(158);
    obj.label9:setWidth(100);
    obj.label9:setHeight(50);
    obj.label9:setText("Est. de Luta:");
    obj.label9:setFontColor("navajowhite");
    obj.label9:setFontSize(14);
    lfm_setPropAsString(obj.label9, "fontStyle", "bold");
    obj.label9:setName("label9");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout3);
    obj.rectangle15:setLeft(505);
    obj.rectangle15:setTop(176);
    obj.rectangle15:setWidth(120);
    obj.rectangle15:setHeight(17);
    obj.rectangle15:setColor("navajowhite");
    obj.rectangle15:setXradius(7);
    obj.rectangle15:setYradius(7);
    obj.rectangle15:setCornerType("round");
    obj.rectangle15:setName("rectangle15");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout3);
    obj.comboBox1:setLeft(505);
    obj.comboBox1:setTop(176);
    obj.comboBox1:setWidth(120);
    obj.comboBox1:setHeight(17);
    obj.comboBox1:setTransparent(true);
    obj.comboBox1:setFontColor("black");
    obj.comboBox1:setFontSize(12);
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setItems(EstilosDeLuta);
    obj.comboBox1:setName("comboBox1");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout3);
    obj.label10:setLeft(415);
    obj.label10:setTop(188);
    obj.label10:setWidth(100);
    obj.label10:setHeight(50);
    obj.label10:setText("Sexualidade:");
    obj.label10:setFontColor("navajowhite");
    obj.label10:setFontSize(14);
    lfm_setPropAsString(obj.label10, "fontStyle", "bold");
    obj.label10:setName("label10");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout3);
    obj.rectangle16:setLeft(505);
    obj.rectangle16:setTop(206);
    obj.rectangle16:setWidth(120);
    obj.rectangle16:setHeight(17);
    obj.rectangle16:setColor("navajowhite");
    obj.rectangle16:setXradius(7);
    obj.rectangle16:setYradius(7);
    obj.rectangle16:setCornerType("round");
    obj.rectangle16:setName("rectangle16");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout3);
    obj.edit9:setLeft(505);
    obj.edit9:setTop(206);
    obj.edit9:setWidth(120);
    obj.edit9:setHeight(17);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontColor("black");
    obj.edit9:setFontSize(12);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout3);
    obj.label11:setLeft(415);
    obj.label11:setTop(218);
    obj.label11:setWidth(100);
    obj.label11:setHeight(50);
    obj.label11:setText("Organização:");
    obj.label11:setFontColor("navajowhite");
    obj.label11:setFontSize(14);
    lfm_setPropAsString(obj.label11, "fontStyle", "bold");
    obj.label11:setName("label11");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout3);
    obj.rectangle17:setLeft(505);
    obj.rectangle17:setTop(236);
    obj.rectangle17:setWidth(120);
    obj.rectangle17:setHeight(17);
    obj.rectangle17:setColor("navajowhite");
    obj.rectangle17:setXradius(7);
    obj.rectangle17:setYradius(7);
    obj.rectangle17:setCornerType("round");
    obj.rectangle17:setName("rectangle17");

    obj.listaOrganizacoes = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.listaOrganizacoes:setParent(obj.layout3);
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
    obj.rectangle18:setColor("navajowhite");
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
    obj.rectangle20:setColor("navajowhite");
    obj.rectangle20:setName("rectangle20");

    obj.NomeProfissaoPrincipal = GUI.fromHandle(_obj_newObject("label"));
    obj.NomeProfissaoPrincipal:setParent(obj.layout4);
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
    obj.rectangle21:setColor("navajowhite");
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
    obj.rectangle23:setColor("navajowhite");
    obj.rectangle23:setName("rectangle23");

    obj.NomeProfissaoSecundaria = GUI.fromHandle(_obj_newObject("label"));
    obj.NomeProfissaoSecundaria:setParent(obj.layout4);
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
    obj.ImagemProfissaoSecundaria:setName("ImagemProfissaoSecundaria");
    obj.ImagemProfissaoSecundaria:setField("imagemProfissão2");
    obj.ImagemProfissaoSecundaria:setLeft(563);
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
    obj.rectangle24:setColor("navajowhite");
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
    obj.rectangle26:setColor("navajowhite");
    obj.rectangle26:setName("rectangle26");

    obj.NomeRaca = GUI.fromHandle(_obj_newObject("label"));
    obj.NomeRaca:setParent(obj.layout4);
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
    obj.ImagemRaca:setName("ImagemRaca");
    obj.ImagemRaca:setLeft(310);
    obj.ImagemRaca:setTop(300);
    obj.ImagemRaca:setWidth(225);
    obj.ImagemRaca:setHeight(92);
    obj.ImagemRaca:setStyle("autoFit");
    obj.ImagemRaca.animate = true;
    obj.ImagemRaca:setSRC("https://blob.firecast.com.br/blobs/LBESRIOB_3383437/usopp.gif");

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
    obj.rectangle27:setColor("navajowhite");
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
    obj.label12:setFontColor("navajowhite");
    obj.label12:setAutoSize(true);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.ImagemBandeira = GUI.fromHandle(_obj_newObject("image"));
    obj.ImagemBandeira:setParent(obj.layout4);
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
    obj.rectangle29:setColor("navajowhite");
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
    obj.rectangle31:setColor("navajowhite");
    obj.rectangle31:setName("rectangle31");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout4);
    obj.label13:setLeft(196);
    obj.label13:setTop(526);
    obj.label13:setWidth(89);
    obj.label13:setHeight(115);
    obj.label13:setText("Historia");
    obj.label13:setFontSize(13);
    lfm_setPropAsString(obj.label13, "fontStyle", "bold");
    obj.label13:setFontColor("black");
    obj.label13:setAutoSize(true);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout4);
    obj.image3:setField("ImagemHistoria");
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
    obj.rectangle32:setColor("navajowhite");
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
    obj.rectangle34:setColor("navajowhite");
    obj.rectangle34:setName("rectangle34");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout4);
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
    obj.image4:setField("ImagemAnotacao");
    obj.image4:setLeft(561);
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
    obj.rectangle35:setColor("navajowhite");
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
    obj.ProfissaoPrincipal:setName("ProfissaoPrincipal");
    obj.ProfissaoPrincipal:setLeft(170);
    obj.ProfissaoPrincipal:setTop(5);
    obj.ProfissaoPrincipal:setWidth(250);
    obj.ProfissaoPrincipal:setHeight(35);
    obj.ProfissaoPrincipal:setText("Escolher");
    obj.ProfissaoPrincipal:setFontSize(28);
    lfm_setPropAsString(obj.ProfissaoPrincipal, "fontStyle", "bold");
    obj.ProfissaoPrincipal:setFontColor("white");
    obj.ProfissaoPrincipal:setAutoSize(true);
    obj.ProfissaoPrincipal:setHorzTextAlign("center");

    obj.ComboProfissaoPrincipal = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.ComboProfissaoPrincipal:setParent(obj.tab2);
    obj.ComboProfissaoPrincipal:setName("ComboProfissaoPrincipal");
    obj.ComboProfissaoPrincipal:setLeft(170);
    obj.ComboProfissaoPrincipal:setTop(5);
    obj.ComboProfissaoPrincipal:setWidth(250);
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

    obj.FotoProfissaoPrincipal = GUI.fromHandle(_obj_newObject("image"));
    obj.FotoProfissaoPrincipal:setParent(obj.LayoutProfissaoPrincipal);
    obj.FotoProfissaoPrincipal:setName("FotoProfissaoPrincipal");
    obj.FotoProfissaoPrincipal:setLeft(118);
    obj.FotoProfissaoPrincipal:setTop(50);
    obj.FotoProfissaoPrincipal:setWidth(350);
    obj.FotoProfissaoPrincipal:setHeight(140);
    obj.FotoProfissaoPrincipal:setStyle("autoFit");
    obj.FotoProfissaoPrincipal.animate = true;

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.LayoutProfissaoPrincipal);
    obj.edit10:setLeft(205);
    obj.edit10:setTop(203);
    obj.edit10:setWidth(40);
    obj.edit10:setHeight(30);
    obj.edit10:setText("Tier:");
    lfm_setPropAsString(obj.edit10, "fontStyle", "bold");
    obj.edit10:setFontColor("white");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setReadOnly(true);
    obj.edit10:setTransparent(true);
    obj.edit10:setName("edit10");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.LayoutProfissaoPrincipal);
    obj.rectangle37:setLeft(245);
    obj.rectangle37:setTop(211);
    obj.rectangle37:setWidth(27);
    obj.rectangle37:setHeight(15);
    obj.rectangle37:setColor("white");
    obj.rectangle37:setXradius(7);
    obj.rectangle37:setYradius(7);
    obj.rectangle37:setCornerType("round");
    obj.rectangle37:setName("rectangle37");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.LayoutProfissaoPrincipal);
    obj.edit11:setLeft(245);
    obj.edit11:setTop(211);
    obj.edit11:setWidth(27);
    obj.edit11:setHeight(15);
    obj.edit11:setFontColor("black");
    obj.edit11:setFontSize(12);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setTransparent(true);
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.LayoutProfissaoPrincipal);
    obj.edit12:setLeft(285);
    obj.edit12:setTop(203);
    obj.edit12:setWidth(40);
    obj.edit12:setHeight(30);
    obj.edit12:setText("%Xp:");
    lfm_setPropAsString(obj.edit12, "fontStyle", "bold");
    obj.edit12:setFontColor("white");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setReadOnly(true);
    obj.edit12:setTransparent(true);
    obj.edit12:setName("edit12");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.LayoutProfissaoPrincipal);
    obj.rectangle38:setLeft(325);
    obj.rectangle38:setTop(211);
    obj.rectangle38:setWidth(56);
    obj.rectangle38:setHeight(15);
    obj.rectangle38:setColor("white");
    obj.rectangle38:setXradius(7);
    obj.rectangle38:setYradius(7);
    obj.rectangle38:setCornerType("round");
    obj.rectangle38:setName("rectangle38");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.LayoutProfissaoPrincipal);
    obj.label15:setLeft(325);
    obj.label15:setTop(202);
    obj.label15:setWidth(56);
    obj.label15:setHeight(30);
    obj.label15:setText("/");
    obj.label15:setFontColor("black");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.LayoutProfissaoPrincipal);
    obj.edit13:setLeft(325);
    obj.edit13:setTop(211);
    obj.edit13:setWidth(28);
    obj.edit13:setHeight(15);
    obj.edit13:setFontColor("black");
    obj.edit13:setFontSize(12);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setTransparent(true);
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.LayoutProfissaoPrincipal);
    obj.edit14:setLeft(352);
    obj.edit14:setTop(211);
    obj.edit14:setWidth(28);
    obj.edit14:setHeight(15);
    obj.edit14:setFontColor("black");
    obj.edit14:setFontSize(12);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setTransparent(true);
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.LayoutProfissaoPrincipal);
    obj.edit15:setLeft(25);
    obj.edit15:setTop(233);
    obj.edit15:setWidth(102);
    obj.edit15:setHeight(30);
    obj.edit15:setText("Expecialização:");
    lfm_setPropAsString(obj.edit15, "fontStyle", "bold");
    obj.edit15:setFontColor("white");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setReadOnly(true);
    obj.edit15:setTransparent(true);
    obj.edit15:setName("edit15");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.LayoutProfissaoPrincipal);
    obj.rectangle39:setLeft(129);
    obj.rectangle39:setTop(239);
    obj.rectangle39:setWidth(143);
    obj.rectangle39:setHeight(17);
    obj.rectangle39:setColor("white");
    obj.rectangle39:setXradius(7);
    obj.rectangle39:setYradius(7);
    obj.rectangle39:setCornerType("round");
    obj.rectangle39:setName("rectangle39");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.LayoutProfissaoPrincipal);
    obj.edit16:setLeft(129);
    obj.edit16:setTop(239);
    obj.edit16:setWidth(143);
    obj.edit16:setHeight(19);
    obj.edit16:setFontColor("black");
    obj.edit16:setFontSize(12);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setTransparent(true);
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.LayoutProfissaoPrincipal);
    obj.edit17:setLeft(285);
    obj.edit17:setTop(233);
    obj.edit17:setWidth(70);
    obj.edit17:setHeight(30);
    obj.edit17:setText("Dominio:");
    lfm_setPropAsString(obj.edit17, "fontStyle", "bold");
    obj.edit17:setFontColor("white");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setReadOnly(true);
    obj.edit17:setTransparent(true);
    obj.edit17:setName("edit17");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.LayoutProfissaoPrincipal);
    obj.rectangle40:setLeft(355);
    obj.rectangle40:setTop(239);
    obj.rectangle40:setWidth(160);
    obj.rectangle40:setHeight(17);
    obj.rectangle40:setColor("white");
    obj.rectangle40:setXradius(7);
    obj.rectangle40:setYradius(7);
    obj.rectangle40:setCornerType("round");
    obj.rectangle40:setName("rectangle40");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.LayoutProfissaoPrincipal);
    obj.edit18:setLeft(355);
    obj.edit18:setTop(239);
    obj.edit18:setWidth(160);
    obj.edit18:setHeight(19);
    obj.edit18:setFontColor("black");
    obj.edit18:setFontSize(12);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setTransparent(true);
    obj.edit18:setName("edit18");

    obj.DescricaoProfissaoPrincipal = GUI.fromHandle(_obj_newObject("label"));
    obj.DescricaoProfissaoPrincipal:setParent(obj.LayoutProfissaoPrincipal);
    obj.DescricaoProfissaoPrincipal:setName("DescricaoProfissaoPrincipal");
    obj.DescricaoProfissaoPrincipal:setLeft(12);
    obj.DescricaoProfissaoPrincipal:setTop(276);
    obj.DescricaoProfissaoPrincipal:setWidth(592);
    obj.DescricaoProfissaoPrincipal:setHeight(300);
    obj.DescricaoProfissaoPrincipal:setText("                                                  Descrição da profissão escolhida.");
    obj.DescricaoProfissaoPrincipal:setFontColor("white");
    obj.DescricaoProfissaoPrincipal:setTextTrimming("character");
    obj.DescricaoProfissaoPrincipal:setWordWrap(true);
    obj.DescricaoProfissaoPrincipal:setVertTextAlign("leading");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.LayoutProfissaoPrincipal);
    obj.label16:setLeft(12);
    obj.label16:setTop(270);
    obj.label16:setWidth(150);
    obj.label16:setHeight(30);
    obj.label16:setText("Descrição Proficional:");
    lfm_setPropAsString(obj.label16, "fontStyle", "bold");
    obj.label16:setFontColor("white");
    obj.label16:setName("label16");

    obj.ExpecializacaoPrincipal = GUI.fromHandle(_obj_newObject("label"));
    obj.ExpecializacaoPrincipal:setParent(obj.LayoutProfissaoPrincipal);
    obj.ExpecializacaoPrincipal:setName("ExpecializacaoPrincipal");
    obj.ExpecializacaoPrincipal:setLeft(12);
    obj.ExpecializacaoPrincipal:setTop(395);
    obj.ExpecializacaoPrincipal:setWidth(588);
    obj.ExpecializacaoPrincipal:setHeight(300);
    obj.ExpecializacaoPrincipal:setFontColor("white");
    obj.ExpecializacaoPrincipal:setTextTrimming("character");
    obj.ExpecializacaoPrincipal:setWordWrap(true);
    obj.ExpecializacaoPrincipal:setVertTextAlign("leading");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.LayoutProfissaoPrincipal);
    obj.label17:setLeft(12);
    obj.label17:setTop(389);
    obj.label17:setWidth(150);
    obj.label17:setHeight(30);
    obj.label17:setText("Especializações:");
    lfm_setPropAsString(obj.label17, "fontStyle", "bold");
    obj.label17:setFontColor("white");
    obj.label17:setName("label17");

    obj.DominioPrincipal = GUI.fromHandle(_obj_newObject("label"));
    obj.DominioPrincipal:setParent(obj.LayoutProfissaoPrincipal);
    obj.DominioPrincipal:setName("DominioPrincipal");
    obj.DominioPrincipal:setLeft(12);
    obj.DominioPrincipal:setTop(441);
    obj.DominioPrincipal:setWidth(592);
    obj.DominioPrincipal:setHeight(300);
    obj.DominioPrincipal:setFontColor("white");
    obj.DominioPrincipal:setTextTrimming("character");
    obj.DominioPrincipal:setWordWrap(true);
    obj.DominioPrincipal:setVertTextAlign("leading");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.LayoutProfissaoPrincipal);
    obj.label18:setLeft(12);
    obj.label18:setTop(435);
    obj.label18:setWidth(150);
    obj.label18:setHeight(30);
    obj.label18:setText("Dominio:");
    lfm_setPropAsString(obj.label18, "fontStyle", "bold");
    obj.label18:setFontColor("white");
    obj.label18:setName("label18");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl2);
    obj.tab3:setTitle("Habilidades Inicias");
    obj.tab3:setName("tab3");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.tab3);
    obj.richEdit1:setAlign("client");
    obj.richEdit1.backgroundColor = "black";
    obj.richEdit1.defaultFontColor = "white";
    obj.richEdit1:setField("txt");
    obj.richEdit1.animateImages = true;
    obj.richEdit1:setName("richEdit1");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl2);
    obj.tab4:setTitle("Habilidades de Especialidade");
    obj.tab4:setName("tab4");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.tab4);
    obj.richEdit2:setAlign("client");
    obj.richEdit2.backgroundColor = "black";
    obj.richEdit2.defaultFontColor = "white";
    obj.richEdit2:setField("txt");
    obj.richEdit2.animateImages = true;
    obj.richEdit2:setName("richEdit2");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl2);
    obj.tab5:setTitle("Habilidades de Dominio");
    obj.tab5:setName("tab5");

    obj.richEdit3 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.tab5);
    obj.richEdit3:setAlign("client");
    obj.richEdit3.backgroundColor = "black";
    obj.richEdit3.defaultFontColor = "white";
    obj.richEdit3:setField("txt");
    obj.richEdit3.animateImages = true;
    obj.richEdit3:setName("richEdit3");

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
    obj.rectangle41:setColor("navajowhite");
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

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl3);
    obj.tab6:setTitle("Informações Profissionais");
    obj.tab6:setName("tab6");

    obj.ProfissaoSecundaria = GUI.fromHandle(_obj_newObject("label"));
    obj.ProfissaoSecundaria:setParent(obj.tab6);
    obj.ProfissaoSecundaria:setName("ProfissaoSecundaria");
    obj.ProfissaoSecundaria:setLeft(170);
    obj.ProfissaoSecundaria:setTop(5);
    obj.ProfissaoSecundaria:setWidth(250);
    obj.ProfissaoSecundaria:setHeight(35);
    obj.ProfissaoSecundaria:setText("Escolher");
    obj.ProfissaoSecundaria:setFontSize(28);
    lfm_setPropAsString(obj.ProfissaoSecundaria, "fontStyle", "bold");
    obj.ProfissaoSecundaria:setFontColor("white");
    obj.ProfissaoSecundaria:setAutoSize(true);
    obj.ProfissaoSecundaria:setHorzTextAlign("center");

    obj.ComboProfissaoSecundaria = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.ComboProfissaoSecundaria:setParent(obj.tab6);
    obj.ComboProfissaoSecundaria:setName("ComboProfissaoSecundaria");
    obj.ComboProfissaoSecundaria:setLeft(170);
    obj.ComboProfissaoSecundaria:setTop(5);
    obj.ComboProfissaoSecundaria:setWidth(250);
    obj.ComboProfissaoSecundaria:setHeight(35);
    obj.ComboProfissaoSecundaria:setItems(Profissoes);
    obj.ComboProfissaoSecundaria:setValue("Profissoes");
    obj.ComboProfissaoSecundaria:setHorzTextAlign("center");
    lfm_setPropAsString(obj.ComboProfissaoSecundaria, "fontStyle", "bold");
    obj.ComboProfissaoSecundaria:setFontSize(16);
    obj.ComboProfissaoSecundaria:setTransparent(true);
    obj.ComboProfissaoSecundaria:setOpacity(0);

    obj.LayoutProfissaoSecundaria = GUI.fromHandle(_obj_newObject("layout"));
    obj.LayoutProfissaoSecundaria:setParent(obj.tab6);
    obj.LayoutProfissaoSecundaria:setName("LayoutProfissaoSecundaria");
    obj.LayoutProfissaoSecundaria:setWidth(5000);
    obj.LayoutProfissaoSecundaria:setHeight(1800);
    obj.LayoutProfissaoSecundaria:setVisible(false);

    obj.FotoProfissaoSecundaria = GUI.fromHandle(_obj_newObject("image"));
    obj.FotoProfissaoSecundaria:setParent(obj.LayoutProfissaoSecundaria);
    obj.FotoProfissaoSecundaria:setName("FotoProfissaoSecundaria");
    obj.FotoProfissaoSecundaria:setLeft(118);
    obj.FotoProfissaoSecundaria:setTop(50);
    obj.FotoProfissaoSecundaria:setWidth(350);
    obj.FotoProfissaoSecundaria:setHeight(140);
    obj.FotoProfissaoSecundaria:setStyle("autoFit");
    obj.FotoProfissaoSecundaria.animate = true;

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.LayoutProfissaoSecundaria);
    obj.edit19:setLeft(205);
    obj.edit19:setTop(203);
    obj.edit19:setWidth(40);
    obj.edit19:setHeight(30);
    obj.edit19:setText("Tier:");
    lfm_setPropAsString(obj.edit19, "fontStyle", "bold");
    obj.edit19:setFontColor("white");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setReadOnly(true);
    obj.edit19:setTransparent(true);
    obj.edit19:setName("edit19");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.LayoutProfissaoSecundaria);
    obj.rectangle43:setLeft(245);
    obj.rectangle43:setTop(211);
    obj.rectangle43:setWidth(27);
    obj.rectangle43:setHeight(15);
    obj.rectangle43:setColor("white");
    obj.rectangle43:setXradius(7);
    obj.rectangle43:setYradius(7);
    obj.rectangle43:setCornerType("round");
    obj.rectangle43:setName("rectangle43");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.LayoutProfissaoSecundaria);
    obj.edit20:setLeft(245);
    obj.edit20:setTop(211);
    obj.edit20:setWidth(27);
    obj.edit20:setHeight(15);
    obj.edit20:setFontColor("black");
    obj.edit20:setFontSize(12);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setTransparent(true);
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.LayoutProfissaoSecundaria);
    obj.edit21:setLeft(285);
    obj.edit21:setTop(203);
    obj.edit21:setWidth(40);
    obj.edit21:setHeight(30);
    obj.edit21:setText("%Xp:");
    lfm_setPropAsString(obj.edit21, "fontStyle", "bold");
    obj.edit21:setFontColor("white");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setReadOnly(true);
    obj.edit21:setTransparent(true);
    obj.edit21:setName("edit21");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.LayoutProfissaoSecundaria);
    obj.rectangle44:setLeft(325);
    obj.rectangle44:setTop(211);
    obj.rectangle44:setWidth(56);
    obj.rectangle44:setHeight(15);
    obj.rectangle44:setColor("white");
    obj.rectangle44:setXradius(7);
    obj.rectangle44:setYradius(7);
    obj.rectangle44:setCornerType("round");
    obj.rectangle44:setName("rectangle44");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.LayoutProfissaoSecundaria);
    obj.label19:setLeft(325);
    obj.label19:setTop(202);
    obj.label19:setWidth(56);
    obj.label19:setHeight(30);
    obj.label19:setText("/");
    obj.label19:setFontColor("black");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.LayoutProfissaoSecundaria);
    obj.edit22:setLeft(325);
    obj.edit22:setTop(211);
    obj.edit22:setWidth(28);
    obj.edit22:setHeight(15);
    obj.edit22:setFontColor("black");
    obj.edit22:setFontSize(12);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setTransparent(true);
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.LayoutProfissaoSecundaria);
    obj.edit23:setLeft(352);
    obj.edit23:setTop(211);
    obj.edit23:setWidth(28);
    obj.edit23:setHeight(15);
    obj.edit23:setFontColor("black");
    obj.edit23:setFontSize(12);
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setTransparent(true);
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.LayoutProfissaoSecundaria);
    obj.edit24:setLeft(25);
    obj.edit24:setTop(233);
    obj.edit24:setWidth(102);
    obj.edit24:setHeight(30);
    obj.edit24:setText("Expecialização:");
    lfm_setPropAsString(obj.edit24, "fontStyle", "bold");
    obj.edit24:setFontColor("white");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setReadOnly(true);
    obj.edit24:setTransparent(true);
    obj.edit24:setName("edit24");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.LayoutProfissaoSecundaria);
    obj.rectangle45:setLeft(129);
    obj.rectangle45:setTop(239);
    obj.rectangle45:setWidth(143);
    obj.rectangle45:setHeight(17);
    obj.rectangle45:setColor("white");
    obj.rectangle45:setXradius(7);
    obj.rectangle45:setYradius(7);
    obj.rectangle45:setCornerType("round");
    obj.rectangle45:setName("rectangle45");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.LayoutProfissaoSecundaria);
    obj.edit25:setLeft(129);
    obj.edit25:setTop(239);
    obj.edit25:setWidth(143);
    obj.edit25:setHeight(19);
    obj.edit25:setFontColor("black");
    obj.edit25:setFontSize(12);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setTransparent(true);
    obj.edit25:setName("edit25");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.LayoutProfissaoSecundaria);
    obj.edit26:setLeft(285);
    obj.edit26:setTop(233);
    obj.edit26:setWidth(70);
    obj.edit26:setHeight(30);
    obj.edit26:setText("Dominio:");
    lfm_setPropAsString(obj.edit26, "fontStyle", "bold");
    obj.edit26:setFontColor("white");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setReadOnly(true);
    obj.edit26:setTransparent(true);
    obj.edit26:setName("edit26");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.LayoutProfissaoSecundaria);
    obj.rectangle46:setLeft(355);
    obj.rectangle46:setTop(239);
    obj.rectangle46:setWidth(160);
    obj.rectangle46:setHeight(17);
    obj.rectangle46:setColor("white");
    obj.rectangle46:setXradius(7);
    obj.rectangle46:setYradius(7);
    obj.rectangle46:setCornerType("round");
    obj.rectangle46:setName("rectangle46");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.LayoutProfissaoSecundaria);
    obj.edit27:setLeft(355);
    obj.edit27:setTop(239);
    obj.edit27:setWidth(160);
    obj.edit27:setHeight(19);
    obj.edit27:setFontColor("black");
    obj.edit27:setFontSize(12);
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setTransparent(true);
    obj.edit27:setName("edit27");

    obj.DescricaoProfissaoSecundaria = GUI.fromHandle(_obj_newObject("label"));
    obj.DescricaoProfissaoSecundaria:setParent(obj.LayoutProfissaoSecundaria);
    obj.DescricaoProfissaoSecundaria:setName("DescricaoProfissaoSecundaria");
    obj.DescricaoProfissaoSecundaria:setLeft(12);
    obj.DescricaoProfissaoSecundaria:setTop(276);
    obj.DescricaoProfissaoSecundaria:setWidth(592);
    obj.DescricaoProfissaoSecundaria:setHeight(300);
    obj.DescricaoProfissaoSecundaria:setText("                                                  Descrição da profissão escolhida.");
    obj.DescricaoProfissaoSecundaria:setFontColor("white");
    obj.DescricaoProfissaoSecundaria:setTextTrimming("character");
    obj.DescricaoProfissaoSecundaria:setWordWrap(true);
    obj.DescricaoProfissaoSecundaria:setVertTextAlign("leading");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.LayoutProfissaoSecundaria);
    obj.label20:setLeft(12);
    obj.label20:setTop(270);
    obj.label20:setWidth(150);
    obj.label20:setHeight(30);
    obj.label20:setText("Descrição Proficional:");
    lfm_setPropAsString(obj.label20, "fontStyle", "bold");
    obj.label20:setFontColor("white");
    obj.label20:setName("label20");

    obj.ExpecializacaoSecundaria = GUI.fromHandle(_obj_newObject("label"));
    obj.ExpecializacaoSecundaria:setParent(obj.LayoutProfissaoSecundaria);
    obj.ExpecializacaoSecundaria:setName("ExpecializacaoSecundaria");
    obj.ExpecializacaoSecundaria:setLeft(12);
    obj.ExpecializacaoSecundaria:setTop(395);
    obj.ExpecializacaoSecundaria:setWidth(588);
    obj.ExpecializacaoSecundaria:setHeight(300);
    obj.ExpecializacaoSecundaria:setFontColor("white");
    obj.ExpecializacaoSecundaria:setTextTrimming("character");
    obj.ExpecializacaoSecundaria:setWordWrap(true);
    obj.ExpecializacaoSecundaria:setVertTextAlign("leading");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.LayoutProfissaoSecundaria);
    obj.label21:setLeft(12);
    obj.label21:setTop(389);
    obj.label21:setWidth(150);
    obj.label21:setHeight(30);
    obj.label21:setText("Especializações:");
    lfm_setPropAsString(obj.label21, "fontStyle", "bold");
    obj.label21:setFontColor("white");
    obj.label21:setName("label21");

    obj.DominioSecundaria = GUI.fromHandle(_obj_newObject("label"));
    obj.DominioSecundaria:setParent(obj.LayoutProfissaoSecundaria);
    obj.DominioSecundaria:setName("DominioSecundaria");
    obj.DominioSecundaria:setLeft(12);
    obj.DominioSecundaria:setTop(441);
    obj.DominioSecundaria:setWidth(592);
    obj.DominioSecundaria:setHeight(300);
    obj.DominioSecundaria:setFontColor("white");
    obj.DominioSecundaria:setTextTrimming("character");
    obj.DominioSecundaria:setWordWrap(true);
    obj.DominioSecundaria:setVertTextAlign("leading");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.LayoutProfissaoSecundaria);
    obj.label22:setLeft(12);
    obj.label22:setTop(435);
    obj.label22:setWidth(150);
    obj.label22:setHeight(30);
    obj.label22:setText("Dominio:");
    lfm_setPropAsString(obj.label22, "fontStyle", "bold");
    obj.label22:setFontColor("white");
    obj.label22:setName("label22");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl3);
    obj.tab7:setTitle("Habilidades Inicias");
    obj.tab7:setName("tab7");

    obj.richEdit4 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit4:setParent(obj.tab7);
    obj.richEdit4:setAlign("client");
    obj.richEdit4.backgroundColor = "black";
    obj.richEdit4.defaultFontColor = "white";
    obj.richEdit4:setField("txt");
    obj.richEdit4.animateImages = true;
    obj.richEdit4:setName("richEdit4");

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl3);
    obj.tab8:setTitle("Habilidades de Especialidade");
    obj.tab8:setName("tab8");

    obj.richEdit5 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit5:setParent(obj.tab8);
    obj.richEdit5:setAlign("client");
    obj.richEdit5.backgroundColor = "black";
    obj.richEdit5.defaultFontColor = "white";
    obj.richEdit5:setField("txt");
    obj.richEdit5.animateImages = true;
    obj.richEdit5:setName("richEdit5");

    obj.tab9 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl3);
    obj.tab9:setTitle("Habilidades de Dominio");
    obj.tab9:setName("tab9");

    obj.richEdit6 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit6:setParent(obj.tab9);
    obj.richEdit6:setAlign("client");
    obj.richEdit6.backgroundColor = "black";
    obj.richEdit6.defaultFontColor = "white";
    obj.richEdit6:setField("txt");
    obj.richEdit6.animateImages = true;
    obj.richEdit6:setName("richEdit6");

    obj.AbaRaca = GUI.fromHandle(_obj_newObject("layout"));
    obj.AbaRaca:setParent(obj.layout1);
    obj.AbaRaca:setName("AbaRaca");
    obj.AbaRaca:setLeft(5);
    obj.AbaRaca:setTop(10);
    obj.AbaRaca:setWidth(5000);
    obj.AbaRaca:setHeight(1800);
    obj.AbaRaca:setVisible(true);

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.AbaRaca);
    obj.rectangle47:setLeft(665);
    obj.rectangle47:setTop(22);
    obj.rectangle47:setWidth(608);
    obj.rectangle47:setHeight(525);
    obj.rectangle47:setColor("navajowhite");
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

    obj.tab10 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab10:setParent(obj.tabControl4);
    obj.tab10:setTitle("Caracteristicas Raciais");
    obj.tab10:setName("tab10");

    obj.Raca = GUI.fromHandle(_obj_newObject("label"));
    obj.Raca:setParent(obj.tab10);
    obj.Raca:setName("Raca");
    obj.Raca:setLeft(5);
    obj.Raca:setTop(5);
    obj.Raca:setWidth(599);
    obj.Raca:setHeight(35);
    obj.Raca:setText("Escolher");
    obj.Raca:setFontSize(28);
    lfm_setPropAsString(obj.Raca, "fontStyle", "bold");
    obj.Raca:setFontColor("white");
    obj.Raca:setAutoSize(true);
    obj.Raca:setHorzTextAlign("center");

    obj.ComboRaca = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.ComboRaca:setParent(obj.tab10);
    obj.ComboRaca:setName("ComboRaca");
    obj.ComboRaca:setLeft(160);
    obj.ComboRaca:setTop(5);
    obj.ComboRaca:setWidth(250);
    obj.ComboRaca:setHeight(35);
    obj.ComboRaca:setItems(Racas);
    obj.ComboRaca:setValue("Racas");
    obj.ComboRaca:setHorzTextAlign("center");
    lfm_setPropAsString(obj.ComboRaca, "fontStyle", "bold");
    obj.ComboRaca:setFontSize(16);
    obj.ComboRaca:setTransparent(true);
    obj.ComboRaca:setOpacity(0);

    obj.LayoutRaca = GUI.fromHandle(_obj_newObject("layout"));
    obj.LayoutRaca:setParent(obj.tab10);
    obj.LayoutRaca:setName("LayoutRaca");
    obj.LayoutRaca:setWidth(5000);
    obj.LayoutRaca:setHeight(1800);
    obj.LayoutRaca:setVisible(false);

    obj.FotoRaca = GUI.fromHandle(_obj_newObject("image"));
    obj.FotoRaca:setParent(obj.LayoutRaca);
    obj.FotoRaca:setName("FotoRaca");
    obj.FotoRaca:setLeft(200);
    obj.FotoRaca:setTop(60);
    obj.FotoRaca:setWidth(350);
    obj.FotoRaca:setHeight(140);
    obj.FotoRaca:setStyle("autoFit");
    obj.FotoRaca.animate = true;
    obj.FotoRaca:setSRC("https://blob.firecast.com.br/blobs/LBESRIOB_3383437/usopp.gif");

    obj.DescricaoRaca = GUI.fromHandle(_obj_newObject("label"));
    obj.DescricaoRaca:setParent(obj.LayoutRaca);
    obj.DescricaoRaca:setName("DescricaoRaca");
    obj.DescricaoRaca:setLeft(12);
    obj.DescricaoRaca:setTop(276);
    obj.DescricaoRaca:setWidth(592);
    obj.DescricaoRaca:setHeight(300);
    obj.DescricaoRaca:setText("                                                  Descrição da profissão escolhida.");
    obj.DescricaoRaca:setFontColor("white");
    obj.DescricaoRaca:setTextTrimming("character");
    obj.DescricaoRaca:setWordWrap(true);
    obj.DescricaoRaca:setVertTextAlign("leading");

    obj.BonusRaca = GUI.fromHandle(_obj_newObject("label"));
    obj.BonusRaca:setParent(obj.LayoutRaca);
    obj.BonusRaca:setName("BonusRaca");
    obj.BonusRaca:setLeft(12);
    obj.BonusRaca:setTop(336);
    obj.BonusRaca:setWidth(592);
    obj.BonusRaca:setHeight(300);
    obj.BonusRaca:setText("                                                  Descrição da profissão escolhida.");
    obj.BonusRaca:setFontColor("white");
    obj.BonusRaca:setTextTrimming("character");
    obj.BonusRaca:setWordWrap(true);
    obj.BonusRaca:setVertTextAlign("leading");

    obj.tab11 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab11:setParent(obj.tabControl4);
    obj.tab11:setTitle("Habilidades Raciais");
    obj.tab11:setName("tab11");

    obj.richEdit7 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit7:setParent(obj.tab11);
    obj.richEdit7:setAlign("client");
    obj.richEdit7.backgroundColor = "black";
    obj.richEdit7.defaultFontColor = "white";
    obj.richEdit7:setField("txt");
    obj.richEdit7.animateImages = true;
    obj.richEdit7:setName("richEdit7");

    obj._e_event0 = obj.Nivel:addEventListener("onChange",
        function ()
            AtualizarExp()
        end);

    obj._e_event1 = obj.listaOrganizacoes:addEventListener("onChange",
        function ()
            MudarBandeira()
        end);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (event)
            self.AbaProfissaoPrincipal.visible = true; self.AbaProfissaoSecundaria.visible = false; self.AbaRaca.visible = false
        end);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (event)
            self.AbaProfissaoSecundaria.visible = true; self.AbaProfissaoPrincipal.visible = false; self.AbaRaca.visible = false
        end);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (event)
            self.AbaRaca.visible = true; self.AbaProfissaoPrincipal.visible = false; self.AbaProfissaoSecundaria.visible = false;
        end);

    obj._e_event5 = obj.button4:addEventListener("onClick",
        function (event)
            showMessage('olá mundo!');
        end);

    obj._e_event6 = obj.button5:addEventListener("onClick",
        function (event)
            showMessage('olá mundo!');
        end);

    obj._e_event7 = obj.ComboProfissaoPrincipal:addEventListener("onChange",
        function ()
            MudarProfissao1()
        end);

    obj._e_event8 = obj.ComboProfissaoSecundaria:addEventListener("onChange",
        function ()
            MudarProfissao2()
        end);

    obj._e_event9 = obj.ComboRaca:addEventListener("onChange",
        function ()
            MudarRaca()
        end);

    function obj:_releaseEvents()
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
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.Exp ~= nil then self.Exp:destroy(); self.Exp = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.listaOrganizacoes ~= nil then self.listaOrganizacoes:destroy(); self.listaOrganizacoes = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.ComboRaca ~= nil then self.ComboRaca:destroy(); self.ComboRaca = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.Nivel ~= nil then self.Nivel:destroy(); self.Nivel = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.richEdit5 ~= nil then self.richEdit5:destroy(); self.richEdit5 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.ImagemProfissaoPrincipal ~= nil then self.ImagemProfissaoPrincipal:destroy(); self.ImagemProfissaoPrincipal = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.ImagemProfissaoSecundaria ~= nil then self.ImagemProfissaoSecundaria:destroy(); self.ImagemProfissaoSecundaria = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.NomeRaca ~= nil then self.NomeRaca:destroy(); self.NomeRaca = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.tab11 ~= nil then self.tab11:destroy(); self.tab11 = nil; end;
        if self.ImagemRaca ~= nil then self.ImagemRaca:destroy(); self.ImagemRaca = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.NomeProfissaoSecundaria ~= nil then self.NomeProfissaoSecundaria:destroy(); self.NomeProfissaoSecundaria = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.ProfissaoPrincipal ~= nil then self.ProfissaoPrincipal:destroy(); self.ProfissaoPrincipal = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.LayoutRaca ~= nil then self.LayoutRaca:destroy(); self.LayoutRaca = nil; end;
        if self.ExpecializacaoPrincipal ~= nil then self.ExpecializacaoPrincipal:destroy(); self.ExpecializacaoPrincipal = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.LayoutProfissaoPrincipal ~= nil then self.LayoutProfissaoPrincipal:destroy(); self.LayoutProfissaoPrincipal = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.ImagemBandeira ~= nil then self.ImagemBandeira:destroy(); self.ImagemBandeira = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.DescricaoProfissaoPrincipal ~= nil then self.DescricaoProfissaoPrincipal:destroy(); self.DescricaoProfissaoPrincipal = nil; end;
        if self.tabControl4 ~= nil then self.tabControl4:destroy(); self.tabControl4 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.AbaRaca ~= nil then self.AbaRaca:destroy(); self.AbaRaca = nil; end;
        if self.AbaProfissaoPrincipal ~= nil then self.AbaProfissaoPrincipal:destroy(); self.AbaProfissaoPrincipal = nil; end;
        if self.richEdit3 ~= nil then self.richEdit3:destroy(); self.richEdit3 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.tabControl3 ~= nil then self.tabControl3:destroy(); self.tabControl3 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.FotoProfissaoPrincipal ~= nil then self.FotoProfissaoPrincipal:destroy(); self.FotoProfissaoPrincipal = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.FotoProfissaoSecundaria ~= nil then self.FotoProfissaoSecundaria:destroy(); self.FotoProfissaoSecundaria = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.DominioPrincipal ~= nil then self.DominioPrincipal:destroy(); self.DominioPrincipal = nil; end;
        if self.richEdit6 ~= nil then self.richEdit6:destroy(); self.richEdit6 = nil; end;
        if self.FotoRaca ~= nil then self.FotoRaca:destroy(); self.FotoRaca = nil; end;
        if self.BonusRaca ~= nil then self.BonusRaca:destroy(); self.BonusRaca = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.DominioSecundaria ~= nil then self.DominioSecundaria:destroy(); self.DominioSecundaria = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.ProfissaoSecundaria ~= nil then self.ProfissaoSecundaria:destroy(); self.ProfissaoSecundaria = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.richEdit4 ~= nil then self.richEdit4:destroy(); self.richEdit4 = nil; end;
        if self.AbaProfissaoSecundaria ~= nil then self.AbaProfissaoSecundaria:destroy(); self.AbaProfissaoSecundaria = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.tab10 ~= nil then self.tab10:destroy(); self.tab10 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.DescricaoRaca ~= nil then self.DescricaoRaca:destroy(); self.DescricaoRaca = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.ExpecializacaoSecundaria ~= nil then self.ExpecializacaoSecundaria:destroy(); self.ExpecializacaoSecundaria = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.ComboProfissaoSecundaria ~= nil then self.ComboProfissaoSecundaria:destroy(); self.ComboProfissaoSecundaria = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.DescricaoProfissaoSecundaria ~= nil then self.DescricaoProfissaoSecundaria:destroy(); self.DescricaoProfissaoSecundaria = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.tabControl2 ~= nil then self.tabControl2:destroy(); self.tabControl2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.NomeProfissaoPrincipal ~= nil then self.NomeProfissaoPrincipal:destroy(); self.NomeProfissaoPrincipal = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.ComboProfissaoPrincipal ~= nil then self.ComboProfissaoPrincipal:destroy(); self.ComboProfissaoPrincipal = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.LayoutProfissaoSecundaria ~= nil then self.LayoutProfissaoSecundaria:destroy(); self.LayoutProfissaoSecundaria = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.Raca ~= nil then self.Raca:destroy(); self.Raca = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.richEdit7 ~= nil then self.richEdit7:destroy(); self.richEdit7 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newRpgProd()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_RpgProd();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _RpgProd = {
    newEditor = newRpgProd, 
    new = newRpgProd, 
    name = "RpgProd", 
    dataType = "DATA_TYPE_AQUI", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "Brincadeiras Em Alto Mar", 
    description=""};

RpgProd = _RpgProd;
Firecast.registrarForm(_RpgProd);
Firecast.registrarDataType(_RpgProd);

return _RpgProd;
