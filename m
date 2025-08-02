Return-Path: <linux-media+bounces-38776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F3CB18CC3
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6883E7A51D3
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CFE277C85;
	Sat,  2 Aug 2025 09:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jNijr26x"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913C22222AA;
	Sat,  2 Aug 2025 09:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126982; cv=none; b=iaiVrzJocqTfnAxzCK+BjrMeweIqtoMitcjfyZIMR47riIa9p9fgPo5QCnMZqWPpB1sm3eNfKEnRlQ3Z+Z3Mxh5gh+FpFTl6CV8vxiWZm0cn0Bb81cKvUdCtniFf7ufWI24VynOspayPsqCzSSYi9IgR6N0nlaT1rAzSH+/kG3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126982; c=relaxed/simple;
	bh=TREA8Gw7i9MWzaBdbk/QKhP4Ggubbbr1P2XTmejXLMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oZyB1po6kvJvhUA6SarSExRUubGop+a7L2OvAb5BSzpaWQbFUbblPhhdhYjUpt7uSVAcSmVio92A5EplxdhGRB7PDx8HS/edPrxsTlKMg/zelkTVPYzGghcvpTTXfpuBNLnufi5s0RD4wULqRGRiEkGIHYVuaDQhw/mK5T4zMZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jNijr26x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4CC23C6C;
	Sat,  2 Aug 2025 11:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126933;
	bh=TREA8Gw7i9MWzaBdbk/QKhP4Ggubbbr1P2XTmejXLMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jNijr26x5+M7V7u6frcDFOc1kw8nkayNoUX+tkfFN+81P3tAoLJU0zqTc4xceh+JS
	 CcXmq6ErvT/tUMPRINb7C733Z753O0Kg4oUaHuaQtM+H3G/r9kIUq//VNa+n/wDzQx
	 ZCPA5vqvcGKXQtSSlbt/9zBRQyOy0nPGCuzDVOHk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:59 +0200
Subject: [PATCH 37/65] media: mtk: vcodec: Access v4l2_fh from file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-37-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15817;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=TREA8Gw7i9MWzaBdbk/QKhP4Ggubbbr1P2XTmejXLMg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj7OFz+gN+wVUa5VrMIM4YwXqynriZsOLr8/
 lEjqmJBecSJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+wAKCRByNAaPFqFW
 PDXFEACF7S0bzNNPSEx0ZGozCHIVTditcgtd3bjzpugZNSpCFcQL5RnblDMNXaTZ9JUxJojuT/y
 t7OKO86LZRZm2RaF2T/6UvtXUSmcunX6qFk8BFTn+mqubhxy+CO/Ex+SzTPlemYp9t/THLIcQhF
 OXvmdmnwpq1yYBHiGd7Bw5wLQ5Q/vHV4weIFVDAL5V/ORd+T/gUXFXg0ySeCUbaaYFVxXIaiSEm
 7lReb8gjHZq2461gV6GQbUzU/jmKEyy8SBZXc2ND0v6I7ubcUYW1P63TQ7hPnmEiyNpJmK5C58l
 Uuw1V9L9I/1P6g6+n1/Ml523MwfsS2+dPX+KEElKiZlXqAlVc9HQRXZrrgen4CFJH3qP55z+464
 zGhiK5n7WozA50CkGjspJc+tAWCqThw78zGzqSNXIXvp1UT5FdprbpNvQjybL4/KaQyWhsPNcgC
 NxNPp4zJYrcrsFSwbfgsR6FaAijZ6DVcwq3ZH/likfl+LXm5/KTHjO2PDpbdL05tlYPkRpkO7/F
 CKCJBfmdL1z8l1M91mAgY3pgCBkMxOlUIVTgWWFM8hjvhrFE4Gm01woUGeD/JbRlN55KcosvY1H
 zB7VSNQY8qhwoExGJoDLy4EfRmxMZfIvdCO/eX+32eNNEYPOZVQsXYs6+Zm1CBonwBKKzxqMddf
 UeHloDAzu4agKiw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

While at modify mtk_vcodec_enc_get_chip_name() to accept a ctx instead
of a raw void *.

