Return-Path: <linux-media+bounces-40866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F705B336D0
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 08:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 939DB7A4A29
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 06:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F2C2877E5;
	Mon, 25 Aug 2025 06:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCXJu8jV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEA4286D53
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 06:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756104787; cv=none; b=fBGiaPW4FY/ObB1AfFMuoXys9i8qKH9k+j2qFxrs5qVtceuYTdDWTtTBc5U3Mw7wMkRHPEImYz0O70fTh6bFmDGdp8Z1urLgFYs4rIndHww2Jmmk6AFriFXA3JP+ZkTzipfIVNtHyIkyiK78B5yJ2U+Qw9cfDQH3D9LOM50mU3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756104787; c=relaxed/simple;
	bh=VhnkmD1eQUtQCPaQsAk1P/50JXBU33TAOSfTC0jWR6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EYAEgnG2RjY/b4gXXyczYy9ej9OygXBU/L4GNzuI695NAszmzvCA2ttLkLSaPmEQpRgwB0DN0XWT3v3CtPeydSGIpk74nHX3JorRIDhs79AaiB11crfFOHHhFEeEEgKd09OYVQgiTMOe10T9zq9MQM5HaALwZBtE9OfkcSmwoLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCXJu8jV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89EFC116B1;
	Mon, 25 Aug 2025 06:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756104786;
	bh=VhnkmD1eQUtQCPaQsAk1P/50JXBU33TAOSfTC0jWR6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gCXJu8jVklvvpiI2aUvEgnj+Wm3Nsb6NLiojfOxiW+qbSkpxD+HiTLZ41KebeSZVH
	 YUeVP/iqjNWxTPgXBITIFBdClo7nCJE8eBps+Lz+YmwuhL+1H1k0wW6Ww0QootO1gF
	 IeMjCtSY4syLt3AXQhAYyFAa+bw4eCQNuQPyzOwZLwCyHyMIQpAdDSf6M9ykh3hucF
	 4rLNEsgP7f9LKb4/5kyKrdO2RHyXQZD/zBe7/oX0Vl6SsrddvTdYoYTIi9954/xTh6
	 hCaqwqHBTHAfL9uZ5vc2iZvVsDQDURYWDzroFgLSIzJh3yx2TpUUnoToh22Iri5d6g
	 PvckpL4vEr0hg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH 1/8] MAINTAINERS: update Hans Verkuil's email addresses
Date: Mon, 25 Aug 2025 08:51:48 +0200
Message-ID: <6c8c0a6c3041b3bb387eb9f85997184f1259e830.1756104715.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1756104715.git.hverkuil+cisco@kernel.org>
References: <cover.1756104715.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil@kernel.org>

Use hverkuil@kernel.org as the main address for kernel work.

