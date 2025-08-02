Return-Path: <linux-media+bounces-38777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA1CB18CCA
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59F99564A81
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4946278172;
	Sat,  2 Aug 2025 09:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WrzWKhJz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F95222587;
	Sat,  2 Aug 2025 09:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126992; cv=none; b=qB02zl7i3Ofilbmkhydqvp5rs6lzclwqCEH+Qg/Ltjrx5pIoPrMFh1CLd/TDRc048Z0vtpIVxecrv71fi2YYAg6IzbHCgltUDErXkZwwtaPWaFrWsmv7bg6i8Vf+Hv/JKbt2mR8QRw4oP8R4UcvD+C07f2ACmshTRrp5/kWCvyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126992; c=relaxed/simple;
	bh=MthwYUOLpqBn0ba6jZYKpMy9cQjcqOQkTUKOiMmYskY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JODgYuVDUlVxPya1mM/SIT2VmlkeCGzzpNFGsQzoAt14BDrRZRHCxc6Ykz3vo6bDFhQM2rPXLnVDTN03J1JyYgvwvAOLCMlRklCOuxadEqsvTUBhx4qVT+/FcsPCFJWenWAn3xkSZsITa5b0EoeQfUc2/d+CP7csQc07e10A+sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WrzWKhJz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 395973E43;
	Sat,  2 Aug 2025 11:28:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126942;
	bh=MthwYUOLpqBn0ba6jZYKpMy9cQjcqOQkTUKOiMmYskY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WrzWKhJzGGme5zOuQKXcQS/gNGIUjt+o1Z00R2tij+Qj4M9aA/SV+y5Z26X7R3HR1
	 nYV72q1Za8zMTe1MdtszLQQRIrdrEHwMHomB/rG6zrt8mk52l3LNAcujKID2JmXYOv
	 3WD21E56BSQ+HYPkYABpAkGGxFx8a7Yv2PLlaV8g=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:00 +0200
Subject: [PATCH 38/65] media: tegra-vde: Access v4l2_fh from file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-38-eb140ddd6a9d@ideasonboard.com>
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
 bh=MthwYUOLpqBn0ba6jZYKpMy9cQjcqOQkTUKOiMmYskY=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj8TQAFq4EkLSez561K0ZCn/vn/BBJTmiqEC
 bdHNw8gzSWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/AAKCRByNAaPFqFW
 PJFxD/0TIoksJkRESbXqmBqgUb3qo3kiE82eWw0Z6Q17TElBpWIw99pBtQOEfWrjRc99I2UNoAc
 mCWz87rZyt3b6rGydUaLt9eHY90h2RMG8ZuGxvsCjUqNu2QgiOXjLWK+BThZ6GSsaJU/obfD58m
 M5vJxlycDcFVA5yj4c9cYo9gOkSEthg2q7w+YAK5woOn3Vhbu23YWdJCoZpSNqcddOpyHsiqnEZ
 avPs8NZ686jUTHS/YnHe3ZYCI/gQcUffV4SXamBdh+FkxWa0WALMw86oWkcaFkX5WXmX9wNfith
 /kP9lim1JndmUQqWhp2EC7h7aowy/H3g4BtOWW9Z00CDQZ+3e4LiZ7Kqddsxq0uE5QNF7jPETC1
 hJybOhHs6dvry1LAO5LFktHgr2lIdVTZQs9thfuO2XeQoqVM6z4bBjwLozzZsiN6urjUYoUz1XC
 iYuPhRgfbhwGyHjeVLsCHuXYR6JmLQXWLDCs6ZamO1AxcA1+VIjV3MS9lbcssLjGWrs++h+MJbD
 KljduZoHMhOINt+uFXu/pPJDBZ/AC/9qe73RGy3LvPoTSfbm+fTyCcLaqIn3INSuce3gG9VafpX
 3OWHslj9R1uowlyL4FDQTnn2sNB+gM5WCqNDA5Sjx3AwLtjkJT1LApcSPeOOfKoBM/c3R1RVeVD
 u4zEl7mhyZWHBtw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/nvidia/tegra-vde/v4l2.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/v4l2.c b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
index 0c50f4ff82e0a8f4935325d00691c58072182926..d94978ae2baf3394206ad7c3eb7a400aeee47cf7 100644
--- a/drivers/media/platform/nvidia/tegra-vde/v4l2.c
+++ b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
@@ -46,9 +46,9 @@ static const struct v4l2_ctrl_config ctrl_cfgs[] = {
 	},
 };
 
