Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C09DB9F5A5
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 23:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbfH0Vzo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 17:55:44 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34413 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbfH0Vzo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 17:55:44 -0400
Received: by mail-pf1-f193.google.com with SMTP id b24so276507pfp.1;
        Tue, 27 Aug 2019 14:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=m917iy68AiYtkb2q0cQ7Q/izkV3v3/AN7Omu2+VjOfg=;
        b=lA5psUzQf2ludbNU59iHu6CcA2pcJoWFp7AeDz5ogJiLP4FvrIoHI7e5ctjg9Klv8M
         Z9LjArGRWSOg1KpLsVKjj4IhW+myFcWm91vtmsRA/c+a0LxKZjJftuu1axF6W3n64dVN
         WvtIzDp4d6zvazewkvIXMOW59MdXesudUskDFG3Mw2pdppSwbBiVtNlv5nqlqbUU9eRN
         ki2/VPiRHSCi5y09VpJ9tY4r70NhJF3mP2erKptgXuvf++fCbPtXmEW8Qxj9vfRl6lrd
         JDgZUxcGuAkyZF8N9Tzvfazyk4eZT/GTVzxtFCrdcRop09j8SrfD/LlCXayt3IP649Nf
         7fAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=m917iy68AiYtkb2q0cQ7Q/izkV3v3/AN7Omu2+VjOfg=;
        b=KFpuHRMapVq5RvSL3V5z3C0rd1J/hGi7ASuXYCLnT8yWl7Or1Lvw3SN+2QtOm9gKTb
         +0dPO6+yJQqQKHPto7CzlywuitstAcuO9OeY/7HpDNjKqH1qhGqxSTaiOiU1xOuBZn0i
         roszRafYeOAvuzVTXIlkb5QcBLF/o0Xbw/BSJd7mUZ/i7fDpl1VkN8tiiK0pYK2IvmxE
         0wf8eJimyUpEDo1dk3DXi65Jn/D7v1R4hiDzZ0cpCgihDQ9N09str3Xjp0ATcoXI3fpF
         CVpbWZjS7wuHPAcGEqAneUNRxAGjM29moaPK9boKq4T40XIlQ1sbx/XeMSImjHvtA0Cb
         3y3Q==
X-Gm-Message-State: APjAAAXVe+hwnojS8JY2VVEftid3pNVJrTV/JgZRVQxRffWWO/gtUknr
        uzZOa73SH4zsGrng5T5VMEpatIcovik=
X-Google-Smtp-Source: APXvYqyHAA5th5FDbqfZ0JZdkF19gY0MgtZL/1IefiqClEs4PRtVuWU/s/xStQACjpNSJ+MzWOVN/Q==
X-Received: by 2002:a63:2b0c:: with SMTP id r12mr564319pgr.206.1566942943450;
        Tue, 27 Aug 2019 14:55:43 -0700 (PDT)
Received: from a06aacb89ec0.pdc.gateworks.com (68-189-91-139.static.snlo.ca.charter.com. [68.189.91.139])
        by smtp.gmail.com with ESMTPSA id i9sm298640pgg.38.2019.08.27.14.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 14:55:43 -0700 (PDT)
From:   Matthew Michilot <matthew.michilot@gmail.com>
X-Google-Original-From: Matthew Michilot <mmichilot@gateworks.com>
To:     lars@metafoo.de
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Matthew Michilot <matthew.michilot@gmail.com>
Subject: [PATCH] media: i2c: adv7180: fix adv7280 BT.656-4 compatibility
Date:   Tue, 27 Aug 2019 21:55:39 +0000
Message-Id: <20190827215539.1286-1-mmichilot@gateworks.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Matthew Michilot <matthew.michilot@gmail.com>

Captured video would be out of sync when using the adv7280 with
the BT.656-4 protocol. Certain registers (0x04, 0x31, 0xE6) had to
be configured properly to ensure BT.656-4 compatibility.

An error in the adv7280 reference manual suggested that EAV/SAV mode
was enabled by default, however upon inspecting register 0x31, it was
determined to be disabled by default.

Signed-off-by: Matthew Michilot <matthew.michilot@gmail.com>
Reviewed-by: Tim Harvey <tharvey@gateworks.com>
---
 drivers/media/i2c/adv7180.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 99697baad2ea..27da424dce76 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -94,6 +94,7 @@
 #define ADV7180_REG_SHAP_FILTER_CTL_1	0x0017
 #define ADV7180_REG_CTRL_2		0x001d
 #define ADV7180_REG_VSYNC_FIELD_CTL_1	0x0031
+#define ADV7180_VSYNC_FIELD_CTL_1_NEWAV 0x12
 #define ADV7180_REG_MANUAL_WIN_CTL_1	0x003d
 #define ADV7180_REG_MANUAL_WIN_CTL_2	0x003e
 #define ADV7180_REG_MANUAL_WIN_CTL_3	0x003f
@@ -935,10 +936,20 @@ static int adv7182_init(struct adv7180_state *state)
 		adv7180_write(state, ADV7180_REG_EXTENDED_OUTPUT_CONTROL, 0x57);
 		adv7180_write(state, ADV7180_REG_CTRL_2, 0xc0);
 	} else {
-		if (state->chip_info->flags & ADV7180_FLAG_V2)
+		if (state->chip_info->flags & ADV7180_FLAG_V2) {
+			/* ITU-R BT.656-4 compatible */
 			adv7180_write(state,
 				      ADV7180_REG_EXTENDED_OUTPUT_CONTROL,
-				      0x17);
+				      ADV7180_EXTENDED_OUTPUT_CONTROL_NTSCDIS);
+			/* Manually set NEWAVMODE */
+			adv7180_write(state,
+				      ADV7180_REG_VSYNC_FIELD_CTL_1,
+				      ADV7180_VSYNC_FIELD_CTL_1_NEWAV);
+			/* Manually set V bit end position in NTSC mode */
+			adv7180_write(state,
+				      ADV7180_REG_NTSC_V_BIT_END,
+				      ADV7180_NTSC_V_BIT_END_MANUAL_NVEND);
+		}
 		else
 			adv7180_write(state,
 				      ADV7180_REG_EXTENDED_OUTPUT_CONTROL,
-- 
2.17.1

