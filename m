Return-Path: <linux-media+bounces-38793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38514B18D5E
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01B833A52DB
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722BD28135D;
	Sat,  2 Aug 2025 09:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZXo/EEzc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F4123506A;
	Sat,  2 Aug 2025 09:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754127174; cv=none; b=N7LGWQazaImx9/KWLfFkuYJ1Y/sRxQwBIgHZnCaqTGrar3/8UqvjxlNehRFR+wcYDadazlj3zd/svcp5FHfOkoy80A/sduhU8Levb/4JynGlenS80Sh0qCk+BvB/+ekUR1IElJtM3YrXm3Io8R2fDnIq+6QWSOmMtPjGN7YJkRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754127174; c=relaxed/simple;
	bh=ZvKqCdGZE5NgMq9FgjAr1nh972WU8DfmRgsFRNhSxA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pjN+U/zy+6BxbJY8Qvd1T39N9YR398DTneBFawj6Zp+wy+ECVewLll3OqQ1yxeWVcMbPbT8m9yCHDi8DMGJcyEUDAsAADRwpEKdwLd9tguutQAhq9/7Kig+I5GQt2ZyKq+dIruVniwm4GrcAUv9JfA8VT5sJQU7BiS5M2i/a0Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZXo/EEzc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A389B4341;
	Sat,  2 Aug 2025 11:31:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754127126;
	bh=ZvKqCdGZE5NgMq9FgjAr1nh972WU8DfmRgsFRNhSxA0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZXo/EEzcfsoL0MCa0VKqSc4UA5axyvQVuHLoi9PYTpH5UJUkT2i4azMziity5n17n
	 lOZZ5sH5vxI65RRDd2i3s0YLyAHu39FQGq7oZqXow2Kk85lFObsrct7vP3YMhsD9au
	 MTS/L47BsL2tMyoLNdIZZFgOLwJ9TOKGzzcImVHg=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:16 +0200
Subject: [PATCH 54/65] media: hantro: Access v4l2_fh from
 file->private_data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-54-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5314;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=CbTiDL7FaHYjSvCqveksypLiZlWBs+5bYF3cQ2sKHO0=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj+lwkDLh/f2fAT4DbemdRP1NEXwtCLWEulL
 0mj3tdsleyJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/gAKCRByNAaPFqFW
 PCyVD/9ZvVxYe+kKWfjMKd1gPcchNYPcCnnB9QNb0/iOSUaZB1x8Njr2SeKLeDXOuOxxIMQiz9P
 6enRBLF1KwDYciWImRSrgBo6FEgFSlfyirZsjERXxJ8TWU+ZWEqmFmJw5QoTentbcc3BYIdBER2
 pBR9J83jgE9Qgz8RwlrXUAIFc0Lu1HyOScJ1U5I6eMgm9fdfwQF4eQta2LjroTFYpY9b/mxIipF
 3IdKC9KXADMaC9jdgOKLGXAiKW1/x7x+WdpyRqh1gnTjb73+OXg8HLqmb//XioVMc6mB/pRp6Al
 t/KnsKCXelL+Xv0tkK7Ox7KobRN1G83G7ICsAmQ1mZfyG5zgvYCQ3qUFsKNm+YQs40odlXG794M
 5BoByEfzxbVwlrvWnLSZLGawdVtm72mtO5hXk9lIKgVD9Gq6x2N6/MXBWFgRgiFPPa5oIkpUWke
 zj050fb32iGn01ouJNo/DcbyC3DcvSZKXKn2Z5akPRqj/AfNU1ybXdXKtd8DQqIQzwc4ND/ez6q
 TauCRrh8KNMZAoHlV63x48z8cVTXiGiAJo7zhFWBWKxcGAt/TKbN3LIsQAKAFCkVydWPp0r+/zn
 10ukeG9UeMYKPVpecH4n6yQ5g9ufCTaCLjqHf0UixURCC120DZCEGfyNwp+n/pr1auQZ6TCoPJH
 TV3J2u1bDozZx4g==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

To prepare for the introduction of video_device_state as second argument
of the v4l2_ioctl_ops handler, access the v4l2_fh from
file->private_data instead of using void *priv.

The file->private_data is initialized to point to the v4l2_fh
by the usage of v4l2_fh_init() in the v4l2_file_operations.open()
handler.

