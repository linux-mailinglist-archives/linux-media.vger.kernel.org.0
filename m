Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A83FF153F6D
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 08:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgBFH5Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 02:57:24 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40278 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbgBFH5Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 02:57:24 -0500
Received: by mail-wm1-f67.google.com with SMTP id t14so5758260wmi.5
        for <linux-media@vger.kernel.org>; Wed, 05 Feb 2020 23:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gVqpc3oIEeuwunX17mZOp+jpMiD41EKmA9Gooj+uTTc=;
        b=so2W7pCu8gqX+yvxwcDR+lvvVWQA05gBD/cgi+cBI6mN6q4fmlXZGO9GYbUBJAep6J
         rpAWACH2xFeJVwEk94I9QyhLwpctkPMQ0pocSIMiacW0mR+nEsedi327SDIKw7REPwsE
         eHM3QAJytO1Zv+s4ctazUf3UFtPCWKPHALYaKPtjUQD1JTBiFCJDSvWceE72OIgWcNVW
         OtpYr/uxD2WD+U1q8ndifMQDsmmrbWbCuaA3arWHIooUkYFINTXKpmn43a1o6U391oHj
         DKy818grrfK1I+3FIG6c/cdBTUCNCB5m0VYepZkJFIMxf8ZhaOR5/v10cTcJXqgfIrM6
         arOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=gVqpc3oIEeuwunX17mZOp+jpMiD41EKmA9Gooj+uTTc=;
        b=ITAt1yDCNT28PfBwcMjnPFfrFWZcMkWzg2EVmDRBZNu21RAVZ59xRT/wv5kyEIqXm1
         xev3KEFEeOXSrUmmZBlQrWZIaq7rrn15GIBy+UvZN0CxHtEM25+oe8i2Xp6asmGgZ5PV
         kQvvj7wQLXXj6O8ivPYTl0BfVOa+n6lawEdxxlcclYkaWdzeNMcw+8X8/su0ABbwkMyY
         HaD6IO7P4dIQQa0Ynp6FQD0c6wbv4GxkFkdyKvsKwVFlc6Y9uYJYfqvB3J5mGJUP9BF6
         mBlCcF8wOO+keB2ht87LW+hyymjlEm1wl1UI3CwzbBxSLLjLAxN1xXmZo7HRJdPtjLdc
         yqYg==
X-Gm-Message-State: APjAAAUAbn6iFXAwcfPIzG7+T82EUG03lv3XWqEkbOdwFVwH4z/i6QCr
        +xHe2N6FR0WfMcWEPB+a5ahcyw==
X-Google-Smtp-Source: APXvYqzT2ea/IJBeCv1ay/a4cj13gu0UVUcGW2ZpI3U5SNCrBCdKvrp46DmWNIMtTHAFSgAvMTnX2w==
X-Received: by 2002:a1c:6389:: with SMTP id x131mr2817850wmb.174.1580975840253;
        Wed, 05 Feb 2020 23:57:20 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7? ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
        by smtp.gmail.com with ESMTPSA id k8sm3077509wrq.67.2020.02.05.23.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 23:57:19 -0800 (PST)
Subject: Re: [PATCH v4 0/4] media: meson: vdec: Add compliant H264 support
To:     Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
        hans.verkuil@cisco.com
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200116133025.1903-1-narmstrong@baylibre.com>
 <371bccfa68c4a9924137f087ef45c732e64bf808.camel@ndufresne.ca>
 <970b4e5b89db7f055217676a07281e37f6dcd35a.camel@ndufresne.ca>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <f3d8eac3-73cb-75ad-3412-212b229f1654@baylibre.com>
Date:   Thu, 6 Feb 2020 08:57:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <970b4e5b89db7f055217676a07281e37f6dcd35a.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nico,

