Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 440252D5CE4
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 15:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389191AbgLJNsJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 08:48:09 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:58539 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389116AbgLJNsB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 08:48:01 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id E6032EC5;
        Thu, 10 Dec 2020 08:46:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 10 Dec 2020 08:46:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:content-type:mime-version
        :content-transfer-encoding; s=fm1; bh=2mM5F5w/Ms2f3FSkqgC6qFfGU2
        pI+9dyJwvXJa0dfw4=; b=oT3FsbRn/eSIi6+XjN4UOcKIUtXQ27V/bIJ88VFOhe
        o/l+NmXvIFKUPGKr6kasRabnz+khP/DhNi3tfZ5LZifZs7+Hb4QYxDNehYmVRaOo
        /CilS3jbLfvcY2/MOqiahNvGe3QAkDM1Xg53iPeOzAA0Ctnb/ser7v63o6FTffr4
        upDsVdMUKde9f/zEED2IOve30b5AjZNbRybHJ848HQRjBjj6RkfuvrB4oyiUdQWI
        xVdonOm9KMHCGOGawKXk9k1I+bb+5aWC4wtCM8wcaN0F3t4MfVIgAvTTSDgpDkIU
        rKsNViHGBo6ucP1h0uBkxmUVmw9p9S6eniqjTEe5Ew/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2mM5F5
        w/Ms2f3FSkqgC6qFfGU2pI+9dyJwvXJa0dfw4=; b=NZFpj4GjOVx1ot5iFlReP2
        EJQ4fYtaDe+yKTyQYxC7zEIBg8F5oF5tDgDUL3rE4+4FalyFYGHzuQ5mRY+9lb3p
        EWNKhxCch4UiKc0Fv5nbrEFTC7BMQbm63lBYbzSXeZCu+AjM9c3A3MusUTnlqGn4
        dATKqqaX0Ie7WHqcXeDh/+pCuyrGFA62c2n2jJr0XI4fQNcRKGFNEVKL9kpj3TPo
        uZ7O5MwVecgkLq31Q6yVypTP4ZbvvXC4FvDpgCMgmvtgvrRqiNvOsSipml9k4pzb
        d/dQYtwT35j8Omfh5TtRBgHNKbQuQMChOelpnmqyFcr8OAyxRL4cqBykAVaGcgWA
        ==
X-ME-Sender: <xms:ySbSXxXb3A0YNpRtNGCizods-XSYjdgdO0aY9pYxgDOBJuGU3eyZDg>
    <xme:ySbSXxlCMMlT3_maeubL39gXgMZuZtrk8shpue-BPSCG2b1Tisgrg6O0wXIDv7vG7
    m1xszTUM-q81XFqI00>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
    feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ySbSX9byWpkZzSqnVffJufTazefJB6MaTcZqVV4cOuX30Qz5A4PfxA>
    <xmx:ySbSX0UVEbjLAJD7SjPCt3kCgpIl5GhDjtBEkLJP81pV0f-L7v0VWw>
    <xmx:ySbSX7nQQWb6pVFEv5UUGfN65_7c9EMbuOaNUsokBSYXkmMsvslHcw>
    <xmx:zSbSXzmukvgaILRgABTSaws0XcYXHh9cqlFyolM3zWB4KJdJy-Fof7F1SEs>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id A8723240062;
        Thu, 10 Dec 2020 08:46:49 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     Jason Cooper <jason@lakedaemon.net>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        Marc Zyngier <maz@kernel.org>, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-rpi-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 00/15] drm/vc4: hdmi: Add CEC support for the BCM2711
Date:   Thu, 10 Dec 2020 14:46:33 +0100
Message-Id: <20201210134648.272857-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
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
$ cec-ctl --tuner -p 1.0.0.0=0D
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
$ cec-compliance=0D
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
Compliance test for vc4_hdmi device /dev/cec0:=0D
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
		Vendor ID                  : 0x000c03 (HDMI)=0D
		OSD Name                   : 'test-124'=0D
		Power Status               : Tx, OK, Rx, OK, Feature Abort=0D
=0D
Total for vc4_hdmi device /dev/cec0: 1, Succeeded: 1, Failed: 0, Warnings: =
0=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Dom Cobley (5):=0D
  drm/vc4: hdmi: Move hdmi reset to bind=0D
  drm/vc4: hdmi: Fix register offset with longer CEC messages=0D
  drm/vc4: hdmi: Fix up CEC registers=0D
  drm/vc4: hdmi: Restore cec physical address on reconnect=0D
  drm/vc4: hdmi: Remove cec_available flag=0D
=0D
Maxime Ripard (10):=0D
  irqchip: Allow to compile bcmstb on other platforms=0D
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
 drivers/gpu/drm/vc4/vc4_hdmi.c                | 224 +++++++++++++-----=0D
 drivers/gpu/drm/vc4/vc4_hdmi.h                |  11 +-=0D
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h           |   4 +-=0D
 drivers/irqchip/Kconfig                       |   2 +-=0D
 6 files changed, 232 insertions(+), 59 deletions(-)=0D
=0D
-- =0D
2.28.0=0D
=0D
