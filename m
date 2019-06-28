Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35615598C9
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 12:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbfF1Kv3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 06:51:29 -0400
Received: from mx07-00252a01.pphosted.com ([62.209.51.214]:1428 "EHLO
        mx07-00252a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726524AbfF1Kv3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 06:51:29 -0400
X-Greylist: delayed 710 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 Jun 2019 06:51:26 EDT
Received: from pps.filterd (m0102628.ppops.net [127.0.0.1])
        by mx07-00252a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x5SAcT23021435
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 11:39:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raspberrypi.org; h=mime-version :
 references : in-reply-to : from : date : message-id : subject : to : cc :
 content-type; s=pp; bh=MgvxS7rVwy/049YflKjnKGTKQ+HL2aJJ079s/pHhqUs=;
 b=hpy5Hahv7e6rq0h0AOZ3GoHHWIGAfbzxmIyMcZ+Yitlks0cbCM3zhnAYd12jLID4rJXl
 3uFWlo43taSWyUodBTdRoiiG/wJnOEJSx7tLpMgBikXnkXp9Gx93hRc1Fzlp68LwfVMh
 we9rUBRSGNKET9E5CXoziTNrXn9jIW0oARGXGyCa82rUIFSyXiy3LGHw6u2PuTZWI0Hr
 nwYpGnlaSL46weTOip9h6kEZdxa4mGOcltsMcekMdCOpr+V0G7Ku2P0BXyC9o2TTyYLH
 3aSPFcisbQWyaNYRDUQHK/xM0FdqoMX0c2IjpGDFAqjr+EAH6y3yDAu17plLHDTTNFKc wA== 
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
        by mx07-00252a01.pphosted.com with ESMTP id 2t9ehuu2yh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 11:39:35 +0100
Received: by mail-pl1-f198.google.com with SMTP id a5so3314617pla.3
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 03:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MgvxS7rVwy/049YflKjnKGTKQ+HL2aJJ079s/pHhqUs=;
        b=QP3bpBBqfTQcuIPIL35AL6V59Bly7/8OOBFN3vei2qCmLvwQX/x5dUpyUeJwcnJ/G8
         5PWgIWQnOQUBbgBaRnAnIKGk+fYVKlGMfk3Hz7QQyQO7PBnHugGnlWW1JHPuIAeYveD7
         d+cQ8d2Fn/aju88j02cuciMojKrByqcz6LAIANh9q571GMfShmWfaYBaTWP5WeR90Qyo
         wLkNfMfvErt91FUfFv/BG6UDPm3x8wSBpv2zU3ar1kAzoYvF8+4L4l5IQ1+/LDJfUiNB
         JO7PnO+e3WcIgptvxpamCvYXTPq7znnTIVLZYwGvUSqCkpaZWM6HKvKF/r/HEclve2Aw
         Z64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MgvxS7rVwy/049YflKjnKGTKQ+HL2aJJ079s/pHhqUs=;
        b=riWQoztgl4moiuRUvUaXZdV7IzQMKxtaSGXyxrqjaP0GyIoMQrdSaFAhBQByf9s/Zz
         6aM/uqMItLvEoufr++WSLRc0xHsj6APfyB10AkDq02CEQGZtp6zS5HcWZPpDNurG9iSH
         X+b10Zl0M8S3JK5elXhthy768HcB5s3T3dztfdlsXDyBk9uej1mlSkQGq1fEz6axDwqv
         h2zjo7Xf9F4d4m5hmORzfxdWxN8U01wE04S3PDyDM03GjGO4Ru4vBVoee1GkX8OC0NqV
         5+IKB7cCEoNzJi8PDng0YO0GDYyPw5A/0luFy0Rvol/5a9Q0XpdF91C+3bDnSQLTH3bT
         r8+w==
X-Gm-Message-State: APjAAAWM1BhcgTIU2VjiK9ICl8/qdtzfkEf55RNx0tDIcsC2viIND3LO
        tpAGTsol1FVbAWMh3crtj0p4Z8rzYXGUkeqsh+XsxIStv058Ch1g6v+0uSTdGeQEFg/Rk4BGlFd
        YxJNnGCqy5DPHVuok8fIhJGPLAAhx3LfoidB5dw==
X-Received: by 2002:a63:360d:: with SMTP id d13mr8663275pga.80.1561718373361;
        Fri, 28 Jun 2019 03:39:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzYUiO45rSRH0WJ6NDrEAeD1snwBUde7nzBvYLWt2tIOkSofz2vvGr8F/fz5p4u5n/tfNWRReppS1ngXIFCH/s=
X-Received: by 2002:a63:360d:: with SMTP id d13mr8663231pga.80.1561718372896;
 Fri, 28 Jun 2019 03:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net> <f4492041-2587-eedb-8ae5-ae610e90fde2@xs4all.nl>
In-Reply-To: <f4492041-2587-eedb-8ae5-ae610e90fde2@xs4all.nl>
From:   Dave Stevenson <dave.stevenson@raspberrypi.org>
Date:   Fri, 28 Jun 2019 11:39:19 +0100
Message-ID: <CAAoAYcMxqNiHLVB=9PyiU1QmLNkzqBEVabdO35-ZTBB5ijSwxA@mail.gmail.com>
Subject: Re: [PATCH 00/31] staging: bcm2835-camera: Improvements
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Stefan Wahren <wahrenst@gmx.net>, Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        LMML <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-06-28_04:2019-06-25,2019-06-28 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan

Firstly a huge thank you for picking this up - it's been on my to-do
list for ages, and just hasn't made it to the top.

On Fri, 28 Jun 2019 at 09:06, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Stefan,
>
> On 6/27/19 8:55 PM, Stefan Wahren wrote:
> > This is an attempt to help Dave Stevenson to get all the fixes and
> > improvements of the bcm2835-camera driver into mainline.
> >
> > Mostly i only polished the commit logs for upstream.
> >
> > The series based on the latest bugfix V2 of staging: bcm2835-camera: Resto=
> > re
> > return behavior of ctrl_set_bitrate().
>
> Thank you for working on this.
>
> Three high-level questions:
>
> 1) Can you post the output of 'v4l2-compliance -s' using the latest v4l2-compliance
>    from https://git.linuxtv.org/v4l-utils.git ?  I'm interested to see what the
>    status is of this driver w.r.t. the compliance tests.

