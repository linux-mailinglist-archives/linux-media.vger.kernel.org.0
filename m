Return-Path: <linux-media+bounces-55554-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BQXIv9Cs2l6TgAAu9opvQ
	(envelope-from <linux-media+bounces-55554-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 23:49:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 178B827B1CD
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 23:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BBCD31A7BF8
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A3D38734D;
	Thu, 12 Mar 2026 22:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="WseCmO5b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA1D175A7C
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 22:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773355762; cv=none; b=sjmUaOQkrqXxdXgrg5fHZGo8YE5KBXt2Thk0xK+kvIhtMf5UOnMXMWWQAoMdCOvN4AGNpx5RmPQKsaAS11gOcYQMIFy+I+WUpfZzFCJu+Aau4quLggKgXg9ZJQR6bNr7XJ2XEWpFcbfEsEkO6a2LWSP6tcX5C4ZvQ2ylDLPTnwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773355762; c=relaxed/simple;
	bh=4+eSebkNdqK1RjhXpGFHHFy6txi8bCplmS96LFdwHoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qPxE2O5lBNN5+Ui+J4jw6aMWfXUoA1z1K6cWc4h3kaIM0SFu4Hk0de/+PNCuMIrr0BAGBkylnqGBlpexJ52H8F+nQH3iGZJQi2DpyOgRrwSUJVLLF75EmZNo7x2dN3khqcT6kj/suoIQXWWJNP2DTKX0GzzRkKuzPTep9jzlSBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=WseCmO5b; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4094b31a037so1159212fac.1
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773355759; x=1773960559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/bbXnUmRCFMzUtYVprF6XQ64xGQ6cV6IMZMSrVRfQg=;
        b=WseCmO5be0Vt3aCsOgJ4fO25MJWlXEZLgXHJkdGxQ09iEQ7MYikULpYFxn4YyDaJ2f
         TtedsHZxFnVIhtj4PV3Oh9pSBcx8GkZ797W3JGXrnEZXvEgTuKwbo1Djbj86Q4jGFLRw
         6woEStnktne2m04ClIvbearw4vQAce86svbpw0meJVZuBlSu2a6KEXv6FhQxxkpnr42u
         cbXI9Maq4SRIFqwCvrXIQbA+5vdnFRhEMNA7jKja36nglk4rGd5gHkglP8FSx+Qs/Hwy
         K8Zbj4qOrAj0IWeMeBcvXzHLuMPEL2VK/+USV7wORiGLtngstbfqM0kvBUc6eSZ71XGy
         pWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773355759; x=1773960559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J/bbXnUmRCFMzUtYVprF6XQ64xGQ6cV6IMZMSrVRfQg=;
        b=s569bli8dGR59SD7Ag7/X5U8KsmlCNa4Fyr97okpKmXsRqEpEd7q8B8wRZ2XptGZw+
         GXFiRwS5aMiEFEj3doMJNB/wkpn3ehgJ6DEr7+pg9PFPdNR5VHe2g5hlSNYnrpgd/8M3
         7i6/3BB03znOxlASvhPrbYR2bA99n9ylMdrz0rZKlltxnxqsgFcGtm8oyf3JO782waFS
         6/uWJzY7X3vEWxvydgPSPTimOj3khJITlZfhUrDTLRl64BIrBKXjbTMCbYNlpcYYZgTw
         RkUNe8DbgmFV6XVZs/0K3cWStuANFPuKTUmvIyo0MkaG/3L94qEDJ9qpcDCgNcTE1p2l
         ge3w==
X-Gm-Message-State: AOJu0Yym41y89VswtVSlchb7XRMNqt/NKJFb8Oeh9PArvlAUO4N/NUAt
	vqrrh7Pq6mDm6pDFXUeBluHhcc46UH1lJhdFHfqmm/0CcslM7KaW57pom9oOqFU1p3k6A4AQ3hc
	oIfUFfpw=
X-Gm-Gg: ATEYQzzgKkq6E4mEYUPhhQT9a5mYYS8vSk41v0guVkIcyWyzVBL/WOhO0g9fh1fEZcy
	i/UNDAUUq6iB/JfUZPei4mi17r/4N7lvn7xw27pSP7AUm/Tv0M1GAuhDdZEW21qz1LQ6fX5WIs6
	r/QNy/FXmhqEDGtPWyB5QHz8y/MlpoRpKa0485a3Bl0FzhoQs7upIjvAebJi+vsSwqW6ErGLANp
	h2DWY5jCeW7vofxFfDfmfk7K2gBLqStlrl09cG2xbomdPQz9nCdsib0NSEvIgZybpLpmU9/eGsP
	84mjb/uSRhkkgp2VUuCHwRQgtZV+JRFHBmmi41x8wTyTIo0WmMIMIyxnl/fxz815XKf2FuthA+C
	PnS98bK7pVX06KHb3OlD/g4S1Dqy089XShjj8zbpqby91UjDkqby5S5AE8Elj5gb0KF59NnUdzo
	gAoT4iWSNlBSd7DAQeK4rnE4l0gK1p3/NKux4NCJVp0hIahmHZhlJOodbRWSyGBTMTQ9OME5GE7
	jIzypTOrM+mBatulheXXe2z/rqufw==
X-Received: by 2002:a05:6871:e708:b0:417:211:33ca with SMTP id 586e51a60fabf-417b946b07dmr825533fac.36.1773355759043;
        Thu, 12 Mar 2026 15:49:19 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e26e2c6sm6690125fac.7.2026.03.12.15.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 15:49:18 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 1/2] em28xx: Add support for Empia em2828X bridge
