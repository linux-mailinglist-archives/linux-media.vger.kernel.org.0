Return-Path: <linux-media+bounces-38773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D24A2B18CAA
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BE7C44E04D7
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9DD274FEF;
	Sat,  2 Aug 2025 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YgNxCbbV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE5B2222AB;
	Sat,  2 Aug 2025 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126951; cv=none; b=osrNc0oOQzNYG/laWkUm+du0ijN+epRqunnX4zGjlsNgB8MCDJaAs3EF2CvnAZUu8/RMHfElMlN4rmlKmdBab7u1n/RzRyjGDk9YocrPp/Dfv4j9WHkenx91QvDM03ksqsvqjpQa8dwUl9LdSd/y+y5mdyS84zesHpqNgxzXkg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126951; c=relaxed/simple;
	bh=L0ZUzNfnoLjztZUAFo8LD82f1tvHxDD9diPSRFvNFG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=idPmUt9AYXZBhlf3f9Hr5UMTlcKmzT+0N+dBgGOihRiCYJS2I0+AgVbr9R4p+P5WjlsYvCLpZsKCWIyqzh+tK/6cTUPZ+MWH/+jVZYGR5Dfc5NIMljBPP6yNy0XV3k0Ar0uTG2IjTQKrtZiotoc114czjWTNH0OtqPncqCBlYG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YgNxCbbV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D5B13C64;
	Sat,  2 Aug 2025 11:28:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126902;
	bh=L0ZUzNfnoLjztZUAFo8LD82f1tvHxDD9diPSRFvNFG8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YgNxCbbV4Lu9nSUDHOLXb+Khn3iTG7uca8DR8oTYu966wM689OJhwdvHajbpALfe7
	 SobfPhefVv+UXuwNOm8AUrwSyV4o5pUIWPMqBB8HNh+YKTlUKsjnNpHfDd0JY4HgnM
	 2ljjhNlRhMYivAPRG+3MQuqEA4D06LL5zLT0b0+Y=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:56 +0200
Subject: [PATCH 34/65] media: mtk: jpeg: Access v4l2_fh from
 file->private_data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-34-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5473;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=L0ZUzNfnoLjztZUAFo8LD82f1tvHxDD9diPSRFvNFG8=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj7gvp1bn79ddqFVF08lQxDnSWTM0Yzt2fgT
 Quste8pkyOJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+wAKCRByNAaPFqFW
 PAUHD/9/Mn8W2TWnpnF5jCtc9S3BNAZMttSJxyX+rR5RRe6S8x/I8d8N3U+ykOsqQyM3NIWlHt0
 C0myb3twn6+97X7lRzosteZ2DCTbU2QWnjIcTCpAiC5uJ9saBPoaf2KxxZERdg3yWqYKvAVsua7
 VKVqQwfE565lqKpZOqPSLhA5VTIGbTuooNI1HFqoeXpPp9jAhn7wWfGfkH8vE1NaSOA1BxrlRhR
 QVWvVysYhH/lafXj4XSniCcqUfwh4oL4MfFDIACucn0RFellTnptdo/gTgMD2Y04sHl1ljGBgYU
 jsCiRvcCJDg1zGLsSMdbHlB4R+5GJtxaIfkNRG090P5o1m/8e7Q/RxhaKbK5ml9QAPaWR65nOjr
 Xj60Z0XEKbTo/fTrLy+jRwmDXGxvQAm9qqisXrgZPPsxfwFnWCzSPbu4WosZZQbm3+ZiU6m+TcW
 apyakcWCNeVbV7xLZBKnIdSerEsIGn+SVC/p74Jw9H1nCbaWkZPcaZBEJK2Oc5kZZr5eGZyJmLe
 dZr9DrtDSNvB6WaMD/8C45rV3JqAyV8ogmJLOzSgjIGvt520pPa9mhqd6uIeSFfYpn2CCzteEz3
 8lRJcdt5+Yu1wdlhYyOIKbtlfg0jX/CKb1rMpjtwpxx96U+3vwC7VG/MzM+mDutHW/YgrZnAebP
 XCCbyjTWWZJHYzQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

