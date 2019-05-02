Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2202311FB8
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 18:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbfEBQJc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 12:09:32 -0400
Received: from mail-ot1-f73.google.com ([209.85.210.73]:43008 "EHLO
        mail-ot1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbfEBQJb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 May 2019 12:09:31 -0400
Received: by mail-ot1-f73.google.com with SMTP id q23so1173967otk.10
        for <linux-media@vger.kernel.org>; Thu, 02 May 2019 09:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=9xnFArciGrfO3ikzi57uVyk4LiBtt5n+h3mmuIaB6Rs=;
        b=Vt4bcNsmsQwdwzx2rVuQYIWmGuM1MudabGBak4VgLE+ddD/qUSnWDH10FuKsZhsUu7
         ASj1xuuqygmryeruOZ2dQ1Yg+mscR1z5ARgj9GmIwNnHumfdBPpzcO8Uj8vH6+0pwt4i
         8fMLi0L39i87GEfUtHLRLrfU7RUcdlqJwWMUy2voRATPxqUKhs6cJXKImmZTTnKRH9nk
         pIG+kvLZmz/WtMs/p1ZlKfCGWZK8WO1Vj3d9Kkr5Z1fS+GGSvpblZwkEzC8//aOdkpLZ
         8TpLSvaQUxZeobuTFS4dzX+ALGm2AUn5YX/+RgIhlGK4LZS2TcSHKcfEckG1PJbgMdix
         qUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=9xnFArciGrfO3ikzi57uVyk4LiBtt5n+h3mmuIaB6Rs=;
        b=G3R+A8EvdhL1zqr2xw+BarR9gjnyEr2YJF+QArvX9lmWmvf1Oy8OrPn1zim81Ro+V0
         hHy2Fn/c2G2YNX6BxuMtqaOtu0oCbGHsU20eWsGBaDNb2lUC34hXkLaqp8YzDk1dex1V
         CgwOV/7i0O2WMQz2gcvJLgeXT5wIJLPv0PmHXsOFXpFbBGv1NMbG4g6ugydIONBpIVhU
         bOghzXSKT+YcoXq1IsnlbxKmFw2Xe/tfarLLla7TybLK1W5kqO9TD5KDh08YyDafvPXL
         5/+eBzmuWpQhTbSy3gtsVt8ASrLtfWh6dxWmcBHan2aX+80ZL7UizupT/wtt92ZoxQod
         PMqw==
X-Gm-Message-State: APjAAAWY5OTp/FSd/CibmLY6hySyOWB+3p/5zibXuG5Z/n5g54N8Octe
        Kq0kFcb1Jf3ixHgQC5gyDbRsb6geZiS93TGS
X-Google-Smtp-Source: APXvYqy8YCK4eRinKnCx8RTSwYf19+aTe9vQutpcjXxTYJgt5fPqvSjbBajWajCcC8+blskSFg7fljUPrPBvWBIo
X-Received: by 2002:a9d:6156:: with SMTP id c22mr2991816otk.363.1556813370975;
 Thu, 02 May 2019 09:09:30 -0700 (PDT)
Date:   Thu,  2 May 2019 18:09:26 +0200
Message-Id: <b3761c6479a49b60316325ebc22da904e36d4538.1556813333.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH] media: pvrusb2: use a different format for warnings
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org,
        Andrey Konovalov <andreyknvl@google.com>,
        syzbot+af8f8d2ac0d39b0ed3a0@syzkaller.appspotmail.com,
        syzbot+170a86bf206dd2c6217e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the pvrusb2 driver detects that there's something wrong with the
device, it prints a warning message. Right now those message are
printed in two different formats:

1. ***WARNING*** message here
2. WARNING: message here

There's an issue with the second format. Syzkaller recognizes it as a
message produced by a WARN_ON(), which is used to indicate a bug in the
kernel. However pvrusb2 prints those warnings to indicate an issue with
the device, not the bug in the kernel.

This patch changes the pvrusb2 driver to consistently use the first
warning message format. This will unblock syzkaller testing of this
driver.

Reported-by: syzbot+af8f8d2ac0d39b0ed3a0@syzkaller.appspotmail.com
Reported-by: syzbot+170a86bf206dd2c6217e@syzkaller.appspotmail.com
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c      | 4 ++--
 drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c | 6 +++---
 drivers/media/usb/pvrusb2/pvrusb2-std.c      | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index 446a999dd2ce..a0f7b10045d2 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -1678,7 +1678,7 @@ static int pvr2_decoder_enable(struct pvr2_hdw *hdw,int enablefl)
 	}
 	if (!hdw->flag_decoder_missed) {
 		pvr2_trace(PVR2_TRACE_ERROR_LEGS,
-			   "WARNING: No decoder present");
+			   "***WARNING*** No decoder present");
 		hdw->flag_decoder_missed = !0;
 		trace_stbit("flag_decoder_missed",
 			    hdw->flag_decoder_missed);
@@ -2364,7 +2364,7 @@ struct pvr2_hdw *pvr2_hdw_create(struct usb_interface *intf,
 	if (hdw_desc->flag_is_experimental) {
 		pvr2_trace(PVR2_TRACE_INFO, "**********");
 		pvr2_trace(PVR2_TRACE_INFO,
-			   "WARNING: Support for this device (%s) is experimental.",
+			   "***WARNING*** Support for this device (%s) is experimental.",
 							      hdw_desc->description);
 		pvr2_trace(PVR2_TRACE_INFO,
 			   "Important functionality might not be entirely working.");
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c b/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c
index 8f023085c2d9..43e54bdbd4aa 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c
@@ -343,11 +343,11 @@ static int i2c_hack_cx25840(struct pvr2_hdw *hdw,
 
 	if ((ret != 0) || (*rdata == 0x04) || (*rdata == 0x0a)) {
 		pvr2_trace(PVR2_TRACE_ERROR_LEGS,
-			   "WARNING: Detected a wedged cx25840 chip; the device will not work.");
+			   "***WARNING*** Detected a wedged cx25840 chip; the device will not work.");
 		pvr2_trace(PVR2_TRACE_ERROR_LEGS,
-			   "WARNING: Try power cycling the pvrusb2 device.");
+			   "***WARNING*** Try power cycling the pvrusb2 device.");
 		pvr2_trace(PVR2_TRACE_ERROR_LEGS,
-			   "WARNING: Disabling further access to the device to prevent other foul-ups.");
+			   "***WARNING*** Disabling further access to the device to prevent other foul-ups.");
 		// This blocks all further communication with the part.
 		hdw->i2c_func[0x44] = NULL;
 		pvr2_hdw_render_useless(hdw);
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-std.c b/drivers/media/usb/pvrusb2/pvrusb2-std.c
index 6b651f8b54df..37dc299a1ca2 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-std.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-std.c
@@ -353,7 +353,7 @@ struct v4l2_standard *pvr2_std_create_enum(unsigned int *countptr,
 		bcnt = pvr2_std_id_to_str(buf,sizeof(buf),fmsk);
 		pvr2_trace(
 			PVR2_TRACE_ERROR_LEGS,
-			"WARNING: Failed to classify the following standard(s): %.*s",
+			"***WARNING*** Failed to classify the following standard(s): %.*s",
 			bcnt,buf);
 	}
 
-- 
2.21.0.593.g511ec345e18-goog

