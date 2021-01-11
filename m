Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152BD2F1818
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 15:25:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730035AbhAKOYH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 09:24:07 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:44593 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728885AbhAKOX7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 09:23:59 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 9189158066D;
        Mon, 11 Jan 2021 09:23:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 11 Jan 2021 09:23:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:content-type:mime-version
        :content-transfer-encoding; s=fm1; bh=w0p+J4wUp/L3mhX+eC46Wy14gL
        fsx4bYdK/HsC65MaM=; b=oRd1zuznYqoiB01rlD9rjpKlOHzqZa8JTbdsLtYPd0
        jrm10ElIH2GenxFNT1+IdhtbtxuqrGvUsZj4TfesGzkb723VbJKMPNcg9APPX4w+
        kPqJXG6tiXdQt9Kl0koEd7yc7cLhzLHitsmNkNlGCNxmWcblDunWOKkXTIY9cMON
        fICrmkvt8DaTtAeB6o1aF0TiTITRoq3+0h3MgWKNlO4RT+UnSj1zyUA/7oMIJb+i
        GXmg188F8XMMxoYyVfB1KIqGRohmxH8koZQCCz4oXKB+PN/6+W+BWM9KfpD3JGOz
        FeWuyfgUmX35utc8aQKbX3M+LAhv1LPye0k5fsGHJMng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=w0p+J4
        wUp/L3mhX+eC46Wy14gLfsx4bYdK/HsC65MaM=; b=cSeBN1R7M0L2J1ooCzycdv
        /yShSSyY1K+x9nY1N0QJk2ZpMSzgDDRPM43w4vQ9WG03Z0E+BSfq7r+iFNJBzX7S
        Ky1XHPmXN93BNdSzRO0BksL69y2vmAvsyNPKHAYYUfefoIYTkneVcPGG4k7urHBc
        TGr6/Q10v2EyXfZkOjg5sjON9YoP/uINVL1jplYDoWBAsJwRJ+lIK+1NjP5/4D52
        R68a1Wum9D8+Yh7x8nnyOaDLXCw/jeoPkjqMt7k7qN+jf2Og7xhPgbi2GXzG1L29
        DFDqwt1fEHY1M2R6q41mDXGqiT514akjKLGKz+hVWFHQ9ekBt3J5SK9cdSIuEg7Q
        ==
X-ME-Sender: <xms:T1_8X6N-iHouEjLJ4WjKDDwzLjwiLXbFcd1tpk4yKdkZf0_vR2xZrw>
    <xme:T1_8X-LrZg6_tIQD0pSActXKvMzolQjFU_5Sf3rZItkRMMhuyxE6roJidBYVSwvNc
    htdjAelIR6n-NLnf6c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
    feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:T1_8XyJ5z-pG6Z-frhZXpPNT6Wdteexc8mNr9bEFkkuF2CdR4Yqn9w>
    <xmx:T1_8Xw5wRgu4rX0-lLaSwNv7vI1OjBTrXbRd5PifBweHN9t-dNjBgQ>
    <xmx:T1_8X0cqRrnEfSu8mDpaAX9aZfouwouo7WMrDR2q6sATPY6e-2gkDg>
    <xmx:UF_8X_HT94mcpfDvTlKJGogUV632sRe-R7FAmcobfMWyxUZ8ULznRA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 042281080063;
        Mon, 11 Jan 2021 09:23:10 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        bcm-kernel-feedback-list@broadcom.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 00/15] drm/vc4: hdmi: Add CEC support for the BCM2711
Date:   Mon, 11 Jan 2021 15:22:54 +0100
Message-Id: <20210111142309.193441-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,=0D
=0D
Here's a series introducing the CEC support for the BCM2711 found on the=0D
RaspberryPi4.=0D
=0D
The BCM2711 HDMI controller uses a similar layout for the CEC registers, th=
e=0D
main difference being that the interrupt handling part is now shared betwee=
n=0D
both HDMI controllers.=0D
=0D
This series is mainly about fixing a couple of bugs, reworking the driver t=
o=0D
support having two different interrupts, one for each direction, provided b=
y an=0D
external irqchip, and enables the irqchip driver for the controller we have=
.=0D
=0D
This has been tested on an RPi3 and RPi4, but requires the latest firmware.=
=0D
It's is based on the 10 and 12 bpc series.=0D
=0D
Here is the cec-compliance output:=0D
=0D
pi@raspberrypi:~$ cec-ctl --tuner -p 1.0.0.0=0D
The CEC adapter doesn't allow setting the physical address manually, ignore=
 this option.=0D
