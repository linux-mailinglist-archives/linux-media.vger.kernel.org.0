Return-Path: <linux-media+bounces-38795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0C9B18D6D
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CD081AA3E3F
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64B328313A;
	Sat,  2 Aug 2025 09:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="az8gjqsy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFEE2367A6;
	Sat,  2 Aug 2025 09:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754127193; cv=none; b=ZW6oLpcwSkypxbiyKVQR90Qa7YcOyjZJzK6whBelxEg4C55pEIY25qg9MMAYl6hyjgB1oh5rNytR207sHcZwsetVvi/AG9z75ToQLxihEY/ypHZRr8EKZIek82AXDWs4I93HBKRxR11wk9H1VQtG/x8Z6Tyeghbz0XXXM4/siPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754127193; c=relaxed/simple;
	bh=miW0R2xYtxU5IpQyW/2QNq3ARYOqYEt7oDwJXWluDGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K2vXWV4H+BchBrU74Dv/9oX9/KnAO6PnO5Ez+ySOUDr0VZMFM7P2fR4fIH/43rM/3okvvxekdkxZVwMVIz+GINBBaUUaJhTnAI867ca2hin9d8eRleKCr/P/Ld5bYTLEQGdKAkIAnznF9GDmIcLSt2TGm+9JZv8/U/kfLHlmXr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=az8gjqsy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A4ED4370;
	Sat,  2 Aug 2025 11:32:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754127143;
	bh=miW0R2xYtxU5IpQyW/2QNq3ARYOqYEt7oDwJXWluDGc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=az8gjqsyXEti0JeVSm77geSmA7AkpCysThF60WhNPtJM1uNt7bbBCDUakaT72hVhp
	 l1GEVpO9e8XGH0VXe1MBRi2SnPKVb88n3ZKKaA2ZQlRkgmHZNFLOH75+TXNUtFCuFY
	 RzGTt8HUu1W6qrgy51RvHIBcPJ9wsdrXruX+PJT8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:18 +0200
