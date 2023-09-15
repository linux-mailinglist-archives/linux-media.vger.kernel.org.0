Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45ADC7A19EB
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 11:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbjIOJFi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 05:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232335AbjIOJFf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 05:05:35 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E6CB3C3B;
        Fri, 15 Sep 2023 02:04:01 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D849C433C7;
        Fri, 15 Sep 2023 09:02:30 +0000 (UTC)
Message-ID: <179c7dd2-1d72-4a95-bab5-326188554b98@xs4all.nl>
Date:   Fri, 15 Sep 2023 11:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v9 0/2] Digiteq Automotive MGB4 driver
Content-Language: en-US, nl
To:     tumic@gpxsee.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Martin_T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
References: <20230912120745.902-1-tumic@gpxsee.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230912120745.902-1-tumic@gpxsee.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On 12/09/2023 14:07, tumic@gpxsee.org wrote:
> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
> 
> Hi,
> This patch adds a driver for the Digiteq Automotive MGB4 grabber card.
> MGB4 is a modular frame grabber PCIe card for automotive video interfaces
> (FPD-Link and GMSL for now). It is based on a Xilinx FPGA and uses their
> XDMA IP core for DMA transfers. Additionally, Xilinx I2C and SPI IP cores
> which already have drivers in linux are used in the design.
> 
> The driver is a quite standard v4l2 driver, with one exception - there are
> a lot of sysfs options that may/must be set before opening the v4l2 device
> to adapt the card on a specific signal (see mgb4.rst for details)
> as the card must be able to work with various signal sources (or displays)
> that can not be auto-detected.

First of all, there is no need to resend patches. Just check if they are in
patchwork.linuxtv.org. It is fine to ping me, but resending just means the
same patches end up twice in patchwork.

Secondly, when running my build script I found a number of issues:

sparse: WARNINGS:

drivers/media/pci/mgb4/mgb4_core.c:572:78: warning: Using plain integer as NULL pointer
drivers/media/pci/mgb4/mgb4_vin.c:605:41: warning: Using plain integer as NULL pointer
drivers/media/pci/mgb4/mgb4_vout.c:336:41: warning: Using plain integer as NULL pointer
drivers/media/pci/mgb4/mgb4_sysfs_out.c:67:43: warning: Using plain integer as NULL pointer
drivers/media/pci/mgb4/mgb4_sysfs_out.c:67:60: warning: Using plain integer as NULL pointer
drivers/media/pci/mgb4/mgb4_sysfs_out.c:83:9: warning: context imbalance in 'video_source_store' - different lock contexts for basic block

smatch: WARNINGS:

drivers/media/pci/mgb4/mgb4_cmt.c:187 freq_srch() error: uninitialized symbol 'm'.

Those should be fixed.

You can run the same tests yourself, see this announcement:

https://lore.kernel.org/linux-media/18989016-6392-a77b-6cf7-1223c9161def@xs4all.nl/

Regards,

	Hans

