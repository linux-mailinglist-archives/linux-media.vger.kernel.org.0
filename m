Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D350B94FE
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 18:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391071AbfITQMb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 12:12:31 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35307 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388473AbfITQMb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 12:12:31 -0400
Received: by mail-wm1-f66.google.com with SMTP id y21so2833970wmi.0
        for <linux-media@vger.kernel.org>; Fri, 20 Sep 2019 09:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pmRl2UYASKDcoA4tl0oihWQqkqih3Vp25rXnozbYFPg=;
        b=fmQMbY22FpVloEO/KK9SuvgXS5NIshvjocsyO2WPpj5y2wwikJO7e3cZv1hjzhUkZI
         ciZdfmeqprPFtm4l7IhwA2Q9qaUjdjxKtB+RVEVpEbOBVxl1TRc4erhWsk2FUezWEJFh
         TRHHyflmBV8dht9DYb8uxKkHE33SoopfMsTsyGYtpGJK+9b+/8kLo7Bc/NZYuuwOCnYt
         aP228CH1dzrfmlFtu5fHEbBxJnRJYjcc/RUplt/1mI+lcJPLVCEHGDJz9bk7ex7sCOhO
         pO1LwFq66pb0xVjn1W0b+yay5WquFS0Mo3Cg2PZbVKokzh7YEuDPfy2sZKCtx3unfdQf
         VC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pmRl2UYASKDcoA4tl0oihWQqkqih3Vp25rXnozbYFPg=;
        b=BsvGn1G707Zb497lTjhOllPQ90mEXfllmsHInqOa+0oJi+cPozOYCg/Ea6xYr2/Rd1
         inQ7n4pbzMAy1VbobhK+DH/0LliEH8N0MKfF3J7DT++CmRzXhJCTsHyvqT0g+OO8A9BX
         ONLcSK3E0OrWshPs8S7BhjDzmG07Ek5dzTdqrjCqvvVuNQV7xXj4KB24JxDl7i+xEVPF
         SvA8U+vkTnDmHqSfQbV5N9gLLHGoBlVKjtR4TutOK6wzsxvhziBLlvOLb2tRZTFV1O4D
         E8pSvd5Y70q5J+teYfZghp8l4RIOtt+FVGaO0dJUEBE9Nq+QCfRqgk90/vQhdXypTyNz
         OT7A==
X-Gm-Message-State: APjAAAVHkIFqh4FBiZUTPlQaMsbCcpPFt/jDSixvr9PWeScu7R8BdXti
        3C82/qpTZxTea7EBamgVg78=
X-Google-Smtp-Source: APXvYqyCX/X9MAdAjV1QNuzhQdaMmQG2jzUp4IrQWQBT3lz+nhAFJzFwBnVrQpKuPSnG1g8hbpF5Ng==
X-Received: by 2002:a1c:3cc3:: with SMTP id j186mr3970202wma.119.1568995948804;
        Fri, 20 Sep 2019 09:12:28 -0700 (PDT)
Received: from pretoriano-kubuntu.fritz.box ([79.114.202.215])
        by smtp.googlemail.com with ESMTPSA id j1sm3693004wrg.24.2019.09.20.09.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 09:12:28 -0700 (PDT)
From:   Flavius Georgescu <pretoriano.mp@gmail.com>
To:     sean@mess.org
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Flavius Georgescu <pretoriano.mp@gmail.com>,
        Chris Vandomelen <chris@sightworks.com>
Subject: [PATCH v2] media: rc: Add support for another iMON 0xffdc device
Date:   Fri, 20 Sep 2019 19:11:39 +0300
Message-Id: <20190920161139.9493-1-pretoriano.mp@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919151358.7030-1-pretoriano.mp@gmail.com>
References: <20190919151358.7030-1-pretoriano.mp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The device it's an iMON UltraBay (0x98 in config byte) with LCD,
IR and dual-knobs front panel.

To work properly the device also require its own key table,
and repeat suppression for all buttons.

