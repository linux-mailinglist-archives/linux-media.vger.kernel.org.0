Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46EF0366D6F
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 16:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243159AbhDUOAk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 10:00:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:36592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242839AbhDUOAj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 10:00:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE71861439;
        Wed, 21 Apr 2021 14:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619013606;
        bh=MRJppitnq6dhJY+77vaI7kdtl+V9plz96L6RtPNmR4M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jAe1nam4DpUEMLSbVrZsbbCtVTIYviHcO8V1hst0ABT06/9NNtvvtNkELq6mlZHDa
         WWndglJ+nJJFztNvPHwlzgv4dxS+jqTmbx6VRou7UDC54LomF3dJhzKO56GRBa5D80
         hbbWgRKWfXUHpZTPrPMLR6cC0gXZN2uxgMIjpGbVLh9/j3T0zKqpA6CONSKhKFbXde
         ou2SCQw/f8uJoG+95RAl3nFINJsXPrQsP+6xLOksxnJNhrVzlLagS3cDezyL4xUGdx
         oriwUY/5E/f650HduHhkZrdQrG/wV2LDAnJosxez7nUI4LDkbebHDpEDeopeS562bI
         KoWGjHRRXdBkA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: rc: clean up Kconfig dependencies
Date:   Wed, 21 Apr 2021 15:58:41 +0200
Message-Id: <20210421135935.3653827-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210421135935.3653827-1-arnd@kernel.org>
References: <20210421135935.3653827-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

I came across a randconfig build failure from one driver
that only depends on CONFIG_USB_ARCH_HAS_HCD but fails when
built without CONFIG_USB:

