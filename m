Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14A513D0C2D
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 12:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237205AbhGUJTr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 05:19:47 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:42341 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237655AbhGUI6l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 04:58:41 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 68gVm0leUhqx968gXmyUsr; Wed, 21 Jul 2021 11:38:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1626860317; bh=hzjKfB2pNKDbXyVGmdxbyvpva2AdUcTazrG+AjnpdFE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vHk7UrYE9FJzusHyejKaseKdkiKovgCP1XDSI7d1273s8r78bzMZZEaAvmorIdgcE
         JRTH8ur639k44GQjIOvwI7FH76N63847KcT/f99EBhkVbvnxH9ii54PnGRsO1N3sTA
         XLovAc97TjWrOhKnjHQUZKaG6zh1z7VU651HhYAqZY58KBv7/AzuxC/AtsyBZKI/8m
         Ccuy7H6YN6kJipiz8E6KaTX3CyzoJga7oSCWSHsrJmeBcJGCDYr4S0XzBlYUvDAL2C
         F6iwnA/Kfhk++6TbipQTe6jz/4myfmld5DK4dGNwB7JyfmVbeYfZYLJfeEIZMK3PP9
         Vst6IxpD7Xeug==
Subject: Re: [EXT] Re: [PATCH v4 00/13] imx8q video decoder/encoder driver
To:     Ming Qian <ming.qian@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <cover.1626743758.git.ming.qian@nxp.com>
 <66908d2b-d553-d982-3609-e0c6d0f7960c@xs4all.nl>
 <AM6PR04MB634150E6B5663100069824D5E7E39@AM6PR04MB6341.eurprd04.prod.outlook.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <27bcc9d2-c0ba-46cd-36c3-95e13fe6a0a9@xs4all.nl>
Date:   Wed, 21 Jul 2021 11:38:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <AM6PR04MB634150E6B5663100069824D5E7E39@AM6PR04MB6341.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKKWx4w0JpKpbhmjqDpfWZejAHP2GugvRvr40AZEuMJasYxxgqoTj17MzOPOcxJsFJTow4CV08wzZOq2HibvMJ9aZfWB3fOBKiWw0R2tZtK9PysM9T8n
 GHPFoBa5YHjGyoko7QTBp0OYfdnYwp2ADKLlZLH7Fd8FKmA63kNZzS4W01iqYy2AoFh+MEL0Pzsr/zo6ZfbK5+4blTrXAn+AVoVbZMEJLqE9l9UV7QHw+w4r
 STeegDGRqcwCNJSOo146HWwoCEBr7zvmn99T23tBz/MQ8etgNg9HiUKH7dMx8o8h5+EbxwH2Hk8aNtgEpArje7DVv3dcfnIi7kXPYcU/kMGs5OqZhQbYfBZr
 6mv4RgcxIbmlkmWI1mbUSJoVHa41N30hINYnjagmzpuo8pxR3aXS6RkrLm7FYONRnXBw2EtBz4bBxR87G16BxOO/cDEXrHgGIEDARvZSdIXqWMvyOZiF2gX9
 /hvd/mCUzke9CJpptqV8O3bVfvMN7tcSvOiL4mDqyU8spEgUaPL66QfVn/2XHUc/XtP2NwZVScWg1HEZCkwXt8JgcLp4SJgfbglMmNUAJqim8cllD3scXCJ+
 OPKmfy8Kln9+k+ExMpyx9O6XYJuI4x/YMsonP6zKdRydqFuUG1XxQkHHpX9TUbNVChB7b3yfpd/IIs1+61ZGt8Ti+jNQ8Hl7x8bGOB9U4nRKqxJrpOPamkJg
 5oIP6UZ2jyw=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/07/2021 10:53, Ming Qian wrote:
