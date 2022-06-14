Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29EC054BA5C
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357903AbiFNTPg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357441AbiFNTPf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:15:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F17711C0F
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:15:34 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1760825;
        Tue, 14 Jun 2022 21:15:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655234133;
        bh=4FRx9cLD3vaUJ9hfLIwWu8iF+r754iIQFJ+3X5OaMOo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wjJ8SudfI+ziGWowJWw+jCqHSfQlcx7tHIy9klQcKh1zoQGlFb2arNiApN8/e3xmR
         9emOqYeN33YBiGrDtTNtR6o0nlJ4cyGP3x7tO5QnN1/rEUMt4I6iVTW+Bea4jbu+FL
         HbRTeM7GG4Tiv7OIKXSUgkzGUNSAEW0h4bCcNXy4=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>, dafna@fastmail.com,
        heiko@sntech.de, laurent.pinchart@ideasonboard.com,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 55/55] media: rkisp1: Fix RSZ_CTRL bits for i.MX8MP
Date:   Wed, 15 Jun 2022 04:11:27 +0900
Message-Id: <20220614191127.3420492-56-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ISP that is integrated in the i.MX8MP uses different bits in the
MRSZ_CTRL and SRSZ_CTRL registers for updating the configuration
compared to the on in the RK3399. In addition, it adds a new bit for
enabling crop. Add new definitions for these bits for i.MX8MP devices,
and update where they are set.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h   |  4 ++++
 .../media/platform/rockchip/rkisp1/rkisp1-resizer.c    | 10 ++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index 34f4fe09c88d..24ad2ccec2a3 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -168,6 +168,10 @@
 #define RKISP1_CIF_RSZ_CTRL_CFG_UPD_AUTO		BIT(9)
 #define RKISP1_CIF_RSZ_SCALER_FACTOR			BIT(16)
 
+#define RKISP1_CIF_RSZ_CTRL_CROP_ENABLE_IMX		BIT(8)
+#define RKISP1_CIF_RSZ_CTRL_CFG_UPD_IMX			BIT(9)
+#define RKISP1_CIF_RSZ_CTRL_CFG_UPD_AUTO_IMX		BIT(10)
+
 /* RSZ_CROP_[XY]_DIR */
 #define RKISP1_CIF_RSZ_CROP_XY_DIR(start, end)		((end) << 16 | (start) << 0)
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index 08bf3aa8088f..29a31b18a082 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -209,9 +209,15 @@ static void rkisp1_rsz_update_shadow(struct rkisp1_resizer *rsz,
 	u32 ctrl_cfg = rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_CTRL);
 
 	if (when == RKISP1_SHADOW_REGS_ASYNC)
-		ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CFG_UPD_AUTO;
+		if (rsz->rkisp1->info->isp_ver == IMX8MP_V10)
+			ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CFG_UPD_AUTO_IMX;
+		else
+			ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CFG_UPD_AUTO;
 	else
-		ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CFG_UPD;
+		if (rsz->rkisp1->info->isp_ver == IMX8MP_V10)
+			ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CFG_UPD_IMX;
+		else
+			ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CFG_UPD;
 
 	rkisp1_rsz_write(rsz, RKISP1_CIF_RSZ_CTRL, ctrl_cfg);
 }
-- 
2.30.2

