Return-Path: <linux-media+bounces-41073-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFCFB35A21
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 12:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F6C97AFA18
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 10:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF5F2FAC0A;
	Tue, 26 Aug 2025 10:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AZdAOj2p"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50EC27F178;
	Tue, 26 Aug 2025 10:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756204335; cv=none; b=E7sv7qj0iQYULvnkqTi6QDAQ0kQ52A3cvM+zKkfORVJkL25pzqNEOUlC20CqTgIH14YaoMXqiWhtgh6IyBC9McNg171rKzXiBJED3IYrolXgDTodbtQldAnHJpnchPTHj9sP9pq8AuywssORfoD0eAHxwMjr1V4zc9LWSAzyVMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756204335; c=relaxed/simple;
	bh=hCxP00ZaKPPH73WHeC0QAL6Kbr/zc98uKz0OtC0Mxjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fxX0SyNuuB6U9nnNe6qY4Nb4EubCsVDjN+k55Z3djhNPectwRPQRQbtbGzyyD+N9o6ymRIAL5pu6DJ7W/d9MmRaDbMyBoVvDS5IELgk2pnqXg6X+UjHiLmV+bLBUF4vXSID8wx9Hh7EFJSWEIWc62HyblQZFGOAJKjqCKggTUqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AZdAOj2p; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-56-97.net.vodafone.it [5.90.56.97])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B1DC3002;
	Tue, 26 Aug 2025 12:30:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756204260;
	bh=hCxP00ZaKPPH73WHeC0QAL6Kbr/zc98uKz0OtC0Mxjo=;
	h=From:Date:Subject:To:Cc:From;
	b=AZdAOj2p1v8VrCopHNDObIR+ZYTsmEq+w/4QSfx6z9erCSYyqSaZWAoguV5o1yr56
	 uNTPc/WpyqLQ5wp/hmHw1DDTLuq6GpqARyR2O/7zz3jaOThWdisaMJ36SE5XZnT73C
	 Mk32T4naOVXXeMkKYC6572L4QgolKD3RymkiZMbU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 26 Aug 2025 12:31:42 +0200
Subject: [PATCH] media: rzg2l-cru: csi-2: Support RZ/V2H input sizes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-rzv2h-cru-sizes-v1-1-dbdfc54bba11@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAA6NrWgC/x3MMQqAMAxA0atIZgNtRS1eRRyKpjaLSoIiFu9uc
 XzD/xmUhElhqDIIXay8bwW2rmBOYVsJeSkGZ1xrvOtQnsslnOVE5YcUm97G2AbvjbdQqkMo8v0
 fx+l9P3UwqJdhAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4271;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Asdt69BHgjdc7+ZNVsSduhaiVmujE9JhhYGbhYbMb9o=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBorY0ctSZLjVR3MGSZ/SX0IvbaW/rV5Gdrj4uV2
 YW7mFVNDauJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaK2NHAAKCRByNAaPFqFW
 PMqOD/9G01VIi51GiA/4hk5prWMY61rR3AzyzMk3dvEonCDdlfdCQfQc0ycu+CLXG+WlmIEC9/n
 eJAYw4nUJUSOck49mN5dcspFtYMNNg+1+IpwRIv9hVRSiGUeykJKtulElrISKwXSuUbQ6ksikl/
 liv8DfqL75iEKOlYY2x9uQaXjau7UFXWvI5iaXl8LinaJDi4Ko2KMp+oZCKGaZFKw1VJzC5w5+s
 UVsROO8tqQ23D1TVa4fAJ2JhBIJXtSmmVtJ2EdK54u78ay7rsHYtijMPtpIClvDYbH16r3piTkU
 oam5UnZv2sIhA/4JbVsklVaiv+dUQwxftvoVuepD20ABMjKpe/OJvUC9jAwY0h80LxYzBXkYrS7
 cbzxnL+QO7/LVvzM6pVbaVP1tpX74zZ9HjnZXcrMJXhhxfMWYR/VESzL0lC7DvOlplLOEnWrAJh
 P+cnDbBlTdPFr/Z2fewKaxD0BdNB+OSSmjLHPnSkbCfclp2al5zPu7gDpgBBAeUIXyL4Th6PUFs
 mjrdvIc+LMvl/Ymg9w27eMJIs4fAoYIcX6yReBXe7dDEvkqEEg7a00ABCm8aU8Mivh5/eXRwfQ2
 HqtyL+ui//nWVEo4N9w4lzp5IsIgDpaAnWVgvlktURFJSCBaUIPyYgkksSMaaZwrwwR0hW+XcGt
 SGgFAhhDYCdmCbQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

