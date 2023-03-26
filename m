Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBA6B6C952D
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232414AbjCZOcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbjCZOcg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 622926594
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:31 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ4-0007kg-Gp; Sun, 26 Mar 2023 16:32:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ2-006rYc-7C; Sun, 26 Mar 2023 16:32:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ1-0088Th-32; Sun, 26 Mar 2023 16:32:25 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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
        Ming Qian <ming.qian@nxp.com>, Shijie Qin <shijie.qin@nxp.com>,
        Zhou Peng <eagle.zhou@nxp.com>,
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
        =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
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
        =?utf-8?q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
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
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de,
        Guenter Roeck <groeck@chromium.org>,
        chrome-platform@lists.linux.dev,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
        openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-sunxi@lists.linux.dev,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 000/117] media: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:25 +0200
Message-Id: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=17060; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=R8JEVMooI/UfNqow28CHlf2dkvNbbdnM7oZhwsOv/Hk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFZtV3UxdfOKZxR3JuBPhyseFtriLtuq2rjef c5xbUtn61CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWbQAKCRCPgPtYfRL+ Ton3B/9Emj2J7A7FbG3XeXfbXDRYJLuUenGjQKgVUX197T3GYrPBaHRlqJdMQdaDQ6pw0JoZVNI rvtuLyDyWyqbvbGbyWt4tkuusZ2AGpDR1EfpiPjzHafb5zfDIr+1qkROEh3lBOUWU/pC6eRbSXs lk5P4k72UW5GmudDrb66F+/OGIGCwJhr6JXVI2uAaHAKsYqWnOL6stOh8UEpk6OO4VTd445r4xQ YlcpYDM93N2MFOs1gEucUoAxMpO+ZSqMkHajHe/6jdhJj7Hwp3qC1wByPUNzHodLMFO3kVk0FJZ 1wsm2ov8oAUlDIriIN7ezncuntIthEokyQGTGnc5+Yo5+wK5
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

this series adapts the platform drivers below drivers/pci to use the
.remove_new() callback. Compared to the traditional .remove() callback
.remove_new() returns no value. This is a good thing because the driver core
doesn't (and cannot) cope for errors during remove. The only effect of a
non-zero return value in .remove() is that the driver core emits a warning. The
device is removed anyhow and an early return from .remove() usually yields a
resource leak.

By changing the remove callback to return void driver authors cannot
reasonably assume any more that there is some kind of cleanup later.

Only three drivers needed some preparation first to make sure they
return 0 unconditionally in their remove callback. Then all drivers
could be trivially converted without side effects to .remove_new().

The changes to the individual drivers are all orthogonal. If I need to
resend some patches because of some review feedback, I'd like to only
send the patches that actually needed changes, so please pick up the
remaining patches that don't need changing to reduce the amount of mail.

Best regards
Uwe

