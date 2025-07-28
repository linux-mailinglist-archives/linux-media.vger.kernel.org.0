Return-Path: <linux-media+bounces-38536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B441B13829
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 11:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 739A817DE3D
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 09:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF53B25BEF1;
	Mon, 28 Jul 2025 09:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/XQk4l6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBEE25BF14
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 09:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695863; cv=none; b=WKsayJ+rDNGugr+yVJKJZDFZ6pJnMZ3QUJ0AnBNokl0vefC309NVO8r0N0nCPz+7koenSDwhy/GDqkgGedBFrgd40EiThNdBcspm77CSJzgIWdVinfEWmW+Dw1+i1ADdLdB1UvPaixULIOawJgde0vVUlavlPIHz+lku8qtFK0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695863; c=relaxed/simple;
	bh=CXrHWj28xjfMjBkIsRYmSMUxk6bHMrJbfR6yBdQFsSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YH6VSQNcKzJ1R8Rin+ULibz5nbPfdnyVkrsY8cANd6MFU+245q7KaYzUJ1YR6etqBVEeH/M/m1RxfXIRnxT6X6ES5SQKlMLbthaOFdzDWZTbatkjBvcVXr9M4jDZ3piuCFbggL5djiJ4xkdiWBGh+obsbZfAcLgu/ts02q1+KVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/XQk4l6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F391EC4CEF7;
	Mon, 28 Jul 2025 09:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753695862;
	bh=CXrHWj28xjfMjBkIsRYmSMUxk6bHMrJbfR6yBdQFsSw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g/XQk4l6/MXXSkbJ9k6Hp2pl1iJ7RHuqzpAysHlqwoFJOQtYbkwDnMNbqRkOE7K9P
	 8/X+5J7Y16JB6Zp5abOOhhfzqMwNt7183eZC8rrmtUigfL68RkfSXFMWI19FVCCLn1
	 /SXrUEmjHCJlWDOotF0MDkug7hSoW9Npn2WzQnU3ckuTNn0EfKkOBZ8e/kNRzmQiKO
	 klvxY467k5Gww4whw6PsAi4U9OE9u5CxwxW+aHhPOpfa9b94Udhx5rd9Wo83h2lW0I
	 ESEy4rbBbYTln3iL7Vsc9MBtwGuOnaroLi09lTslgPxgPrWl51u6//mZ6tAIthILNc
	 ofP4qwUGpmMtw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH 1/8] MAINTAINERS: update Hans Verkuil's email addresses
Date: Mon, 28 Jul 2025 11:41:50 +0200
Message-ID: <2b1324fd559d57800d7e5654493a3dc0f21e97c8.1753695717.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1753695717.git.hverkuil+cisco@kernel.org>
References: <cover.1753695717.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil@xs4all.nl>

Use hverkuil@kernel.org as the main address for kernel work.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 MAINTAINERS | 82 ++++++++++++++++++++++++++---------------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 24c557ee091d..17a120c08321 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -714,7 +714,7 @@ S:	Maintained
 F:	drivers/scsi/aic7xxx/
 
 AIMSLAB FM RADIO RECEIVER DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -1662,20 +1662,20 @@ F:	Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml
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
@@ -3362,7 +3362,7 @@ F:	arch/arm/mach-berlin/
 F:	arch/arm64/boot/dts/synaptics/
 
 ARM/TEGRA HDMI CEC SUBSYSTEM SUPPORT
-M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-tegra@vger.kernel.org
 L:	linux-media@vger.kernel.org
 S:	Maintained
@@ -4044,7 +4044,7 @@ T:	git git://linuxtv.org/media.git
 F:	drivers/media/usb/dvb-usb-v2/az6007.c
 
 AZTECH FM RADIO RECEIVER DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -5284,7 +5284,7 @@ F:	drivers/usb/cdns3/
 X:	drivers/usb/cdns3/cdns3*
 
 CADET FM/AM RADIO RECEIVER DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -5477,7 +5477,7 @@ F:	drivers/char/hw_random/cctrng.c
 F:	drivers/char/hw_random/cctrng.h
 
 CEC FRAMEWORK
-M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Supported
 W:	http://linuxtv.org
@@ -5494,7 +5494,7 @@ F:	include/uapi/linux/cec-funcs.h
 F:	include/uapi/linux/cec.h
 
 CEC GPIO DRIVER
-M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Supported
 W:	http://linuxtv.org
@@ -5908,7 +5908,7 @@ S:	Supported
 F:	drivers/platform/x86/classmate-laptop.c
 
 COBALT MEDIA DRIVER
-M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Supported
 W:	https://linuxtv.org
@@ -6427,7 +6427,7 @@ F:	crypto/ansi_cprng.c
 F:	crypto/rng.c
 
 CS3308 MEDIA DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 W:	http://linuxtv.org
@@ -6468,7 +6468,7 @@ F:	drivers/media/pci/cx18/
 F:	include/uapi/linux/ivtv*
 
 CX2341X MPEG ENCODER HELPER MODULE
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -8352,7 +8352,7 @@ T:	git git://linuxtv.org/media.git
 F:	drivers/media/radio/dsbr100.c
 
 DT3155 MEDIA DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 W:	https://linuxtv.org
