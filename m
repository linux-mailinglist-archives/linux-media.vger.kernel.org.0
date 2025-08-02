Return-Path: <linux-media+bounces-38783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41702B18CFB
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6951A16D9BC
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C3127B4EE;
	Sat,  2 Aug 2025 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O2ythKO2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E239F226D14;
	Sat,  2 Aug 2025 09:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754127046; cv=none; b=s5DKyFaoHsHsKb7AAXZYNHNE72joiz/yRq4pSvib1zkqRA5GPjX76dimgcQVRGj1amjbADF6S7rGuId4b/5G8Vw/pXQHOGuQCcF7rg5Ia3OIh+FTa6okouN67FolwgAXqbVgHurUvJ7vVK0s0ZzJmln5zoN3p4KlNeszjg0UYZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754127046; c=relaxed/simple;
	bh=N/+SmX8uCSElsoQI/Kb0w5aCmhV7erqVc0DGwURG/AA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c+YE+s4IDak89sd7QbCllO0Fnd9T7rmR/h2CFOLGVNl37lXu1p7mb5w8zOR1OsRf7THK1vBFiygFBsSNruqRtLnYUcWaaD3R5kk/5mUx1KEApG7VrOmCzjaMpOI0J+ca5tnAK5lLQ8UIR5gENpc9ap9WzmM/VrNpX+yfXGiN7hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O2ythKO2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F3D640D7;
	Sat,  2 Aug 2025 11:29:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126997;
	bh=N/+SmX8uCSElsoQI/Kb0w5aCmhV7erqVc0DGwURG/AA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O2ythKO2VLeSyaJW1M/PqCX/Mkk5kckpbF0P3b/mXShykQUmZpyRwP7cnS0GIDbL/
	 1DUlZhDvcIq3FFW01jGr4U4d4DEVv0toEN/a34f1d+8i68oIA7/0jOonpdg6HBRSO7
	 wRvxI6vA7eAfOnezFzDfnkMhxtBedOLidMjxv5pM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:06 +0200
Subject: [PATCH 44/65] media: rockchip: rkvdec: Access v4l2_fh from file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-44-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4093;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=N/+SmX8uCSElsoQI/Kb0w5aCmhV7erqVc0DGwURG/AA=;
 b=owEBbAKT/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj8GhGRoLbVmqgvZIfiBugvAzZbpSmTSf59f
 8yjByt2IQaJAjIEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/AAKCRByNAaPFqFW
 PHoxD/dZpPaC6C0cHgs+6v+St9wjgRkVaZQPtX28YtuVqRe+UWHscNIwGphLs9NBDuLq0g5atP1
 LlhxmW2GY0FLrU4ODHwmd2p6qM2Z/1jKYgj7s1BQO2pqpNekk0WFWK/1MBsyFftm2KbE6oxHHb3
 MjzTehWud6ey9ZZ/xS0hq47jkIbh6C5rPk0jX8ArRlL/YT7DyODiZjLZ8k+HfWKXGaqHpCLH03e
 k/ubxOnY0OApTrAZHcAFipujf6N9fp7vOhuJC9xF14G7CDyfWpB9prIJmN0KTo0HIYmkwXijHZ7
 4hZq9Q6YOdfcUTg4V9X6r7bqBaPLXLGiqhMscoH26A1VxzfD8nW80Pdh81jYWLRnGY36eA+vI5l
 ifXsoAohqQtUSZNhDJVW7R4RAw4hSqkoQMRaDZp4V0oE6bE8IPS/MYKYYk6DB4BCctHM4IoY4p9
 YIuYtS8UzM4mMzVTAekk4U0uJPhk48PVxf6M62ZzNCIMVW/6zKhpm/neqruVAO8i+MvPzeIxTvs
 OgqunbBOS20rPOU/kLg7qxZXeDBSf2bxjfnD+vNmdF4d8meyw+aAL9iesbcUAUnh7p8+K1IXNXs
 wkwZ3h4Awk9cg/sCpbpXDN22PLzLj8gBJQ1zdSBXuK34VXa2RLneYzBhWuyXvnhKBo7xKyVWcy6
 m59/g+/Cysrlb
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

While at it, remove the now unused fh_to_rkvdec_ctx() macro.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 14 +++++++-------
 drivers/media/platform/rockchip/rkvdec/rkvdec.h |  5 -----
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 481c2488f9ac64e70869ed21e5053cfbc4ed6e0e..9fa80ab3c62b7753e6c992aefd106ee99ed375e4 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -354,7 +354,7 @@ static int rkvdec_try_capture_fmt(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 	const struct rkvdec_coded_fmt_desc *coded_desc;
 
 	/*
@@ -387,7 +387,7 @@ static int rkvdec_try_output_fmt(struct file *file, void *priv,
 				 struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 	const struct rkvdec_coded_fmt_desc *desc;
 
 	desc = rkvdec_find_coded_fmt_desc(pix_mp->pixelformat);
@@ -418,7 +418,7 @@ static int rkvdec_try_output_fmt(struct file *file, void *priv,
 static int rkvdec_s_capture_fmt(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 	struct vb2_queue *vq;
 	int ret;
 
@@ -439,7 +439,7 @@ static int rkvdec_s_capture_fmt(struct file *file, void *priv,
 static int rkvdec_s_output_fmt(struct file *file, void *priv,
 			       struct v4l2_format *f)
 {
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
 	const struct rkvdec_coded_fmt_desc *desc;
 	struct v4l2_format *cap_fmt;
@@ -504,7 +504,7 @@ static int rkvdec_s_output_fmt(struct file *file, void *priv,
 static int rkvdec_g_output_fmt(struct file *file, void *priv,
 			       struct v4l2_format *f)
 {
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 
 	*f = ctx->coded_fmt;
 	return 0;
@@ -513,7 +513,7 @@ static int rkvdec_g_output_fmt(struct file *file, void *priv,
 static int rkvdec_g_capture_fmt(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 
 	*f = ctx->decoded_fmt;
 	return 0;
@@ -532,7 +532,7 @@ static int rkvdec_enum_output_fmt(struct file *file, void *priv,
 static int rkvdec_enum_capture_fmt(struct file *file, void *priv,
 				   struct v4l2_fmtdesc *f)
 {
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 	u32 fourcc;
 
 	fourcc = rkvdec_enum_decoded_fmt(ctx, f->index, ctx->image_fmt);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 35effe9467845fdfc4ffea432211d1d2e75a08b0..481aaa4bffe975fa106fb22e78bef90ade86a6cf 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -124,11 +124,6 @@ struct rkvdec_ctx {
 	void *priv;
 };
 
-static inline struct rkvdec_ctx *fh_to_rkvdec_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct rkvdec_ctx, fh);
-}
-
 static inline struct rkvdec_ctx *file_to_rkvdec_ctx(struct file *filp)
 {
 	return container_of(file_to_v4l2_fh(filp), struct rkvdec_ctx, fh);

-- 
2.49.0


