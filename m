Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76C655A255
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 19:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfF1R3i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 13:29:38 -0400
Received: from mx08-00252a01.pphosted.com ([91.207.212.211]:54238 "EHLO
        mx08-00252a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726443AbfF1R3h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 13:29:37 -0400
Received: from pps.filterd (m0102629.ppops.net [127.0.0.1])
        by mx08-00252a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x5SHQXtU029289
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 18:29:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raspberrypi.org; h=mime-version :
 references : in-reply-to : from : date : message-id : subject : to : cc :
 content-type; s=pp; bh=5A/VfVkhE6qIl4eRT93KR8wFOs8zFJlN2alhRZdo+JE=;
 b=K66qXHJv3U5W5L6KNhnfDwQ6hE50rPkHLiVIAPmh+44+6hoOe7GNVZpAIKXsslP5gYXb
 9U/BVeRJr5/2j3AShA+4KRaTdGSDooTWNntDeeFeaND/wP3NSdxVprOjM3mNWvmjZ7+a
 jjDOOEN+Af0uqsTR9ryXo3+d8YNLfvyWXpresb0kpoGpLKuBeGWgTvMAoJ8O/x/DCE5d
 on2CORV6bUG+MYxVwqXPyRCi9+z5AVNKXwk501lUlDQPzoIdXbI5h7CCTlT2Fla2e99O
 9pQFRo2YkEPFv7W/Xme3x63IHtw9djp55CWBTqbnTJZY2N7pJeGNFRTk8EBXLa2awhG1 RA== 
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
        by mx08-00252a01.pphosted.com with ESMTP id 2t9exhk7tf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 18:29:34 +0100
Received: by mail-pg1-f198.google.com with SMTP id 3so3517689pgc.5
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 10:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5A/VfVkhE6qIl4eRT93KR8wFOs8zFJlN2alhRZdo+JE=;
        b=OAPk9+ubDKI83VdLk4VlY+96T+ZKRWRM9fJp8kiYYKYPD1kLTqhg1ANoN/KfI4JQjB
         8xYwfaEKe3Q7OHiyMSOqoPxLUS7U03U63azVsOca+Jtm/2Bz7bFYtbOs6SnedtMPqo6Y
         5Kei6D7KyFoih0SD1QhoHCJ9xjNNzKEodSjYRUo6t13JmPHnMkucywwEUtNOP8l99Zyr
         /v/Byh4aQCywCz98jbnEq5WKmJ9JZeGU0AB0uew6MsfHpF4/foYKk387R76C2xKwmyL7
         vveC11L9PUr1PZMncypBh1KesZqvqbyh2oXHbKhYxgT/SK/EFkvfO5ZI4lQ2v8sClhzc
         /6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5A/VfVkhE6qIl4eRT93KR8wFOs8zFJlN2alhRZdo+JE=;
        b=bLulxPHcT41MPFKaN6lC7OwC/9r4tU2MnjDecOUhjzuDd8aCAuUnk+XmseW8B8ZhQr
         qHsONzhs6BqshLi1v5D1ys83bLwHY4sEhjiHp8RXEI7U+IvjcgbScoLeXlzvP1OjBLra
         4D5Nwjh9QZLOJg3Af+NTVYaPIVI5AxuRAv/NqvYWlQaV+EKCjhRBxOKGW449A9BpIk+p
         ocYS7/Ks6+eqb12dvbwfThRPtj2CF4lUdXGrgKLgfZ3q+osge4UQSzJHBGqEzfvRFSKP
         d3g42TlYz6OjZtMRy5iF9u8IuB4BIXBeIC9Nsl4/c52rZfI41M7JkhwEcr2PDEGfrs9+
         wW7Q==
X-Gm-Message-State: APjAAAXWY+SVFdS93RBQX4QTgLPp5tHIhyBtPEuNPf8BdBV1exI+9HY9
        CxCR6u+0KdI4MuRZXP4W/5BtWkGMRz+ZECbDHpxK5iAp+mmaKQtbrR52LmmDdPIgg4UujMk7Vp6
        6vWwLkdkXULTzu0iQQ+hML+GoGW1uCXQXXBbOrQ==
X-Received: by 2002:a63:360d:: with SMTP id d13mr1127892pga.80.1561742971048;
        Fri, 28 Jun 2019 10:29:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzkq0jbIc2lsZtHMp766UcnpA3ZUkcXoAFg0hqnzHMO6+WgWh5ZaubUuoeMnqSJwjf1QkjZBS6u1Qd9o+PjjOY=
X-Received: by 2002:a63:360d:: with SMTP id d13mr1127873pga.80.1561742970716;
 Fri, 28 Jun 2019 10:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
 <f4492041-2587-eedb-8ae5-ae610e90fde2@xs4all.nl> <24265b85-a12a-7a46-91d1-f20f5a133f8b@gmx.net>
In-Reply-To: <24265b85-a12a-7a46-91d1-f20f5a133f8b@gmx.net>
From:   Dave Stevenson <dave.stevenson@raspberrypi.org>
Date:   Fri, 28 Jun 2019 18:29:17 +0100
Message-ID: <CAAoAYcM6-xBEZfzpxchwh5z21HbFbu57a=7PZNoLB5J2vef7QA@mail.gmail.com>
Subject: Re: [PATCH 00/31] staging: bcm2835-camera: Improvements
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        LMML <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-06-28_08:2019-06-25,2019-06-28 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan

On Fri, 28 Jun 2019 at 17:57, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Hi Hans,
>
> Am 28.06.19 um 10:06 schrieb Hans Verkuil:
> > Hi Stefan,
> >
> > On 6/27/19 8:55 PM, Stefan Wahren wrote:
> >> This is an attempt to help Dave Stevenson to get all the fixes and
> >> improvements of the bcm2835-camera driver into mainline.
> >>
> >> Mostly i only polished the commit logs for upstream.
> >>
> >> The series based on the latest bugfix V2 of staging: bcm2835-camera: Resto=
> >> re
> >> return behavior of ctrl_set_bitrate().
> > Thank you for working on this.
> >
> > Three high-level questions:
> >
> > 1) Can you post the output of 'v4l2-compliance -s' using the latest v4l2-compliance
> >    from https://git.linuxtv.org/v4l-utils.git ?  I'm interested to see what the
> >    status is of this driver w.r.t. the compliance tests.
>
> Before this series (Raspberry Pi 3, Camera 1.3, Linux
> 5.2.0-rc3-next-20190607, multi_v7_defconfig):
>
> v4l2-compliance SHA: b16f9e945d74aa552abdd6f873821cb77faaf13a, 32 bits
>
> Compliance test for bm2835 mmal device /dev/video0:
>
> Driver Info:
>     Driver name      : bm2835 mmal
>     Card type        : mmal service 16.1
>     Bus info         : platform:bcm2835-v4l2
>     Driver version   : 5.2.0
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
>         fail: v4l2-test-buffers.cpp(715): q.create_bufs(node, 1, &fmt)
> != EINVAL
>     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>     test VIDIOC_EXPBUF: OK (Not Supported)
>     test Requests: OK (Not Supported)
>
> Test input 0:
>
> Streaming ioctls:
>     test read/write: OK
>         fail: v4l2-test-buffers.cpp(2145): node->streamon(q.g_type())
>         fail: v4l2-test-buffers.cpp(2224): testBlockingDQBuf(node, q)
>     test blocking wait: FAIL
>         fail: v4l2-test-buffers.cpp(1294): q.create_bufs(node, 1, &fmt)
> != EINVAL
>     test MMAP (no poll): FAIL
>         fail: v4l2-test-buffers.cpp(1294): q.create_bufs(node, 1, &fmt)
> != EINVAL
>     test MMAP (select): FAIL
>         fail: v4l2-test-buffers.cpp(1294): q.create_bufs(node, 1, &fmt)
> != EINVAL
>     test MMAP (epoll): FAIL
>
> After this series:
>
> v4l2-compliance SHA: b16f9e945d74aa552abdd6f873821cb77faaf13a, 32 bits
>
> Compliance test for bm2835 mmal device /dev/video0:
>
> Driver Info:
>     Driver name      : bm2835 mmal
>     Card type        : mmal service 16.1
>     Bus info         : platform:bcm2835-v4l2
>     Driver version   : 5.2.0
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
>
> Unfortunately in both cases the program hangs and never finish. This is
> the output of strace:
>
> ioctl(3, VIDIOC_DQBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE
>
> It is possible that this is a problem with the used linux-next version.
> Nevertheless the series is improvement.

Could you try running
v4l2-ctl -v width=640,height=480,pixelformat=YU12
before running v4l2-compliance? The default format is JPEG, and I just
wonder if there is an issue lurking in the compression side.

I'll get a Pi3 mainline build going when I get a chance.

> > 2) What is the status of this driver from your point of view?
> Sorry, i'm not a media expert. But i agree with Dan this needs
> improvement of error handling. For example mapping the MMAL error codes
> to Linux error codes would avoid confusion.
> > What is needed to get it out of staging?
>
> I think the driver needs more testing for 64 bit. Contrary to Raspbian a
> lot of the "mainline" distributions only concentrate on arm64. But
> currently i don't know of any 64 bit specific issues.

64 bit builds were working fine (currently broken downstream due to a
different change).
Whilst the VPU and IPC are only 32bit, there are idr lookups from any
64bit values in the kernel.
Once things have calmed down again a bit I will be resuming 64bit
kernel with 32bit userland work.

> I also can't say anything about the content of the TODO file.

I think some of the items were wishlist items from others rather than
requirements.

1) For dma-bufs to be useful in the rest of the system we need to
switch from the vmalloc allocator to dma-contig. Downstream I have
drivers in place that then allow the passing of the dma_addr to the
VPU for use as a buffer handle.
It also means a switch from allocating memory as gpu_mem to cma, so
requires some careful thought on our side for how heap allocation is
done.

2) Removing the extra copy isn't trivial on the firmware side.
Multi-planar also doesn't currently fall out easily as the VPU
requirements would be for a single contiguous allocation with offsets
for the planes. The current allocators allocate independent buffers
for each plane, and put page alignment requirements on each plane.
Other than SDRAM bandwidth, it has a minimal performance hit on the
system.

3) ARM64 works. Someone else may recall better on this, but I believe
vchi is now using the correct dma-ops for everything.

Thanks again for all your efforts on this.

  Dave
