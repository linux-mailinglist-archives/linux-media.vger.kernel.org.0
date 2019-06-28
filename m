Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B055598D8
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 12:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbfF1K4o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 06:56:44 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:41653 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726514AbfF1K4o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 06:56:44 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id goYXhlEE4SfvXgoYbhRYAF; Fri, 28 Jun 2019 12:56:41 +0200
Subject: Re: [PATCH 00/31] staging: bcm2835-camera: Improvements
To:     Dave Stevenson <dave.stevenson@raspberrypi.org>
Cc:     Stefan Wahren <wahrenst@gmx.net>, Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        LMML <linux-media@vger.kernel.org>
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
 <f4492041-2587-eedb-8ae5-ae610e90fde2@xs4all.nl>
 <CAAoAYcMxqNiHLVB=9PyiU1QmLNkzqBEVabdO35-ZTBB5ijSwxA@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <29209687-87cd-9743-4a29-ac021be74217@xs4all.nl>
Date:   Fri, 28 Jun 2019 12:56:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAAoAYcMxqNiHLVB=9PyiU1QmLNkzqBEVabdO35-ZTBB5ijSwxA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIHu1xCo4Abz4Bs/oeB/zxM+s4CDVkaKLMHw0XYOC1fygpcYhsFql5kSqrdm5qpVVkW4qxwUOQ5TmqwfgBA1xlzxQ+6M9+fH1+MnB4MmPBxpfrezvO1j
 kK6ojtjf1sxWzcJop4/X5lRxwWshna24GfNcymk2yYBlZmvWyex4ZgPIpBu7ykeDqxrxtrw/mCwmMH4LVlnTaIB/6rS99L8z9bfPvrECpFNBqvLrpi4qYlPu
 Fmhqx1My3YakbdMg3oo2RFS0Rt6e1bhzmn1pndxm09FDRT9kwxp/JfgFVvvjQq3p6f8I3slLugIh/vjTSC586BaGnfH5Ep3ba/uUwY6nRnsDDarojDwCsP2H
 1YbvBbOL2wl7Khl+/h7O3emz7zv4oD/nLlsxYebtA0VFfy9HOTB1NCWCRaXAMSqrV/Ok72CKzKmLuhbq3FQfGpVlxgmzt6pJR9e+6LpWS3kdwPEOYhmLcSEv
 LoubcT5dYPwG1QwH
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/28/19 12:39 PM, Dave Stevenson wrote:
> Hi Stefan
> 
> Firstly a huge thank you for picking this up - it's been on my to-do
> list for ages, and just hasn't made it to the top.
> 
> On Fri, 28 Jun 2019 at 09:06, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Hi Stefan,
>>
>> On 6/27/19 8:55 PM, Stefan Wahren wrote:
>>> This is an attempt to help Dave Stevenson to get all the fixes and
>>> improvements of the bcm2835-camera driver into mainline.
>>>
>>> Mostly i only polished the commit logs for upstream.
>>>
>>> The series based on the latest bugfix V2 of staging: bcm2835-camera: Resto=
>>> re
>>> return behavior of ctrl_set_bitrate().
>>
>> Thank you for working on this.
>>
>> Three high-level questions:
>>
>> 1) Can you post the output of 'v4l2-compliance -s' using the latest v4l2-compliance
>>    from https://git.linuxtv.org/v4l-utils.git ?  I'm interested to see what the
>>    status is of this driver w.r.t. the compliance tests.
> 
> Hi Hans.
> 
> Running it against the downstream driver (which should be nearly
> identical based on this set of patches), 4.19, on a Pi4 I get
> pi@raspberrypi:~/v4l-utils/utils/v4l2-compliance $ ./v4l2-compliance -s
> v4l2-compliance SHA: b16f9e945d74aa552abdd6f873821cb77faaf13a, 32 bits
> 
> Compliance test for bm2835 mmal device /dev/video0:
> 
> Driver Info:
>     Driver name      : bm2835 mmal
>     Card type        : mmal service 16.1
>     Bus info         : platform:bcm2835-v4l2
>     Driver version   : 4.19.56
>     Capabilities     : 0x85200005
>         Video Capture
>         Video Overlay
>         Read/Write
>         Streaming
>         Extended Pix Format
>         Device Capabilities
>     Device Caps      : 0x05200005
>         Video Capture
>         Video Overlay
>         Read/Write
>         Streaming
>         Extended Pix Format
> 
> Required ioctls:
>     test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
>     test second /dev/video0 open: OK
>     test VIDIOC_QUERYCAP: OK
>     test VIDIOC_G/S_PRIORITY: OK
>     test for unlimited opens: OK
> 
> Debug ioctls:
>     test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>     test VIDIOC_LOG_STATUS: OK
> 
> Input ioctls:
>     test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>     test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>     test VIDIOC_ENUMAUDIO: OK (Not Supported)
>     test VIDIOC_G/S/ENUMINPUT: OK
>     test VIDIOC_G/S_AUDIO: OK (Not Supported)
>     Inputs: 1 Audio Inputs: 0 Tuners: 0
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
> Control ioctls (Input 0):
>     test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>     test VIDIOC_QUERYCTRL: OK
>     test VIDIOC_G/S_CTRL: OK
>     test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>     test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>     test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>     Standard Controls: 33 Private Controls: 0
> 
> Format ioctls (Input 0):
>     test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>     test VIDIOC_G/S_PARM: OK
>     test VIDIOC_G_FBUF: OK
>     test VIDIOC_G_FMT: OK
>     test VIDIOC_TRY_FMT: OK
>     test VIDIOC_S_FMT: OK
>     test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>     test Cropping: OK (Not Supported)
>     test Composing: OK (Not Supported)
>     test Scaling: OK
> 
> Codec ioctls (Input 0):
>     test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>     test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>     test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
>     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>     test VIDIOC_EXPBUF: OK (Not Supported)
>     test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
>     test read/write: OK
>     test blocking wait: OK
>             warn: v4l2-test-buffers.cpp(1429): Can free buffers even
> if still mmap()ed
>     test MMAP (no poll): OK
>             warn: v4l2-test-buffers.cpp(1429): Can free buffers even
> if still mmap()ed
>     test MMAP (select): OK
>             warn: v4l2-test-buffers.cpp(1429): Can free buffers even
> if still mmap()ed
>     test MMAP (epoll): OK
>     test USERPTR (no poll): OK
>     test USERPTR (select): OK
>     test DMABUF (no poll): OK (Not Supported)
>     test DMABUF (select): OK (Not Supported)
> 
> Total for bm2835 mmal device /dev/video0: 53, Succeeded: 53, Failed:
> 0, Warnings: 3
> 
> The warnings are because downstream we have an early version of
> "media: vb2: Allow reqbufs(0) with "in use" MMAP buffers" that doesn't
> set the flag to userspace. I need to revert that and apply the
> accepted one (it's not a clean cherrypick though).
> 
> I do try and run compliance every few months because I'm aware that
> you frequently add extra tests.

Much appreciated! That's also a great help in getting this into mainline.
If it passes these test cleanly, then that gives me a lot of confidence
about the quality of the driver.

>> 2) What is the status of this driver from your point of view? What is needed to
>>    get it out of staging?
> 
> I think the main issue is the dependency on vchiq. I'm hoping that the
> V4L2 side of this is now relatively clean, but it probably wants a
> full review when someone has the time.

A full review of the v4l2 driver? Ping me once we've merged this patch series,
and I can do a full review of the driver. I'll try to go through this series
today.

> 
>> 3) Out of curiosity: is this driver still valid for RPi4?
> 
> Yes, it is still valid. The imaging side hasn't changed significantly,
> it just runs a bit faster.

Nice!

	Hans
