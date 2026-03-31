Return-Path: <linux-media+bounces-57803-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNgCFU7ry2l6MgYAu9opvQ
	(envelope-from <linux-media+bounces-57803-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 17:42:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 015D636BE90
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 17:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D72913038156
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 15:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA34A40F8DA;
	Tue, 31 Mar 2026 15:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+q3IhlN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B90423A95
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 15:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971234; cv=none; b=UQhCcQNv2NSxc+BDHv0VY2rnQTYUhaCis7IVVDz8SytjLbCuE5fpR7Kly4cp3dtREnql27n7jGV+wZJc51hFftLTgtkm/C9PmEUUqH2M0zBLCWo5SLYBFCjXUxfPaTCsLsBbj+cP5hMdNAX5drGOiBU2MIRVX7bO3LAe3lDiQJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971234; c=relaxed/simple;
	bh=VBnUps52CFyG/FoydIZuQExaREr6jUgcN6RNLQQSv/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NE/C0z35TvAo9csjBmT2Vy2KVICCa4RwkHCVrzd+sEo+aHfBQDdtvrQciSdxfmLAkZ4IdwvC3WVixEySFFnFRR27j55r8VsmyAJsOchhmUWSSN3cvLrt30U+lrHBHJcvzPN4dNHDG5zAg4RPtmE6TGPmHswGnP3b74z1L8S1hWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+q3IhlN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-482f454be5bso81615e9.0
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 08:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774971223; x=1775576023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GoPzotOzxchx6HJtazekerTGgce+xj3FHC32X+mzsS0=;
        b=H+q3IhlNuhTFVkuJRoArfpI5peKbJ/9/qCGGDkWc4DtZLeEnDIWRNYNBwLAD1UFwRF
         rP0ZpYH7DH1cJ77p6w5tFH9Srrvw2dSHcw3FH/wP8a1ARasgBg11Uu4ZuosMDwaJvmUC
         ZqHFm0XHdaMWxp7Fw1uZUORfyJmmw8feMPH4BKMAsnWEFP4wYfAIxWoJ803oEQAFBtQ4
         REwg5q6gP9cL8/7cqHjZdferDZ/NMHLTawYrbu4SBjzWaxqavnHN6Y9HhTyAFMEvOOGh
         XlYTQJHalvlb+1fh3q8OiUGhyVUKdI2TMrn11f8GP8AfxxULx4uj+1mK7NUXDF13kn7m
         H2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971223; x=1775576023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoPzotOzxchx6HJtazekerTGgce+xj3FHC32X+mzsS0=;
        b=QSf9ZV8Vh32ONMOQkOF8+8qbYlMcicStwr+LN9804IIYR4Kn+3WSLjfoTptxiKbm8s
         u1rHBJ3hFiIxABmlEPHJkDehsHy+cN6r+uT/yPoPiGsgWdKnubJ+J85jd8eZ5BsJRSKM
         oj8JBIKuuotSKkk1iohpBzvr3KIa9qPcjFf8/AjT5y6MN5xGmdv9hpOsdDjS+pjTIEI6
         nCaW9RYbP5JPLJeb8YzpdL+6aRiUrLznw+lLOEMLgy26LLjqP9k0LZKTmTnnov4QDstk
         arkd7UqSs6gi8db7osnRd8RmeE0JSw5P99bbQKmJnTZ42DmL07+j9XvonfsASFNdsMwF
         psWw==
X-Forwarded-Encrypted: i=1; AJvYcCVkLI0bjDAOOIgI0/0Ujp9Z7oEcL3asgA07w6L2pqUdxoST04o4LLCl4V614ar+KQU1B/lJpLqw3SVNcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaylORh++4bMWoatUKJi7wsBPirSt05R31IIER+ni0wJxz7x2W
	PXWezrO/ar3dAposrug2xj439gbWz8mlYl8io/AKneTXTbwXDTZXAzuw
X-Gm-Gg: ATEYQzw1dVFS2vpEW08SM42VN9x4a9dPXI4+tWdUaS52tt0EyvH8PvZ5/GzYJSTnudT
	H9OENDGvI3022XKCMMkzyZi9yA9ezstVnluZPRmKK2UhY9NTGDigLyb4XLkC2/HcEr4fn0HsgGE
	BHBiDDoIoS1VMbDYKSMMaCboRDlkBexx7zuGyF8uKLjHqKysfKboQyI5A3YS0G8XiP7nk/nD+04
	Nsbux8e1DLnWD/1zAuMl2QzHYo3/xdBaXBzbSzMZzC+tVuqYcWDh5icI4cnm63rLt3vF/eJ7/OQ
	DZIHCkX+2X8oiHwNCoHch5bHO6+0ZMGhyGJRJe/W0cnV47UucKaC2MUFTaNm36ZeoHPIpJDMpSV
	dVYQg73BsIBTiQQMcYhI/9f8UPr3TbCwurQk+5jG+zeroq6QH2Mhu+IimQtW6hFal7aYlysAnUC
	apwqVZfJmuqz2AEapvs+ceYpKozuVOlzJrBlUELMWXD3oxXSKshDlub9c=
X-Received: by 2002:a05:600c:a101:b0:485:50ac:b8cf with SMTP id 5b1f17b1804b1-48878113373mr53950405e9.0.1774971222451;
        Tue, 31 Mar 2026 08:33:42 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e952b0bsm39767515e9.12.2026.03.31.08.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:33:41 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: mchehab@kernel.org
Cc: js@linuxtv.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2] media: dvb: cleanup dead DVB_USB code in Kconfig
Date: Tue, 31 Mar 2026 16:32:30 +0100
Message-ID: <20260331153230.15871-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxtv.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-57803-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 015D636BE90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is already an 'if DVB_USB' condition wrapping most config
options, making the 'depends on' statement for each a duplicate
dependency (dead code).

