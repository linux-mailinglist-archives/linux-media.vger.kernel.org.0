Return-Path: <linux-media+bounces-19613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 076B899D0D2
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 17:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 824211F22FD8
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 15:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE22619F40B;
	Mon, 14 Oct 2024 15:07:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954F91BDC3
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 15:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728918454; cv=none; b=ovUd+hzDzY/SZWoaumHoRy4hQXdfHyUyAJfWIBdZm0v0eascpM5hIuJQufZ6y6RdTrazGj0yRohPGVwkA2ssAmo79QdoomxoGTm8y5z8IoU9iWd3ls2htvnoydo8leqghm5t+8LjymqG8QWYo7lFQxJE/rzHmdgIYSFkq9++MMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728918454; c=relaxed/simple;
	bh=C7VVp5DYu1O564w3anXHODJMz6LlrNNbJ5SAsmxKk0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=scO2pBwlqzQ1GVFjUwTK76GOY6SE/j8xq/rYbeYgPnoEPdpFGx3GZwTdPjPOv4RZWmdgjiJA2GCcn5tO9N3WQbRxqx/Pm6/xTvDvCTpSxDQhKVnEHe5iVBLwy5PSjX8irvBEf7SSp5aV702FfvLnh6WxTSN6bSmsT53wtfkyNDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332CBC4CEC3;
	Mon, 14 Oct 2024 15:07:17 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