Hi Hans.

Running it against the downstream driver (which should be nearly
identical based on this set of patches), 4.19, on a Pi4 I get
pi@raspberrypi:~/v4l-utils/utils/v4l2-compliance $ ./v4l2-compliance -s
v4l2-compliance SHA: b16f9e945d74aa552abdd6f873821cb77faaf13a, 32 bits

Compliance test for bm2835 mmal device /dev/video0:

Driver Info:
    Driver name      : bm2835 mmal
    Card type        : mmal service 16.1
    Bus info         : platform:bcm2835-v4l2
    Driver version   : 4.19.56
    Capabilities     : 0x85200005
        Video Capture
        Video Overlay
        Read/Write
        Streaming
        Extended Pix Format
        Device Capabilities
    Device Caps      : 0x05200005
        Video Capture
        Video Overlay
        Read/Write
        Streaming
        Extended Pix Format

Required ioctls:
    test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
    test second /dev/video0 open: OK
    test VIDIOC_QUERYCAP: OK
    test VIDIOC_G/S_PRIORITY: OK
    test for unlimited opens: OK

Debug ioctls:
    test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
    test VIDIOC_LOG_STATUS: OK

Input ioctls:
    test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
    test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
    test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
    test VIDIOC_ENUMAUDIO: OK (Not Supported)
    test VIDIOC_G/S/ENUMINPUT: OK
    test VIDIOC_G/S_AUDIO: OK (Not Supported)
    Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
    test VIDIOC_G/S_MODULATOR: OK (Not Supported)
    test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
    test VIDIOC_ENUMAUDOUT: OK (Not Supported)
    test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
    test VIDIOC_G/S_AUDOUT: OK (Not Supported)
    Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
    test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
    test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
    test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
    test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
    test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
    test VIDIOC_QUERYCTRL: OK
    test VIDIOC_G/S_CTRL: OK
    test VIDIOC_G/S/TRY_EXT_CTRLS: OK
    test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
    test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
    Standard Controls: 33 Private Controls: 0

Format ioctls (Input 0):
    test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
    test VIDIOC_G/S_PARM: OK
    test VIDIOC_G_FBUF: OK
    test VIDIOC_G_FMT: OK
    test VIDIOC_TRY_FMT: OK
    test VIDIOC_S_FMT: OK
    test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
    test Cropping: OK (Not Supported)
    test Composing: OK (Not Supported)
    test Scaling: OK

Codec ioctls (Input 0):
    test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
    test VIDIOC_G_ENC_INDEX: OK (Not Supported)
    test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
    test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
    test VIDIOC_EXPBUF: OK (Not Supported)
    test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
    test read/write: OK
    test blocking wait: OK
            warn: v4l2-test-buffers.cpp(1429): Can free buffers even
if still mmap()ed
    test MMAP (no poll): OK
            warn: v4l2-test-buffers.cpp(1429): Can free buffers even
if still mmap()ed
    test MMAP (select): OK
            warn: v4l2-test-buffers.cpp(1429): Can free buffers even
