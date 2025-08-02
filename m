Return-Path: <linux-media+bounces-38770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE398B18C93
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C01337B5C72
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4FA273D8B;
	Sat,  2 Aug 2025 09:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="duA3dJ50"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCE5221F39;
	Sat,  2 Aug 2025 09:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126925; cv=none; b=KxWgnI5q+uJhMLbC7St4fIW45pmbGYSI4UUQFJVg+84SLVzonbHEKQTG0qy4qSxZoJaVQ7PN9YgmETaPaefm/wm7PDYj9MuxajRAia5Qd9nfgMWdXy+Xf4YPnEoc08ofGqoCrBDmweqN72bHk8WUaozS1GsqhtnxQrYkA1E5iHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126925; c=relaxed/simple;
	bh=TlJ3vfBE6eOXaSzRlSNwTu3lbTFE43IxxanDcdfmWg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GPwDK9H3VrXEpXLVeBPE2zerb6YHz1z13K7yZvkSdR9KAVuP31ChDuI2pci+j6sr0UWmXSvBfkPYlGDmeujfWQT7dm3kap9b+Zb1u8G6vajmzsVVRgZzd9hfNQofwmTam04JerG/B7YBbuJ5KioCdEa5seZzzKGR4mTU1VJy0Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=duA3dJ50; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 645743C5B;
	Sat,  2 Aug 2025 11:27:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126876;
	bh=TlJ3vfBE6eOXaSzRlSNwTu3lbTFE43IxxanDcdfmWg0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=duA3dJ50CGqSubEiUb6tH6brol9dIsXMNSvO5O1wlKHkbM+t1cYXYoYHvBjqEVQAU
	 6T1vr8defZLDQwNlsGvBZefSOJNBplJQwBGAtvnWmJFpJVKgGIuG4A95kPSRxfhFj0
	 VVyGPA3wQV5hmg0owRykgfvRnsuwd0UOntPRaAk0=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:53 +0200
