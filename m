Return-Path: <linux-media+bounces-19618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A178A99D0F7
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 17:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF11A1F23899
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 15:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268D41AAE1D;
	Mon, 14 Oct 2024 15:09:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E0245C1C
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728918542; cv=none; b=kww8o/IgydZaFMIV2bnOttN+KD7Wvq7cV9ox5WQuljvWKqV+yxEDeDG0FTXEtlMjv1Sxc6jZ2tQ3d0h48OWISysMimSGiUJ1k9bAHJU6sQh+3fRkBfnyWKe91zA3sWwhDAz0HD6+90tRwN4QkRVAo2Qq6AN/VOXlfMA/t8D1gDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728918542; c=relaxed/simple;
	bh=+ZW9C6uqftStxVURqRPK/VOSekDSwzWNM/wK1fZvmg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qPiUD/y/0nqgYmooZvcyp8uEk+CjIIk3r+DRXWYlnnXYkfdcL+H9UcyQSQRmmHPmHhhUCYP18SN6XmofcqeQX7IXXjPyivjbSsrDHVhmR/+RnxOY6NAG61UtZKtw8H/UFIJPoKFKNBGZAZUi8oTHHVrM9DvU/s1MYR+1XRtjc54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449A6C4CED1;
	Mon, 14 Oct 2024 15:08:45 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
Date: Mon, 14 Oct 2024 17:06:34 +0200
Subject: [PATCH 07/10] media: platform: drop vb2_ops_wait_prepare/finish
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-vb2-wait-v1-7-8c3ee25c618c@xs4all.nl>
References: <20241014-vb2-wait-v1-0-8c3ee25c618c@xs4all.nl>
In-Reply-To: <20241014-vb2-wait-v1-0-8c3ee25c618c@xs4all.nl>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Andy Walls <awalls@md.metrocast.net>, Yong Zhi <yong.zhi@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Dan Scally <djrscally@gmail.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
 Andrey Utkin <andrey_utkin@fastmail.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Corentin Labbe <clabbe@baylibre.com>, Michael Krufky <mkrufky@linuxtv.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Matt Ranostay <matt@ranostay.sg>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Eugen Hristev <eugen.hristev@collabora.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Devarsh Thakkar <devarsht@ti.com>, Bin Liu <bin.liu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Joseph Liu <kwliu@nuvoton.com>, 
 Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>, 
 Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, 
 Jacob Chen <jacob-chen@iotwrt.com>, Heiko Stuebner <heiko@sntech.de>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 =?utf-8?q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Fabien Dessenne <fabien.dessenne@foss.st.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Yong Deng <yong.deng@magewell.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Benoit Parrot <bparrot@ti.com>, Jai Luthra <jai.luthra@linux.dev>, 
 Michal Simek <michal.simek@amd.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Jack Zhu <jack.zhu@starfivetech.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2

Since commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
are NULL") it is no longer needed to set the wait_prepare/finish
vb2_ops callbacks as long as the lock field in vb2_queue is set.

Since the vb2_ops_wait_prepare/finish callbacks already rely on that field,
we can safely drop these callbacks.