=0D
Driver Info:=0D
	Driver Name                : vc4_hdmi=0D
	Adapter Name               : vc4=0D
	Capabilities               : 0x0000010e=0D
		Logical Addresses=0D
		Transmit=0D
		Passthrough=0D
	Driver version             : 5.10.0=0D
	Available Logical Addresses: 1=0D
	Physical Address           : 1.0.0.0=0D
	Logical Address Mask       : 0x0008=0D
	CEC Version                : 2.0=0D
	Vendor ID                  : 0x000c03 (HDMI)=0D
	OSD Name                   : Tuner=0D
	Logical Addresses          : 1 (Allow RC Passthrough)=0D
=0D
	  Logical Address          : 3 (Tuner 1)=0D
	    Primary Device Type    : Tuner=0D
	    Logical Address Type   : Tuner=0D
	    All Device Types       : Tuner=0D
	    RC TV Profile          : None=0D
	    Device Features        :=0D
		None=0D
=0D
pi@raspberrypi:~$ cec-compliance=0D
cec-compliance SHA                 : not available=0D
Driver Info:=0D
	Driver Name                : vc4_hdmi=0D
	Adapter Name               : vc4=0D
	Capabilities               : 0x0000010e=0D
		Logical Addresses=0D
		Transmit=0D
		Passthrough=0D
	Driver version             : 5.10.0=0D
	Available Logical Addresses: 1=0D
	Physical Address           : 1.0.0.0=0D
	Logical Address Mask       : 0x0008=0D
	CEC Version                : 2.0=0D
	Vendor ID                  : 0x000c03 (HDMI)=0D
	OSD Name                   : Tuner=0D
	Logical Addresses          : 1 (Allow RC Passthrough)=0D
=0D
	  Logical Address          : 3 (Tuner 1)=0D
	    Primary Device Type    : Tuner=0D
	    Logical Address Type   : Tuner=0D
	    All Device Types       : Tuner=0D
	    RC TV Profile          : None=0D
	    Device Features        :=0D
		None=0D
=0D
Compliance test for device /dev/cec0:=0D
=0D
    The test results mean the following:=0D
        OK                  Supported correctly by the device.=0D
        OK (Not Supported)  Not supported and not mandatory for the device.=
=0D
        OK (Presumed)       Presumably supported.  Manually check to confir=
m.=0D
        OK (Unexpected)     Supported correctly but is not expected to be s=
upported for this device.=0D
        OK (Refused)        Supported by the device, but was refused.=0D
        FAIL                Failed and was expected to be supported by this=
 device.=0D
=0D
Find remote devices:=0D
	Polling: OK=0D
=0D
Network topology:=0D
	System Information for device 0 (TV) from device 3 (Tuner 1):=0D
		CEC Version                : 2.0=0D
		Physical Address           : 0.0.0.0=0D
		Primary Device Type        : TV=0D
		Vendor ID                  : 0x000c03=0D
		OSD Name                   : 'TV  '=0D
		Power Status               : Tx, OK, Rx, OK, Feature Abort=0D
=0D
Total: 1, Succeeded: 1, Failed: 0, Warnings: 0=0D
=0D
pi@raspberrypi:~$ cec-ctl -d1 --tuner -p 1.0.0.0=0D
The CEC adapter doesn't allow setting the physical address manually, ignore=
 this option.=0D
=0D
Driver Info:=0D
	Driver Name                : vc4_hdmi=0D
	Adapter Name               : vc4=0D
	Capabilities               : 0x0000010e=0D
		Logical Addresses=0D
		Transmit=0D
		Passthrough=0D
	Driver version             : 5.10.0=0D
	Available Logical Addresses: 1=0D
	Physical Address           : 1.0.0.0=0D
	Logical Address Mask       : 0x0008=0D
	CEC Version                : 2.0=0D
	Vendor ID                  : 0x000c03 (HDMI)=0D
	OSD Name                   : Tuner=0D
	Logical Addresses          : 1 (Allow RC Passthrough)=0D
=0D
	  Logical Address          : 3 (Tuner 1)=0D
	    Primary Device Type    : Tuner=0D
	    Logical Address Type   : Tuner=0D
	    All Device Types       : Tuner=0D
	    RC TV Profile          : None=0D
	    Device Features        :=0D
		None=0D
=0D
pi@raspberrypi:~$ cec-compliance -d1=0D
cec-compliance SHA                 : not available=0D
Driver Info:=0D
	Driver Name                : vc4_hdmi=0D
	Adapter Name               : vc4=0D
	Capabilities               : 0x0000010e=0D
		Logical Addresses=0D
		Transmit=0D
		Passthrough=0D
	Driver version             : 5.10.0=0D
	Available Logical Addresses: 1=0D
	Physical Address           : 1.0.0.0=0D
	Logical Address Mask       : 0x0008=0D
	CEC Version                : 2.0=0D
	Vendor ID                  : 0x000c03 (HDMI)=0D
	OSD Name                   : Tuner=0D
	Logical Addresses          : 1 (Allow RC Passthrough)=0D
