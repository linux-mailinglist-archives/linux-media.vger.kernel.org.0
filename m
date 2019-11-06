Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3BEF1BB4
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 17:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732175AbfKFQwx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 11:52:53 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:55753 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727824AbfKFQww (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 11:52:52 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id SOXyip2Ly9P9bSOY1iedV0; Wed, 06 Nov 2019 17:52:49 +0100
Subject: Re: [EXT] Re: [PATCH 0/5] Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
To:     Mirela Rabulea <mirela.rabulea@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
References: <1573053633-21437-1-git-send-email-mirela.rabulea@nxp.com>
 <87d80882-b032-f332-0808-d669600f844f@xs4all.nl>
 <1573058741.16477.18.camel@nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2ad1718b-2556-ea7c-27e0-9e60445a5b71@xs4all.nl>
Date:   Wed, 6 Nov 2019 17:52:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1573058741.16477.18.camel@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCMhwsl33WKBOGR5KEGFopnmg4H1XlpCQB/6CM7GEZqrOm74S2xriGDTT44JIkOW09Bb2apG+ue6gNcRv9Qr4tYBHfyXXvlf7f0Z3P8F0TANRM5rE+jS
 tacpFFZhM3hcGirOm/RKPsHs410rpc1wFQckmCY/ZIrZqdShRm3HbCBLjJ4iOB1562nKiNOgNbkvA++zyHcCreEsRjCcAGK7kZXG/Yo9ZZGjf60hzUgP0vni
 AFen8J/3PAUWiYTgR4GI6CSjAnfLOcVl+O//v0toZZOCR/xpbvCOWRg2OhfEHg0ukUNkGWH7dYfYA8oHRWDxA2Cj80xG0PXxIOSbuMfjnqBX+HwtYyLbBkqW
 1wLjX54suiaNqoCOvlrYEH26R4qsY986udaf8A8lDBxmHMYkDa5lqbqMPoLEgMprkfP6WDzPy41vp0VnfObS/rtpMe+DOd6VvznlBctNAqP9UqNoDfstj9GM
 Ro397qPqzueG1n0iCB9AkbgeWUSFyc0bJi3mPPGBgCQyX8nCV70fHUxBAtj8QSgexIVNBevAdPUrCIUaJSTTa88XiMaFwweCpWFc7WoKUd5VemwFMgkCEN08
 J77F3to+fGpCxxRRxKBd1dose8aA3RoBXCW+zUUdMNKjQJEXYkQ1cftKzZ6GLdbVCB0dR4T2Mw5el/g2Q1UTFMDTzWh+2IwWwA891sDG64F3LfbTQ37YLPWo
 IeetJVTfncRZVDUMB24TpGCmWPJPUr5HTnvW4HKVVhQr/CiNO4knt/zPDpU4uDgILhOtGuP/mwSYX+FFWabMoX+mVmZZDUe5+MAsu2xFXFhe8b1poA9/pJPw
 9aD8tfE4pg8CQrBz025SdzdyYcKHCtfhhWykgol1EgQ3Dvxhxm+q8uCkCxvKOA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/6/19 5:45 PM, Mirela Rabulea wrote:
> Hi Hans,
> 
> On Mi, 2019-11-06 at 16:37 +0100, Hans Verkuil wrote:
>> That's too old. Always test with the latest version from the v4l-
>> utils git
>> repo (git://linuxtv.org/v4l-utils.git). v4l2-compliance is
>> continually
>> improved, so driver testing should always be done with the latest
>> version.
>>
>> For the JPEG encoder you can add the -s option to v4l2-compliance.
>> Unfortunately,
>> the streaming tests for JPEG decoders in v4l2-compliance are not well
>> supported
>> at the moment, so you can't use -s there.
>>
>> Please provide the full output of the v4l2-compliance command as
>> well, I'd
>> like to see the actual output.
> 
> Thanks for the reply. I updated to the latest v4l-utils, basic tests
> pass, but I have issues with the streaming tests (-s). I'll work on
> those, it might take a while.
> For the reference, here's the actual output, for both the encoder &
> decoder.
> 
> 
> root@imx8qxpmek:/unit_tests/JPEG# ./v4l2-compliance -d /dev/video1 -s
> v4l2-compliance SHA: 6c415a11fceb32067cdb5c2e33f90dbf018182a4, 64 bits
> 
> Compliance test for mxc-jpeg decode device /dev/video1:
> 
> Driver Info:
> 	Driver name      : mxc-jpeg decode
> 	Card type        : mxc-jpeg decoder
> 	Bus info         : platform:58450000.jpegenc
> 	Driver version   : 5.4.0
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 	Detected JPEG Encoder
> 
> Required ioctls:
> 	test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
> 	test second /dev/video1 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 0 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK

The presence of a scaler is suspicious: is the encoder indeed
capable of scaling? I suspect this is a bug.

> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK

The presence of this...

> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK

...and this is also strange for a JPEG codec. These ioctls are typically only
needed for MPEG/H264/etc. codecs, and not for a simple JPEG codec.

The same issues are found for the JPEG decoder.

> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
> 	test read/write: OK (Not Supported)
> 	test blocking wait: OK
> 		fail: v4l2-test-buffers.cpp(254): g_field() ==
> V4L2_FIELD_ANY

The driver shall never return FIELD_ANY. This needs to be FIELD_NONE.

Regards,

	Hans

> 		fail: v4l2-test-buffers.cpp(1266): buf.qbuf(node)
> 	test MMAP (no poll): FAIL
> 		fail: v4l2-test-buffers.cpp(254): g_field() ==
> V4L2_FIELD_ANY
> 		fail: v4l2-test-buffers.cpp(1266): buf.qbuf(node)
> 	test MMAP (select): FAIL
> 		fail: v4l2-test-buffers.cpp(254): g_field() ==
> V4L2_FIELD_ANY
> 		fail: v4l2-test-buffers.cpp(1266): buf.qbuf(node)
> 	test MMAP (epoll): FAIL
> 		fail: v4l2-test-buffers.cpp(1492): ret && ret != ENOTTY
> 		fail: v4l2-test-buffers.cpp(1580): setupUserPtr(node,
> q)
> 	test USERPTR (no poll): FAIL
> 		fail: v4l2-test-buffers.cpp(1492): ret && ret != ENOTTY
> 		fail: v4l2-test-buffers.cpp(1580): setupUserPtr(node,
> q)
> 	test USERPTR (select): FAIL
> 	test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for mxc-jpeg decode device /dev/video1: 51, Succeeded: 46,
> Failed: 5, Warnings: 0
> 
> 
> 
> root@imx8qxpmek:/unit_tests/JPEG# ./v4l2-compliance -d /dev/video0 -s
> v4l2-compliance SHA: 6c415a11fceb32067cdb5c2e33f90dbf018182a4, 64 bits
> 
> Compliance test for mxc-jpeg decode device /dev/video0:
> 
> Driver Info:
> 	Driver name      : mxc-jpeg decode
> 	Card type        : mxc-jpeg decoder
> 	Bus info         : platform:58400000.jpegdec
> 	Driver version   : 5.4.0
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 	Detected JPEG Decoder
> 
> Required ioctls:
> 	test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
> 	test second /dev/video0 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 0 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
> 	test read/write: OK (Not Supported)
> 	test blocking wait: OK
> 		fail: v4l2-test-buffers.cpp(254): g_field() ==
> V4L2_FIELD_ANY
> 		fail: v4l2-test-buffers.cpp(1266): buf.qbuf(node)
> 	test MMAP (no poll): FAIL
> 		fail: v4l2-test-buffers.cpp(254): g_field() ==
> V4L2_FIELD_ANY
> 		fail: v4l2-test-buffers.cpp(1266): buf.qbuf(node)
> 	test MMAP (select): FAIL
> 		fail: v4l2-test-buffers.cpp(254): g_field() ==
> V4L2_FIELD_ANY
> 		fail: v4l2-test-buffers.cpp(1266): buf.qbuf(node)
> 	test MMAP (epoll): FAIL
> 		fail: v4l2-test-buffers.cpp(1492): ret && ret != ENOTTY
> 		fail: v4l2-test-buffers.cpp(1580): setupUserPtr(node,
> q)
> 	test USERPTR (no poll): FAIL
> 		fail: v4l2-test-buffers.cpp(1492): ret && ret != ENOTTY
> 		fail: v4l2-test-buffers.cpp(1580): setupUserPtr(node,
> q)
> 	test USERPTR (select): FAIL
> 	test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for mxc-jpeg decode device /dev/video0: 51, Succeeded: 46,
> Failed: 5, Warnings: 0
> 
> 
> 

