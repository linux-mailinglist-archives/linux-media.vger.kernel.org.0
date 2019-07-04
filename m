Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5905FD7F
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 21:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfGDTku (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 15:40:50 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54704 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfGDTku (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 15:40:50 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id A926828B136
Subject: Re: [PATCH v7 00/14] Rockchip ISP1 Driver
To:     linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, eddie.cai.linux@gmail.com,
        mchehab@kernel.org, heiko@sntech.de, jacob-chen@iotwrt.com,
        jeffy.chen@rock-chips.com, zyc@rock-chips.com,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        kernel@collabora.com, ezequiel@collabora.com,
        linux-arm-kernel@lists.infradead.org, zhengsq@rock-chips.com,
        Zheng Yang <zhengyang@rock-chips.com>,
        Tony Xie <tony.xie@rock-chips.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20190703190910.32633-1-helen.koike@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Openpgp: preference=signencrypt
Autocrypt: addr=helen.koike@collabora.com; keydata=
 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
Message-ID: <e910e64a-de76-a78a-82cf-0516dfa5a1f1@collabora.com>
Date:   Thu, 4 Jul 2019 16:40:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190703190910.32633-1-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/3/19 4:08 PM, Helen Koike wrote:
> Hello,
> 
> I'm re-sending a new version of ISP(Camera) v4l2 driver for rockchip
> rk3399 SoC.
> 
> It is not perfect yet (see known issues below), but I'm sending in case
> some other people already wants to start playing with it.
> I believe de main design is ok (please let me know if
> it is not) and it would be great to get some reviews already.
> 
> This patchset is also available at:
> https://gitlab.collabora.com/koike/linux/tree/rockchip/isp/v7
> 
> Libcamera patched to work with this version:
> https://gitlab.collabora.com/koike/libcamera
> (I'll also sent it to the libcamera dev mailing list)
> 
> I tested on the rockpi 4 with a rpi v1.3 sensor and also with the
> Scarlet Chromebook.
> Images from the Scarlet are a bit dark and green for some reason, but I
> believe it's a problem in the sensor's drivers as images from the
> rockpi looks ok.

Hi,

[dropping some people in CC, I should be more careful with patman]

Just to be easier to review, follow below the media topology in the Scarlet:

media-ctl --print-dot -> file available at: http://ix.io/1NIH

root@debian:~# media-ctl -p
Media controller API version 5.2.0

Media device information
------------------------
driver          rkisp1
model           rkisp1
serial
bus info        platform: rkisp1
hw revision     0x0
driver version  5.2.0

Device topology
- entity 1: rkisp1-isp-subdev (4 pads, 6 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: Sink
                [fmt:SBGGR10_1X10/1920x1080 field:none
                 crop.bounds:(0,0)/1920x1080
                 crop:(0,0)/800x600]
                <- "ov2685 7-003c":0 []
                <- "ov5695 7-0036":0 [ENABLED]
        pad1: Sink
                [fmt:FIXED/800x600 field:none]
                <- "rkisp1-input-params":0 []
        pad2: Source
                [fmt:YUYV8_2X8/800x600 field:none
                 crop.bounds:(0,0)/800x600
                 crop:(0,0)/800x600]
                -> "rkisp1_selfpath":0 []
                -> "rkisp1_mainpath":0 [ENABLED]
        pad3: Source
                [fmt:FIXED/800x600 field:none]
                -> "rkisp1-statistics":0 []

- entity 6: rkisp1_mainpath (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video0
        pad0: Sink
                <- "rkisp1-isp-subdev":2 [ENABLED]

- entity 10: rkisp1_selfpath (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video1
        pad0: Sink
                <- "rkisp1-isp-subdev":2 []

- entity 14: rkisp1-statistics (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video2
        pad0: Sink
                <- "rkisp1-isp-subdev":3 []

- entity 18: rkisp1-input-params (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video3
        pad0: Source
                -> "rkisp1-isp-subdev":1 []

- entity 22: ov2685 7-003c (1 pad, 1 link)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev1
        pad0: Source
                [fmt:SBGGR10_1X10/1600x1200 field:none]
                -> "rkisp1-isp-subdev":0 []

- entity 24: ov5695 7-0036 (1 pad, 1 link)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev2
        pad0: Source
                [fmt:SBGGR10_1X10/1920x1080 field:none]
                -> "rkisp1-isp-subdev":0 [ENABLED]


Thanks
Helen

> 
> The main differences from previous version are (in a macro pov):
> ----------------------------------------------------------------
> - dphy specific code migrated to drivers/phy
> - design change: droped the subdevice for the interface. Now, in the
> media topology, the sensors connect directly to the ISP1.
> - v4l2-compliance fixes
> - dropped rk3288 (as I'm not testing it)
> - dropped txrx dphy support (as I'm not testing it and it requires a bit
> more work to support dsi too)
> - interrupts and hw config fixes
> - minor bug fixes and cleanups
> - I added myself in the MAINTAINERS, as I'm not sure if previous people
> still wants to maintain it, please let me know if I should keep the old
> names there.
> 
> Known issues:
> -------------
> - Reloading the module doesn't work (there is some missing cleanup when
> unloading)
> - When capturing in bayer format, changing the size doesn't seem to
> affect the image.
> - crop needs more tests
> - v4l2-compliance error:
>         fail: v4l2-test-controls.cpp(824): subscribe event for control 'Image Processing Controls' failed
> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> It seems that if controls are supported, v4l2-compliance says that
> controls of type 'Image Processing Controls' are mandatory, is this
> correct?
> - It seems there are still some issues with interrupts, but I couldn't
> isolate them yet.
> 
> Reasoning for the design change:
> --------------------------------
> In the previous version, the isp subdevice call the mipidphy_g_mbus
> from rkisp1.c, so it can get
> informations from the sensor such as the type of mbus (V4L2_MBUS_BT656,
> V4L2_MBUS_PARALLEL or V4L2_MBUS_CSI2_CPHY), the number of csi2 lanes,
> flags (V4L2_MBUS_PCLK_SAMPLE_RISING, V4L2_MBUS_VSYNC_ACTIVE_LOW or
> V4L2_MBUS_HSYNC_ACTIVE_LOW). And the isp driver uses those info to configure
> the hardware properly.
> 
> These information come from the DT node of the sensor. And the current
> implementation is propagating this information from the sensor to the isp
> through this mipidphy_g_mbus_config() (thus the hack)
> 
> * 1st attempt to solve this hack) Separating the interface code from the isp.
> 
> With the topology:
> 
> isp -> csi2 -> sensor
> 
> I was trying to migrate the CSI2 hardware configuration to the csi2 subdevice code.
> But the problem I found was that in the DT, the csi2 regs is in the middle of the isp1
> regs, and declaring the same "regs = <>" in both nodes (isp0 and csi2) is no good.
> 
> * 2nd attempt) flatening the DT
> So instead of having two DT nodes (isp0 and csi2), we can have a single node, similar
> to omap3isp.
> And we can have a property, "rk,phy-type" that defines the interface (csi2, bt656 or parallel).
> 
> But, now my question is: can the isp be connected to multiple interfaces at a
> time? If yes, then this is not a good solution (as we won't be able to describe
> multiple interfaces in the DT node).
> 
> * 3rd attemp - WIP) get rid of the interface subdevice (chosen design)
> Is there a reason to have the topology like:
> 
> isp -> interface - - -> sensor1
>         |   |-------->  sensor2
>         | - - - - - - > sensor3
> 
> (only one sensor can be active at a time)
> 
> ?
> 
> Would it be ok if I just hide the interface from the topology? Like:
> 
> isp - - - - - -> sensor1
> | |----------->  sensor2
> |- - - - - - - > sensor3
> 
> Like this, I could cleanup a bunch of v4l2 code from the interface node,
> the isp would know the active sensor (and its configs), and it can
> configure everything itself.
> 
> I don't really see a big reason to expose the interface (csi2,
> bt656 or parallel) in the topology.
> Unless I'm missing something.
> 
> Previous changelog:
> -------------------
> 
> changes in V6:
>   - add mipi txrx phy support
>   - remove bool and enum from uapi header
>   - add buf_prepare op
>   - correct some spelling problems
>   - return all queued buffers when starting stream failed
> 
> changes in V5: Sync with local changes,
>   - fix the SP height limit
>   - speed up the second stream capture
>   - the second stream can't force sync for rsz when start/stop streaming
>   - add frame id to param vb2 buf
>   - enable luminance maximum threshold
> 
> changes in V4:
>   - fix some bugs during development
>   - move quantization settings to rkisp1 subdev
>   - correct some spelling problems
>   - describe ports in dt-binding documents
> 
> changes in V3:
>   - add some comments
>   - fix wrong use of v4l2_async_subdev_notifier_register
>   - optimize two paths capture at a time
>   - remove compose
>   - re-struct headers
>   - add a tmp wiki page: http://opensource.rock-chips.com/wiki_Rockchip-isp1
> 
> changes in V2:
>   mipi-phy:
>     - use async probing
>     - make it be a child device of the GRF
>   isp:
>     - add dummy buffer
>     - change the way to get bus configuration, which make it possible to
>             add parallel sensor support in the future(without mipi-phy driver).
> 
> ------------------
> 
> Changes in v7:
> - s/IPU3/RK_ISP1
> - s/correspond/corresponding
> - s/use/uses
> - s/docuemnt/document
> - Fix checkpatch errors (lines over 80 and SPDX)
> - Add TODO to improve docs
> - Migrate dphy specific code from
> drivers/media/platform/rockchip/isp1/mipi_dphy_sy.c
> to drivers/phy/rockchip/phy-rockchip-dphy.c
> - Drop support for rk3288
> - Drop support for dphy txrx
> - code styling and checkpatch fixes
> - fixed warning because of unknown entity type
> - fixed v4l2-compliance errors regarding rkisp1 formats, try formats
> and default values
> - fix typo riksp1/rkisp1
> - redesign: remove mipi/csi subdevice, sensors connect directly to the
> isp subdevice in the media topology now. As a consequence, remove the
> hack in mipidphy_g_mbus_config() where information from the sensor was
> being propagated through the topology.
> - From the old dphy:
>         * cache get_remote_sensor() in s_stream
>         * use V4L2_CID_PIXEL_RATE instead of V4L2_CID_LINK_FREQ
> - Replace stream state with a boolean
> - code styling and checkpatch fixes
> - fix stop_stream (return after calling stop, do not reenable the stream)
> - fix rkisp1_isp_sd_get_selection when V4L2_SUBDEV_FORMAT_TRY is set
> - fix get format in output (isp_sd->out_fmt.mbus_code was being ignored)
> - s/intput/input
> - remove #define sd_to_isp_sd(_sd), add a static inline as it will be
> reused by the capture
> - s/strlcpy/strscpy
> - sort out the locks in isp stats
> - code styling and checkpatch fixes
> - s/strlcpy/strscpy
> - s/strcpy/strscpy
> - fix config lsc error
> LSC data table size is 17x17, but when configuring data to ISP,
> should be aligned to 18x17. That means every last data of last
> line should be filled with 0, and not filled with the data of
> next line.
> - Update new ISP parameters immediately
> For those sub modules that have shadow registers in core isp, the
> new programing parameters would not be active if both
> CIF_ISP_CTRL_ISP_CFG_UPD_PERMANENT and CFG_UPD are not set. Now
> we configure CFG_UPD to force update the shadow registers when new
> ISP parameters are configured.
> - fix some ISP parameters config error
> Some ISP parameter config functions may override the old enable
> bit value, because the enable bits of these modules are in the
> same registers with parameters. So we should save the old enable
> bits firstly.
> - code styling and checkpatch fixes
> - s/strlcpy/strscpy
> - Fix v4l2-compliance issues:
>         * remove input ioctls
> media api can be used to define the topology, this input api is not
> required. Besides it, if an input is enumerated, v4l2-compliance is not
> happy with G_FMT returning the default colorspace instead of something
> more specific.
>         * return the pixelformat to the userspace
> G_/S_/TRY_ FORMAT should return a valid pixelformat to the user, even if
> the user gave an invalid one
>         * add missing default colorspace and ycbcr
>         * fix wrong pixformat in mp_fmts[] table
>         * add buf type check in s_/g_selection
>         * queue_setup - check sizes
>         * normalize bus_info name
>         * fix field any v4l2-compliance -s complain - set field none
>         when streaming
> - Fix compiling error: s/vidioc_enum_fmt_vid_cap_mplane/vidioc_enum_fmt_vid_cap
> - Replace stream state with a boolean
> The rkisp1_state enum consists only of 3 entries, where 1 is completely
> unused and the other two respectively mean not streaming or streaming.
> Replace it with a boolean called "streaming".
> - Simplify MI interrupt handling
> Rather than adding unnecessary indirection, just use stream index to
> handle MI interrupt enable/disable/clear, since the stream index matches
> the order of bits now, thanks to previous patch. While at it, remove
> some dead code.
> - code styling and checkpatch fixes
> - add link_validate: don't allow a link with bayer/non-bayer mismatch
> - VIDEO_ROCKCHIP_ISP1 selects VIDEOBUF2_VMALLOC
> - add PHY_ROCKCHIP_DPHY as a dependency for VIDEO_ROCKCHIP_ISP1
> - Fix compilation and runtime errors due to bitrotting
> The code has bit-rotten since March 2018, fix compilation errors.
> The new V4L2 async notifier API requires notifiers to be initialized by
> a call to v4l2_async_notifier_init() before being used, do so.
> - Add missing module device table
> - use clk_bulk framework
> - add missing notifiers cleanups
> - s/strlcpy/strscpy
> - normalize bus_info name
> - fix s_stream error path, stream_cnt wans't being decremented properly
> - use devm_platform_ioremap_resource() helper
> - s/deice/device
> - redesign: remove mipi/csi subdevice, sensors connect directly to the
> isp subdevice in the media topology now.
> - remove "saved_state" member from rkisp1_stream struct
> - Reverse the order of MIs
> - Simplify MI interrupt handling
> Rather than adding unnecessary indirection, just use stream index to
> handle MI interrupt enable/disable/clear, since the stream index matches
> the order of bits now, thanks to previous patch. While at it, remove
> some dead code.
> - code styling and checkpatch fixes
> - update document with new design and tested example
> - updated doc with new design and tested example
> - add phy properties
> - add ports
> - add phy-cells
> 
> Helen Koike (1):
>   MAINTAINERS: add entry for Rockchip ISP1 driver
> 
> Jacob Chen (9):
>   media: doc: add document for rkisp1 meta buffer format
>   media: rkisp1: add Rockchip MIPI Synopsys DPHY driver
>   media: rkisp1: add Rockchip ISP1 subdev driver
>   media: rkisp1: add ISP1 statistics driver
>   media: rkisp1: add ISP1 params driver
>   media: rkisp1: add capture device driver
>   media: rkisp1: add rockchip isp1 core driver
>   dt-bindings: Document the Rockchip ISP1 bindings
>   dt-bindings: Document the Rockchip MIPI RX D-PHY bindings
> 
> Jeffy Chen (1):
>   media: rkisp1: Add user space ABI definitions
> 
> Shunqian Zheng (3):
>   media: videodev2.h, v4l2-ioctl: add rkisp1 meta buffer format
>   arm64: dts: rockchip: add isp0 node for rk3399
>   arm64: dts: rockchip: add rx0 mipi-phy for rk3399
> 
>  .../bindings/media/rockchip-isp1.txt          |   71 +
>  .../bindings/media/rockchip-mipi-dphy.txt     |   38 +
>  Documentation/media/uapi/v4l/meta-formats.rst |    2 +
>  .../uapi/v4l/pixfmt-meta-rkisp1-params.rst    |   20 +
>  .../uapi/v4l/pixfmt-meta-rkisp1-stat.rst      |   18 +
>  MAINTAINERS                                   |    8 +
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi      |   36 +
>  drivers/media/platform/Kconfig                |   12 +
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/rockchip/isp1/Makefile |    7 +
>  .../media/platform/rockchip/isp1/capture.c    | 1754 +++++++++++++++++
>  .../media/platform/rockchip/isp1/capture.h    |  164 ++
>  drivers/media/platform/rockchip/isp1/common.h |  101 +
>  drivers/media/platform/rockchip/isp1/dev.c    |  675 +++++++
>  drivers/media/platform/rockchip/isp1/dev.h    |   97 +
>  .../media/platform/rockchip/isp1/isp_params.c | 1604 +++++++++++++++
>  .../media/platform/rockchip/isp1/isp_params.h |   50 +
>  .../media/platform/rockchip/isp1/isp_stats.c  |  508 +++++
>  .../media/platform/rockchip/isp1/isp_stats.h  |   60 +
>  drivers/media/platform/rockchip/isp1/regs.c   |  223 +++
>  drivers/media/platform/rockchip/isp1/regs.h   | 1525 ++++++++++++++
>  drivers/media/platform/rockchip/isp1/rkisp1.c | 1286 ++++++++++++
>  drivers/media/platform/rockchip/isp1/rkisp1.h |  111 ++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
>  drivers/phy/rockchip/Kconfig                  |    8 +
>  drivers/phy/rockchip/Makefile                 |    1 +
>  drivers/phy/rockchip/phy-rockchip-dphy.c      |  412 ++++
>  include/uapi/linux/rkisp1-config.h            |  816 ++++++++
>  include/uapi/linux/videodev2.h                |    4 +
>  29 files changed, 9614 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-isp1.txt
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt
>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
>  create mode 100644 drivers/media/platform/rockchip/isp1/Makefile
>  create mode 100644 drivers/media/platform/rockchip/isp1/capture.c
>  create mode 100644 drivers/media/platform/rockchip/isp1/capture.h
>  create mode 100644 drivers/media/platform/rockchip/isp1/common.h
>  create mode 100644 drivers/media/platform/rockchip/isp1/dev.c
>  create mode 100644 drivers/media/platform/rockchip/isp1/dev.h
>  create mode 100644 drivers/media/platform/rockchip/isp1/isp_params.c
>  create mode 100644 drivers/media/platform/rockchip/isp1/isp_params.h
>  create mode 100644 drivers/media/platform/rockchip/isp1/isp_stats.c
>  create mode 100644 drivers/media/platform/rockchip/isp1/isp_stats.h
>  create mode 100644 drivers/media/platform/rockchip/isp1/regs.c
>  create mode 100644 drivers/media/platform/rockchip/isp1/regs.h
>  create mode 100644 drivers/media/platform/rockchip/isp1/rkisp1.c
>  create mode 100644 drivers/media/platform/rockchip/isp1/rkisp1.h
>  create mode 100644 drivers/phy/rockchip/phy-rockchip-dphy.c
>  create mode 100644 include/uapi/linux/rkisp1-config.h
> 