Additionally, we can move the 'if DVB_USB' condition up to include
the DVB_USB_DEBUG config option, and also remove its specific
'depends on' statement.

This dead code was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
v2: added 'media' prefix to subject line
Link to v1: https://lore.kernel.org/all/20260331115540.97695-1-julianbraha@gmail.com/
---
 drivers/media/usb/dvb-usb/Kconfig | 30 +++---------------------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/Kconfig b/drivers/media/usb/dvb-usb/Kconfig
index f10fe27e2a4d..9a9ccfa72d5c 100644
--- a/drivers/media/usb/dvb-usb/Kconfig
+++ b/drivers/media/usb/dvb-usb/Kconfig
@@ -15,18 +15,16 @@ config DVB_USB
 
 	  Say Y if you own a USB DVB device.
 
+if DVB_USB
+
 config DVB_USB_DEBUG
 	bool "Enable extended debug support for all DVB-USB devices"
-	depends on DVB_USB
 	help
 	  Say Y if you want to enable debugging. See modinfo dvb-usb (and the
 	  appropriate drivers) for debug levels.
 
-if DVB_USB
-
 config DVB_USB_A800
 	tristate "AVerMedia AverTV DVB-T USB 2.0 (A800)"
-	depends on DVB_USB
 	select DVB_USB_DIB3000MC
 	select DVB_PLL if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_MT2060 if MEDIA_SUBDRV_AUTOSELECT
@@ -35,7 +33,6 @@ config DVB_USB_A800
 
 config DVB_USB_AF9005
 	tristate "Afatech AF9005 DVB-T USB1.1 support"
-	depends on DVB_USB
 	select MEDIA_TUNER_MT2060 if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_QT1010 if MEDIA_SUBDRV_AUTOSELECT
 	help
@@ -51,7 +48,6 @@ config DVB_USB_AF9005_REMOTE
 
 config DVB_USB_AZ6027
 	tristate "Azurewave DVB-S/S2 USB2.0 AZ6027 support"
-	depends on DVB_USB
 	select DVB_STB0899 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_STB6100 if MEDIA_SUBDRV_AUTOSELECT
 	help
@@ -59,7 +55,6 @@ config DVB_USB_AZ6027
 
 config DVB_USB_CINERGY_T2
 	tristate "Terratec CinergyT2/qanu USB 2.0 DVB-T receiver"
-	depends on DVB_USB
 	help
 	  Support for "TerraTec CinergyT2" USB2.0 Highspeed DVB Receivers
 
@@ -67,7 +62,6 @@ config DVB_USB_CINERGY_T2
 
 config DVB_USB_CXUSB
 	tristate "Conexant USB2.0 hybrid reference design support"
-	depends on DVB_USB
 	select DVB_PLL if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_CX22702 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_LGDT330X if MEDIA_SUBDRV_AUTOSELECT
@@ -106,7 +100,6 @@ config DVB_USB_CXUSB_ANALOG
 
 config DVB_USB_DIB0700
 	tristate "DiBcom DiB0700 USB DVB devices (see help for supported devices)"
-	depends on DVB_USB
 	select DVB_DIB7000P if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_DIB7000M if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_DIB8000 if MEDIA_SUBDRV_AUTOSELECT
@@ -137,7 +130,6 @@ config DVB_USB_DIB0700
 
 config DVB_USB_DIB3000MC
 	tristate
-	depends on DVB_USB
 	select DVB_DIB3000MC
 	help
 	  This is a module with helper functions for accessing the
@@ -147,7 +139,6 @@ config DVB_USB_DIB3000MC
 
 config DVB_USB_DIBUSB_MB
 	tristate "DiBcom USB DVB-T devices (based on the DiB3000M-B) (see help for device list)"
-	depends on DVB_USB
 	select DVB_PLL if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_DIB3000MB
 	depends on DVB_DIB3000MC || !DVB_DIB3000MC
@@ -170,7 +161,6 @@ config DVB_USB_DIBUSB_MB_FAULTY
 
 config DVB_USB_DIBUSB_MC
 	tristate "DiBcom USB DVB-T devices (based on the DiB3000M-C/P) (see help for device list)"
-	depends on DVB_USB
 	select DVB_USB_DIB3000MC
 	select MEDIA_TUNER_MT2060 if MEDIA_SUBDRV_AUTOSELECT
 	help
