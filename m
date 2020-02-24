Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E353216B425
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2020 23:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727520AbgBXWgH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Feb 2020 17:36:07 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:41918 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgBXWgH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Feb 2020 17:36:07 -0500
Received: by mail-qk1-f195.google.com with SMTP id b5so3088951qkh.8
        for <linux-media@vger.kernel.org>; Mon, 24 Feb 2020 14:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=YGKm8j6kzzt6cj98Y900BzukBQh2ZQfkDcKpSbnNfog=;
        b=evcJnC3ag9p6y+Xz5p+Cv9ekOjfXjMu58P8lEjfd/aqg5d+JiDAxNPHYJuAJsIhR9Q
         jG7glm7cAny457yzoqiywGAsVbMyaC6M3WshrGZRr5dnNCSZAEabQ0I019STtNcEnmWp
         653fhc3kH4JSwokFE87H9RSwK7/28svEVwuKcTgoaJtay1EEAMLi5r0IUKBOFrASzTAu
         jAONdlFoNuZgeRqK8dJcCSY0amSgiOVK8HcxLf8OiYb1um4QSCnIrfvW38sDD5LfLAN5
         hXrCoxvh2ZGG6w0bdTuKcxsEWeFihf2FXz+OyWDeALZbteDQF6WmPe9z1QCLtG5fm5Mt
         s6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=YGKm8j6kzzt6cj98Y900BzukBQh2ZQfkDcKpSbnNfog=;
        b=UcA0MF5JznRURUCmKWHj7XLLeGhl+vc4zfORjuyQLVdNE5mjXioFTmQU8ZwatJUp3L
         993bKwT9shlnI86Lp5cx4MC7PvVMyjjYEqksKej1kZNyyLHuFnTpE189piu5vEtZD9KO
         Ii5rtDmICJAvWic2vDyOo1mSjGiruzcrjVZTBedZKy6KD7MPHReo9fdQA8dP8qxQz+t6
         4ysWMs6Mrzh/ZODpa2EF70cIY6yPoI/xGyg+nSygygMD/9ZLMajRQgi/h+cLzH0HJJg0
         X8GV1kubWyDNgjk/GhajxkpIkBL+hxBG7qucbrFaZt4QnpctnBaGuTHnxoxGwCeIIjlG
         BKoQ==
X-Gm-Message-State: APjAAAWTOYJQlKhYibMj197E6CwQWsoNPN+tSH1virnZ5th91a+Cf/Do
        Aw0VUbVLQgr73uJTxEtz/WfPFIg/PXzYe3HA0Z0=
X-Google-Smtp-Source: APXvYqwsFXwvlH/3ktG99jExMqFeGLQWK4HTYnvIbwmY5PjFGF/S66tCR+f0+LSq8g/F7BFRPhvisHs2BnopProEyDk=
X-Received: by 2002:a05:620a:1458:: with SMTP id i24mr11375372qkl.435.1582583765623;
 Mon, 24 Feb 2020 14:36:05 -0800 (PST)
MIME-Version: 1.0
From:   Ian Kumlien <ian.kumlien@gmail.com>
Date:   Mon, 24 Feb 2020 23:35:54 +0100
Message-ID: <CAA85sZu_5=mP2zn2h_8aY+n=UM+fXOKgym9yNAvwxcc+6R_-jA@mail.gmail.com>
Subject: [RFC] Buildfailure due to mising "select REGMAP_I2C"
To:     hverkuil-cisco@xs4all.nl, petrcvekcz@gmail.com,
        sakari.ailus@linux.intel.com,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        leonl@leopardimaging.com
Cc:     linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000002d85ac059f59ff1c"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--0000000000002d85ac059f59ff1c
Content-Type: text/plain; charset="UTF-8"

Hi,

I got surprised by:
ld: drivers/media/i2c/tvp5150.o: in function `tvp5150_probe':
tvp5150.c:(.text+0x11ac): undefined reference to `__devm_regmap_init_i2c'
make: *** [Makefile:1078: vmlinux] Error 1

When going from 5.5.2 -> 5.5.6

A quick git grep shows that something like this might be needed, but
it should be verified.
I'm really uncertain about the ones that say REGMAP_SCCB...

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index c68e002d26ea..fc40c111f461 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -238,6 +238,7 @@ config VIDEO_ADV7604
        tristate "Analog Devices ADV7604 decoder"
        depends on VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
        depends on GPIOLIB || COMPILE_TEST
