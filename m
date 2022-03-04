Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF5374CDA19
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 18:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236615AbiCDRVb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 12:21:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241103AbiCDRVV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 12:21:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE251CDDFA
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 09:20:25 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9EAF1027;
        Fri,  4 Mar 2022 18:19:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646414390;
        bh=vkcss5sWKQIu90Ea0+JY+IY38PUEMtBAw7K4gtJuE90=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cGAOOLgCZfK8hvXIg8f0erUvSpfU4mdE+QZTuIPSIEQA+yf5xPfnVtcThPwt0oTn7
         nT+HPziUDSPmmIA5CzCe7KNWBImJUV3kpv9OWaRWRqJw58QAvH6R8wpT4zdY9pd9w7
         yh5SuRf5PGQwsJVFNImHRrD/FUdU58B7WIpomB9c=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 13/17] media: rkisp1: Compile debugfs support conditionally
Date:   Fri,  4 Mar 2022 19:19:21 +0200
Message-Id: <20220304171925.1592-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304171925.1592-1-laurent.pinchart@ideasonboard.com>
References: <20220304171925.1592-1-laurent.pinchart@ideasonboard.com>
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
 .../media/platform/rockchip/rkisp1/Makefile   | 19 +++++++++++--------
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  9 +++++++++
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/Makefile b/drivers/media/platform/rockchip/rkisp1/Makefile
index 1a39bdcc608e..c39ab7010c66 100644
--- a/drivers/media/platform/rockchip/rkisp1/Makefile
+++ b/drivers/media/platform/rockchip/rkisp1/Makefile
@@ -1,11 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0
 
+rockchip-isp1-y := rkisp1-capture.o \
+		   rkisp1-common.o \
+		   rkisp1-debug.o \
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

