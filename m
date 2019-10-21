Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C176DEAA1
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 13:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbfJULQb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 07:16:31 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:59317 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727831AbfJULQb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 07:16:31 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MVfkiUH6Uo1ZhMVfoiLqeg; Mon, 21 Oct 2019 13:16:28 +0200
Subject: Re: [PATCH v4 0/6] media: Introduce Allwinner H3 deinterlace driver
To:     Jernej Skrabec <jernej.skrabec@siol.net>, mripard@kernel.org,
        wens@csie.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-sunxi@googlegroups.com
References: <20191017183738.68069-1-jernej.skrabec@siol.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8fbb323d-cd36-73cb-2df8-21e2819fa5af@xs4all.nl>
Date:   Mon, 21 Oct 2019 13:16:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017183738.68069-1-jernej.skrabec@siol.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMtA5ZUvk5SMyfHDrRDdsscFKWiG0RLda76+iWgeFQobn4VN/CfhpHs5R4tftNnSaA+wIhzE5IJVRc93acbZCex4ojmnDI0q1d2PXBspsHw0nlCoJ1zN
 Tsd8tUJFP+E+CPII+oQzuFg70xlcL3fyt54UIgA6rdtwk4Tymuuwc3Si1U8+aWn5z+qZWt/Ie4mgYxCrxROd74pQYEHrH+86MYT04Ho1cXiOE2Sm+9WBqr9S
 vy+Qk5Nwufy5x9gg7I6t8Qf1ntIkW/ndhzbW3dosALWd+CdP4yoFL6atOKyO4rmWq+iC+957ZcCEYYYkgVClLWKfBwgdIoAvP6lN4NKm7rnkBhdm+ZZCp0P8
 EMhWk1/TjVoCXNMo9i5h4eN3JFybdT6NF7SJLiKKzShsFWvGNDGvCM+jbkoDbQOCEQnh//I3G+RyHTM8C7JU8LHkm9t2MwhSAJDM9AgiYM80g76ZwrgrGKha
 V20ZRBkd1Z6GGntC7OLeEL9c1zugoq1Vw5EM7GusBDoFMEyR+rm3ZzPFQuM=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jernej,

I found something odd in the compliance output:

On 10/17/19 8:37 PM, Jernej Skrabec wrote:
> Starting with H3, Allwinner began to include standalone deinterlace
> core in multimedia oriented SoCs. This patch series introduces support
> for it. Note that new SoCs, like H6, have radically different (updated)
> deinterlace core, which will need a new driver.
> 
> v4l2-compliance report:
> v4l2-compliance SHA: dece02f862f38d8f866230ca9f1015cb93ddfac4, 32 bits
> 
> Compliance test for sun8i-di device /dev/video0:
> 
> Driver Info:
>         Driver name      : sun8i-di
>         Card type        : sun8i-di
>         Bus info         : platform:sun8i-di
>         Driver version   : 5.3.0
>         Capabilities     : 0x84208000
>                 Video Memory-to-Memory
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04208000
>                 Video Memory-to-Memory
>                 Streaming
>                 Extended Pix Format
> 
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
>         test second /dev/video0 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
> 
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK

This claims that the driver supports scaling, but I don't think that is right.

More likely the deinterlacing part is what confuses the compliance test.

Can you look in v4l2-test-formats.cpp, function testBasicScaling() where it
sets node->can_scale to true? And see if this is due to a driver bug, or due
to a bug in the test?

Regards,

	Hans

> 
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
> 
> Total for sun8i-di device /dev/video0: 44, Succeeded: 44, Failed: 0, Warnings: 0
> 
> Please take a look.
> 
> Best regards,
> Jernej
> 
> Changes from v3:
> - added Maxime's a-b tag
> - moved and fixed Kconfig entry
> - put clk_set_rate_exclusive() and it's counterpart in PM callbacks
> 
> Changes from v2:
> - added acked-by and review-by tags
> - fixed schema path in H3 deinterlace binding
> - moved busy check after format args check
> 
> Changes from v1:
> - updated Maxime's e-mail in DT binding
> - removed "items" for single item in DT binding
> - implemented power management
> - replaced regmap with direct io access
> - set exclusive clock rate
> - renamed DEINTERLACE_FRM_CTRL_COEF_CTRL to DEINTERLACE_FRM_CTRL_COEF_ACCESS
> 
> Jernej Skrabec (6):
>   dt-bindings: bus: sunxi: Add H3 MBUS compatible
>   clk: sunxi-ng: h3: Export MBUS clock
>   ARM: dts: sunxi: h3/h5: Add MBUS controller node
>   dt-bindings: media: Add Allwinner H3 Deinterlace binding
>   media: sun4i: Add H3 deinterlace driver
>   dts: arm: sun8i: h3: Enable deinterlace unit
> 
>  .../bindings/arm/sunxi/sunxi-mbus.txt         |    1 +
>  .../media/allwinner,sun8i-h3-deinterlace.yaml |   75 ++
>  MAINTAINERS                                   |    7 +
>  arch/arm/boot/dts/sun8i-h3.dtsi               |   13 +
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi            |    9 +
>  drivers/clk/sunxi-ng/ccu-sun8i-h3.h           |    4 -
>  drivers/media/platform/Kconfig                |   12 +
>  drivers/media/platform/sunxi/Makefile         |    1 +
>  .../media/platform/sunxi/sun8i-di/Makefile    |    2 +
>  .../media/platform/sunxi/sun8i-di/sun8i-di.c  | 1028 +++++++++++++++++
>  .../media/platform/sunxi/sun8i-di/sun8i-di.h  |  237 ++++
>  include/dt-bindings/clock/sun8i-h3-ccu.h      |    2 +-
>  12 files changed, 1386 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.yaml
>  create mode 100644 drivers/media/platform/sunxi/sun8i-di/Makefile
>  create mode 100644 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
>  create mode 100644 drivers/media/platform/sunxi/sun8i-di/sun8i-di.h
> 

