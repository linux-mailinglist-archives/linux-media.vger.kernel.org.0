Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 155B522CE37
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 21:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgGXTBg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 15:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgGXTBf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 15:01:35 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E11CC0619D3
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 12:01:35 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id y3so9203607wrl.4
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 12:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qbq+HGZCccpOu0jKEx3g8DzPYEDor7r2X9EPfaB8fSQ=;
        b=pU2GdjhK/mLSnNpGswoq0j6HySFJ5B9JRIJJ/kunUXMgIa3G7XzNrsgm0T42SJt+56
         ticbWfvqb4QXeyUv8vpOsq30jF8/pmI0PcFiGUIDlal3NhmsUKG/Qv2xlvnP3b/OWJ7g
         qYuNTfK/hsTnyGJ5q2sx+UkYviw1veurp2Pd9ol0G/lPlROReTagsp1GeFEjmzW2h/d9
         7Vgh3/K0uADK9bofWR5xNVfcb3iR5G1/jRWwkPsP9Fg7419c4cISeWBYPQ8C3fhkMMOf
         yGSFO7G+93gQe0+sickY+wWjOUvl7tw7+lrk26rIVUbe4EavSVhrkmaBlpjXffhe46pK
         g9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qbq+HGZCccpOu0jKEx3g8DzPYEDor7r2X9EPfaB8fSQ=;
        b=fLgxWV7urK3wrWxS+oT2jiKa1dqKsi+HuxBw/Cz6/6vSldZl3CKH6FKvRmYnl5YQla
         rWDq41lVDktn092FswHBBGp95g/mqf6icJot+Q4jCtu6vOTi1OpKE2SRK4zjZsDmX78U
         3GkMwetGWPImODpaLtYrZyK14VcvoIK/kvyqA5hqTDDSeZpox9sXoO6Uc3u8CBQOwCL6
         ++9z1mipWroip3pCEKVhkqsfYNmJUQw2ca3fI0la4cO5ZT/kd+dyqVDpj3Z60MVnlbGK
         IHxgJHXLGO/dekxCnafvQC0X/KjkS5nmsYkvtdXRJIivvZhB9k+QMMSnDPgXgcRTWwIm
         PI0g==
X-Gm-Message-State: AOAM531z+dwKmucI9r1PlgQuAOM4M+FJABLgP1+WdO3eGWzvSqvhTtrQ
        Che1XHh1YtGz0WilBip2sFc=
X-Google-Smtp-Source: ABdhPJxrIIO0PlZGmAQ1qlP72TUI3toY6SREzqK+NELrOH80ddlR39g44rxs7WQkWURt02Q9gbrwJg==
X-Received: by 2002:adf:df08:: with SMTP id y8mr7383985wrl.152.1595617294064;
        Fri, 24 Jul 2020 12:01:34 -0700 (PDT)
Received: from garrit-VirtualBox.fritz.box ([94.31.102.44])
        by smtp.gmail.com with ESMTPSA id s125sm2293604wmf.14.2020.07.24.12.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 12:01:33 -0700 (PDT)
From:   Garrit Franke <garritfranke@gmail.com>
To:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, mchehab@kernel.org, trivial@kernel.org
Cc:     Garrit Franke <garritfranke@gmail.com>
Subject: [PATCH] trivial: uapi: replace bitshifts with BIT macro
Date:   Fri, 24 Jul 2020 21:01:18 +0200
Message-Id: <20200724190118.24020-1-garritfranke@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Garrit Franke <garritfranke@gmail.com>
---
 include/uapi/linux/media.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 383ac7b7d8..5710ba0c83 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -142,8 +142,8 @@ struct media_device_info {
 #define MEDIA_ENT_F_DV_ENCODER			(MEDIA_ENT_F_BASE + 0x6002)
 
 /* Entity flags */
-#define MEDIA_ENT_FL_DEFAULT			(1 << 0)
-#define MEDIA_ENT_FL_CONNECTOR			(1 << 1)
+#define MEDIA_ENT_FL_DEFAULT			BIT(0)
+#define MEDIA_ENT_FL_CONNECTOR			BIT(1)
 
 /* OR with the entity id value to find the next entity */
 #define MEDIA_ENT_ID_FLAG_NEXT			(1U << 31)
@@ -207,9 +207,9 @@ struct media_entity_desc {
 	};
 };
 
-#define MEDIA_PAD_FL_SINK			(1 << 0)
-#define MEDIA_PAD_FL_SOURCE			(1 << 1)
-#define MEDIA_PAD_FL_MUST_CONNECT		(1 << 2)
+#define MEDIA_PAD_FL_SINK				BIT(0)
+#define MEDIA_PAD_FL_SOURCE				BIT(1)
+#define MEDIA_PAD_FL_MUST_CONNECT		BIT(2)
 
 struct media_pad_desc {
 	__u32 entity;		/* entity ID */
@@ -218,13 +218,13 @@ struct media_pad_desc {
 	__u32 reserved[2];
 };
 
-#define MEDIA_LNK_FL_ENABLED			(1 << 0)
-#define MEDIA_LNK_FL_IMMUTABLE			(1 << 1)
-#define MEDIA_LNK_FL_DYNAMIC			(1 << 2)
+#define MEDIA_LNK_FL_ENABLED			BIT(0)
+#define MEDIA_LNK_FL_IMMUTABLE			BIT(1)
+#define MEDIA_LNK_FL_DYNAMIC			BIT(2)
 
 #define MEDIA_LNK_FL_LINK_TYPE			(0xf << 28)
 #  define MEDIA_LNK_FL_DATA_LINK		(0 << 28)
-#  define MEDIA_LNK_FL_INTERFACE_LINK		(1 << 28)
+#  define MEDIA_LNK_FL_INTERFACE_LINK		BIT(28)
 
 struct media_link_desc {
 	struct media_pad_desc source;
@@ -433,7 +433,7 @@ struct media_v2_topology {
 #define MEDIA_INTF_T_ALSA_TIMER                (MEDIA_INTF_T_ALSA_BASE + 7)
 
 /* Obsolete symbol for media_version, no longer used in the kernel */
-#define MEDIA_API_VERSION			((0 << 16) | (1 << 8) | 0)
+#define MEDIA_API_VERSION			((0 << 16) | BIT(8) | 0)
 
 #endif
 
-- 
2.25.1