=0D
	  Logical Address          : 3 (Tuner 1)=0D
	    Primary Device Type    : Tuner=0D
	    Logical Address Type   : Tuner=0D
	    All Device Types       : Tuner=0D
	    RC TV Profile          : None=0D
	    Device Features        :=0D
		None=0D
=0D
Compliance test for device /dev/cec1:=0D
=0D
    The test results mean the following:=0D
        OK                  Supported correctly by the device.=0D
        OK (Not Supported)  Not supported and not mandatory for the device.=
=0D
        OK (Presumed)       Presumably supported.  Manually check to confir=
m.=0D
        OK (Unexpected)     Supported correctly but is not expected to be s=
upported for this device.=0D
        OK (Refused)        Supported by the device, but was refused.=0D
        FAIL                Failed and was expected to be supported by this=
 device.=0D
=0D
Find remote devices:=0D
	Polling: OK=0D
=0D
Network topology:=0D
	System Information for device 0 (TV) from device 3 (Tuner 1):=0D
		CEC Version                : 2.0=0D
		Physical Address           : 0.0.0.0=0D
		Primary Device Type        : TV=0D
		Vendor ID                  : 0x000c03=0D
		OSD Name                   : 'TV  '=0D
		Power Status               : Tx, OK, Rx, OK, Feature Abort=0D
=0D
Total: 1, Succeeded: 1, Failed: 0, Warnings: 0=0D
=0D
And for the hotplug detect test:=0D
=0D
pi@raspberrypi:~$ cec-ctl --playback=0D
Driver Info:=0D
	Driver Name                : vc4_hdmi=0D
	Adapter Name               : vc4=0D
	Capabilities               : 0x0000010e=0D
		Logical Addresses=0D
		Transmit=0D
		Passthrough=0D
	Driver version             : 5.10.0=0D
	Available Logical Addresses: 1=0D
	Physical Address           : f.f.f.f=0D
	Logical Address Mask       : 0x0000=0D
	CEC Version                : 2.0=0D
	Vendor ID                  : 0x000c03 (HDMI)=0D
	OSD Name                   : Playback=0D
	Logical Addresses          : 1 (Allow RC Passthrough)=0D
=0D
	  Logical Address          : Not Allocated=0D
	    Primary Device Type    : Playback=0D
	    Logical Address Type   : Playback=0D
	    All Device Types       : Playback=0D
	    RC TV Profile          : None=0D
	    Device Features        :=0D
		None=0D
=0D
pi@raspberrypi:~$ cec-ctl -t0 --image-view-on=0D
Driver Info:=0D
	Driver Name                : vc4_hdmi=0D
	Adapter Name               : vc4=0D
	Capabilities               : 0x0000010e=0D
		Logical Addresses=0D
		Transmit=0D
		Passthrough=0D
	Driver version             : 5.10.0=0D
	Available Logical Addresses: 1=0D
	Physical Address           : f.f.f.f=0D
	Logical Address Mask       : 0x0000=0D
	CEC Version                : 2.0=0D
	Vendor ID                  : 0x000c03 (HDMI)=0D
	OSD Name                   : Playback=0D
	Logical Addresses          : 1 (Allow RC Passthrough)=0D
=0D
	  Logical Address          : Not Allocated=0D
	    Primary Device Type    : Playback=0D
	    Logical Address Type   : Playback=0D
	    All Device Types       : Playback=0D
	    RC TV Profile          : None=0D
	    Device Features        :=0D
		None=0D
=0D
Transmit from Unregistered to TV (15 to 0):=0D
CEC_MSG_IMAGE_VIEW_ON (0x04)=0D
	Sequence: 1 Tx Timestamp: 9182.611s=0D
pi@raspberrypi:~$ cec-ctl -d1 --playback=0D
Driver Info:=0D
	Driver Name                : vc4_hdmi=0D
	Adapter Name               : vc4=0D
	Capabilities               : 0x0000010e=0D
		Logical Addresses=0D
		Transmit=0D
		Passthrough=0D
	Driver version             : 5.10.0=0D
	Available Logical Addresses: 1=0D
	Physical Address           : f.f.f.f=0D
	Logical Address Mask       : 0x0000=0D
	CEC Version                : 2.0=0D
	Vendor ID                  : 0x000c03 (HDMI)=0D
	OSD Name                   : Playback=0D
	Logical Addresses          : 1 (Allow RC Passthrough)=0D
=0D
	  Logical Address          : Not Allocated=0D
	    Primary Device Type    : Playback=0D
	    Logical Address Type   : Playback=0D
	    All Device Types       : Playback=0D
	    RC TV Profile          : None=0D
	    Device Features        :=0D
		None=0D
