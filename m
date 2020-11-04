Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B15C2A65DD
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 15:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729697AbgKDOI0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 09:08:26 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:34055 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726527AbgKDOIZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Nov 2020 09:08:25 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id aJSTk5elMRiwVaJSWkK3ov; Wed, 04 Nov 2020 15:08:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604498901; bh=fFfai3jhrJ9hQu2iSRUC4fYmmSAV17nRqiJ8NDkOXTg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GOZPQWrQqTHriBUuMKadBHaVS/XixOfIZ3pRvIe4qgFwUym/SbpCOMnigyyh4yJ5C
         tXACXWvgFF4McRi2VESK3PbkZyF3v9SdOb3JDvOrvt0OyqsDXACnm9ARUbbSbxRb1G
         7i6oFtiSJ+/17HoD1KA5NZfSM2eEbQXrR2KWANDa1ZEj/I15gY8RMYXA3iJCcE7Wv8
         UsuWUuFvlUxoNzmc8d2u6XzMNm9oQ5DHj0177R/Arw8a/HYGE8Odw4D8fN0hLDHQi+
         VNohI16fTE1PXYSN1VEWRnRIQDs0O57OhvxclSGGaqk7m8q8cY8hC3PO0N1QDmwFUI
         0Fl4c1rw4CZZA==
Subject: Re: [EXT] Re: [PATCH v4 00/11] Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
To:     Mirela Rabulea <mirela.rabulea@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
References: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
 <9c6cf9bf-f6d8-78f5-5f31-d7ea9e25da0d@xs4all.nl>
 <ca7a395a-68ea-33a3-1216-0adf225fce7b@xs4all.nl>
 <982d940c4809b843fdc177daf4db349a0e667924.camel@nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <eec89e90-f414-121d-fbe4-ced23b44f6cc@xs4all.nl>
Date:   Wed, 4 Nov 2020 15:08:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <982d940c4809b843fdc177daf4db349a0e667924.camel@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIloQHoHZ3pQY5UkBxdGl/IpiPXrao5v+FWQ1K7tvqViOuxwaQzYhDzHScUnWV832oahmYmPX/pVi+UAhVvmdzoH2nuKZ/e/SQTm0CG0l370+j3tSDvK
 XKuQCGqiEyRqLNfs3ltx4V4KkKpjlr6iVOz2QSRXN6uknK9nzCy8YqXRmzoIKTtk0hQ80YCA3haKKtOegstjT5thdo4xEwHUmUQ9i129VXr9doRUVo1QGyy/
 xDD2wsR2hWuQYZQKhod1Fu9wn2JvvSmVvxcZl933i0TG8TCvh/2+UF3gMN3g0jPohXA6apX/Y8q4Vep1x7QqcynsjoDa/oOe3rDFMK+hZuxpKqgX6u5wtkUD
 Gs9om8j5TgkCmUsk5XMfWIHRCvabBf5UteOXp8wQjxuAaYGO35Y2Cebvjvjo7XTyc27fY0ViicRFYCULMOFSp0FhHbkdCpQzF5oe740OdKFDlV7IPgksd3ci
 TT0cjB2RPyPfY+WYCBINQ4kp+pEEEP1zq1P3EgbFGqNA4hNjLP4I3giDzdbRLkbu9vdV4lTVobH1lCV3LTymUTsMlpOcMB58ZbOj3BPinDw9ddbxeB5yusYo
 /7XUSxpY07rX/iG9uA8TA1sYA29tYssEm16JZCPrJ1CbkLxaIqBfmxTCJ1x7SdLqLmvNLNXMJP5NNo7uwBHaU8qEhqxyp8QV+6pXjMdAKmRKIuIUFFZlL2eg
 WrgeeRymVDQuDyD0pMO/uDXWEOSYZg78/D/rgmT/Pryya1ttLHdNVEY/FJK5HUyapQgRg6RPQ6jg4xwgO6kMXt0uvbSaL0TQc4vfsG9BhRqr4ojiftpz0UT3
 U3XTLTFfFPInouoS75jcIPHbgxCH08uPqmwx1yQJ5WAGxojjOhVSDWdV+6cb3d3rAgqLB6apUkrALlu//UCyAqWbqta7x1q5ZAmpY6ErpY1TymCUTdTi+pEi
 kulJwQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/11/2020 14:27, Mirela Rabulea wrote:
> Hi Hans,
> 
> On Wed, 2020-11-04 at 12:55 +0100, Hans Verkuil wrote:
>>
>> So please recompile v4l2-compliance from the git repo and retest. If
>> you find new failures, then you probably need to post a v5, otherwise
>> it is enough to reply to this with the output of the updated v4l2-
>> compliance.
>>
>>
> 
> I was unsure if the latest of v4l2-compliance is stable.

It's always kept in sync with the media_tree master branch.

The version that distros have is always much too old and should never
be used when testing drivers.

