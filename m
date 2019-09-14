Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6652DB2D40
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2019 00:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbfINWl1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Sep 2019 18:41:27 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52272 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727584AbfINWl1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Sep 2019 18:41:27 -0400
Received: by mail-wm1-f65.google.com with SMTP id x2so6171401wmj.2
        for <linux-media@vger.kernel.org>; Sat, 14 Sep 2019 15:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ckJ8oapDKu22c7twXcycX5I6MwSEmx3DR3NqQ4vaCuI=;
        b=X/nOf73oZlPXqw05xbRcAsVd0bdh+YTAgtZ4qUZ2NVktuV3PiswLSdnv0OGH0NFJv3
         FNncGYbLuQXGoOyzO5GMhs8bTVN8DHWRlXbUerT5vGi1utGhoyh4XBpJW22HX5F6tB+m
         DAydGMW+1CUNh8uYwLVF/9vYfbXhEZme/wTDUNRY15J7jTEF0lFD3iCh4k+E8vMPGYp9
         DqB2eK8jOOEzL2V0hMiSGbohs7TvxYg0h7wVyJwC7e9a+tixfDc3/whz+U1IUJzOU8gg
         ekYskUnVBiy3SpmmpPzNIzPkPa+ABu8rMGYbJFCyLhZD1q/ySPq0AEMgrWEk3d92xecX
         Hp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ckJ8oapDKu22c7twXcycX5I6MwSEmx3DR3NqQ4vaCuI=;
        b=FFma3M0dvMbslA4V6NZ5KCtZCfhMsGPXuyU/4o0tXn3w2c08dy2XoG3o81vW2W7BVk
         UU5OgxXYoH7X5dQkwYByUHWyHv4hZgM1+rfPLdI6ZCiKIXQD/s4GfZhJ1lHPaSOQIfID
         rNdtmC3zCNKx1YXM7W6CeRCEtO+ut7MTrpYgwgqoza1u/kcVuFkMA6affWLCCkr9DaIp
         a5i5yGIpJL3t8X4Rws0g9Jy+FAMJEptCCO082PreN0o18VRTruyWO0hdueADTZa41OHd
         ObBGu/aPIwGS/dgcKneUt2fzkoz0U8E038E5EAN46SF9pj/ZjAWDiCat5ra2d3z1d2gt
         hn4w==
X-Gm-Message-State: APjAAAX3YP+L4mm1DOq4ptomDAGRol4Qns4nqwOqxL3xtjQU9bR2vMfW
        5xcaWKICnPkUJAmGg4tj6ds=
X-Google-Smtp-Source: APXvYqwyx7x3axs7CDpi81S7ivZZ23FWpLqdafFtGS6/1XStCIHConBziEQ5dGPNvVF9uGHHg0aWmg==
X-Received: by 2002:a7b:caa9:: with SMTP id r9mr3851300wml.14.1568500885153;
        Sat, 14 Sep 2019 15:41:25 -0700 (PDT)
Received: from pretoriano-kubuntu.fritz.box ([79.114.202.215])
        by smtp.googlemail.com with ESMTPSA id y3sm12108408wmg.2.2019.09.14.15.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2019 15:41:24 -0700 (PDT)
From:   pretoriano80 <pretoriano.mp@gmail.com>
X-Google-Original-From: pretoriano80 <viusflag@libero.it>
To:     sean@mess.org
Cc:     linux-media@vger.kernel.org, kbuild-all@01.org,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH v2] media: rc: Add support for another 0xffdc device
Date:   Sun, 15 Sep 2019 01:40:59 +0300
Message-Id: <20190914224059.2789-1-viusflag@libero.it>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <201909150130.GbMZeQx2%lkp@intel.com>
References: <201909150130.GbMZeQx2%lkp@intel.com>
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

Reported-by: kbuild test robot <lkp@intel.com>

Signed-off-by: pretoriano80 <viusflag@libero.it>
---
 drivers/media/rc/imon.c | 45 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 7bee72108b0e..798ac95791cb 100644
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
 
@@ -1843,6 +1881,13 @@ static void imon_get_ffdc_type(struct imon_context *ictx)
 		dev_info(ictx->dev, "0xffdc iMON Inside, iMON IR");
 		ictx->display_supported = false;
 		break;
+	/* Soundgraph iMON UltraBay */
+	case 0x98:
+		dev_info(ictx->dev, "0xffdc iMON UltraBay, LCD + IR");
+		detected_display_type = IMON_DISPLAY_TYPE_LCD;
+		allowed_protos = RC_PROTO_BIT_IMON | RC_PROTO_BIT_RC6_MCE;
+		ictx->dev_descr = (struct imon_usb_dev_descr *) &imon_ultrabay_table;
+		break;
 	default:
 		dev_info(ictx->dev, "Unknown 0xffdc device, defaulting to VFD and iMON IR");
 		detected_display_type = IMON_DISPLAY_TYPE_VFD;
-- 
2.20.1