Subject: [PATCH 56/65] media: cx18: Access v4l2_fh from file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-56-eb140ddd6a9d@ideasonboard.com>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
In-Reply-To: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Devarsh Thakkar <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
 Christian Gromm <christian.gromm@microchip.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>, 
 Zhou Peng <eagle.zhou@nxp.com>, 
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, 
 Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
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
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Corentin Labbe <clabbe@baylibre.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-doc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-tegra@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, mjpeg-users@lists.sourceforge.net, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11351;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=miW0R2xYtxU5IpQyW/2QNq3ARYOqYEt7oDwJXWluDGc=;
 b=kA0DAAoBcjQGjxahVjwByyZiAGiN2P6hMeCxCr0Vka9Jl65Kl6jOUQEBXEv4+uSblIpUX075K
 YkCMwQAAQoAHRYhBLXEPUiAmiCKj1g4wHI0Bo8WoVY8BQJojdj+AAoJEHI0Bo8WoVY8yzYP/jvk
 Cn3ngJT9BnSoIQGO0difqKYaY1cOKFJbaTdTzoLYKZ69MckDT1/9I3IehU8xvX/UhTdz5n6QdKD
 BAQS9lATwrt7P4Xq5uAKscHSkqZWRqV2OCe62nOwrWce6tsEaSznl9IIW9IltgMfA7LzjugyXed
 pzGRV0ByLbznHIYPOjUfErQNkQ4HlLMIXRSdSdCM21OZb2eYnEgRDKQv66Kh3kZWlUM3PnOnSAS
 82Xha7svCmWPYkLpOTtSuPaUveRcfcmkz3IBjsJY3JX34RZDY6IGhgNPYzNAVyCdkz6QI7LuFj6
 9phgs8UVK17Dd45xpXRFdgKVmKkM7uJayjqrWAVeuiyvJXKCT4DPMgMCf2LyxX9u3vE3z0x8pE9
 GG5jEhOBFOh8QJNV7BuWk8ivRC6QBX6h1BxwBCjCUTgo8/ktEcuaNR6AA7Y3FlgQRbKSR2XyZ5q
 NkiBoasrxsyCUPw5hhXrXTPJDIVRrV85Y2uT5wyiXTUuflm5bIbRQO3Pb3qDMDNU6/l/KsJo37N
 cvU+EkKMPwpJe6rktlQWrLqLW0TT2HQArsVlpZrTUmuQ8wVJJafbqFYwcEitbxi3ZqAQF22uiVn
 17W9hTzoSrtIKSM8NAfNewUYnTvyQPQ7/oEQVj3m3/HLXss/LiU6hE2+R0lnThzbpJNCVXBYjSQ
 5ybBH
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/pci/cx18/cx18-ioctl.c | 64 ++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
index 9a1512b1ccaafd991c0422616a0d7b3e6c7c49cc..bf16d36448f888d9326b5f4a8f9c8f0e13d0c3a1 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.c
+++ b/drivers/media/pci/cx18/cx18-ioctl.c
@@ -52,7 +52,7 @@ static const struct v4l2_fmtdesc cx18_formats_mpeg[] = {
 static int cx18_g_fmt_vid_cap(struct file *file, void *fh,
 			      struct v4l2_format *fmt)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 	struct cx18_stream *s = &cx->streams[id->type];
 	struct v4l2_pix_format *pixfmt = &fmt->fmt.pix;
@@ -76,7 +76,7 @@ static int cx18_g_fmt_vid_cap(struct file *file, void *fh,
 static int cx18_try_fmt_vid_cap(struct file *file, void *fh,
 				struct v4l2_format *fmt)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 	struct v4l2_pix_format *pixfmt = &fmt->fmt.pix;
 	int w = pixfmt->width;
@@ -121,7 +121,7 @@ static int cx18_try_fmt_vid_cap(struct file *file, void *fh,
 static int cx18_s_fmt_vid_cap(struct file *file, void *fh,
 			      struct v4l2_format *fmt)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
@@ -261,7 +261,7 @@ u16 cx18_get_service_set(struct v4l2_sliced_vbi_format *fmt)
 static int cx18_g_fmt_vbi_cap(struct file *file, void *fh,
 				struct v4l2_format *fmt)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 	struct v4l2_vbi_format *vbifmt = &fmt->fmt.vbi;
 
 	vbifmt->sampling_rate = 27000000;
@@ -280,7 +280,7 @@ static int cx18_g_fmt_vbi_cap(struct file *file, void *fh,
 static int cx18_g_fmt_sliced_vbi_cap(struct file *file, void *fh,
 					struct v4l2_format *fmt)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 	struct v4l2_sliced_vbi_format *vbifmt = &fmt->fmt.sliced;
 
 	/* sane, V4L2 spec compliant, defaults */
@@ -311,7 +311,7 @@ static int cx18_try_fmt_vbi_cap(struct file *file, void *fh,
 static int cx18_try_fmt_sliced_vbi_cap(struct file *file, void *fh,
 					struct v4l2_format *fmt)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 	struct v4l2_sliced_vbi_format *vbifmt = &fmt->fmt.sliced;
 
 	vbifmt->io_size = sizeof(struct v4l2_sliced_vbi_data) * 36;
@@ -330,7 +330,7 @@ static int cx18_try_fmt_sliced_vbi_cap(struct file *file, void *fh,
 static int cx18_s_fmt_vbi_cap(struct file *file, void *fh,
 				struct v4l2_format *fmt)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 	int ret;
 
@@ -360,7 +360,7 @@ static int cx18_s_fmt_vbi_cap(struct file *file, void *fh,
 static int cx18_s_fmt_sliced_vbi_cap(struct file *file, void *fh,
 					struct v4l2_format *fmt)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 	int ret;
 	struct v4l2_sliced_vbi_format *vbifmt = &fmt->fmt.sliced;
@@ -392,7 +392,7 @@ static int cx18_s_fmt_sliced_vbi_cap(struct file *file, void *fh,
 static int cx18_g_register(struct file *file, void *fh,
 				struct v4l2_dbg_register *reg)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	if (reg->reg & 0x3)
 		return -EINVAL;
@@ -406,7 +406,7 @@ static int cx18_g_register(struct file *file, void *fh,
 static int cx18_s_register(struct file *file, void *fh,
 				const struct v4l2_dbg_register *reg)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	if (reg->reg & 0x3)
 		return -EINVAL;
@@ -420,7 +420,7 @@ static int cx18_s_register(struct file *file, void *fh,
 static int cx18_querycap(struct file *file, void *fh,
 				struct v4l2_capability *vcap)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 
 	strscpy(vcap->driver, CX18_DRIVER_NAME, sizeof(vcap->driver));
@@ -431,14 +431,14 @@ static int cx18_querycap(struct file *file, void *fh,
 
 static int cx18_enumaudio(struct file *file, void *fh, struct v4l2_audio *vin)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	return cx18_get_audio_input(cx, vin->index, vin);
 }
 
 static int cx18_g_audio(struct file *file, void *fh, struct v4l2_audio *vin)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	vin->index = cx->audio_input;
 	return cx18_get_audio_input(cx, vin->index, vin);
@@ -446,7 +446,7 @@ static int cx18_g_audio(struct file *file, void *fh, struct v4l2_audio *vin)
 
 static int cx18_s_audio(struct file *file, void *fh, const struct v4l2_audio *vout)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	if (vout->index >= cx->nof_audio_inputs)
 		return -EINVAL;
@@ -457,7 +457,7 @@ static int cx18_s_audio(struct file *file, void *fh, const struct v4l2_audio *vo
 
 static int cx18_enum_input(struct file *file, void *fh, struct v4l2_input *vin)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	/* set it to defaults from our table */
 	return cx18_get_input(cx, vin->index, vin);
@@ -466,7 +466,7 @@ static int cx18_enum_input(struct file *file, void *fh, struct v4l2_input *vin)
 static int cx18_g_pixelaspect(struct file *file, void *fh,
 			      int type, struct v4l2_fract *f)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	if (type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
@@ -479,7 +479,7 @@ static int cx18_g_pixelaspect(struct file *file, void *fh,
 static int cx18_g_selection(struct file *file, void *fh,
 			    struct v4l2_selection *sel)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
@@ -499,7 +499,7 @@ static int cx18_g_selection(struct file *file, void *fh,
 static int cx18_enum_fmt_vid_cap(struct file *file, void *fh,
 					struct v4l2_fmtdesc *fmt)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 
 	if (id->type == CX18_ENC_STREAM_TYPE_YUV) {
 		if (fmt->index >= ARRAY_SIZE(cx18_formats_yuv))
@@ -515,7 +515,7 @@ static int cx18_enum_fmt_vid_cap(struct file *file, void *fh,
 
 static int cx18_g_input(struct file *file, void *fh, unsigned int *i)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	*i = cx->active_input;
 	return 0;
@@ -523,7 +523,7 @@ static int cx18_g_input(struct file *file, void *fh, unsigned int *i)
 
 int cx18_s_input(struct file *file, void *fh, unsigned int inp)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 	v4l2_std_id std = V4L2_STD_ALL;
 	const struct cx18_card_video_input *card_input =
@@ -561,7 +561,7 @@ int cx18_s_input(struct file *file, void *fh, unsigned int inp)
 static int cx18_g_frequency(struct file *file, void *fh,
 				struct v4l2_frequency *vf)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	if (vf->tuner != 0)
 		return -EINVAL;
@@ -572,7 +572,7 @@ static int cx18_g_frequency(struct file *file, void *fh,
 
 int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 
 	if (vf->tuner != 0)
@@ -587,7 +587,7 @@ int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *v
 
 static int cx18_g_std(struct file *file, void *fh, v4l2_std_id *std)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	*std = cx->std;
 	return 0;
@@ -595,7 +595,7 @@ static int cx18_g_std(struct file *file, void *fh, v4l2_std_id *std)
 
 int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 
 	if ((std & V4L2_STD_ALL) == 0)
@@ -644,7 +644,7 @@ int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
 
 static int cx18_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 
 	if (vt->index != 0)
@@ -656,7 +656,7 @@ static int cx18_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt
 
 static int cx18_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	if (vt->index != 0)
 		return -EINVAL;
@@ -673,7 +673,7 @@ static int cx18_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
 static int cx18_g_sliced_vbi_cap(struct file *file, void *fh,
 					struct v4l2_sliced_vbi_cap *cap)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 	int set = cx->is_50hz ? V4L2_SLICED_VBI_625 : V4L2_SLICED_VBI_525;
 	int f, l;
 
@@ -794,7 +794,7 @@ static int cx18_process_idx_data(struct cx18_stream *s, struct cx18_mdl *mdl,
 static int cx18_g_enc_index(struct file *file, void *fh,
 				struct v4l2_enc_idx *idx)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 	struct cx18_stream *s = &cx->streams[CX18_ENC_STREAM_TYPE_IDX];
 	s32 tmp;
 	struct cx18_mdl *mdl;
@@ -841,7 +841,7 @@ static int cx18_g_enc_index(struct file *file, void *fh,
 static int cx18_encoder_cmd(struct file *file, void *fh,
 				struct v4l2_encoder_cmd *enc)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 	u32 h;
 
@@ -900,7 +900,7 @@ static int cx18_encoder_cmd(struct file *file, void *fh,
 static int cx18_try_encoder_cmd(struct file *file, void *fh,
 				struct v4l2_encoder_cmd *enc)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	switch (enc->cmd) {
 	case V4L2_ENC_CMD_START:
@@ -932,7 +932,7 @@ static int cx18_try_encoder_cmd(struct file *file, void *fh,
 
 static int cx18_log_status(struct file *file, void *fh)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 	struct v4l2_input vidin;
 	struct v4l2_audio audin;
 	int i;
@@ -976,7 +976,7 @@ static int cx18_log_status(struct file *file, void *fh)
 static long cx18_default(struct file *file, void *fh, bool valid_prio,
 			 unsigned int cmd, void *arg)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	switch (cmd) {
 	case VIDIOC_INT_RESET: {

-- 
2.49.0