While at it, remove the now unused fh_to_enc_ctx() macro.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       | 36 ++++++++++-----------
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c       | 37 +++++++++++-----------
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h   |  5 ---
 3 files changed, 36 insertions(+), 42 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 98838217b97d45ed2b5431fdf87c94e0ff79fc57..d691bd533103b100e7d1817e834696cc5b3990ce 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -87,7 +87,7 @@ static int stateful_try_decoder_cmd(struct file *file, void *priv, struct v4l2_d
 
 static int stateful_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	struct vb2_queue *src_vq, *dst_vq;
 	int ret;
 
@@ -132,7 +132,7 @@ static int stateless_try_decoder_cmd(struct file *file, void *priv, struct v4l2_
 
 static int stateless_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	int ret;
 
 	ret = v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, cmd);
@@ -158,7 +158,7 @@ static int stateless_decoder_cmd(struct file *file, void *priv, struct v4l2_deco
 
 static int vidioc_try_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 
 	if (ctx->dev->vdec_pdata->uses_stateless_api)
 		return stateless_try_decoder_cmd(file, priv, cmd);
@@ -168,7 +168,7 @@ static int vidioc_try_decoder_cmd(struct file *file, void *priv, struct v4l2_dec
 
 static int vidioc_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 
 	if (ctx->dev->vdec_pdata->uses_stateless_api)
 		return stateless_decoder_cmd(file, priv, cmd);
@@ -233,7 +233,7 @@ void mtk_vcodec_dec_set_default_params(struct mtk_vcodec_dec_ctx *ctx)
 static int vidioc_vdec_qbuf(struct file *file, void *priv,
 			    struct v4l2_buffer *buf)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 
 	if (ctx->state == MTK_STATE_ABORT) {
 		mtk_v4l2_vdec_err(ctx, "[%d] Call on QBUF after unrecoverable error", ctx->id);
@@ -246,7 +246,7 @@ static int vidioc_vdec_qbuf(struct file *file, void *priv,
 static int vidioc_vdec_dqbuf(struct file *file, void *priv,
 			     struct v4l2_buffer *buf)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 
 	if (ctx->state == MTK_STATE_ABORT) {
 		mtk_v4l2_vdec_err(ctx, "[%d] Call on DQBUF after unrecoverable error", ctx->id);
@@ -259,7 +259,7 @@ static int vidioc_vdec_dqbuf(struct file *file, void *priv,
 static int vidioc_vdec_querycap(struct file *file, void *priv,
 				struct v4l2_capability *cap)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	struct device *dev = &ctx->dev->plat_dev->dev;
 
 	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
@@ -354,7 +354,7 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
 	const struct mtk_video_fmt *fmt;
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
 
 	fmt = mtk_vdec_find_format(f, dec_pdata);
@@ -372,7 +372,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 {
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
 	const struct mtk_video_fmt *fmt;
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
 
 	fmt = mtk_vdec_find_format(f, dec_pdata);
@@ -393,7 +393,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 static int vidioc_vdec_g_selection(struct file *file, void *priv,
 			struct v4l2_selection *s)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	struct mtk_q_data *q_data;
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
@@ -442,7 +442,7 @@ static int vidioc_vdec_g_selection(struct file *file, void *priv,
 static int vidioc_vdec_s_selection(struct file *file, void *priv,
 				struct v4l2_selection *s)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
@@ -464,7 +464,7 @@ static int vidioc_vdec_s_selection(struct file *file, void *priv,
 static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 			     struct v4l2_format *f)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	struct v4l2_pix_format_mplane *pix_mp;
 	struct mtk_q_data *q_data;
 	int ret = 0;
@@ -594,7 +594,7 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 				struct v4l2_frmsizeenum *fsize)
 {
 	int i = 0;
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
 
 	if (fsize->index != 0)
@@ -623,10 +623,10 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 	return -EINVAL;
 }
 
-static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, void *priv,
+static int vidioc_enum_fmt(struct file *file, struct v4l2_fmtdesc *f,
 			   bool output_queue)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
 	const struct mtk_video_fmt *fmt;
 	int i, j = 0;
@@ -660,19 +660,19 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, void *priv,
 static int vidioc_vdec_enum_fmt_vid_cap(struct file *file, void *priv,
 					struct v4l2_fmtdesc *f)
 {
-	return vidioc_enum_fmt(f, priv, false);
+	return vidioc_enum_fmt(file, f, false);
 }
 
 static int vidioc_vdec_enum_fmt_vid_out(struct file *file, void *priv,
 					struct v4l2_fmtdesc *f)
 {
-	return vidioc_enum_fmt(f, priv, true);
+	return vidioc_enum_fmt(file, f, true);
 }
 
 static int vidioc_vdec_g_fmt(struct file *file, void *priv,
 			     struct v4l2_format *f)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
 	struct vb2_queue *vq;
 	struct mtk_q_data *q_data;
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index a01dc25a769911cd85a8d19c58e0c0a12b92ad50..d815e962ab8981c53000851e8f2bc61faf28056d 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -159,7 +159,7 @@ static int vidioc_enum_framesizes(struct file *file, void *fh,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	const struct mtk_video_fmt *fmt;
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(fh);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 
 	if (fsize->index != 0)
 		return -EINVAL;
@@ -183,7 +183,7 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
 				   struct v4l2_fmtdesc *f)
 {
 	const struct mtk_vcodec_enc_pdata *pdata =
-		fh_to_enc_ctx(priv)->dev->venc_pdata;
+		file_to_enc_ctx(file)->dev->venc_pdata;
 
 	return vidioc_enum_fmt(f, pdata->capture_formats,
 			       pdata->num_capture_formats);
@@ -193,15 +193,14 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
 				   struct v4l2_fmtdesc *f)
 {
 	const struct mtk_vcodec_enc_pdata *pdata =
-		fh_to_enc_ctx(priv)->dev->venc_pdata;
+		file_to_enc_ctx(file)->dev->venc_pdata;
 
 	return vidioc_enum_fmt(f, pdata->output_formats,
 			       pdata->num_output_formats);
 }
 
-static int mtk_vcodec_enc_get_chip_name(void *priv)
+static int mtk_vcodec_enc_get_chip_name(struct mtk_vcodec_enc_ctx *ctx)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
 	struct device *dev = &ctx->dev->plat_dev->dev;
 
 	if (of_device_is_compatible(dev->of_node, "mediatek,mt8173-vcodec-enc"))
@@ -221,9 +220,9 @@ static int mtk_vcodec_enc_get_chip_name(void *priv)
 static int vidioc_venc_querycap(struct file *file, void *priv,
 				struct v4l2_capability *cap)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	struct device *dev = &ctx->dev->plat_dev->dev;
-	int platform_name = mtk_vcodec_enc_get_chip_name(priv);
+	int platform_name = mtk_vcodec_enc_get_chip_name(ctx);
 
 	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
 	snprintf(cap->card, sizeof(cap->card), "MT%d video encoder", platform_name);
@@ -234,7 +233,7 @@ static int vidioc_venc_querycap(struct file *file, void *priv,
 static int vidioc_venc_s_parm(struct file *file, void *priv,
 			      struct v4l2_streamparm *a)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	struct v4l2_fract *timeperframe = &a->parm.output.timeperframe;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -257,7 +256,7 @@ static int vidioc_venc_s_parm(struct file *file, void *priv,
 static int vidioc_venc_g_parm(struct file *file, void *priv,
 			      struct v4l2_streamparm *a)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return -EINVAL;
@@ -414,7 +413,7 @@ static void mtk_venc_set_param(struct mtk_vcodec_enc_ctx *ctx,
 static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
 			     struct v4l2_format *f)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
 	struct vb2_queue *vq;
 	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, f->type);
@@ -469,7 +468,7 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
 static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 			     struct v4l2_format *f)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
 	struct vb2_queue *vq;
 	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, f->type);
@@ -524,7 +523,7 @@ static int vidioc_venc_g_fmt(struct file *file, void *priv,
 			     struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	struct vb2_queue *vq;
 	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, f->type);
 	int i;
@@ -557,7 +556,7 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 					 struct v4l2_format *f)
 {
 	const struct mtk_video_fmt *fmt;
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
 
 	fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
@@ -579,7 +578,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 					 struct v4l2_format *f)
 {
 	const struct mtk_video_fmt *fmt;
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
 
 	fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
@@ -600,7 +599,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 static int vidioc_venc_g_selection(struct file *file, void *priv,
 				     struct v4l2_selection *s)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, s->type);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -630,7 +629,7 @@ static int vidioc_venc_g_selection(struct file *file, void *priv,
 static int vidioc_venc_s_selection(struct file *file, void *priv,
 				     struct v4l2_selection *s)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, s->type);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -655,7 +654,7 @@ static int vidioc_venc_s_selection(struct file *file, void *priv,
 static int vidioc_venc_qbuf(struct file *file, void *priv,
 			    struct v4l2_buffer *buf)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 
 	if (ctx->state == MTK_STATE_ABORT) {
 		mtk_v4l2_venc_err(ctx, "[%d] Call on QBUF after unrecoverable error",
@@ -669,7 +668,7 @@ static int vidioc_venc_qbuf(struct file *file, void *priv,
 static int vidioc_venc_dqbuf(struct file *file, void *priv,
 			     struct v4l2_buffer *buf)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	int ret;
 
 	if (ctx->state == MTK_STATE_ABORT) {
@@ -707,7 +706,7 @@ static int vidioc_venc_dqbuf(struct file *file, void *priv,
 static int vidioc_encoder_cmd(struct file *file, void *priv,
 			      struct v4l2_encoder_cmd *cmd)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	struct vb2_queue *src_vq, *dst_vq;
 	int ret;
 
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index 402e7d31d03d1985ad5ff2831faffc5c31b63467..5b304a5512366ed7109469a3b8f90b240baf2a11 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -217,11 +217,6 @@ struct mtk_vcodec_enc_dev {
 	struct mtk_vcodec_dbgfs dbgfs;
 };
 
-static inline struct mtk_vcodec_enc_ctx *fh_to_enc_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct mtk_vcodec_enc_ctx, fh);
-}
-
 static inline struct mtk_vcodec_enc_ctx *file_to_enc_ctx(struct file *filp)
 {
 	return container_of(file_to_v4l2_fh(filp), struct mtk_vcodec_enc_ctx, fh);

-- 
2.49.0