Date: Thu, 12 Mar 2026 17:49:14 -0500
Message-Id: <20260312224915.2907539-2-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260312224915.2907539-1-brad@nextdimension.cc>
References: <20260312224915.2907539-1-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55554-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 178B827B1CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The empia em2828X usb bridge contains previous functionality,
but also contains an embedded video decoder. The implemented
capabilities include composite and s-video inputs, as well as
analog TV. Analog TV is expected in CVBS format, it must be
demodulated already.

Media controller decoder entity is included so pipeline
verification passes and graph is property constructed.

Analog TV bits based off cx231xx driver.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
 drivers/media/usb/em28xx/em28xx-cards.c |  27 ++-
 drivers/media/usb/em28xx/em28xx-core.c  | 146 ++++++++++++++--
 drivers/media/usb/em28xx/em28xx-dvb.c   |  15 ++
 drivers/media/usb/em28xx/em28xx-i2c.c   |   2 +
 drivers/media/usb/em28xx/em28xx-reg.h   |   3 +
 drivers/media/usb/em28xx/em28xx-video.c | 217 ++++++++++++++++++++++--
 drivers/media/usb/em28xx/em28xx.h       |  19 +++
 7 files changed, 405 insertions(+), 24 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index d7075ebabceb..67266bddb713 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3633,6 +3633,11 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
 			}
 			/* NOTE: the em2820 is used in webcams, too ! */
 			break;
+		case CHIP_ID_EM2828X:
+			chip_name = "em2828X";
+			dev->wait_after_write = 0;
+			dev->eeprom_addrwidth_16bit = 1;
+			break;
 		case CHIP_ID_EM2840:
 			chip_name = "em2840";
 			break;
