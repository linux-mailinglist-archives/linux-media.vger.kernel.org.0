Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3821C6E41D5
	for <lists+linux-media@lfdr.de>; Mon, 17 Apr 2023 09:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbjDQH6h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Apr 2023 03:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbjDQH6M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Apr 2023 03:58:12 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2126.outbound.protection.outlook.com [40.107.113.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 999D83C10;
        Mon, 17 Apr 2023 00:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neSprO52gWlMnghetTNGbAPCoC9plsnrC4Z92wqqjR7O4KowGe6wBidXeAubA+5/LPZ6fzrK6T8+NXuIYaVMPLQUWEGajwVlB/XcuBzWinBazGD2FWFjg23+fqED0eEBotBp0Nlnr5qtdwFV5VAEUEKw9vtt6f7fclrEe+yW+iz7mYLdNEveOR5zf1GZpoxorDzJk362NeE7aw4q4QBm/khsFKQGnw5BRj3qo7+dRWZMvDtRgz90wYTexD2OPRV5W0aljTP7JnsOtGNgMLEQpwXfXgAdGV8OIXhVjnasm+xyUOq9lAIFdzBWhfgcokLCrXfm0dti5VR6vsLonDo3JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mouMRBqXiaJ52r6lIr6h0qYK5yiLTjPe+IzV/5+aQUo=;
 b=e33ZPKcQG1cC624uiFx0hswYaSaIymfdxCPIg5OxRkq6qK+8bwLDV6M1m5Cc0IrIhFyShFZsg2ioMs23nrG2LkabmKjILaK2kji2PGkYL67Xwou+z8LNWh93AgvEx4C+VAcx/TOgovgUkPyjlKwaQ5V3/w6nj9PqUUghH2tdO8hjevmvadv2fJr7MIUuIT7qYdT4NmAdw5wiM/EeiEbij7aXf+dFnb0r20q5lr4sOeQYaCJqpUaNXJ/iAKxQEpbD8IwZFnZPFS1Ky4zLhr5rpTgMY3OJNNQbtNL03LCOc4HCjBj6c+0kGyG7UGUdnJuUyN1XT3L+zlw3PCYayN7uUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mouMRBqXiaJ52r6lIr6h0qYK5yiLTjPe+IzV/5+aQUo=;
 b=uW0F5g133+xZJDNbfFNtjIrzKaUzc0ZbuDbCEF+UFjLOpth4ZY0EwvjHfdh1cVWNVIKIG2RwmkRBHNmIlP9+LXXkj5Uf53+nhe34eNWxSZszE5UeASxTRBS3sTiEKCZdu57PyCgRFjC/LaPrS3/pp3srZc+Xd77l9K7arWXrlWc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5892.jpnprd01.prod.outlook.com (2603:1096:604:b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 07:57:58 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%5]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 07:57:57 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     =?iso-8859-2?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Heiko Stuebner <heiko@sntech.de>,
        Eddie James <eajames@linux.ibm.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Robert Foss <rfoss@kernel.org>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Antti Palosaari <crope@iki.fi>,
        NXP Linux Team <linux-imx@nxp.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        =?iso-8859-2?Q?=A3ukasz_Stelmach?= <l.stelmach@samsung.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Moudy Ho <moudy.ho@mediatek.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Ming Qian <ming.qian@nxp.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Guenter Roeck <groeck@chromium.org>,
        "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Colin Ian King <colin.i.king@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Rory Liu <hellojacky0226@hotmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Maxime Ripard <mripard@kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-amlogic@lists.infradead.org" 
        <linux-amlogic@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Zhou Peng <eagle.zhou@nxp.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Carpenter <error27@gmail.com>, Sean Young <sean@mess.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Ettore Chimenti <ek5.chimenti@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Joel Stanley <joel@jms.id.au>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Qiheng Lin <linqiheng@huawei.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Yang Li <yang.lee@linux.alibaba.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Todor Tomov <todor.too@gmail.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
        Scott Chao <scott_chao@wistron.corp-partner.google.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        Andy Gross <agross@kernel.org>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Benoit Parrot <bparrot@ti.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Yong Deng <yong.deng@magewell.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        =?iso-8859-2?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: RE: [PATCH 000/117] media: Convert to platform remove callback
 returning void
Thread-Topic: [PATCH 000/117] media: Convert to platform remove callback
 returning void
Thread-Index: AQHZcPI9ssr1bMQIp0GJY0WwrtVw6q8vBzwAgAAT74CAAAZPoA==
Date:   Mon, 17 Apr 2023 07:57:57 +0000
Message-ID: <OS0PR01MB59221153A63F64BBAD3ED20D869C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230417060203.le3izz56wt73si6k@pengutronix.de>
 <20230417061928.GD28551@pendragon.ideasonboard.com>
 <20230417073049.2b5b35hpjrjcrlge@pengutronix.de>
In-Reply-To: <20230417073049.2b5b35hpjrjcrlge@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB5892:EE_
x-ms-office365-filtering-correlation-id: 1e971cb0-bcf7-4c7a-0e98-08db3f197550
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cTqgzF7G/UpuaqEllAJ12dE5zlw4f1cQXeUYerR8/W1fKClLO8MEwPdRVQJDHrZgp3qShfYj4qaK2HFV+i7ipIEnAsMeXk+67803Zn8SP8q+Mw3wrGu9o9vVl3tAwmDYcplUcKp0WJEm8vZMWYidb2Wn7mfTM6xI3X27o1r79YcMgf6JpFePYhMp0cza+hdOiMUYZnOogBf6l2jDClA/SvMCpfMSa8uGJlEq5Q0Pie/V5yrcY9cMHwCOHo4hufFqbcrulQu5ttRJc1RlAQSl/YWzrW+8ZVEVBWHRZ34YyFRFJnrcaKkB7HngoCne8XHYrdv+jvrx6duG1sWXYsDqzaSvQoGh+0srp/ul2AIUg/G/Rj/rcDQz9GVgKpR83WbbIYlzwx6QmgOW2yKeUOGdtRYe2bk0ft8PWCpwakFRTwJpIk18NPdD5CN2KWV6KQyVRu5LbzOQw2aqkNhV6UvuycUIKGLrGM1NbwrWMjQqPVZtNhkryYhB9YVQp/1kdwfkDmP4bnuCvfPaIGNAsyR6yxl2iiAtpWsaIgjbvgBdnnSIo5AIM1EvWclO2g6k2FdtBVT9qt0kU5dJ6x5JNddijxJ0jOZmiHlkvq18K/Pv8u2mlA9X+/tu2DzDPd4jisxG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199021)(7336002)(7276002)(7406005)(7366002)(7416002)(52536014)(5660300002)(86362001)(83380400001)(66574015)(53546011)(186003)(26005)(6506007)(9686003)(122000001)(38100700002)(38070700005)(8676002)(8936002)(33656002)(54906003)(110136005)(478600001)(71200400001)(7696005)(316002)(41300700001)(55016003)(76116006)(64756008)(66446008)(66476007)(66556008)(4326008)(66946007)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?RuPL71DTooOlSNxIti0kl3e2cf+TsZyTKT3S9F9WjG8ZmXlG1qIzWYQ9nS?=
 =?iso-8859-2?Q?nk9w/gvC6l0pjiJ1/FyUoQJF32405fnf2Bzq38czWWyAo5BpIMnBj64D4j?=
 =?iso-8859-2?Q?lbI0ksb+GQF5VpLalM7gof1/CHcdFkptbPJugklnwwnBDn0Kud/WljbzNm?=
 =?iso-8859-2?Q?muouyT7Ddwtpe7PJQWi87y+kbEl5yZUIlY33mPHaQIrxO+bmB6ltESAMtA?=
 =?iso-8859-2?Q?DF1Ct5XV1+0HH/BvW2TAMCizjPTXf8J82KU5A+EEHYVPaqB50eQEFiAfRb?=
 =?iso-8859-2?Q?rZPIVhbaBSnYl/ssdEFWKwzB6Ghch/4v9PaZ0RL5aG1QiXX18lZPyh1VZR?=
 =?iso-8859-2?Q?ci+DOFm0PD11GYU6ozi2xoSsU0AJ9sjADF6hXoJUVD+ncE6ko6vDjV+18T?=
 =?iso-8859-2?Q?2nX6zL4E1ASE6ejEyXUlVgAIzg8PtZ8AGS+JnhKY9+ax1m2qguHsCO8zOq?=
 =?iso-8859-2?Q?16Z6FqFbjMiN+SH9PYiyLKy1mod//pg0MBD2onmaonDuHzI4MjQz0D3MA1?=
 =?iso-8859-2?Q?bq78ud3hKNsV1IwznDXKQHQLSwJfvwo2gmHAThi2K4ku3CNh9QLwXI0+J3?=
 =?iso-8859-2?Q?pUNaVTPz9bGE6xnxsMGUYy/mthN4ytE3q6wA4MylGTNpiy5BhKl72EVqga?=
 =?iso-8859-2?Q?iMScyaLvLI1QK7QqNIwIBvesSBRcm1FGc8stHEn639XFsFvIuWJXk+udF+?=
 =?iso-8859-2?Q?VtEF3xzKX5Eg6TJAktitTtr1ljbpds5IIIoS6fP3qI6r9QyFGBczMoYVZ4?=
 =?iso-8859-2?Q?yBCxnr2Yy5XxqLBrENsI3oM9Cokgg/bM14N/zQvMloE6droab2dnBI+tOt?=
 =?iso-8859-2?Q?+sjtcPR7lr02YZ4RnUhoX/RUQFuZHQJNWoaeBEd5Qh8FvBo42Jjoz8YmCK?=
 =?iso-8859-2?Q?NFom8WQVe/yWJ3p5ojDefa2xK4m2CCydNCSzl9+LiMIvMFaWPY5MvNYpaO?=
 =?iso-8859-2?Q?Bqy9g5jI5ZbREgsKUcwLOaU5jniYmdROETrl0a5HIlonBwFLOivzrPX4VL?=
 =?iso-8859-2?Q?EHxai1D/HifkdEpXD5ci39XIEv+bbXHAq5WB6znhckUS9KQLhHMG5OHHl3?=
 =?iso-8859-2?Q?+9CPx0LNmP44k+VrbuhbXEh3qhCDQp6Iwh9wKHkJB+6KAFA+QjUIo04q4i?=
 =?iso-8859-2?Q?NnE1t5wBbaeZRXWFDz17jfinwUig7nig/uapuXE1IDggwa/RwV81Z4JDnC?=
 =?iso-8859-2?Q?pYvqGMhBqk6pcCgn7l0bTA4iNNaMcLubzPSVxPmJ24kicdaHWlvHLWdas1?=
 =?iso-8859-2?Q?+G4KdQ0n4ZbOxsDxfgRQFEovmf7q0p3EIfRKsSdlaLgvS5SfNy4H7qpy00?=
 =?iso-8859-2?Q?nryk9rkDT1xWpCKzrt1rY8/wlUOOxmj097P/71MPy3m1v1IQ/kGMw+TMV3?=
 =?iso-8859-2?Q?/Mb0KX2nPBexEazMsEF+ZZTkorz6/5V/JH1sHDpt0Ssf63Kmo7dqaD5dEx?=
 =?iso-8859-2?Q?xqu+KI/G5sR2RuE8VLFAmmq2JNrUDv3wmzTRHlUxeUd72JDipY2WCzTVgE?=
 =?iso-8859-2?Q?ud6anWawVlKGyE5pKrub2vD/15H4vEkuzYa0HDufnDES1gSx42iG0KECjX?=
 =?iso-8859-2?Q?vEIoh9juWCAu2lICQ+pXx3thzyPJ+hKqKR8rhNCGJTUWXqAR3sD6eJOW99?=
 =?iso-8859-2?Q?5Kr4baoDN8QMXqfH0tphRK+YG4VqVlF7c/?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e971cb0-bcf7-4c7a-0e98-08db3f197550
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2023 07:57:57.7458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7uj1dc8SnMcuGNnj0aFSU06DqjuCApPwDauXuiuOm2bfXWX+3PdE0ZilZ1RT2l0rNWpvBiWNwYzLygj+bvf8qWpPhmI0xHz22ET++jZTtnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5892
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Uwe,

