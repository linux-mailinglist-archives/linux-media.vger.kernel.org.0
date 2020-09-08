Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D44F72614E9
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 18:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731509AbgIHQkj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 12:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732066AbgIHQhZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 12:37:25 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A12C0612FF
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 05:58:48 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id a9so17083395wmm.2
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2020 05:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codex.online; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uub9k0StEJlQyOQ33s7kr8CRajYny0y7opDrp/nmXXw=;
        b=dHQ+rhSh1NeaE635v725ZsPUsdyNF4z3S55yVFakxl6FGl72jH3fTWxkbExIGem3tm
         PeSuXo5+8YdWBusyWuXdtzA1Ia8sWbTjEWZdnvdNJXFETFguSC0PnoJAfcdp4gMuOBMj
         usAR11oP5ZEBPkVOULCE9kp8Ie7oEUrpQENOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uub9k0StEJlQyOQ33s7kr8CRajYny0y7opDrp/nmXXw=;
        b=XU+x4nKlqQI3l8OZVS0V4IeNqSUoFtczd0oohWkfdDKQAaJQwzagidPLcngwpNph10
         o5tBeei3BVHSZa7VnK2krU1Gwy0NyA9dVW0CMdiJi5Y6phxaVf/vldALKGMQdN7BuMm2
         HS6DH3MVaJ7dj/nBxfFCKxOy5KqtUdg1uBOhVJ0raC5rJvpN7mvV2RRa5+KfZbvn2Bkj
         wgm/WVJkqZvXaZZoGtIpkZUIfecJuA6HAr9yMOgNzAoot2Rke4cNKtAUaJEv7azGHrRO
         08hX+zJ6KBRmlWPCm5ZtZ86yscAZXVFcpTKoY9fY1J83II9UFC3mt8zlBT8scqHf2eq4
         risA==
X-Gm-Message-State: AOAM531UyP2LT1hGwnTbgwrbqewBgUUOiNApvQ8mrCU7u+yDgnEQ4lBv
        w+g83BPdtK7TK+vxbKM/Whm/oAdHNaF9+Q==
X-Google-Smtp-Source: ABdhPJx2xz0HZ07x+R8aUcNgeGxp4/+NpWx1T/H/9ykjIAycrYIka6lTt9KIlTR52a+QFpBButAEtA==
X-Received: by 2002:a05:600c:2:: with SMTP id g2mr4486243wmc.85.1599569926888;
        Tue, 08 Sep 2020 05:58:46 -0700 (PDT)
Received: from localhost ([66.159.216.147])
        by smtp.gmail.com with ESMTPSA id x10sm33435256wmi.37.2020.09.08.05.58.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 05:58:46 -0700 (PDT)
From:   Harry Mallon <harry.mallon@codex.online>
To:     linux-media@vger.kernel.org
Subject: [PATCH] edid-decode: Report supported SL-HDR versions
Date:   Tue,  8 Sep 2020 13:58:44 +0100
Message-Id: <20200908125844.73317-1-harry.mallon@codex.online>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Specified in ETSI TS 103 433-1 v1.3.1

Signed-off-by: Harry Mallon <harry.mallon@codex.online>
---
 parse-cta-block.cpp | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index 97924d1..ad1e18b 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -1512,11 +1512,21 @@ static void cta_hdr_dyn_metadata_block(const unsigned char *x, unsigned length)
 		printf("    HDR Dynamic Metadata Type %u\n", type);
 		switch (type) {
 		case 1:
-		case 2:
 		case 4:
 			if (type_len > 2)
 				printf("      Version: %u\n", x[3] & 0xf);
 			break;
+		case 2:
+			if (type_len > 2) {
+				unsigned version = x[3] & 0xf;
+				printf("      Version: %u\n", version);
+				if (version >= 1) {
+					if (x[3] & 0x10) printf("      Supports SL-HDR1 (ETSI TS 103 433-1)\n");
+					if (x[3] & 0x20) printf("      Supports SL-HDR2 (ETSI TS 103 433-2)\n");
+					if (x[3] & 0x40) printf("      Supports SL-HDR3 (ETSI TS 103 433-3)\n");
+				}
+			}
+			break;
 		default:
 			break;
 		}
-- 
2.28.0

