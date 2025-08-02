Return-Path: <linux-media+bounces-38788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEC2B18D22
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40B211885410
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB2C2586EB;
	Sat,  2 Aug 2025 09:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HpX5BDdV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E73227BB5;
	Sat,  2 Aug 2025 09:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754127101; cv=none; b=dR2hAGKCcMWtchWznr7PpZmHRMkpwD+PfnTH3s6oqop+PDzQKCtOzoh7O9zljuDXZ80kNpFjTexKsPUQCe1sBMY4F9mk6mELcNC47X8/2GYdDgTHlOWCTJw9tCzkE5b+4esRgVBQ+vjKAABoOr+99ExjCtnxhQ8BQJhEA09WCLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754127101; c=relaxed/simple;
	bh=e9spn0Wp0nY1lMfXntKTb/kLvwEFE4ID3yslOAjGdJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FU+zuq2RCCgfTlAeQfIbpA6/4wf2VkS2EqK2VN2X50WikaCO1lSey0gccnrKGcvJcvavCx3+BwGhWDyMK7m8LwpGm27MK42FK2BAinlhLxwQtk5mlUI1iScr+M+e01T3hTRX+e2naraSLnhiSJ3zBX9el7E3x40JFaweeGRJLVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HpX5BDdV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B88723FCE;
	Sat,  2 Aug 2025 11:30:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754127052;
	bh=e9spn0Wp0nY1lMfXntKTb/kLvwEFE4ID3yslOAjGdJI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HpX5BDdVS3j+pTsNcwI1BeCJShWH8n9M85Z1l5akK04RGo19pEFRLt6X/IxG5rJOl
	 poLl3ecPsVXrhmA1hnnbF5A0Kjc6WhMdGf1Q0Y9vJ8ijF78krqD2t5L4pCzXJojnGU
	 PJ/ijYO2i6nQmjKqqWUzB4vwpkcHyzab7qcD1niw=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:11 +0200
Subject: [PATCH 49/65] media: s5p-jpeg: Access v4l2_fh from file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-49-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4867;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=e9spn0Wp0nY1lMfXntKTb/kLvwEFE4ID3yslOAjGdJI=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj99eZoQBrrRU8HwZCp/lEmCC2AHXC6KN4bo
 5sTBWh+2PmJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/QAKCRByNAaPFqFW
 POKlEACwPh0PROmzVn8vNI8tmgzbJ3MnsT1OqXi7X6rM2NINFWzgSBIn68R5SI9nExICwVvZOcg
 C/VU+1NnSJmzepB4eugrvkN8R/ohZPC931mfV5qnxmgqlfzIqhHFxL/yTAzB38rIMy6W79Iz0wz
 /2vu83MetiFDnqHirzlPi971oztZDB3goYVIWsVt2VHSjdxv84OLJy4k4K+uH28ZQLSzDtDuF+e
 rmvsS0NnkAcB00aYRXJBygz6VJc6NX4UXXRUr2k7t7nBGdyypfMnT6wCCnfVl2D/ZJqtPwIqOA+
 lqCYjutFAd2rqSrAH8+p49h8x6tUkSX8D/2pbGQE4XlqNLqfEqHEB9wDFguUkoTgcP63SiSTVDt
 cjEzihdAXBLo/FZvYtllF3pzk/CygB7kQbuCX+65CBD3mA4hFxTgMUVs06EWPuGYuMMCxMYznc6
 rJYKEUEZ83mM/c0/rdTHpa9zf4l25/nJ+N+88J4jWdYjdfgt0oihZQRHC8B9km3bomn1Chf4EMt
 FGW4aMoIugkEgb0C7vNcfkDdTLQQQzhiK9hFvThH8lAwJAfV/9danxqiMj/hrf2T9JXXicqycZ0
 NYKJ31e5gDAGyuFSX3Cpfv5NBB7pUKfd0az1qZiKNEJWanS9nhV99GPNis9HU370KDk2gE5jOLF
 os4dXx+4t0F7obw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

