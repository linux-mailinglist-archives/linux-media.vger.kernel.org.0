Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF3B50DA0C
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 09:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236496AbiDYH2a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 03:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235687AbiDYH2X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 03:28:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E3A65AD;
        Mon, 25 Apr 2022 00:25:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3DEE0612B5;
        Mon, 25 Apr 2022 07:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D60CC385A7;
        Mon, 25 Apr 2022 07:25:14 +0000 (UTC)
Message-ID: <50ffcfdc-97b0-29ea-1f08-dd5b778bad73@xs4all.nl>
Date:   Mon, 25 Apr 2022 09:25:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 0/9] i.MX8MP DW100 dewarper driver
Content-Language: en-US
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>, mchehab@kernel.org,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.5 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/03/2022 16:13, Xavier Roumegue wrote:
> This patchset depends on the series "imx8mp: Add media block control"[1] and
> "i.MX8MP GPC and blk-ctrl"[2] which provide the power driver infrastructure.
> 
> Previous series can now be marked as superseded.
> v1:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=7443
> v2:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=7472
> v3:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=7473
> 
> Patches [1-3/9] add support for dynamic array control imported from the
> "Move HEVC stateless controls out of staging"[3] currently under review.
> 
> Patches [4-7/9] document the driver interfaces, and export its v4l2 custom
> control to uapi headers.
> 
> Patches [8/9] adds the v4l2 m2m driver.
> Patches [9/9] adds the driver to MAINTAINERS.
> 
> The patch baseline is linuxtv-tree/master.
> 
> The Vivante DW100 Dewarp Engine, found on i.MX8MP SoC, provides high-performance
> dewarp processing for the correction of the distortion that is introduced in
> images produced by fisheye and wide angle lenses. The engine can be used for
> accelerating scaling, cropping and pixel format conversion operations
> independently of the dewarping feature.
> 
> A script example [4] has been published to generate the dewarping blob from
> outgoing openCV 3d calibration process parameters. This scrict can generate
> identity map with h/v flip, dewarping and stereo rectification mappings.
> 
> The driver has been tested with:
> - v4l2-ctl (from master with [6]) for testing pixel format conversion, scaling
>   and crop features using builtin driver identity map.
> - OpenCV stereo application using dedicated dw100 openCV module [5] to implement
>   stereo rectification stage.
> - GStreamer v4l2convert (patched to support dewarping blob map injection)
> - v4l2-compliance (test report added after changelog)
> 
> [1] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=626781
> [2] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=618869
> [3] https://patchwork.linuxtv.org/project/linux-media/list/?series=7418
> [4] https://github.com/NXPmicro/vtec-cv/tree/main/bin
> [5] https://github.com/NXPmicro/vtec-opencv
> [6] https://patchwork.linuxtv.org/project/linux-media/list/?series=7595
> 
> ---
> Changelog:
> 
> v4:
> - Move dw100 driver to NXP platform media drivers folder
> - Change dt compatible string to "nxp,imx8mp-dw100"
> - Rename V4L2_CID_DW100_MAPPING to V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP
> - Add more verbose description of V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP
> - Handle v4l2 controls as an array in driver.
> 
> v3:
> - Fix incorrect i.MX8MP Reference Manual link in documentation
> 
> v2:
> - Fix yaml dt-bindings errors
> - Drop assigned-clocks properties from dt-bindings example
> - Add dw100 driver documentation
> - Rework V4L2 LUT assignment with v4l2 dynamic array control
> - Rename V4L2_CID_DW100_LUT to V4L2_CID_DW100_MAPPING
> - Export V4L2_CID_DW100_MAPPING to kernel headers
> 
> Hans Verkuil (3):
>   videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
>   v4l2-ctrls: add support for dynamically allocated arrays.
>   vivid: add dynamic array test control
> 
> Xavier Roumegue (6):
>   media: Documentation: dw100: Add user documentation for the DW100
>     driver
>   media: v4l: uapi: Add user control base for DW100 controls
>   media: uapi: Add a control for DW100 driver
>   media: dt-bindings: media: Add i.MX8MP DW100 binding
>   media: dw100: Add i.MX8MP dw100 dewarper driver
>   media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver
> 
>  .../devicetree/bindings/media/nxp,dw100.yaml  |   69 +
>  .../userspace-api/media/drivers/dw100.rst     |   35 +
>  .../userspace-api/media/drivers/index.rst     |    1 +
>  .../media/v4l/vidioc-queryctrl.rst            |    8 +
>  MAINTAINERS                                   |    9 +
>  drivers/media/platform/nxp/Kconfig            |    1 +
>  drivers/media/platform/nxp/Makefile           |    1 +
>  drivers/media/platform/nxp/dw100/Kconfig      |   16 +
>  drivers/media/platform/nxp/dw100/Makefile     |    3 +
>  drivers/media/platform/nxp/dw100/dw100.c      | 1763 +++++++++++++++++
>  drivers/media/platform/nxp/dw100/dw100_regs.h |  118 ++
>  .../media/test-drivers/vivid/vivid-ctrls.c    |   15 +
>  drivers/media/v4l2-core/v4l2-ctrls-api.c      |  103 +-
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     |  182 +-
>  drivers/media/v4l2-core/v4l2-ctrls-priv.h     |    3 +-
>  drivers/media/v4l2-core/v4l2-ctrls-request.c  |   13 +-
>  include/media/v4l2-ctrls.h                    |   42 +-
>  include/uapi/linux/dw100.h                    |   11 +
>  include/uapi/linux/v4l2-controls.h            |    6 +-
>  include/uapi/linux/videodev2.h                |    1 +
>  20 files changed, 2328 insertions(+), 72 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml
>  create mode 100644 Documentation/userspace-api/media/drivers/dw100.rst
>  create mode 100644 drivers/media/platform/nxp/dw100/Kconfig
>  create mode 100644 drivers/media/platform/nxp/dw100/Makefile
>  create mode 100644 drivers/media/platform/nxp/dw100/dw100.c
>  create mode 100644 drivers/media/platform/nxp/dw100/dw100_regs.h
>  create mode 100644 include/uapi/linux/dw100.h
> 
> ============
> Compliance
> ============
> # v4l2-compliance -d 0
> v4l2-compliance 1.23.0, 64 bits, 64-bit time_t

