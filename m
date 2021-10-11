Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2954A428970
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 11:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235393AbhJKJON (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Oct 2021 05:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234280AbhJKJOM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 05:14:12 -0400
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60C77C061570;
        Mon, 11 Oct 2021 02:12:12 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ZrLqmxJC2k3b0ZrLtmLoI2; Mon, 11 Oct 2021 11:12:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1633943530; bh=kREqiEIOflmprmouJt/QUBN3Z8G98boZs8B1bMamwCY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NefE9L/lQpV+bqk/y1m8/ck/itz3TMfeAwltmHBE9JaetNvqwE1q6o0SWEc4Hb59L
         LkXUmGJYY4ofSgebGd6AK6jJ2Wzv/Xar9JQw0tHsrMS9ZPbSE2PyqbNAOaXMA81epA
         6YkWHC8G1UfeOsL4ZtbFlJ7qhWMx+orlfD63AighFgSbzNemYU88EbS8zqxv/i+TeJ
         3WRn4BAsYqHas2dnM9P4m2RCikFOWQQiMDdjRVGFyAZslw3y/3wasQQV77UDlp3a+u
         TIgjoPu5TNK08pnveYjjybR273pHko09CaEgKpolN9f9s9dEfTa3OSCzmrqeQ0w81X
         b4VNZpHoTz+QQ==
Subject: Re: [EXT] Re: [PATCH v9 00/13] amphion video decoder/encoder driver
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Ming Qian <ming.qian@nxp.com>,
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
References: <cover.1631521295.git.ming.qian@nxp.com>
 <7591d62b4aedb0ad789f09d90695c700c65df53d.camel@ndufresne.ca>
 <AM6PR04MB6341879E600E5673FB94F71AE7A39@AM6PR04MB6341.eurprd04.prod.outlook.com>
 <27ec66639de79216e9b887ee6977f35906e33a43.camel@ndufresne.ca>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <bf2ab6db-935e-f658-2d8a-5e9f2e13895c@xs4all.nl>
Date:   Mon, 11 Oct 2021 11:12:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <27ec66639de79216e9b887ee6977f35906e33a43.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNMJsIcLIBb4VscJuke1SX934hbxdEHDEFOHj5ikzDzjEMocQGXuN5tUwjjxpsCAZB74xt7DlUwucXtYR7zP9bKODOhphbMrKrJuLh8sAvpTzR1GWQXN
 Y3exBUTaffRgav41uxLTQpeObDy93pL09EJsIpoJJ7ENudHtiiO1FqFZFgo0Rim3JeVl/F/lY3Wv/50A3eISShUpix3z6E5QPECY255fx/AqpL4PiNWxPOv+
 cfajO/g71y4aO3HFwfbZlFHh4t80p5+4LnKgirVuu5OxeMj8tv56ouk8eDWKKIKEY02zcQxOnOKEUbBSZ0v2h/gL8GVilzeZehMIM6gcdB6O5CEFntz1+JVo
 cI7daOL6A1MxtagacekoaHiZOCs5L1ktxzw4L6PkvM0LDHDhTgMzzJ/YQaFx7OqWP8qE8D4Yr0VTaQVd5Z7zx5PwHN7BO7lPfe7Fjob3AaoazhSpkE9midhs
 ylvNEK03JqrNCthIwdBHbMPLQkSpDDaGYkJ8F7QDJVyWxiI1qWzM7GYKR9swKVxCN7af/ny/qzPEuiJaPpphUvd2DH0ZcrIxEVRD5UVAGDncLszmv5QausuO
 Xq5xsrAVBmRCofAKS/RK2v/b0ShMdDmLY/tpkwCsbmnbpvFGh15ZA8va/FvqMPAVNY8=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/09/2021 15:33, Nicolas Dufresne wrote:
> Le jeudi 23 septembre 2021 à 10:45 +0000, Ming Qian a écrit :
>>> -----Original Message-----
>>> From: Nicolas Dufresne [mailto:nicolas@ndufresne.ca]
>>> Sent: Wednesday, September 22, 2021 10:14 PM
>>> To: Ming Qian <ming.qian@nxp.com>; mchehab@kernel.org;
>>> shawnguo@kernel.org; robh+dt@kernel.org; s.hauer@pengutronix.de
>>> Cc: hverkuil-cisco@xs4all.nl; kernel@pengutronix.de; festevam@gmail.com;
>>> dl-linux-imx <linux-imx@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>;
>>> linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
>>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
>>> Subject: [EXT] Re: [PATCH v9 00/13] amphion video decoder/encoder driver
>>>
>>> Caution: EXT Email
>>>
>>> Hi Ming,
>>>
>>> Le lundi 13 septembre 2021 à 17:11 +0800, Ming Qian a écrit :
>>>> Hi all,
>>>>
>>>> This patch series adds support for
>>>> the amphion video encoder and decoder
>>>> via the VPU block present in imx8q platforms.
>>>> Currently, support for IMX8QXP and IMX8QM is included.
>>>
>>> I've been trying to test this driver, based it on mainline 5.15-rc2 in
>>> absence of
>>> recommendation here. There seems to be poor mainline support for this board,
>>> notably only 1 CPU come up. Finally, I could not test anything as the driver
>>> failed to boot the decoders and encoder cores:
>>>
>>> [   30.766160] [VPU CORE][0] decoder boot
>>> [   31.873175] [VPU CORE][0] decoder boot timeout
>>> [   31.878057] [VPU V4L2]there is no core for decoder
>>> [ 1766.495963] [VPU CORE][1] encoder boot [ 1767.524957] [VPU CORE][1]
>>> encoder boot timeout [ 1767.529724] [VPU V4L2]there is no core for encoder
>>>
>>> Please, let me know how I can get passed these issues. I have used firmwares
>>> referenced in Yocto tree:
>>>
>>>
>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.n
>>> xp.com%2Flgfiles%2FNMG%2FMAD%2FYOCTO%2Ffirmware-imx-7.9.bin&amp
>>> ;data=04%7C01%7Cming.qian%40nxp.com%7Ce50ac93addb444f7cd9b08d97
>>> dd33c6e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63767916
>>> 8483236134%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj
>>> oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=cM3%2F
>>> Go0MxD0RSDmS5ELr6yCdNe4EH%2FeTAFtcAcBArRo%3D&amp;reserved=0
>>>
>>> Firmware for this driver will also be a subject to tackle. In an ideal
>>> world, the
>>> "self extracted" script requirement to accept your EULA would need to be
>>> waved, and distribution of the firmware should go into linux-firmwares. I
>>> believe firmwares are still allowed to have some user agreement, but I
>>> suppose
>>> there must be guidelines, best is to ask there directly.
>>>
>>> regards,
>>> Nicolas
>>>
>>
>> Seems you use the wrong firmware, I will send the firmware to you.
>> My commit base is 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead, 
>> You can find it in the bottom of this cover.
>>
>> Would you please explain the linux-firmware issue in detail
> 
> I believe that to merge a driver (non staging) that depends on a firmware (I'll
> let Hans and others confirm), you need to submit this firmware, along with a
> non-interactive licence to be included in the linux-firmware project.

That's correct.

Regards,

	Hans

> NXP notably have an SDMA firmware in there, with a licence file. Perhaps these
> developers can assist in this regard. Often that takes time due to legal
> requirement of moving from an interactive EULA to a licence file.
> 
> In later version, it would be nice to explain in the cover later the status of
> firmware distribution, and how to obtain the correct version of (specially if
> not yet in linux-firmware).
> 
> Thanks for sending me the firmwares, I will see if I can do more tests.
> 
>>
>>>>
>>>> It features decoding for the following formats:
>>>> - H.264
>>>> - HEVC
>>>> - MPEG4
>>>> - MPEG2
>>>> - VC1
>>>> - VP8
>>>>
>>>> It features encoding for the following formats:
>>>> - H.264
>>>>
>>>> The driver creates a separate device node for the encoder and decoder.
>>>>
>>>> Changelog:
>>>>
>>>> v9
>>>> - drop V4L2_BUF_FLAG_CODECCONFIG
>>>> - drop V4L2_EVENT_CODEC_ERROR
>>>> - drop V4L2_EVENT_SKIP
>>>> - use the v4l2_buffer.sequence counter
>>>> - fix some build warnings with W=1 reported by kernel test robot
>>>>
>>>> v8
>>>> - move driver from driver/media/platform/imx/vpu-8q to
>>>>   driver/media/platform/amphion
>>>> - rename driver name to amphion
>>>> - remove imx_vpu.h
>>>> - move the definition of V4L2_EVENT_CODEC_ERROR to videodev2.h
>>>> - move the definition of V4L2_EVENT_SKIP to videodev2.h
>>>>
>>>> v7
>>>> - fix build warnings with W=1 reported by kernel test robot
>>>>
>>>> v6:
>>>> - rename V4L2_PIX_FMT_NT8 to V4L2_PIX_FMT_NV12_8L128
>>>> - rename V4L2_PIX_FMT_NT10 to V4L2_PIX_FMT_NV12_10BE_8L128
>>>>
>>>> v5:
>>>> - move some definition from imx_vph.h to videodev2.h
>>>> - remove some unnecessary content
>>>> - add some documentation descriptions
>>>> - pass the lateset v4l2-compliance test
>>>>
>>>> v4:
>>>> - redefine the memory-region in devicetree bindings documentation
>>>> - use v4l2's mechanism to implement synchronize queuing ioctl
>>>> - remove the unnecessary mutex ioctl_sync
>>>> - don't notify source change event if the parameters are same as
>>>> previously established
>>>> - add flag V4L2_FMT_FLAG_DYN_RESOLUTION to decoder's capture format
>>>>
>>>> v3:
>>>> - don't make vpu device node a simple-bus
>>>> - trigger probing vpu core in the driver
>>>> - remove unnecessary vpu core index property
>>>>
>>>> v2:
>>>> - fix dt bindings build error
>>>> - split driver patch into several parts to avoid exceeding bytes limit
>>>>
>>>> Compliance
>>>> ==========
>>>> # v4l2-compliance -d /dev/video0
>>>> v4l2-compliance 1.21.0-4838, 64 bits, 64-bit time_t v4l2-compliance
>>>> SHA: 22466798f9a9 2021-08-25 11:05:21
>>>>
>>>> Compliance test for amphion-vpu device /dev/video0:
>>>>
>>>> Driver Info:
>>>>       Driver name      : amphion-vpu
>>>>       Card type        : amphion vpu decoder
>>>>       Bus info         : platform: amphion-vpu
>>>>       Driver version   : 5.14.0
>>>>       Capabilities     : 0x84204000
>>>>               Video Memory-to-Memory Multiplanar
>>>>               Streaming
>>>>               Extended Pix Format
>>>>               Device Capabilities
>>>>       Device Caps      : 0x04204000
>>>>               Video Memory-to-Memory Multiplanar
>>>>               Streaming
>>>>               Extended Pix Format
>>>>       Detected Stateful Decoder
>>>>
>>>> Required ioctls:
>>>>       test VIDIOC_QUERYCAP: OK
>>>>       test invalid ioctls: OK
>>>>
>>>> Allow for multiple opens:
>>>>       test second /dev/video0 open: OK
>>>>       test VIDIOC_QUERYCAP: OK
>>>>       test VIDIOC_G/S_PRIORITY: OK
>>>>       test for unlimited opens: OK
>>>>
>>>> Debug ioctls:
>>>>       test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>       test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>
>>>> Input ioctls:
>>>>       test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>       test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>       test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>       test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>       test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>       test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>       Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>
>>>> Output ioctls:
>>>>       test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>       test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>       test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>       test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>       test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>       Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>
>>>> Input/Output configuration ioctls:
>>>>       test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>       test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>       test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>       test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>
>>>> Control ioctls:
>>>>       test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>>       test VIDIOC_QUERYCTRL: OK
>>>>       test VIDIOC_G/S_CTRL: OK
>>>>       test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>>       test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>>       test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>       Standard Controls: 3 Private Controls: 0
>>>>
>>>> Format ioctls:
>>>>       test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>       test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>       test VIDIOC_G_FBUF: OK (Not Supported)
>>>>       test VIDIOC_G_FMT: OK
>>>>       test VIDIOC_TRY_FMT: OK
>>>>       test VIDIOC_S_FMT: OK
>>>>       test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>       test Cropping: OK (Not Supported)
>>>>       test Composing: OK
>>>>       test Scaling: OK (Not Supported)
>>>>
>>>> Codec ioctls:
>>>>       test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>       test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>       test VIDIOC_(TRY_)DECODER_CMD: OK
>>>>
>>>> Buffer ioctls:
>>>>       test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>       test VIDIOC_EXPBUF: OK
>>>>       test Requests: OK (Not Supported)
>>>>
>>>> Total for amphion-vpu device /dev/video0: 45, Succeeded: 45, Failed:
>>>> 0, Warnings: 0
>>>>
>>>> # v4l2-compliance -d /dev/video1
>>>> v4l2-compliance 1.21.0-4838, 64 bits, 64-bit time_t v4l2-compliance
>>>> SHA: 22466798f9a9 2021-08-25 11:05:21
>>>>
>>>> Compliance test for amphion-vpu device /dev/video1:
>>>>
>>>> Driver Info:
>>>>       Driver name      : amphion-vpu
>>>>       Card type        : amphion vpu encoder
>>>>       Bus info         : platform: amphion-vpu
>>>>       Driver version   : 5.14.0
>>>>       Capabilities     : 0x84204000
>>>>               Video Memory-to-Memory Multiplanar
>>>>               Streaming
>>>>               Extended Pix Format
>>>>               Device Capabilities
>>>>       Device Caps      : 0x04204000
>>>>               Video Memory-to-Memory Multiplanar
>>>>               Streaming
>>>>               Extended Pix Format
>>>>       Detected Stateful Encoder
>>>>
>>>> Required ioctls:
>>>>       test VIDIOC_QUERYCAP: OK
>>>>       test invalid ioctls: OK
>>>>
>>>> Allow for multiple opens:
>>>>       test second /dev/video1 open: OK
>>>>       test VIDIOC_QUERYCAP: OK
>>>>       test VIDIOC_G/S_PRIORITY: OK
>>>>       test for unlimited opens: OK
>>>>
>>>> Debug ioctls:
>>>>       test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>       test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>
>>>> Input ioctls:
>>>>       test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>       test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>       test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>       test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>       test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>       test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>       Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>
>>>> Output ioctls:
>>>>       test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>       test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>       test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>       test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>       test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>       Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>
>>>> Input/Output configuration ioctls:
>>>>       test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>       test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>       test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>       test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>
>>>> Control ioctls:
>>>>       test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>>       test VIDIOC_QUERYCTRL: OK
>>>>       test VIDIOC_G/S_CTRL: OK
>>>>       test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>>       test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>>       test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>       Standard Controls: 20 Private Controls: 0
>>>>
>>>> Format ioctls:
>>>>       test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>       test VIDIOC_G/S_PARM: OK
>>>>       test VIDIOC_G_FBUF: OK (Not Supported)
>>>>       test VIDIOC_G_FMT: OK
>>>>       test VIDIOC_TRY_FMT: OK
>>>>       test VIDIOC_S_FMT: OK
>>>>       test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>       test Cropping: OK
>>>>       test Composing: OK (Not Supported)
>>>>       test Scaling: OK (Not Supported)
>>>>
>>>> Codec ioctls:
>>>>       test VIDIOC_(TRY_)ENCODER_CMD: OK
>>>>       test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>       test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>
>>>> Buffer ioctls:
>>>>       test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>       test VIDIOC_EXPBUF: OK
>>>>       test Requests: OK (Not Supported)
>>>>
>>>> Total for amphion-vpu device /dev/video1: 45, Succeeded: 45, Failed:
>>>> 0, Warnings: 0
>>>>
>>>> Ming Qian (13):
>>>>   dt-bindings: media: amphion: add amphion video codec bindings
>>>>   media:Add nt8 and nt10 video format.
>>>>   media: amphion: add amphion vpu device driver
>>>>   media: amphion: add vpu core driver
>>>>   media: amphion: implement vpu core communication based on mailbox
>>>>   media: amphion: add vpu v4l2 m2m support
>>>>   media: amphion: add v4l2 m2m vpu encoder stateful driver
>>>>   media: amphion: add v4l2 m2m vpu decoder stateful driver
>>>>   media: amphion: implement windsor encoder rpc interface
>>>>   media: amphion: implement malone decoder rpc interface
>>>>   ARM64: dts: freescale: imx8q: add imx vpu codec entries
>>>>   firmware: imx: scu-pd: imx8q: add vpu mu resources
>>>>   MAINTAINERS: add AMPHION VPU CODEC V4L2 driver entry
>>>>
>>>>  .../bindings/media/amphion,vpu.yaml           |  178 ++
>>>>  .../media/v4l/pixfmt-yuv-planar.rst           |   15 +
>>>>  MAINTAINERS                                   |    9 +
>>>>  .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi |   72 +
>>>>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |   17 +
>>>>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   24 +
>>>>  drivers/firmware/imx/scu-pd.c                 |    4 +
>>>>  drivers/media/platform/Kconfig                |   19 +
>>>>  drivers/media/platform/Makefile               |    2 +
>>>>  drivers/media/platform/amphion/Makefile       |   23 +
>>>>  drivers/media/platform/amphion/vdec.c         | 1652
>>> ++++++++++++++++
>>>>  drivers/media/platform/amphion/venc.c         | 1382
>>> ++++++++++++++
>>>>  drivers/media/platform/amphion/vpu.h          |  333 ++++
>>>>  drivers/media/platform/amphion/vpu_cmds.c     |  435 +++++
>>>>  drivers/media/platform/amphion/vpu_cmds.h     |   25 +
>>>>  drivers/media/platform/amphion/vpu_codec.h    |   68 +
>>>>  drivers/media/platform/amphion/vpu_color.c    |  192 ++
>>>>  drivers/media/platform/amphion/vpu_core.c     |  901 +++++++++
>>>>  drivers/media/platform/amphion/vpu_core.h     |   16 +
>>>>  drivers/media/platform/amphion/vpu_dbg.c      |  496 +++++
>>>>  drivers/media/platform/amphion/vpu_defs.h     |  186 ++
>>>>  .../media/platform/amphion/vpu_dev_imx8q.c    |   72 +
>>>>  drivers/media/platform/amphion/vpu_drv.c      |  215 +++
>>>>  drivers/media/platform/amphion/vpu_helpers.c  |  453 +++++
>>>>  drivers/media/platform/amphion/vpu_helpers.h  |   72 +
>>>>  drivers/media/platform/amphion/vpu_imx8q.c    |  218 +++
>>>>  drivers/media/platform/amphion/vpu_imx8q.h    |  116 ++
>>>>  drivers/media/platform/amphion/vpu_log.h      |   44 +
>>>>  drivers/media/platform/amphion/vpu_malone.c   | 1683
>>> +++++++++++++++++
>>>>  drivers/media/platform/amphion/vpu_malone.h   |   42 +
>>>>  drivers/media/platform/amphion/vpu_mbox.c     |  126 ++
>>>>  drivers/media/platform/amphion/vpu_mbox.h     |   16 +
>>>>  drivers/media/platform/amphion/vpu_msgs.c     |  413 ++++
>>>>  drivers/media/platform/amphion/vpu_msgs.h     |   14 +
>>>>  drivers/media/platform/amphion/vpu_rpc.c      |  263 +++
>>>>  drivers/media/platform/amphion/vpu_rpc.h      |  463 +++++
>>>>  drivers/media/platform/amphion/vpu_v4l2.c     |  625 ++++++
>>>>  drivers/media/platform/amphion/vpu_v4l2.h     |   53 +
>>>>  drivers/media/platform/amphion/vpu_windsor.c  | 1244 ++++++++++++
>>>>  drivers/media/platform/amphion/vpu_windsor.h  |   39 +
>>>>  drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
>>>>  include/uapi/linux/videodev2.h                |    4 +
>>>>  42 files changed, 12226 insertions(+)  create mode 100644
>>>> Documentation/devicetree/bindings/media/amphion,vpu.yaml
>>>>  create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
>>>>  create mode 100644 drivers/media/platform/amphion/Makefile
>>>>  create mode 100644 drivers/media/platform/amphion/vdec.c
>>>>  create mode 100644 drivers/media/platform/amphion/venc.c
>>>>  create mode 100644 drivers/media/platform/amphion/vpu.h
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_cmds.c
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_cmds.h
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_codec.h
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_color.c
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_core.c
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_core.h
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_dbg.c
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_defs.h
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_dev_imx8q.c
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_drv.c
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_helpers.c
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_helpers.h
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_imx8q.c
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_imx8q.h
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_log.h
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_malone.c
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_malone.h
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_mbox.c
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_mbox.h
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_msgs.c
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_msgs.h
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_rpc.c
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_rpc.h
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_v4l2.c
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_v4l2.h
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_windsor.c
>>>>  create mode 100644 drivers/media/platform/amphion/vpu_windsor.h
>>>>
>>>>
>>>> base-commit: 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead
>>>
>>
> 
> 

