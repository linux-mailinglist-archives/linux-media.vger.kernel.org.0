Return-Path: <linux-media+bounces-38774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0410DB18CB2
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B45413BA87C
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80203245007;
	Sat,  2 Aug 2025 09:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oK65F9MO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4498824467E;
	Sat,  2 Aug 2025 09:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126960; cv=none; b=soE7HHatwcmIR+cjw9t7fG7ZvEtcbNZhVcX/jyCXvFb5vnpIvjrIpze2B3hFzlBV9MfbrMCtvrZPQaBSVCz+ppwIarEQxD9OEcgUR54khh/wvjSFRRq/AgQBsqII/izsW+tuNFdwBqsbhHx7ehykzmLZantGv/Es4HThVWAVi2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126960; c=relaxed/simple;
	bh=Yp1jjNiETSRS2rD3cxKSnrkZYfH6FttVwhmOY8Rcezk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W72/wEnpanyo5rZl0fB2CNV5FBxWd+xXccuuNJYU034mQBCDIz+wTGVQYiQYDrByTOLMe8fQGqJrZznSvDUEVr7e67j/va48CAeBvxRlTUAFODupx0j2HpGfTV33HRQEXL5XMOHrxIYV3CozbgltDFcZBH/UTpQdev81Lq9x8f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oK65F9MO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC5683C6D;
	Sat,  2 Aug 2025 11:28:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126912;
	bh=Yp1jjNiETSRS2rD3cxKSnrkZYfH6FttVwhmOY8Rcezk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oK65F9MO8UcjP/6hNhgPAYoZhlvkq+dE7764WQSpH/hkcjX6Rb/KkkY+fdKSTjt/w
	 vphJVC/FyJaBkl11e29u1Z0eoaSgGKTIkW1Jj3s18ZoJGyaAy73X9YcFntU/aVGsMH
	 /iZO1twyf28r7e1D1UCrv+Y0xTXqjwXq+IpXKl2Q=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:57 +0200
Subject: [PATCH 35/65] media: mtk_mdp_m2m: Access v4l2_fh from file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-35-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4214;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Yp1jjNiETSRS2rD3cxKSnrkZYfH6FttVwhmOY8Rcezk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj7JJ72BFggMdAsaEou9LTKKektiwy1ugItg
 8aerb8YmN2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+wAKCRByNAaPFqFW
 PJHtD/9WyqYuwWJOfh5g1VWiGjbVTpkIX1b5Uy2x8MLlx18cgSLdj6+x0f3DRopLkV84ATY/RtQ
 SK5fk+ANG0EEnfKcLyRzCTvwxZxWeHrA1GEK3tL8oLQ2K4D8Wdagi+UKvyGctv1Bf3dWz6/yEB/
 +w5HKX+Lzcu05OXTc/1vscZyEtMlghlNRqXnUAHnqNpPHfGIce5jL35BdelLLgMnkrBGHR3KmVD
 4kMad1YfWVBYAHWYaQ67XSrnW+gBZfVJ7wARnBFv7ty6GzdLgLaWTg4j26wUUScYyIoDmVRwiw5
 nu0iMGSqrJVJQoKr6v/RQLJKnzG61raDiylsrMrnqyc/J9WaqyvraNo4aqlu2UMFJwZgKFKXDtV
 R9oYbRdEIMmkD6MOkJO9E54OrbDgACoNAPBbpqOu3YUxs0aaSGh1Yk+qlV4uF517fqQ+CnUj1Qo
 OYwd67H7yXEFNYBtND7I79bBFukORypozZATF7RHkA8N/cI4aR1f6hKGdPxpqDN0J5sZKTeA601
 uKd/AtqDWuNgOmlehluKCWwIuJDAHQZWX/YAXbsZAMVRWOHNuazhbs9VRgk0s3Csk6g956oz/oP
 w95XKEOp39XUgt08MC/mLmzTY/mCwS1I5rOl5p4mDsb2Y2OpI11ZzG8bidnmbz6do8Q57zSEqKH
 htnfly2T+xeCKBQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

While at it, remove the now unused fh_to_ctx() macro.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index 3d836b5efa3807e4dc882956040014e244eeb660..03c07948dfdd07c6395c391ccad1788b08b1a867 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -348,11 +348,6 @@ static int mtk_mdp_try_crop(struct mtk_mdp_ctx *ctx, u32 type,
 	return 0;
 }
 
-static inline struct mtk_mdp_ctx *fh_to_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct mtk_mdp_ctx, fh);
-}
-
 static inline struct mtk_mdp_ctx *file_to_ctx(struct file *filp)
 {
 	return container_of(file_to_v4l2_fh(filp), struct mtk_mdp_ctx, fh);
@@ -594,7 +589,7 @@ static const struct vb2_ops mtk_mdp_m2m_qops = {
 static int mtk_mdp_m2m_querycap(struct file *file, void *fh,
 				struct v4l2_capability *cap)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct mtk_mdp_dev *mdp = ctx->mdp_dev;
 
 	strscpy(cap->driver, MTK_MDP_MODULE_NAME, sizeof(cap->driver));
@@ -632,7 +627,7 @@ static int mtk_mdp_m2m_enum_fmt_vid_out(struct file *file, void *priv,
 static int mtk_mdp_m2m_g_fmt_mplane(struct file *file, void *fh,
 				    struct v4l2_format *f)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct mtk_mdp_frame *frame;
 	struct v4l2_pix_format_mplane *pix_mp;
 	int i;
@@ -671,7 +666,7 @@ static int mtk_mdp_m2m_g_fmt_mplane(struct file *file, void *fh,
 static int mtk_mdp_m2m_try_fmt_mplane(struct file *file, void *fh,
 				      struct v4l2_format *f)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 
 	if (!mtk_mdp_try_fmt_mplane(ctx, f))
 		return -EINVAL;
@@ -681,7 +676,7 @@ static int mtk_mdp_m2m_try_fmt_mplane(struct file *file, void *fh,
 static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 				    struct v4l2_format *f)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct vb2_queue *vq;
 	struct mtk_mdp_frame *frame;
 	struct v4l2_pix_format_mplane *pix_mp;
@@ -727,7 +722,7 @@ static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 static int mtk_mdp_m2m_reqbufs(struct file *file, void *fh,
 			       struct v4l2_requestbuffers *reqbufs)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 
 	return v4l2_m2m_reqbufs(file, ctx->m2m_ctx, reqbufs);
 }
@@ -735,7 +730,7 @@ static int mtk_mdp_m2m_reqbufs(struct file *file, void *fh,
 static int mtk_mdp_m2m_streamon(struct file *file, void *fh,
 				enum v4l2_buf_type type)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	int ret;
 
 	if (!mtk_mdp_ctx_state_is_set(ctx, MTK_MDP_VPU_INIT)) {
@@ -773,8 +768,8 @@ static inline bool mtk_mdp_is_target_crop(u32 target)
 static int mtk_mdp_m2m_g_selection(struct file *file, void *fh,
 				       struct v4l2_selection *s)
 {
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct mtk_mdp_frame *frame;
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
 	bool valid = false;
 
 	if (s->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
@@ -840,8 +835,8 @@ static int mtk_mdp_check_scaler_ratio(struct mtk_mdp_variant *var, int src_w,
 static int mtk_mdp_m2m_s_selection(struct file *file, void *fh,
 				   struct v4l2_selection *s)
 {
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct mtk_mdp_frame *frame;
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
 	struct v4l2_rect new_r;
 	struct mtk_mdp_variant *variant = ctx->mdp_dev->variant;
 	int ret;

-- 
2.49.0