-static inline struct tegra_ctx *fh_to_tegra_ctx(struct v4l2_fh *fh)
+static inline struct tegra_ctx *file_to_tegra_ctx(struct file *file)
 {
-	return container_of(fh, struct tegra_ctx, fh);
+	return container_of(file_to_v4l2_fh(file), struct tegra_ctx, fh);
 }
 
 static void tegra_set_control_data(struct tegra_ctx *ctx, void *data, u32 id)
@@ -506,7 +506,7 @@ static int tegra_querycap(struct file *file, void *priv,
 static int tegra_enum_decoded_fmt(struct file *file, void *priv,
 				  struct v4l2_fmtdesc *f)
 {
-	struct tegra_ctx *ctx = fh_to_tegra_ctx(priv);
+	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
 
 	if (WARN_ON(!ctx->coded_fmt_desc))
 		return -EINVAL;
@@ -522,7 +522,7 @@ static int tegra_enum_decoded_fmt(struct file *file, void *priv,
 static int tegra_g_decoded_fmt(struct file *file, void *priv,
 			       struct v4l2_format *f)
 {
-	struct tegra_ctx *ctx = fh_to_tegra_ctx(priv);
+	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
 
 	*f = ctx->decoded_fmt;
 	return 0;
@@ -531,8 +531,8 @@ static int tegra_g_decoded_fmt(struct file *file, void *priv,
 static int tegra_try_decoded_fmt(struct file *file, void *priv,
 				 struct v4l2_format *f)
 {
+	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct tegra_ctx *ctx = fh_to_tegra_ctx(priv);
 	const struct tegra_coded_fmt_desc *coded_desc;
 	unsigned int i;
 
@@ -571,7 +571,7 @@ static int tegra_try_decoded_fmt(struct file *file, void *priv,
 static int tegra_s_decoded_fmt(struct file *file, void *priv,
 			       struct v4l2_format *f)
 {
-	struct tegra_ctx *ctx = fh_to_tegra_ctx(priv);
+	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
 	struct vb2_queue *vq;
 	int err;
 
@@ -593,7 +593,7 @@ static int tegra_s_decoded_fmt(struct file *file, void *priv,
 static int tegra_enum_coded_fmt(struct file *file, void *priv,
 				struct v4l2_fmtdesc *f)
 {
-	struct tegra_ctx *ctx = fh_to_tegra_ctx(priv);
+	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
 	const struct tegra_vde_soc *soc = ctx->vde->soc;
 
 	if (f->index >= soc->num_coded_fmts)
@@ -607,7 +607,7 @@ static int tegra_enum_coded_fmt(struct file *file, void *priv,
 static int tegra_g_coded_fmt(struct file *file, void *priv,
 			     struct v4l2_format *f)
 {
-	struct tegra_ctx *ctx = fh_to_tegra_ctx(priv);
+	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
 
 	*f = ctx->coded_fmt;
 	return 0;
@@ -631,7 +631,7 @@ static int tegra_try_coded_fmt(struct file *file, void *priv,
 			       struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct tegra_ctx *ctx = fh_to_tegra_ctx(priv);
+	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
 	const struct tegra_vde_soc *soc = ctx->vde->soc;
 	int size = pix_mp->plane_fmt[0].sizeimage;
 	const struct tegra_coded_fmt_desc *desc;
@@ -656,7 +656,7 @@ static int tegra_try_coded_fmt(struct file *file, void *priv,
 static int tegra_s_coded_fmt(struct file *file, void *priv,
 			     struct v4l2_format *f)
 {
-	struct tegra_ctx *ctx = fh_to_tegra_ctx(priv);
+	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
 	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
 	const struct tegra_coded_fmt_desc *desc;
 	struct vb2_queue *peer_vq, *vq;
@@ -718,7 +718,7 @@ static int tegra_s_coded_fmt(struct file *file, void *priv,
 static int tegra_enum_framesizes(struct file *file, void *priv,
 				 struct v4l2_frmsizeenum *fsize)
 {
-	struct tegra_ctx *ctx = fh_to_tegra_ctx(priv);
+	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
 	const struct tegra_coded_fmt_desc *fmt;
 
 	if (fsize->index)
@@ -852,8 +852,8 @@ static int tegra_open(struct file *file)
 
 static int tegra_release(struct file *file)
 {
+	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
-	struct tegra_ctx *ctx = fh_to_tegra_ctx(fh);
 	struct tegra_vde *vde = ctx->vde;
 
 	v4l2_fh_del(fh, file);

-- 
2.49.0