> 
> Changes in v9:
> * Renamed all sysfs show/store functions using the propper naming convention.
> * Now using device_add_groups() when initializing the sysfs properties.
> * Fixed build without debugfs support.
> * Fixed documentation (vsync/hsync) + added default values where applicable.
> * Fixed the rest of minor issues from v8 review.
> 
> Changes in v8:
> * Fixed broken video buffer size computation.
> * Fixed switched I2C deserializers addresses.
> * Do not depend on hwmon.
> 
> Changes in v7:
> * Now using hwmon for FPGA temperature reporting.
> * Now using VIDIOC_S_FMT and v4l2_pix_format.bytesperline for setting
>   the alignment.
> * Removed the magic sleep when loading the i2c/spi adapter modules (solved by
>   request_module() calls with propper - "platform:" prefixed - module
>   names).
> * Now properly reporting all the timings info in the VIDIOC_G_DV_TIMINGS
>   ioctls.
> * Updated the documentation.
> * Minor fixes as discussed in the v6 review.
> * Added debugfs access to the FPGA registers.
> 
> Changes in v6:
> * Rebased to current master that includes the Xilinx XDMA driver.
> 
> Changes in v5:
> * Removed unused <linux/version.h> includes
> 
> Changes in v4:
> * Redesigned the signal change handling logic. Now using the propper timings
>   API in the video input driver and a propper open() syscall check/logic in
>   the video output driver.
> * Fixed all minor issues from v3 review.
> * 'checkpatch.pl --strict' used for checking the code.
> 
> Changes in v3:
> * Rebased the DMA transfers part to use the new XDMA driver from Xilinx/AMD
> 
> Changes in v2:
> * Completely rewritten the original Xilinx's XDMA driver to meet kernel code
>   standards.
> * Added all required "to" and "cc" mail addresses.
> 
> 
> ===== v4l2-compliance results - input =====
> 
> v4l2-compliance 1.24.1, 64 bits, 64-bit time_t
> 
> Compliance test for mgb4 device /dev/video0:
> 
> Driver Info:
>         Driver name      : mgb4
>         Card type        : MGB4 PCIe Card
>         Bus info         : PCI:0000:01:00.0
>         Driver version   : 6.4.0
>         Capabilities     : 0x85200001
>                 Video Capture
>                 Read/Write
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x05200001
>                 Video Capture
>                 Read/Write
>                 Streaming
>                 Extended Pix Format
> 
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
>         test invalid ioctls: OK
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
>         test VIDIOC_G/S/ENUMINPUT: OK
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 1 Audio Inputs: 0 Tuners: 0
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
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
>         test VIDIOC_DV_TIMINGS_CAP: OK
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls (Input 0):
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>                 warn: v4l2-test-controls.cpp(1139): V4L2_CID_DV_RX_POWER_PRESENT not found for input 0
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
> 
> Format ioctls (Input 0):
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 0):
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
> 
> Total for mgb4 device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 1
> 
> ===== v4l2-compliance results - output =====
> 
> v4l2-compliance 1.24.1, 64 bits, 64-bit time_t
> 
> Compliance test for mgb4 device /dev/video2:
> 
> Driver Info:
>         Driver name      : mgb4
>         Card type        : MGB4 PCIe Card
>         Bus info         : PCI:0000:01:00.0
>         Driver version   : 6.4.0
>         Capabilities     : 0x85200002
>                 Video Output
>                 Read/Write
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x05200002
>                 Video Output
>                 Read/Write
>                 Streaming
>                 Extended Pix Format
> 
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
>         test invalid ioctls: OK
> 
> Allow for multiple opens:
>         test second /dev/video2 open: OK
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
>         test VIDIOC_G/S/ENUMOUTPUT: OK
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 1 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls (Output 0):
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
> 
> Format ioctls (Output 0):
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls (Output 0):
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Output 0):
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
> 
> Total for mgb4 device /dev/video2: 45, Succeeded: 45, Failed: 0, Warnings: 0
> 
> Martin Tůma (2):
>   Added Digiteq Automotive MGB4 driver
>   Added Digiteq Automotive MGB4 driver documentation
> 
>  Documentation/admin-guide/media/mgb4.rst      | 374 +++++++
>  .../admin-guide/media/pci-cardlist.rst        |   1 +
>  .../admin-guide/media/v4l-drivers.rst         |   1 +
>  MAINTAINERS                                   |   7 +
>  drivers/media/pci/Kconfig                     |   1 +
>  drivers/media/pci/Makefile                    |   1 +
>  drivers/media/pci/mgb4/Kconfig                |  17 +
>  drivers/media/pci/mgb4/Makefile               |   6 +
>  drivers/media/pci/mgb4/mgb4_cmt.c             | 244 +++++
>  drivers/media/pci/mgb4/mgb4_cmt.h             |  17 +
>  drivers/media/pci/mgb4/mgb4_core.c            | 685 +++++++++++++
>  drivers/media/pci/mgb4/mgb4_core.h            |  72 ++
>  drivers/media/pci/mgb4/mgb4_dma.c             | 123 +++
>  drivers/media/pci/mgb4/mgb4_dma.h             |  18 +
>  drivers/media/pci/mgb4/mgb4_i2c.c             | 140 +++
>  drivers/media/pci/mgb4/mgb4_i2c.h             |  35 +
>  drivers/media/pci/mgb4/mgb4_io.h              |  33 +
>  drivers/media/pci/mgb4/mgb4_regs.c            |  30 +
>  drivers/media/pci/mgb4/mgb4_regs.h            |  35 +
>  drivers/media/pci/mgb4/mgb4_sysfs.h           |  18 +
>  drivers/media/pci/mgb4/mgb4_sysfs_in.c        | 753 ++++++++++++++
>  drivers/media/pci/mgb4/mgb4_sysfs_out.c       | 693 +++++++++++++
>  drivers/media/pci/mgb4/mgb4_sysfs_pci.c       |  71 ++
>  drivers/media/pci/mgb4/mgb4_trigger.c         | 208 ++++
>  drivers/media/pci/mgb4/mgb4_trigger.h         |   8 +
>  drivers/media/pci/mgb4/mgb4_vin.c             | 932 ++++++++++++++++++
>  drivers/media/pci/mgb4/mgb4_vin.h             |  69 ++
>  drivers/media/pci/mgb4/mgb4_vout.c            | 594 +++++++++++
>  drivers/media/pci/mgb4/mgb4_vout.h            |  65 ++
>  29 files changed, 5251 insertions(+)
>  create mode 100644 Documentation/admin-guide/media/mgb4.rst
>  create mode 100644 drivers/media/pci/mgb4/Kconfig
>  create mode 100644 drivers/media/pci/mgb4/Makefile
>  create mode 100644 drivers/media/pci/mgb4/mgb4_cmt.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_cmt.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_core.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_core.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_dma.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_dma.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_i2c.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_i2c.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_io.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_regs.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_regs.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_in.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_out.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_pci.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_trigger.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_trigger.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_vin.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_vin.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_vout.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_vout.h
> 
> 
> base-commit: 374a7f47bf401441edff0a64465e61326bf70a82