@@ -3791,6 +3796,7 @@ static void em28xx_check_usb_descriptor(struct em28xx *dev,
 	 *  0x84	bulk		=> analog or digital**
 	 *  0x85	isoc		=> digital TS2
 	 *  0x85	bulk		=> digital TS2
+	 *  0x8a	isoc		=> digital video
 	 * (*: audio should always be isoc)
 	 * (**: analog, if ep 0x82 is isoc, otherwise digital)
 	 *
@@ -3814,6 +3820,8 @@ static void em28xx_check_usb_descriptor(struct em28xx *dev,
 	/* Only inspect input endpoints */
 
 	switch (e->bEndpointAddress) {
+	case 0x81:	/* unknown function */
+		return;
 	case 0x82:
 		*has_video = true;
 		if (usb_endpoint_xfer_isoc(e)) {
@@ -3831,7 +3839,10 @@ static void em28xx_check_usb_descriptor(struct em28xx *dev,
 				"error: skipping audio endpoint 0x83, because it uses bulk transfers !\n");
 		return;
 	case 0x84:
-		if (*has_video && (usb_endpoint_xfer_bulk(e))) {
+		if (*has_dvb && (usb_endpoint_xfer_bulk(e))) {
+			*has_dvb = true;
+			dev->dvb_ep_bulk = e->bEndpointAddress;
+		} else if (*has_video && (usb_endpoint_xfer_bulk(e))) {
 			dev->analog_ep_bulk = e->bEndpointAddress;
 		} else {
 			if (usb_endpoint_xfer_isoc(e)) {
@@ -3865,7 +3876,17 @@ static void em28xx_check_usb_descriptor(struct em28xx *dev,
 			dev->dvb_ep_bulk_ts2 = e->bEndpointAddress;
 		}
 		return;
-	}
+	case 0x8a:
+		*has_video = true;
+		*has_dvb = true;
+		if (usb_endpoint_xfer_isoc(e)) {
+			dev->analog_ep_isoc = e->bEndpointAddress;
+			dev->alt_max_pkt_size_isoc[alt] = size;
+		} else if (usb_endpoint_xfer_bulk(e)) {
+			dev->analog_ep_bulk = e->bEndpointAddress;
+		}
+		return;
+	};
 }
 
 /*
@@ -4047,6 +4068,8 @@ static int em28xx_usb_probe(struct usb_interface *intf,
 			try_bulk = 1;
 		else
 			try_bulk = 0;
+	} else if (dev->board.decoder == EM28XX_BUILTIN && dev->analog_xfer_mode) {
+		try_bulk = 1;
 	} else {
 		try_bulk = usb_xfer_mode > 0;
 	}
diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
index 29a7f3f19b56..303f6f10fda5 100644
--- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -499,7 +499,8 @@ int em28xx_audio_setup(struct em28xx *dev)
 	if (dev->chip_id == CHIP_ID_EM2870 ||
 	    dev->chip_id == CHIP_ID_EM2874 ||
 	    dev->chip_id == CHIP_ID_EM28174 ||
-	    dev->chip_id == CHIP_ID_EM28178) {
+	    dev->chip_id == CHIP_ID_EM28178 ||
+	    dev->chip_id == CHIP_ID_EM2828X) {
 		/* Digital only device - don't load any alsa module */
 		dev->int_audio_type = EM28XX_INT_AUDIO_NONE;
 		dev->usb_audio_type = EM28XX_USB_AUDIO_NONE;
@@ -619,6 +620,65 @@ const struct em28xx_led *em28xx_find_led(struct em28xx *dev,
 }
 EXPORT_SYMBOL_GPL(em28xx_find_led);
 
+void em2828X_decoder_vmux(struct em28xx *dev, unsigned int vin)
+{
+	switch (vin) {
+	case EM2828X_TELEVISION:
+		dev_dbg(&dev->intf->dev, "EM2828X_TELEVISION\n");
+		break;
+	case EM2828X_COMPOSITE:
+		dev_dbg(&dev->intf->dev, "EM2828X_COMPOSITE\n");
+		break;
+	default:
+		dev_dbg(&dev->intf->dev, "EM2828X_SVIDEO\n");
+		break;
+	};
+
+	em28xx_write_reg(dev, 0x24, 0x00);
+	em28xx_write_reg(dev, 0x25, 0x02);
+	em28xx_write_reg(dev, 0x2E, 0x00);
+
+	if (vin == EM2828X_TELEVISION) {
+		em28xx_write_reg(dev, 0x7A0B, 0xfc);
+		em28xx_write_reg(dev, 0xB6, 0x8F);
+		em28xx_write_reg(dev, 0xB8, 0x01);
+	} else {
+		em28xx_write_reg(dev, 0x7A0B, 0x00);
+		em28xx_write_reg(dev, 0xB6, 0x8F);
+		em28xx_write_reg(dev, 0xB8, 0x00);
+	}
+
+	em28xx_write_reg(dev, 0x7A1C, 0x1E);
+	em28xx_write_reg(dev, 0x7A1D, 0x99);
+	em28xx_write_reg(dev, 0x7A1E, 0x99);
+	em28xx_write_reg(dev, 0x7A1F, 0x9A);
+	em28xx_write_reg(dev, 0x7A20, 0x3d);
+	em28xx_write_reg(dev, 0x7A21, 0x3e);
+	em28xx_write_reg(dev, 0x7A29, 0x00);
+	em28xx_write_reg(dev, 0x7A2F, 0x52);
+	em28xx_write_reg(dev, 0x7A40, 0x05);
+	em28xx_write_reg(dev, 0x7A51, 0x00);
+	em28xx_write_reg(dev, 0x7AC1, 0x1B);
+
+	if (vin == EM2828X_COMPOSITE || vin == EM2828X_TELEVISION) {
+		em28xx_write_reg(dev, 0x38, 0x01);
+		em28xx_write_reg(dev, 0xB1, 0x70);
+		em28xx_write_reg(dev, 0xB3, 0x00);
+		em28xx_write_reg(dev, 0xB5, 0x00);
+		em28xx_write_reg(dev, 0x7A02, 0x4f);
+	} else {	/* EM2828X_SVIDEO */
+		em28xx_write_reg(dev, 0x38, 0x00);
+		em28xx_write_reg(dev, 0xB1, 0x60);
+		em28xx_write_reg(dev, 0xB3, 0x10);
+		em28xx_write_reg(dev, 0xB5, 0x10);
+		em28xx_write_reg(dev, 0x7A02, 0x4e);
+	}
+
+	em28xx_write_reg(dev, 0x7A3F, 0x01);
+	em28xx_write_reg(dev, 0x7A3F, 0x00);
+}
+EXPORT_SYMBOL_GPL(em2828X_decoder_vmux);
+
 int em28xx_capture_start(struct em28xx *dev, int start)
 {
 	int rc;
@@ -628,6 +688,7 @@ int em28xx_capture_start(struct em28xx *dev, int start)
 	    dev->chip_id == CHIP_ID_EM2884 ||
 	    dev->chip_id == CHIP_ID_EM28174 ||
 	    dev->chip_id == CHIP_ID_EM28178) {
+
 		/* The Transport Stream Enable Register moved in em2874 */
 		if (dev->dvb_xfer_bulk) {
 			/* Max Tx Size = 188 * 256 = 48128 - LCM(188,512) * 2 */
@@ -664,26 +725,87 @@ int em28xx_capture_start(struct em28xx *dev, int start)
 			if (dev->is_webcam)
 				rc = em28xx_write_reg(dev, 0x13, 0x0c);
 
-			/* Enable video capture */
-			rc = em28xx_write_reg(dev, 0x48, 0x00);
-			if (rc < 0)
-				return rc;
+			if (dev->mode == EM28XX_ANALOG_MODE) {
+				/* Enable video capture */
+				dev_dbg(&dev->intf->dev, "EM28XX_ANALOG_MODE 1\n");
+				rc = em28xx_write_reg(dev, 0x48, 0x00);
+				if (rc < 0)
+					return rc;
 
-			if (dev->mode == EM28XX_ANALOG_MODE)
 				rc = em28xx_write_reg(dev,
 						      EM28XX_R12_VINENABLE,
 						      0x67);
-			else
-				rc = em28xx_write_reg(dev,
-						      EM28XX_R12_VINENABLE,
-						      0x37);
+
+			} else if (dev->chip_id == CHIP_ID_EM2828X) {
+				dev_err(&dev->intf->dev, "%s() CHIP_ID_EM2828X\n", __func__);
+				/* The Transport Stream Enable Register moved in em2874 */
+				if (dev->dvb_xfer_bulk) {
+					/* Max Tx Size = 188 * 256 = 48128 - LCM(188,512) * 2 */
+					em28xx_write_reg(dev, (dev->ts == PRIMARY_TS) ?
+							 EM2874_R5D_TS1_PKT_SIZE :
+							 EM2874_R5E_TS2_PKT_SIZE,
+							 0xff);
+				} else {
+					/* ISOC Maximum Transfer Size = 188 * 5 */
+					em28xx_write_reg(dev, (dev->ts == PRIMARY_TS) ?
+							 EM2874_R5D_TS1_PKT_SIZE :
+							 EM2874_R5E_TS2_PKT_SIZE,
+							 dev->dvb_max_pkt_size_isoc / 188);
+				}
+
+				if (dev->ts == PRIMARY_TS)
+					rc = em28xx_write_reg_bits(dev,
+								   EM2874_R5F_TS_ENABLE,
+								   start ? EM2874_TS1_CAPTURE_ENABLE : 0x00,
+								   EM2874_TS1_CAPTURE_ENABLE | EM2874_TS1_FILTER_ENABLE | EM2874_TS1_NULL_DISCARD);
+				else
+					rc = em28xx_write_reg_bits(dev,
+								   EM2874_R5F_TS_ENABLE,
+								   start ? EM2874_TS2_CAPTURE_ENABLE : 0x00,
+								   EM2874_TS2_CAPTURE_ENABLE | EM2874_TS2_FILTER_ENABLE | EM2874_TS2_NULL_DISCARD);
+			} else {
+				/* Enable video capture */
+				rc = em28xx_write_reg(dev, 0x48, 0x00);
+				if (rc < 0)
+					return rc;
+				rc = em28xx_write_reg(dev, EM28XX_R12_VINENABLE, 0x37);
+			}
+
 			if (rc < 0)
 				return rc;
 
 			usleep_range(10000, 11000);
 		} else {
-			/* disable video capture */
-			rc = em28xx_write_reg(dev, EM28XX_R12_VINENABLE, 0x27);
+			if (dev->mode == EM28XX_DIGITAL_MODE && dev->chip_id == CHIP_ID_EM2828X) {
+				/* The Transport Stream Enable Register moved in em2874 */
+				if (dev->dvb_xfer_bulk) {
+					/* Max Tx Size = 188 * 256 = 48128 - LCM(188,512) * 2 */
+					em28xx_write_reg(dev, (dev->ts == PRIMARY_TS) ?
+							 EM2874_R5D_TS1_PKT_SIZE :
+							 EM2874_R5E_TS2_PKT_SIZE,
+							 0xff);
+				} else {
+					/* ISOC Maximum Transfer Size = 188 * 5 */
+					em28xx_write_reg(dev, (dev->ts == PRIMARY_TS) ?
+							 EM2874_R5D_TS1_PKT_SIZE :
+							 EM2874_R5E_TS2_PKT_SIZE,
+							 dev->dvb_max_pkt_size_isoc / 188);
+				}
+
+				if (dev->ts == PRIMARY_TS)
+					rc = em28xx_write_reg_bits(dev,
+								   EM2874_R5F_TS_ENABLE,
+								   start ? EM2874_TS1_CAPTURE_ENABLE : 0x00,
+								   EM2874_TS1_CAPTURE_ENABLE | EM2874_TS1_FILTER_ENABLE | EM2874_TS1_NULL_DISCARD);
+				else
+					rc = em28xx_write_reg_bits(dev,
+								   EM2874_R5F_TS_ENABLE,
+								   start ? EM2874_TS2_CAPTURE_ENABLE : 0x00,
+								   EM2874_TS2_CAPTURE_ENABLE | EM2874_TS2_FILTER_ENABLE | EM2874_TS2_NULL_DISCARD);
+			}  else {
+				/* disable video capture */
+				rc = em28xx_write_reg(dev, EM28XX_R12_VINENABLE, 0x27);
+			}
 		}
 	}
 
diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index 2eb9a88e595e..4d632ca91e30 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -296,6 +296,21 @@ static int em28xx_dvb_bus_ctrl(struct dvb_frontend *fe, int acquire)
 		return em28xx_set_mode(dev, EM28XX_SUSPEND);
 }
 
+int em28xx_set_analog_freq(struct em28xx *dev, u32 freq)
+{
+	const struct dvb_tuner_ops *dops = &dev->dvb->fe[0]->ops.tuner_ops;
+
+	if (dops->set_analog_params != NULL) {
+		struct analog_parameters params;
+
+		params.frequency = freq;
+		params.std = dev->v4l2->norm;
+		params.mode = 0;
+
+		dops->set_analog_params(dev->dvb->fe[0], &params);
+	}
+	return 0;
+}
 /* ------------------------------------------------------------------ */
 
 static struct lgdt330x_config em2880_lgdt3303_dev = {
diff --git a/drivers/media/usb/em28xx/em28xx-i2c.c b/drivers/media/usb/em28xx/em28xx-i2c.c
index a7eb11f7fb34..f0a901c3b49a 100644
--- a/drivers/media/usb/em28xx/em28xx-i2c.c
+++ b/drivers/media/usb/em28xx/em28xx-i2c.c
@@ -864,6 +864,8 @@ static int em28xx_i2c_eeprom(struct em28xx *dev, unsigned int bus,
 		 le16_to_cpu(dev_config->string2),
 		 le16_to_cpu(dev_config->string3));
 
+	dev->analog_xfer_mode = data[67] & 0x01;
+
 	return 0;
 
 error:
diff --git a/drivers/media/usb/em28xx/em28xx-reg.h b/drivers/media/usb/em28xx/em28xx-reg.h
index d7c60862874a..b974873e4e86 100644
--- a/drivers/media/usb/em28xx/em28xx-reg.h
+++ b/drivers/media/usb/em28xx/em28xx-reg.h
@@ -167,6 +167,8 @@
 #define EM28XX_R26_COMPR	0x26
 #define EM28XX_R27_OUTFMT	0x27
 
+#define LOCK_STATUS_DEFAULT    0x00
+
 /* em28xx Output Format Register (0x27) */
 #define EM28XX_OUTFMT_RGB_8_RGRG	0x00
 #define EM28XX_OUTFMT_RGB_8_GRGR	0x01
@@ -283,6 +285,7 @@ enum em28xx_chip_id {
 	CHIP_ID_EM2884 = 68,
 	CHIP_ID_EM28174 = 113,
 	CHIP_ID_EM28178 = 114,
+	CHIP_ID_EM2828X = 148,
 };
 
 /*
diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index b0c184f237a7..578ba3d88d01 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -161,13 +161,19 @@ static int em28xx_vbi_supported(struct em28xx *dev)
 	/* FIXME: check subdevices for VBI support */
 
 	if (dev->chip_id == CHIP_ID_EM2860 ||
-	    dev->chip_id == CHIP_ID_EM2883)
+	    dev->chip_id == CHIP_ID_EM2883 ||
+	    dev->board.decoder == EM28XX_BUILTIN)
 		return 1;
 
 	/* Version of em28xx that does not support VBI */
 	return 0;
 }
 
+static int em28xx_analogtv_supported(struct em28xx *dev)
+{
+	return 0;
+}
+
 /*
  * em28xx_wake_i2c()
  * configure i2c attached devices
@@ -344,6 +350,120 @@ static int em28xx_resolution_set(struct em28xx *dev)
 	return em28xx_scaler_set(dev, v4l2->hscale, v4l2->vscale);
 }
 
+static void em2828X_decoder_set_std(struct em28xx *dev, v4l2_std_id norm)
+{
+	if (norm & V4L2_STD_525_60) {
+		dev_dbg(&dev->intf->dev, "V4L2_STD_525_60");
+		em28xx_write_reg(dev, 0x7A01, 0x0d);	// 0x05
+		em28xx_write_reg(dev, 0x7A04, 0xDD);
+		em28xx_write_reg(dev, 0x7A07, 0x60);
+		em28xx_write_reg(dev, 0x7A08, 0x7A);
+		em28xx_write_reg(dev, 0x7A09, 0x02);
+		em28xx_write_reg(dev, 0x7A0A, 0x7C);
+		em28xx_write_reg(dev, 0x7A0C, 0x8A);
+		em28xx_write_reg(dev, 0x7A0F, 0x1C);
+		em28xx_write_reg(dev, 0x7A18, 0x20);
+		em28xx_write_reg(dev, 0x7A19, 0x74);
+		em28xx_write_reg(dev, 0x7A1A, 0x5D);
+		em28xx_write_reg(dev, 0x7A1B, 0x17);
+		em28xx_write_reg(dev, 0x7A2E, 0x85);
+		em28xx_write_reg(dev, 0x7A31, 0x63);
+		em28xx_write_reg(dev, 0x7A82, 0x42);
+		em28xx_write_reg(dev, 0x7AC0, 0xD4);
+
+		if (INPUT(dev->ctl_input)->vmux == EM2828X_COMPOSITE) {
+			em28xx_write_reg(dev, 0x7A00, 0x00);
+			em28xx_write_reg(dev, 0x7A03, 0x00);
+			em28xx_write_reg(dev, 0x7A30, 0x22);
+			em28xx_write_reg(dev, 0x7A80, 0x03);
+		} else if (INPUT(dev->ctl_input)->vmux == EM2828X_TELEVISION) {
+			em28xx_write_reg(dev, 0x7A17, 0xc3);
+			em28xx_write_reg(dev, 0x7A31, 0x62);	// BRL 0x63
+			em28xx_write_reg(dev, 0x7A82, 0x42);
+			em28xx_write_reg(dev, 0x7AC0, 0xD4);
+			em28xx_write_reg(dev, 0x7A00, 0x00);
+			em28xx_write_reg(dev, 0x7A03, 0x00);
+			em28xx_write_reg(dev, 0x7A30, 0x20);
+			em28xx_write_reg(dev, 0x7A80, 0x00);
+
+			em28xx_write_reg(dev, 0x7A50, 0xdd);
+			em28xx_write_reg(dev, 0x7A5d, 0x0e);
+			em28xx_write_reg(dev, 0x7A5e, 0xea);
+			em28xx_write_reg(dev, 0x7A60, 0x64);
+			em28xx_write_reg(dev, 0x7A67, 0x5a);
+		} else {
+			em28xx_write_reg(dev, 0x7A00, 0x01);
+			em28xx_write_reg(dev, 0x7A03, 0x03);
+			em28xx_write_reg(dev, 0x7A30, 0x20);
+			em28xx_write_reg(dev, 0x7A80, 0x04);
+		}
+	} else if (norm & V4L2_STD_625_50) {
+		dev_dbg(&dev->intf->dev, "V4L2_STD_625_50");
+		em28xx_write_reg(dev, 0x7A04, 0xDC);
+		em28xx_write_reg(dev, 0x7A0C, 0x67);
+		em28xx_write_reg(dev, 0x7A0F, 0x1C);
+		em28xx_write_reg(dev, 0x7A18, 0x28);
+		em28xx_write_reg(dev, 0x7A19, 0x32);
+		em28xx_write_reg(dev, 0x7A1A, 0xB9);
+		em28xx_write_reg(dev, 0x7A1B, 0x86);
+		em28xx_write_reg(dev, 0x7A31, 0xC3);
+		em28xx_write_reg(dev, 0x7A82, 0x52);
+
+		if (INPUT(dev->ctl_input)->vmux == EM2828X_COMPOSITE) {
+			em28xx_write_reg(dev, 0x7A00, 0x32);
+			em28xx_write_reg(dev, 0x7A01, 0x10);
+			em28xx_write_reg(dev, 0x7A03, 0x06);
+			em28xx_write_reg(dev, 0x7A07, 0x2f);
+			em28xx_write_reg(dev, 0x7A08, 0x77);
+			em28xx_write_reg(dev, 0x7A09, 0x0f);
+			em28xx_write_reg(dev, 0x7A0A, 0x8c);
+			em28xx_write_reg(dev, 0x7A20, 0x3d);
+			em28xx_write_reg(dev, 0x7A2E, 0x88);
+			em28xx_write_reg(dev, 0x7A30, 0x2c);
+			em28xx_write_reg(dev, 0x7A80, 0x07);
+		} else if (INPUT(dev->ctl_input)->vmux == EM2828X_TELEVISION) {
+			em28xx_write_reg(dev, 0x7A00, 0x32);
+			em28xx_write_reg(dev, 0x7A03, 0x09);
+			em28xx_write_reg(dev, 0x7A30, 0x2a);
+			em28xx_write_reg(dev, 0x7A80, 0x03);
+			em28xx_write_reg(dev, 0x7A20, 0x35);
+			em28xx_write_reg(dev, 0x7A2e, 0x88);
+			em28xx_write_reg(dev, 0x7A53, 0xcc);
+			em28xx_write_reg(dev, 0x7A5d, 0x16);
+			em28xx_write_reg(dev, 0x7A5e, 0x50);
+			em28xx_write_reg(dev, 0x7A60, 0xb4);
+			em28xx_write_reg(dev, 0x7A67, 0x64);
+		} else {
+			em28xx_write_reg(dev, 0x7A00, 0x33);
+			em28xx_write_reg(dev, 0x7A01, 0x04);
+			em28xx_write_reg(dev, 0x7A03, 0x04);
+			em28xx_write_reg(dev, 0x7A07, 0x20);
+			em28xx_write_reg(dev, 0x7A08, 0x6a);
+			em28xx_write_reg(dev, 0x7A09, 0x16);
+			em28xx_write_reg(dev, 0x7A0A, 0x80);
+			em28xx_write_reg(dev, 0x7A2E, 0x8a);
+			em28xx_write_reg(dev, 0x7A30, 0x26);
+			em28xx_write_reg(dev, 0x7A80, 0x08);
+		}
+	} else {
+		dev_err(&dev->intf->dev, "%s() Unsupported STD: %X", __func__, (unsigned int)norm);
+	}
+
+	em28xx_write_reg(dev, 0x7A3F, 0x01);
+	em28xx_write_reg(dev, 0x7A3F, 0x00);
+}
+
+static int em2828X_decoder_get_lock_status(struct em28xx *dev)
+{
+	int lock_status = 0x0;
+
+	lock_status = em28xx_read_reg(dev, 0x7A3A);
+	if ((lock_status & 0x02))
+		return 1;
+	else
+		return 0;
+}
+
 /* Set USB alternate setting for analog video */
 static int em28xx_set_alternate(struct em28xx *dev)
 {
@@ -880,6 +1000,12 @@ static void em28xx_v4l2_media_release(struct em28xx *dev)
 #ifdef CONFIG_MEDIA_CONTROLLER
 	int i;
 
+	if (dev->board.decoder == EM28XX_BUILTIN) {
+		media_device_unregister_entity(dev->v4l2->decoder);
+		kfree(dev->v4l2->decoder);
+		dev->v4l2->decoder = NULL;
+	}
+
 	for (i = 0; i < MAX_EM28XX_INPUT; i++) {
 		if (!INPUT(i)->type)
 			return;
@@ -1003,7 +1129,7 @@ static void em28xx_v4l2_create_entities(struct em28xx *dev)
 			ent->function = MEDIA_ENT_F_CONN_SVIDEO;
 			break;
 		default: /* EM28XX_VMUX_TELEVISION or EM28XX_RADIO */
-			if (dev->tuner_type != TUNER_ABSENT)
+			if (dev->tuner_type != TUNER_ABSENT || em28xx_analogtv_supported(dev))
 				ent->function = MEDIA_ENT_F_CONN_RF;
 			break;
 		}
@@ -1018,6 +1144,26 @@ static void em28xx_v4l2_create_entities(struct em28xx *dev)
 			dev_err(&dev->intf->dev,
 				"failed to register input entity %d!\n", i);
 	}
+
+	if (dev->board.decoder == EM28XX_BUILTIN) {
+		v4l2->decoder_pads[EM2828X_PAD_INPUT].flags = MEDIA_PAD_FL_SINK;
+		v4l2->decoder_pads[EM2828X_PAD_INPUT].sig_type = PAD_SIGNAL_ANALOG;
+		v4l2->decoder_pads[EM2828X_PAD_VID_OUT].flags = MEDIA_PAD_FL_SOURCE;
+		v4l2->decoder_pads[EM2828X_PAD_VID_OUT].sig_type = PAD_SIGNAL_DV;
+
+		v4l2->decoder = kzalloc_obj(v4l2->decoder, GFP_KERNEL);
+		v4l2->decoder->name = "em2828x_builtin";
+		v4l2->decoder->function = MEDIA_ENT_F_ATV_DECODER;
+
+		ret = media_entity_pads_init(v4l2->decoder, EM2828X_NUM_PADS, &v4l2->decoder_pads[0]);
+		if (ret < 0)
+			dev_err(&dev->intf->dev, "failed to initialize decoder pads %d!\n", ret);
+
+		ret = media_device_register_entity(dev->media_dev, v4l2->decoder);
+		if (ret < 0)
+			dev_err(&dev->intf->dev, "failed to register decoder entity %d!\n", ret);
+	}
+
 #endif
 }
 
@@ -1297,6 +1443,13 @@ static void video_mux(struct em28xx *dev, int index)
 				     MSP_OUTPUT(MSP_SC_IN_DSP_SCART1), 0);
 	}
 
