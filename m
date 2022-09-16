Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6795BAFFC
	for <lists+linux-media@lfdr.de>; Fri, 16 Sep 2022 17:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbiIPPMg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Sep 2022 11:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbiIPPMf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Sep 2022 11:12:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DE6A9C3C
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 08:12:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4481362C6D
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 15:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29672C433C1
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 15:12:30 +0000 (UTC)
Message-ID: <174a8499-e878-c35b-94f7-83478f02562f@xs4all.nl>
Date:   Fri, 16 Sep 2022 16:12:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
To:     linux-media@vger.kernel.org
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2] media: admin-guide: cec.rst
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document administration details about CEC devices. This was formerly
documented in a cec-status.txt I kept on my website, but this really
belongs here as an admin guide.

Updated the original cec-status.txt, and converted it to .rst.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Change since v1:
Update MAINTAINERS as well since pulse8-cec.rst has been removed.
---
  .../admin-guide/media/cec-drivers.rst         |  10 -
  Documentation/admin-guide/media/cec.rst       | 367 ++++++++++++++++++
  Documentation/admin-guide/media/index.rst     |   3 +-
  .../admin-guide/media/pulse8-cec.rst          |  13 -
  .../media/cec/cec-pin-error-inj.rst           |   2 +
  MAINTAINERS                                   |   1 -
  6 files changed, 371 insertions(+), 25 deletions(-)
  delete mode 100644 Documentation/admin-guide/media/cec-drivers.rst
  create mode 100644 Documentation/admin-guide/media/cec.rst
  delete mode 100644 Documentation/admin-guide/media/pulse8-cec.rst

