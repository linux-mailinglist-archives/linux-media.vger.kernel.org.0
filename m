Return-Path: <linux-media+bounces-41329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 956D6B3B9C7
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 13:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B61C11C81CE0
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 11:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C6D312829;
	Fri, 29 Aug 2025 11:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YTCsIlm4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130DD274FFE;
	Fri, 29 Aug 2025 11:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756465954; cv=none; b=PcLMAkIcm7hqLYYyqgIVo9JIdwc5EfnCzs75wxCAi5dUIqQI11d4/RjGJBauFHuoKwnQ3OqstZSMuprR1xxxP3sGZrtOyXxFivWAgCFaBnzrrOXmPEepdxkRzlL0HvnFht+ibACXJTWI1G1ryrHguO/duDyZjowz/s/GILMkmco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756465954; c=relaxed/simple;
	bh=Y8bwiSti3JBlICHO7tCphEEi7NihO8VDLk6Cnf4odOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VDbgVAG0EczCt9Jwn3AU1SEZIdxPPFzu5O0VKo9Y3SkIL6KaKyp1OpKuwrONTwj8b8gnMLumf4KOjRFBhtS5lrO/tbvkNFTSkyD5CxDN6hi791G/O+QHUvDgr7rPsrGi59JXZ/OOeZfl8sUto0M9D79FSQ3NFp41kqaxEk13VvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YTCsIlm4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4EA6A47A8;
	Fri, 29 Aug 2025 13:11:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756465877;
	bh=Y8bwiSti3JBlICHO7tCphEEi7NihO8VDLk6Cnf4odOo=;
	h=From:Date:Subject:To:Cc:From;
	b=YTCsIlm4i6OdVRm51zb9JB4LWxnnZ7CWsA63cB84sGkLItABkMojhJyAd+buqI0Qd
	 JNZM6uXpol5rfc+Wzedks3iPfKI+GNfvxY8v+TizGGuVXTWa+bM5go0itElmuP68b6
	 Yxrh5+TL3dJ8C6MzPnREd18CzDCqJXzeVG4rYM/k=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 29 Aug 2025 13:12:14 +0200
Subject: [PATCH v2] media: rzg2l-cru: csi-2: Support RZ/V2H input sizes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-rzv2h-cru-sizes-v2-1-cc5050ddb145@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAA2LsWgC/3WNOw7CMBAFrxJtjVHWELCocg+Uwp812YIYecGCR
 Lk7Jj3ljPTmLSCUmQQuzQKZCgunqYLeNeBHO91IcagMutVda/RJ5bnoUfn8UsIziTqcMcbOGtM
 ahLp6ZIr83orXofLI8kz5sx0U/Nn/rYIKVXAh+u7onEXsOZCVNLlkc9j7dIdhXdcv2bpN7bUAA
 AA=
X-Change-ID: 20250826-rzv2h-cru-sizes-371ff5a88081
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Daniel Scally <dan.scally+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5186;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=2pfngHJTdRDGvooxwqJtLF2HmUa7560zFiB0NgwNxto=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBosYsVi4PpM16VCITepZl3ETzN6/gFf2cdRGR8M
 m5niG/Yt0qJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaLGLFQAKCRByNAaPFqFW
 PE3pD/9IE5Yow/poP0YKTw94NKmxpK1NFAltSlG6JY8Y91Uk3oD8b+Mu7c23kxJG8fAjpqx4siS
 4RLu+u3jjZZ3vMWN68b3upmDzLf/nSSuanHJtbhgVHF7Jm8o3tYVCyov3J2BS6pnCx9c5oDODCh
 tGmrSIIoIOPlJNwACH7IuBZsYfyHDGePnfRYQb9vMJqYUw2TAK93XrGzvlGUBLzkE94r8H1I5rW
 CR2J27vYOSG2JoqNIzdXW9LogjVpAaHNOc/K9fB8KHrq8jhh3R+kIEqMIBQWuzmFnBCDZ+nXH4E
 vCJ+FfNbsaMiyM11etup1GiU6S7WsnuXwsuVFzGpwfkE7e45RXj93Zy2Z8qMeTjnpxcWYgNW3Qm
 k3qTtAOr2UKi+b9Dv/YHIl1qmplo4ZxQ5pOzokEN2hjRPXm6aR8UTJDCfSmIPXMTsVneP1C2+Oi
 PED2dsVa9P4/SYJ8hoQzs6hZmGt7Jk5w0TBte5hmgIZSpw8AcrEXeWJtTKjQuf80AIMz2MunHVc
 fscGRNzsdM0c4MLemLDJ2sTSZ2hCunAsG5o52ZyChLzREmoB2p5QUiiG1HdIedqjiPwTQqngNDR
 dEKNf30+DdPonYedGf+dws2KFVW+gtuXEYm3aaykBgj9nixcNVb7w2TYP9ReVUNLhQN6bAo65k1
 mVa+bb7ZLG0He3g==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

The CRU version on the RZ/V2H SoC supports larger input sizes
(4096x4096) compared to the version on the RZ/G2L (2800x4095).

Store the per-SoC min/max sizes in the device match info and use them
in place of the hardcoded ones.

While at it, use the min sizes reported by the info structure to replace
the RZG2L_CSI2_DEFAULT_WIDTH/HEIGHT macros.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Changes in v2:
- Use the size values in the rzg2l_csi2_info instea of going through
  macros