+	if (dev->board.decoder == EM28XX_BUILTIN) {
+		em2828X_decoder_vmux(dev, INPUT(index)->vmux);
+		em2828X_decoder_set_std(dev, dev->v4l2->norm);
+
+		em28xx_gpio_set(dev, INPUT(dev->ctl_input)->gpio);
+	}
+
 	if (dev->board.adecoder != EM28XX_NOADECODER) {
 		v4l2_device_call_all(v4l2_dev, 0, audio, s_routing,
 				     dev->ctl_ainput, dev->ctl_aoutput, 0);
@@ -1366,8 +1519,40 @@ static int em28xx_s_ctrl(struct v4l2_ctrl *ctrl)
 	return (ret < 0) ? ret : 0;
 }
 
+static int em28xx_g_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct em28xx_v4l2 *v4l2 =
+		  container_of(ctrl->handler, struct em28xx_v4l2, ctrl_handler);
+	struct em28xx *dev = v4l2->dev;
+	int ret = -EINVAL;
+
+	switch (ctrl->id) {
+	case V4L2_CID_LOCK_STATUS:
+		if (dev->board.decoder == EM28XX_BUILTIN) {
+			ctrl->val = em2828X_decoder_get_lock_status(dev);
+			ret = 0;
+		}
+		break;
+	}
+
+	return (ret < 0) ? ret : 0;
+}
+
 static const struct v4l2_ctrl_ops em28xx_ctrl_ops = {
 	.s_ctrl = em28xx_s_ctrl,
+	.g_volatile_ctrl = em28xx_g_ctrl,
+};
+
+static const struct v4l2_ctrl_config em28xx_lock_status_config = {
+	.ops = &em28xx_ctrl_ops,
+	.id = V4L2_CID_LOCK_STATUS,
+	.name = "Lock Status",
+	.type = V4L2_CTRL_TYPE_BOOLEAN,
+	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_VOLATILE,
+	.min = 0,
+	.max = 1,
+	.step = 1,
+	.def = 0,
 };
 
 static void size_to_scale(struct em28xx *dev,
@@ -1586,6 +1771,9 @@ static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id norm)
 	em28xx_resolution_set(dev);
 	v4l2_device_call_all(&v4l2->v4l2_dev, 0, video, s_std, v4l2->norm);
 