Date: Mon, 14 Oct 2024 17:06:29 +0200
Subject: [PATCH 02/10] media: test-drivers: drop
 vb2_ops_wait_prepare/finish
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-vb2-wait-v1-2-8c3ee25c618c@xs4all.nl>
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
 drivers/media/test-drivers/vicodec/vicodec-core.c  | 2 --
 drivers/media/test-drivers/vim2m.c                 | 2 --
 drivers/media/test-drivers/vimc/vimc-capture.c     | 6 ------
 drivers/media/test-drivers/visl/visl-video.c       | 2 --
 drivers/media/test-drivers/vivid/vivid-meta-cap.c  | 2 --
 drivers/media/test-drivers/vivid/vivid-meta-out.c  | 2 --
 drivers/media/test-drivers/vivid/vivid-sdr-cap.c   | 2 --
 drivers/media/test-drivers/vivid/vivid-touch-cap.c | 2 --
 drivers/media/test-drivers/vivid/vivid-vbi-cap.c   | 2 --
 drivers/media/test-drivers/vivid/vivid-vbi-out.c   | 2 --
 drivers/media/test-drivers/vivid/vivid-vid-cap.c   | 2 --
 drivers/media/test-drivers/vivid/vivid-vid-out.c   | 2 --
 12 files changed, 28 deletions(-)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 1e6e3b7140a9403f3e3de1f67bd210998fac5236..00c84a06f343cf361dd453a4780827defb17f4a9 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -1688,8 +1688,6 @@ static const struct vb2_ops vicodec_qops = {
 	.buf_request_complete	= vicodec_buf_request_complete,
 	.start_streaming	= vicodec_start_streaming,
 	.stop_streaming		= vicodec_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 static int queue_init(void *priv, struct vb2_queue *src_vq,
diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index d4e27279dd0c94b2be152f5ca4902dcc013faeac..6c24dcf27eb078ae2e121b81bc32ef46b34fb415 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -1100,8 +1100,6 @@ static const struct vb2_ops vim2m_qops = {
 	.buf_queue	 = vim2m_buf_queue,
 	.start_streaming = vim2m_start_streaming,
 	.stop_streaming  = vim2m_stop_streaming,
-	.wait_prepare	 = vb2_ops_wait_prepare,
-	.wait_finish	 = vb2_ops_wait_finish,
 	.buf_request_complete = vim2m_buf_request_complete,
 };
 
diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index 89506ae009016779807768159e78711dc53fd721..10df039278e701ca4fa36774a8bc4d09893ac80d 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -326,12 +326,6 @@ static const struct vb2_ops vimc_capture_qops = {
 	.buf_queue		= vimc_capture_buf_queue,
 	.queue_setup		= vimc_capture_queue_setup,
 	.buf_prepare		= vimc_capture_buffer_prepare,
-	/*
-	 * Since q->lock is set we can use the standard
-	 * vb2_ops_wait_prepare/finish helper functions.
-	 */
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 static const struct media_entity_operations vimc_capture_mops = {
diff --git a/drivers/media/test-drivers/visl/visl-video.c b/drivers/media/test-drivers/visl/visl-video.c
index 677a8564de03c5db5999c2e71dd4d847ce0c0631..8be505d8908c98bb50118dfa2f491d5ac68772ec 100644
--- a/drivers/media/test-drivers/visl/visl-video.c
+++ b/drivers/media/test-drivers/visl/visl-video.c
@@ -732,8 +732,6 @@ static const struct vb2_ops visl_qops = {
 	.buf_queue            = visl_buf_queue,
 	.start_streaming      = visl_start_streaming,
 	.stop_streaming       = visl_stop_streaming,
-	.wait_prepare         = vb2_ops_wait_prepare,
-	.wait_finish          = vb2_ops_wait_finish,
 	.buf_request_complete = visl_buf_request_complete,
 };
 
diff --git a/drivers/media/test-drivers/vivid/vivid-meta-cap.c b/drivers/media/test-drivers/vivid/vivid-meta-cap.c
index 0a718d037e5944439f3c882d8a2661ec500318d7..c7aaecc0b5a24726639a253accfc50383a84e846 100644
--- a/drivers/media/test-drivers/vivid/vivid-meta-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-meta-cap.c
@@ -122,8 +122,6 @@ const struct vb2_ops vivid_meta_cap_qops = {
 	.start_streaming	= meta_cap_start_streaming,
 	.stop_streaming		= meta_cap_stop_streaming,
 	.buf_request_complete	= meta_cap_buf_request_complete,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 int vidioc_enum_fmt_meta_cap(struct file *file, void  *priv,
diff --git a/drivers/media/test-drivers/vivid/vivid-meta-out.c b/drivers/media/test-drivers/vivid/vivid-meta-out.c
index 82ab3b26914e6d47533dc9b109383e95d3ccdd04..55e5e5dec2f2ab1bdc01a2d1d479a6f1eb758299 100644
--- a/drivers/media/test-drivers/vivid/vivid-meta-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-meta-out.c
@@ -122,8 +122,6 @@ const struct vb2_ops vivid_meta_out_qops = {
 	.start_streaming        = meta_out_start_streaming,
 	.stop_streaming         = meta_out_stop_streaming,
 	.buf_request_complete   = meta_out_buf_request_complete,
-	.wait_prepare           = vb2_ops_wait_prepare,
-	.wait_finish            = vb2_ops_wait_finish,
 };
 
 int vidioc_enum_fmt_meta_out(struct file *file, void  *priv,
diff --git a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
index 38cda33dffb2aba68b2ce1187448a291d57a64ee..74a91d28c8be936b2c4cb0cc297625d91d7a27a7 100644
--- a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
@@ -337,8 +337,6 @@ const struct vb2_ops vivid_sdr_cap_qops = {
 	.start_streaming	= sdr_cap_start_streaming,
 	.stop_streaming		= sdr_cap_stop_streaming,
 	.buf_request_complete	= sdr_cap_buf_request_complete,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 int vivid_sdr_enum_freq_bands(struct file *file, void *fh,
diff --git a/drivers/media/test-drivers/vivid/vivid-touch-cap.c b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
index 3600b084bca53eb22a10a7d17152c5d0c39705c5..36a781fa17bc3daaf1d949a7f1c94ebb9aecb7c0 100644
--- a/drivers/media/test-drivers/vivid/vivid-touch-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
@@ -110,8 +110,6 @@ const struct vb2_ops vivid_touch_cap_qops = {
 	.start_streaming	= touch_cap_start_streaming,
 	.stop_streaming		= touch_cap_stop_streaming,
 	.buf_request_complete	= touch_cap_buf_request_complete,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 int vivid_enum_fmt_tch(struct file *file, void  *priv, struct v4l2_fmtdesc *f)
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
index 99138f63585c7146cb3289c4e9ac8180ed66966d..a09f62c66c33d143d56c58fa90fc25e687118662 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
@@ -230,8 +230,6 @@ const struct vb2_ops vivid_vbi_cap_qops = {
 	.start_streaming	= vbi_cap_start_streaming,
 	.stop_streaming		= vbi_cap_stop_streaming,
 	.buf_request_complete	= vbi_cap_buf_request_complete,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 int vidioc_g_fmt_vbi_cap(struct file *file, void *priv,
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-out.c b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
index 871a56d934254a198648835c38a65a33d3c8c85d..b7a09d2f394e43e4e78256d4a34d1db9898acea7 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
@@ -128,8 +128,6 @@ const struct vb2_ops vivid_vbi_out_qops = {
 	.start_streaming	= vbi_out_start_streaming,
 	.stop_streaming		= vbi_out_stop_streaming,
 	.buf_request_complete	= vbi_out_buf_request_complete,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 int vidioc_g_fmt_vbi_out(struct file *file, void *priv,
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index 69620e0a35a02fb210529a1d652abf915b4445af..e74d73d370e0a8f092401e280de4a55135ae10df 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -257,8 +257,6 @@ const struct vb2_ops vivid_vid_cap_qops = {
 	.start_streaming	= vid_cap_start_streaming,
 	.stop_streaming		= vid_cap_stop_streaming,
 	.buf_request_complete	= vid_cap_buf_request_complete,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 /*
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
index 60327f3612af40f7ebd6dedf8e23a113d8d6ac43..5ec84db934d6b0fd9f659298f80cd59a25983a2c 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
@@ -201,8 +201,6 @@ const struct vb2_ops vivid_vid_out_qops = {
 	.start_streaming	= vid_out_start_streaming,
 	.stop_streaming		= vid_out_stop_streaming,
 	.buf_request_complete	= vid_out_buf_request_complete,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 /*

-- 
2.45.2


