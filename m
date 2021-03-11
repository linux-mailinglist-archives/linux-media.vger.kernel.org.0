Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89C2E337F48
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 21:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhCKUwX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 15:52:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbhCKUvw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 15:51:52 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BBABC061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 12:51:51 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id u16so3501627wrt.1
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 12:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CZRhGq3I3MMMTRCiFyYOwqZl+q6zDS9dDxYZH64vcCg=;
        b=iu0ku3tQgT/9lBnICYScVVtUl2asPnoQ9uVDpzrolUk3/04GRnofNhnyqC8UoNNeiP
         ww8uNqmIcNSvJ0oud8DVTh3ybsC8TrhVN2dJ0R0uERgEpvjs6HtrjgHzIzSNtTJcgS0T
         hIqpLlyZvBhS8wVHPC5QqbmPcGyJat7zNc0EJJ9mpL1lzRBwfI9zSAltNE0OI7y/zaGu
         +MUZqz5iXar3Ph1qeFnFumTF65b9xM1kvL/3Ql4LQ7/IZ202iuGDa2QsMAF2ty4D6uTM
         lPzsIkRthFP9iu7VnZeoK3KxrBoIYFX4/blE+D5xK/H7aWDk//E7gusboUN4eLj8SuSo
         IhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CZRhGq3I3MMMTRCiFyYOwqZl+q6zDS9dDxYZH64vcCg=;
        b=mHlggZ63QhTx6SniTdRAuh8cY8Tq/p4DnTqAQHe/rNipx+lrOxO+U1bLKObZX0BZUA
         zazOpd9PwgCIdwpPA0VMYlSMehnJlNxRjy2EYeqszP9zu4l4FCljhkRn3sxJE7WVvZVG
         z3UU9sbpgVSM28w13q4Bfj53CMQHhECGVdf0MrbyObLKBEcEFDRtEJZYYFr0JJp+wbOP
         +0mrEZYMZEekpYeHIbYF0+Z6rii7ZND8tDGKqsmmCAFv15cgRCaAlBgYI2lQaw5KTouJ
         ail415HRgassdcPlRm9kzaD8gFrfbQTYpMDLVw9FYnkE+5kdX8kGBqR1pdDfvCKVXKEX
         imrA==
X-Gm-Message-State: AOAM532IELW96BXIgLq0O0inj+0OrKOGzTqEeeZlubtkJAs168/V7oCM
        9tBPatLgmSaL9jho98YcCoZd0bvb2VU=
X-Google-Smtp-Source: ABdhPJzyzx57q5Itgg3XG49PJj48Nta+KAvV5YT2KzCwpIvOqhewTMCYnG8hkM2bU8cozqX9W2znpg==
X-Received: by 2002:adf:f44b:: with SMTP id f11mr10857635wrp.345.1615495910372;
        Thu, 11 Mar 2021 12:51:50 -0800 (PST)
Received: from ped.lan (dynamic-046-114-141-181.46.114.pool.telefonica.de. [46.114.141.181])
        by smtp.googlemail.com with ESMTPSA id m10sm27280wmh.13.2021.03.11.12.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 12:51:50 -0800 (PST)
From:   Philipp Zabel <philipp.zabel@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Philipp Zabel <philipp.zabel@gmail.com>
Subject: [PATCH] edid-decode: support Microsoft extension for HMDs and specialized monitors
Date:   Thu, 11 Mar 2021 21:51:33 +0100
Message-Id: <20210311205133.149796-1-philipp.zabel@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for parsing VSDBs documented in Microsoft's "EDID extension
for head-mounted and specialized monitors" [1].

[1] https://docs.microsoft.com/en-us/windows-hardware/drivers/display/specialized-monitors-edid-extension

Signed-off-by: Philipp Zabel <philipp.zabel@gmail.com>
---
 parse-cta-block.cpp | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index 075db46..e7ea01b 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -1067,6 +1067,43 @@ static void cta_amd(const unsigned char *x, unsigned length)
 	}
 }
 
+static std::string display_use_case(unsigned char x)
+{
+	switch (x) {
+	case 1: return "Test equipment";
+	case 2: return "Generic display";
+	case 3: return "Television display";
+	case 4: return "Desktop productivity display";
+	case 5: return "Desktop gaming display";
+	case 6: return "Presentation display";
+	case 7: return "Virtual reality headset";
+	case 8: return "Augmented reality";
+	case 16: return "Video wall display";
+	case 17: return "Medical imaging display";
+	case 18: return "Dedicated gaming display";
+	case 19: return "Dedicated video monitor display";
+	case 20: return "Accessory display";
+	default: break;
+	}
+	fail("Unknown Display product primary use case 0x%02x.\n", x);
+	return std::string("Unknown display use case (") + utohex(x) + ")";
+}
+
+static void cta_microsoft(const unsigned char *x, unsigned length)
+{
+	// This VSDB is documented at:
+	// https://docs.microsoft.com/en-us/windows-hardware/drivers/display/specialized-monitors-edid-extension
+	printf("    Version: %u\n", x[0]);
+	if (x[0] > 2) {
+		// In version 1 and 2 these bits should always be set to 0.
+		printf("    Desktop Usage: %u\n", (x[1] >> 6) & 1);
+		printf("    Third-Party Usage: %u\n", (x[1] >> 5) & 1);
+	}
+	printf("    Display Product Primary Use Case: %u (%s)\n", x[1] & 0x1f,
+	       display_use_case(x[1] & 0x1f).c_str());
+	hex_block("    Container ID: ", x + 2, length - 2, false, 16);
+}
+
 static void cta_hdr10plus(const unsigned char *x, unsigned length)
 {
 	printf("    Application Version: %u", x[0]);
@@ -2172,6 +2209,10 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 			cta_amd(x + 4, length - 3);
 			break;
 		}
+		if (oui == 0xca125c && length == 0x15) {
+			cta_microsoft(x + 4, length - 3);
+			break;
+		}
 		hex_block("    ", x + 4, length - 3);
 		break;
 	case 0x04:
-- 
2.30.2