>> Hi Ming Qian,
>>
>> Thank you for working on this.
>>
>> Some high-level comments:
>>
>> First of all, it looks like this series is based on a nxp-kernel. I noticed references
>> to e.g. V4L2_COLORSPACE_GENERIC_FILM which doesn't exist in the mainline
>> kernel. The patch series really should be based on the mainline kernel, or
>> (preferred) the linux-media kernel
>> (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.linu
>> xtv.org%2Fmedia_tree.git%2F&amp;data=04%7C01%7Cming.qian%40nxp.com
>> %7C3b39b6df4e6746d5e5c308d94c19dd55%7C686ea1d3bc2b4c6fa92cd99c
>> 5c301635%7C0%7C1%7C637624496237171229%7CUnknown%7CTWFpbGZs
>> b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
>> %3D%7C2000&amp;sdata=FlBIfE5%2BT3vsO7urAeeic%2FslWCQIR0VhuUuhx8Z
>> Xizk%3D&amp;reserved=0,
>> master branch).
> 
> Hi Hans,
>    The patches are indeed based on linux-media kernel, and the V4L2_COLORSPACE_GENERIC_FILM is added in the patch "media: v4l: add some definition of v4l2 colorspace/xfer_func/ycbcr_encoding", which is the second patch of these series.

My mistake, for some reason I totally overlooked that patch. Weird.

Regards,

	Hans

