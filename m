Return-Path: <linux-media+bounces-1327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C427FD2A1
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 10:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8595A1F20FD9
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 09:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554EB14F7D;
	Wed, 29 Nov 2023 09:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aDXlrcTI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C231FFA;
	Wed, 29 Nov 2023 01:28:43 -0800 (PST)
Received: from pyrite.hamster-moth.ts.net (h175-177-049-135.catv02.itscom.jp [175.177.49.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26B69F02;
	Wed, 29 Nov 2023 10:28:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701250086;
	bh=Edrymv5691+fMNHomNnzzNr4DmSpwPe97XaFQm/kkW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aDXlrcTI9ujlwLviFejRx+86njHF7zKPxbHPS3bIt9iAygP67XR5zGuBFoQe1SA9e
	 ZgPxXYj9EnTmQtlN79OzIdjLjKkQd6Mk8icNqxbC93QIk02+bRGHIgU62RWfXvOQyv
	 GbugVP2iLOawbOF5UGjvLr9+d/B4iGThKrlyq7aM=
From: Paul Elder <paul.elder@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	aford173@gmail.com,
	Paul Elder <paul.elder@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 05/11] media: rkisp1: Fix RSZ_CTRL bits for i.MX8MP
Date: Wed, 29 Nov 2023 18:27:53 +0900
Message-Id: <20231129092759.242641-6-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231129092759.242641-1-paul.elder@ideasonboard.com>
References: <20231129092759.242641-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ISP8000Nano, found in the i.MX8MP, has a different architecture to
crop at the resizer input. Instead of the "dual crop" block between the
ISP and the resizers found in the RK3399, cropping has been moved to the
input of the resizer blocks. As a result, the resizer CFG_UPD and
CFG_UPD_AUTO bits have been moved to make space for a new CROP_ENABLE
bit.

Fix the resizer shadow update accordingly, using the DUAL_CROP feature
to infer whether or not the resizer implements cropping. Support for
resizer cropping itself will be added in a subsequent commit.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v3:

- Condition on RKISP1_FEATURE_DUAL_CROP feature
- Update commit message

Changes since v2:

- Condition on RKISP1_FEATURE_RSZ_CROP feature
- Rename bits
- Use the rkisp1_has_feature() macro

 .../media/platform/rockchip/rkisp1/rkisp1-regs.h  |  5 +++++
 .../platform/rockchip/rkisp1/rkisp1-resizer.c     | 15 +++++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index 3b19c8411360..95646b45f28b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -168,6 +168,11 @@
 #define RKISP1_CIF_RSZ_CTRL_CFG_UPD_AUTO		BIT(9)
 #define RKISP1_CIF_RSZ_SCALER_FACTOR			BIT(16)
 
+/* For resizer instances that support cropping */
+#define RKISP1_CIF_RSZ_CTRL_CROP_ENABLE			BIT(8)
+#define RKISP1_CIF_RSZ_CTRL_CROP_CFG_UPD		BIT(9)
+#define RKISP1_CIF_RSZ_CTRL_CROP_CFG_UPD_AUTO		BIT(10)
+
 /* MI_IMSC - MI_MIS - MI_RIS - MI_ICR - MI_ISR */
 #define RKISP1_CIF_MI_FRAME(stream)			BIT((stream)->id)
 #define RKISP1_CIF_MI_MBLK_LINE				BIT(2)
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index c1aaeed58acc..6d6ebc53c6e5 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -178,10 +178,17 @@ static void rkisp1_rsz_update_shadow(struct rkisp1_resizer *rsz,
 {
 	u32 ctrl_cfg = rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_CTRL);
 
-	if (when == RKISP1_SHADOW_REGS_ASYNC)
-		ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CFG_UPD_AUTO;
-	else
-		ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CFG_UPD;
+	if (when == RKISP1_SHADOW_REGS_ASYNC) {
+		if (rkisp1_has_feature(rsz->rkisp1, DUAL_CROP))
+			ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CFG_UPD_AUTO;
+		else
+			ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CROP_CFG_UPD_AUTO;
+	} else {
+		if (rkisp1_has_feature(rsz->rkisp1, DUAL_CROP))
+			ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CFG_UPD;
+		else
+			ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CROP_CFG_UPD;
+	}
 
 	rkisp1_rsz_write(rsz, RKISP1_CIF_RSZ_CTRL, ctrl_cfg);
 }
-- 
2.39.2


