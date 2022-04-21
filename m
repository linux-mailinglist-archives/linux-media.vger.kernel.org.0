Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A20250AC25
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 01:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442702AbiDUXqG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 19:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442694AbiDUXqC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 19:46:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3216E3AA6C
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 16:43:11 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6BB1FD6;
        Fri, 22 Apr 2022 01:42:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650584577;
        bh=shLN6M/uEqPbsMqqd12FBZcjLJb90vKIGT7a+RTEros=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H/5md3P0eVWj/EpZ+d4b+/5S9t8/savD5pTDC1Wc94c+ZI4ZKyzNV4G6+EdwQlrWv
         6DhHNAiEK10BlYTwYum8Gnii58lJO91AzAl/QWsQF3TyPywarez+0yUpzy2qkbxWlr
         KU02xY8VuT9qMTd4zeo/zdBMV9ty3eQ06vBluI68=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v4 20/21] media: rkisp1: Align macro definitions
Date:   Fri, 22 Apr 2022 02:42:39 +0300
Message-Id: <20220421234240.1694-21-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make the code more readable by using the same alignment for all macros
in rkisp1-common.h.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index a7ffe2830fa8..4243ff5e2197 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -29,14 +29,14 @@ struct dentry;
  * flags on the 'direction' field in struct 'rkisp1_isp_mbus_info' that indicate
  * on which pad the media bus format is supported
  */
-#define RKISP1_ISP_SD_SRC BIT(0)
-#define RKISP1_ISP_SD_SINK BIT(1)
+#define RKISP1_ISP_SD_SRC			BIT(0)
+#define RKISP1_ISP_SD_SINK			BIT(1)
 
 /* min and max values for the widths and heights of the entities */
-#define RKISP1_ISP_MAX_WIDTH		4032
-#define RKISP1_ISP_MAX_HEIGHT		3024
-#define RKISP1_ISP_MIN_WIDTH		32
-#define RKISP1_ISP_MIN_HEIGHT		32
+#define RKISP1_ISP_MAX_WIDTH			4032
+#define RKISP1_ISP_MAX_HEIGHT			3024
+#define RKISP1_ISP_MIN_WIDTH			32
+#define RKISP1_ISP_MIN_HEIGHT			32
 
 #define RKISP1_RSZ_MP_SRC_MAX_WIDTH		4416
 #define RKISP1_RSZ_MP_SRC_MAX_HEIGHT		3312
@@ -46,20 +46,20 @@ struct dentry;
 #define RKISP1_RSZ_SRC_MIN_HEIGHT		16
 
 /* the default width and height of all the entities */
-#define RKISP1_DEFAULT_WIDTH		800
-#define RKISP1_DEFAULT_HEIGHT		600
+#define RKISP1_DEFAULT_WIDTH			800
+#define RKISP1_DEFAULT_HEIGHT			600
 
-#define RKISP1_DRIVER_NAME	"rkisp1"
-#define RKISP1_BUS_INFO		"platform:" RKISP1_DRIVER_NAME
+#define RKISP1_DRIVER_NAME			"rkisp1"
+#define RKISP1_BUS_INFO				"platform:" RKISP1_DRIVER_NAME
 
 /* maximum number of clocks */
-#define RKISP1_MAX_BUS_CLK	8
+#define RKISP1_MAX_BUS_CLK			8
 
 /* a bitmask of the ready stats */
-#define RKISP1_STATS_MEAS_MASK		(RKISP1_CIF_ISP_AWB_DONE |	\
-					 RKISP1_CIF_ISP_AFM_FIN |	\
-					 RKISP1_CIF_ISP_EXP_END |	\
-					 RKISP1_CIF_ISP_HIST_MEASURE_RDY)
+#define RKISP1_STATS_MEAS_MASK			(RKISP1_CIF_ISP_AWB_DONE |	\
+						 RKISP1_CIF_ISP_AFM_FIN |	\
+						 RKISP1_CIF_ISP_EXP_END |	\
+						 RKISP1_CIF_ISP_HIST_MEASURE_RDY)
 
 /* enum for the resizer pads */
 enum rkisp1_rsz_pad {
-- 
Regards,

Laurent Pinchart