This simplifies the code and this is a step towards the goal of deleting
these callbacks.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/platform/allegro-dvt/allegro-core.c                   | 2 --
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c                    | 2 --
 drivers/media/platform/amphion/vpu_v4l2.c                           | 2 --
 drivers/media/platform/aspeed/aspeed-video.c                        | 2 --
 drivers/media/platform/atmel/atmel-isi.c                            | 2 --
 drivers/media/platform/broadcom/bcm2835-unicam.c                    | 2 --
 drivers/media/platform/chips-media/coda/coda-common.c               | 2 --
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c            | 2 --
 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c            | 2 --
 drivers/media/platform/imagination/e5010-jpeg-enc.c                 | 2 --
 drivers/media/platform/intel/pxa_camera.c                           | 2 --
 drivers/media/platform/m2m-deinterlace.c                            | 2 --
 drivers/media/platform/marvell/mcam-core.c                          | 4 ----
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c                | 4 ----
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c                   | 2 --
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c                 | 2 --
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c      | 2 --
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c     | 2 --
 drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c     | 2 --
 drivers/media/platform/microchip/microchip-isc-base.c               | 2 --
 drivers/media/platform/nuvoton/npcm-video.c                         | 2 --
 drivers/media/platform/nvidia/tegra-vde/v4l2.c                      | 2 --
 drivers/media/platform/nxp/dw100/dw100.c                            | 2 --
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c                      | 2 --
 drivers/media/platform/nxp/imx-pxp.c                                | 2 --
 drivers/media/platform/nxp/imx7-media-csi.c                         | 2 --
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c                  | 2 --
 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c                | 2 --
 drivers/media/platform/nxp/mx2_emmaprp.c                            | 2 --
 drivers/media/platform/qcom/camss/camss-video.c                     | 2 --
 drivers/media/platform/qcom/venus/vdec.c                            | 2 --
 drivers/media/platform/qcom/venus/venc.c                            | 2 --
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c                | 2 --
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c                  | 2 --
 drivers/media/platform/renesas/rcar_drif.c                          | 2 --
 drivers/media/platform/renesas/rcar_fdp1.c                          | 2 --
 drivers/media/platform/renesas/rcar_jpu.c                           | 2 --
 drivers/media/platform/renesas/renesas-ceu.c                        | 2 --
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c              | 2 --
 drivers/media/platform/renesas/sh_vou.c                             | 2 --
 drivers/media/platform/renesas/vsp1/vsp1_histo.c                    | 2 --
 drivers/media/platform/renesas/vsp1/vsp1_video.c                    | 2 --
 drivers/media/platform/rockchip/rga/rga-buf.c                       | 2 --
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c             | 2 --
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c              | 2 --
 drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c               | 2 --
 drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c                 | 2 --
 drivers/media/platform/samsung/exynos4-is/fimc-capture.c            | 2 --
 drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c          | 2 --
 drivers/media/platform/samsung/exynos4-is/fimc-lite.c               | 2 --
 drivers/media/platform/samsung/exynos4-is/fimc-m2m.c                | 2 --
 drivers/media/platform/samsung/s3c-camif/camif-capture.c            | 2 --
 drivers/media/platform/samsung/s5p-g2d/g2d.c                        | 2 --
 drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c                 | 2 --
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c                | 2 --
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c                | 2 --
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c                    | 2 --
 drivers/media/platform/st/sti/delta/delta-v4l2.c                    | 4 ----
 drivers/media/platform/st/sti/hva/hva-v4l2.c                        | 2 --
 drivers/media/platform/st/stm32/dma2d/dma2d.c                       | 2 --
 drivers/media/platform/st/stm32/stm32-dcmi.c                        | 2 --
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c       | 6 ------
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c                  | 2 --
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c          | 2 --
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c                    | 2 --
 drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c            | 2 --
 drivers/media/platform/ti/am437x/am437x-vpfe.c                      | 2 --
 drivers/media/platform/ti/cal/cal-video.c                           | 2 --
 drivers/media/platform/ti/davinci/vpif_capture.c                    | 2 --
 drivers/media/platform/ti/davinci/vpif_display.c                    | 2 --
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c               | 2 --
 drivers/media/platform/ti/omap/omap_vout.c                          | 2 --
 drivers/media/platform/ti/vpe/vpe.c                                 | 2 --
 drivers/media/platform/verisilicon/hantro_v4l2.c                    | 2 --
 drivers/media/platform/via/via-camera.c                             | 2 --
 drivers/media/platform/xilinx/xilinx-dma.c                          | 2 --
 76 files changed, 162 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 44e0d5512f94aee8d31b74c00790548872344f2a..e491399afcc984346eb4159111f35bab5340f2b5 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -2897,8 +2897,6 @@ static const struct vb2_ops allegro_queue_ops = {
 	.buf_queue = allegro_buf_queue,
 	.start_streaming = allegro_start_streaming,
 	.stop_streaming = allegro_stop_streaming,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 };
 
 static int allegro_queue_init(void *priv,
diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
index b05c944d5dc2e50e8646d62a84c2971cce2f7cb5..0c004bb8ba05059245e73a306ed2d20dc18c9197 100644
--- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
+++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
@@ -391,8 +391,6 @@ static const struct vb2_ops ge2d_qops = {
 	.buf_queue = ge2d_buf_queue,
 	.start_streaming = ge2d_start_streaming,
 	.stop_streaming = ge2d_stop_streaming,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 };
 
 static int
diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index f0b1ec79d2961cf1a5785359923bb57f1eeb21d5..45707931bc4f1fd0bce4852f97721bb7af98f44d 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -646,8 +646,6 @@ static const struct vb2_ops vpu_vb2_ops = {
 	.start_streaming    = vpu_vb2_start_streaming,
 	.stop_streaming     = vpu_vb2_stop_streaming,
 	.buf_queue          = vpu_vb2_buf_queue,
-	.wait_prepare       = vb2_ops_wait_prepare,
-	.wait_finish        = vb2_ops_wait_finish,
 };
 
 static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index fd540349811517661671ac3c5a512af2127e0d44..54cae0da9aca3fd74800b51f79136a261aec241a 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -1891,8 +1891,6 @@ static void aspeed_video_buf_queue(struct vb2_buffer *vb)
 
 static const struct vb2_ops aspeed_video_vb2_ops = {
 	.queue_setup = aspeed_video_queue_setup,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.buf_prepare = aspeed_video_buf_prepare,
 	.start_streaming = aspeed_video_start_streaming,
 	.stop_streaming = aspeed_video_stop_streaming,
diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index 049b7faf57900120dbea7ca213c29037e2c39360..0d1c3934752972190d8a1ded9a04b2be2b768c36 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -526,8 +526,6 @@ static const struct vb2_ops isi_video_qops = {
 	.buf_queue		= buffer_queue,
 	.start_streaming	= start_streaming,
 	.stop_streaming		= stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 static int isi_g_fmt_vid_cap(struct file *file, void *priv,
diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 6dcc6c13a7540edbd30d9244511f784527a78cf0..3aed0e493c81f1aef1ac78bd20e1fd6f69d4bd6c 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -1801,8 +1801,6 @@ static void unicam_buffer_queue(struct vb2_buffer *vb)
 
 static const struct vb2_ops unicam_video_qops = {
 	.queue_setup		= unicam_queue_setup,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 	.buf_prepare		= unicam_buffer_prepare,
 	.start_streaming	= unicam_start_streaming,
 	.stop_streaming		= unicam_stop_streaming,
diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index c3afd63edbb2a0781b9cdb5d11937d229914ae91..289a076c3bcc776faf923c24eaa0ebe3e891ee79 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -2171,8 +2171,6 @@ static const struct vb2_ops coda_qops = {
 	.buf_queue		= coda_buf_queue,
 	.start_streaming	= coda_start_streaming,
 	.stop_streaming		= coda_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 static int coda_s_ctrl(struct v4l2_ctrl *ctrl)
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 99e929aab8709f700e34cac625d5d70a382bd6dd..d3ff420c52ce1c30ef2b50993a295c53f72e1183 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1475,8 +1475,6 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 
 static const struct vb2_ops wave5_vpu_dec_vb2_ops = {
 	.queue_setup = wave5_vpu_dec_queue_setup,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.buf_queue = wave5_vpu_dec_buf_queue,
 	.start_streaming = wave5_vpu_dec_start_streaming,
 	.stop_streaming = wave5_vpu_dec_stop_streaming,
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 4e1c8a4e72728b769dcd216c92803a61fd3f4515..1e5fc5f8b856c5329b2c6007649285a28749b6aa 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1471,8 +1471,6 @@ static void wave5_vpu_enc_stop_streaming(struct vb2_queue *q)
 
 static const struct vb2_ops wave5_vpu_enc_vb2_ops = {
 	.queue_setup = wave5_vpu_enc_queue_setup,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.buf_queue = wave5_vpu_enc_buf_queue,
 	.start_streaming = wave5_vpu_enc_start_streaming,
 	.stop_streaming = wave5_vpu_enc_stop_streaming,
diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index 25044f15672e9b95265c1c04c82f66c6622a7520..c194f830577f9a2ed313e76f536e5d078729a3a3 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -1593,8 +1593,6 @@ static const struct vb2_ops e5010_video_ops = {
 	.buf_finish = e5010_buf_finish,
 	.buf_prepare = e5010_buf_prepare,
 	.buf_out_validate = e5010_buf_out_validate,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.start_streaming = e5010_start_streaming,
 	.stop_streaming = e5010_stop_streaming,
 };
diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index b8b1cf0665ab60786585d2dd7d0cb2caa4ba2a84..bef1e7137f23f02ef0005058c59fb712ba467cea 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -1504,8 +1504,6 @@ static const struct vb2_ops pxac_vb2_ops = {
 	.buf_cleanup		= pxac_vb2_cleanup,
 	.start_streaming	= pxac_vb2_start_streaming,
 	.stop_streaming		= pxac_vb2_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 static int pxa_camera_init_videobuf2(struct pxa_camera_dev *pcdev)
diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index 7d331c37525a4aa98ec02d2d477ef7d622e87664..5188f31890966735c6eba990587627f43ff84378 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -784,8 +784,6 @@ static const struct vb2_ops deinterlace_qops = {
 	.queue_setup	 = deinterlace_queue_setup,
 	.buf_prepare	 = deinterlace_buf_prepare,
 	.buf_queue	 = deinterlace_buf_queue,
-	.wait_prepare	 = vb2_ops_wait_prepare,
-	.wait_finish	 = vb2_ops_wait_finish,
 };
 
 static int queue_init(void *priv, struct vb2_queue *src_vq,
diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media/platform/marvell/mcam-core.c
index c81593c969e057f7efb24666f48f6ac9fdf06ed1..9ec01228f907311f1034523f06a2704a3b70b902 100644
--- a/drivers/media/platform/marvell/mcam-core.c
+++ b/drivers/media/platform/marvell/mcam-core.c
@@ -1203,8 +1203,6 @@ static const struct vb2_ops mcam_vb2_ops = {
 	.buf_queue		= mcam_vb_buf_queue,
 	.start_streaming	= mcam_vb_start_streaming,
 	.stop_streaming		= mcam_vb_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 
@@ -1267,8 +1265,6 @@ static const struct vb2_ops mcam_vb2_sg_ops = {
 	.buf_cleanup		= mcam_vb_sg_buf_cleanup,
 	.start_streaming	= mcam_vb_start_streaming,
 	.stop_streaming		= mcam_vb_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 #endif /* MCAM_MODE_DMA_SG */
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index a5bf75eb8b221245b53a2fc08d5514b6ba9d25f0..834d2a354692df120b81ee0bef7f816a4529a2f4 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -884,8 +884,6 @@ static const struct vb2_ops mtk_jpeg_dec_qops = {
 	.queue_setup        = mtk_jpeg_queue_setup,
 	.buf_prepare        = mtk_jpeg_buf_prepare,
 	.buf_queue          = mtk_jpeg_dec_buf_queue,
-	.wait_prepare       = vb2_ops_wait_prepare,
-	.wait_finish        = vb2_ops_wait_finish,
 	.stop_streaming     = mtk_jpeg_dec_stop_streaming,
 };
 
@@ -893,8 +891,6 @@ static const struct vb2_ops mtk_jpeg_enc_qops = {
 	.queue_setup        = mtk_jpeg_queue_setup,
 	.buf_prepare        = mtk_jpeg_buf_prepare,
 	.buf_queue          = mtk_jpeg_enc_buf_queue,
-	.wait_prepare       = vb2_ops_wait_prepare,
-	.wait_finish        = vb2_ops_wait_finish,
 	.stop_streaming     = mtk_jpeg_enc_stop_streaming,
 };
 
diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index f14779e7596e51057079472bf57588813ff3c39d..28c998bd3a81c440bc273ba0a09bf31e3460d8e1 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -584,8 +584,6 @@ static const struct vb2_ops mtk_mdp_m2m_qops = {
 	.buf_queue	 = mtk_mdp_m2m_buf_queue,
 	.stop_streaming	 = mtk_mdp_m2m_stop_streaming,
 	.start_streaming = mtk_mdp_m2m_start_streaming,
-	.wait_prepare	 = vb2_ops_wait_prepare,
-	.wait_finish	 = vb2_ops_wait_finish,
 };
 
 static int mtk_mdp_m2m_querycap(struct file *file, void *fh,
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
index 0e69128a3772c38135ab8348063ae1306e7155c9..59ce5cce069836a6902df686f4dd91b13fa729f2 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
@@ -266,8 +266,6 @@ static void mdp_m2m_buf_queue(struct vb2_buffer *vb)
 
 static const struct vb2_ops mdp_m2m_qops = {
 	.queue_setup	= mdp_m2m_queue_setup,
-	.wait_prepare	= vb2_ops_wait_prepare,
-	.wait_finish	= vb2_ops_wait_finish,
 	.buf_prepare	= mdp_m2m_buf_prepare,
 	.start_streaming = mdp_m2m_start_streaming,
 	.stop_streaming	= mdp_m2m_stop_streaming,
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index e62c1c18758bb18f518de88633995bcf4955781d..aa9bdee7a96ca97bd92846edd79643b428ff5948 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -598,8 +598,6 @@ static void mtk_init_vdec_params(struct mtk_vcodec_dec_ctx *ctx)
 static const struct vb2_ops mtk_vdec_frame_vb2_ops = {
 	.queue_setup = vb2ops_vdec_queue_setup,
 	.buf_prepare = vb2ops_vdec_buf_prepare,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.start_streaming = vb2ops_vdec_start_streaming,
 
 	.buf_queue = vb2ops_vdec_stateful_buf_queue,
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 3307dc15fc1dfee96362239f2096190c57a0be10..afa224da0f4165cf5701d6861f1f787c6317bfe4 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -856,8 +856,6 @@ static int vb2ops_vdec_out_buf_validate(struct vb2_buffer *vb)
 
 static const struct vb2_ops mtk_vdec_request_vb2_ops = {
 	.queue_setup	= vb2ops_vdec_queue_setup,
-	.wait_prepare	= vb2_ops_wait_prepare,
-	.wait_finish	= vb2_ops_wait_finish,
 	.start_streaming	= vb2ops_vdec_start_streaming,
 	.stop_streaming	= vb2ops_vdec_stop_streaming,
 
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index 7eaf0e24c9fc41bf8f431c885417ff348299c2eb..a01dc25a769911cd85a8d19c58e0c0a12b92ad50 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -1009,8 +1009,6 @@ static const struct vb2_ops mtk_venc_vb2_ops = {
 	.buf_out_validate	= vb2ops_venc_buf_out_validate,
 	.buf_prepare		= vb2ops_venc_buf_prepare,
 	.buf_queue		= vb2ops_venc_buf_queue,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 	.start_streaming	= vb2ops_venc_start_streaming,
 	.stop_streaming		= vb2ops_venc_stop_streaming,
 };
diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 28e56f6a695da2a6e4035fbe99b80ff65e95517e..a7cdc743fda71db0ffbf499cb4b9ca18c9e7abf2 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -465,8 +465,6 @@ static void isc_buffer_queue(struct vb2_buffer *vb)
 
 static const struct vb2_ops isc_vb2_ops = {
 	.queue_setup		= isc_queue_setup,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 	.buf_prepare		= isc_buffer_prepare,
 	.start_streaming	= isc_start_streaming,
 	.stop_streaming		= isc_stop_streaming,
diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 3b527029cbbbb22e77724df8557d4944924c3939..4f5d75645b2bb94669d976f9bfe7a9870f92c481 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1558,8 +1558,6 @@ static const struct regmap_config npcm_video_ece_regmap_cfg = {
 
 static const struct vb2_ops npcm_video_vb2_ops = {
 	.queue_setup = npcm_video_queue_setup,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.buf_prepare = npcm_video_buf_prepare,
 	.buf_finish = npcm_video_buf_finish,
 	.start_streaming = npcm_video_start_streaming,
diff --git a/drivers/media/platform/nvidia/tegra-vde/v4l2.c b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
index ebf882198eeeb71e316a2d10985067fb897532e8..e3726cab0c82c92cf0d552b8e8061fd22badfa90 100644
--- a/drivers/media/platform/nvidia/tegra-vde/v4l2.c
+++ b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
@@ -328,8 +328,6 @@ static const struct vb2_ops tegra_qops = {
 	.buf_request_complete = tegra_buf_request_complete,
 	.start_streaming = tegra_start_streaming,
 	.stop_streaming = tegra_stop_streaming,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 };
 
 static int tegra_queue_init(void *priv,
diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 54ebf59df682e067a5035c5ff399091642c77c97..66582e7f92fc6c0751afcc302dfe94f049a88b87 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -558,8 +558,6 @@ static const struct vb2_ops dw100_qops = {
 	.buf_queue	 = dw100_buf_queue,
 	.start_streaming = dw100_start_streaming,
 	.stop_streaming  = dw100_stop_streaming,
-	.wait_prepare	 = vb2_ops_wait_prepare,
-	.wait_finish	 = vb2_ops_wait_finish,
 };
 
 static int dw100_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index d8e946aebba276139245de1475b4c54a9fc381ac..7f5fe551179b9eb27a3e6846f57d083dd5323ffc 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -1965,8 +1965,6 @@ static int mxc_jpeg_buf_prepare(struct vb2_buffer *vb)
 
 static const struct vb2_ops mxc_jpeg_qops = {
 	.queue_setup		= mxc_jpeg_queue_setup,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 	.buf_out_validate	= mxc_jpeg_buf_out_validate,
 	.buf_prepare		= mxc_jpeg_buf_prepare,
 	.start_streaming	= mxc_jpeg_start_streaming,
diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index e696d377960f9a2c554db2ad2956e8763fdfbead..7f8ffbac582fcf6a968e5ab000827d7086c18261 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -1606,8 +1606,6 @@ static const struct vb2_ops pxp_qops = {
 	.buf_queue	 = pxp_buf_queue,
 	.start_streaming = pxp_start_streaming,
 	.stop_streaming  = pxp_stop_streaming,
-	.wait_prepare	 = vb2_ops_wait_prepare,
-	.wait_finish	 = vb2_ops_wait_finish,
 };
 
 static int queue_init(void *priv, struct vb2_queue *src_vq,
diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 08e36b7bab59ebd4b2b2ed77158055f86429adf1..34a92642bbfe7b7ce9c85fbaf346c6f595425cc9 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1507,8 +1507,6 @@ static const struct vb2_ops imx7_csi_video_qops = {
 	.buf_init        = imx7_csi_video_buf_init,
 	.buf_prepare	 = imx7_csi_video_buf_prepare,
 	.buf_queue	 = imx7_csi_video_buf_queue,
-	.wait_prepare	 = vb2_ops_wait_prepare,
-	.wait_finish	 = vb2_ops_wait_finish,
 	.start_streaming = imx7_csi_video_start_streaming,
 	.stop_streaming  = imx7_csi_video_stop_streaming,
 };
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 9745d6219a1667f28c2b290ded1c7739bee8c2ba..794050a6a919b8d108e4585d6be5ffd519e1311f 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -269,8 +269,6 @@ static const struct vb2_ops mxc_isi_m2m_vb2_qops = {
 	.buf_init		= mxc_isi_m2m_vb2_buffer_init,
 	.buf_prepare		= mxc_isi_m2m_vb2_buffer_prepare,
 	.buf_queue		= mxc_isi_m2m_vb2_buffer_queue,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 	.start_streaming	= mxc_isi_m2m_vb2_start_streaming,
 	.stop_streaming		= mxc_isi_m2m_vb2_stop_streaming,
 };
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 4091f1c0e78bdca91e66d3d63e96da0e3d2ad5af..c0ba34ea82fd799a4efbd723f6cd459ca1572283 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -987,8 +987,6 @@ static const struct vb2_ops mxc_isi_vb2_qops = {
 	.buf_init		= mxc_isi_vb2_buffer_init,
 	.buf_prepare		= mxc_isi_vb2_buffer_prepare,
 	.buf_queue		= mxc_isi_vb2_buffer_queue,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 	.start_streaming	= mxc_isi_vb2_start_streaming,
 	.stop_streaming		= mxc_isi_vb2_stop_streaming,
 };
diff --git a/drivers/media/platform/nxp/mx2_emmaprp.c b/drivers/media/platform/nxp/mx2_emmaprp.c
index bcad0aed7206e28651b54caf8d456d748aeb9abc..0c6cc120fd2a443db4dbc583f2cdb1cfd61b6a7e 100644
--- a/drivers/media/platform/nxp/mx2_emmaprp.c
+++ b/drivers/media/platform/nxp/mx2_emmaprp.c
@@ -677,8 +677,6 @@ static const struct vb2_ops emmaprp_qops = {
 	.queue_setup	 = emmaprp_queue_setup,
 	.buf_prepare	 = emmaprp_buf_prepare,
 	.buf_queue	 = emmaprp_buf_queue,
-	.wait_prepare	 = vb2_ops_wait_prepare,
-	.wait_finish	 = vb2_ops_wait_finish,
 };
 
 static int queue_init(void *priv, struct vb2_queue *src_vq,
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 3b8fc31d957c77fcfd19790f066b4025b1a7ea51..aa021fd5e1233ba413acc9fdbac6b677619079b4 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -310,8 +310,6 @@ static void video_stop_streaming(struct vb2_queue *q)
 
 static const struct vb2_ops msm_video_vb2_q_ops = {
 	.queue_setup     = video_queue_setup,
-	.wait_prepare    = vb2_ops_wait_prepare,
-	.wait_finish     = vb2_ops_wait_finish,
 	.buf_init        = video_buf_init,
 	.buf_prepare     = video_buf_prepare,
 	.buf_queue       = video_buf_queue,
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 6252a6b3d4ba6d49b343bb53dfb7b0e683410bb4..fd4c4934c910383539c59948df9fdc39f62a2d1f 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1390,8 +1390,6 @@ static const struct vb2_ops vdec_vb2_ops = {
 	.buf_prepare = venus_helper_vb2_buf_prepare,
 	.start_streaming = vdec_start_streaming,
 	.stop_streaming = vdec_stop_streaming,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.buf_queue = vdec_vb2_buf_queue,
 };
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 322a7737e2c7befdebcdf147955ba1d5ba8b42e2..b1093683c3063807e597a465fd1f80c2bf0d76f1 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1319,8 +1319,6 @@ static const struct vb2_ops venc_vb2_ops = {
 	.buf_prepare = venus_helper_vb2_buf_prepare,
 	.start_streaming = venc_start_streaming,
 	.stop_streaming = venus_helper_vb2_stop_streaming,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.buf_queue = venc_vb2_buf_queue,
 };
 
diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 89e36e8219ed8b7cc4040ae1f33ec21bb12778d6..7596ae1f7de6671484d4d351015b234829f642d4 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -964,8 +964,6 @@ static const struct vb2_ops pispbe_node_queue_ops = {
 	.buf_queue = pispbe_node_buffer_queue,
 	.start_streaming = pispbe_node_start_streaming,
 	.stop_streaming = pispbe_node_stop_streaming,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 };
 
 static const struct v4l2_file_operations pispbe_fops = {
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 21d5b2815e86a66a1786901586f18f5474b94ad0..39cf22376fbe0a4c0ea761272d3c8c302a6e51c0 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -1529,8 +1529,6 @@ static const struct vb2_ops rvin_qops = {
 	.buf_queue		= rvin_buffer_queue,
 	.start_streaming	= rvin_start_streaming_vq,
 	.stop_streaming		= rvin_stop_streaming_vq,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 void rvin_dma_unregister(struct rvin_dev *vin)
diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index a7b882975440d0ae0e81fe1b20d1d02affcf97f1..fc8b6bbef793c64e63f8750eadbcf0cbe43f9c41 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -861,8 +861,6 @@ static const struct vb2_ops rcar_drif_vb2_ops = {
 	.buf_queue              = rcar_drif_buf_queue,
 	.start_streaming        = rcar_drif_start_streaming,
 	.stop_streaming         = rcar_drif_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 static int rcar_drif_querycap(struct file *file, void *fh,
diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/platform/renesas/rcar_fdp1.c
index 5827cc33ab50fd05f1e7312ca3f6de070d15c76d..5d453a7a89889fa3fd115da5f87b4bb24554a3c6 100644
--- a/drivers/media/platform/renesas/rcar_fdp1.c
+++ b/drivers/media/platform/renesas/rcar_fdp1.c
@@ -2032,8 +2032,6 @@ static const struct vb2_ops fdp1_qops = {
 	.buf_queue	 = fdp1_buf_queue,
 	.start_streaming = fdp1_start_streaming,
 	.stop_streaming  = fdp1_stop_streaming,
-	.wait_prepare	 = vb2_ops_wait_prepare,
-	.wait_finish	 = vb2_ops_wait_finish,
 };
 
 static int queue_init(void *priv, struct vb2_queue *src_vq,
diff --git a/drivers/media/platform/renesas/rcar_jpu.c b/drivers/media/platform/renesas/rcar_jpu.c
index 881df8a8a1ac8521d615512320d963debc6a040a..1421364d2d14d2dac3cd5afd63377d9005926044 100644
--- a/drivers/media/platform/renesas/rcar_jpu.c
+++ b/drivers/media/platform/renesas/rcar_jpu.c
@@ -1171,8 +1171,6 @@ static const struct vb2_ops jpu_qops = {
 	.buf_finish		= jpu_buf_finish,
 	.start_streaming	= jpu_start_streaming,
 	.stop_streaming		= jpu_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 static int jpu_queue_init(void *priv, struct vb2_queue *src_vq,
diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
index cacfa3951c4d52b34c7eb9d587540d744f519804..8cceafe491b1bec6c10ced8e0336b5575db88297 100644
--- a/drivers/media/platform/renesas/renesas-ceu.c
+++ b/drivers/media/platform/renesas/renesas-ceu.c
@@ -761,8 +761,6 @@ static const struct vb2_ops ceu_vb2_ops = {
 	.queue_setup		= ceu_vb2_setup,
 	.buf_queue		= ceu_vb2_queue,
 	.buf_prepare		= ceu_vb2_prepare,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 	.start_streaming	= ceu_start_streaming,
 	.stop_streaming		= ceu_stop_streaming,
 };
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index b16b8af6e8f8cb067fbdd71cf9b49cb4784eaaea..128694c0b144181cdfb26062cd2d92c831d884d1 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -712,8 +712,6 @@ static const struct vb2_ops rzg2l_cru_qops = {
 	.buf_queue		= rzg2l_cru_buffer_queue,
 	.start_streaming	= rzg2l_cru_start_streaming_vq,
 	.stop_streaming		= rzg2l_cru_stop_streaming_vq,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru)
diff --git a/drivers/media/platform/renesas/sh_vou.c b/drivers/media/platform/renesas/sh_vou.c
index d440e54599195bf72bbeeeff221138a3d3902e05..4ad7ae188d5b25ab383d664898f855a4819c1a85 100644
--- a/drivers/media/platform/renesas/sh_vou.c
+++ b/drivers/media/platform/renesas/sh_vou.c
@@ -360,8 +360,6 @@ static const struct vb2_ops sh_vou_qops = {
 	.buf_queue		= sh_vou_buf_queue,
 	.start_streaming	= sh_vou_start_streaming,
 	.stop_streaming		= sh_vou_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 /* Video IOCTLs */
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
index 9c2d4c91bfadb8f19773fca511014c29f326c41d..c762202877babdc651a63997f4340f6a37a301ac 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -155,8 +155,6 @@ static const struct vb2_ops histo_video_queue_qops = {
 	.queue_setup = histo_queue_setup,
 	.buf_prepare = histo_buffer_prepare,
 	.buf_queue = histo_buffer_queue,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.start_streaming = histo_start_streaming,
 	.stop_streaming = histo_stop_streaming,
 };
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index e728f9f5160e42f2cf8956cd4180c0ce2162073b..03f4efd6b82bd76419ff048f24c82ecce44f321c 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -873,8 +873,6 @@ static const struct vb2_ops vsp1_video_queue_qops = {
 	.queue_setup = vsp1_video_queue_setup,
 	.buf_prepare = vsp1_video_buffer_prepare,
 	.buf_queue = vsp1_video_buffer_queue,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.start_streaming = vsp1_video_start_streaming,
 	.stop_streaming = vsp1_video_stop_streaming,
 };
diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 70808049d2e810dadc76d2adfa366ec4f4d046a9..8a48e9d91f96f1afbcc5367e6bd00898729a3be2 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -218,8 +218,6 @@ const struct vb2_ops rga_qops = {
 	.buf_prepare = rga_buf_prepare,
 	.buf_queue = rga_buf_queue,
 	.buf_cleanup = rga_buf_cleanup,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.start_streaming = rga_buf_start_streaming,
 	.stop_streaming = rga_buf_stop_streaming,
 };
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 2bddb4fa8a5cd163f383a9baa9fc3e2ca1ea87b8..02339cd94486ab2b669c966895c83d7dcc2d2b94 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1203,8 +1203,6 @@ static const struct vb2_ops rkisp1_vb2_ops = {
 	.buf_init = rkisp1_vb2_buf_init,
 	.buf_queue = rkisp1_vb2_buf_queue,
 	.buf_prepare = rkisp1_vb2_buf_prepare,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.stop_streaming = rkisp1_vb2_stop_streaming,
 	.start_streaming = rkisp1_vb2_start_streaming,
 };
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 320581a9f866e919c1bf0cf64d34d20ea08c02d3..b28f4140c8a309a3231d44d825c6461e3ecb2a44 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2704,8 +2704,6 @@ static const struct vb2_ops rkisp1_params_vb2_ops = {
 	.queue_setup = rkisp1_params_vb2_queue_setup,
 	.buf_init = rkisp1_params_vb2_buf_init,
 	.buf_cleanup = rkisp1_params_vb2_buf_cleanup,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.buf_queue = rkisp1_params_vb2_buf_queue,
 	.buf_prepare = rkisp1_params_vb2_buf_prepare,
 	.stop_streaming = rkisp1_params_vb2_stop_streaming,
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
index a502719e916a92bcf4cbc53bc0895e591e23a894..d5fdb8f82dc78b0143f71d76f36817db389921b7 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
@@ -150,8 +150,6 @@ static const struct vb2_ops rkisp1_stats_vb2_ops = {
 	.queue_setup = rkisp1_stats_vb2_queue_setup,
 	.buf_queue = rkisp1_stats_vb2_buf_queue,
 	.buf_prepare = rkisp1_stats_vb2_buf_prepare,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.stop_streaming = rkisp1_stats_vb2_stop_streaming,
 };
 
diff --git a/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c b/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
index b7854ce5fb8e34f51b70f7392caf2ccb1cf0d7ba..4bda1c369c44c41265a42f2bab6f70ec532881bd 100644
--- a/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
+++ b/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
@@ -276,8 +276,6 @@ static const struct vb2_ops gsc_m2m_qops = {
 	.queue_setup	 = gsc_m2m_queue_setup,
 	.buf_prepare	 = gsc_m2m_buf_prepare,
 	.buf_queue	 = gsc_m2m_buf_queue,
-	.wait_prepare	 = vb2_ops_wait_prepare,
-	.wait_finish	 = vb2_ops_wait_finish,
 	.stop_streaming	 = gsc_m2m_stop_streaming,
 	.start_streaming = gsc_m2m_start_streaming,
 };
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
index ffa4ea21387da39136d9dcfdb02a6a7cfe6edebc..c3c2e474a18a725fd196ae29d107bc056d4a0932 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
@@ -455,8 +455,6 @@ static const struct vb2_ops fimc_capture_qops = {
 	.queue_setup		= queue_setup,
 	.buf_prepare		= buffer_prepare,
 	.buf_queue		= buffer_queue,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 	.start_streaming	= start_streaming,
 	.stop_streaming		= stop_streaming,
 };
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c b/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
index 06c4352562b38fb7cce395b31698f3798b06bc77..ad219ac1b95137a703ea709d12139cca6b2e2332 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
@@ -255,8 +255,6 @@ static const struct vb2_ops isp_video_capture_qops = {
 	.queue_setup	 = isp_video_capture_queue_setup,
 	.buf_prepare	 = isp_video_capture_buffer_prepare,
 	.buf_queue	 = isp_video_capture_buffer_queue,
-	.wait_prepare	 = vb2_ops_wait_prepare,
-	.wait_finish	 = vb2_ops_wait_finish,
 	.start_streaming = isp_video_capture_start_streaming,
 	.stop_streaming	 = isp_video_capture_stop_streaming,
 };
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
index e362719612d2f88c32f284ba97d614eed74009ab..f23e51e3da2fe520683a556b2e912e1e3cedff95 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
@@ -441,8 +441,6 @@ static const struct vb2_ops fimc_lite_qops = {
 	.queue_setup	 = queue_setup,
 	.buf_prepare	 = buffer_prepare,
 	.buf_queue	 = buffer_queue,
-	.wait_prepare	 = vb2_ops_wait_prepare,
-	.wait_finish	 = vb2_ops_wait_finish,
 	.start_streaming = start_streaming,
 	.stop_streaming	 = stop_streaming,
 };
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c b/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
index 199997eec1cc25bbc3872c960e323128fac430d2..951433c8e92a5b75bad59f2e0dbf7d56f6726dee 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
@@ -216,8 +216,6 @@ static const struct vb2_ops fimc_qops = {
 	.queue_setup	 = fimc_queue_setup,
 	.buf_prepare	 = fimc_buf_prepare,
 	.buf_queue	 = fimc_buf_queue,
-	.wait_prepare	 = vb2_ops_wait_prepare,
-	.wait_finish	 = vb2_ops_wait_finish,
 	.stop_streaming	 = stop_streaming,
 	.start_streaming = start_streaming,
 };
diff --git a/drivers/media/platform/samsung/s3c-camif/camif-capture.c b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
index be58260ea67e797f44326c7d8140aeb66da1d8b9..bd1149e8abc2d2fb923f5a11368c388f6a23dbd6 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
@@ -525,8 +525,6 @@ static const struct vb2_ops s3c_camif_qops = {
 	.queue_setup	 = queue_setup,
 	.buf_prepare	 = buffer_prepare,
 	.buf_queue	 = buffer_queue,
-	.wait_prepare	 = vb2_ops_wait_prepare,
-	.wait_finish	 = vb2_ops_wait_finish,
 	.start_streaming = start_streaming,
 	.stop_streaming	 = stop_streaming,
 };
diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media/platform/samsung/s5p-g2d/g2d.c
index e5e55a41bf3e853d82001074ba285224988c4735..ffed16a34493be2edbdaee13619467417487c1e7 100644
--- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
+++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
@@ -133,8 +133,6 @@ static const struct vb2_ops g2d_qops = {
 	.queue_setup	= g2d_queue_setup,
 	.buf_prepare	= g2d_buf_prepare,
 	.buf_queue	= g2d_buf_queue,
-	.wait_prepare	= vb2_ops_wait_prepare,
-	.wait_finish	= vb2_ops_wait_finish,
 };
 
 static int queue_init(void *priv, struct vb2_queue *src_vq,
diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
index 30a6144f2c770db9197e053871971eed2d1eb331..71d7a1d853a87e2eff27102927a42bdae757619c 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
@@ -2590,8 +2590,6 @@ static const struct vb2_ops s5p_jpeg_qops = {
 	.queue_setup		= s5p_jpeg_queue_setup,
 	.buf_prepare		= s5p_jpeg_buf_prepare,
 	.buf_queue		= s5p_jpeg_buf_queue,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 	.start_streaming	= s5p_jpeg_start_streaming,
 	.stop_streaming		= s5p_jpeg_stop_streaming,
 };
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
index 91e102d4ec4e2ad9f432c662561e565de6cdc39e..3efbc336790629425c2a71e9feee8f073db55790 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
@@ -1161,8 +1161,6 @@ static void s5p_mfc_buf_queue(struct vb2_buffer *vb)
 
 static const struct vb2_ops s5p_mfc_dec_qops = {
 	.queue_setup		= s5p_mfc_queue_setup,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 	.buf_init		= s5p_mfc_buf_init,
 	.start_streaming	= s5p_mfc_start_streaming,
 	.stop_streaming		= s5p_mfc_stop_streaming,
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
index 81cbb36fb382c0a0644730e7eb87b61884a8ed03..6c603dcd56649fcabe161173c64b9ea8bd055b93 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
@@ -2652,8 +2652,6 @@ static void s5p_mfc_buf_queue(struct vb2_buffer *vb)
 
 static const struct vb2_ops s5p_mfc_enc_qops = {
 	.queue_setup		= s5p_mfc_queue_setup,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 	.buf_init		= s5p_mfc_buf_init,
 	.buf_prepare		= s5p_mfc_buf_prepare,
 	.start_streaming	= s5p_mfc_start_streaming,
diff --git a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
index 3b0066cf2eb0899e74a227554129839656bac6f1..73ad66ed20f2e3201e8ceb1d2ff9aff1ad873c92 100644
--- a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
@@ -531,8 +531,6 @@ static const struct vb2_ops bdisp_qops = {
 	.queue_setup     = bdisp_queue_setup,
 	.buf_prepare     = bdisp_buf_prepare,
 	.buf_queue       = bdisp_buf_queue,
-	.wait_prepare    = vb2_ops_wait_prepare,
-	.wait_finish     = vb2_ops_wait_finish,
 	.stop_streaming  = bdisp_stop_streaming,
 	.start_streaming = bdisp_start_streaming,
 };
diff --git a/drivers/media/platform/st/sti/delta/delta-v4l2.c b/drivers/media/platform/st/sti/delta/delta-v4l2.c
index fdee7fae3a20133b002932c80372ab92c83c7ae5..196e6a40335d14898ff7abbb38d2de2f5bcf6789 100644
--- a/drivers/media/platform/st/sti/delta/delta-v4l2.c
+++ b/drivers/media/platform/st/sti/delta/delta-v4l2.c
@@ -1559,8 +1559,6 @@ static const struct vb2_ops delta_vb2_au_ops = {
 	.queue_setup = delta_vb2_au_queue_setup,
 	.buf_prepare = delta_vb2_au_prepare,
 	.buf_queue = delta_vb2_au_queue,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.start_streaming = delta_vb2_au_start_streaming,
 	.stop_streaming = delta_vb2_au_stop_streaming,
 };
@@ -1570,8 +1568,6 @@ static const struct vb2_ops delta_vb2_frame_ops = {
 	.buf_prepare = delta_vb2_frame_prepare,
 	.buf_finish = delta_vb2_frame_finish,
 	.buf_queue = delta_vb2_frame_queue,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.stop_streaming = delta_vb2_frame_stop_streaming,
 };
 
diff --git a/drivers/media/platform/st/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
index 31a94300d6457b8da689e26004d906c11588d8c0..5366c0f92549bb090967a1337ce55d0b0f1d76ce 100644
--- a/drivers/media/platform/st/sti/hva/hva-v4l2.c
+++ b/drivers/media/platform/st/sti/hva/hva-v4l2.c
@@ -1114,8 +1114,6 @@ static const struct vb2_ops hva_qops = {
 	.buf_queue		= hva_buf_queue,
 	.start_streaming	= hva_start_streaming,
 	.stop_streaming		= hva_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 /*
diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index 643bda7f9f7d10a4a6b282babfb1504f85c3af5c..b6c8400fb92da974d95bd74770bd8196b5be0dc0 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -186,8 +186,6 @@ static const struct vb2_ops dma2d_qops = {
 	.buf_queue	= dma2d_buf_queue,
 	.start_streaming = dma2d_start_streaming,
 	.stop_streaming  = dma2d_stop_streaming,
-	.wait_prepare	= vb2_ops_wait_prepare,
-	.wait_finish	= vb2_ops_wait_finish,
 };
 
 static int queue_init(void *priv, struct vb2_queue *src_vq,
diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index a28db89e4b50f739fb5f5f821ac4176bd856b4f5..9b699ee2b1e0614c22f68da2709b54c85e5024bd 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -898,8 +898,6 @@ static const struct vb2_ops dcmi_video_qops = {
 	.buf_queue		= dcmi_buf_queue,
 	.start_streaming	= dcmi_start_streaming,
 	.stop_streaming		= dcmi_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 static int dcmi_g_fmt_vid_cap(struct file *file, void *priv,
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 9f768f011fa25a0981cd0d1d3f114b02e58223d4..7edd49bfe7e5b8d6962777291f82e21131f1fae2 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -625,12 +625,6 @@ static const struct vb2_ops dcmipp_bytecap_qops = {
 	.buf_prepare		= dcmipp_bytecap_buf_prepare,
 	.buf_queue		= dcmipp_bytecap_buf_queue,
 	.queue_setup		= dcmipp_bytecap_queue_setup,
-	/*
-	 * Since q->lock is set we can use the standard
-	 * vb2_ops_wait_prepare/finish helper functions.
-	 */
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 static void dcmipp_bytecap_release(struct video_device *vdev)
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
index d1371e13011374ef78874f723a424ed8bb42ed79..e911c7f7acc5245b92ce20a9c2f8a16516eeb901 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
@@ -371,8 +371,6 @@ static const struct vb2_ops sun4i_csi_qops = {
 	.buf_queue		= sun4i_csi_buffer_queue,
 	.start_streaming	= sun4i_csi_start_streaming,
 	.stop_streaming		= sun4i_csi_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 static irqreturn_t sun4i_csi_irq(int irq, void *data)
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index 14c0dc827c5200d854022680e3867a2604e863ad..76356bc7f10e396253b24a3a73d942d6a045942f 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -657,8 +657,6 @@ static const struct vb2_ops sun6i_csi_capture_queue_ops = {
 	.buf_queue		= sun6i_csi_capture_buffer_queue,
 	.start_streaming	= sun6i_csi_capture_start_streaming,
 	.stop_streaming		= sun6i_csi_capture_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 /* V4L2 Device */
diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index c55b1761b089778b3ace385da331fa81585ec3d6..3e7f2df70408b882f6c9d47b66a8e092f6960927 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -659,8 +659,6 @@ static const struct vb2_ops deinterlace_qops = {
 	.buf_queue		= deinterlace_buf_queue,
 	.start_streaming	= deinterlace_start_streaming,
 	.stop_streaming		= deinterlace_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 static int deinterlace_queue_init(void *priv, struct vb2_queue *src_vq,
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
index d60d3496e5b4d6821e1dce42d7f79560a8485179..abd10b218aa1dc552004fe7ebcb815b3d6b8a43d 100644
--- a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
+++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
@@ -522,8 +522,6 @@ static const struct vb2_ops rotate_qops = {
 	.buf_queue		= rotate_buf_queue,
 	.start_streaming	= rotate_start_streaming,
 	.stop_streaming		= rotate_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 static int rotate_queue_init(void *priv, struct vb2_queue *src_vq,
diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index edbe0620ecaadf0b53852a6ebc5e983a33a171b9..44cdccb8937752964a0787d192d9b7fc0f5efbf9 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2079,8 +2079,6 @@ static long vpfe_ioctl_default(struct file *file, void *priv,
 }
 
 static const struct vb2_ops vpfe_video_qops = {
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 	.queue_setup		= vpfe_queue_setup,
 	.buf_prepare		= vpfe_buffer_prepare,
 	.buf_queue		= vpfe_buffer_queue,
diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index e1ba5dfc217e3ac9421cb749cce78c87c9e75a6c..e29743ae61e27ea6d11d3555aaf370d747fbbad9 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -808,8 +808,6 @@ static const struct vb2_ops cal_video_qops = {
 	.buf_queue		= cal_buffer_queue,
 	.start_streaming	= cal_start_streaming,
 	.stop_streaming		= cal_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 /* ------------------------------------------------------------------
diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index 8357450b3f01a7da387b8fcb46fe6de765f56568..d053972888d1b43161e99a04c4ca5e11664bf5b8 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -310,8 +310,6 @@ static const struct vb2_ops video_qops = {
 	.start_streaming	= vpif_start_streaming,
 	.stop_streaming		= vpif_stop_streaming,
 	.buf_queue		= vpif_buffer_queue,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 /**
diff --git a/drivers/media/platform/ti/davinci/vpif_display.c b/drivers/media/platform/ti/davinci/vpif_display.c
index bea47e5159de06a9ee537524dee97c7d136e564d..70c89549f4b61d79bb72157e722e1984a4fca68e 100644
--- a/drivers/media/platform/ti/davinci/vpif_display.c
+++ b/drivers/media/platform/ti/davinci/vpif_display.c
@@ -293,8 +293,6 @@ static void vpif_stop_streaming(struct vb2_queue *vq)
 
 static const struct vb2_ops video_qops = {
 	.queue_setup		= vpif_buffer_queue_setup,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 	.buf_prepare		= vpif_buffer_prepare,
 	.start_streaming	= vpif_start_streaming,
 	.stop_streaming		= vpif_stop_streaming,
diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index bd9c9e6ac573af2a564ef1c18feedec0544b64ec..9a4a72331b4f2d578d03b74f16f4c6625608510d 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -878,8 +878,6 @@ static const struct vb2_ops csi_vb2_qops = {
 	.buf_queue = ti_csi2rx_buffer_queue,
 	.start_streaming = ti_csi2rx_start_streaming,
 	.stop_streaming = ti_csi2rx_stop_streaming,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 };
 
 static int ti_csi2rx_init_vb2q(struct ti_csi2rx_dev *csi)
diff --git a/drivers/media/platform/ti/omap/omap_vout.c b/drivers/media/platform/ti/omap/omap_vout.c
index 85dca219042895b686a8c3b9f770f84186dbe478..a87d5030ac35ced841efa1d4e940b26594a8a275 100644
--- a/drivers/media/platform/ti/omap/omap_vout.c
+++ b/drivers/media/platform/ti/omap/omap_vout.c
@@ -1300,8 +1300,6 @@ static const struct vb2_ops omap_vout_vb2_ops = {
 	.buf_prepare		= omap_vout_vb2_prepare,
 	.start_streaming	= omap_vout_vb2_start_streaming,
 	.stop_streaming		= omap_vout_vb2_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 /* Init functions used during driver initialization */
diff --git a/drivers/media/platform/ti/vpe/vpe.c b/drivers/media/platform/ti/vpe/vpe.c
index bd2e97afd776121e5d0813fc722b136eb902f5ec..636d76ecebcd7e6f4e98d6fe4873bf98b0f0239e 100644
--- a/drivers/media/platform/ti/vpe/vpe.c
+++ b/drivers/media/platform/ti/vpe/vpe.c
@@ -2210,8 +2210,6 @@ static const struct vb2_ops vpe_qops = {
 	.queue_setup	 = vpe_queue_setup,
 	.buf_prepare	 = vpe_buf_prepare,
 	.buf_queue	 = vpe_buf_queue,
-	.wait_prepare	 = vb2_ops_wait_prepare,
-	.wait_finish	 = vb2_ops_wait_finish,
 	.start_streaming = vpe_start_streaming,
 	.stop_streaming  = vpe_stop_streaming,
 };
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 32f69c6c703bf4af680c92557f0a5f6d9f4c715f..2513adfbd82595632d5e797a71501153d557c5d1 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -1004,6 +1004,4 @@ const struct vb2_ops hantro_queue_ops = {
 	.buf_request_complete = hantro_buf_request_complete,
 	.start_streaming = hantro_start_streaming,
 	.stop_streaming = hantro_stop_streaming,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 };
diff --git a/drivers/media/platform/via/via-camera.c b/drivers/media/platform/via/via-camera.c
index 195e9bf1eedf69c0d27b3a0471a8354599e07853..5702eff664d4ef652b22aaeaaacbbd0e16a2e137 100644
--- a/drivers/media/platform/via/via-camera.c
+++ b/drivers/media/platform/via/via-camera.c
@@ -666,8 +666,6 @@ static const struct vb2_ops viacam_vb2_ops = {
 	.buf_prepare		= viacam_vb2_prepare,
 	.start_streaming	= viacam_vb2_start_streaming,
 	.stop_streaming		= viacam_vb2_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 /* --------------------------------------------------------------------------*/
diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index a1687b868a445228e33373fa7b268dd44ecebab7..18bfa6001909dfa6efc23b3ca432a39a1b316afc 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -458,8 +458,6 @@ static const struct vb2_ops xvip_dma_queue_qops = {
 	.queue_setup = xvip_dma_queue_setup,
 	.buf_prepare = xvip_dma_buffer_prepare,
 	.buf_queue = xvip_dma_buffer_queue,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.start_streaming = xvip_dma_start_streaming,
 	.stop_streaming = xvip_dma_stop_streaming,
 };

-- 
2.45.2


