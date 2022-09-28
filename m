Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 076B95EE3E1
	for <lists+linux-media@lfdr.de>; Wed, 28 Sep 2022 20:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234569AbiI1SHG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Sep 2022 14:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233404AbiI1SHD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Sep 2022 14:07:03 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F69B248D9
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 11:07:01 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 8EEAC660229C;
        Wed, 28 Sep 2022 19:06:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1664388419;
        bh=eGucq5lgm7g2/ZogB1sF6WP8K4S2isc+ssZ6S8QJfSg=;
        h=From:To:Cc:Subject:Date:From;
        b=cOKBt/6n2celWfc5xbMxgwL0kaSNejzsUbuBZgfa2jOkktRqZuYT9PO5kmtIFkG7m
         AIKkCqrmqTt1qYNRZeKJVWBNigY+jJXUbfaZAgt2D/84YBqjEK+OLzu47FM01nse9D
         HGNOkv1/SlWehL5XSDo4sOJy9Y25kSEnwtUieQ0nR+dZ1Xefr7yacdtCoIfeC7bZQM
         MssvGXewvCVu3vLiarNPVcNhBmaVlxrUh/2JuhMkHqqL1aUZQfrfLFiT3OQJXOVqah
         7rnjScnFSz/sOnhQEEPSqvRzPDdGL11KlbNOyCJXc3dioEmCGAN6rRIH/E6xgwAOcX
         AjfrXCvRV0xDw==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] v4l2-info: move flags2s to v4l2-info.h
Date:   Wed, 28 Sep 2022 11:07:24 -0700
Message-Id: <20220928180724.61839-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make the flag2s function available to other utilities.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/common/v4l2-info.cpp | 7 +------
 utils/common/v4l2-info.h   | 8 ++++++++
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index a7964ad0..b297d7ce 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -16,12 +16,7 @@ static std::string num2s(unsigned num, bool is_hex = true)
 	return buf;
 }
 
-struct flag_def {
-	unsigned flag;
-	const char *str;
-};
-
-static std::string flags2s(unsigned val, const flag_def *def)
+std::string flags2s(unsigned val, const flag_def *def)
 {
 	std::string s;
 
diff --git a/utils/common/v4l2-info.h b/utils/common/v4l2-info.h
index 35237853..4a9aa3e8 100644
--- a/utils/common/v4l2-info.h
+++ b/utils/common/v4l2-info.h
@@ -11,6 +11,14 @@
 #include <linux/videodev2.h>
 #include <linux/v4l2-subdev.h>
 
+struct flag_def {
+	unsigned flag;
+	const char *str;
+};
+
+/* Return a comma-separated string of flags or hex value if unknown */
+std::string flags2s(unsigned val, const flag_def *def);
+
 /* Print capability information */
 void v4l2_info_capability(const v4l2_capability &cap);
 void v4l2_info_subdev_capability(const v4l2_subdev_capability &subdevcap);
-- 
2.37.3

