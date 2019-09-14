Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EFD2B2A8E
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2019 10:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727481AbfINIy2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Sep 2019 04:54:28 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36760 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbfINIy1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Sep 2019 04:54:27 -0400
Received: by mail-wr1-f67.google.com with SMTP id y19so34203532wrd.3
        for <linux-media@vger.kernel.org>; Sat, 14 Sep 2019 01:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QIyck85uSERpvRHQqI5bMUvlATthpgtevcauuigbneg=;
        b=V1d909PkgIOM06gS3Pvi622M7lcqfZFSm0O4gZewmO/zmUFuI6+ZfsaAFhzPeIh6UF
         EEn4kPC6HxDWLfqHegdIaJ1cA5JHmU29PXTKUDKMBPV2JTScwpaULh+hgjo/HtzneKEn
         joObr/AAv16ztumUSb0SQMSigugGbchccqbZOaxSGe2Gly31UaJh7INN3dZFaQKu8uD+
         PTWL7juAdvyJxxajVqpOCR4gBHwVw+p37rWeevlOfwib6zUgF/Kk4zrRor3hFzwebzAZ
         Ydy9hP5yDMrJTFWqVEEx29pFjvr7dp1mLnPnCQgwXJLDEsPR48JLnsfYWYh75pir6O3X
         jcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QIyck85uSERpvRHQqI5bMUvlATthpgtevcauuigbneg=;
        b=COUcNdGWI91+pL3ff2SLo/1Gz8rls75yipn5ArKr1OPN6CDDIxFJHu8p8yfwlbEn7K
         PtL4d4PkG60A0Vl7wcP12A9pHEz69TuRCcDeFljvxGNvI/0vdq5DH7LhkmKVAr1UufxM
         ZGudxqKbVMxldDOr7Kbe5NoYwQcD4J2wi4yQQhUOrEWrZmaMmHU9K5T+RSUfZTDNfz6L
         pOSCYCQuhsbn3+oygLqN9SZs44Umg9FGNAh/OTtKolGC2e449fQKRwE6DAOoxSYlEDfM
         LPhU8HHKSwhdH6qTAPUtMHNU6BmWHnIOynBhvG5q2tfDIidg/9FlNB5yiCHM15kWOwI7
         Xw7w==
X-Gm-Message-State: APjAAAVflWXzwoiDmFzdfYy+lp0P/FOacAPjh57haNpxFdpEeGFRvPEX
        qFN8mpmNb6xvMxATV1HMkik=
X-Google-Smtp-Source: APXvYqw0K2aV2m8qBA5RrCzfYCqyzDaXWBnI0ydSG7kQNN/pE6IaJshdP3WYaLCEIdTzn7c9zu6ZIA==
X-Received: by 2002:adf:f20f:: with SMTP id p15mr37327483wro.17.1568451265239;
        Sat, 14 Sep 2019 01:54:25 -0700 (PDT)
Received: from pretoriano-kubuntu.fritz.box ([79.114.202.215])
        by smtp.googlemail.com with ESMTPSA id s26sm56080603wrs.63.2019.09.14.01.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2019 01:54:24 -0700 (PDT)
From:   pretoriano80 <pretoriano.mp@gmail.com>
X-Google-Original-From: pretoriano80 <viusflag@libero.it>
To:     sean@mess.org
Cc:     linux-media@vger.kernel.org
Subject: [PATCH] media: rc:     Add support for another 0xffdc device
Date:   Sat, 14 Sep 2019 11:54:07 +0300
Message-Id: <20190914085407.6476-1-viusflag@libero.it>
X-Mailer: git-send-email 2.20.1
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

Signed-off-by: pretoriano80 <viusflag@libero.it>
---
 drivers/media/rc/imon.c | 44 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 7bee72108b0e..3b29e0815610 100644
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
+static const struct imon_usb_dev_descr imon_ultrabay_table = {
+	.flags = IMON_SUPPRESS_REPEATED_KEYS,
+	.key_table = {
+		{ 0x0000000f0000ffeell, KEY_MEDIA },      /* Go */
+		{ 0x000000000100ffeell, KEY_UP },
+		{ 0x000000000001ffeell, KEY_DOWN },
+		{ 0x000000160000ffeell, KEY_ENTER },
+		{ 0x0000001f0000ffeell, KEY_AUDIO },	/* Music */
+		{ 0x000000200000ffeell, KEY_VIDEO },	/* Movie */
+		{ 0x000000210000ffeell, KEY_CAMERA },	/* Photo */
+		{ 0x000000270000ffeell, KEY_DVD },
+		{ 0x000000230000ffeell, KEY_TV },
+		{ 0x000000050000ffeell, KEY_PREVIOUS },
+		{ 0x000000070000ffeell, KEY_REWIND },
+		{ 0x000000040000ffeell, KEY_STOP },
+		{ 0x000000020000ffeell, KEY_PLAYPAUSE },
+		{ 0x000000080000ffeell, KEY_FASTFORWARD },
+		{ 0x000000060000ffeell, KEY_NEXT },
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
@@ -1661,6 +1688,17 @@ static void imon_incoming_packet(struct imon_context *ictx,
 			return;
 		}
 	}
+	/* KEY repeats from knob need to be suppressed */
+	if (ictx->dev_descr->flags & IMON_SUPPRESS_REPEATED_KEYS) {
+		if (ictx->kc == ictx->last_keycode) {
+			msec = ktime_ms_delta(t, prev_time);
+			if (msec < ictx->idev->rep[REP_DELAY]) {
+				spin_unlock_irqrestore(&ictx->kc_lock, flags);
+				return;
+			}
+		}
+	}
+
 	prev_time = t;
 	kc = ictx->kc;
 
@@ -1843,6 +1881,12 @@ static void imon_get_ffdc_type(struct imon_context *ictx)
 		dev_info(ictx->dev, "0xffdc iMON Inside, iMON IR");
 		ictx->display_supported = false;
 		break;
+	/* Soundgraph iMON UltraBay */
+	case 0x98:
+		dev_info(ictx->dev, "0xffdc iMON UltraBay, LCD + IR");
+		detected_display_type = IMON_DISPLAY_TYPE_LCD;
+		allowed_protos = RC_PROTO_BIT_IMON | RC_PROTO_BIT_RC6_MCE;
+		ictx->dev_descr = (struct imon_usb_dev_descr *) &imon_ultrabay_table;
 	default:
 		dev_info(ictx->dev, "Unknown 0xffdc device, defaulting to VFD and iMON IR");
 		detected_display_type = IMON_DISPLAY_TYPE_VFD;
-- 
2.20.1