- Use min_width/min_height to initialize the format and drop
  RZG2L_CSI2_DEFAULT_WIDTH/HEIGHT
- Add Tommaso's tag
- Link to v1: https://lore.kernel.org/r/20250826-rzv2h-cru-sizes-v1-1-dbdfc54bba11@ideasonboard.com
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  | 41 ++++++++++++++--------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 1520211e74185fea3bca85f36239254f6b4651db..183598d6cf0b255f779b4398e027d626ad1f3c1b 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -96,13 +96,6 @@
 
 #define VSRSTS_RETRIES			20
 
-#define RZG2L_CSI2_MIN_WIDTH		320
-#define RZG2L_CSI2_MIN_HEIGHT		240
-#define RZG2L_CSI2_MAX_WIDTH		2800
-#define RZG2L_CSI2_MAX_HEIGHT		4095
-
-#define RZG2L_CSI2_DEFAULT_WIDTH	RZG2L_CSI2_MIN_WIDTH
-#define RZG2L_CSI2_DEFAULT_HEIGHT	RZG2L_CSI2_MIN_HEIGHT
 #define RZG2L_CSI2_DEFAULT_FMT		MEDIA_BUS_FMT_UYVY8_1X16
 
 enum rzg2l_csi2_pads {
@@ -137,6 +130,10 @@ struct rzg2l_csi2_info {
 	int (*dphy_enable)(struct rzg2l_csi2 *csi2);
 	int (*dphy_disable)(struct rzg2l_csi2 *csi2);
 	bool has_system_clk;
+	unsigned int min_width;
+	unsigned int min_height;
+	unsigned int max_width;
+	unsigned int max_height;
 };
 
 struct rzg2l_csi2_timings {
@@ -418,6 +415,10 @@ static const struct rzg2l_csi2_info rzg2l_csi2_info = {
 	.dphy_enable = rzg2l_csi2_dphy_enable,
 	.dphy_disable = rzg2l_csi2_dphy_disable,
 	.has_system_clk = true,
+	.min_width = 320,
+	.min_height = 240,
+	.max_width = 2800,
+	.max_height = 4095,
 };
 
 static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
@@ -542,6 +543,10 @@ static const struct rzg2l_csi2_info rzv2h_csi2_info = {
 	.dphy_enable = rzv2h_csi2_dphy_enable,
 	.dphy_disable = rzv2h_csi2_dphy_disable,
 	.has_system_clk = false,
+	.min_width = 320,
+	.min_height = 240,
+	.max_width = 4096,
+	.max_height = 4096,
 };
 
 static int rzg2l_csi2_mipi_link_setting(struct v4l2_subdev *sd, bool on)
@@ -631,6 +636,7 @@ static int rzg2l_csi2_set_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_format *fmt)
 {
+	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
 	struct v4l2_mbus_framefmt *src_format;
 	struct v4l2_mbus_framefmt *sink_format;
 
@@ -653,9 +659,11 @@ static int rzg2l_csi2_set_format(struct v4l2_subdev *sd,
 	sink_format->ycbcr_enc = fmt->format.ycbcr_enc;
 	sink_format->quantization = fmt->format.quantization;
 	sink_format->width = clamp_t(u32, fmt->format.width,
-				     RZG2L_CSI2_MIN_WIDTH, RZG2L_CSI2_MAX_WIDTH);
+				     csi2->info->min_width,
+				     csi2->info->max_width);
 	sink_format->height = clamp_t(u32, fmt->format.height,
-				      RZG2L_CSI2_MIN_HEIGHT, RZG2L_CSI2_MAX_HEIGHT);
+				     csi2->info->min_height,
+				     csi2->info->max_height);
 	fmt->format = *sink_format;
 
 	/* propagate format to source pad */
@@ -668,9 +676,10 @@ static int rzg2l_csi2_init_state(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format fmt = { .pad = RZG2L_CSI2_SINK, };
+	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
 
-	fmt.format.width = RZG2L_CSI2_DEFAULT_WIDTH;
-	fmt.format.height = RZG2L_CSI2_DEFAULT_HEIGHT;
+	fmt.format.width = csi2->info->min_width;
+	fmt.format.height = csi2->info->min_height;
 	fmt.format.field = V4L2_FIELD_NONE;
 	fmt.format.code = RZG2L_CSI2_DEFAULT_FMT;
 	fmt.format.colorspace = V4L2_COLORSPACE_SRGB;
@@ -697,16 +706,18 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_subdev *sd,
 				      struct v4l2_subdev_state *sd_state,
 				      struct v4l2_subdev_frame_size_enum *fse)
 {
+	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
+
 	if (fse->index != 0)
 		return -EINVAL;
 
 	if (!rzg2l_csi2_code_to_fmt(fse->code))
 		return -EINVAL;
 
-	fse->min_width = RZG2L_CSI2_MIN_WIDTH;
-	fse->min_height = RZG2L_CSI2_MIN_HEIGHT;
-	fse->max_width = RZG2L_CSI2_MAX_WIDTH;
-	fse->max_height = RZG2L_CSI2_MAX_HEIGHT;
+	fse->min_width = csi2->info->min_width;
+	fse->min_height = csi2->info->min_height;
+	fse->max_width = csi2->info->max_width;
+	fse->max_height = csi2->info->max_height;
 
 	return 0;
 }

---
base-commit: 16428e2449ab96cce27be6ab17b750b404c76c7c
change-id: 20250826-rzv2h-cru-sizes-371ff5a88081

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


