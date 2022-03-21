Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 693174E26CE
	for <lists+linux-media@lfdr.de>; Mon, 21 Mar 2022 13:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345690AbiCUMq1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Mar 2022 08:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347351AbiCUMq0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Mar 2022 08:46:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E626985A1
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 05:45:01 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0E8B291;
        Mon, 21 Mar 2022 13:44:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647866699;
        bh=yS1QzM6s4PBHRa1ex3QcCA6Z3AeIgBWMyeQhgoR+a3g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VscxUJ7y2gvdiDGpV5o5yZegpA+TO7D8KpJVzqzOhdn7ER6eKqumFatDFKZ2ODe42
         AVwmNYqA/vdCt38c6GG2QWDMq6k6XbKkNZQ86/HZVuI2LXHpyDJEOXHDrces+tADYF
         dIwRGSbMo9YagYBD06CaCm8z8uBf5Z9IMLkNA6/o=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v3.1 13/17] media: rkisp1: Compile debugfs support conditionally
Date:   Mon, 21 Mar 2022 14:44:37 +0200
Message-Id: <20220321124437.12749-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220319163100.3083-14-laurent.pinchart@ideasonboard.com>
References: <20220319163100.3083-14-laurent.pinchart@ideasonboard.com>
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

When CONFIG_DEBUGFS is disabled, there's no need to compile the debugfs
support in. Make it conditional.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v3:

- Fix double mention of rkisp1-debug.o in Makefile
---
 .../media/platform/rockchip/rkisp1/Makefile    | 18 ++++++++++--------
 .../platform/rockchip/rkisp1/rkisp1-common.h   |  9 +++++++++
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/Makefile b/drivers/media/platform/rockchip/rkisp1/Makefile
index 1a39bdcc608e..f7543a82aa10 100644
--- a/drivers/media/platform/rockchip/rkisp1/Makefile
+++ b/drivers/media/platform/rockchip/rkisp1/Makefile
@@ -1,11 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0
 
+rockchip-isp1-y := rkisp1-capture.o \
+		   rkisp1-common.o \
+		   rkisp1-dev.o \
+		   rkisp1-isp.o \
+		   rkisp1-resizer.o \
+		   rkisp1-stats.o \
+		   rkisp1-params.o
+
+rockchip-isp1-$(CONFIG_DEBUG_FS) += rkisp1-debug.o
+
 obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1) += rockchip-isp1.o
-rockchip-isp1-objs += 	rkisp1-capture.o \
-			rkisp1-common.o \
-			rkisp1-debug.o \
-			rkisp1-dev.o \
-			rkisp1-isp.o \
-			rkisp1-resizer.o \
-			rkisp1-stats.o \
-			rkisp1-params.o
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 07a92ed8bdc8..a7ffe2830fa8 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -518,7 +518,16 @@ void rkisp1_stats_unregister(struct rkisp1_device *rkisp1);
 int rkisp1_params_register(struct rkisp1_device *rkisp1);
 void rkisp1_params_unregister(struct rkisp1_device *rkisp1);
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
 void rkisp1_debug_init(struct rkisp1_device *rkisp1);
 void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1);
+#else
+static inline void rkisp1_debug_init(struct rkisp1_device *rkisp1)
+{
+}
+static inline void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
+{
+}
+#endif
 
 #endif /* _RKISP1_COMMON_H */
-- 
Regards,

Laurent Pinchart

