Return-Path: <linux-media+bounces-38779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BD3B18CDB
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5447E16816C
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B62248871;
	Sat,  2 Aug 2025 09:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hT8Gx6Bm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653352797A3;
	Sat,  2 Aug 2025 09:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754127008; cv=none; b=Jj2ywAoNqeAo2D8utraznNXkef3AZZq7CjbAvr8TbXuuL0RQnVnxGcdr6iidJMKaxnwZVsdO+9zOUXLekJy25HmHLLLJwIwYd6s9P3d8o/fPPdLzaU1cSeHfEU4N73dP82BYfci6a6+jFQeA77V+6O96XUtCTKpRFifbZIIGyBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754127008; c=relaxed/simple;
	bh=DR8H5PIAc8L4JOzfoP4xWpCxebhDCEnaJqqWhPBFy+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ug1QI8sYv+2Mkc4VBK7fi5t7+v77d31BgdPw3jz+E/rc5d70KLwRTtSLUjgUUKeezZipnQDEk+iXTdMNj4bz3noxa73LQtYAraof2nNRLSHEbhe6nixJzwlmk5Po94/b+HFpkeSh47s1wl5FGEs2t7xASy1YqpRnLCi5yKH4JlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hT8Gx6Bm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDA0D3C97;
	Sat,  2 Aug 2025 11:29:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126959;
	bh=DR8H5PIAc8L4JOzfoP4xWpCxebhDCEnaJqqWhPBFy+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hT8Gx6BmOM76bDFeML8LExuJPTAnht6Wvn57/qJhB7+ZhlNMqfXhEkASH3NW3RuyW
	 UZTqUXH/j8H6xn9lPsNIuJ1E2Ht2wzHcwFHMec6ZTXX4zFnaK3T8vOqZ9UuNg86A45
	 wLsnMm4kFRwPqYJBTI/nmtZ/BWbP+cVS1qJzP4Mw=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:02 +0200
Subject: [PATCH 40/65] media: imx-isi: Access v4l2_fh from file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-40-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3477;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=DR8H5PIAc8L4JOzfoP4xWpCxebhDCEnaJqqWhPBFy+0=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj8EoZgkMCHL3+wASHVhjTV75Orj6SKgaDZA
 6AcS4LUd4KJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/AAKCRByNAaPFqFW
 POVpD/9a3Ls6bK9algAcZ2oeiBjNz7tRIjEIwEqB46qB5Bq/kQDbriurqxVTCwNigHT9yYh0mXP
 7cACNJ33RBJeyO9365kZBXs/wmIKGs/p4y+dJ8d2bdWddvcupEtgqZNitoozeu7ESiwRcXbm3y+
 BoqB1V1jDTE11ypab29+vcaKo4qzSBIP3Hrtk4YeBKLn7gvYgaFBrNEonU6NKD9ODA/LIQulZRe
 73jR/l7r+PYcnZ7Rx2T3rwKBgs8D83nyaNr0oEZik56YfleC18XsXP3MSfruSvbfjD6GZWeNrgd
 712W4aBRF81a+B6kH5V8Aovltk00OUqLELIBHSUZ7El7W4Me1pXr/QPd6vAC1H+DRpxf2j40+RN
 TDxqmDHi3YGoi8kJ0PnEMVgSCBCaLXRuhS8dGLvwvkIDAcuHVFiPB8byYSwpkGOYBKB7luuYB7H
 4xIhq9bAWnGPh09Xfuwcd9HL+8K5DLRYr1sqRYZZ55yszHbxWsYKKm4yD7EKfvDRiOMJb3LBBrX
 Z35HmnmFMEe15m2PWocAX01Sgl4eA0YFESsMERAWjZQgueknFQDoJGsL4JOMUxeaYI6kcUScc+3
 RYuRDI3FkGlEJpgXEYQ+q+gim7m/X5v4sL1NiwSpLY259tUn9RHwSBlkYDikigIZORsM45vlmyz
 zSJL01P1ffA0xNA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

While at it, remove the now unused to_isi_m2m_ctx() macro.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 850dd8ae95841d4470ac6bd7cb1e54a7510d6d5e..5501214cc6c0ce3e0188ae6d4ff4ae277b975911 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -74,11 +74,6 @@ to_isi_m2m_buffer(struct vb2_v4l2_buffer *buf)
 	return container_of(buf, struct mxc_isi_m2m_buffer, buf.vb);
 }
 
-static inline struct mxc_isi_m2m_ctx *to_isi_m2m_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct mxc_isi_m2m_ctx, fh);
-}
-
 static inline struct mxc_isi_m2m_ctx *file_to_isi_m2m_ctx(struct file *filp)
 {
 	return container_of(file_to_v4l2_fh(filp), struct mxc_isi_m2m_ctx, fh);
@@ -432,7 +427,7 @@ static int mxc_isi_m2m_try_fmt_vid(struct file *file, void *fh,
 	const enum mxc_isi_video_type type =
 		f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ?
 		MXC_ISI_VIDEO_M2M_OUT : MXC_ISI_VIDEO_M2M_CAP;
-	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
 
 	__mxc_isi_m2m_try_fmt_vid(ctx, &f->fmt.pix_mp, type);
 
@@ -442,7 +437,7 @@ static int mxc_isi_m2m_try_fmt_vid(struct file *file, void *fh,
 static int mxc_isi_m2m_g_fmt_vid(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
 	const struct mxc_isi_m2m_ctx_queue_data *qdata =
 		mxc_isi_m2m_ctx_qdata(ctx, f->type);
 
@@ -457,7 +452,7 @@ static int mxc_isi_m2m_s_fmt_vid(struct file *file, void *fh,
 	const enum mxc_isi_video_type type =
 		f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ?
 		MXC_ISI_VIDEO_M2M_OUT : MXC_ISI_VIDEO_M2M_CAP;
-	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
 	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
 	const struct mxc_isi_format_info *info;
 	struct vb2_queue *vq;
@@ -489,7 +484,7 @@ static int mxc_isi_m2m_s_fmt_vid(struct file *file, void *fh,
 static int mxc_isi_m2m_streamon(struct file *file, void *fh,
 				enum v4l2_buf_type type)
 {
-	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
 	struct mxc_isi_m2m_ctx_queue_data *q = mxc_isi_m2m_ctx_qdata(ctx, type);
 	const struct v4l2_pix_format_mplane *out_pix = &ctx->queues.out.format;
 	const struct v4l2_pix_format_mplane *cap_pix = &ctx->queues.cap.format;
@@ -577,7 +572,7 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
 static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
 				 enum v4l2_buf_type type)
 {
-	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
 	struct mxc_isi_m2m_ctx_queue_data *q = mxc_isi_m2m_ctx_qdata(ctx, type);
 	struct mxc_isi_m2m *m2m = ctx->m2m;
 

-- 
2.49.0


