Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66FA337821
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 16:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234342AbhCKPla (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 10:41:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234248AbhCKPlN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 10:41:13 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA6DC061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 07:41:12 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id v15so2394658wrx.4
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 07:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3vDMN3dUIFWvZiCPoMmxvm3WWN6G8eQyiB18ua9S658=;
        b=YoZPNNpj+9Rrh+2g/y5CqinTkt7wlHWlptnD/O/kDrkKoZrwlq4caljUwegN4ifDii
         ieEDviQyS7BEkyCKf9+TVY1PgTDkq6K4DyYFIuSbl92xqj1FD/3On8RnOoDwqoc8pJCT
         DmyOcdR82yWPSanXKnGCzRgE1ZQjDqgdJFzT+2fg714WSZnsccLTFUwuyMia3Du8yiaA
         3MkF+aNCKCvIx2pJnGo0xD6Cylpxfnv5idar3LCyip2dq8ykzXgCJP8imHZwmzy4Tr/J
         nJn00MUBWiGNmx5H4G+TbUVC7OLJkndphZ5QyKBJqszvEZA1E5cYMFhbix4AMVVWpwrQ
         EZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3vDMN3dUIFWvZiCPoMmxvm3WWN6G8eQyiB18ua9S658=;
        b=dDceSyPa9eXHLTxN380oxgc1GkI75GIDiTCKsviCVT7Wb74MXxbBmy5BsfX7Tyl36A
         oWve3E1UKyB9xBQkx1XDH8V85ujW9tbe2nb1romsMkajm7xwsSbiDaRDKy6+odSwoutM
         lG+kKXmCxqHfYYktueU97VKPDWMaiYbbAjMh4JRSGJsqhRqML6HqKgA6lAJyFg+VkAj0
         DG7TW05U8pizCQxUOpewfHrqv1npGHH454ohgy3MfGcNGU8v9P64ywR9EjcP+HM4N9ma
         7Q9aNRw1a7lDxujtdLYr7Ys0JMYtfs5/iR3PS4ZaSjKGqakZtsJlLYYm4GitEcL1k9PC
         AZRg==
X-Gm-Message-State: AOAM532AE20Sa86PUuxGC4YKnrfWJHbgT1eDOYS4ZOfPOkU9GAp5Qi97
        95tMHjHePTmsnjQO9pisrBg=
X-Google-Smtp-Source: ABdhPJz5M0aZLrhuiW8AWBhDO2S0qjhxoZST9+8sGd43VrPXQ65ZsfzapkIfK9oXkbB9QUGDiqlouw==
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr9776682wrw.247.1615477271641;
        Thu, 11 Mar 2021 07:41:11 -0800 (PST)
Received: from arch-x1c3.. ([2a00:5f00:102:0:b16d:9752:8f38:7d6b])
        by smtp.gmail.com with ESMTPSA id a17sm4008547wmj.9.2021.03.11.07.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:41:11 -0800 (PST)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Cc:     emil.l.velikov@gmail.com,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 09/10] ARM: configs: at91: sama5: update with savedefconfig
Date:   Thu, 11 Mar 2021 15:40:54 +0000
Message-Id: <20210311154055.3496076-10-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

While enabling an extra config, I've noticed that savedefconfig produced
a notable delta. Split out the no-op changes for clarity sake.

Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 arch/arm/configs/sama5_defconfig | 37 ++++++++++++++++----------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
index f4c3c0652432..a5f274e39753 100644
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -8,11 +8,6 @@ CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EMBEDDED=y
 CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_FORCE_LOAD=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
 CONFIG_ARCH_AT91=y
 CONFIG_SOC_SAMA5D2=y
 CONFIG_SOC_SAMA5D3=y
@@ -25,9 +20,14 @@ CONFIG_KEXEC=y
 CONFIG_VFP=y
 CONFIG_NEON=y
 CONFIG_KERNEL_MODE_NEON=y
-# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_PM_DEBUG=y
 CONFIG_PM_ADVANCED_DEBUG=y
