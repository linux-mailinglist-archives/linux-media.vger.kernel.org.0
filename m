Return-Path: <linux-media+bounces-38772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8C3B18CA2
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC2163B13DF
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9D6274B48;
	Sat,  2 Aug 2025 09:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pVvNcAun"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F2D241CA2;
	Sat,  2 Aug 2025 09:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126941; cv=none; b=TV1RkqvgMVjDuYyW8Nt94N3rn0Q+TeWijnq+FwxJIUHXafFSJpUUHruIONbZKpcrKIoEhMro5lKl8jNTU0ck9IPD56agIGJWC54Vyjps0yYVYLx0HSsm+tKpv14DI4teUFPewwJRl57fTOR/y/ab4eqL88mL8pgQ3p86V2wpv8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126941; c=relaxed/simple;
	bh=41vTx83z/Uwja6XVkgBfBZsgFkv9BjK18LAN6EVk9C4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=McvdJB2ao4CYXY4RSYIJRxQcL9tPW2/x9SjTuupUqtxPhA1TIXDHUis6jhNnkfgQAkXLiCbyvELUSyQWejaRi5NCwVPDALfuG4/sIjkY5Vf+JLA9gn2gzHeeLvzIj1ziuUXavjd4VLdlicmNPp2DYNqU7x0YJnlsI8Q6kArMs14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pVvNcAun; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8152C3C67;
	Sat,  2 Aug 2025 11:28:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126893;
	bh=41vTx83z/Uwja6XVkgBfBZsgFkv9BjK18LAN6EVk9C4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pVvNcAuntI593b3+8JOouhdzGDFt2tmHaE57Nr/H0+gti/BMJpEEIFHA5+uFfKKEi
	 /TinR7qedy9WiH2jyXomKJZiyq8x2qshMpdc2vFlrCpho2CEsAjd95XWFp6F9VNkLH
	 qOhagXfR5W5AHnPYjhQSxrZyg7F3cCClyLs7v+n8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:55 +0200
Subject: [PATCH 33/65] media: m2m-deinterlace: Access v4l2_fh from file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-33-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2772;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=41vTx83z/Uwja6XVkgBfBZsgFkv9BjK18LAN6EVk9C4=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj7pwyrSBi9rnZ2weNb65Z8p51fNTUj4IIin
 TQAaww2RVaJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+wAKCRByNAaPFqFW
 PAMDD/9Ug9QwsOwqd/AgPzEvnOkucjAOnVc54Ut2Iym9meadtfaDDV1mc7FXlnf4QLXhPrr78BW
 mpb135tIptu5FHRKG7ysZfYALCQMddnU3UUQx0/gn5ZIZ5zPK4m9roV/TBUt4NtkFNAEaGV8NLQ
 9FEY9ol3rYLDbWKjxpoZe+VhhCMaZiOBw5yagf67MDewREcw+UUrbGSHW4ru40PKZciqbc/vj0e
 nQfpCOMoiEF91JYrkF/d2z0t/W67gr7LDYsHVhwa/juCbCz2Wu5KQFwJkwZkJNSo2XbrEJdiJ4w
 jnU91qYWYQryas5efYVfY85hlacIcp74d7FCyJCPUdYt8NZ/hyYn8/VfC6qTgKHjcL/9vUZ3uu+
 H32Q5uHhBqaFOo33iNE4+ZRkxfXJ5OcPoqWx+OWYYHE3044p0atCe5/EpNW+pdAD9SD5D+D4UTZ
 kv3SB4HWGcxMS+9txidCBc03zJCYCS8Vc6QIc/VosL0FGTOMEiMfJr6LSwuOipAKCDgNrX2V8sT
 OTZ9kYNFRnph4i25ZZq1/kHy+UJ5IMzKBGRFfCzBCuOngdJG5UtWh9IEQa9OTuiAJTnDo8qoqwT
 viKs/nKaDQkiXseRHCpINPwJEHsdfM+BRPU5LJEZzEfrGdcAxUCWkgHfZ07hCSfQ953aDjIBp9O
 TtEBNodMx+bGSzA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/m2m-deinterlace.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index 51c2f206cb1f601ec2f3d07fffbf63c86f4cdc01..e07e57d4206baa5e7a467298cb240c3a2cd57cd8 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -517,13 +517,13 @@ static int vidioc_g_fmt(struct deinterlace_ctx *ctx, struct v4l2_format *f)
 static int vidioc_g_fmt_vid_out(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	return vidioc_g_fmt(priv, f);
+	return vidioc_g_fmt(file_to_ctx(file), f);
 }
 
 static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	return vidioc_g_fmt(priv, f);
+	return vidioc_g_fmt(file_to_ctx(file), f);
 }
 
 static int vidioc_try_fmt(struct v4l2_format *f, struct deinterlace_fmt *fmt)
@@ -544,8 +544,8 @@ static int vidioc_try_fmt(struct v4l2_format *f, struct deinterlace_fmt *fmt)
 static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
+	struct deinterlace_ctx *ctx = file_to_ctx(file);
 	struct deinterlace_fmt *fmt;
-	struct deinterlace_ctx *ctx = priv;
 
 	fmt = find_format(f);
 	if (!fmt || !(fmt->types & MEM2MEM_CAPTURE))
@@ -638,20 +638,20 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	ret = vidioc_try_fmt_vid_cap(file, priv, f);
 	if (ret)
 		return ret;
-	return vidioc_s_fmt(priv, f);
+	return vidioc_s_fmt(file_to_ctx(file), f);
 }
 
 static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct deinterlace_ctx *ctx = priv;
+	struct deinterlace_ctx *ctx = file_to_ctx(file);
 	int ret;
 
 	ret = vidioc_try_fmt_vid_out(file, priv, f);
 	if (ret)
 		return ret;
 
-	ret = vidioc_s_fmt(priv, f);
+	ret = vidioc_s_fmt(ctx, f);
 	if (!ret)
 		ctx->colorspace = f->fmt.pix.colorspace;
 
@@ -661,8 +661,8 @@ static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
 static int vidioc_streamon(struct file *file, void *priv,
 			   enum v4l2_buf_type type)
 {
+	struct deinterlace_ctx *ctx = file_to_ctx(file);
 	struct deinterlace_q_data *s_q_data, *d_q_data;
-	struct deinterlace_ctx *ctx = priv;
 
 	s_q_data = get_q_data(V4L2_BUF_TYPE_VIDEO_OUTPUT);
 	d_q_data = get_q_data(V4L2_BUF_TYPE_VIDEO_CAPTURE);

-- 
2.49.0