> This commit (which is not part of stable 1.20), got me a little
> confused:
> 
> commit e50041186be9f69dd94b64fb924115201726e72a
> Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Date:   Thu Jul 16 13:41:37 2020 +0200
> 
>     v4l2-compliance: fix colorspace checks for JPEG codecs
>     
>     The colorspace handling for JPEG encoders/decoders is quite
>     different from other m2m devices since the colorspace of a
>     compressed JPEG file is effectively fixed to sRGB. So the
>     typical passthrough of colorspace information from output
>     to capture is not valid, instead the colorspace information is
>     (mostly) fixed.
> 
> And it somehow contradicts(?) with Philipp's latest commits on coda
> jpeg driver:
> 
> commit 1e3e2a9ac40ad4d11699a49a1bbbf40cd8d4c8bd
> Author: Philipp Zabel <p.zabel@pengutronix.de>
> Date:   Fri Jun 29 08:46:46 2018 -0400
> 
>     media: coda: jpeg: allow non-JPEG colorspace
>     
>     The hardware codec is not colorspace aware. We should trust
> userspace to
>     set the correct colorimetry information on the OUTPUT queue and
> mirror
>     the exact same setting on the CAPTURE queue.
>     
>     There is no reason to restrict colorspace to JPEG for JPEG images,
> if
>     userspace injects the correct colorspace information into the JPEG
>     headers after encoding.
>     
>     Fixes: b14ac545688d ("[media] coda: improve colorimetry handling")
> 
> I agree on the statement "The hardware codec is not colorspace aware",
> by that I mean this colorspace will not translate into any setting sent
> to the hardware. The question is, how the driver is expected to bahave?

This was never really well defined. Basically the JPEG standard doesn't
store colorimetry as metadata, instead it is understood to be sRGB colorimetry.

So if you take what a HW JPEG encoder creates and want to show it on another
device, then it will be interpreted as sRGB. Now if userspace adds some JPEG
extension where it declares the colorimetry to be something else, then that
is fine, but that's out of scope of a HW JPEG encoder driver, IMHO.

I suspect that the coda patch was actually trying to make coda behave with
an older version of v4l2-compliance where a JPEG codec was tested in the
same way as a H264 codec. Later we realized that that didn't make sense for
JPEG codecs and the test was changed. But now coda fails on that test.

> Once I clarify on this, I'll include a fix in v5.

I hope this helps.

	Hans

> 
> I'll post below, for reference, the full log on latest from master.
> 
> Thanks,
> Mirela
> 
> root@imx8qxpmek:/unit_tests/JPEG# ./v4l2-compliance-master -d
> /dev/video0 -s
> v4l2-compliance 1.21.0-4675, 64 bits, 64-bit time_t
> v4l2-compliance SHA: b84569db756a 2020-10-23 12:30:38
> 
> Compliance test for mxc-jpeg decode device /dev/video0:
> 
> Driver Info:
> 	Driver name      : mxc-jpeg decode
> 	Card type        : mxc-jpeg decoder
> 	Bus info         : platform:58400000.jpegdec
> 	Driver version   : 5.10.0
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
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
> 	test invalid ioctls: OK
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
> 		fail: v4l2-test-formats.cpp(810):
> fmt_raw.g_colorspace() != V4L2_COLORSPACE_SRGB
> 	test VIDIOC_S_FMT: FAIL
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
> 	Video Capture Multiplanar: Captured 58 buffers    
> 	test MMAP (no poll): OK
> 	Video Capture Multiplanar: Captured 58 buffers    
> 	test MMAP (select): OK
> 	Video Capture Multiplanar: Captured 58 buffers    
> 	test MMAP (epoll): OK
> 	test USERPTR (no poll): OK (Not Supported)
> 	test USERPTR (select): OK (Not Supported)
> 	test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for mxc-jpeg decode device /dev/video0: 52, Succeeded: 51,
> Failed: 1, Warnings: 0
> 
> 
> root@imx8qxpmek:/unit_tests/JPEG# ./v4l2-compliance-master -d
> /dev/video1 -s
> v4l2-compliance 1.21.0-4675, 64 bits, 64-bit time_t
> v4l2-compliance SHA: b84569db756a 2020-10-23 12:30:38
> 
> Compliance test for mxc-jpeg decode device /dev/video1:
> 
> Driver Info:
> 	Driver name      : mxc-jpeg decode
> 	Card type        : mxc-jpeg decoder
> 	Bus info         : platform:58450000.jpegenc
> 	Driver version   : 5.10.0
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
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
> 	test invalid ioctls: OK
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
> 		fail: v4l2-test-formats.cpp(810):
> fmt_raw.g_colorspace() != V4L2_COLORSPACE_SRGB
> 	test VIDIOC_S_FMT: FAIL
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
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
> 	Video Capture Multiplanar: Captured 58 buffers    
> 	test MMAP (no poll): OK
> 	Video Capture Multiplanar: Captured 58 buffers    
> 	test MMAP (select): OK
> 	Video Capture Multiplanar: Captured 58 buffers    
> 	test MMAP (epoll): OK
> 	test USERPTR (no poll): OK (Not Supported)
> 	test USERPTR (select): OK (Not Supported)
> 	test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for mxc-jpeg decode device /dev/video1: 52, Succeeded: 51,
> Failed: 1, Warnings: 0
> 