On 01/02/2020 16:38, Nicolas Dufresne wrote:
> Le samedi 01 février 2020 à 10:34 -0500, Nicolas Dufresne a écrit :
>> Le jeudi 16 janvier 2020 à 14:30 +0100, Neil Armstrong a écrit :
>>> Hello,
>>>
>>> This patch series aims to bring H.264 support as well as compliance update
>>> to the amlogic stateful video decoder driver.
>>>
>>> The issue in the V1 patchset at [1] is solved by patch #1 following comments
>>> and requirements from hans. It moves the full draining & stopped state tracking
>>> and handling from vicodec to core v4l2-mem2mem.
>>>
>>> The vicodec changes still passes the v4l2-utils "media-test" tests, log at [5]:
>>> [...]
>>> vicodec media controller compliance tests
>>>
>>> Thu Jan 16 13:00:56 UTC 2020
>>> v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits
>>> [...]
>>> Summary:
>>
>> I've minimally tested this serie with GStreamer master. Play pause and
>> seek seems to work reliably now. It's a little bit spamy with
>> bbb_sunflower_1080p_30fps_normal.mp4:
>>
>> [  725.304663] meson-vdec c8820000.video-codec: VIFIFO usage (16777763) > VIFIFO size (16777216)
>>
>> But there is no visual artifact or performance degradation.
>>
>> Tested-by: Nicolas Dufresne <nicolas@ndufresne.ca>
> 
> Sorry, I just notice that with kmssink, seek is broken. The kernel
> reports a series of:
> 
>   [ 1065.046970] meson-vdec c8820000.video-codec: Buffer 0 done but it doesn't exist in m2m_ctx


Thanks a lot for testing, can you share your setup (gst version, gst pipeline, stream...), thanks !

Neil