This isn't compiled from the v4l-utils repository since I am missing
a 'SHA' line.

As of today you should see something like this:

$ v4l2-compliance --version
v4l2-compliance 1.23.0-4922, 64 bits, 64-bit time_t
v4l2-compliance SHA: 6de743337007 2022-04-07 11:29:29

And running 'v4l2-compliance -d 0' should show that SHA as well.

The compliance test of a driver must always use the latest v4l2-compliance
compiled from the repository, that way I know all the latest tests are
run.

Regards,

	Hans

> 
> Compliance test for dw100 device /dev/video0:
> 
> Driver Info:
>     Driver name      : dw100
>     Card type        : DW100 dewarper
>     Bus info         : platform:dw100
>     Driver version   : 5.17.0
>     Capabilities     : 0x84208000
>         Video Memory-to-Memory
>         Streaming
>         Extended Pix Format
>         Device Capabilities
>     Device Caps      : 0x04208000
>         Video Memory-to-Memory
>         Streaming
>         Extended Pix Format
> Media Driver Info:
>     Driver name      : dw100
>     Model            : dw100
>     Serial           :
>     Bus info         : platform:dw100
>     Media version    : 5.17.0
>     Hardware revision: 0x00000000 (0)
>     Driver version   : 5.17.0
> Interface Info:
>     ID               : 0x0300000c
>     Type             : V4L Video
> Entity Info:
>     ID               : 0x00000001 (1)
>     Name             : dw100-source
>     Function         : V4L2 I/O
>     Pad 0x01000002   : 0: Source
>       Link 0x02000008: to remote pad 0x1000004 of entity 'dw100-proc' (Video Scaler): Data, Enabled, Immutable
> 
> Required ioctls:
>     test MC information (see 'Media Driver Info' above): OK
>     test VIDIOC_QUERYCAP: OK
>     test invalid ioctls: OK
> 
> Allow for multiple opens:
>     test second /dev/video0 open: OK
>     test VIDIOC_QUERYCAP: OK
>     test VIDIOC_G/S_PRIORITY: OK
>     test for unlimited opens: OK
> 
> Debug ioctls:
>     test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>     test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>     test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>     test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>     test VIDIOC_ENUMAUDIO: OK (Not Supported)
>     test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>     test VIDIOC_G/S_AUDIO: OK (Not Supported)
>     Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>     test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>     test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>     test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>     test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>     Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>     test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>     test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>     test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>     test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>     test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>     test VIDIOC_QUERYCTRL: OK
>     test VIDIOC_G/S_CTRL: OK
>     test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>     test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>     test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>     Standard Controls: 1 Private Controls: 1
>     Standard Compound Controls: 0 Private Compound Controls: 1
> 
> Format ioctls:
>     test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>     test VIDIOC_G/S_PARM: OK (Not Supported)
>     test VIDIOC_G_FBUF: OK (Not Supported)
>     test VIDIOC_G_FMT: OK
>     test VIDIOC_TRY_FMT: OK
>     test VIDIOC_S_FMT: OK
>     test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>     test Cropping: OK
>     test Composing: OK
>     test Scaling: OK
> 
> Codec ioctls:
>     test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>     test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>     test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>     test VIDIOC_EXPBUF: OK
>     test Requests: OK (Not Supported)
> 
> Total for dw100 device /dev/video0: 46, Succeeded: 46, Failed: 0, Warnings: 0
> 
> ==============
> Media controller
> ==============
> # media-ctl -d 0 -p
> Media controller API version 5.17.0
> 
> Media device information
> ------------------------
> driver          dw100
> model           dw100
> serial
> bus info        platform:dw100
> hw revision     0x0
> driver version  5.17.0
> 
> Device topology
> - entity 1: dw100-source (1 pad, 1 link, 0 route)
>             type Node subtype V4L flags 0
>             device node name /dev/video0
>     pad0: Source
>         -> "dw100-proc":0 [ENABLED,IMMUTABLE]
> 
> - entity 3: dw100-proc (2 pads, 2 links, 0 route)
>             type Node subtype Unknown flags 0
>     pad0: Sink
>         <- "dw100-source":0 [ENABLED,IMMUTABLE]
>     pad1: Source
>         -> "dw100-sink":0 [ENABLED,IMMUTABLE]
> 
> - entity 6: dw100-sink (1 pad, 1 link, 0 route)
>             type Node subtype V4L flags 0
>             device node name /dev/video0
>     pad0: Sink
>         <- "dw100-proc":1 [ENABLED,IMMUTABLE]
> 
> --
> 2.35.1
> 