> -----Original Message-----
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Sent: Monday, April 17, 2023 8:31 AM
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Heiko Stuebner <heiko@sntech.de>; Eddie James <eajames@linux.ibm.com>=
;
> Hans Verkuil <hverkuil@xs4all.nl>; Alim Akhtar <alim.akhtar@samsung.com>;
> Dmitry Osipenko <digetx@gmail.com>; linux-stm32@st-md-
> mailman.stormreply.com; Marek Szyprowski <m.szyprowski@samsung.com>; linu=
x-
> samsung-soc@vger.kernel.org; Robert Foss <rfoss@kernel.org>; Dafna
> Hirschfeld <dafna@fastmail.com>; Samuel Holland <samuel@sholland.org>; Ke=
vin
> Hilman <khilman@baylibre.com>; Michal Simek <michal.simek@xilinx.com>; An=
tti
> Palosaari <crope@iki.fi>; NXP Linux Team <linux-imx@nxp.com>; Jerome Brun=
et
> <jbrunet@baylibre.com>; linux-sunxi@lists.linux.dev; ye xingchen
> <ye.xingchen@zte.com.cn>; Sascha Hauer <s.hauer@pengutronix.de>; =A3ukasz
> Stelmach <l.stelmach@samsung.com>; Eugen Hristev
> <eugen.hristev@collabora.com>; Shuah Khan <skhan@linuxfoundation.org>; Hy=
un
> Kwon <hyun.kwon@xilinx.com>; Andrew Jeffery <andrew@aj.id.au>; Michael
> Tretter <m.tretter@pengutronix.de>; Moudy Ho <moudy.ho@mediatek.com>;
> kernel@pengutronix.de; Hans Verkuil <hverkuil-cisco@xs4all.nl>; Claudiu
> Beznea <claudiu.beznea@microchip.com>; Ming Qian <ming.qian@nxp.com>;
> Andrew-CT Chen <andrew-ct.chen@mediatek.com>; Alexandre Belloni
> <alexandre.belloni@bootlin.com>; Sylwester Nawrocki
> <s.nawrocki@samsung.com>; linux-aspeed@lists.ozlabs.org; Yunfei Dong
> <yunfei.dong@mediatek.com>; Lad, Prabhakar <prabhakar.csengg@gmail.com>;
> Thierry Reding <thierry.reding@gmail.com>; Guenter Roeck
> <groeck@chromium.org>; chrome-platform@lists.linux.dev; Jonathan Hunter
> <jonathanh@nvidia.com>; linux-rockchip@lists.infradead.org; Fabien Dessen=
ne
> <fabien.dessenne@foss.st.com>; Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar>; Alain Volmat <alain.volmat@foss.st.com>;
> Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>; Colin Ian King
> <colin.i.king@gmail.com>; linux-media@vger.kernel.org; Jacopo Mondi
> <jacopo@jmondi.org>; Rory Liu <hellojacky0226@hotmail.com>; Martin
> Blumenstingl <martin.blumenstingl@googlemail.com>; linux-arm-
> msm@vger.kernel.org; Sean Wang <sean.wang@mediatek.com>; Maxime Ripard
> <mripard@kernel.org>; Fabrizio Castro <fabrizio.castro.jz@renesas.com>;
> linux-amlogic@lists.infradead.org; linux-arm-kernel@lists.infradead.org;
> Neil Armstrong <neil.armstrong@linaro.org>; Zhou Peng <eagle.zhou@nxp.com=
>;
> Paul Kocialkowski <paul.kocialkowski@bootlin.com>; Maxime Coquelin
> <mcoquelin.stm32@gmail.com>; linux-mediatek@lists.infradead.org; Jacek
> Anaszewski <jacek.anaszewski@gmail.com>; Dan Carpenter <error27@gmail.com=
>;
> Sean Young <sean@mess.org>; Xavier Roumegue <xavier.roumegue@oss.nxp.com>=
;
> Ettore Chimenti <ek5.chimenti@gmail.com>; Vikash Garodia
> <quic_vgarodia@quicinc.com>; linux-tegra@vger.kernel.org; Eduardo Valenti=
n
> <edubezval@gmail.com>; Andrzej Hajda <andrzej.hajda@intel.com>; Fabio
> Estevam <festevam@gmail.com>; Jean-Christophe Trotin <jean-
> christophe.trotin@foss.st.com>; Stanimir Varbanov
> <stanimir.k.varbanov@gmail.com>; Kieran Bingham
> <kieran.bingham@ideasonboard.com>; Jernej Skrabec
> <jernej.skrabec@gmail.com>; Chen-Yu Tsai <wens@csie.org>; Jacob Chen <jac=
ob-
> chen@iotwrt.com>; Joel Stanley <joel@jms.id.au>; Yang Yingliang
> <yangyingliang@huawei.com>; Patrice Chotard <patrice.chotard@foss.st.com>=
;
> Bin Liu <bin.liu@mediatek.com>; Nathan Chancellor <nathan@kernel.org>;
> Sylwester Nawrocki <sylvester.nawrocki@gmail.com>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; Benson Leung <bleung@chromium.org>; Daniel W. S.
> Almeida <dwlsalmeida@gmail.com>; Qiheng Lin <linqiheng@huawei.com>; Konra=
d
> Dybcio <konrad.dybcio@linaro.org>; Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com>; Yang Li
> <yang.lee@linux.alibaba.com>; Sakari Ailus <sakari.ailus@linux.intel.com>=
;
> Ricardo Ribalda <ribalda@chromium.org>; Shawn Guo <shawnguo@kernel.org>;
> Minghsiu Tsai <minghsiu.tsai@mediatek.com>; Daniel Almeida
> <daniel.almeida@collabora.com>; Alexandre Torgue
> <alexandre.torgue@foss.st.com>; Todor Tomov <todor.too@gmail.com>; Mirela
> Rabulea <mirela.rabulea@nxp.com>; Ajye Huang <ajye_huang@compal.corp-
> partner.google.com>; Scott Chao <scott_chao@wistron.corp-
> partner.google.com>; linux-renesas-soc@vger.kernel.org; Hugues Fruchet
> <hugues.fruchet@foss.st.com>; openbmc@lists.ozlabs.org; Andy Gross
> <agross@kernel.org>; Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>=
;
> Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; Benoit
> Parrot <bparrot@ti.com>; Rui Miguel Silva <rmfrfs@gmail.com>; Christophe
> JAILLET <christophe.jaillet@wanadoo.fr>; Yong Deng <yong.deng@magewell.co=
m>;
> Matthias Brugger <matthias.bgg@gmail.com>; Tiffany Lin
> <tiffany.lin@mediatek.com>; AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>; Bjorn Andersson
> <andersson@kernel.org>; Nicolas Ferre <nicolas.ferre@microchip.com>; Houl=
ong
> Wei <houlong.wei@mediatek.com>; Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org>; Philipp Zabel <p.zabel@pengutronix.de>;
> Niklas S=F6derlund <niklas.soderlund@ragnatech.se>
> Subject: Re: [PATCH 000/117] media: Convert to platform remove callback
> returning void
>=20
> Hello Laurent,
>=20
> On Mon, Apr 17, 2023 at 09:19:28AM +0300, Laurent Pinchart wrote:
> > On Mon, Apr 17, 2023 at 08:02:03AM +0200, Uwe Kleine-K=F6nig wrote:
> > > On Sun, Mar 26, 2023 at 04:30:25PM +0200, Uwe Kleine-K=F6nig wrote:
> > > > Hello,
> > > >
> > > > this series adapts the platform drivers below drivers/pci to use
> > > > the
> > >
> > > copy&paste failure here: s/pci/media/ of course.
> > >
> > > > .remove_new() callback. Compared to the traditional .remove()
> > > > callback
> > > > .remove_new() returns no value. This is a good thing because the
> > > > driver core doesn't (and cannot) cope for errors during remove.
> > > > The only effect of a non-zero return value in .remove() is that
> > > > the driver core emits a warning. The device is removed anyhow and
> > > > an early return from .remove() usually yields a resource leak.
> > > >
> > > > By changing the remove callback to return void driver authors
> > > > cannot reasonably assume any more that there is some kind of cleanu=
p
> later.
> > > >
> > > > Only three drivers needed some preparation first to make sure they
> > > > return 0 unconditionally in their remove callback. Then all
> > > > drivers could be trivially converted without side effects to
> .remove_new().
> > > >
> > > > The changes to the individual drivers are all orthogonal. If I
> > > > need to resend some patches because of some review feedback, I'd
> > > > like to only send the patches that actually needed changes, so
> > > > please pick up the remaining patches that don't need changing to
> reduce the amount of mail.
> > >
> > > I didn't hear anything back about application of this series. Is
> > > there a blocker somewhere?
> >
> > I think the series got applied to the master branch of
> > git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git.
> > It should thus appear in v6.4.
>=20
> I guess that linux-stable.git is a copy&paste failure (and it's not there=
).
> I don't see the series in the master branch of
> git://linuxtv.org/media_tree.git either.
>=20
> .. a bit later ...
>=20
> ah, it's in git://linuxtv.org/mchehab/media-next.git
>=20
> I guess I was just to quick and probably the series will be included in
> today's next.

I believe patchwork <patchwork@linuxtv.org> will send notification to
author and along with people who applied tags for that patch.

I normally get notification from patchwork <patchwork@linuxtv.org>
When the state of patch changes.

Cheers,
Biju