> 
>>
>> On 20/07/2021 03:43, Ming Qian wrote:
>>> Hi all,
>>>
>>> This patch series adds support for
>>> the imx8q video encoder and decoder
>>> via the VPU block present in imx8q platforms.
>>> Currently, support for IMX8QXP and IMX8QM is included.
>>>
>>> It features decoding for the following formats:
>>> - H.264
>>> - HEVC
>>> - MPEG4
>>> - MPEG2
>>> - MJPEG
>>> - VC1
>>> - VP8
>>> - AVS
>>>
>>> It features encoding for the following formats:
>>> - H.264
>>>
>>> The driver creates a separate device node for the encoder and decoder.
>>>
>>> Changelog:
>>>
>>> v4:
>>> - redefine the memory-region in devicetree bindings documentation
>>> - use v4l2's mechanism to implement synchronize queuing ioctl
>>> - remove the unnecessary mutex ioctl_sync
>>> - don't notify source change event if the parameters are same as
>>> previously established
>>> - add flag V4L2_FMT_FLAG_DYN_RESOLUTION to decoder's capture format
>>>
>>> v3:
>>> - don't make vpu device node a simple-bus
>>> - trigger probing vpu core in the driver
>>> - remove unnecessary vpu core index property
>>>
>>> v2:
>>> - fix dt bindings build error
>>> - split driver patch into several parts to avoid exceeding bytes limit
>>>
>>> Compliance
>>> ==========
>>> # v4l2-compliance -d /dev/video0
>>> v4l2-compliance SHA: not available
>>> , 64 bits, 64-bit time_t
>>
>> Always compile v4l2-compliance from the git repo
>> (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.linu
>> xtv.org%2Fv4l-utils.git%2F&amp;data=04%7C01%7Cming.qian%40nxp.com%7
>> C3b39b6df4e6746d5e5c308d94c19dd55%7C686ea1d3bc2b4c6fa92cd99c5c3
>> 01635%7C0%7C1%7C637624496237171229%7CUnknown%7CTWFpbGZsb3d
>> 8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
>> D%7C2000&amp;sdata=%2FWh5ObGzfWN%2B2z4J9qhuM7bpA%2Fd6iaZbJw
>> QhMI%2FdzFI%3D&amp;reserved=0).
>> Otherwise I cannot tell whether it is a recent version or if it is old. Since there is
>> no SHA I'm going with old.
>>
> 
> OK, I'll use the latest v4l2-compliance to test it again.
> 
>>>
>>> Compliance test for vpu B0 device /dev/video0:
>>>
>>> Driver Info:
>>>       Driver name      : vpu B0
>>>       Card type        : imx vpu decoder
>>>       Bus info         : platform: imx8q-vpu
>>>       Driver version   : 5.10.35
>>>       Capabilities     : 0x84204000
>>>               Video Memory-to-Memory Multiplanar
>>>               Streaming
>>>               Extended Pix Format
>>>               Device Capabilities
>>>       Device Caps      : 0x04204000
>>>               Video Memory-to-Memory Multiplanar
>>>               Streaming
>>>               Extended Pix Format
>>
>> Hmm, v4l2-compliance should have detected a stateful decoder here.
> 
> OK, I'll use the latest v4l2-compliance to test it again.
> 
>>
>>>
>>> Required ioctls:
>>>       test VIDIOC_QUERYCAP: OK
>>>
>>> Allow for multiple opens:
>>>       test second /dev/video0 open: OK
>>>       test VIDIOC_QUERYCAP: OK
>>>       test VIDIOC_G/S_PRIORITY: OK
>>>       test for unlimited opens: OK
>>>
>>>       test invalid ioctls: OK
>>> Debug ioctls:
>>>       test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>       test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>
>>> Input ioctls:
>>>       test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>       test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>       test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>       test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>       test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>       test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>       Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>
>>> Output ioctls:
>>>       test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>       test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>       test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>       test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>       test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>       Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>
>>> Input/Output configuration ioctls:
>>>       test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>       test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>       test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>       test VIDIOC_G/S_EDID: OK (Not Supported)
>>>
>>> Control ioctls:
>>>       test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>       test VIDIOC_QUERYCTRL: OK
>>>       test VIDIOC_G/S_CTRL: OK
>>>       test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>       test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>       test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>       Standard Controls: 3 Private Controls: 2
>>>
>>> Format ioctls:
>>>       test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>       test VIDIOC_G/S_PARM: OK (Not Supported)
>>>       test VIDIOC_G_FBUF: OK (Not Supported)
>>>       test VIDIOC_G_FMT: OK
>>>       test VIDIOC_TRY_FMT: OK
>>>       test VIDIOC_S_FMT: OK
>>>       test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>       test Cropping: OK
>>>       test Composing: OK
>>>       test Scaling: OK
>>>
>>> Codec ioctls:
>>>       test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>       test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>       test VIDIOC_(TRY_)DECODER_CMD: OK
>>>
>>> Buffer ioctls:
>>>       test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>       test VIDIOC_EXPBUF: OK
>>>       test Requests: OK (Not Supported)
>>>
>>> Total for vpu b0 device /dev/video0: 45, Succeeded: 45, Failed: 0,
>>> Warnings: 0
>>>
>>> # v4l2-compliance -d /dev/video1
>>> v4l2-compliance SHA: not available
>>> , 64 bits, 64-bit time_t
>>>
>>> Compliance test for imx vpu encoder device /dev/video1:
>>>
>>> Driver Info:
>>>       Driver name      : imx vpu encoder
>>>       Card type        : imx vpu encoder
>>>       Bus info         : platform: imx8q-vpu
>>>       Driver version   : 5.10.35
>>>       Capabilities     : 0x84204000
>>>               Video Memory-to-Memory Multiplanar
>>>               Streaming
>>>               Extended Pix Format
>>>               Device Capabilities
>>>       Device Caps      : 0x04204000
>>>               Video Memory-to-Memory Multiplanar
>>>               Streaming
>>>               Extended Pix Format
>>>       Detected Stateful Encoder
>>
>> Here it properly detects a stateful encoder.
>>
>> Regards,
>>
>>         Hans
>>
> 
> OK, I'll use the latest v4l2-compliance to test it again.
> 
>>>
>>> Required ioctls:
>>>       test VIDIOC_QUERYCAP: OK
>>>
>>> Allow for multiple opens:
>>>       test second /dev/video1 open: OK
>>>       test VIDIOC_QUERYCAP: OK
>>>       test VIDIOC_G/S_PRIORITY: OK
>>>       test for unlimited opens: OK
>>>
>>>       test invalid ioctls: OK
>>> Debug ioctls:
>>>       test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>       test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>
>>> Input ioctls:
>>>       test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>       test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>       test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>       test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>       test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>       test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>       Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>
>>> Output ioctls:
>>>       test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>       test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>       test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>       test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>       test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>       Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>
>>> Input/Output configuration ioctls:
>>>       test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>       test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>       test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>       test VIDIOC_G/S_EDID: OK (Not Supported)
>>>
>>> Control ioctls:
>>>       test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>       test VIDIOC_QUERYCTRL: OK
>>>       test VIDIOC_G/S_CTRL: OK
>>>       test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>       test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>       test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>       Standard Controls: 20 Private Controls: 0
>>>
>>> Format ioctls:
>>>       test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>       test VIDIOC_G/S_PARM: OK
>>>       test VIDIOC_G_FBUF: OK (Not Supported)
>>>       test VIDIOC_G_FMT: OK
>>>       test VIDIOC_TRY_FMT: OK
>>>       test VIDIOC_S_FMT: OK
>>>       test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>       test Cropping: OK
>>>       test Composing: OK (Not Supported)
>>>       test Scaling: OK (Not Supported)
>>>
>>> Codec ioctls:
>>>       test VIDIOC_(TRY_)ENCODER_CMD: OK
>>>       test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>       test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>
>>> Buffer ioctls:
>>>       test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>       test VIDIOC_EXPBUF: OK
>>>       test Requests: OK (Not Supported)
>>>
>>> Total for imx vpu encoder device /dev/video1: 45, Succeeded: 45,
>>> Failed: 0, Warnings: 0
>>>
>>> Ming Qian (13):
>>>   dt-bindings: media: imx8q: add imx video codec bindings
>>>   media: v4l: add some definition of v4l2
>>>     colorspace/xfer_func/ycbcr_encoding
>>>   media: imx: imx8q: add imx8q vpu device driver
>>>   media: imx: imx8q: add vpu core driver
>>>   media: imx: imx8q: implement vpu core communication based on
>> mailbox
>>>   media: imx: imx8q: add vpu v4l2 m2m support
>>>   media: imx: imx8q: add v4l2 m2m vpu encoder stateful driver
>>>   media: imx: imx8q: add v4l2 m2m vpu decoder stateful driver
>>>   media: imx: imx8q: implement windsor encoder rpc interface
>>>   media: imx: imx8q: implement malone decoder rpc interface
>>>   ARM64: dts: freescale: imx8q: add imx vpu codec entries
>>>   firmware: imx: scu-pd: imx8q: add vpu mu resources
>>>   MAINTAINERS: add NXP IMX8Q VPU CODEC V4L2 driver entry
>>>
>>>  .../bindings/media/nxp,imx8q-vpu.yaml         |  178 ++
>>>  MAINTAINERS                                   |   10 +
>>>  .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi |   72 +
>>>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |   17 +
>>>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   26 +
>>>  drivers/firmware/imx/scu-pd.c                 |    4 +
>>>  drivers/media/platform/Kconfig                |    2 +
>>>  drivers/media/platform/Makefile               |    2 +
>>>  drivers/media/platform/imx/Kconfig            |   19 +
>>>  drivers/media/platform/imx/Makefile           |    1 +
>>>  drivers/media/platform/imx/vpu-8q/Makefile    |   23 +
>>>  drivers/media/platform/imx/vpu-8q/vdec.c      | 1817
>> +++++++++++++++++
>>>  drivers/media/platform/imx/vpu-8q/venc.c      | 1395 +++++++++++++
>>>  drivers/media/platform/imx/vpu-8q/vpu.h       |  343 ++++
>>>  drivers/media/platform/imx/vpu-8q/vpu_cmds.c  |  446 ++++
>>>  drivers/media/platform/imx/vpu-8q/vpu_cmds.h  |   34 +
>>>  drivers/media/platform/imx/vpu-8q/vpu_codec.h |   77 +
>>>  drivers/media/platform/imx/vpu-8q/vpu_color.c |  201 ++
>>> drivers/media/platform/imx/vpu-8q/vpu_core.c  |  919 +++++++++
>>>  drivers/media/platform/imx/vpu-8q/vpu_core.h  |   25 +
>>>  drivers/media/platform/imx/vpu-8q/vpu_dbg.c   |  505 +++++
>>>  drivers/media/platform/imx/vpu-8q/vpu_defs.h  |  194 ++
>>>  .../media/platform/imx/vpu-8q/vpu_dev_imx8q.c |   82 +
>>>  drivers/media/platform/imx/vpu-8q/vpu_drv.c   |  225 ++
>>>  .../media/platform/imx/vpu-8q/vpu_helpers.c   |  405 ++++
>>>  .../media/platform/imx/vpu-8q/vpu_helpers.h   |   80 +
>>>  drivers/media/platform/imx/vpu-8q/vpu_imx8q.c |  227 ++
>>> drivers/media/platform/imx/vpu-8q/vpu_imx8q.h |  125 ++
>>>  drivers/media/platform/imx/vpu-8q/vpu_log.h   |   53 +
>>>  .../media/platform/imx/vpu-8q/vpu_malone.c    | 1744
>> ++++++++++++++++
>>>  .../media/platform/imx/vpu-8q/vpu_malone.h    |   51 +
>>>  drivers/media/platform/imx/vpu-8q/vpu_mbox.c  |  135 ++
>>>  drivers/media/platform/imx/vpu-8q/vpu_mbox.h  |   25 +
>>>  drivers/media/platform/imx/vpu-8q/vpu_msgs.c  |  420 ++++
>>>  drivers/media/platform/imx/vpu-8q/vpu_msgs.h  |   23 +
>>>  drivers/media/platform/imx/vpu-8q/vpu_rpc.c   |  266 +++
>>>  drivers/media/platform/imx/vpu-8q/vpu_rpc.h   |  472 +++++
>>>  drivers/media/platform/imx/vpu-8q/vpu_v4l2.c  |  662 ++++++
>>>  drivers/media/platform/imx/vpu-8q/vpu_v4l2.h  |   53 +
>>>  .../media/platform/imx/vpu-8q/vpu_windsor.c   | 1253 ++++++++++++
>>>  .../media/platform/imx/vpu-8q/vpu_windsor.h   |   48 +
>>>  include/linux/imx_vpu.h                       |   19 +
>>>  include/uapi/linux/imx_vpu.h                  |  120 ++
>>>  include/uapi/linux/videodev2.h                |   30 +
>>>  44 files changed, 12828 insertions(+)  create mode 100644
>>> Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
>>>  create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
>>>  create mode 100644 drivers/media/platform/imx/Kconfig
>>>  create mode 100644 drivers/media/platform/imx/Makefile
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/Makefile
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vdec.c
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/venc.c
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu.h
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_cmds.c
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_cmds.h
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_codec.h
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_color.c
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_core.c
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_core.h
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_dbg.c
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_defs.h
>>>  create mode 100644
>> drivers/media/platform/imx/vpu-8q/vpu_dev_imx8q.c
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_drv.c
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_helpers.c
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_helpers.h
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_imx8q.c
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_imx8q.h
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_log.h
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_malone.c
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_malone.h
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_mbox.c
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_mbox.h
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_msgs.c
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_msgs.h
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_rpc.c
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_rpc.h
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_v4l2.c
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_v4l2.h
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_windsor.c
>>>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_windsor.h
>>>  create mode 100644 include/linux/imx_vpu.h  create mode 100644
>>> include/uapi/linux/imx_vpu.h
>>>
> 