diff --git a/Documentation/admin-guide/media/cec-drivers.rst 
b/Documentation/admin-guide/media/cec-drivers.rst
deleted file mode 100644
index 8d9686c08df9..000000000000
--- a/Documentation/admin-guide/media/cec-drivers.rst
+++ /dev/null
@@ -1,10 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0
-
-=================================
-CEC driver-specific documentation
-=================================
-
-.. toctree::
-	:maxdepth: 2
-
-	pulse8-cec
diff --git a/Documentation/admin-guide/media/cec.rst 
b/Documentation/admin-guide/media/cec.rst
new file mode 100644
index 000000000000..fd681f9405ea
--- /dev/null
+++ b/Documentation/admin-guide/media/cec.rst
@@ -0,0 +1,367 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========
+HDMI CEC
+========
+
+Supported hardware in mainline
+==============================
+
+HDMI Transmitters:
+
+- Exynos4
+- Exynos5
+- STIH4xx HDMI CEC
+- V4L2 adv7511 (same HW, but a different driver from the drm adv7511)
+- stm32
+- Allwinner A10 (sun4i)
+- Raspberry Pi
+- dw-hdmi (Synopsis IP)
+- amlogic (meson ao-cec and ao-cec-g12a)
+- drm adv7511/adv7533
+- omap4
+- tegra
+- rk3288, rk3399
+- tda998x
+- DisplayPort CEC-Tunneling-over-AUX on i915, nouveau and amdgpu
+- ChromeOS EC CEC
+- CEC for SECO boards (UDOO x86).
+- Chrontel CH7322
+
+
+HDMI Receivers:
+
+- adv7604/11/12
+- adv7842
+- tc358743
+
+USB Dongles (see below for additional information on how to use these
+dongles):
+
+- Pulse-Eight: the pulse8-cec driver implements the following module 
option:
+  ``persistent_config``: by default this is off, but when set to 1 the 
driver
+  will store the current settings to the device's internal eeprom and 
restore
+  it the next time the device is connected to the USB port.
+- RainShadow Tech. Note: this driver does not support the persistent_config
+  module option of the Pulse-Eight driver. The hardware supports it, but I
+  have no plans to add this feature. But I accept patches :-)
+
+Miscellaneous:
+
+- vivid: emulates a CEC receiver and CEC transmitter.
+  Can be used to test CEC applications without actual CEC hardware.
+
+- cec-gpio. If the CEC pin is hooked up to a GPIO pin then
+  you can control the CEC line through this driver. This supports error
+  injection as well.
+
+
+Utilities
+=========
+
+Utilities are available here: https://git.linuxtv.org/v4l-utils.git
+
+``utils/cec-ctl``: control a CEC device
+
+``utils/cec-compliance``: test compliance of a remote CEC device
+
+``utils/cec-follower``: emulate a CEC follower device
+
+Note that ``cec-ctl`` has support for the CEC Hospitality Profile as is
+used in some hotel displays. See http://www.htng.org.
+
+Note that the libcec library (https://github.com/Pulse-Eight/libcec) 
supports
+the linux CEC framework.
+
+If you want to get the CEC specification, then look at the References of
+the HDMI wikipedia page: https://en.wikipedia.org/wiki/HDMI. CEC is part
+of the HDMI specification. HDMI 1.3 is freely available (very similar to
+HDMI 1.4 w.r.t. CEC) and should be good enough for most things.
+
+
+DisplayPort to HDMI Adapters with working CEC
+=============================================
+
+Background: most adapters do not support the CEC Tunneling feature,
+and of those that do many did not actually connect the CEC pin.
+Unfortunately, this means that while a CEC device is created, it
+is actually all alone in the world and will never be able to see other
+CEC devices.
+
+This is a list of known working adapters that have CEC Tunneling AND
+that properly connected the CEC pin. If you find adapters that work
+but are not in this list, then drop me a note.
+
+To test: hook up your DP-to-HDMI adapter to a CEC capable device
+(typically a TV), then run::
+
+	cec-ctl --playback	# Configure the PC as a CEC Playback device
+	cec-ctl -S		# Show the CEC topology
+
+The ``cec-ctl -S`` command should show at least two CEC devices,
+ourselves and the CEC device you are connected to (i.e. typically the TV).
+
+General note: I have only seen this work with the Parade PS175, PS176 and
+PS186 chipsets and the MegaChips 2900. While MegaChips 28x0 claims CEC 
support,
+I have never seen it work.
+
+USB-C to HDMI
+-------------
+
+Samsung Multiport Adapter EE-PW700: 
https://www.samsung.com/ie/support/model/EE-PW700BBEGWW/
+
+Kramer ADC-U31C/HF: https://www.kramerav.com/product/ADC-U31C/HF
+
+Club3D CAC-2504: 
https://www.club-3d.com/en/detail/2449/usb_3.1_type_c_to_hdmi_2.0_uhd_4k_60hz_active_adapter/
+
+DisplayPort to HDMI
+-------------------
+
+Club3D CAC-1080: 
https://www.club-3d.com/en/detail/2442/displayport_1.4_to_hdmi_2.0b_hdr/
+
+CableCreation (SKU: CD0712): 
https://www.cablecreation.com/products/active-displayport-to-hdmi-adapter-4k-hdr
+
+Mini-DisplayPort to HDMI
+------------------------
+
+Club3D CAC-1180: 
https://www.club-3d.com/en/detail/2443/mini_displayport_1.4_to_hdmi_2.0b_hdr/
+
+Note that passive adapters will never work, you need an active adapter.
+
+The Club3D adapters in this list are all MegaChips 2900 based. Other 
Club3D adapters
+are PS176 based and do NOT have the CEC pin hooked up, so only the 
three Club3D
+adapters above are known to work.
+
+I suspect that MegaChips 2900 based designs in general are likely to work
+whereas with the PS176 it is more hit-and-miss (mostly miss). The PS186 is
+likely to have the CEC pin hooked up, it looks like they changed the 
reference
+design for that chipset.
+
+
+USB CEC Dongles
+===============
+
+These dongles appear as ``/dev/ttyACMX`` devices and need the 
``inputattach``
+utility to create the ``/dev/cecX`` devices. Support for the Pulse-Eight
+has been added to ``inputattach`` 1.6.0. Support for the Rainshadow 
Tech has
+been added to ``inputattach`` 1.6.1.
+
+You also need udev rules to automatically start systemd services::
+
+	SUBSYSTEM=="tty", KERNEL=="ttyACM[0-9]*", ATTRS{idVendor}=="2548", 
ATTRS{idProduct}=="1002", ACTION=="add", TAG+="systemd", 
ENV{SYSTEMD_WANTS}+="pulse8-cec-inputattach@%k.service"
+	SUBSYSTEM=="tty", KERNEL=="ttyACM[0-9]*", ATTRS{idVendor}=="2548", 
ATTRS{idProduct}=="1001", ACTION=="add", TAG+="systemd", 
ENV{SYSTEMD_WANTS}+="pulse8-cec-inputattach@%k.service"
+	SUBSYSTEM=="tty", KERNEL=="ttyACM[0-9]*", ATTRS{idVendor}=="04d8", 
ATTRS{idProduct}=="ff59", ACTION=="add", TAG+="systemd", 
ENV{SYSTEMD_WANTS}+="rainshadow-cec-inputattach@%k.service"
+
+and these systemd services:
+
+For Pulse-Eight make /lib/systemd/system/pulse8-cec-inputattach@.service::
+
+	[Unit]
+	Description=inputattach for pulse8-cec device on %I
+
+	[Service]
+	Type=simple
+	ExecStart=/usr/bin/inputattach --pulse8-cec /dev/%I
+
+For the RainShadow Tech make 
/lib/systemd/system/rainshadow-cec-inputattach@.service::
+
+	[Unit]
+	Description=inputattach for rainshadow-cec device on %I
+
+	[Service]
+	Type=simple
+	ExecStart=/usr/bin/inputattach --rainshadow-cec /dev/%I
+
+
+For proper suspend/resume support create: 
/lib/systemd/system/restart-cec-inputattach.service::
+
+	[Unit]
+	Description=restart inputattach for cec devices
+	After=suspend.target
+
+	[Service]
+	Type=forking
+	ExecStart=/bin/bash -c 'for d in /dev/serial/by-id/usb-Pulse-Eight*; 
do /usr/bin/inputattach --daemon --pulse8-cec $d; done; for d in 
/dev/serial/by-id/usb-RainShadow_Tech*; do /usr/bin/inputattach --daemon 
--rainshadow-cec $d; done'
+
+	[Install]
+	WantedBy=suspend.target
+
+And run ``systemctl enable restart-cec-inputattach``.
+
+To automatically set the physical address of the CEC device whenever the
+EDID changes, you can use ``cec-ctl`` with the ``-E`` option::
+
+	cec-ctl -E /sys/class/drm/card0-DP-1/edid
+
+This assumes the dongle is connected to the card0-DP-1 output 
(``xrandr`` will tell
+you which output is used) and it will poll for changes to the EDID and 
update
+the Physical Address whenever they occur.
+
+To automatically run this command you can use cron. Edit crontab with
+``crontab -e`` and add this line::
+
+	@reboot /usr/local/bin/cec-ctl -E /sys/class/drm/card0-DP-1/edid
+
+This only works for display drivers that expose the EDID in 
``/sys/class/drm``,
+such as the i915 driver.
+
+
+CEC Without HPD
+===============
+
+Some displays when in standby mode have no HDMI Hotplug Detect signal, but
+CEC is still enabled so connected devices can send an <Image View On> CEC
+message in order to wake up such displays. Unfortunately, not all CEC
+adapters can support this. An example is the Odroid-U3 SBC that has a
+level-shifter that is powered off when the HPD signal is low, thus
+blocking the CEC pin. Even though the SoC can use CEC without a HPD,
+the level-shifter will prevent this from functioning.
+
+There is a CEC capability flag to signal this: ``CEC_CAP_NEEDS_HPD``.
+If set, then the hardware cannot wake up displays with this behavior.
+
+Note for CEC application implementers: the <Image View On> message must
+be the first message you send, don't send any other messages before.
+Certain very bad but unfortunately not uncommon CEC implementations
+get very confused if they receive anything else but this message and
+they won't wake up.
+
+When writing a driver it can be tricky to test this. There are two
+ways to do this:
+
+1) Get a Pulse-Eight USB CEC dongle, connect an HDMI cable from your
+   device to the Pulse-Eight, but do not connect the Pulse-Eight to
+   the display.
+
+   Now configure the Pulse-Eight dongle::
+
+	cec-ctl -p0.0.0.0 --tv
+
+   and start monitoring::
+
+	sudo cec-ctl -M
+
+   On the device you are testing run::
+
+	cec-ctl --playback
+
+   It should report a physical address of f.f.f.f. Now run this
+   command::
+
+	cec-ctl -t0 --image-view-on
+
+   The Pulse-Eight should see the <Image View On> message. If not,
+   then something (hardware and/or software) is preventing the CEC
+   message from going out.
+
+   To make sure you have the wiring correct just connect the
+   Pulse-Eight to a CEC-enabled display and run the same command
+   on your device: now there is a HPD, so you should see the command
+   arriving at the Pulse-Eight.
+
+2) If you have another linux device supporting CEC without HPD, then
+   you can just connect your device to that device. Yes, you can connect
+   two HDMI outputs together. You won't have a HPD (which is what we
+   want for this test), but the second device can monitor the CEC pin.
+
+   Otherwise use the same commands as in 1.
+
+If CEC messages do not come through when there is no HPD, then you
+need to figure out why. Typically it is either a hardware restriction
+or the software powers off the CEC core when the HPD goes low. The
+first cannot be corrected of course, the second will likely required
+driver changes.
+
+
+Microcontrollers & CEC
+======================
+
+We have seen some CEC implementations in displays that use a 
microcontroller
+to sample the bus. This does not have to be a problem, but some 
implementations
+have timing issues. This is hard to discover unless you can hook up a 
low-level
+CEC debugger (see the next section).
+
+You will see cases where the CEC transmitter holds the CEC line high or 
low for
+a longer time than is allowed. For directed messages this is not a 
problem since
+if that happens the message will not be Acked and it will be retransmitted.
+For broadcast messages no such mechanism exists.
+
+It's not clear what to do about this. It is probably wise to transmit some
+broadcast messages twice to reduce the chance of them being lost. 
Specifically
+<Standby> and <Active Source> are candidates for that.
+
+
+Making a CEC debugger
+=====================
+
+By using a Raspberry Pi 2B/3/4 and some cheap components you can make
+your own low-level CEC debugger.
+
+Here is a picture of my setup:
+
+https://hverkuil.home.xs4all.nl/rpi3-cec.jpg
+
+It's a Raspberry Pi 3 together with a breadboard and some breadboard wires:
+
+http://www.dx.com/p/diy-40p-male-to-female-male-to-male-female-to-female-dupont-line-wire-3pcs-356089#.WYLOOXWGN7I
+
+Finally on of these HDMI female-female passthrough connectors (full 
soldering type 1):
+
+https://elabbay.myshopify.com/collections/camera/products/hdmi-af-af-v1a-hdmi-type-a-female-to-hdmi-type-a-female-pass-through-adapter-breakout-board?variant=45533926147
+
+We've tested this and it works up to 4kp30 (297 MHz). The quality is 
not high
+enough to pass-through 4kp60 (594 MHz).
+
+I also added an RTC and a breakout shield:
+
+https://www.amazon.com/Makerfire%C2%AE-Raspberry-Module-DS1307-Battery/dp/B00ZOXWHK4
+
+https://www.dx.com/p/raspberry-pi-gpio-expansion-board-breadboard-easy-multiplexing-board-one-to-three-with-screw-for-raspberry-pi-2-3-b-b-2729992.html#.YGRCG0MzZ7I
+
+These two are not needed but they make life a bit easier.
+
+If you want to monitor the HPD line as well, then you need one of these
+level shifters:
+
+https://www.adafruit.com/product/757
+
+(This is just where I got these components, there are many other places you
+can get similar things).
+
+The CEC pin of the HDMI connector needs to be connected to these pins:
+CE0/IO8 and CE1/IO7 (pull-up GPIOs). The (optional) HPD pin of the HDMI
+connector should be connected (via a level shifter to convert the 5V
+to 3.3V) to these pins: IO17 and IO27. The (optional) 5V pin of the HDMI
+connector should be connected (via a level shifter) to these pins: IO22
+and IO24. Monitoring the HPD an 5V lines is not necessary, but it is 
helpful.
+
+This kernel patch will hook up the cec-gpio driver correctly to
+e.g. ``arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts``::
+
+	cec-gpio@7 {
+		compatible = "cec-gpio";
+		cec-gpios = <&gpio 7 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		hpd-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;
+		v5-gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
+	};
+
+	cec-gpio@8 {
+		compatible = "cec-gpio";
+		cec-gpios = <&gpio 8 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		hpd-gpios = <&gpio 27 GPIO_ACTIVE_HIGH>;
+		v5-gpios = <&gpio 24 GPIO_ACTIVE_HIGH>;
+	};
+
+This dts change will enable two cec GPIO devices: I typically use one to
+send/receive CEC commands and the other to monitor. If you monitor using
+an unconfigured CEC adapter then it will use GPIO interrupts which makes
+monitoring very accurate.
+
+The documentation on how to use the error injection is here: 
:ref:`cec_pin_error_inj`.
+
+``cec-ctl --monitor-pin`` will do low-level CEC bus sniffing and analysis.
+You can also store the CEC traffic to file using ``--store-pin`` and 
analyze
+it later using ``--analyze-pin``.
+
+You can also use this as a full-fledged CEC device by configuring it
+using ``cec-ctl --tv -p0.0.0.0`` or ``cec-ctl --playback -p1.0.0.0``.
diff --git a/Documentation/admin-guide/media/index.rst 
b/Documentation/admin-guide/media/index.rst
index c676af665111..43f4a292b245 100644
--- a/Documentation/admin-guide/media/index.rst
+++ b/Documentation/admin-guide/media/index.rst
@@ -38,13 +38,14 @@ The media subsystem

  	remote-controller