ld: drivers/media/rc/ir_toy.o: in function `irtoy_disconnect':
ir_toy.c:(.text+0x24): undefined reference to `usb_kill_urb'
ld: ir_toy.c:(.text+0x2c): undefined reference to `usb_free_urb'
ld: ir_toy.c:(.text+0x34): undefined reference to `usb_kill_urb'
ld: ir_toy.c:(.text+0x3c): undefined reference to `usb_free_urb'

Upon a closer look, I find that a lot of the other drivers
'select USB' rather than stating 'depends on USB' as is common
for most subsystems. I also find that all except one driver
have an extra 'depends on RC_CORE' that is already implied by
the top-level 'if RC_CORE' check.

Clean up both by reducing the dependencies to the required set.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/rc/Kconfig | 73 ++++++----------------------------------
 1 file changed, 11 insertions(+), 62 deletions(-)

diff --git a/drivers/media/rc/Kconfig b/drivers/media/rc/Kconfig
index ae0025fba21c..d0a8326b75c2 100644
--- a/drivers/media/rc/Kconfig
+++ b/drivers/media/rc/Kconfig
@@ -19,7 +19,6 @@ source "drivers/media/rc/keymaps/Kconfig"
 
 config LIRC
 	bool "LIRC user interface"
-	depends on RC_CORE
 	help
 	   Enable this option to enable the Linux Infrared Remote
 	   Control user interface (e.g. /dev/lirc*). This interface
@@ -41,12 +40,10 @@ config BPF_LIRC_MODE2
 
 menuconfig RC_DECODERS
 	bool "Remote controller decoders"
-	depends on RC_CORE
 
 if RC_DECODERS
 config IR_NEC_DECODER
 	tristate "Enable IR raw decoder for the NEC protocol"
-	depends on RC_CORE
 	select BITREVERSE
 
 	help
@@ -55,7 +52,6 @@ config IR_NEC_DECODER
 
 config IR_RC5_DECODER
 	tristate "Enable IR raw decoder for the RC-5 protocol"
-	depends on RC_CORE
 	select BITREVERSE
 
 	help
@@ -64,7 +60,6 @@ config IR_RC5_DECODER
 
 config IR_RC6_DECODER
 	tristate "Enable IR raw decoder for the RC6 protocol"
-	depends on RC_CORE
 	select BITREVERSE
 
 	help
@@ -73,7 +68,6 @@ config IR_RC6_DECODER
 
 config IR_JVC_DECODER
 	tristate "Enable IR raw decoder for the JVC protocol"
-	depends on RC_CORE
 	select BITREVERSE
 
 	help
@@ -82,7 +76,6 @@ config IR_JVC_DECODER
 
 config IR_SONY_DECODER
 	tristate "Enable IR raw decoder for the Sony protocol"
-	depends on RC_CORE
 	select BITREVERSE
 
 	help
@@ -91,7 +84,6 @@ config IR_SONY_DECODER
 
 config IR_SANYO_DECODER
 	tristate "Enable IR raw decoder for the Sanyo protocol"
-	depends on RC_CORE
 	select BITREVERSE
 
 	help
@@ -101,7 +93,6 @@ config IR_SANYO_DECODER
 
 config IR_SHARP_DECODER
 	tristate "Enable IR raw decoder for the Sharp protocol"
-	depends on RC_CORE
 	select BITREVERSE
 
 	help
@@ -111,7 +102,6 @@ config IR_SHARP_DECODER
 
 config IR_MCE_KBD_DECODER
 	tristate "Enable IR raw decoder for the MCE keyboard/mouse protocol"
-	depends on RC_CORE
 	select BITREVERSE
 
 	help
@@ -121,7 +111,6 @@ config IR_MCE_KBD_DECODER
 
 config IR_XMP_DECODER
 	tristate "Enable IR raw decoder for the XMP protocol"
-	depends on RC_CORE
 	select BITREVERSE
 
 	help
@@ -130,7 +119,6 @@ config IR_XMP_DECODER
 
 config IR_IMON_DECODER
 	tristate "Enable IR raw decoder for the iMON protocol"
-	depends on RC_CORE
 	help
 	   Enable this option if you have iMON PAD or Antec Veris infrared
 	   remote control and you would like to use it with a raw IR
@@ -138,7 +126,6 @@ config IR_IMON_DECODER
 
 config IR_RCMM_DECODER
 	tristate "Enable IR raw decoder for the RC-MM protocol"
-	depends on RC_CORE
 	help
 	   Enable this option when you have IR with RC-MM protocol, and
 	   you need the software decoder. The driver supports 12,
@@ -153,15 +140,12 @@ endif #RC_DECODERS
 
 menuconfig RC_DEVICES
 	bool "Remote Controller devices"
-	depends on RC_CORE
 
 if RC_DEVICES
 
 config RC_ATI_REMOTE
 	tristate "ATI / X10 based USB RF remote controls"
-	depends on USB_ARCH_HAS_HCD
-	depends on RC_CORE
-	select USB
+	depends on USB
 	help
 	   Say Y here if you want to use an X10 based USB remote control.
 	   These are RF remotes with USB receivers.
@@ -179,7 +163,6 @@ config RC_ATI_REMOTE
 config IR_ENE
 	tristate "ENE eHome Receiver/Transceiver (pnp id: ENE0100/ENE02xxx)"
 	depends on PNP || COMPILE_TEST
-	depends on RC_CORE
 	help
 	   Say Y here to enable support for integrated infrared receiver
 	   /transceiver made by ENE.
@@ -192,7 +175,6 @@ config IR_ENE
 
 config IR_HIX5HD2
 	tristate "Hisilicon hix5hd2 IR remote control"
-	depends on RC_CORE
 	depends on OF || COMPILE_TEST
 	help
 	   Say Y here if you want to use hisilicon hix5hd2 remote control.
@@ -203,9 +185,7 @@ config IR_HIX5HD2
 
 config IR_IMON
 	tristate "SoundGraph iMON Receiver and Display"
-	depends on USB_ARCH_HAS_HCD
-	depends on RC_CORE
-	select USB
+	depends on USB
 	help
 	   Say Y here if you want to use a SoundGraph iMON (aka Antec Veris)
 	   IR Receiver and/or LCD/VFD/VGA display.
@@ -215,9 +195,7 @@ config IR_IMON
 
 config IR_IMON_RAW
 	tristate "SoundGraph iMON Receiver (early raw IR models)"
-	depends on USB_ARCH_HAS_HCD
-	depends on RC_CORE
-	select USB
+	depends on USB
 	help
 	   Say Y here if you want to use a SoundGraph iMON IR Receiver,
 	   early raw models.
@@ -227,9 +205,7 @@ config IR_IMON_RAW
 
 config IR_MCEUSB
 	tristate "Windows Media Center Ed. eHome Infrared Transceiver"
-	depends on USB_ARCH_HAS_HCD
-	depends on RC_CORE
-	select USB
+	depends on USB
 	help
 	   Say Y here if you want to use a Windows Media Center Edition
 	   eHome Infrared Transceiver.
@@ -240,7 +216,6 @@ config IR_MCEUSB
 config IR_ITE_CIR
 	tristate "ITE Tech Inc. IT8712/IT8512 Consumer Infrared Transceiver"
 	depends on PNP || COMPILE_TEST
-	depends on RC_CORE
 	help
 	   Say Y here to enable support for integrated infrared receivers
 	   /transceivers made by ITE Tech Inc. These are found in
@@ -253,7 +228,6 @@ config IR_ITE_CIR
 config IR_FINTEK
 	tristate "Fintek Consumer Infrared Transceiver"
 	depends on PNP || COMPILE_TEST
-	depends on RC_CORE
 	help
 	   Say Y here to enable support for integrated infrared receiver
 	   /transceiver made by Fintek. This chip is found on assorted
@@ -264,7 +238,6 @@ config IR_FINTEK
 
 config IR_MESON
 	tristate "Amlogic Meson IR remote receiver"
-	depends on RC_CORE
 	depends on ARCH_MESON || COMPILE_TEST
 	help
 	   Say Y if you want to use the IR remote receiver available
@@ -275,7 +248,6 @@ config IR_MESON
 
 config IR_MTK
 	tristate "Mediatek IR remote receiver"
-	depends on RC_CORE
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	help
 	   Say Y if you want to use the IR remote receiver available
@@ -287,7 +259,6 @@ config IR_MTK
 config IR_NUVOTON
 	tristate "Nuvoton w836x7hg Consumer Infrared Transceiver"
 	depends on PNP || COMPILE_TEST
-	depends on RC_CORE
 	help
 	   Say Y here to enable support for integrated infrared receiver
 	   /transceiver made by Nuvoton (formerly Winbond). This chip is
@@ -299,11 +270,9 @@ config IR_NUVOTON
 
 config IR_REDRAT3
 	tristate "RedRat3 IR Transceiver"
-	depends on USB_ARCH_HAS_HCD
-	depends on RC_CORE
+	depends on USB
 	select NEW_LEDS
 	select LEDS_CLASS
-	select USB
 	help
 	   Say Y here if you want to use a RedRat3 Infrared Transceiver.
 
@@ -322,9 +291,7 @@ config IR_SPI
 
 config IR_STREAMZAP
 	tristate "Streamzap PC Remote IR Receiver"
-	depends on USB_ARCH_HAS_HCD
-	depends on RC_CORE
-	select USB
+	depends on USB
 	help
 	   Say Y here if you want to use a Streamzap PC Remote
 	   Infrared Receiver.
@@ -335,7 +302,6 @@ config IR_STREAMZAP
 config IR_WINBOND_CIR
 	tristate "Winbond IR remote control"
 	depends on (X86 && PNP) || COMPILE_TEST
-	depends on RC_CORE
 	select NEW_LEDS
 	select LEDS_CLASS
 	select BITREVERSE
@@ -350,9 +316,7 @@ config IR_WINBOND_CIR
 
 config IR_IGORPLUGUSB
 	tristate "IgorPlug-USB IR Receiver"
-	depends on USB_ARCH_HAS_HCD
-	depends on RC_CORE
-	select USB
+	depends on USB
 	help
 	   Say Y here if you want to use the IgorPlug-USB IR Receiver by
 	   Igor Cesko. This device is included on the Fit-PC2.
@@ -365,9 +329,7 @@ config IR_IGORPLUGUSB
 
 config IR_IGUANA
 	tristate "IguanaWorks USB IR Transceiver"
-	depends on USB_ARCH_HAS_HCD
-	depends on RC_CORE
-	select USB
+	depends on USB
 	help
 	   Say Y here if you want to use the IguanaWorks USB IR Transceiver.
 	   Both infrared receive and send are supported. If you want to
@@ -381,9 +343,7 @@ config IR_IGUANA
 
 config IR_TTUSBIR
 	tristate "TechnoTrend USB IR Receiver"
-	depends on USB_ARCH_HAS_HCD
-	depends on RC_CORE
-	select USB
+	depends on USB
 	select NEW_LEDS
 	select LEDS_CLASS
 	help
@@ -407,7 +367,6 @@ source "drivers/media/rc/img-ir/Kconfig"
 
 config RC_LOOPBACK
 	tristate "Remote Control Loopback Driver"
-	depends on RC_CORE
 	help
 	   Say Y here if you want support for the remote control loopback
 	   driver which allows TX data to be sent back as RX data.
@@ -420,7 +379,6 @@ config RC_LOOPBACK
 
 config IR_GPIO_CIR
 	tristate "GPIO IR remote control"
-	depends on RC_CORE
 	depends on (OF && GPIOLIB) || COMPILE_TEST
 	help
 	   Say Y if you want to use GPIO based IR Receiver.
@@ -430,7 +388,6 @@ config IR_GPIO_CIR
 
 config IR_GPIO_TX
 	tristate "GPIO IR Bit Banging Transmitter"
-	depends on RC_CORE
 	depends on LIRC
 	depends on (OF && GPIOLIB) || COMPILE_TEST
 	help
@@ -442,7 +399,6 @@ config IR_GPIO_TX
 
 config IR_PWM_TX
 	tristate "PWM IR transmitter"
-	depends on RC_CORE
 	depends on LIRC
 	depends on PWM
 	depends on OF || COMPILE_TEST
@@ -455,7 +411,6 @@ config IR_PWM_TX
 
 config RC_ST
 	tristate "ST remote control receiver"
-	depends on RC_CORE
 	depends on ARCH_STI || COMPILE_TEST
 	help
 	   Say Y here if you want support for ST remote control driver
@@ -466,7 +421,6 @@ config RC_ST
 
 config IR_SUNXI
 	tristate "SUNXI IR remote control"
-	depends on RC_CORE
 	depends on ARCH_SUNXI || COMPILE_TEST
 	help
 	   Say Y if you want to use sunXi internal IR Controller
@@ -476,7 +430,6 @@ config IR_SUNXI
 
 config IR_SERIAL
 	tristate "Homebrew Serial Port Receiver"
-	depends on RC_CORE
 	help
 	   Say Y if you want to use Homebrew Serial Port Receivers and
 	   Transceivers.
@@ -492,7 +445,6 @@ config IR_SERIAL_TRANSMITTER
 
 config IR_SIR
 	tristate "Built-in SIR IrDA port"
-	depends on RC_CORE
 	help
 	   Say Y if you want to use a IrDA SIR port Transceivers.
 
@@ -501,9 +453,7 @@ config IR_SIR
 
 config RC_XBOX_DVD
 	tristate "Xbox DVD Movie Playback Kit"
-	depends on RC_CORE
-	depends on USB_ARCH_HAS_HCD
-	select USB
+	depends on USB
 	help
 	   Say Y here if you want to use the Xbox DVD Movie Playback Kit.
 	   These are IR remotes with USB receivers for the Original Xbox (2001).
@@ -513,8 +463,7 @@ config RC_XBOX_DVD
 
 config IR_TOY
 	tristate "Infrared Toy and IR Droid"
-	depends on RC_CORE
-	depends on USB_ARCH_HAS_HCD
+	depends on USB
 	help
 	   Say Y here if you want to use the Infrared Toy or IR Droid, USB
 	   versions.
-- 
2.29.2