@@ -185,7 +175,6 @@ config DVB_USB_DIBUSB_MC
 
 config DVB_USB_DIGITV
 	tristate "Nebula Electronics uDigiTV DVB-T USB2.0 support"
-	depends on DVB_USB
 	select DVB_PLL if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_NXT6000 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_MT352 if MEDIA_SUBDRV_AUTOSELECT
@@ -194,7 +183,6 @@ config DVB_USB_DIGITV
 
 config DVB_USB_DTT200U
 	tristate "WideView WT-200U and WT-220U (pen) DVB-T USB2.0 support (Yakumo/Hama/Typhoon/Yuan)"
-	depends on DVB_USB
 	help
 	  Say Y here to support the WideView/Yakumo/Hama/Typhoon/Yuan DVB-T USB2.0 receiver.
 
@@ -204,7 +192,6 @@ config DVB_USB_DTT200U
 
 config DVB_USB_DTV5100
 	tristate "AME DTV-5100 USB2.0 DVB-T support"
-	depends on DVB_USB
 	select DVB_ZL10353 if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_QT1010 if MEDIA_SUBDRV_AUTOSELECT
 	help
@@ -212,7 +199,6 @@ config DVB_USB_DTV5100
 
 config DVB_USB_DW2102
 	tristate "DvbWorld & TeVii DVB-S/S2 USB2.0 support"
-	depends on DVB_USB
 	select DVB_PLL if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_STV0299 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_STV0288 if MEDIA_SUBDRV_AUTOSELECT
@@ -235,7 +221,6 @@ config DVB_USB_DW2102
 
 config DVB_USB_GP8PSK
 	tristate "GENPIX 8PSK->USB module support"
-	depends on DVB_USB
 	help
 	  Say Y here to support the
 	    GENPIX 8psk module
@@ -244,7 +229,6 @@ config DVB_USB_GP8PSK
 
 config DVB_USB_M920X
 	tristate "Uli m920x DVB-T USB2.0 support"
-	depends on DVB_USB
 	select DVB_MT352 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_TDA1004X if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_QT1010 if MEDIA_SUBDRV_AUTOSELECT
@@ -258,7 +242,6 @@ config DVB_USB_M920X
 
 config DVB_USB_NOVA_T_USB2
 	tristate "Hauppauge WinTV-NOVA-T usb2 DVB-T USB2.0 support"
-	depends on DVB_USB
 	select DVB_USB_DIB3000MC
 	select DVB_PLL if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_MT2060 if MEDIA_SUBDRV_AUTOSELECT
@@ -267,7 +250,6 @@ config DVB_USB_NOVA_T_USB2
 
 config DVB_USB_OPERA1
 	tristate "Opera1 DVB-S USB2.0 receiver"
-	depends on DVB_USB
 	select DVB_STV0299 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_PLL if MEDIA_SUBDRV_AUTOSELECT
 	help
@@ -275,7 +257,6 @@ config DVB_USB_OPERA1
 
 config DVB_USB_PCTV452E
 	tristate "Pinnacle PCTV HDTV Pro USB device/TT Connect S2-3600"
-	depends on DVB_USB
 	select TTPCI_EEPROM
 	select DVB_ISL6423 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_LNBP22 if MEDIA_SUBDRV_AUTOSELECT
@@ -289,7 +270,6 @@ config DVB_USB_PCTV452E
 
 config DVB_USB_TECHNISAT_USB2
 	tristate "Technisat DVB-S/S2 USB2.0 support"
-	depends on DVB_USB
 	select DVB_STV090x if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_STV6110x if MEDIA_SUBDRV_AUTOSELECT
 	help
@@ -297,7 +277,6 @@ config DVB_USB_TECHNISAT_USB2
 
 config DVB_USB_TTUSB2
 	tristate "Pinnacle 400e DVB-S USB2.0 support"
-	depends on DVB_USB
 	select DVB_TDA10086 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_LNBP21 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_TDA826X if MEDIA_SUBDRV_AUTOSELECT
@@ -312,7 +291,6 @@ config DVB_USB_TTUSB2
 
 config DVB_USB_UMT_010
 	tristate "HanfTek UMT-010 DVB-T USB2.0 support"
-	depends on DVB_USB
 	select DVB_PLL if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_USB_DIB3000MC
 	select MEDIA_TUNER_MT2060 if MEDIA_SUBDRV_AUTOSELECT
@@ -322,7 +300,6 @@ config DVB_USB_UMT_010
 
 config DVB_USB_VP702X
 	tristate "TwinhanDTV StarBox and clones DVB-S USB2.0 support"
-	depends on DVB_USB
 	help
 	  Say Y here to support the
 
@@ -334,7 +311,6 @@ config DVB_USB_VP702X
 
 config DVB_USB_VP7045
 	tristate "TwinhanDTV Alpha/MagicBoxII, DNTV tinyUSB2, Beetle USB2.0 support"
-	depends on DVB_USB
 	help
 	  Say Y here to support the
 
@@ -346,4 +322,4 @@ config DVB_USB_VP7045
 
 	  DVB-T USB2.0 receivers.
 
-endif
+endif # DVB_USB
-- 
2.51.2