+	if (dev->board.decoder == EM28XX_BUILTIN)
+		em2828X_decoder_set_std(dev, v4l2->norm);
+
 	return 0;
 }
 
@@ -1829,6 +2017,11 @@ static int vidioc_g_tuner(struct file *file, void *priv,
 
 	strscpy(t->name, "Tuner", sizeof(t->name));
 
+	t->type = V4L2_TUNER_ANALOG_TV;
+	t->capability = V4L2_TUNER_CAP_NORM;
+	t->rangehigh = 0xffffffffUL;
+	t->signal = 0xffff;     /* LOCKED */
+
 	v4l2_device_call_all(&dev->v4l2->v4l2_dev, 0, tuner, g_tuner, t);
 	return 0;
 }
@@ -1978,7 +2171,7 @@ static int vidioc_querycap(struct file *file, void  *priv,
 			    V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
 	if (dev->int_audio_type != EM28XX_INT_AUDIO_NONE)
 		cap->capabilities |= V4L2_CAP_AUDIO;
-	if (dev->tuner_type != TUNER_ABSENT)
+	if (dev->tuner_type != TUNER_ABSENT || em28xx_analogtv_supported(dev))
 		cap->capabilities |= V4L2_CAP_TUNER;
 	if (video_is_registered(&v4l2->vbi_dev))
 		cap->capabilities |= V4L2_CAP_VBI_CAPTURE;
@@ -2549,7 +2742,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	}
 
 	hdl = &v4l2->ctrl_handler;