> 
>>
>>> Total for vicodec device /dev/media3: 7, Succeeded: 7, Failed: 0, Warnings: 0
>>> Total for vicodec device /dev/video13: 51, Succeeded: 51, Failed: 0, Warnings: 0
>>> Total for vicodec device /dev/video14: 51, Succeeded: 51, Failed: 0, Warnings: 0
>>> Total for vicodec device /dev/video14: 51, Succeeded: 51, Failed: 0, Warnings: 0
>>> Total for vicodec device /dev/video14: 51, Succeeded: 51, Failed: 0, Warnings: 0
>>> Total for vicodec device /dev/video14: 51, Succeeded: 51, Failed: 0, Warnings: 0
>>> Total for vicodec device /dev/video14: 51, Succeeded: 51, Failed: 0, Warnings: 0
>>> Total for vicodec device /dev/video14: 51, Succeeded: 51, Failed: 0, Warnings: 0
>>>
>>> Final Summary: 364, Succeeded: 364, Failed: 0, Warnings: 0
>>> Thu Jan 16 13:02:59 UTC 2020
>>>
>>> With this, it also passes vdec v4l2-compliance with H264 streaming on Amlogic G12A
>>> and Amlogic SM1 SoCs successfully.
>>>
>>> The compliance log is:
>>> # v4l2-compliance --stream-from-hdr test-25fps.h264.hdr -s
>>> v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits
>>>
>>> Compliance test for meson-vdec device /dev/video0:
>>>
>>> Driver Info:
>>> 	Driver name      : meson-vdec
>>> 	Card type        : Amlogic Video Decoder
>>> 	Bus info         : platform:meson-vdec
>>> 	Driver version   : 5.5.0
>>> 	Capabilities     : 0x84204000
>>> 		Video Memory-to-Memory Multiplanar
>>> 		Streaming
>>> 		Extended Pix Format
>>> 		Device Capabilities
>>> 	Device Caps      : 0x04204000
>>> 		Video Memory-to-Memory Multiplanar
>>> 		Streaming
>>> 		Extended Pix Format
>>> 	Detected Stateful Decoder
>>>
>>> Required ioctls:
>>> 	test VIDIOC_QUERYCAP: OK
>>>
>>> Allow for multiple opens:
>>> 	test second /dev/video19 open: OK
>>> 	test VIDIOC_QUERYCAP: OK
>>> 	test VIDIOC_G/S_PRIORITY: OK
>>> 	test for unlimited opens: OK
>>>
>>> Debug ioctls:
>>> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>
>>> Input ioctls:
>>> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>
>>> Output ioctls:
>>> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>
>>> Input/Output configuration ioctls:
>>> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>> 	test VIDIOC_G/S_EDID: OK (Not Supported)
>>>
>>> Control ioctls:
>>> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>> 	test VIDIOC_QUERYCTRL: OK
>>> 	test VIDIOC_G/S_CTRL: OK
>>> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>> 	Standard Controls: 2 Private Controls: 0
>>>
>>> Format ioctls:
>>> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>> 	test VIDIOC_G/S_PARM: OK (Not Supported)
>>> 	test VIDIOC_G_FBUF: OK (Not Supported)
>>> 	test VIDIOC_G_FMT: OK
>>> 	test VIDIOC_TRY_FMT: OK
>>> 	test VIDIOC_S_FMT: OK
>>> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>> 	test Cropping: OK (Not Supported)
>>> 	test Composing: OK (Not Supported)
>>> 	test Scaling: OK (Not Supported)
>>>
>>> Codec ioctls:
>>> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>> 	test VIDIOC_(TRY_)DECODER_CMD: OK
>>>
>>> Buffer ioctls:
>>> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>> 	test VIDIOC_EXPBUF: OK
>>> 	test Requests: OK (Not Supported)
>>>
>>> Test input 0:
>>>
>>> Streaming ioctls:
>>> 	test read/write: OK (Not Supported)
>>> 	test blocking wait: OK
>>> 	Video Capture Multiplanar: Captured 60 buffers    
>>> 	test MMAP (select): OK
>>> 	Video Capture Multiplanar: Captured 60 buffers    
>>> 	test MMAP (epoll): OK
>>> 	test USERPTR (select): OK (Not Supported)
>>> 	test DMABUF: Cannot test, specify --expbuf-device
>>>
>>> Total for meson-vdec device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
>>>
>>>
>>> Changes since v3 at [3]:
>>> - Fixed vicodec compliance
>>> - Fixed vdec compliance with v4l2 state management
>>> - fixed doc errors for v4l2-mem2mem.h
>>>
>>> Changes since v2 at [2]:
>>> - Move full draining & stopped state tracking into core v4l2-mem2mem
>>> - Adapt vicodec to use the core v4l2-mem2mem draining & stopped state tracking
>>>
>>> Changes since v1 at [1]:
>>> - fixed output_size is never used reported by hans
>>> - rebased on G12A and SM1 patches
>>> - added handling of qbuf after STREAMON and STOP before enought buffer queued
>>>
>>> [1] https://lore.kernel.org/linux-media/20191007145909.29979-1-mjourdan@baylibre.com
>>> [2] https://lore.kernel.org/linux-media/20191126093733.32404-1-narmstrong@baylibre.com
>>> [3] https://lore.kernel.org/linux-media/20191209122028.13714-1-narmstrong@baylibre.com
>>> [4] https://people.freedesktop.org/~narmstrong/vicodec-compliance-7ead0e1856b89f2e19369af452bb03fd0cd16793-20200116.log
>>>
>>> Maxime Jourdan (2):
>>>   media: meson: vdec: bring up to compliance
>>>   media: meson: vdec: add H.264 decoding support
>>>
>>> Neil Armstrong (2):
>>>   media: v4l2-mem2mem: handle draining, stopped and next-buf-is-last
>>>     states
>>>   media: vicodec: use v4l2-mem2mem draining, stopped and
>>>     next-buf-is-last states handling
>>>
>>>  drivers/media/platform/vicodec/vicodec-core.c | 162 ++----
>>>  drivers/media/v4l2-core/v4l2-mem2mem.c        | 172 ++++++-
>>>  drivers/staging/media/meson/vdec/Makefile     |   2 +-
>>>  drivers/staging/media/meson/vdec/codec_h264.c | 482 ++++++++++++++++++
>>>  drivers/staging/media/meson/vdec/codec_h264.h |  14 +
>>>  drivers/staging/media/meson/vdec/esparser.c   |  58 +--
>>>  drivers/staging/media/meson/vdec/vdec.c       |  89 ++--
>>>  drivers/staging/media/meson/vdec/vdec.h       |  14 +-
>>>  .../staging/media/meson/vdec/vdec_helpers.c   |  85 ++-
>>>  .../staging/media/meson/vdec/vdec_helpers.h   |   6 +-
>>>  .../staging/media/meson/vdec/vdec_platform.c  |  71 +++
>>>  include/media/v4l2-mem2mem.h                  |  95 ++++
>>>  12 files changed, 1021 insertions(+), 229 deletions(-)
>>>  create mode 100644 drivers/staging/media/meson/vdec/codec_h264.c
>>>  create mode 100644 drivers/staging/media/meson/vdec/codec_h264.h
>>>
> 