Subject: [PATCH 31/65] media: coda: Access v4l2_fh from file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-31-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7087;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=TlJ3vfBE6eOXaSzRlSNwTu3lbTFE43IxxanDcdfmWg0=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj7+KFlHPr1a0isCkNZoxK5D1IytunS6QznA
 Xx0PkUP/LeJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+wAKCRByNAaPFqFW
 PMEgD/4oWPtUHoRU6cbURgatIsy/ggO5IP5Eby7JaGzgNGqFvbfVZBfBsvDvSk0XId2Yf6AKLaS
 +FnRBa487AwS51rHE8fKzm3XDGnBJoVM4HfBTvt7MRRtyjJtWkwz9n6drkQCgqwHre/wM1QeZ7g
 CKdpnv3dwheDBseF0afNkwkXfaSuK5Zxhv3bQDQjEmA+LcxstpnzmxIrDVGnjzIx2ny3t1jXc5d
 iWlUbuGhe76FyZFlBx1AwZxWRWGDXCdZWYPgaSJl4uK2nyOufJh+11XC3vPJ1ZOJiEd+MU3Kwa9
 uqKFs4IJYj5LqufRjjiFOJI2vh8LGRztTEiMrIZtpBAIYFffQeJvrqX/OYHA62UPzzhHZNOcNQn
 ihlqj30ly755JApJzOsKzNqHKR8R5O+L6btO4Os2yfBAHOc8hRP7ixaXaizgcAyUiTzH9h2qoBO
 P5vnAw3fGKJzlvn0KLjeBwFS5Ns/r3FlUap2KSGwjVPs6IWAn7xuSwiDhbHpvhDRvcn/6yMyB4U
 Q+VLMIRK/oMhvdkTNeQ+c/w4rvt7rnFpwlVIoMHlmQST3eR+hUSY6reLy4f2bShB6sCRz2CFyDC
 Jz5Z1jNqk3XX477veKLSaJth6f34LbD8yLZ9w5wn/6+xHIh56leHJqnoJ7OLe8iwOqOAIny23Ow
 KRl8vbIQCATC15A==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/chips-media/coda/coda-common.c  | 36 +++++++++++-----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index a27d5a261a27fb78d4c7ca008146780698386333..a10576f702127ba6014799e7d3190c2785afd2a2 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -427,7 +427,7 @@ static struct vdoa_data *coda_get_vdoa_data(void)
 static int coda_querycap(struct file *file, void *priv,
 			 struct v4l2_capability *cap)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 
 	strscpy(cap->driver, CODA_NAME, sizeof(cap->driver));
 	strscpy(cap->card, coda_product_name(ctx->dev->devtype->product),
@@ -447,7 +447,7 @@ static int coda_enum_fmt(struct file *file, void *priv,
 {
 	struct video_device *vdev = video_devdata(file);
 	const struct coda_video_device *cvd = to_coda_video_device(vdev);
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	const u32 *formats;
 
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -497,7 +497,7 @@ static int coda_g_fmt(struct file *file, void *priv,
 		      struct v4l2_format *f)
 {
 	struct coda_q_data *q_data;
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 
 	q_data = get_q_data(ctx, f->type);
 	if (!q_data)
@@ -658,7 +658,7 @@ static int coda_try_fmt(struct coda_ctx *ctx, const struct coda_codec *codec,
 static int coda_try_fmt_vid_cap(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	const struct coda_q_data *q_data_src;
 	const struct coda_codec *codec;
 	struct vb2_queue *src_vq;
@@ -764,7 +764,7 @@ static void coda_set_default_colorspace(struct v4l2_pix_format *fmt)
 static int coda_try_fmt_vid_out(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_dev *dev = ctx->dev;
 	const struct coda_q_data *q_data_dst;
 	const struct coda_codec *codec;
@@ -858,7 +858,7 @@ static int coda_s_fmt(struct coda_ctx *ctx, struct v4l2_format *f,
 static int coda_s_fmt_vid_cap(struct file *file, void *priv,
 			      struct v4l2_format *f)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_q_data *q_data_src;
 	const struct coda_codec *codec;
 	struct v4l2_rect r;
@@ -910,7 +910,7 @@ static int coda_s_fmt_vid_cap(struct file *file, void *priv,
 static int coda_s_fmt_vid_out(struct file *file, void *priv,
 			      struct v4l2_format *f)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	const struct coda_codec *codec;
 	struct v4l2_format f_cap;
 	struct vb2_queue *dst_vq;
@@ -966,7 +966,7 @@ static int coda_s_fmt_vid_out(struct file *file, void *priv,
 static int coda_reqbufs(struct file *file, void *priv,
 			struct v4l2_requestbuffers *rb)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	int ret;
 
 	ret = v4l2_m2m_reqbufs(file, ctx->fh.m2m_ctx, rb);
@@ -986,7 +986,7 @@ static int coda_reqbufs(struct file *file, void *priv,
 static int coda_qbuf(struct file *file, void *priv,
 		     struct v4l2_buffer *buf)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 
 	if (ctx->inst_type == CODA_INST_DECODER &&
 	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -997,7 +997,7 @@ static int coda_qbuf(struct file *file, void *priv,
 
 static int coda_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	int ret;
 
 	ret = v4l2_m2m_dqbuf(file, ctx->fh.m2m_ctx, buf);
@@ -1025,7 +1025,7 @@ void coda_m2m_buf_done(struct coda_ctx *ctx, struct vb2_v4l2_buffer *buf,
 static int coda_g_selection(struct file *file, void *fh,
 			    struct v4l2_selection *s)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_q_data *q_data;
 	struct v4l2_rect r, *rsel;
 
@@ -1071,7 +1071,7 @@ static int coda_g_selection(struct file *file, void *fh,
 static int coda_s_selection(struct file *file, void *fh,
 			    struct v4l2_selection *s)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_q_data *q_data;
 
 	switch (s->target) {
@@ -1126,7 +1126,7 @@ static void coda_wake_up_capture_queue(struct coda_ctx *ctx)
 static int coda_encoder_cmd(struct file *file, void *fh,
 			    struct v4l2_encoder_cmd *ec)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct vb2_v4l2_buffer *buf;
 	int ret;
 
@@ -1207,7 +1207,7 @@ static bool coda_mark_last_dst_buf(struct coda_ctx *ctx)
 static int coda_decoder_cmd(struct file *file, void *fh,
 			    struct v4l2_decoder_cmd *dc)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_dev *dev = ctx->dev;
 	struct vb2_v4l2_buffer *buf;
 	struct vb2_queue *dst_vq;
@@ -1286,7 +1286,7 @@ static int coda_decoder_cmd(struct file *file, void *fh,
 static int coda_enum_framesizes(struct file *file, void *fh,
 				struct v4l2_frmsizeenum *fsize)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_q_data *q_data_dst;
 	const struct coda_codec *codec;
 
@@ -1319,7 +1319,7 @@ static int coda_enum_framesizes(struct file *file, void *fh,
 static int coda_enum_frameintervals(struct file *file, void *fh,
 				    struct v4l2_frmivalenum *f)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_q_data *q_data;
 	const struct coda_codec *codec;
 
@@ -1358,7 +1358,7 @@ static int coda_enum_frameintervals(struct file *file, void *fh,
 
 static int coda_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct v4l2_fract *tpf;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -1441,7 +1441,7 @@ static uint32_t coda_timeperframe_to_frate(struct v4l2_fract *timeperframe)
 
 static int coda_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct v4l2_fract *tpf;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)

-- 
2.49.0


