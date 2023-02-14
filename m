Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0212D695CC7
	for <lists+linux-media@lfdr.de>; Tue, 14 Feb 2023 09:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231888AbjBNIUp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Feb 2023 03:20:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231982AbjBNIUn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 03:20:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEBDC206BF
        for <linux-media@vger.kernel.org>; Tue, 14 Feb 2023 00:20:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 65D7561388
        for <linux-media@vger.kernel.org>; Tue, 14 Feb 2023 08:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D482C433EF
        for <linux-media@vger.kernel.org>; Tue, 14 Feb 2023 08:20:38 +0000 (UTC)
Message-ID: <2d210fee-42d3-00dc-1591-1e70d4d69a84@xs4all.nl>
Date:   Tue, 14 Feb 2023 09:20:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] admin-guide/media/cec.rst: update CEC debugging doc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The documentation on how to create your own Raspberry Pi CEC debugger was a
bit out of date. Update it to the Raspberry Pi 4B, drop the mention of the RTC
and a link to a picture that no longer works.

Also reorganize the text to make it easier to follow and change the pins to
match the pins I use.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/admin-guide/media/cec.rst b/Documentation/admin-guide/media/cec.rst
index 14ec3ff317c2..b046d87b0674 100644
--- a/Documentation/admin-guide/media/cec.rst
+++ b/Documentation/admin-guide/media/cec.rst
@@ -296,34 +296,24 @@ broadcast messages twice to reduce the chance of them being lost. Specifically
 Making a CEC debugger
 =====================

-By using a Raspberry Pi 2B/3/4 and some cheap components you can make
+By using a Raspberry Pi 4B and some cheap components you can make
 your own low-level CEC debugger.

-Here is a picture of my setup:
-
-https://hverkuil.home.xs4all.nl/rpi3-cec.jpg
-
-It's a Raspberry Pi 3 together with a breadboard and some breadboard wires:
-
-http://www.dx.com/p/diy-40p-male-to-female-male-to-male-female-to-female-dupont-line-wire-3pcs-356089#.WYLOOXWGN7I
-
-Finally on of these HDMI female-female passthrough connectors (full soldering type 1):
+The critical component is one of these HDMI female-female passthrough connectors
+(full soldering type 1):

 https://elabbay.myshopify.com/collections/camera/products/hdmi-af-af-v1a-hdmi-type-a-female-to-hdmi-type-a-female-pass-through-adapter-breakout-board?variant=45533926147

-We've tested this and it works up to 4kp30 (297 MHz). The quality is not high
-enough to pass-through 4kp60 (594 MHz).
-
-I also added an RTC and a breakout shield:
-
-https://www.amazon.com/Makerfire%C2%AE-Raspberry-Module-DS1307-Battery/dp/B00ZOXWHK4
+The video quality is variable and certainly not enough to pass-through 4kp60
+(594 MHz) video. You might be able to support 4kp30, but more likely you will
+be limited to 1080p60 (148.5 MHz). But for CEC testing that is fine.

-https://www.dx.com/p/raspberry-pi-gpio-expansion-board-breadboard-easy-multiplexing-board-one-to-three-with-screw-for-raspberry-pi-2-3-b-b-2729992.html#.YGRCG0MzZ7I
+You need a breadboard and some breadboard wires:

-These two are not needed but they make life a bit easier.
+http://www.dx.com/p/diy-40p-male-to-female-male-to-male-female-to-female-dupont-line-wire-3pcs-356089#.WYLOOXWGN7I

-If you want to monitor the HPD line as well, then you need one of these
-level shifters:
+If you want to monitor the HPD and/or 5V lines as well, then you need one of
+these 5V to 3.3V level shifters:

 https://www.adafruit.com/product/757

@@ -331,34 +321,42 @@ https://www.adafruit.com/product/757
 can get similar things).

 The CEC pin of the HDMI connector needs to be connected to these pins:
-CE0/IO8 and CE1/IO7 (pull-up GPIOs). The (optional) HPD pin of the HDMI
-connector should be connected (via a level shifter to convert the 5V
-to 3.3V) to these pins: IO17 and IO27. The (optional) 5V pin of the HDMI
-connector should be connected (via a level shifter) to these pins: IO22
-and IO24. Monitoring the HPD an 5V lines is not necessary, but it is helpful.
+GPIO 6 and GPIO 7. The optional HPD pin of the HDMI connector should
+be connected via the level shifter to these pins: GPIO 23 and GPIO 12.
+The optional 5V pin of the HDMI connector should be connected via the
+level shifter to these pins: GPIO 25 and GPIO 22. Monitoring the HPD and
+5V lines is not necessary, but it is helpful.
+
+This device tree addition in ``arch/arm/boot/dts/bcm2711-rpi-4-b.dts``
+will hook up the cec-gpio driver correctly::

-This kernel patch will hook up the cec-gpio driver correctly to
-e.g. ``arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts``::
+	cec@6 {
+		compatible = "cec-gpio";
+		cec-gpios = <&gpio 6 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		hpd-gpios = <&gpio 23 GPIO_ACTIVE_HIGH>;
+		v5-gpios = <&gpio 25 GPIO_ACTIVE_HIGH>;
+	};

 	cec@7 {
 		compatible = "cec-gpio";
 		cec-gpios = <&gpio 7 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
-		hpd-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;
+		hpd-gpios = <&gpio 12 GPIO_ACTIVE_HIGH>;
 		v5-gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
 	};

-	cec@8 {
-		compatible = "cec-gpio";
-		cec-gpios = <&gpio 8 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
-		hpd-gpios = <&gpio 27 GPIO_ACTIVE_HIGH>;
-		v5-gpios = <&gpio 24 GPIO_ACTIVE_HIGH>;
-	};
+If you haven't hooked up the HPD and/or 5V lines, then just delete those
+lines.

 This dts change will enable two cec GPIO devices: I typically use one to
 send/receive CEC commands and the other to monitor. If you monitor using
 an unconfigured CEC adapter then it will use GPIO interrupts which makes
 monitoring very accurate.

+If you just want to monitor traffic, then a single instance is sufficient.
+The minimum configuration is one HDMI female-female passthrough connector
+and connecting the CEC pin to GPIO 6 on the Raspberry Pi using a single
+female-female breadboard wire.
+
 The documentation on how to use the error injection is here: :ref:`cec_pin_error_inj`.

 ``cec-ctl --monitor-pin`` will do low-level CEC bus sniffing and analysis.
