Return-Path: <linux-media+bounces-38784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD8DB18D03
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A78816E70B
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0747827D776;
	Sat,  2 Aug 2025 09:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Qm8VlMMd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C4E226D14;
	Sat,  2 Aug 2025 09:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754127054; cv=none; b=IM6ylgQwpkM8AcpmZAsX7qT0oVCP4sSRtPvS0sNJz0oIQO7I6VPLwjblrznsG9sO8vas/vuBSBYTuwu9j33ErPhpL4gzFxNoLVB/hGzuNf4YTneolKgREalxifLR1wfbtRIal/N7Y8U31XcGE0/b6jSzZILNng8Quhaxa9zWnI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754127054; c=relaxed/simple;
	bh=xHnhOGEMWbiAskGZ/qB9Pnn4oRUTnceFuQgyRVWi5Z4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hW6UouFDDHcpOp5MMChvcVD+D5R2TYS8yNZLsDfCZmFYSepaRyAByuEHmGT1m/VV7kznc6xnacBlZT2l6Y0greDgiWA34aKxOdYHInmbP5X5yXLIJgKolf5omN++sXVmGV+1zWmfLqr27YAEfziEpoOQhKnpA3YmC8+hdRz1rpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Qm8VlMMd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10B5D4126;
	Sat,  2 Aug 2025 11:29:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754127005;
	bh=xHnhOGEMWbiAskGZ/qB9Pnn4oRUTnceFuQgyRVWi5Z4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Qm8VlMMdD2mYpZ3jp8TiUK71YniJfD/W+U3FXDvkjAOJ90OJwj4al+DQ5JYMy5IJA
	 V1dTufXhg0/73p0n/9BN0o2p9OtealswLjQtP6Ul/KN2+PcPPz23WefAZU8vnmwaCp
	 JlEi0d/D0b6LzhryhAg86Gmp9WQNciqsWUkiM9A4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:07 +0200
Subject: [PATCH 45/65] media: exynos-gsc: Access v4l2_fh from file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-45-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5168;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=xHnhOGEMWbiAskGZ/qB9Pnn4oRUTnceFuQgyRVWi5Z4=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj8mJTRrXDLZmlcFTn5RabMqJPlofNXwIR40
 Mp7zonG0TCJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/AAKCRByNAaPFqFW
 POP5D/0YMuyBDL0G469A3dQex0lq+u9oMevFJtDvon3YgoFWn8rVfh39dM7Miv2PMU5cy/NsTLd
 f+3KO1inbR/ppCbjkFdOoYPxszXvrr+AYE4PQQ6dmoXMGfaYzKhCEaGBISizKwCe8C1VE1wQjnx
 beevIt1FLO/FDXjoII+Hk+gNLEapJgchdW76opTMxcU1f9k+ldr7BuLho65E9Z5z+CAwNuTsxDT
 W+NYh6ak5wp6eMTlBQeYtpJeY/f0ZZIVSFX9uuvwTXSLGSPCsonZosaKOL2oasrhdQy7zyAePGs
 Xu8DpRyTeJJEuEWAHEGq8MIsNz9fBS7qz/q5BdJrRnFEQFDi5SZ3+hopYbp3ZgPam9BtJQviGLe
 hWd0d9slmpAZ4i67M1dNiJUfdB22NDRPprPqV7IDSI8mBSdracO/VcBDwKgS7YLAMpHz9/DIIrn
 XPfwHPeTtH5Wn608pM8qqwAjAQrNNVr+yxoD7bfbROE2thO94uVX1GzAL2BxBhrwpWws1SlCSh0
 L7h7MSfCAjgQ/a+MiZ8cjrGqN87HOh8zG3nAhWmyzaTLW040hsL6w+BNotcPAR0CvvEtQV22/hE
 TK79grAfwHWgcbGKQTOA1yO79fNp5t73ipYVezgZErk4LcQA7FFGjTVRzJ3AOu3j+EPkzTuR/Rq
 qF7qIxPbZn5s6iQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

While at it, remove the now unused fh_to_ctx() macro.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/samsung/exynos-gsc/gsc-core.h   |  2 --
 .../media/platform/samsung/exynos-gsc/gsc-m2m.c    | 24 +++++++++++-----------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos-gsc/gsc-core.h b/drivers/media/platform/samsung/exynos-gsc/gsc-core.h