+       select REGMAP_I2C
        select HDMI
        select V4L2_FWNODE
        help
@@ -379,6 +380,7 @@ config VIDEO_TVP5150
        tristate "Texas Instruments TVP5150 video decoder"
        depends on VIDEO_V4L2 && I2C
        select V4L2_FWNODE
+       select REGMAP_I2C
        help
          Support for the Texas Instruments TVP5150 video decoder.

@@ -584,6 +586,7 @@ config VIDEO_IMX214
        tristate "Sony IMX214 sensor support"
        depends on GPIOLIB && I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
        depends on V4L2_FWNODE
+       select REGMAP_I2C
        help
          This is a Video4Linux2 sensor driver for the Sony
          IMX214 camera.
@@ -612,6 +615,7 @@ config VIDEO_IMX274
 config VIDEO_IMX290
        tristate "Sony IMX290 sensor support"
        depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+       select REGMAP_I2C
        select V4L2_FWNODE
        help
          This is a Video4Linux2 sensor driver for the Sony
@@ -774,6 +778,7 @@ config VIDEO_OV7251
 config VIDEO_OV772X
        tristate "OmniVision OV772x sensor support"
        depends on I2C && VIDEO_V4L2
+       select REGMAP_I2C
        select REGMAP_SCCB
        help
          This is a Video4Linux2 sensor driver for the OmniVision
@@ -804,6 +809,7 @@ config VIDEO_OV7670
 config VIDEO_OV7740
        tristate "OmniVision OV7740 sensor support"
        depends on I2C && VIDEO_V4L2
+       select REGMAP_I2C
        help
          This is a Video4Linux2 sensor driver for the OmniVision
          OV7740 VGA camera sensor.
@@ -829,6 +835,7 @@ config VIDEO_OV9640
 config VIDEO_OV9650
        tristate "OmniVision OV9650/OV9652 sensor support"
        depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+       select REGMAP_I2C
        select REGMAP_SCCB
        help
          This is a V4L2 sensor driver for the Omnivision