-	v4l2_ctrl_handler_init(hdl, 8);
+	v4l2_ctrl_handler_init(hdl, 9);
 	v4l2->v4l2_dev.ctrl_handler = hdl;
 
 	if (dev->is_webcam)
@@ -2675,7 +2868,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	}
 
 	/* set default norm */
-	v4l2->norm = V4L2_STD_PAL;
+	v4l2->norm = -1;
 	v4l2_device_call_all(&v4l2->v4l2_dev, 0, video, s_std, v4l2->norm);
 	v4l2->interlaced_fieldmode = EM28XX_INTERLACED_DEFAULT;
 
@@ -2738,6 +2931,8 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 				  V4L2_CID_SHARPNESS,
 				  0, 0x0f, 1, SHARPNESS_DEFAULT);
 
+	v4l2_ctrl_new_custom(hdl, &em28xx_lock_status_config, NULL);
+
 	/* Reset image controls */
 	em28xx_colorlevels_set_default(dev);
 	v4l2_ctrl_handler_setup(hdl);
@@ -2755,10 +2950,9 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 				 V4L2_CAP_STREAMING;
 	if (dev->int_audio_type != EM28XX_INT_AUDIO_NONE)
 		v4l2->vdev.device_caps |= V4L2_CAP_AUDIO;