@@ -9092,7 +9092,7 @@ F:	tools/bootconfig/*
 F:	tools/bootconfig/scripts/*
 
 EXTRON DA HD 4K PLUS CEC DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -10022,7 +10022,7 @@ S:	Maintained
 F:	drivers/crypto/gemini/
 
 GEMTEK FM RADIO RECEIVER DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -10210,7 +10210,7 @@ F:	drivers/gnss/
 F:	include/linux/gnss.h
 
 GO7007 MPEG CODEC
-M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/usb/go7007/
@@ -10462,7 +10462,7 @@ T:	git git://linuxtv.org/media.git
 F:	drivers/media/usb/gspca/m5602/
 
 GSPCA PAC207 SONIXB SUBDRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 T:	git git://linuxtv.org/media.git
@@ -10483,7 +10483,7 @@ T:	git git://linuxtv.org/media.git
 F:	drivers/media/usb/gspca/t613.c
 
 GSPCA USB WEBCAM DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 T:	git git://linuxtv.org/media.git
@@ -10600,7 +10600,7 @@ S:	Maintained
 F:	sound/parisc/harmony.*
 
 HDPVR USB VIDEO ENCODER DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 W:	https://linuxtv.org
@@ -12785,7 +12785,7 @@ F:	drivers/base/isa.c
 F:	include/linux/isa.h
 
 ISA RADIO MODULE
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -13059,7 +13059,7 @@ F:	include/uapi/linux/vmcore.h
 F:	kernel/crash_*.c
 
 KEENE FM RADIO TRANSMITTER DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -14904,7 +14904,7 @@ F:	include/linux/mfd/max77693*.h
 F:	include/linux/mfd/max77705*.h
 
 MAXIRADIO FM RADIO RECEIVER DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -16727,7 +16727,7 @@ F:	drivers/irqchip/irq-loongson*
 F:	drivers/platform/mips/cpu_hwmon.c
 
 MIROSOUND PCM20 FM RADIO RECEIVER DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 W:	https://linuxtv.org
@@ -20036,7 +20036,7 @@ F:	include/uapi/linux/ptrace.h
 F:	kernel/ptrace.c
 
 PULSE8-CEC DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -20059,7 +20059,7 @@ F:	Documentation/driver-api/media/drivers/pvrusb2*
 F:	drivers/media/usb/pvrusb2/
 
 PWC WEBCAM DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 T:	git git://linuxtv.org/media.git
@@ -20638,14 +20638,14 @@ F:	drivers/video/fbdev/aty/radeon*
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
@@ -20669,7 +20669,7 @@ S:	Orphan
 F:	drivers/video/fbdev/aty/aty128fb.c
 
 RAINSHADOW-CEC DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -21931,7 +21931,7 @@ S:	Supported
 F:	drivers/s390/scsi/zfcp_*
 
 SAA6588 RDS RECEIVER DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 W:	https://linuxtv.org
@@ -21948,7 +21948,7 @@ F:	Documentation/driver-api/media/drivers/saa7134*
 F:	drivers/media/pci/saa7134/
 
 SAA7146 VIDEO4LINUX-2 DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -22647,7 +22647,7 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/dvb-frontends/si2168*
 
 SI470X FM RADIO RECEIVER I2C DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 W:	https://linuxtv.org
@@ -22656,7 +22656,7 @@ F:	Documentation/devicetree/bindings/media/silabs,si470x.yaml
 F:	drivers/media/radio/si470x/radio-si470x-i2c.c
 
 SI470X FM RADIO RECEIVER USB DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -22682,7 +22682,7 @@ T:	git git://linuxtv.org/media.git
 F:	drivers/media/radio/si4713/radio-platform-si4713.c
 
 SI4713 FM RADIO TRANSMITTER USB DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -24288,7 +24288,7 @@ T:	git git://linuxtv.org/mkrufky/tuners.git
 F:	drivers/media/tuners/tda8290.*
 
 TDA9840 MEDIA DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -24312,7 +24312,7 @@ T:	git git://linuxtv.org/media.git
 F:	drivers/media/tuners/tea5767.*
 
 TEA6415C MEDIA DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -24320,7 +24320,7 @@ T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/tea6415c*
 
 TEA6420 MEDIA DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -24629,7 +24629,7 @@ F:	Documentation/devicetree/bindings/iio/temperature/ti,tmp117.yaml
 F:	drivers/iio/temperature/tmp117.c
 
 THANKO'S RAREMONO AM/FM/SW RADIO RECEIVER USB DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -25123,7 +25123,7 @@ F:	include/linux/toshiba.h
 F:	include/uapi/linux/toshiba.h
 
 TOSHIBA TC358743 DRIVER
-M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
@@ -25325,7 +25325,7 @@ S:	Supported
 F:	drivers/media/pci/tw5864/
 
 TW68 VIDEO4LINUX DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 W:	https://linuxtv.org
@@ -26119,7 +26119,7 @@ S:	Maintained
 F:	drivers/net/ethernet/via/via-velocity.*
 
 VICODEC VIRTUAL CODEC DRIVER
-M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
@@ -26424,7 +26424,7 @@ S:	Supported
 F:	drivers/media/test-drivers/visl
 
 VIVID VIRTUAL VIDEO DRIVER
-M:	Hans Verkuil <hverkuil@xs4all.nl>
+M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
-- 
2.47.2