Signed-off-by: Hans Verkuil <hverkuil@kernel.org>
---
 MAINTAINERS | 82 ++++++++++++++++++++++++++---------------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa4..7b484fbf115e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -717,7 +717,7 @@ S:	Maintained
 F:	drivers/scsi/aic7xxx/
 
 AIMSLAB FM RADIO RECEIVER DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -1699,20 +1699,20 @@ F:	Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml
 F:	drivers/media/i2c/adv748x/*
 
 ANALOG DEVICES INC ADV7511 DRIVER
-M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/i2c/adv7511*
 
 ANALOG DEVICES INC ADV7604 DRIVER
-M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml
 F:	drivers/media/i2c/adv7604*
 
 ANALOG DEVICES INC ADV7842 DRIVER
-M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/i2c/adv7842*
@@ -3455,7 +3455,7 @@ F:	arch/arm/mach-berlin/
 F:	arch/arm64/boot/dts/synaptics/
 
 ARM/TEGRA HDMI CEC SUBSYSTEM SUPPORT
-M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-tegra@vger.kernel.org
 L:	linux-media@vger.kernel.org
 S:	Maintained
@@ -4139,7 +4139,7 @@ T:	git git://linuxtv.org/media.git
 F:	drivers/media/usb/dvb-usb-v2/az6007.c
 
 AZTECH FM RADIO RECEIVER DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -5387,7 +5387,7 @@ F:	drivers/usb/cdns3/
 X:	drivers/usb/cdns3/cdns3*
 
 CADET FM/AM RADIO RECEIVER DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -5580,7 +5580,7 @@ F:	drivers/char/hw_random/cctrng.c
 F:	drivers/char/hw_random/cctrng.h
 
 CEC FRAMEWORK
-M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Supported
 W:	http://linuxtv.org
@@ -5597,7 +5597,7 @@ F:	include/uapi/linux/cec-funcs.h
 F:	include/uapi/linux/cec.h
 
 CEC GPIO DRIVER
-M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Supported
 W:	http://linuxtv.org
@@ -6012,7 +6012,7 @@ S:	Supported
 F:	drivers/platform/x86/classmate-laptop.c
 
 COBALT MEDIA DRIVER
-M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Supported
 W:	https://linuxtv.org
@@ -6532,7 +6532,7 @@ F:	crypto/ansi_cprng.c
 F:	crypto/rng.c
 
 CS3308 MEDIA DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 W:	http://linuxtv.org
@@ -6573,7 +6573,7 @@ F:	drivers/media/pci/cx18/
 F:	include/uapi/linux/ivtv*
 
 CX2341X MPEG ENCODER HELPER MODULE
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -8501,7 +8501,7 @@ T:	git git://linuxtv.org/media.git
 F:	drivers/media/radio/dsbr100.c
 
 DT3155 MEDIA DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 W:	https://linuxtv.org
@@ -9241,7 +9241,7 @@ F:	tools/bootconfig/*
 F:	tools/bootconfig/scripts/*
 
 EXTRON DA HD 4K PLUS CEC DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -10171,7 +10171,7 @@ S:	Maintained
 F:	drivers/crypto/gemini/
 
 GEMTEK FM RADIO RECEIVER DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -10360,7 +10360,7 @@ F:	drivers/gnss/
 F:	include/linux/gnss.h
 
 GO7007 MPEG CODEC
-M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/usb/go7007/
@@ -10613,7 +10613,7 @@ T:	git git://linuxtv.org/media.git
 F:	drivers/media/usb/gspca/m5602/
 
 GSPCA PAC207 SONIXB SUBDRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 T:	git git://linuxtv.org/media.git
@@ -10634,7 +10634,7 @@ T:	git git://linuxtv.org/media.git
 F:	drivers/media/usb/gspca/t613.c
 
 GSPCA USB WEBCAM DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 T:	git git://linuxtv.org/media.git
@@ -10751,7 +10751,7 @@ S:	Maintained
 F:	sound/parisc/harmony.*
 
 HDPVR USB VIDEO ENCODER DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 W:	https://linuxtv.org
@@ -12955,7 +12955,7 @@ F:	drivers/base/isa.c
 F:	include/linux/isa.h
 
 ISA RADIO MODULE
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -13227,7 +13227,7 @@ F:	include/uapi/linux/vmcore.h
 F:	kernel/crash_*.c
 
 KEENE FM RADIO TRANSMITTER DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -15095,7 +15095,7 @@ F:	include/linux/mfd/max77693*.h
 F:	include/linux/mfd/max77705*.h
 
 MAXIRADIO FM RADIO RECEIVER DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -17015,7 +17015,7 @@ F:	drivers/irqchip/irq-loongson*
 F:	drivers/platform/mips/cpu_hwmon.c
 
 MIROSOUND PCM20 FM RADIO RECEIVER DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 W:	https://linuxtv.org
@@ -20333,7 +20333,7 @@ F:	include/uapi/linux/ptrace.h
 F:	kernel/ptrace.c
 
 PULSE8-CEC DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -20356,7 +20356,7 @@ F:	Documentation/driver-api/media/drivers/pvrusb2*
 F:	drivers/media/usb/pvrusb2/
 
 PWC WEBCAM DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 T:	git git://linuxtv.org/media.git
@@ -20931,14 +20931,14 @@ F:	drivers/video/fbdev/aty/radeon*
 F:	include/uapi/linux/radeonfb.h
 
 RADIOSHARK RADIO DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/radio/radio-shark.c
 
 RADIOSHARK2 RADIO DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -20962,7 +20962,7 @@ S:	Orphan
 F:	drivers/video/fbdev/aty/aty128fb.c
 
 RAINSHADOW-CEC DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -22254,7 +22254,7 @@ S:	Supported
 F:	drivers/s390/scsi/zfcp_*
 
 SAA6588 RDS RECEIVER DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 W:	https://linuxtv.org
@@ -22271,7 +22271,7 @@ F:	Documentation/driver-api/media/drivers/saa7134*
 F:	drivers/media/pci/saa7134/
 
 SAA7146 VIDEO4LINUX-2 DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -22996,7 +22996,7 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/dvb-frontends/si2168*
 
 SI470X FM RADIO RECEIVER I2C DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 W:	https://linuxtv.org
@@ -23005,7 +23005,7 @@ F:	Documentation/devicetree/bindings/media/silabs,si470x.yaml
 F:	drivers/media/radio/si470x/radio-si470x-i2c.c
 
 SI470X FM RADIO RECEIVER USB DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -23031,7 +23031,7 @@ T:	git git://linuxtv.org/media.git
 F:	drivers/media/radio/si4713/radio-platform-si4713.c
 
 SI4713 FM RADIO TRANSMITTER USB DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -24656,7 +24656,7 @@ T:	git git://linuxtv.org/mkrufky/tuners.git
 F:	drivers/media/tuners/tda8290.*
 
 TDA9840 MEDIA DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -24680,7 +24680,7 @@ T:	git git://linuxtv.org/media.git
 F:	drivers/media/tuners/tea5767.*
 
 TEA6415C MEDIA DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -24688,7 +24688,7 @@ T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/tea6415c*
 
 TEA6420 MEDIA DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -24997,7 +24997,7 @@ F:	Documentation/devicetree/bindings/iio/temperature/ti,tmp117.yaml
 F:	drivers/iio/temperature/tmp117.c
 
 THANKO'S RAREMONO AM/FM/SW RADIO RECEIVER USB DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -25494,7 +25494,7 @@ F:	include/linux/toshiba.h
 F:	include/uapi/linux/toshiba.h
 
 TOSHIBA TC358743 DRIVER
-M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
@@ -25709,7 +25709,7 @@ S:	Supported
 F:	drivers/media/pci/tw5864/
 
 TW68 VIDEO4LINUX DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 W:	https://linuxtv.org
@@ -26511,7 +26511,7 @@ S:	Maintained
 F:	drivers/net/ethernet/via/via-velocity.*
 
 VICODEC VIRTUAL CODEC DRIVER
-M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -26816,7 +26816,7 @@ S:	Supported
 F:	drivers/media/test-drivers/visl
 
 VIVID VIRTUAL VIDEO DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
-- 
2.47.2


