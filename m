Return-Path: <linux-media+bounces-57785-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPwQKVW3y2mCKgYAu9opvQ
	(envelope-from <linux-media+bounces-57785-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 14:00:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 036BC369377
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 14:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B648F30699B7
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 11:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172173DFC62;
	Tue, 31 Mar 2026 11:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/0W+Qmz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D0C378812
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 11:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774958148; cv=none; b=bMf4DxWhsjGi16ALKm4leb2o5caqla/hXclzOAdRdvD/L69fgElRWdyL3I0gqkQ4896WPBgtEvdPfX9N0B5t37OWgtXa0bjDajpD74kB2+Oi0yhl2GsIqP4/aJ0Ei4WKOE9za9J8A84N+GTlrmp4eWrcH8JchjOLsXv7aVBS/qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774958148; c=relaxed/simple;
	bh=TrRyoQJZ/kCoh5HI5xlI8ksLC7PKnl8wzh0cnIwTDv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oQBRqSqlDOaMsA4ir4qJQdP02AOzn4+b+BJA4Ob+/uAvJDqqjbAAfv1fgzJ1Ok5DfHNtk3GOCrKv0/prrsTvqONGHsKhsF7n27pntB55BHOz4aT2HD1zTah5SmPxATwqKfFLUpk7rClUqepCrg+5e2NQcYrnnbafuuZxb+qtKaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/0W+Qmz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4887d4c6234so7212255e9.1
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 04:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774958145; x=1775562945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8NnX7UHrlb3FeGbOccRnQFgy9bYWWSaHZqxivrsNqls=;
        b=X/0W+QmzwCFoIiHSr9hD427SSEghZoTgnACF62roZa2jibJZ66TvGNkSgO/89EfW43
         UmwyzNRU8C9Sg1d6rrDvNpAZITz70mkhe++oa624oKvh1qI9u0qzJu8Bz7nOGMve/dSm
         TpMpT+Sb9yJl3Q3NL+PSRPxdLmXi1nqTOBxt0GYKudhucs+2bbOK2mTK70KJ2PbN1jIE
         bSGYgJs9IebFBXQmp0VyDqW0j55bhj7nhkcWa7lRJaC3ltzsrwqju8fSJSHfpyGkunrW
         Fkg2RLWZ4FhG5pQVgdMczVOJAO/ZqEoQsgGMb9ogyJk/FpgXGDEXzJsD6x5pD9vudNd/
         0cpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774958145; x=1775562945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NnX7UHrlb3FeGbOccRnQFgy9bYWWSaHZqxivrsNqls=;
        b=DghYaUY3eOu8vpUkMCcdxzpt9vriEyYGf3XQ8CRlWYqRwuNr4B1HJPzAQ7CzfUuREs
         Ua8+lAIP0mR211ZRe57+JblaHi8HgXniFtvaFvZCMjyenF7GaVcbPIQE3WCAvpq9UxJR
         B952QDdBM6COldViQJQ/pXoO6XLzYpOs/KyCPyEbC5T44riBibtWTd/9G+vaTDr4YD6Y
         /Fu65so31SV1GPwYisBHtX+zQb+i3XNYfI0nniJNu4lgQokG0E9uWzgTWdiXUgNtRICf
         3igbIL8PbN0VsyRqnAe+MeI2n4acqcSgmO4y8+ptasfGEnUh5IznOPisfDXIzZapzvNN
         Smtw==
X-Forwarded-Encrypted: i=1; AJvYcCUvw4lBLh7i/2jmMUjyBs9VkYh3TyWsfZdiu0cwCIRvPbh1fdfLC+EN7n3lA3v2ShCbaHRJCflEdbejqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7ze0ddMuutQRq1/gQ8jYU2vgsj1vG/nROdWtvjSeYcHjqAVHW
	v8o1TvU6EfkkCEStdYRn2DCa+3OYRXxJfVaw65YAwVR8jTWaOD8xBBym03ZzqJWsmg2h/w==
X-Gm-Gg: ATEYQzwXc43E6g52csDpFyh58JLWigPPa97y05PGSpDswikN9yadZarkSQVMkvrs0hp
	8TdF+OnODzxNi4RwNxk3vx42SYCTsrf+0skwDCQB6NVtdBNGBMwwkol4HI3SI5dGne+bkLtqyj9
	EpS417JcOudB7mcE4qerVH9zZc6PJ70pOEsMGdF2CgniIqeeVegee9ch7VuaKyGdmkRGLVmkh4J
	UIYBfyIsmIOKfEj4NZVR0ZgkGjlRlo3nACh4s4hrL+qkhxqSR26mKIvLu6GGm7MfP1/iHJ61YSI
	ACt+Mm47sMga3TQ+cBg11ux6fp+dnJQPXB3YWTMTDGVWjHtbg/hHmh3yBCjRr/EksiW8a9WGPR7
	gB7FOVmSY4/9G2lj2TkDZrZnYT+8un1i3GxGwHAlYQLMPoE+83MXncXaEsHB8bnyDYjNeZYVQF9
	EbBvn9Ihxj9N6IS5WZ80MT9vA/TATkXqFLg/NSDWrGDhBFcZ/FI4DpeDE=
X-Received: by 2002:a05:600c:a303:b0:485:3423:727d with SMTP id 5b1f17b1804b1-48727f068bdmr201620605e9.26.1774958145027;
        Tue, 31 Mar 2026 04:55:45 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80140esm29694305e9.4.2026.03.31.04.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 04:55:44 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: mchehab@kernel.org
Cc: js@linuxtv.org,
	pboettcher@kernellabs.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] dvb: cleanup dead DVB_USB code in Kconfig
Date: Tue, 31 Mar 2026 12:55:40 +0100
Message-ID: <20260331115540.97695-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.51.2
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxtv.org,kernellabs.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-57785-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 036BC369377
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