+	cec
+
  	dvb

  	cardlist

  	v4l-drivers
  	dvb-drivers
-	cec-drivers

  **Copyright** |copy| 1999-2020 : LinuxTV Developers

diff --git a/Documentation/admin-guide/media/pulse8-cec.rst 
b/Documentation/admin-guide/media/pulse8-cec.rst
deleted file mode 100644
index 356d08b519f3..000000000000
--- a/Documentation/admin-guide/media/pulse8-cec.rst
+++ /dev/null
@@ -1,13 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0
-
-Pulse-Eight CEC Adapter driver
-==============================
-
-The pulse8-cec driver implements the following module option:
-
-``persistent_config``
----------------------
-
-By default this is off, but when set to 1 the driver will store the current
-settings to the device's internal eeprom and restore it the next time the
-device is connected to the USB port.
diff --git a/Documentation/userspace-api/media/cec/cec-pin-error-inj.rst 
b/Documentation/userspace-api/media/cec/cec-pin-error-inj.rst
index b0efce40471f..411d42a742f3 100644
--- a/Documentation/userspace-api/media/cec/cec-pin-error-inj.rst
+++ b/Documentation/userspace-api/media/cec/cec-pin-error-inj.rst
@@ -1,5 +1,7 @@
  .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later

+.. _cec_pin_error_inj:
+
  CEC Pin Framework Error Injection
  =================================

diff --git a/MAINTAINERS b/MAINTAINERS
index a58f1fc6dd47..575e666d71e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16515,7 +16515,6 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
  L:	linux-media@vger.kernel.org
  S:	Maintained
  T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/admin-guide/media/pulse8-cec.rst
  F:	drivers/media/cec/usb/pulse8/

  PURELIFI PLFXLC DRIVER
-- 
2.35.1

