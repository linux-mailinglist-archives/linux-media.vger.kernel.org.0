Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41C3D50AC24
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 01:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442674AbiDUXp4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 19:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442672AbiDUXpw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 19:45:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9284338DAF
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 16:43:00 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2700F501;
        Fri, 22 Apr 2022 01:42:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650584572;
        bh=YI6ZfSPPpsMk3H5xaJeAZAAJflSuOeobrCa7O/0DK4Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=l307HltHju7DXXK3sYHWv8wy8p9Rle/cUw44EB/lz9gDwdUHWbSwtXI7ornMq5TY0
         L9g5u0II6/8xKbQAgoOYNf7XRAITuxcBPYA9XzhSh4YAFjP4C2xddvOdoyqL0PnVSa
         AtuIZLtV2uEb5Z4oVmO6pWjDglCdsWdTj32D7DLE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v4 13/21] media: rkisp1: Compile debugfs support conditionally
Date:   Fri, 22 Apr 2022 02:42:32 +0300
Message-Id: <20220421234240.1694-14-laurent.pinchart@ideasonboard.com>
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

When CONFIG_DEBUGFS is disabled, there's no need to compile the debugfs
support in. Make it conditional.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
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