-	if (dev->tuner_type != TUNER_ABSENT)
+	if (dev->tuner_type != TUNER_ABSENT || em28xx_analogtv_supported(dev))
 		v4l2->vdev.device_caps |= V4L2_CAP_TUNER;
 
-
 	/* disable inapplicable ioctls */
 	if (dev->is_webcam) {
 		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_QUERYSTD);
@@ -2767,7 +2961,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	} else {
 		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_S_PARM);
 	}
-	if (dev->tuner_type == TUNER_ABSENT) {
+	if ((v4l2->vdev.device_caps & V4L2_CAP_TUNER) == 0) {
 		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_G_TUNER);
 		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_S_TUNER);
 		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_G_FREQUENCY);
@@ -2778,6 +2972,9 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_S_AUDIO);
 	}
 
+	if (dev->chip_id == CHIP_ID_EM2828X || dev->board.decoder == EM28XX_BUILTIN)
+		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_ENUM_FRAMESIZES);
+
 	/* register v4l2 video video_device */
 	ret = video_register_device(&v4l2->vdev, VFL_TYPE_VIDEO,
 				    video_nr[dev->devno]);
@@ -2796,12 +2993,12 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		v4l2->vbi_dev.queue->lock = &v4l2->vb_vbi_queue_lock;
 		v4l2->vbi_dev.device_caps = V4L2_CAP_STREAMING |
 			V4L2_CAP_READWRITE | V4L2_CAP_VBI_CAPTURE;
