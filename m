Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 328BBB75FB
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 11:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388580AbfISJPk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 05:15:40 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40624 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388577AbfISJPj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 05:15:39 -0400
Received: by mail-wr1-f66.google.com with SMTP id l3so2251410wru.7
        for <linux-media@vger.kernel.org>; Thu, 19 Sep 2019 02:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0H8zO4+pIYaYj7wgFdCArsZXFnoOsg4BYPN528cfB1Y=;
        b=D/2qiFSjrtqSb/nyRXtyGXTACLS3yVKnpUyajPtVcbyoOEbt6RhvAGDzrRF6VUMAii
         xTRSmRDhEYsa7Poge8UTaLo4s8WbAS9gE0skhucxw2T6lu+tgeKl/+o3w9z0wtk9mnqP
         9dJbZyo66VkKrvifp4AWo7zyYEEWUSM1Jy1eax48RQ8BmUkD7/c7bbpwIKlqQ0YH//wW
         +TtHezgxfwrIHsafv4+4v+fUj75rB60XVisUTSzouQvyGWD3A4Pgmr7+//mOOsbhWP8V
         TnAKRy7sBLOvFvzdbNBsqOXAUSIKKk7R5LZ/NEKZJHUW/B5T6Oy2AgEEb/RHic9JQmSg
         I8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0H8zO4+pIYaYj7wgFdCArsZXFnoOsg4BYPN528cfB1Y=;
        b=PRDLe3V7I/K5RzyO87zGuYVKF6MLEhGsIxdDcThoa0+GT0vgz4/siw05O877RNNtHB
         BGvgFMff5H72OFlRLvhTLnTsyapnCKwprOFZsz9aFyCLCrdDy1/YY2Le70RVV0GxEddU
         RnU4XhpCJFWn/Cnl2uoBQYEf9bNZUQ3zf9M9YAhh5lp6mpqd9oGJVBC3rJNVHEwxWpID
         yezR0D7kDPO2PJprvg3EsT8zTJ+3TNoRgjxhpAXdOnZQCs1CubBxrR23iMUNZ4qj1MJ0
         e0AYsKy+75SLU/Qx0lg4Wx59XyshWGoV3fU51liPShAtSPy0mEOb3XyIMan21wMb+M5m
         dAgA==
X-Gm-Message-State: APjAAAUvDefoHRB/DQXKsensMK9xXagfv40EjbVeZYKUJ0g4XgYyjI0Z
        1BpsPlCg1k8sN628xwuEhdo=
X-Google-Smtp-Source: APXvYqy2IbPKx81QgESvKX4dptPr4oIHxflUVDXUIqtvAcF/GYOYWdfmpCZnKhimOdyK/61Tw4BxXg==
X-Received: by 2002:adf:f7c3:: with SMTP id a3mr6401057wrq.141.1568884537537;
        Thu, 19 Sep 2019 02:15:37 -0700 (PDT)
Received: from pretoriano-kubuntu.fritz.box ([79.114.202.215])
        by smtp.googlemail.com with ESMTPSA id o188sm10868339wma.14.2019.09.19.02.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 02:15:36 -0700 (PDT)
From:   Flavius Georgescu <pretoriano.mp@gmail.com>
To:     sean@mess.org
Cc:     linux-media@vger.kernel.org,
        Chris Vandomelen <chris@sightworks.com>,
        kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v3] media: rc: Add support for another 0xffdc device
Date:   Thu, 19 Sep 2019 12:14:45 +0300
Message-Id: <20190919091445.5038-1-pretoriano.mp@gmail.com>
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

Signed-off-by: Flavius Georgescu <pretoriano.mp@gmail.com>
Co-developed-by: Chris Vandomelen <chris@sightworks.com>
Signed-off-by: Chris Vandomelen <chris@sightworks.com>
---

Changes from v1:
- fixed the fall through warning
Reported-by: kbuild test robot <lkp@intel.com>

Changes from v2:
- changed commit message
- code style fixes
- signed off with real name now
- added co-developer

---
 drivers/media/rc/imon.c | 46 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 37a850421fbb..17141d57e311 100644
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

@@ -1848,6 +1886,14 @@ static void imon_get_ffdc_type(struct imon_context *ictx)
 		dev_info(ictx->dev, "0xffdc iMON Inside, iMON IR");
 		ictx->display_supported = false;
 		break;
+	/* Soundgraph iMON UltraBay */
+	case 0x98:
+		dev_info(ictx->dev, "0xffdc iMON UltraBay, LCD + IR");
+		detected_display_type = IMON_DISPLAY_TYPE_LCD;
+		allowed_protos = RC_PROTO_BIT_IMON | RC_PROTO_BIT_RC6_MCE;
+		ictx->dev_descr = (struct imon_usb_dev_descr *) &ultrabay_table;
+		break;
+
 	default:
 		dev_info(ictx->dev, "Unknown 0xffdc device, defaulting to VFD and iMON IR");
 		detected_display_type = IMON_DISPLAY_TYPE_VFD;
--
2.20.1