The CRU version on the RZ/V2H SoC supports larger input sizes
(4096x4096) compared to the version on the RZ/G2L (2800x4095).

Store the per-SoC min/max sizes in the device match info and use them
in place of the hardcoded ones.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  | 34 ++++++++++++++++++----
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 1520211e74185fea3bca85f36239254f6b4651db..96d17ae0048f9d88aa73bec916365f3dbc421882 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -101,6 +101,11 @@
 #define RZG2L_CSI2_MAX_WIDTH		2800
 #define RZG2L_CSI2_MAX_HEIGHT		4095
 
+#define RZV2H_CSI2_MIN_WIDTH		320
+#define RZV2H_CSI2_MIN_HEIGHT		240
+#define RZV2H_CSI2_MAX_WIDTH		4096
+#define RZV2H_CSI2_MAX_HEIGHT		4096
+
 #define RZG2L_CSI2_DEFAULT_WIDTH	RZG2L_CSI2_MIN_WIDTH
 #define RZG2L_CSI2_DEFAULT_HEIGHT	RZG2L_CSI2_MIN_HEIGHT
 #define RZG2L_CSI2_DEFAULT_FMT		MEDIA_BUS_FMT_UYVY8_1X16
@@ -137,6 +142,10 @@ struct rzg2l_csi2_info {
 	int (*dphy_enable)(struct rzg2l_csi2 *csi2);
 	int (*dphy_disable)(struct rzg2l_csi2 *csi2);
 	bool has_system_clk;
+	unsigned int min_width;
+	unsigned int min_height;
+	unsigned int max_width;
+	unsigned int max_height;
 };
 
 struct rzg2l_csi2_timings {
@@ -418,6 +427,10 @@ static const struct rzg2l_csi2_info rzg2l_csi2_info = {
 	.dphy_enable = rzg2l_csi2_dphy_enable,
 	.dphy_disable = rzg2l_csi2_dphy_disable,
 	.has_system_clk = true,
+	.min_width = RZG2L_CSI2_MIN_WIDTH,
+	.min_height = RZG2L_CSI2_MIN_HEIGHT,
+	.max_width = RZG2L_CSI2_MAX_WIDTH,
+	.max_height = RZG2L_CSI2_MAX_HEIGHT,
 };
 
 static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
@@ -542,6 +555,10 @@ static const struct rzg2l_csi2_info rzv2h_csi2_info = {
 	.dphy_enable = rzv2h_csi2_dphy_enable,
 	.dphy_disable = rzv2h_csi2_dphy_disable,
 	.has_system_clk = false,
+	.min_width = RZV2H_CSI2_MIN_WIDTH,
+	.min_height = RZV2H_CSI2_MIN_HEIGHT,
+	.max_width = RZV2H_CSI2_MAX_WIDTH,
+	.max_height = RZV2H_CSI2_MAX_HEIGHT,
 };
 
 static int rzg2l_csi2_mipi_link_setting(struct v4l2_subdev *sd, bool on)
@@ -631,6 +648,7 @@ static int rzg2l_csi2_set_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_format *fmt)
 {
+	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
 	struct v4l2_mbus_framefmt *src_format;
 	struct v4l2_mbus_framefmt *sink_format;
 
@@ -653,9 +671,11 @@ static int rzg2l_csi2_set_format(struct v4l2_subdev *sd,
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
@@ -697,16 +717,18 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_subdev *sd,
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