index a5491fe39e0f686c75c888c4632150f32326c36e..265221abf4dcd87f2ab10758e145fa96ac9d420e 100644
--- a/drivers/media/platform/samsung/exynos-gsc/gsc-core.h
+++ b/drivers/media/platform/samsung/exynos-gsc/gsc-core.h
@@ -85,8 +85,6 @@ enum gsc_yuv_fmt {
 	GSC_CRCB,
 };
 
-#define fh_to_ctx(__fh) container_of(__fh, struct gsc_ctx, fh)
-
 #define is_rgb(x) (!!((x) & 0x1))
 #define is_yuv420(x) (!!((x) & 0x2))
 #define is_yuv422(x) (!!((x) & 0x4))
diff --git a/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c b/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
index 2999fb2610f0f61b63d0331f94883469ff43d751..722e2531e23f1bc01f5e9a9c08dfe4745cc2aa4f 100644
--- a/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
+++ b/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
@@ -297,7 +297,7 @@ static int gsc_m2m_enum_fmt(struct file *file, void *priv,
 static int gsc_m2m_g_fmt_mplane(struct file *file, void *fh,
 			     struct v4l2_format *f)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 
 	return gsc_g_fmt_mplane(ctx, f);
 }
@@ -305,7 +305,7 @@ static int gsc_m2m_g_fmt_mplane(struct file *file, void *fh,
 static int gsc_m2m_try_fmt_mplane(struct file *file, void *fh,
 				  struct v4l2_format *f)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 
 	return gsc_try_fmt_mplane(ctx, f);
 }
@@ -313,7 +313,7 @@ static int gsc_m2m_try_fmt_mplane(struct file *file, void *fh,
 static int gsc_m2m_s_fmt_mplane(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	struct vb2_queue *vq;
 	struct gsc_frame *frame;
 	struct v4l2_pix_format_mplane *pix;
@@ -359,7 +359,7 @@ static int gsc_m2m_s_fmt_mplane(struct file *file, void *fh,
 static int gsc_m2m_reqbufs(struct file *file, void *fh,
 			  struct v4l2_requestbuffers *reqbufs)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	struct gsc_dev *gsc = ctx->gsc_dev;
 	u32 max_cnt;
 
@@ -374,35 +374,35 @@ static int gsc_m2m_reqbufs(struct file *file, void *fh,
 static int gsc_m2m_expbuf(struct file *file, void *fh,
 				struct v4l2_exportbuffer *eb)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	return v4l2_m2m_expbuf(file, ctx->m2m_ctx, eb);
 }
 
 static int gsc_m2m_querybuf(struct file *file, void *fh,
 					struct v4l2_buffer *buf)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	return v4l2_m2m_querybuf(file, ctx->m2m_ctx, buf);
 }
 
 static int gsc_m2m_qbuf(struct file *file, void *fh,
 			  struct v4l2_buffer *buf)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	return v4l2_m2m_qbuf(file, ctx->m2m_ctx, buf);
 }
 
 static int gsc_m2m_dqbuf(struct file *file, void *fh,
 			   struct v4l2_buffer *buf)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	return v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
 }
 
 static int gsc_m2m_streamon(struct file *file, void *fh,
 			   enum v4l2_buf_type type)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 
 	/* The source and target color format need to be set */
 	if (V4L2_TYPE_IS_OUTPUT(type)) {
@@ -418,7 +418,7 @@ static int gsc_m2m_streamon(struct file *file, void *fh,
 static int gsc_m2m_streamoff(struct file *file, void *fh,
 			    enum v4l2_buf_type type)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	return v4l2_m2m_streamoff(file, ctx->m2m_ctx, type);
 }
 
@@ -440,8 +440,8 @@ static int is_rectangle_enclosed(struct v4l2_rect *a, struct v4l2_rect *b)
 static int gsc_m2m_g_selection(struct file *file, void *fh,
 			struct v4l2_selection *s)
 {
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	struct gsc_frame *frame;
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
 
 	if ((s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) &&
 	    (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT))
@@ -478,7 +478,7 @@ static int gsc_m2m_s_selection(struct file *file, void *fh,
 				struct v4l2_selection *s)
 {
 	struct gsc_frame *frame;
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	struct gsc_variant *variant = ctx->gsc_dev->variant;
 	struct v4l2_selection sel = *s;
 	int ret;

-- 
2.49.0


