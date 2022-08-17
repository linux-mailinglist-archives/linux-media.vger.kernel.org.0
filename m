Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D014596760
	for <lists+linux-media@lfdr.de>; Wed, 17 Aug 2022 04:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237937AbiHQCTM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Aug 2022 22:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238131AbiHQCTL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Aug 2022 22:19:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0FAD80366
        for <linux-media@vger.kernel.org>; Tue, 16 Aug 2022 19:19:10 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9132951C;
        Wed, 17 Aug 2022 04:19:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660702748;
        bh=rgKGhFvMOhYEVy89iQJFS+d2M6ZdOcI2C+7YBIHcpDo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gb9ARV6yuhp0eVAZ0lpkx6MPtZnpPqqI75LSiaQtrPdpU2R26JOVSaoI5WlgoqOCY
         et2p8o3XNgNVv+npMDk2qLNQqx/mEogIH79ZNMuhznDRDfWWxyibOECCjJxtas55vd
         XbbLJr4w4OoKjDo9e+u3zifHMXrmnr2OOt+aNYY4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: [PATCH 3/5] media: rkisp1: Simplify LSC x/y size and grad register macros
Date:   Wed, 17 Aug 2022 05:18:48 +0300
Message-Id: <20220817021850.20460-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220817021850.20460-1-laurent.pinchart@ideasonboard.com>
References: <20220817021850.20460-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The LSC module x/y size and grad configuration is stored in a set of 4
indexed registers each. The rkisp1-regs.h header defines all those
registers, but only the first one in each set is used, with manual
calculation of addresses of subsequent registers. Simplifies this by
merging all 4 register macros into one that takes the index as a
parameter. No functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-params.c  |  8 ++++----
 .../platform/rockchip/rkisp1/rkisp1-regs.h    | 20 ++++---------------
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index dbe826fd02d2..aa6efa4c6e9e 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -331,22 +331,22 @@ static void rkisp1_lsc_config(struct rkisp1_params *params,
 		/* program x size tables */
 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->x_size_tbl[i * 2],
 						    arg->x_size_tbl[i * 2 + 1]);
-		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_XSIZE_01 + i * 4, data);
+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_XSIZE(i), data);
 
 		/* program x grad tables */
 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->x_grad_tbl[i * 2],
 						    arg->x_grad_tbl[i * 2 + 1]);
-		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_XGRAD_01 + i * 4, data);
+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_XGRAD(i), data);
 
 		/* program y size tables */
 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->y_size_tbl[i * 2],
 						    arg->y_size_tbl[i * 2 + 1]);
-		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_YSIZE_01 + i * 4, data);
+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_YSIZE(i), data);
 
 		/* program y grad tables */
 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->y_grad_tbl[i * 2],
 						    arg->y_grad_tbl[i * 2 + 1]);
-		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_YGRAD_01 + i * 4, data);
+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_YGRAD(i), data);
 	}
 
 	/* restore the lsc ctrl status */
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index 044af3d6e4f3..2ad24deedec8 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -1162,22 +1162,10 @@
 #define RKISP1_CIF_ISP_LSC_GR_TABLE_DATA	(RKISP1_CIF_ISP_LSC_BASE + 0x00000018)
 #define RKISP1_CIF_ISP_LSC_B_TABLE_DATA		(RKISP1_CIF_ISP_LSC_BASE + 0x0000001C)
 #define RKISP1_CIF_ISP_LSC_GB_TABLE_DATA	(RKISP1_CIF_ISP_LSC_BASE + 0x00000020)
-#define RKISP1_CIF_ISP_LSC_XGRAD_01		(RKISP1_CIF_ISP_LSC_BASE + 0x00000024)
-#define RKISP1_CIF_ISP_LSC_XGRAD_23		(RKISP1_CIF_ISP_LSC_BASE + 0x00000028)
-#define RKISP1_CIF_ISP_LSC_XGRAD_45		(RKISP1_CIF_ISP_LSC_BASE + 0x0000002C)
-#define RKISP1_CIF_ISP_LSC_XGRAD_67		(RKISP1_CIF_ISP_LSC_BASE + 0x00000030)
-#define RKISP1_CIF_ISP_LSC_YGRAD_01		(RKISP1_CIF_ISP_LSC_BASE + 0x00000034)
-#define RKISP1_CIF_ISP_LSC_YGRAD_23		(RKISP1_CIF_ISP_LSC_BASE + 0x00000038)
-#define RKISP1_CIF_ISP_LSC_YGRAD_45		(RKISP1_CIF_ISP_LSC_BASE + 0x0000003C)
-#define RKISP1_CIF_ISP_LSC_YGRAD_67		(RKISP1_CIF_ISP_LSC_BASE + 0x00000040)
-#define RKISP1_CIF_ISP_LSC_XSIZE_01		(RKISP1_CIF_ISP_LSC_BASE + 0x00000044)
-#define RKISP1_CIF_ISP_LSC_XSIZE_23		(RKISP1_CIF_ISP_LSC_BASE + 0x00000048)
-#define RKISP1_CIF_ISP_LSC_XSIZE_45		(RKISP1_CIF_ISP_LSC_BASE + 0x0000004C)
-#define RKISP1_CIF_ISP_LSC_XSIZE_67		(RKISP1_CIF_ISP_LSC_BASE + 0x00000050)
-#define RKISP1_CIF_ISP_LSC_YSIZE_01		(RKISP1_CIF_ISP_LSC_BASE + 0x00000054)
-#define RKISP1_CIF_ISP_LSC_YSIZE_23		(RKISP1_CIF_ISP_LSC_BASE + 0x00000058)
-#define RKISP1_CIF_ISP_LSC_YSIZE_45		(RKISP1_CIF_ISP_LSC_BASE + 0x0000005C)
-#define RKISP1_CIF_ISP_LSC_YSIZE_67		(RKISP1_CIF_ISP_LSC_BASE + 0x00000060)
+#define RKISP1_CIF_ISP_LSC_XGRAD(n)		(RKISP1_CIF_ISP_LSC_BASE + 0x00000024 + (n) * 4)
+#define RKISP1_CIF_ISP_LSC_YGRAD(n)		(RKISP1_CIF_ISP_LSC_BASE + 0x00000034 + (n) * 4)
+#define RKISP1_CIF_ISP_LSC_XSIZE(n)		(RKISP1_CIF_ISP_LSC_BASE + 0x00000044 + (n) * 4)
+#define RKISP1_CIF_ISP_LSC_YSIZE(n)		(RKISP1_CIF_ISP_LSC_BASE + 0x00000054 + (n) * 4)
 #define RKISP1_CIF_ISP_LSC_TABLE_SEL		(RKISP1_CIF_ISP_LSC_BASE + 0x00000064)
 #define RKISP1_CIF_ISP_LSC_STATUS		(RKISP1_CIF_ISP_LSC_BASE + 0x00000068)
 
-- 
Regards,

Laurent Pinchart