While at it remove the only left user of fh_to_ctx() and remove
the macro completely.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/verisilicon/hantro.h      |  5 -----
 drivers/media/platform/verisilicon/hantro_v4l2.c | 22 +++++++++++-----------
 2 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 0f10714f1953945472e11d8c8ad87f8ec009b39f..e0fdc4535b2d73c5260057b0a89aee67a4732dd2 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -382,11 +382,6 @@ extern int hantro_debug;
 	pr_err("%s:%d: " fmt, __func__, __LINE__, ##args)
 
 /* Structure access helpers. */
-static __always_inline struct hantro_ctx *fh_to_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct hantro_ctx, fh);
-}
-
 static __always_inline struct hantro_ctx *file_to_ctx(struct file *filp)
 {
 	return container_of(file_to_v4l2_fh(filp), struct hantro_ctx, fh);
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 7c3515cf7d64a090adfb8d8aff368f9a617f8c8a..6bcd892e7bb49c654aae5841664d68c1692064bd 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -185,7 +185,7 @@ static int vidioc_querycap(struct file *file, void *priv,
 static int vidioc_enum_framesizes(struct file *file, void *priv,
 				  struct v4l2_frmsizeenum *fsize)
 {
-	struct hantro_ctx *ctx = fh_to_ctx(priv);
+	struct hantro_ctx *ctx = file_to_ctx(file);
 	const struct hantro_fmt *fmt;
 
 	fmt = hantro_find_format(ctx, fsize->pixel_format);
@@ -217,7 +217,7 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 			   struct v4l2_fmtdesc *f, bool capture)
 
 {
-	struct hantro_ctx *ctx = fh_to_ctx(priv);
+	struct hantro_ctx *ctx = file_to_ctx(file);
 	const struct hantro_fmt *fmt, *formats;
 	unsigned int num_fmts, i, j = 0;
 	bool skip_mode_none, enum_all_formats;
@@ -297,7 +297,7 @@ static int vidioc_g_fmt_out_mplane(struct file *file, void *priv,
 				   struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct hantro_ctx *ctx = fh_to_ctx(priv);
+	struct hantro_ctx *ctx = file_to_ctx(file);
 
 	vpu_debug(4, "f->type = %d\n", f->type);
 
@@ -310,7 +310,7 @@ static int vidioc_g_fmt_cap_mplane(struct file *file, void *priv,
 				   struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct hantro_ctx *ctx = fh_to_ctx(priv);
+	struct hantro_ctx *ctx = file_to_ctx(file);
 
 	vpu_debug(4, "f->type = %d\n", f->type);
 
@@ -398,13 +398,13 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 static int vidioc_try_fmt_cap_mplane(struct file *file, void *priv,
 				     struct v4l2_format *f)
 {
-	return hantro_try_fmt(fh_to_ctx(priv), &f->fmt.pix_mp, f->type);
+	return hantro_try_fmt(file_to_ctx(file), &f->fmt.pix_mp, f->type);
 }
 
 static int vidioc_try_fmt_out_mplane(struct file *file, void *priv,
 				     struct v4l2_format *f)
 {
-	return hantro_try_fmt(fh_to_ctx(priv), &f->fmt.pix_mp, f->type);
+	return hantro_try_fmt(file_to_ctx(file), &f->fmt.pix_mp, f->type);
 }
 
 static void
@@ -648,19 +648,19 @@ static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
 static int
 vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
 {
-	return hantro_set_fmt_out(fh_to_ctx(priv), &f->fmt.pix_mp, HANTRO_AUTO_POSTPROC);
+	return hantro_set_fmt_out(file_to_ctx(file), &f->fmt.pix_mp, HANTRO_AUTO_POSTPROC);
 }
 
 static int
 vidioc_s_fmt_cap_mplane(struct file *file, void *priv, struct v4l2_format *f)
 {
-	return hantro_set_fmt_cap(fh_to_ctx(priv), &f->fmt.pix_mp);
+	return hantro_set_fmt_cap(file_to_ctx(file), &f->fmt.pix_mp);
 }
 
 static int vidioc_g_selection(struct file *file, void *priv,
 			      struct v4l2_selection *sel)
 {
-	struct hantro_ctx *ctx = fh_to_ctx(priv);
+	struct hantro_ctx *ctx = file_to_ctx(file);
 
 	/* Crop only supported on source. */
 	if (!ctx->is_encoder ||
@@ -691,7 +691,7 @@ static int vidioc_g_selection(struct file *file, void *priv,
 static int vidioc_s_selection(struct file *file, void *priv,
 			      struct v4l2_selection *sel)
 {
-	struct hantro_ctx *ctx = fh_to_ctx(priv);
+	struct hantro_ctx *ctx = file_to_ctx(file);
 	struct v4l2_rect *rect = &sel->r;
 	struct vb2_queue *vq;
 
@@ -738,7 +738,7 @@ static const struct v4l2_event hantro_eos_event = {
 static int vidioc_encoder_cmd(struct file *file, void *priv,
 			      struct v4l2_encoder_cmd *ec)
 {
-	struct hantro_ctx *ctx = fh_to_ctx(priv);
+	struct hantro_ctx *ctx = file_to_ctx(file);
 	int ret;
 
 	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, priv, ec);

-- 
2.49.0


