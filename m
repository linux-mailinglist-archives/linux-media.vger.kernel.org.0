Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80E4F2F341D
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 16:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731029AbhALPZP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 10:25:15 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:44099 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728901AbhALPZP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 10:25:15 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id zLWwkDG4AAiIczLWzkb6sH; Tue, 12 Jan 2021 16:24:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610465072; bh=1OyeVWqwRc/wrbPIfm6Pc49TyW8Sr26ODJ48G86Gs5s=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QN17MDUq76yjSJp9JgKj0t5+QCA7LTaGlx4D2smYnBexveQM1St+0W4GQf4+ZRkRw
         VwnbJuYsYs73sMRyXVK9ucRabA4cfQo7cpv38gKAHOVQq1VmnSLr4NjSSN1y0lPhS0
         p3lBjXuZdYR4dqOK6crdH9IYPkUtCxrMqtgq/ny0b4DBp0hvQ25GoBWO2m9rwjlPjY
         31+IhxFB2HI3LbL8U5KXKFvId/8qXrfh6hmcfB4oC0KokkrIgySKzls95CR19ddWR2
         cIBFVvUvjFwKBIhLFqqvqMkSAzBP5Voi1kHyNfK3KUd8OxrQMhIAUBBboavW6OO4oY
         IB42swW+o0r8g==
Subject: Re: [PATCH v2 00/15] drm/vc4: hdmi: Add CEC support for the BCM2711
To:     Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        bcm-kernel-feedback-list@broadcom.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-media@vger.kernel.org
References: <20210111142309.193441-1-maxime@cerno.tech>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <5dda3c71-5faf-683b-c25a-37aa1849fb62@xs4all.nl>
Date:   Tue, 12 Jan 2021 16:24:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111142309.193441-1-maxime@cerno.tech>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfP4e8LRmD5sFFemCB8ehtVxFGymcEiWgrR+Xll7iDbyobc3v/NeXkY7N72lJS0UD573xKf9fCpnl5szqKGCSioyEF7wToEBx1OvCWSV57Es03G8KfHZD
 mHrnTbeNM3jh7ugOJH3feOwDl1rpodYHpB5Cs6dVqJqbczhcvTQ2flqALVpEZFo0JPuDLvCdODYTORMvDdj7lgRYbiQGJ4fyL1w2BTpCXIt7PaWDRia1Kry+
 qiLv0R0y3GjnP0UJW1hCrLN8F8ykJ5K3NsF6NdC042Q7MfXRFbzE04M+UGy0BGotBa3Lj86+ronzk/HLnA6RJbHbVHYXbJ+UZHAc6oMEPq3VP6oUn1QIYyUW
 BXqiYrLwDG4KRaDbMJ4yiky+J3JikK5OH91nnQ1M4iENiRBYeLT1MNWeIy7zChxbL7IRHCSe9C39bvQ8MAwZPYH8BVQe5ftAfdoz7rp04by8mswxBLGlD1oq
 e8NEbnN+YL0fTVsnMetIvIEgPrkFm/RsiutgzXI2Q284OUyej9iZjn/x7UF5ect+A6GP8YLnVOMSUj39h75wn7wLQbPgiYf2T15RRrGnY2XIk8nzpa4xr3h7
 KsNgYVwS6QqpFjgn2JkJ1Da7lBEwKXOatoQ/DMi1j1krG6DNITL5gMDuLUT1qm8JYrN2wDyK01CSMz9n7CTOVlHtnar+NjyAaTEZsT6IbnQy9cfNRHX1MbMf
 bZ5rLJSFTf0=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

On 11/01/2021 15:22, Maxime Ripard wrote:
> Hi,
> 
> Here's a series introducing the CEC support for the BCM2711 found on the
> RaspberryPi4.
> 
> The BCM2711 HDMI controller uses a similar layout for the CEC registers, the
> main difference being that the interrupt handling part is now shared between
> both HDMI controllers.
> 
> This series is mainly about fixing a couple of bugs, reworking the driver to
> support having two different interrupts, one for each direction, provided by an
> external irqchip, and enables the irqchip driver for the controller we have.
> 
> This has been tested on an RPi3 and RPi4, but requires the latest firmware.
> It's is based on the 10 and 12 bpc series.

Thank you for this series, I plan to test this later this week.

Regards,

	Hans