-		if (dev->tuner_type != TUNER_ABSENT)
+		if ((v4l2->vdev.device_caps & V4L2_CAP_TUNER) == 0)
 			v4l2->vbi_dev.device_caps |= V4L2_CAP_TUNER;
 
 		/* disable inapplicable ioctls */
 		v4l2_disable_ioctl(&v4l2->vbi_dev, VIDIOC_S_PARM);
-		if (dev->tuner_type == TUNER_ABSENT) {
+		if ((v4l2->vbi_dev.device_caps & V4L2_CAP_TUNER) == 0) {
 			v4l2_disable_ioctl(&v4l2->vbi_dev, VIDIOC_G_TUNER);
 			v4l2_disable_ioctl(&v4l2->vbi_dev, VIDIOC_S_TUNER);
 			v4l2_disable_ioctl(&v4l2->vbi_dev, VIDIOC_G_FREQUENCY);
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index f3449c240d21..b6b8c4ae93af 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -425,8 +425,15 @@ enum em28xx_decoder {
 	EM28XX_NODECODER = 0,
 	EM28XX_TVP5150,
 	EM28XX_SAA711X,
+	EM28XX_BUILTIN,
 };
 
+/* Built in decoder capture options */
+#define V4L2_CID_LOCK_STATUS V4L2_CID_LASTP1
+#define EM2828X_COMPOSITE	0
+#define EM2828X_SVIDEO		1
+#define EM2828X_TELEVISION	2
+
 enum em28xx_sensor {
 	EM28XX_NOSENSOR = 0,
 	EM28XX_MT9V011,
@@ -469,6 +476,12 @@ struct em28xx_button {
 	bool inverted;
 };
 
+enum em2828x_media_pads {
+	EM2828X_PAD_INPUT,
+	EM2828X_PAD_VID_OUT,
+	EM2828X_NUM_PADS
+};
+
 struct em28xx_board {
 	char *name;
 	int vchannels;
@@ -593,6 +606,7 @@ struct em28xx_v4l2 {
 
 #ifdef CONFIG_MEDIA_CONTROLLER
 	struct media_pad video_pad, vbi_pad;
+	struct media_pad decoder_pads[EM2828X_NUM_PADS];
 	struct media_entity *decoder;
 #endif
 };
@@ -752,6 +766,8 @@ struct em28xx {
 				     char *buf, int len);
 	int (*em28xx_read_reg_req)(struct em28xx *dev, u8 req, u16 reg);
 
+	int (*em28xx_set_analog_freq)(struct em28xx *dev, u32 freq);
+
 	enum em28xx_mode mode;
 
 	// Button state polling
@@ -763,6 +779,7 @@ struct em28xx {
 	// Snapshot button input device
 	char snapshot_button_path[30];	// path of the input dev
 	struct input_dev *sbutton_input_dev;
+	int analog_xfer_mode;
 
 #ifdef CONFIG_MEDIA_CONTROLLER
 	struct media_device *media_dev;
@@ -811,6 +828,8 @@ int em28xx_write_ac97(struct em28xx *dev, u8 reg, u16 val);
 int em28xx_audio_analog_set(struct em28xx *dev);
 int em28xx_audio_setup(struct em28xx *dev);
 
+void em2828X_decoder_vmux(struct em28xx *dev, unsigned int vin);
+
 const struct em28xx_led *em28xx_find_led(struct em28xx *dev,
 					 enum em28xx_led_role role);
 int em28xx_capture_start(struct em28xx *dev, int start);
-- 
2.35.1