if still mmap()ed
    test MMAP (epoll): OK
    test USERPTR (no poll): OK
    test USERPTR (select): OK
    test DMABUF (no poll): OK (Not Supported)
    test DMABUF (select): OK (Not Supported)

Total for bm2835 mmal device /dev/video0: 53, Succeeded: 53, Failed:
0, Warnings: 3

The warnings are because downstream we have an early version of
"media: vb2: Allow reqbufs(0) with "in use" MMAP buffers" that doesn't
set the flag to userspace. I need to revert that and apply the
accepted one (it's not a clean cherrypick though).

I do try and run compliance every few months because I'm aware that
you frequently add extra tests.

> 2) What is the status of this driver from your point of view? What is needed to
>    get it out of staging?

I think the main issue is the dependency on vchiq. I'm hoping that the
V4L2 side of this is now relatively clean, but it probably wants a
full review when someone has the time.

> 3) Out of curiosity: is this driver still valid for RPi4?

Yes, it is still valid. The imaging side hasn't changed significantly,
it just runs a bit faster.

  Dave

> Regards,
>
>         Hans
>
> >
> > Dave Stevenson (31):
> >   staging: bcm2835-camera: Ensure H264 header bytes get a sensible
> >     timestamp
> >   staging: bcm2835-camera: Check the error for REPEAT_SEQ_HEADER
> >   staging: bcm2835-camera: Replace spinlock protecting context_map with
> >     mutex
> >   staging: bcm2835-camera: Do not bulk receive from service thread
> >   staging: bcm2835-camera: Correctly denote key frames in encoded data
> >   staging: bcm2835-camera: Return early on errors
> >   staging: bcm2835-camera: Remove dead email addresses
> >   staging: bcm2835-camera: Fix comment style violations.
> >   staging: bcm2835-camera: Fix spacing around operators
> >   staging: bcm2835-camera: Reduce length of enum names
> >   staging: bcm2835-camera: Fix multiple line dereference errors
> >   staging: bcm2835-camera: Fix brace style issues.
> >   staging: bcm2835-camera: Fix missing lines between items
> >   staging: bcm2835-camera: Fix open parenthesis alignment
> >   staging: bcm2835-camera: Ensure all buffers are returned on disable
> >   staging: bcm2835-camera: Remove check of the number of buffers
> >     supplied
> >   staging: bcm2835-camera: Handle empty EOS buffers whilst streaming
> >   staging: bcm2835-camera: Set sequence number correctly
> >   staging: bcm2835-camera: Ensure timestamps never go backwards.
> >   staging: bcm2835-camera: Add multiple inclusion protection to headers
> >   staging: bcm2835-camera: Unify header inclusion defines
> >   staging: bcm2835-camera: Fix multiple assignments should be avoided
> >   staging: bcm2835-camera: Fix up mmal-parameters.h
> >   staging: bcm2835-camera: Use enums for max value in controls
> >   staging: bcm2835-camera: Correct V4L2_CID_COLORFX_CBCR behaviour
> >   staging: bcm2835-camera: Remove/amend some obsolete comments
> >   staging: mmal-vchiq: Avoid use of bool in structures
> >   staging: bcm2835-camera: Fix stride on RGB3/BGR3 formats
> >   staging: bcm2835-camera: Add sanity checks for queue_setup/CREATE_BUFS
> >   staging: bcm2835-camera: Set the field value within ach buffer
> >   staging: bcm2835-camera: Correct ctrl min/max/step/def to 64bit
> >
> >  .../vc04_services/bcm2835-camera/bcm2835-camera.c  | 378 ++++++++++++----=
> > -----
> >  .../vc04_services/bcm2835-camera/bcm2835-camera.h  |  34 +-
> >  .../vc04_services/bcm2835-camera/controls.c        | 184 +++++-----
> >  .../vc04_services/bcm2835-camera/mmal-common.h     |  12 +-
> >  .../vc04_services/bcm2835-camera/mmal-encodings.h  |   9 +-
> >  .../vc04_services/bcm2835-camera/mmal-msg-common.h |   9 +-
> >  .../vc04_services/bcm2835-camera/mmal-msg-format.h | 104 +++---
> >  .../vc04_services/bcm2835-camera/mmal-msg-port.h   | 133 ++++----
> >  .../vc04_services/bcm2835-camera/mmal-msg.h        | 150 ++++----
> >  .../vc04_services/bcm2835-camera/mmal-parameters.h | 286 +++++++++-------
> >  .../vc04_services/bcm2835-camera/mmal-vchiq.c      | 159 +++++----
> >  .../vc04_services/bcm2835-camera/mmal-vchiq.h      |  22 +-
> >  12 files changed, 826 insertions(+), 654 deletions(-)
> >
> > =2D-
> > 2.7.4
> >
>
