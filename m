Return-Path: <linux-media+bounces-19620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6800F99D101
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 17:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC0C81F23A7D
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 15:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08971AB6E2;
	Mon, 14 Oct 2024 15:09:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467651AAE27
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 15:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728918578; cv=none; b=mblNyDfY0ygnRnzevxonYNQHuXWeNutNY4k2hTcdCBcRFBJsrrurqr2Rua404ejKlBs2jChC65hG+C8IbT8n79DN+9XAhsdUIj6nMCNTOXA8K6cLdiZkAFmWyDNUSJmS7beoiBkCKLwyuNq96h6M9kRRucL28nfBWDcAInoR4yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728918578; c=relaxed/simple;
	bh=zpbwigixApS+GWpV4p2ifg4BigntloHSRwRz67mkRuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yr2W12nRDKB7MRwzJYpl+PWRGYJrNYLV/2r3hDV8pLcw1F5oGIIJSI1u83vRqtgR6au6g6V5ezllmk0/c1XpC1O5ILHkteBK3pF5LRVPbMtPbflpkMp+ct0LtUGeglvFLHsq5+/ODWDIQTC+4EtIxQSSG+l3KmxVSn3RKIHMfiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3772C4CEC3;
	Mon, 14 Oct 2024 15:09:20 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
Date: Mon, 14 Oct 2024 17:06:36 +0200
Subject: [PATCH 09/10] staging: media: drop vb2_ops_wait_prepare/finish
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-vb2-wait-v1-9-8c3ee25c618c@xs4all.nl>
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
 drivers/staging/media/atomisp/pci/atomisp_fops.c          | 2 --
 drivers/staging/media/deprecated/atmel/atmel-isc-base.c   | 2 --
 drivers/staging/media/imx/imx-media-capture.c             | 2 --
 drivers/staging/media/imx/imx-media-csc-scaler.c          | 2 --
 drivers/staging/media/ipu3/ipu3-v4l2.c                    | 2 --
 drivers/staging/media/meson/vdec/vdec.c                   | 2 --
 drivers/staging/media/rkvdec/rkvdec.c                     | 2 --
 drivers/staging/media/starfive/camss/stf-video.c          | 2 --
 drivers/staging/media/sunxi/cedrus/cedrus_video.c         | 2 --
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c | 2 --
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c  | 2 --
 drivers/staging/media/tegra-video/vi.c                    | 2 --
 12 files changed, 24 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index b180fcbea9b1e6909cf3b6c2cf165684c6cf8667..50c4123ba006648db38c1e310bed4697d49615e0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -441,8 +441,6 @@ const struct vb2_ops atomisp_vb2_ops = {
 	.buf_queue		= atomisp_buf_queue,
 	.start_streaming	= atomisp_start_streaming,
 	.stop_streaming		= atomisp_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 static void atomisp_dev_init_struct(struct atomisp_device *isp)
diff --git a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
index 305b103153d7edbf0cdae70fcbb0b6c14432a975..fb9ee8547392b4ee768b39ce08f52488323bb6f9 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
@@ -477,8 +477,6 @@ static struct isc_format *find_format_by_fourcc(struct isc_device *isc,
 
 static const struct vb2_ops isc_vb2_ops = {
 	.queue_setup		= isc_queue_setup,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 	.buf_prepare		= isc_buffer_prepare,
 	.start_streaming	= isc_start_streaming,
 	.stop_streaming		= isc_stop_streaming,
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index efa7623b5cee1bbfa77654ad2604758d929a2045..e9cef7af000a91674aa2cfe750a399cae40ff9d6 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -768,8 +768,6 @@ static const struct vb2_ops capture_qops = {
 	.buf_init        = capture_buf_init,
 	.buf_prepare	 = capture_buf_prepare,
 	.buf_queue	 = capture_buf_queue,
-	.wait_prepare	 = vb2_ops_wait_prepare,
-	.wait_finish	 = vb2_ops_wait_finish,
 	.start_streaming = capture_start_streaming,
 	.stop_streaming  = capture_stop_streaming,
 };
diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index 95cca281e8a378c6244bd25d5b81c392712361aa..e5e08c6f79f222a86fbe528d84d5e9644fbbb63a 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -572,8 +572,6 @@ static const struct vb2_ops ipu_csc_scaler_qops = {
 	.queue_setup		= ipu_csc_scaler_queue_setup,
 	.buf_prepare		= ipu_csc_scaler_buf_prepare,
 	.buf_queue		= ipu_csc_scaler_buf_queue,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 	.start_streaming	= ipu_csc_scaler_start_streaming,
 	.stop_streaming		= ipu_csc_scaler_stop_streaming,
 };
diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index e7aee7e3db5bbdb8c0cb555e5d2a5c2e4ae0c161..ad6095bf717db6d3fc1cd19112884248a6b04fce 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -937,8 +937,6 @@ static const struct vb2_ops imgu_vb2_ops = {
 	.queue_setup = imgu_vb2_queue_setup,
 	.start_streaming = imgu_vb2_start_streaming,
 	.stop_streaming = imgu_vb2_stop_streaming,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 };
 
 /****************** v4l2_file_operations *****************/
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 5e5b296f93bab4faf01f1e4238057e072e540680..52185090129ba5a5c5f3d7747f7d00268375aa33 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -450,8 +450,6 @@ static const struct vb2_ops vdec_vb2_ops = {
 	.stop_streaming = vdec_stop_streaming,
 	.buf_queue = vdec_vb2_buf_queue,
 	.buf_prepare = vdec_vb2_buf_prepare,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 };
 
 static int
diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index ac398b5a97360446672a8a5c40ea05bcf222f557..f468af64bbef1c7e9019352508f95f5e2d2a083a 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -617,8 +617,6 @@ static const struct vb2_ops rkvdec_queue_ops = {
 	.buf_request_complete = rkvdec_buf_request_complete,
 	.start_streaming = rkvdec_start_streaming,
 	.stop_streaming = rkvdec_stop_streaming,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 };
 
 static int rkvdec_request_validate(struct media_request *req)
diff --git a/drivers/staging/media/starfive/camss/stf-video.c b/drivers/staging/media/starfive/camss/stf-video.c
index 989b5e82bae98fdbcec7b2b28f4a93bc7a8334f3..a0420eb6a0aa034fb0b1468951d84c8fe7bb1b56 100644
--- a/drivers/staging/media/starfive/camss/stf-video.c
+++ b/drivers/staging/media/starfive/camss/stf-video.c
@@ -321,8 +321,6 @@ static void video_stop_streaming(struct vb2_queue *q)
 
 static const struct vb2_ops stf_video_vb2_q_ops = {
 	.queue_setup     = video_queue_setup,
-	.wait_prepare    = vb2_ops_wait_prepare,
-	.wait_finish     = vb2_ops_wait_finish,
 	.buf_init        = video_buf_init,
 	.buf_prepare     = video_buf_prepare,
 	.buf_queue       = video_buf_queue,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index b00feaf4072c995b4e54ffa6c67bffe039be1f49..77f78266f406288cfd5aa666dd5e3409b5a770cf 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -570,8 +570,6 @@ static const struct vb2_ops cedrus_qops = {
 	.buf_request_complete	= cedrus_buf_request_complete,
 	.start_streaming	= cedrus_start_streaming,
 	.stop_streaming		= cedrus_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
index 0eea4c2c3627188cbe0de74839e37835fdfdbc35..24899f41dc1c12dbbe43b01d176b4ec9ce287f06 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
@@ -368,8 +368,6 @@ static const struct vb2_ops sun6i_isp_capture_queue_ops = {
 	.buf_queue		= sun6i_isp_capture_buffer_queue,
 	.start_streaming	= sun6i_isp_capture_start_streaming,
 	.stop_streaming		= sun6i_isp_capture_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 /* Video Device */
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
index 53d05e8a364bb7ed060a957034ef28ef91209fd1..3d95ed0b023e314ae189d20747868b962278b14e 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
@@ -379,8 +379,6 @@ static const struct vb2_ops sun6i_isp_params_queue_ops = {
 	.buf_queue		= sun6i_isp_params_buffer_queue,
 	.start_streaming	= sun6i_isp_params_start_streaming,
 	.stop_streaming		= sun6i_isp_params_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 /* Video Device */
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 57a856a21e9013e5b179e45e42a4512ff466de0a..ad481b35e618a0b0e85af7276d84342440b82e64 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -287,8 +287,6 @@ static const struct vb2_ops tegra_channel_queue_qops = {
 	.queue_setup = tegra_channel_queue_setup,
 	.buf_prepare = tegra_channel_buffer_prepare,
 	.buf_queue = tegra_channel_buffer_queue,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.start_streaming = tegra_channel_start_streaming,
 	.stop_streaming = tegra_channel_stop_streaming,
 };

-- 
2.45.2