While at it, remove the now unused fh_to_ctx() macro.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/samsung/s5p-jpeg/jpeg-core.c    | 25 +++++++++-------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
index 2a57efd181540183e7d2b66d51f9f2f274ddd100..81792f7f8b1671dba2023f99b2779784d9a14b8c 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
@@ -580,11 +580,6 @@ static inline struct s5p_jpeg_ctx *ctrl_to_ctx(struct v4l2_ctrl *c)
 	return container_of(c->handler, struct s5p_jpeg_ctx, ctrl_handler);
 }
 
-static inline struct s5p_jpeg_ctx *fh_to_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct s5p_jpeg_ctx, fh);
-}
-
 static inline struct s5p_jpeg_ctx *file_to_ctx(struct file *filp)
 {
 	return container_of(file_to_v4l2_fh(filp), struct s5p_jpeg_ctx, fh);
@@ -1015,8 +1010,8 @@ static int s5p_jpeg_open(struct file *file)
 
 static int s5p_jpeg_release(struct file *file)
 {
-	struct s5p_jpeg *jpeg = video_drvdata(file);
 	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
+	struct s5p_jpeg *jpeg = video_drvdata(file);
 
 	mutex_lock(&jpeg->lock);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
@@ -1253,7 +1248,7 @@ static bool s5p_jpeg_parse_hdr(struct s5p_jpeg_q_data *result,
 static int s5p_jpeg_querycap(struct file *file, void *priv,
 			   struct v4l2_capability *cap)
 {
-	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
 
 	if (ctx->mode == S5P_JPEG_ENCODE) {
 		strscpy(cap->driver, S5P_JPEG_M2M_NAME,
@@ -1301,7 +1296,7 @@ static int enum_fmt(struct s5p_jpeg_ctx *ctx,
 static int s5p_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 				   struct v4l2_fmtdesc *f)
 {
-	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
 
 	if (ctx->mode == S5P_JPEG_ENCODE)
 		return enum_fmt(ctx, sjpeg_formats, SJPEG_NUM_FORMATS, f,
@@ -1314,7 +1309,7 @@ static int s5p_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 static int s5p_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
 				   struct v4l2_fmtdesc *f)
 {
-	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
 
 	if (ctx->mode == S5P_JPEG_ENCODE)
 		return enum_fmt(ctx, sjpeg_formats, SJPEG_NUM_FORMATS, f,
@@ -1340,7 +1335,7 @@ static int s5p_jpeg_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	struct vb2_queue *vq;
 	struct s5p_jpeg_q_data *q_data = NULL;
 	struct v4l2_pix_format *pix = &f->fmt.pix;
-	struct s5p_jpeg_ctx *ct = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ct = file_to_ctx(file);
 
 	vq = v4l2_m2m_get_vq(ct->fh.m2m_ctx, f->type);
 	if (!vq)
@@ -1480,7 +1475,7 @@ static int vidioc_try_fmt(struct v4l2_format *f, struct s5p_jpeg_fmt *fmt,
 static int s5p_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
-	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
 	struct v4l2_pix_format *pix = &f->fmt.pix;
 	struct s5p_jpeg_fmt *fmt;
 	int ret;
@@ -1539,7 +1534,7 @@ static int s5p_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
 static int s5p_jpeg_try_fmt_vid_out(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
-	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
 	struct s5p_jpeg_fmt *fmt;
 
 	fmt = s5p_jpeg_find_format(ctx, f->fmt.pix.pixelformat,
@@ -1686,7 +1681,7 @@ static int s5p_jpeg_s_fmt_vid_cap(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return s5p_jpeg_s_fmt(fh_to_ctx(priv), f);
+	return s5p_jpeg_s_fmt(file_to_ctx(file), f);
 }
 
 static int s5p_jpeg_s_fmt_vid_out(struct file *file, void *priv,
@@ -1698,7 +1693,7 @@ static int s5p_jpeg_s_fmt_vid_out(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return s5p_jpeg_s_fmt(fh_to_ctx(priv), f);
+	return s5p_jpeg_s_fmt(file_to_ctx(file), f);
 }
 
 static int s5p_jpeg_subscribe_event(struct v4l2_fh *fh,
@@ -1795,7 +1790,7 @@ static int exynos3250_jpeg_try_crop(struct s5p_jpeg_ctx *ctx,
 static int s5p_jpeg_g_selection(struct file *file, void *priv,
 			 struct v4l2_selection *s)
 {
-	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
 	    s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)

-- 
2.49.0