--0000000000002d85ac059f59ff1c
Content-Type: text/x-patch; charset="US-ASCII"; name="rfc-select-regmap_i2c.diff"
Content-Disposition: attachment; filename="rfc-select-regmap_i2c.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_k7115m3z0>
X-Attachment-Id: f_k7115m3z0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL0tjb25maWcgYi9kcml2ZXJzL21lZGlhL2ky
Yy9LY29uZmlnCmluZGV4IGM2OGUwMDJkMjZlYS4uZmM0MGMxMTFmNDYxIDEwMDY0NAotLS0gYS9k
cml2ZXJzL21lZGlhL2kyYy9LY29uZmlnCisrKyBiL2RyaXZlcnMvbWVkaWEvaTJjL0tjb25maWcK
QEAgLTIzOCw2ICsyMzgsNyBAQCBjb25maWcgVklERU9fQURWNzYwNAogCXRyaXN0YXRlICJBbmFs
b2cgRGV2aWNlcyBBRFY3NjA0IGRlY29kZXIiCiAJZGVwZW5kcyBvbiBWSURFT19WNEwyICYmIEky
QyAmJiBWSURFT19WNEwyX1NVQkRFVl9BUEkKIAlkZXBlbmRzIG9uIEdQSU9MSUIgfHwgQ09NUElM
RV9URVNUCisJc2VsZWN0IFJFR01BUF9JMkMKIAlzZWxlY3QgSERNSQogCXNlbGVjdCBWNEwyX0ZX
Tk9ERQogCWhlbHAKQEAgLTM3OSw2ICszODAsNyBAQCBjb25maWcgVklERU9fVFZQNTE1MAogCXRy
aXN0YXRlICJUZXhhcyBJbnN0cnVtZW50cyBUVlA1MTUwIHZpZGVvIGRlY29kZXIiCiAJZGVwZW5k
cyBvbiBWSURFT19WNEwyICYmIEkyQwogCXNlbGVjdCBWNEwyX0ZXTk9ERQorCXNlbGVjdCBSRUdN
QVBfSTJDCiAJaGVscAogCSAgU3VwcG9ydCBmb3IgdGhlIFRleGFzIEluc3RydW1lbnRzIFRWUDUx
NTAgdmlkZW8gZGVjb2Rlci4KIApAQCAtNTg0LDYgKzU4Niw3IEBAIGNvbmZpZyBWSURFT19JTVgy
MTQKIAl0cmlzdGF0ZSAiU29ueSBJTVgyMTQgc2Vuc29yIHN1cHBvcnQiCiAJZGVwZW5kcyBvbiBH
UElPTElCICYmIEkyQyAmJiBWSURFT19WNEwyICYmIFZJREVPX1Y0TDJfU1VCREVWX0FQSQogCWRl
cGVuZHMgb24gVjRMMl9GV05PREUKKwlzZWxlY3QgUkVHTUFQX0kyQwogCWhlbHAKIAkgIFRoaXMg
aXMgYSBWaWRlbzRMaW51eDIgc2Vuc29yIGRyaXZlciBmb3IgdGhlIFNvbnkKIAkgIElNWDIxNCBj
YW1lcmEuCkBAIC02MTIsNiArNjE1LDcgQEAgY29uZmlnIFZJREVPX0lNWDI3NAogY29uZmlnIFZJ
REVPX0lNWDI5MAogCXRyaXN0YXRlICJTb255IElNWDI5MCBzZW5zb3Igc3VwcG9ydCIKIAlkZXBl
bmRzIG9uIEkyQyAmJiBWSURFT19WNEwyICYmIFZJREVPX1Y0TDJfU1VCREVWX0FQSQorCXNlbGVj
dCBSRUdNQVBfSTJDCiAJc2VsZWN0IFY0TDJfRldOT0RFCiAJaGVscAogCSAgVGhpcyBpcyBhIFZp
ZGVvNExpbnV4MiBzZW5zb3IgZHJpdmVyIGZvciB0aGUgU29ueQpAQCAtNzc0LDYgKzc3OCw3IEBA
IGNvbmZpZyBWSURFT19PVjcyNTEKIGNvbmZpZyBWSURFT19PVjc3MlgKIAl0cmlzdGF0ZSAiT21u
aVZpc2lvbiBPVjc3Mnggc2Vuc29yIHN1cHBvcnQiCiAJZGVwZW5kcyBvbiBJMkMgJiYgVklERU9f
VjRMMgorCXNlbGVjdCBSRUdNQVBfSTJDCiAJc2VsZWN0IFJFR01BUF9TQ0NCCiAJaGVscAogCSAg
VGhpcyBpcyBhIFZpZGVvNExpbnV4MiBzZW5zb3IgZHJpdmVyIGZvciB0aGUgT21uaVZpc2lvbgpA
QCAtODA0LDYgKzgwOSw3IEBAIGNvbmZpZyBWSURFT19PVjc2NzAKIGNvbmZpZyBWSURFT19PVjc3
NDAKIAl0cmlzdGF0ZSAiT21uaVZpc2lvbiBPVjc3NDAgc2Vuc29yIHN1cHBvcnQiCiAJZGVwZW5k
cyBvbiBJMkMgJiYgVklERU9fVjRMMgorCXNlbGVjdCBSRUdNQVBfSTJDCiAJaGVscAogCSAgVGhp
cyBpcyBhIFZpZGVvNExpbnV4MiBzZW5zb3IgZHJpdmVyIGZvciB0aGUgT21uaVZpc2lvbgogCSAg
T1Y3NzQwIFZHQSBjYW1lcmEgc2Vuc29yLgpAQCAtODI5LDYgKzgzNSw3IEBAIGNvbmZpZyBWSURF
T19PVjk2NDAKIGNvbmZpZyBWSURFT19PVjk2NTAKIAl0cmlzdGF0ZSAiT21uaVZpc2lvbiBPVjk2
NTAvT1Y5NjUyIHNlbnNvciBzdXBwb3J0IgogCWRlcGVuZHMgb24gSTJDICYmIFZJREVPX1Y0TDIg
JiYgVklERU9fVjRMMl9TVUJERVZfQVBJCisJc2VsZWN0IFJFR01BUF9JMkMKIAlzZWxlY3QgUkVH
TUFQX1NDQ0IKIAloZWxwCiAJICBUaGlzIGlzIGEgVjRMMiBzZW5zb3IgZHJpdmVyIGZvciB0aGUg
T21uaXZpc2lvbgo=
--0000000000002d85ac059f59ff1c--