+CONFIG_MODULES=y
+CONFIG_MODULE_FORCE_LOAD=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -75,8 +75,8 @@ CONFIG_BLK_DEV_SD=y
 CONFIG_NETDEVICES=y
 CONFIG_NET_DSA_MICROCHIP_KSZ9477=m
 CONFIG_NET_DSA_MICROCHIP_KSZ9477_SPI=m
-CONFIG_MACB=y
 # CONFIG_NET_VENDOR_BROADCOM is not set
+CONFIG_MACB=y
 # CONFIG_NET_VENDOR_CIRRUS is not set
 # CONFIG_NET_VENDOR_FARADAY is not set
 # CONFIG_NET_VENDOR_INTEL is not set
@@ -91,7 +91,9 @@ CONFIG_MACB=y
 CONFIG_MICREL_PHY=y
 CONFIG_LIBERTAS_THINFIRM=m
 CONFIG_LIBERTAS_THINFIRM_USB=m
-CONFIG_RTL8187=m
+CONFIG_MWIFIEX=m
+CONFIG_MWIFIEX_SDIO=m
+CONFIG_MWIFIEX_USB=m
 CONFIG_RT2X00=m
 CONFIG_RT2500USB=m
 CONFIG_RT73USB=m
@@ -99,10 +101,7 @@ CONFIG_RT2800USB=m
 CONFIG_RT2800USB_RT53XX=y
 CONFIG_RT2800USB_RT55XX=y
 CONFIG_RT2800USB_UNKNOWN=y
-CONFIG_MWIFIEX=m
-CONFIG_MWIFIEX_SDIO=m
-CONFIG_MWIFIEX_USB=m
-# CONFIG_INPUT_MOUSEDEV is not set
+CONFIG_RTL8187=m
 CONFIG_INPUT_EVDEV=y
 # CONFIG_KEYBOARD_ATKBD is not set
 CONFIG_KEYBOARD_QT1070=y
@@ -125,9 +124,9 @@ CONFIG_SPI_ATMEL_QUADSPI=y
 CONFIG_SPI_GPIO=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_SAMA5D2_PIOBU=m
+CONFIG_POWER_RESET=y
 CONFIG_POWER_SUPPLY=y
 CONFIG_BATTERY_ACT8945A=y
-CONFIG_POWER_RESET=y
 CONFIG_SENSORS_JC42=m
 CONFIG_WATCHDOG=y
 CONFIG_AT91SAM9X_WATCHDOG=y
@@ -166,11 +165,11 @@ CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_ATMEL_SOC=y
 CONFIG_SND_ATMEL_SOC_WM8904=y
-# CONFIG_HID_GENERIC is not set
 CONFIG_SND_ATMEL_SOC_CLASSD=y
 CONFIG_SND_ATMEL_SOC_PDMIC=y
 CONFIG_SND_ATMEL_SOC_TSE850_PCM5142=m
 CONFIG_SND_ATMEL_SOC_I2S=y
+# CONFIG_HID_GENERIC is not set
 CONFIG_USB=y
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_EHCI_HCD=y
@@ -224,14 +223,14 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_CODEPAGE_850=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
+CONFIG_CRYPTO_USER_API_HASH=m
+CONFIG_CRYPTO_USER_API_SKCIPHER=m
+CONFIG_CRYPTO_DEV_ATMEL_AES=y
+CONFIG_CRYPTO_DEV_ATMEL_TDES=y
+CONFIG_CRYPTO_DEV_ATMEL_SHA=y
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_DEBUG_FS=y
 CONFIG_DEBUG_MEMORY_INIT=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_FTRACE is not set
 CONFIG_DEBUG_USER=y
-CONFIG_CRYPTO_USER_API_HASH=m
-CONFIG_CRYPTO_USER_API_SKCIPHER=m
-CONFIG_CRYPTO_DEV_ATMEL_AES=y
-CONFIG_CRYPTO_DEV_ATMEL_TDES=y
-CONFIG_CRYPTO_DEV_ATMEL_SHA=y
-- 
2.30.1