Uwe Kleine-König (117):
  media: cec-gpio: Convert to platform remove callback returning void
  media: cros-ec-cec: Don't exit early in .remove() callback
  media: cros-ec-cec: Convert to platform remove callback returning void
  media: ao-cec-g12a: Convert to platform remove callback returning void
  media: ao-cec: Convert to platform remove callback returning void
  media: s5p_cec: Convert to platform remove callback returning void
  media: seco-cec: Convert to platform remove callback returning void
  media: stih-cec: Convert to platform remove callback returning void
  media: stm32-cec: Convert to platform remove callback returning void
  media: tegra_cec: Convert to platform remove callback returning void
  media: rtl2832_sdr: Convert to platform remove callback returning void
  media: zd1301_demod: Convert to platform remove callback returning
    void
  media: allegro-core: Convert to platform remove callback returning
    void
  media: ge2d: Convert to platform remove callback returning void
  media: vpu_core: Convert to platform remove callback returning void
  media: vpu_drv: Convert to platform remove callback returning void
  media: aspeed-video: Convert to platform remove callback returning
    void
  media: atmel-isi: Convert to platform remove callback returning void
  media: cdns-csi2rx: Convert to platform remove callback returning void
  media: cdns-csi2tx: Convert to platform remove callback returning void
  media: coda-common: Convert to platform remove callback returning void
  media: pxa_camera: Convert to platform remove callback returning void
  media: m2m-deinterlace: Convert to platform remove callback returning
    void
  media: marvell: Simplify remove callback
  media: marvell: Convert to platform remove callback returning void
  media: mtk_jpeg_core: Convert to platform remove callback returning
    void
  media: mtk_mdp_core: Convert to platform remove callback returning
    void
  media: mtk-mdp3-core: Convert to platform remove callback returning
    void
  media: mtk_vcodec_dec_drv: Convert to platform remove callback
    returning void
  media: mtk_vcodec_enc_drv: Convert to platform remove callback
    returning void
  media: mtk_vpu: Convert to platform remove callback returning void
  media: microchip-csi2dc: Convert to platform remove callback returning
    void
  media: microchip-sama5d2-isc: Convert to platform remove callback
    returning void
  media: microchip-sama7g5-isc: Convert to platform remove callback
    returning void
  media: vde: Convert to platform remove callback returning void
  media: dw100: Convert to platform remove callback returning void
  media: mxc-jpeg: Convert to platform remove callback returning void
  media: imx-mipi-csis: Convert to platform remove callback returning
    void
  media: imx-pxp: Convert to platform remove callback returning void
  media: imx7-media-csi: Convert to platform remove callback returning
    void
  media: mx2_emmaprp: Convert to platform remove callback returning void
  media: camss: Convert to platform remove callback returning void
  media: venus: Warn only once about problems in .remove()
  media: venus: Convert to platform remove callback returning void
  media: vdec: Convert to platform remove callback returning void
  media: venc: Convert to platform remove callback returning void
  media: rcar-fcp: Convert to platform remove callback returning void
  media: rcar-isp: Convert to platform remove callback returning void
  media: rcar-core: Convert to platform remove callback returning void
  media: rcar-csi2: Convert to platform remove callback returning void
  media: rcar_drif: Convert to platform remove callback returning void
  media: rcar_fdp1: Convert to platform remove callback returning void
  media: rcar_jpu: Convert to platform remove callback returning void
  media: renesas-ceu: Convert to platform remove callback returning void
  media: rzg2l-core: Convert to platform remove callback returning void
  media: rzg2l-csi2: Convert to platform remove callback returning void
  media: sh_vou: Convert to platform remove callback returning void
  media: vsp1_drv: Convert to platform remove callback returning void
  media: rga: Convert to platform remove callback returning void
  media: rkisp1-dev: Convert to platform remove callback returning void
  media: gsc-core: Convert to platform remove callback returning void
  media: fimc-core: Convert to platform remove callback returning void
  media: fimc-is-i2c: Convert to platform remove callback returning void
  media: fimc-is: Convert to platform remove callback returning void
  media: fimc-lite: Convert to platform remove callback returning void
  media: media-dev: Convert to platform remove callback returning void
  media: mipi-csis: Convert to platform remove callback returning void
  media: camif-core: Convert to platform remove callback returning void
  media: g2d: Convert to platform remove callback returning void
  media: jpeg-core: Convert to platform remove callback returning void
  media: s5p_mfc: Convert to platform remove callback returning void
  media: bdisp-v4l2: Convert to platform remove callback returning void
  media: c8sectpfe-core: Convert to platform remove callback returning
    void
  media: delta-v4l2: Convert to platform remove callback returning void
  media: hva-v4l2: Convert to platform remove callback returning void
  media: dma2d: Convert to platform remove callback returning void
  media: stm32-dcmi: Convert to platform remove callback returning void
  media: sun4i_csi: Convert to platform remove callback returning void
  media: sun6i_csi: Convert to platform remove callback returning void
  media: sun6i_mipi_csi2: Convert to platform remove callback returning
    void
  media: sun8i_a83t_mipi_csi2: Convert to platform remove callback
    returning void
  media: sun8i-di: Convert to platform remove callback returning void
  media: sun8i_rotate: Convert to platform remove callback returning
    void
  media: am437x-vpfe: Convert to platform remove callback returning void
  media: cal: Convert to platform remove callback returning void
  media: vpif: Convert to platform remove callback returning void
  media: vpif_capture: Convert to platform remove callback returning
    void
  media: vpif_display: Convert to platform remove callback returning
    void
  media: omap_vout: Convert to platform remove callback returning void
  media: isp: Convert to platform remove callback returning void
  media: vpe: Convert to platform remove callback returning void
  media: hantro_drv: Convert to platform remove callback returning void
  media: via-camera: Convert to platform remove callback returning void
  media: video-mux: Convert to platform remove callback returning void
  media: xilinx-csi2rxss: Convert to platform remove callback returning
    void
  media: xilinx-tpg: Convert to platform remove callback returning void
  media: xilinx-vipp: Convert to platform remove callback returning void
  media: xilinx-vtc: Convert to platform remove callback returning void
  media: radio-si476x: Convert to platform remove callback returning
    void
  media: radio-timb: Convert to platform remove callback returning void
  media: radio-wl1273: Convert to platform remove callback returning
    void
  media: radio-platform-si4713: Convert to platform remove callback
    returning void
  media: gpio-ir-recv: Convert to platform remove callback returning
    void
  media: img-ir-core: Convert to platform remove callback returning void
  media: ir-hix5hd2: Convert to platform remove callback returning void
  media: meson-ir-tx: Convert to platform remove callback returning void
  media: meson-ir: Convert to platform remove callback returning void
  media: mtk-cir: Convert to platform remove callback returning void
  media: st_rc: Convert to platform remove callback returning void
  media: sunxi-cir: Convert to platform remove callback returning void
  media: vicodec-core: Convert to platform remove callback returning
    void
  media: vidtv_bridge: Convert to platform remove callback returning
    void
  media: vim2m: Convert to platform remove callback returning void
  media: vimc-core: Convert to platform remove callback returning void
  media: visl-core: Convert to platform remove callback returning void
  media: vivid-core: Convert to platform remove callback returning void
  media: it913x: Convert to platform remove callback returning void

 drivers/media/cec/platform/cec-gpio/cec-gpio.c   |  5 ++---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 16 ++++++++--------
 drivers/media/cec/platform/meson/ao-cec-g12a.c   |  6 ++----
 drivers/media/cec/platform/meson/ao-cec.c        |  6 ++----
 drivers/media/cec/platform/s5p/s5p_cec.c         |  5 ++---
 drivers/media/cec/platform/seco/seco-cec.c       |  6 ++----
 drivers/media/cec/platform/sti/stih-cec.c        |  6 ++----
 drivers/media/cec/platform/stm32/stm32-cec.c     |  6 ++----
 drivers/media/cec/platform/tegra/tegra_cec.c     |  6 ++----
 drivers/media/dvb-frontends/rtl2832_sdr.c        |  6 ++----
 drivers/media/dvb-frontends/zd1301_demod.c       |  6 ++----
 .../media/platform/allegro-dvt/allegro-core.c    |  6 ++----
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c |  6 ++----
 drivers/media/platform/amphion/vpu_core.c        |  6 ++----
 drivers/media/platform/amphion/vpu_drv.c         |  6 ++----
 drivers/media/platform/aspeed/aspeed-video.c     |  6 ++----
 drivers/media/platform/atmel/atmel-isi.c         |  6 ++----
 drivers/media/platform/cadence/cdns-csi2rx.c     |  6 ++----
 drivers/media/platform/cadence/cdns-csi2tx.c     |  6 ++----
 drivers/media/platform/chips-media/coda-common.c |  5 ++---
 drivers/media/platform/intel/pxa_camera.c        |  6 ++----
 drivers/media/platform/m2m-deinterlace.c         |  6 ++----
 drivers/media/platform/marvell/mmp-driver.c      | 16 +++-------------
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c |  6 ++----
 .../media/platform/mediatek/mdp/mtk_mdp_core.c   |  5 ++---
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c |  5 ++---
 .../mediatek/vcodec/mtk_vcodec_dec_drv.c         |  5 ++---
 .../mediatek/vcodec/mtk_vcodec_enc_drv.c         |  5 ++---
 drivers/media/platform/mediatek/vpu/mtk_vpu.c    |  6 ++----
 .../media/platform/microchip/microchip-csi2dc.c  |  6 ++----
 .../platform/microchip/microchip-sama5d2-isc.c   |  6 ++----
 .../platform/microchip/microchip-sama7g5-isc.c   |  6 ++----
 drivers/media/platform/nvidia/tegra-vde/vde.c    |  6 ++----
 drivers/media/platform/nxp/dw100/dw100.c         |  6 ++----
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c   |  6 ++----
 drivers/media/platform/nxp/imx-mipi-csis.c       |  6 ++----
 drivers/media/platform/nxp/imx-pxp.c             |  6 ++----
 drivers/media/platform/nxp/imx7-media-csi.c      |  6 ++----
 drivers/media/platform/nxp/mx2_emmaprp.c         |  6 ++----
 drivers/media/platform/qcom/camss/camss.c        |  6 ++----
 drivers/media/platform/qcom/venus/core.c         |  6 ++----
 drivers/media/platform/qcom/venus/vdec.c         |  6 ++----
 drivers/media/platform/qcom/venus/venc.c         |  6 ++----
 drivers/media/platform/renesas/rcar-fcp.c        |  6 ++----
 drivers/media/platform/renesas/rcar-isp.c        |  6 ++----
 .../media/platform/renesas/rcar-vin/rcar-core.c  |  6 ++----
 .../media/platform/renesas/rcar-vin/rcar-csi2.c  |  6 ++----
 drivers/media/platform/renesas/rcar_drif.c       |  8 +++-----
 drivers/media/platform/renesas/rcar_fdp1.c       |  6 ++----
 drivers/media/platform/renesas/rcar_jpu.c        |  6 ++----
 drivers/media/platform/renesas/renesas-ceu.c     |  6 ++----
 .../platform/renesas/rzg2l-cru/rzg2l-core.c      |  6 ++----
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c      |  6 ++----
 drivers/media/platform/renesas/sh_vou.c          |  5 ++---
 drivers/media/platform/renesas/vsp1/vsp1_drv.c   |  6 ++----
 drivers/media/platform/rockchip/rga/rga.c        |  6 ++----
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c  |  6 ++----
 .../media/platform/samsung/exynos-gsc/gsc-core.c |  5 ++---
 .../platform/samsung/exynos4-is/fimc-core.c      |  5 ++---
 .../platform/samsung/exynos4-is/fimc-is-i2c.c    |  6 ++----
 .../media/platform/samsung/exynos4-is/fimc-is.c  |  6 ++----
 .../platform/samsung/exynos4-is/fimc-lite.c      |  5 ++---
 .../platform/samsung/exynos4-is/media-dev.c      |  8 +++-----
 .../platform/samsung/exynos4-is/mipi-csis.c      |  6 ++----
 .../platform/samsung/s3c-camif/camif-core.c      |  6 ++----
 drivers/media/platform/samsung/s5p-g2d/g2d.c     |  5 ++---
 .../media/platform/samsung/s5p-jpeg/jpeg-core.c  |  6 ++----
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c |  5 ++---
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c |  6 ++----
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.c   |  6 ++----
 drivers/media/platform/st/sti/delta/delta-v4l2.c |  6 ++----
 drivers/media/platform/st/sti/hva/hva-v4l2.c     |  6 ++----
 drivers/media/platform/st/stm32/dma2d/dma2d.c    |  6 ++----
 drivers/media/platform/st/stm32/stm32-dcmi.c     |  6 ++----
 .../media/platform/sunxi/sun4i-csi/sun4i_csi.c   |  6 ++----
 .../media/platform/sunxi/sun6i-csi/sun6i_csi.c   |  6 ++----
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c      |  6 ++----
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c  |  6 ++----
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c |  6 ++----
 .../platform/sunxi/sun8i-rotate/sun8i_rotate.c   |  6 ++----
 drivers/media/platform/ti/am437x/am437x-vpfe.c   |  6 ++----
 drivers/media/platform/ti/cal/cal.c              |  6 ++----
 drivers/media/platform/ti/davinci/vpif.c         |  6 ++----
 drivers/media/platform/ti/davinci/vpif_capture.c |  5 ++---
 drivers/media/platform/ti/davinci/vpif_display.c |  6 ++----
 drivers/media/platform/ti/omap/omap_vout.c       |  5 ++---
 drivers/media/platform/ti/omap3isp/isp.c         |  6 ++----
 drivers/media/platform/ti/vpe/vpe.c              |  6 ++----
 drivers/media/platform/verisilicon/hantro_drv.c  |  5 ++---
 drivers/media/platform/via/via-camera.c          |  5 ++---
 drivers/media/platform/video-mux.c               |  6 ++----
 drivers/media/platform/xilinx/xilinx-csi2rxss.c  |  6 ++----
 drivers/media/platform/xilinx/xilinx-tpg.c       |  6 ++----
 drivers/media/platform/xilinx/xilinx-vipp.c      |  6 ++----
 drivers/media/platform/xilinx/xilinx-vtc.c       |  6 ++----
 drivers/media/radio/radio-si476x.c               |  6 ++----
 drivers/media/radio/radio-timb.c                 |  5 ++---
 drivers/media/radio/radio-wl1273.c               |  6 ++----
 .../media/radio/si4713/radio-platform-si4713.c   |  6 ++----
 drivers/media/rc/gpio-ir-recv.c                  |  6 ++----
 drivers/media/rc/img-ir/img-ir-core.c            |  5 ++---
 drivers/media/rc/ir-hix5hd2.c                    |  5 ++---
 drivers/media/rc/meson-ir-tx.c                   |  6 ++----
 drivers/media/rc/meson-ir.c                      |  6 ++----
 drivers/media/rc/mtk-cir.c                       |  6 ++----
 drivers/media/rc/st_rc.c                         |  5 ++---
 drivers/media/rc/sunxi-cir.c                     |  6 ++----
 .../media/test-drivers/vicodec/vicodec-core.c    |  6 ++----
 drivers/media/test-drivers/vidtv/vidtv_bridge.c  |  6 ++----
 drivers/media/test-drivers/vim2m.c               |  6 ++----
 drivers/media/test-drivers/vimc/vimc-core.c      |  6 ++----
 drivers/media/test-drivers/visl/visl-core.c      |  6 ++----
 drivers/media/test-drivers/vivid/vivid-core.c    |  5 ++---
 drivers/media/tuners/it913x.c                    |  6 ++----
 114 files changed, 237 insertions(+), 449 deletions(-)

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2