While at it, remove the now unused mtk_jpeg_fh_to_ctx() macro.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   | 27 +++++++++-------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 8e1883d034f5c67d418f5607c593c60f5d6ddbee..6268d651bdcfd212b58bf686c55660d64b659dfe 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -119,11 +119,6 @@ static inline struct mtk_jpeg_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
 	return container_of(ctrl->handler, struct mtk_jpeg_ctx, ctrl_hdl);
 }
 
-static inline struct mtk_jpeg_ctx *mtk_jpeg_fh_to_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct mtk_jpeg_ctx, fh);
-}
-
 static inline struct mtk_jpeg_ctx *mtk_jpeg_file_to_ctx(struct file *filp)
 {
 	return container_of(file_to_v4l2_fh(filp), struct mtk_jpeg_ctx, fh);
@@ -217,7 +212,7 @@ static int mtk_jpeg_enum_fmt(struct mtk_jpeg_fmt *mtk_jpeg_formats, int n,
 static int mtk_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 
 	return mtk_jpeg_enum_fmt(jpeg->variant->formats,
@@ -228,7 +223,7 @@ static int mtk_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 static int mtk_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 
 	return mtk_jpeg_enum_fmt(jpeg->variant->formats,
@@ -310,7 +305,7 @@ static int mtk_jpeg_g_fmt_vid_mplane(struct file *file, void *priv,
 	struct vb2_queue *vq;
 	struct mtk_jpeg_q_data *q_data = NULL;
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	int i;
 
@@ -356,7 +351,7 @@ static int mtk_jpeg_g_fmt_vid_mplane(struct file *file, void *priv,
 static int mtk_jpeg_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 					   struct v4l2_format *f)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	struct mtk_jpeg_fmt *fmt;
 
@@ -385,7 +380,7 @@ static int mtk_jpeg_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 static int mtk_jpeg_try_fmt_vid_out_mplane(struct file *file, void *priv,
 					   struct v4l2_format *f)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	struct mtk_jpeg_fmt *fmt;
 
@@ -475,7 +470,7 @@ static int mtk_jpeg_s_fmt_vid_out_mplane(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_fh_to_ctx(priv), f,
+	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_file_to_ctx(file), f,
 				     MTK_JPEG_FMT_FLAG_OUTPUT);
 }
 
@@ -488,7 +483,7 @@ static int mtk_jpeg_s_fmt_vid_cap_mplane(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_fh_to_ctx(priv), f,
+	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_file_to_ctx(file), f,
 				     MTK_JPEG_FMT_FLAG_CAPTURE);
 }
 
@@ -517,7 +512,7 @@ static int mtk_jpeg_subscribe_event(struct v4l2_fh *fh,
 static int mtk_jpeg_enc_g_selection(struct file *file, void *priv,
 				    struct v4l2_selection *s)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		return -EINVAL;
@@ -542,7 +537,7 @@ static int mtk_jpeg_enc_g_selection(struct file *file, void *priv,
 static int mtk_jpeg_dec_g_selection(struct file *file, void *priv,
 				    struct v4l2_selection *s)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
@@ -571,7 +566,7 @@ static int mtk_jpeg_dec_g_selection(struct file *file, void *priv,
 static int mtk_jpeg_enc_s_selection(struct file *file, void *priv,
 				    struct v4l2_selection *s)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		return -EINVAL;
@@ -594,7 +589,7 @@ static int mtk_jpeg_enc_s_selection(struct file *file, void *priv,
 static int mtk_jpeg_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 	struct vb2_queue *vq;
 	struct vb2_buffer *vb;
 	struct mtk_jpeg_src_buf *jpeg_src_buf;

-- 
2.49.0


