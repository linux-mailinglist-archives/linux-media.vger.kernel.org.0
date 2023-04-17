Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDBA6E430D
	for <lists+linux-media@lfdr.de>; Mon, 17 Apr 2023 11:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjDQJCJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Apr 2023 05:02:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjDQJCI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Apr 2023 05:02:08 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DFFA1FC3
        for <linux-media@vger.kernel.org>; Mon, 17 Apr 2023 02:02:06 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1poKd9-0004W9-9f; Mon, 17 Apr 2023 10:54:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1poKce-00Bpk9-B4; Mon, 17 Apr 2023 10:54:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1poKcd-00DrOr-K2; Mon, 17 Apr 2023 10:54:03 +0200
Date:   Mon, 17 Apr 2023 10:54:03 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Eddie James <eajames@linux.ibm.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Robert Foss <rfoss@kernel.org>, Sean Young <sean@mess.org>,
        Samuel Holland <samuel@sholland.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Antti Palosaari <crope@iki.fi>,
        NXP Linux Team <linux-imx@nxp.com>,
        "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Benoit Parrot <bparrot@ti.com>,
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
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Colin Ian King <colin.i.king@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Rory Liu <hellojacky0226@hotmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Maxime Ripard <mripard@kernel.org>,
        "linux-amlogic@lists.infradead.org" 
        <linux-amlogic@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Zhou Peng <eagle.zhou@nxp.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Carpenter <error27@gmail.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Ettore Chimenti <ek5.chimenti@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
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
        Eduardo Valentin <edubezval@gmail.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        Yong Deng <yong.deng@magewell.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH 000/117] media: Convert to platform remove callback
 returning void
Message-ID: <20230417085403.sbk3k4qlpljbfqld@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230417060203.le3izz56wt73si6k@pengutronix.de>
 <20230417061928.GD28551@pendragon.ideasonboard.com>
 <20230417073049.2b5b35hpjrjcrlge@pengutronix.de>
 <OS0PR01MB59221153A63F64BBAD3ED20D869C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fbine4cndaaohubi"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59221153A63F64BBAD3ED20D869C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--fbine4cndaaohubi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2023 at 07:57:57AM +0000, Biju Das wrote:
> Hi Uwe,
> > > I think the series got applied to the master branch of
> > > git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git.
> > > It should thus appear in v6.4.
> >=20
> > I guess that linux-stable.git is a copy&paste failure (and it's not the=
re).
> > I don't see the series in the master branch of
> > git://linuxtv.org/media_tree.git either.
> >=20
> > .. a bit later ...
> >=20
> > ah, it's in git://linuxtv.org/mchehab/media-next.git
> >=20
> > I guess I was just to quick and probably the series will be included in
> > today's next.
>=20
> I believe patchwork <patchwork@linuxtv.org> will send notification to
> author and along with people who applied tags for that patch.

Indeed, I got such a notification on Apr 11. But even if I had that on
my radar when asking and considered such notifications reliable in
general, I would have asked, as the patches didn't apprear in next up to
now.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fbine4cndaaohubi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ9CSoACgkQj4D7WH0S
/k6ShQgAkiGsAbqnu5CIYl6vVltmySdbzFphOT5lae+k2iaPjP4KBQyey9E309bA
T8cWAHGmSzTAr3+xiHj0Vl3KS3KltR2ike2TLIupFKTW6gJIpAyseCA8SLtj625z
DYRY5/9pDFLtNe4MD6tpVn7ZPAzEb/DdC/F12elKbSP+3RLwwRhyo/EtmAbFc6f9
e/G2EuuAPaBs+wywWC9piaSjYWk57nSelhyJqSoWAJbpZM2hOiGsIeaiI2OI6l9X
sye5ayrw1sdGUVa70KExUaG9L0d1hFmhkfZz3m7I2ZosIc5Q3k5RCBDj41MxyvTC
7hFi24KnDnjHVL2gEWrM+oBRJZju9Q==
=h+pR
-----END PGP SIGNATURE-----

--fbine4cndaaohubi--