Signed-off-by: Flavius Georgescu <pretoriano.mp@gmail.com>
Co-developed-by: Chris Vandomelen <chris@sightworks.com>
Signed-off-by: Chris Vandomelen <chris@sightworks.com>
---
Changes in v2:
- refined the key repeat suppression code
(Suggested-by: Sean Young <sean@mess.org>)

 drivers/media/rc/imon.c | 45 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 37a850421fbb..fddbf33a8ea6 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -83,6 +83,7 @@ struct imon_usb_dev_descr {
 	__u16 flags;
 #define IMON_NO_FLAGS 0
 #define IMON_NEED_20MS_PKT_DELAY 1
+#define IMON_SUPPRESS_REPEATED_KEYS 2
 	struct imon_panel_key_table key_table[];
 };

@@ -315,6 +316,32 @@ static const struct imon_usb_dev_descr imon_DH102 = {
 	}
 };

+/* imon ultrabay front panel key table */
+static const struct imon_usb_dev_descr ultrabay_table = {
+	.flags = IMON_SUPPRESS_REPEATED_KEYS,
+	.key_table = {
+		{ 0x0000000f0000ffeell, KEY_MEDIA },      /* Go */
+		{ 0x000000000100ffeell, KEY_UP },
+		{ 0x000000000001ffeell, KEY_DOWN },
+		{ 0x000000160000ffeell, KEY_ENTER },
+		{ 0x0000001f0000ffeell, KEY_AUDIO },      /* Music */
+		{ 0x000000200000ffeell, KEY_VIDEO },      /* Movie */
+		{ 0x000000210000ffeell, KEY_CAMERA },     /* Photo */
+		{ 0x000000270000ffeell, KEY_DVD },        /* DVD */
+		{ 0x000000230000ffeell, KEY_TV },         /* TV */
+		{ 0x000000050000ffeell, KEY_PREVIOUS },   /* Previous */
+		{ 0x000000070000ffeell, KEY_REWIND },
+		{ 0x000000040000ffeell, KEY_STOP },
+		{ 0x000000020000ffeell, KEY_PLAYPAUSE },
+		{ 0x000000080000ffeell, KEY_FASTFORWARD },
+		{ 0x000000060000ffeell, KEY_NEXT },       /* Next */
+		{ 0x000100000000ffeell, KEY_VOLUMEUP },
+		{ 0x010000000000ffeell, KEY_VOLUMEDOWN },
+		{ 0x000000010000ffeell, KEY_MUTE },
+		{ 0, KEY_RESERVED },
+	}
+};
+
 /*
  * USB Device ID for iMON USB Control Boards
  *
@@ -1653,14 +1680,16 @@ static void imon_incoming_packet(struct imon_context *ictx,
 	spin_lock_irqsave(&ictx->kc_lock, flags);

 	t = ktime_get();
-	/* KEY_MUTE repeats from knob need to be suppressed */
-	if (ictx->kc == KEY_MUTE && ictx->kc == ictx->last_keycode) {
-		msec = ktime_ms_delta(t, prev_time);
-		if (msec < ictx->idev->rep[REP_DELAY]) {
+	/* KEY repeats from knob and panel that need to be suppressed */
+	if (ictx->kc == KEY_MUTE ||
+	    ictx->dev_descr->flags & IMON_SUPPRESS_REPEATED_KEYS) {
+		if (ictx->kc == ictx->last_keycode &&
+		    ktime_ms_delta(t, prev_time) < ictx->idev->rep[REP_DELAY]) {
 			spin_unlock_irqrestore(&ictx->kc_lock, flags);
 			return;
 		}
 	}
+
 	prev_time = t;
 	kc = ictx->kc;

@@ -1848,6 +1877,14 @@ static void imon_get_ffdc_type(struct imon_context *ictx)
 		dev_info(ictx->dev, "0xffdc iMON Inside, iMON IR");
 		ictx->display_supported = false;
 		break;
+	/* Soundgraph iMON UltraBay */
+	case 0x98:
+		dev_info(ictx->dev, "0xffdc iMON UltraBay, LCD + IR");
+		detected_display_type = IMON_DISPLAY_TYPE_LCD;
+		allowed_protos = RC_PROTO_BIT_IMON | RC_PROTO_BIT_RC6_MCE;
+		ictx->dev_descr = (struct imon_usb_dev_descr *)&ultrabay_table;
+		break;
+
 	default:
 		dev_info(ictx->dev, "Unknown 0xffdc device, defaulting to VFD and iMON IR");
 		detected_display_type = IMON_DISPLAY_TYPE_VFD;
--
2.20.1