> 
> Here is the cec-compliance output:
> 
> pi@raspberrypi:~$ cec-ctl --tuner -p 1.0.0.0
> The CEC adapter doesn't allow setting the physical address manually, ignore this option.
> 
> Driver Info:
> 	Driver Name                : vc4_hdmi
> 	Adapter Name               : vc4
> 	Capabilities               : 0x0000010e
> 		Logical Addresses
> 		Transmit
> 		Passthrough
> 	Driver version             : 5.10.0
> 	Available Logical Addresses: 1
> 	Physical Address           : 1.0.0.0
> 	Logical Address Mask       : 0x0008
> 	CEC Version                : 2.0
> 	Vendor ID                  : 0x000c03 (HDMI)
> 	OSD Name                   : Tuner
> 	Logical Addresses          : 1 (Allow RC Passthrough)
> 
> 	  Logical Address          : 3 (Tuner 1)
> 	    Primary Device Type    : Tuner
> 	    Logical Address Type   : Tuner
> 	    All Device Types       : Tuner
> 	    RC TV Profile          : None
> 	    Device Features        :
> 		None
> 
> pi@raspberrypi:~$ cec-compliance
> cec-compliance SHA                 : not available
> Driver Info:
> 	Driver Name                : vc4_hdmi
> 	Adapter Name               : vc4
> 	Capabilities               : 0x0000010e
> 		Logical Addresses
> 		Transmit
> 		Passthrough
> 	Driver version             : 5.10.0
> 	Available Logical Addresses: 1
> 	Physical Address           : 1.0.0.0
> 	Logical Address Mask       : 0x0008
> 	CEC Version                : 2.0
> 	Vendor ID                  : 0x000c03 (HDMI)
> 	OSD Name                   : Tuner
> 	Logical Addresses          : 1 (Allow RC Passthrough)
> 
> 	  Logical Address          : 3 (Tuner 1)
> 	    Primary Device Type    : Tuner
> 	    Logical Address Type   : Tuner
> 	    All Device Types       : Tuner
> 	    RC TV Profile          : None
> 	    Device Features        :
> 		None
> 
> Compliance test for device /dev/cec0:
> 
>     The test results mean the following:
>         OK                  Supported correctly by the device.
>         OK (Not Supported)  Not supported and not mandatory for the device.
>         OK (Presumed)       Presumably supported.  Manually check to confirm.
>         OK (Unexpected)     Supported correctly but is not expected to be supported for this device.
>         OK (Refused)        Supported by the device, but was refused.
>         FAIL                Failed and was expected to be supported by this device.
> 
> Find remote devices:
> 	Polling: OK
> 
> Network topology:
> 	System Information for device 0 (TV) from device 3 (Tuner 1):
> 		CEC Version                : 2.0
> 		Physical Address           : 0.0.0.0
> 		Primary Device Type        : TV
> 		Vendor ID                  : 0x000c03
> 		OSD Name                   : 'TV  '
> 		Power Status               : Tx, OK, Rx, OK, Feature Abort
> 
> Total: 1, Succeeded: 1, Failed: 0, Warnings: 0
> 
> pi@raspberrypi:~$ cec-ctl -d1 --tuner -p 1.0.0.0
> The CEC adapter doesn't allow setting the physical address manually, ignore this option.
> 
> Driver Info:
> 	Driver Name                : vc4_hdmi
> 	Adapter Name               : vc4
> 	Capabilities               : 0x0000010e
> 		Logical Addresses
> 		Transmit
> 		Passthrough
> 	Driver version             : 5.10.0
> 	Available Logical Addresses: 1
> 	Physical Address           : 1.0.0.0
> 	Logical Address Mask       : 0x0008
> 	CEC Version                : 2.0
> 	Vendor ID                  : 0x000c03 (HDMI)
> 	OSD Name                   : Tuner
> 	Logical Addresses          : 1 (Allow RC Passthrough)
> 
> 	  Logical Address          : 3 (Tuner 1)
> 	    Primary Device Type    : Tuner
> 	    Logical Address Type   : Tuner
> 	    All Device Types       : Tuner
> 	    RC TV Profile          : None
> 	    Device Features        :
> 		None
> 
> pi@raspberrypi:~$ cec-compliance -d1
> cec-compliance SHA                 : not available
> Driver Info:
> 	Driver Name                : vc4_hdmi
> 	Adapter Name               : vc4
> 	Capabilities               : 0x0000010e
> 		Logical Addresses
> 		Transmit
> 		Passthrough
> 	Driver version             : 5.10.0
> 	Available Logical Addresses: 1
> 	Physical Address           : 1.0.0.0
> 	Logical Address Mask       : 0x0008
> 	CEC Version                : 2.0
> 	Vendor ID                  : 0x000c03 (HDMI)
> 	OSD Name                   : Tuner
> 	Logical Addresses          : 1 (Allow RC Passthrough)
> 
> 	  Logical Address          : 3 (Tuner 1)
> 	    Primary Device Type    : Tuner
> 	    Logical Address Type   : Tuner
> 	    All Device Types       : Tuner
> 	    RC TV Profile          : None
> 	    Device Features        :
> 		None
> 
> Compliance test for device /dev/cec1:
> 
>     The test results mean the following:
>         OK                  Supported correctly by the device.
>         OK (Not Supported)  Not supported and not mandatory for the device.
>         OK (Presumed)       Presumably supported.  Manually check to confirm.
>         OK (Unexpected)     Supported correctly but is not expected to be supported for this device.
>         OK (Refused)        Supported by the device, but was refused.
>         FAIL                Failed and was expected to be supported by this device.
> 
> Find remote devices:
> 	Polling: OK
> 
> Network topology:
> 	System Information for device 0 (TV) from device 3 (Tuner 1):
> 		CEC Version                : 2.0
> 		Physical Address           : 0.0.0.0
> 		Primary Device Type        : TV
> 		Vendor ID                  : 0x000c03
> 		OSD Name                   : 'TV  '
> 		Power Status               : Tx, OK, Rx, OK, Feature Abort
> 
> Total: 1, Succeeded: 1, Failed: 0, Warnings: 0
> 
> And for the hotplug detect test:
> 
> pi@raspberrypi:~$ cec-ctl --playback
> Driver Info:
> 	Driver Name                : vc4_hdmi
> 	Adapter Name               : vc4
> 	Capabilities               : 0x0000010e
> 		Logical Addresses
> 		Transmit
> 		Passthrough
> 	Driver version             : 5.10.0
> 	Available Logical Addresses: 1
> 	Physical Address           : f.f.f.f
> 	Logical Address Mask       : 0x0000
> 	CEC Version                : 2.0
> 	Vendor ID                  : 0x000c03 (HDMI)
> 	OSD Name                   : Playback
> 	Logical Addresses          : 1 (Allow RC Passthrough)
> 
> 	  Logical Address          : Not Allocated
> 	    Primary Device Type    : Playback
> 	    Logical Address Type   : Playback
> 	    All Device Types       : Playback
> 	    RC TV Profile          : None
> 	    Device Features        :
> 		None
> 
> pi@raspberrypi:~$ cec-ctl -t0 --image-view-on
> Driver Info:
> 	Driver Name                : vc4_hdmi
> 	Adapter Name               : vc4
> 	Capabilities               : 0x0000010e
> 		Logical Addresses
> 		Transmit
> 		Passthrough
> 	Driver version             : 5.10.0
> 	Available Logical Addresses: 1
> 	Physical Address           : f.f.f.f
> 	Logical Address Mask       : 0x0000
> 	CEC Version                : 2.0
> 	Vendor ID                  : 0x000c03 (HDMI)
> 	OSD Name                   : Playback
> 	Logical Addresses          : 1 (Allow RC Passthrough)
> 
> 	  Logical Address          : Not Allocated
> 	    Primary Device Type    : Playback
> 	    Logical Address Type   : Playback
> 	    All Device Types       : Playback
> 	    RC TV Profile          : None
> 	    Device Features        :
> 		None
> 
> Transmit from Unregistered to TV (15 to 0):
> CEC_MSG_IMAGE_VIEW_ON (0x04)
> 	Sequence: 1 Tx Timestamp: 9182.611s
> pi@raspberrypi:~$ cec-ctl -d1 --playback
> Driver Info:
> 	Driver Name                : vc4_hdmi
> 	Adapter Name               : vc4
> 	Capabilities               : 0x0000010e
> 		Logical Addresses
> 		Transmit
> 		Passthrough
> 	Driver version             : 5.10.0
> 	Available Logical Addresses: 1
> 	Physical Address           : f.f.f.f
> 	Logical Address Mask       : 0x0000
> 	CEC Version                : 2.0
> 	Vendor ID                  : 0x000c03 (HDMI)
> 	OSD Name                   : Playback
> 	Logical Addresses          : 1 (Allow RC Passthrough)
> 
> 	  Logical Address          : Not Allocated
> 	    Primary Device Type    : Playback
> 	    Logical Address Type   : Playback
> 	    All Device Types       : Playback
> 	    RC TV Profile          : None
> 	    Device Features        :
> 		None
> 
> pi@raspberrypi:~$ cec-ctl -d1 -t0 --image-view-on
> Driver Info:
> 	Driver Name                : vc4_hdmi
> 	Adapter Name               : vc4
> 	Capabilities               : 0x0000010e
> 		Logical Addresses
> 		Transmit
> 		Passthrough
> 	Driver version             : 5.10.0
> 	Available Logical Addresses: 1
> 	Physical Address           : f.f.f.f
> 	Logical Address Mask       : 0x0000
> 	CEC Version                : 2.0
> 	Vendor ID                  : 0x000c03 (HDMI)
> 	OSD Name                   : Playback
> 	Logical Addresses          : 1 (Allow RC Passthrough)
> 
> 	  Logical Address          : Not Allocated
> 	    Primary Device Type    : Playback
> 	    Logical Address Type   : Playback
> 	    All Device Types       : Playback
> 	    RC TV Profile          : None
> 	    Device Features        :
> 		None
> 
> Transmit from Unregistered to TV (15 to 0):
> CEC_MSG_IMAGE_VIEW_ON (0x04)
> 	Sequence: 1 Tx Timestamp: 9207.191s
> 
> With the pulse-eight side reporting:
> 
> $ sudo cec-ctl -M
> Driver Info:
> 	Driver Name                : pulse8-cec
> 	Adapter Name               : serio0
> 	Capabilities               : 0x0000003f
> 		Physical Address
> 		Logical Addresses
> 		Transmit
> 		Passthrough
> 		Remote Control Support
> 		Monitor All
> 	Driver version             : 5.9.16
> 	Available Logical Addresses: 1
> 	Connector Info             : None
> 	Physical Address           : 0.0.0.0
> 	Logical Address Mask       : 0x0001
> 	CEC Version                : 2.0
> 	Vendor ID                  : 0x000c03 (HDMI)
> 	OSD Name                   : 'TV  '
> 	Logical Addresses          : 1 (Allow RC Passthrough)
> 
> 	  Logical Address          : 0 (TV)
> 	    Primary Device Type    : TV
> 	    Logical Address Type   : TV
> 	    All Device Types       : TV
> 	    RC TV Profile          : None
> 	    Device Features        :
> 		None
> 
> Initial Event: State Change: PA: 0.0.0.0, LA mask: 0x0001, Conn Info: no
> 
> Received from Unregistered to TV (15 to 0): IMAGE_VIEW_ON (0x04)
> Received from Unregistered to TV (15 to 0): IMAGE_VIEW_ON (0x04)
> 
> Let me know what you think,
> Maxime
> 
> Changes from v1:
>   - Removed the irqchip patch in favor of a select in mach-bcm
>   - Fixed HDMI1 interrupt numbers
>   - Removed redundant call to drm_connector_update_edid_property
>   - Fixed the condition in vc4_hdmi_connector_detect
>   - Added the tags
>   - Rebased on top of drm-misc-next-2021-01-06
> 
> Dom Cobley (5):
>   drm/vc4: hdmi: Move hdmi reset to bind
>   drm/vc4: hdmi: Fix register offset with longer CEC messages
>   drm/vc4: hdmi: Fix up CEC registers
>   drm/vc4: hdmi: Restore cec physical address on reconnect
>   drm/vc4: hdmi: Remove cec_available flag
> 
> Maxime Ripard (10):
>   ARM: bcm: Select BRCMSTB_L2_IRQ for bcm2835
>   drm/vc4: hdmi: Compute the CEC clock divider from the clock rate
>   drm/vc4: hdmi: Update the CEC clock divider on HSM rate change
>   drm/vc4: hdmi: Introduce a CEC clock
>   drm/vc4: hdmi: Split the interrupt handlers
>   drm/vc4: hdmi: Support BCM2711 CEC interrupt setup
>   drm/vc4: hdmi: Don't register the CEC adapter if there's no interrupts
>   dt-binding: display: bcm2711-hdmi: Add CEC and hotplug interrupts
>   ARM: dts: bcm2711: Add the BSC interrupt controller
>   ARM: dts: bcm2711: Add the CEC interrupt controller
> 
>  .../bindings/display/brcm,bcm2711-hdmi.yaml   |  20 +-
>  arch/arm/boot/dts/bcm2711.dtsi                |  30 +++
>  arch/arm/mach-bcm/Kconfig                     |   1 +
>  arch/arm64/Kconfig.platforms                  |   1 +
>  drivers/gpu/drm/vc4/vc4_hdmi.c                | 223 ++++++++++++++----
>  drivers/gpu/drm/vc4/vc4_hdmi.h                |  11 +-
>  drivers/gpu/drm/vc4/vc4_hdmi_regs.h           |   4 +-
>  7 files changed, 234 insertions(+), 56 deletions(-)
> 

