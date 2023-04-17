Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0CF96E4130
	for <lists+linux-media@lfdr.de>; Mon, 17 Apr 2023 09:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbjDQHhL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Apr 2023 03:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbjDQHgm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Apr 2023 03:36:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDAF449CC;
        Mon, 17 Apr 2023 00:35:20 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10E72DE6;
        Mon, 17 Apr 2023 09:35:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681716911;
        bh=+nNnkWr6Y0n06KrbbCtAOSHIusgnvBhnkukVuDNhkEc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NbcvuQnyQJAGVrRDp382kWJkH39Ilus9pmqcciT6N67Pdpgd9FeFZlZZ9XsqwFkHA
         Hzp4QDnGHlkDQGFg8p4k3P9nhygT8DNN9tzAcFlOgEHnSZXwgRJBNMHh4MaQ2gyksv
         vBVHMMH+GTSQftGIrThbwBm2FcmUTup6+MKy2H7I=
Date:   Mon, 17 Apr 2023 10:35:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Eddie James <eajames@linux.ibm.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Antti Palosaari <crope@iki.fi>,
        NXP Linux Team <linux-imx@nxp.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-sunxi@lists.linux.dev, ye xingchen <ye.xingchen@zte.com.cn>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Moudy Ho <moudy.ho@mediatek.com>, kernel@pengutronix.de,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Ming Qian <ming.qian@nxp.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-aspeed@lists.ozlabs.org,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Guenter Roeck <groeck@chromium.org>,
        chrome-platform@lists.linux.dev,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Colin Ian King <colin.i.king@gmail.com>,
        linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Rory Liu <hellojacky0226@hotmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-msm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
        Maxime Ripard <mripard@kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Zhou Peng <eagle.zhou@nxp.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-mediatek@lists.infradead.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Carpenter <error27@gmail.com>, Sean Young <sean@mess.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Ettore Chimenti <ek5.chimenti@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        linux-tegra@vger.kernel.org,
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
        linux-renesas-soc@vger.kernel.org,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        openbmc@lists.ozlabs.org, Andy Gross <agross@kernel.org>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
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
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH 000/117] media: Convert to platform remove callback
 returning void
Message-ID: <20230417073527.GE28551@pendragon.ideasonboard.com>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230417060203.le3izz56wt73si6k@pengutronix.de>
 <20230417061928.GD28551@pendragon.ideasonboard.com>
 <20230417073049.2b5b35hpjrjcrlge@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230417073049.2b5b35hpjrjcrlge@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 17, 2023 at 09:30:49AM +0200, Uwe Kleine-König wrote:
> Hello Laurent,
> 
> On Mon, Apr 17, 2023 at 09:19:28AM +0300, Laurent Pinchart wrote:
> > On Mon, Apr 17, 2023 at 08:02:03AM +0200, Uwe Kleine-König wrote:
> > > On Sun, Mar 26, 2023 at 04:30:25PM +0200, Uwe Kleine-König wrote:
> > > > Hello,
> > > > 
> > > > this series adapts the platform drivers below drivers/pci to use the
> > > 
> > > copy&paste failure here: s/pci/media/ of course.
> > > 
> > > > .remove_new() callback. Compared to the traditional .remove() callback
> > > > .remove_new() returns no value. This is a good thing because the driver core
> > > > doesn't (and cannot) cope for errors during remove. The only effect of a
> > > > non-zero return value in .remove() is that the driver core emits a warning. The
> > > > device is removed anyhow and an early return from .remove() usually yields a
> > > > resource leak.
> > > > 
> > > > By changing the remove callback to return void driver authors cannot
> > > > reasonably assume any more that there is some kind of cleanup later.
> > > > 
> > > > Only three drivers needed some preparation first to make sure they
> > > > return 0 unconditionally in their remove callback. Then all drivers
> > > > could be trivially converted without side effects to .remove_new().
> > > > 
> > > > The changes to the individual drivers are all orthogonal. If I need to
> > > > resend some patches because of some review feedback, I'd like to only
> > > > send the patches that actually needed changes, so please pick up the
> > > > remaining patches that don't need changing to reduce the amount of mail.
> > > 
> > > I didn't hear anything back about application of this series. Is there a
> > > blocker somewhere?
> > 
> > I think the series got applied to the master branch of
> > git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git.
> > It should thus appear in v6.4.
> 
> I guess that linux-stable.git is a copy&paste failure (and it's not
> there). I don't see the series in the master branch of
> git://linuxtv.org/media_tree.git either.

Oops sorry. It was a copy & paste mistake indeed, I meant

git://linuxtv.org/media_stage.git

> .. a bit later ...
> 
> ah, it's in git://linuxtv.org/mchehab/media-next.git
> 
> I guess I was just to quick and probably the series will be included in
> today's next.

-- 
Regards,

Laurent Pinchart
