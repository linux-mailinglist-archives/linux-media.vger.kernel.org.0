Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72CFE6E3F48
	for <lists+linux-media@lfdr.de>; Mon, 17 Apr 2023 08:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjDQGCl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Apr 2023 02:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjDQGCk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Apr 2023 02:02:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D3A2116
        for <linux-media@vger.kernel.org>; Sun, 16 Apr 2023 23:02:38 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1poHwH-0002G1-KI; Mon, 17 Apr 2023 08:02:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1poHwE-00Bnsb-Cs; Mon, 17 Apr 2023 08:02:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1poHwD-00Dolu-4U; Mon, 17 Apr 2023 08:02:05 +0200
Date:   Mon, 17 Apr 2023 08:02:03 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-aspeed@lists.ozlabs.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Benson Leung <bleung@chromium.org>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
        Rory Liu <hellojacky0226@hotmail.com>,
        Scott Chao <scott_chao@wistron.corp-partner.google.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ettore Chimenti <ek5.chimenti@gmail.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Sean Young <sean@mess.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Antti Palosaari <crope@iki.fi>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>,
        Eddie James <eajames@linux.ibm.com>,
        Joel Stanley <joel@jms.id.au>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bin Liu <bin.liu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Moudy Ho <moudy.ho@mediatek.com>,
        Qiheng Lin <linqiheng@huawei.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Yang Li <yang.lee@linux.alibaba.com>,
        Dan Carpenter <error27@gmail.com>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Heiko Stuebner <heiko@sntech.de>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Colin Ian King <colin.i.king@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Eduardo Valentin <edubezval@gmail.com>,
        Sean Wang <sean.wang@mediatek.com>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Guenter Roeck <groeck@chromium.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Jerome Brunet <jbrunet@baylibre.com>,
        chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        openbmc@lists.ozlabs.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-rockchip@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 000/117] media: Convert to platform remove callback
 returning void
Message-ID: <20230417060203.le3izz56wt73si6k@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ogmoi7vlr4vxdkq5"
Content-Disposition: inline
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
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


--ogmoi7vlr4vxdkq5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Mauro

On Sun, Mar 26, 2023 at 04:30:25PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> this series adapts the platform drivers below drivers/pci to use the

copy&paste failure here: s/pci/media/ of course.

> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver c=
ore
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warnin=
g. The
> device is removed anyhow and an early return from .remove() usually yield=
s a
> resource leak.
>=20
> By changing the remove callback to return void driver authors cannot
> reasonably assume any more that there is some kind of cleanup later.
>=20
> Only three drivers needed some preparation first to make sure they
> return 0 unconditionally in their remove callback. Then all drivers
> could be trivially converted without side effects to .remove_new().
>=20
> The changes to the individual drivers are all orthogonal. If I need to
> resend some patches because of some review feedback, I'd like to only
> send the patches that actually needed changes, so please pick up the
> remaining patches that don't need changing to reduce the amount of mail.

I didn't hear anything back about application of this series. Is there a
blocker somewhere?

Apart from the three preparatory patches that are a precondition to the
conversion of the respective drivers, the patches are all pairwise
orthogonal. So from my POV the best would be to apply all patches that
still apply (which might be all), I will care for the fallout later
then.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ogmoi7vlr4vxdkq5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ84NoACgkQj4D7WH0S
/k65OwgAkM/14eqkcxTg0/453d2uwhPt/jiDru0C14NvpnN4AFU0sa+yzp1GfYRO
WfxjudHvw/OXq+eolRu8PrqJIpLHvQhOyjblYLXPqTB8RvdJSXI2Q1ZJjozYjCNJ
WeBerHqAXGOnxd+2kbfCs2VZWYgmJpj1VCXeRYekMB7Kv1tmfXNXetaHIH7Rypw1
+Si1nhZN4Sk68bdXU+RaQc6UP5/E0VohPVWnSB1tsTQVL4sogBkjfDl4tueHEZxj
959kirh12hfcFcqtz1mQ1u7V1dIc136PR+Kg/2b+GNaFbe/Zdsno5HbnbQl+NwL/
GWFmd+GksqXkwA3k1tkqVdOFEPO4cQ==
=K38Q
-----END PGP SIGNATURE-----

--ogmoi7vlr4vxdkq5--