=0D
pi@raspberrypi:~$ cec-ctl -d1 -t0 --image-view-on=0D
Driver Info:=0D
	Driver Name                : vc4_hdmi=0D
	Adapter Name               : vc4=0D
	Capabilities               : 0x0000010e=0D
		Logical Addresses=0D
		Transmit=0D
		Passthrough=0D
	Driver version             : 5.10.0=0D
	Available Logical Addresses: 1=0D
	Physical Address           : f.f.f.f=0D
	Logical Address Mask       : 0x0000=0D
	CEC Version                : 2.0=0D
	Vendor ID                  : 0x000c03 (HDMI)=0D
	OSD Name                   : Playback=0D
	Logical Addresses          : 1 (Allow RC Passthrough)=0D
=0D
	  Logical Address          : Not Allocated=0D
	    Primary Device Type    : Playback=0D
	    Logical Address Type   : Playback=0D
	    All Device Types       : Playback=0D
	    RC TV Profile          : None=0D
	    Device Features        :=0D
		None=0D
=0D
Transmit from Unregistered to TV (15 to 0):=0D
CEC_MSG_IMAGE_VIEW_ON (0x04)=0D
	Sequence: 1 Tx Timestamp: 9207.191s=0D
=0D
With the pulse-eight side reporting:=0D
=0D
$ sudo cec-ctl -M=0D
Driver Info:=0D
	Driver Name                : pulse8-cec=0D
	Adapter Name               : serio0=0D
	Capabilities               : 0x0000003f=0D
		Physical Address=0D
		Logical Addresses=0D
		Transmit=0D
		Passthrough=0D
		Remote Control Support=0D
		Monitor All=0D
	Driver version             : 5.9.16=0D
	Available Logical Addresses: 1=0D
	Connector Info             : None=0D
	Physical Address           : 0.0.0.0=0D
	Logical Address Mask       : 0x0001=0D
	CEC Version                : 2.0=0D
	Vendor ID                  : 0x000c03 (HDMI)=0D
	OSD Name                   : 'TV  '=0D
	Logical Addresses          : 1 (Allow RC Passthrough)=0D
=0D
	  Logical Address          : 0 (TV)=0D
	    Primary Device Type    : TV=0D
	    Logical Address Type   : TV=0D
	    All Device Types       : TV=0D
	    RC TV Profile          : None=0D
	    Device Features        :=0D
		None=0D
=0D
Initial Event: State Change: PA: 0.0.0.0, LA mask: 0x0001, Conn Info: no=0D
=0D
Received from Unregistered to TV (15 to 0): IMAGE_VIEW_ON (0x04)=0D
Received from Unregistered to TV (15 to 0): IMAGE_VIEW_ON (0x04)=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Changes from v1:=0D
  - Removed the irqchip patch in favor of a select in mach-bcm=0D
  - Fixed HDMI1 interrupt numbers=0D
  - Removed redundant call to drm_connector_update_edid_property=0D
  - Fixed the condition in vc4_hdmi_connector_detect=0D
  - Added the tags=0D
  - Rebased on top of drm-misc-next-2021-01-06=0D
=0D
Dom Cobley (5):=0D
  drm/vc4: hdmi: Move hdmi reset to bind=0D
  drm/vc4: hdmi: Fix register offset with longer CEC messages=0D
  drm/vc4: hdmi: Fix up CEC registers=0D
  drm/vc4: hdmi: Restore cec physical address on reconnect=0D
  drm/vc4: hdmi: Remove cec_available flag=0D
=0D
Maxime Ripard (10):=0D
  ARM: bcm: Select BRCMSTB_L2_IRQ for bcm2835=0D
  drm/vc4: hdmi: Compute the CEC clock divider from the clock rate=0D
  drm/vc4: hdmi: Update the CEC clock divider on HSM rate change=0D
  drm/vc4: hdmi: Introduce a CEC clock=0D
  drm/vc4: hdmi: Split the interrupt handlers=0D
  drm/vc4: hdmi: Support BCM2711 CEC interrupt setup=0D
  drm/vc4: hdmi: Don't register the CEC adapter if there's no interrupts=0D
  dt-binding: display: bcm2711-hdmi: Add CEC and hotplug interrupts=0D
  ARM: dts: bcm2711: Add the BSC interrupt controller=0D
  ARM: dts: bcm2711: Add the CEC interrupt controller=0D
=0D
 .../bindings/display/brcm,bcm2711-hdmi.yaml   |  20 +-=0D
 arch/arm/boot/dts/bcm2711.dtsi                |  30 +++=0D
 arch/arm/mach-bcm/Kconfig                     |   1 +=0D
 arch/arm64/Kconfig.platforms                  |   1 +=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c                | 223 ++++++++++++++----=0D
 drivers/gpu/drm/vc4/vc4_hdmi.h                |  11 +-=0D
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h           |   4 +-=0D
 7 files changed, 234 insertions(+), 56 deletions(-)=0D
=0D
-- =0D
2.29.2=0D
=0D
