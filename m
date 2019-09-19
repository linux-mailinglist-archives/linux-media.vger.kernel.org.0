Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4035B7DEB
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 17:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390295AbfISPQ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 11:16:28 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50410 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388706AbfISPQ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 11:16:27 -0400
Received: by mail-wm1-f66.google.com with SMTP id 5so5068420wmg.0
        for <linux-media@vger.kernel.org>; Thu, 19 Sep 2019 08:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EYffEbdThy0LWps82pOkqzBQMyP44H3OtQQzT0sqDxE=;
        b=djU8Jdg7nr6kNCq4HfUMGTBmdElMzxjg8cALZ76pnQlj0JPe91egZzsXZ51qSxDagi
         kq2PhYVfOTp+JOkfXwoFiV9tdlq/ShndLAOZ96ZaTS2oboX1dHB7Gm3wLuI1ymU45+A7
         EIKvd31YvbvEM+fFx798k4SELpw7Y/UtJbJDb7sF6h4CdMJsnAEncyb8bvpLmhX2/xo4
         KGpcX5pxcoaaZpMB8bcqkxhNat04InSVFxUS9jfKpJ3yjlt2V2xxMZiU380rK7lgYqrB
         HKmwRfYKeCsLWqvVptf86C3vGUWsWERAlnYVYkYNwPaWW5jcnpSaKQUaAKJ/yKa4ezA4
         aZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EYffEbdThy0LWps82pOkqzBQMyP44H3OtQQzT0sqDxE=;
        b=Z1d6nChF0cUwlim2FlBzgOkTOCTzTsFaf2UA6q7ohFIfnLStEfRSTsEgIVzWDIh3tw
         RqfElMkBvGCi/Am9mkrpebjN4no9tdKv81ME83EWdNz4z2cz5Tz0M5zmVvvm6IpzZk/g
         Ni6xY0c2e/IX925zhcp3APu3F9B8FzZxW4Tuo9F+ObDVq5JFXEWk1V4lru4o96FfBIa2
         AhXaXsyPtnmYcGTC/HfzmclW765DvfGDpEQmW1YThY/V0pzhjoDXQx0KtEWZ1EbUnu32
         3UK8+FtlsYlyAOItlVDf28NFvOjyOeyWthRER51jbbDry5BJFgv3qxqTEBnmP+EMfESO
         mcpQ==
X-Gm-Message-State: APjAAAV8cGIELFpxJ0KVBoywAzqVTWb05EICO65owVYYkb1cRecagvZl
        r726CDVTP0P7DT9FawMehF4=
X-Google-Smtp-Source: APXvYqzNR2lzBDaOjJNN0RSc3ZWGOOBZ1TZcJnL+s771iK5ZPLOhw3egskBzCUq+Kly9OengEMKhlg==
X-Received: by 2002:a7b:c182:: with SMTP id y2mr3344411wmi.156.1568906185786;
        Thu, 19 Sep 2019 08:16:25 -0700 (PDT)
Received: from pretoriano-kubuntu.fritz.box ([79.114.202.215])
        by smtp.googlemail.com with ESMTPSA id b194sm10160991wmg.46.2019.09.19.08.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 08:16:25 -0700 (PDT)
From:   Flavius Georgescu <pretoriano.mp@gmail.com>
To:     sean@mess.org
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Flavius Georgescu <pretoriano.mp@gmail.com>,
        Chris Vandomelen <chris@sightworks.com>
Subject: [PATCH] media: rc: Add support for another iMON 0xffdc device
Date:   Thu, 19 Sep 2019 18:13:58 +0300
Message-Id: <20190919151358.7030-1-pretoriano.mp@gmail.com>
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
