Return-Path: <linux-media+bounces-20119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB919ACAAF
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 15:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E501F1F21D02
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 13:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6F11B4F17;
	Wed, 23 Oct 2024 13:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="aVrAov/C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C101AE01B
	for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 13:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729688665; cv=none; b=lko93APws2TzFPNED4wGkZRnbh+b3XqekEdMG8NRSvMbGjDJX09ps61u05xd8j8w7YsjfZ/s+WtQGsXx8CGWAwtUjrwAbdPCITERoSR355BMlQkcsA9TZ+rAT7+aHkTnmw8+lWOPDeOe2mgOlpG49PRkTe2whJbjIOUEETNmFTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729688665; c=relaxed/simple;
	bh=MpK6RS+I7PQTp8TXGaMDLzmzgPn58DRmkV1SN7iHK1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mr5sf8WTviubxnMILgyELbtJpHpTa3OgdMm1aJg6i8taXUml7fbgg4nhk2P2UMIpo2pCNXHd2DybFjiOxz802MzvzEPgv07Dxcb5trwhDEs5nHf+lQiCryLSYJcmo7BBQAh2CsoqJj3OzRd42utcD23wD63mH7xv76FSzveLc78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=aVrAov/C; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e2e340218daso1525730276.0
        for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 06:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729688661; x=1730293461; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3/AnBf3/nTkXL2NkhoqZDBIHbWYp0ABCS6QvosRFtZI=;
        b=aVrAov/C/iYOPrL43Nsh5aaN73DSPW6cN6bXrA1IFmQ0k9f+MIF29PU88z2hAm33kS
         /rlSQCQACJJEhMd2nTl5QbLj6rGkFIWGmzloRz5dGdVCF67tGA6YWNH3klfhnNqZPX0C
         lknKdWVBmx3ISe1kNbebOcmmiXDPIiirVr9EPt7zB5cPksMTWmIoiMtQ0lIBJF3RCZxA
         f7ebTA/K6PyzX/RIWVBGT8CrmxDHNu2P/wtGxTTsNQBnakyl68G+wBEdCLaXQYJ069CS
         ZCdD4B3pBpDjNvoCAcPhAS4Kn5DlXrBqOn7B/4+YZxDT2owanel25TEnzE4OYssXPp72
         TXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729688661; x=1730293461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/AnBf3/nTkXL2NkhoqZDBIHbWYp0ABCS6QvosRFtZI=;
        b=LioUipxLUBt8XIfCmV8CxsG6nc6ncb0I5OKyU3WKdLGFZoZA1AC5y7DozZkyz7VG1M
         B3fBAACk9Isj0aXzf3Atr2XCiDFMJfMVa/QTZHnndfFe56vFdkRqTYL07iNyw4OwrDXs
         oTB+A+CsQFD0GXt8KL4wCb5N+nxhsD3NBf2bQ06dxVTy/P4lhP4tDVa6C+QTtQ3rl8jf
         VVqgs86FLj6o2KujX3F0uNQuDjnLuNdea1+mmVnSgA3861/dU0jZoe6JTa6Xgd3sIg8L
         IYgsBD7vkoj5IW5K7p8czBAov3EOcCXOuThg93pDgeN/dFyMjCwm3JxUksaVEoqfxXLS
         ayyA==
X-Forwarded-Encrypted: i=1; AJvYcCXqL3Rjx2tAGjApg8ninl9zacpCSYh17aEHY9S8kFcnl65crWw7133+x86z/uWfbfos5Gc9YHrLz5NlyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9vpjUkNFuca9NOVxC0jUU8cm4PH9ljiL34cTR8GQMJd+ejXRs
	69E/VXt2LaXwSf0vnxRzWpeO7LzM5bxeYWM+sK/CQJdd+3biBUbey6axCCBLFvic8pqqCSjGa2A
	+Cvg7+zDIp0PAxfaZ1VRCwIt0rxo7RSyCeC4dzDEc6mv1FA/SXQU=
X-Google-Smtp-Source: AGHT+IEfsq7CIMNMAgo1KkUtr4zs+MUmx+SFnPyr4Z9bcxLyjD5TZewsVjQKBtNJ2ISFjKtU0hXXmoGeiQAguCMbTlw=
X-Received: by 2002:a05:690c:4346:b0:647:7782:421a with SMTP id
 00721157ae682-6e7f100497bmr14596277b3.45.1729688661388; Wed, 23 Oct 2024
 06:04:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529-b4-media_docs_improve-v2-0-66318b2da726@collabora.com>
 <20240529-b4-media_docs_improve-v2-3-66318b2da726@collabora.com>
 <c809983f-9559-434b-b1c6-a54e3fcb88f1@xs4all.nl> <20241023122900.GA17733@pendragon.ideasonboard.com>
 <ea9b3744-9792-41b2-9f9b-842cfa24a5ac@xs4all.nl>
In-Reply-To: <ea9b3744-9792-41b2-9f9b-842cfa24a5ac@xs4all.nl>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 14:04:03 +0100
Message-ID: <CAPY8ntCEz-qpnDd3=mJ7L+0KcDjim3oTAWZ6Kpa2Lq=afdN7uw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/3] docs: media: Debugging guide for the media subsystem
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Jonathan Corbet <corbet@lwn.net>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mauro.chehab@linux.intel.com, 
	kernel@collabora.com, bob.beckett@collabora.com, 
	nicolas.dufresne@collabora.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Oct 2024 at 13:37, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 23/10/2024 14:29, Laurent Pinchart wrote:
> > On Wed, Oct 23, 2024 at 01:43:34PM +0200, Hans Verkuil wrote:
> >> On 24/09/2024 10:45, Sebastian Fricke wrote:
> >>> Create a guides section for all documentation material, that isn't
> >>> strictly related to a specific piece of code.
> >>>
> >>> Provide a guide for developers on how to debug code with a focus on the
> >>> media subsystem. This document aims to provide a rough overview over the
> >>> possibilities and a rational to help choosing the right tool for the
> >>> given circumstances.
> >>>
> >>> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> >>> ---
> >>>  Documentation/media/guides/debugging_issues.rst | 174 ++++++++++++++++++++++++
> >>>  Documentation/media/guides/index.rst            |  11 ++
> >>>  Documentation/media/index.rst                   |   1 +
> >>>  3 files changed, 186 insertions(+)
> >>>
> >>> diff --git a/Documentation/media/guides/debugging_issues.rst b/Documentation/media/guides/debugging_issues.rst
> >>> new file mode 100644
> >>> index 000000000000..5f37801dd4ba
> >>> --- /dev/null
> >>> +++ b/Documentation/media/guides/debugging_issues.rst
> >>> @@ -0,0 +1,174 @@
> >>> +.. SPDX-License-Identifier: GPL-2.0
> >>> +.. include:: <isonum.txt>
> >>> +
> >>> +============================================
> >>> +Debugging and tracing in the media subsystem
> >>> +============================================
> >>> +
> >>> +This document serves as a starting point and lookup for debugging device
> >>> +drivers in the media subsystem.
> >>> +
> >>> +.. contents::
> >>> +    :depth: 3
> >>> +
> >>> +General debugging advice
> >>> +========================
> >>> +
> >>> +For general advice see the `general-debugging-guide <../../debugging/index.html>`__.
> >>> +
> >>> +Available tools
> >>> +===============
> >>> +
> >>> +dev_debug module parameter
> >>> +--------------------------
> >>> +
> >>> +For a general overview please see the `driver-development-debugging-guide <../../debugging/driver_development_debugging_guide.html>`__.
> >>> +
> >>> +Every video device provides a `dev_debug` parameter, which allows to get further insights into the IOCTLs in the background.
> >>> +::
> >>> +
> >>> +  # cat /sys/class/video4linux/video3/name
> >>> +  rkvdec
> >>> +  # echo 0xff > /sys/class/video4linux/video3/dev_debug
> >>> +  # dmesg -wH
> >>> +  [...] videodev: v4l2_open: video3: open (0)
> >>> +  [  +0.000036] video3: VIDIOC_QUERYCAP: driver=rkvdec, card=rkvdec, bus=platform:rkvdec, version=0x00060900, capabilities=0x84204000, device_caps=0x04204000
> >>> +
> >>> +`Full documentation <../../driver-api/media/v4l2-dev.html#video-device-debugging>`__
> >>> +
> >>> +dev_dbg / v4l2_dbg
> >>> +------------------
> >>> +
> >>> +- Difference between both?
> >>> +
> >>> +  - v4l2_dbg utilizes v4l2_printk under the hood, which further uses printk directly, thus it cannot be targeted by dynamic debug
> >>> +  - dev_dbg can be targeted by dynamic debug
> >>> +  - v4l2_dbg has a more specific prefix format for the media subsystem, while dev_dbg only highlights the driver name and the location of the log
> >>> +
> >>> +Dynamic debug
> >>> +-------------
> >>> +
> >>> +For general advice see the `userspace-debugging-guide <../../debugging/userspace_debugging_guide.html>`__.
> >>> +
> >>> +Here is one example, that enables all available `pr_debug()`'s within the file:
> >>> +::
> >>> +
> >>> +  $ alias ddcmd='echo $* > /proc/dynamic_debug/control'
> >>> +  $ ddcmd '-p; file v4l2-h264.c +p'
> >>> +  $ grep =p /proc/dynamic_debug/control
> >>> +   drivers/media/v4l2-core/v4l2-h264.c:372 [v4l2_h264]print_ref_list_b =p "ref_pic_list_b%u (cur_poc %u%c) %s"
> >>> +   drivers/media/v4l2-core/v4l2-h264.c:333 [v4l2_h264]print_ref_list_p =p "ref_pic_list_p (cur_poc %u%c) %s\n"
> >>> +
> >>> +Ftrace
> >>> +------
> >>> +
> >>> +For general advice see the `userspace-debugging-guide <../../debugging/userspace_debugging_guide.html>`__.
> >>> +
> >>> +Trace whenever the `rkvdec_try_ctrl` function is called
> >>> +::
> >>> +
> >>> +  $ cd /sys/kernel/tracing
> >>> +  $ echo function > /sys/kernel/tracing/current_tracer
> >>> +  $ echo rkvdec_try_ctrl > set_ftrace_filter
> >>> +  $ echo 1 > tracing_on
> >>> +  $ cat trace
> >>> +   h264parse0:sink-6359    [001] ...1. 172714.547523: rkvdec_try_ctrl <-try_or_set_cluster
> >>> +   h264parse0:sink-6359    [005] ...1. 172714.567386: rkvdec_try_ctrl <-try_or_set_cluster
> >>> +
> >>> +Find out from where the calls originate
> >>> +::
> >>> +
> >>> +  $ echo 1 > options/func_stack_trace
> >>> +   h264parse0:sink-6715    [002] ..... 172837.967762: rkvdec_try_ctrl <-try_or_set_cluster
> >>> +   h264parse0:sink-6715    [002] ..... 172837.967773: <stack trace>
> >>> +   => rkvdec_try_ctrl
> >>> +   => try_or_set_cluster
> >>> +   => try_set_ext_ctrls_common
> >>> +   => try_set_ext_ctrls
> >>> +   => v4l2_s_ext_ctrls
> >>> +   => v4l_s_ext_ctrls
> >>> +   ...
> >>> +   h264parse0:sink-6715    [004] ..... 172837.985747: rkvdec_try_ctrl <-try_or_set_cluster
> >>> +   h264parse0:sink-6715    [004] ..... 172837.985750: <stack trace>
> >>> +   => rkvdec_try_ctrl
> >>> +   => try_or_set_cluster
> >>> +   => v4l2_ctrl_request_setup
> >>> +   => rkvdec_run_preamble
> >>> +   => rkvdec_h264_run
> >>> +   => rkvdec_device_run
> >>> +   ...
> >>> +
> >>> +Trace the children of a function call and show the return values (requires config `FUNCTION_GRAPH_RETVAL`)
> >>> +::
> >>> +
> >>> +  echo function_graph > current_tracer
> >>> +  echo rkvdec_h264_run > set_graph_function
> >>> +  echo 4 > max_graph_depth
> >>> +  echo do_interrupt_handler mutex_* > set_graph_notrace
> >>> +  echo 1 > options/funcgraph-retval
> >>> +   ...
> >>> +   4)               |  rkvdec_h264_run [rockchip_vdec]() {
> >>> +   4)               |    v4l2_ctrl_find [videodev]() {
> >>> +   ...
> >>> +   4)               |    rkvdec_run_preamble [rockchip_vdec]() {
> >>> +   4)   4.666 us    |      v4l2_m2m_next_buf [v4l2_mem2mem](); /* = 0xffff000005782000 */
> >>> +   ...
> >>> +   4)               |      v4l2_ctrl_request_setup [videodev]() {
> >>> +   4)   4.667 us    |        media_request_object_find [mc](); /* = 0xffff000005e3aa98 */
> >>> +   4)   1.750 us    |        find_ref [videodev](); /* = 0xffff00000833b2a0 */
> >>> +   ...
> >>> +   4)   1.750 us    |      v4l2_m2m_buf_copy_metadata [v4l2_mem2mem](); /* = 0x0 */
> >>> +   4) ! 114.333 us  |    } /* rkvdec_run_preamble [rockchip_vdec] = 0x0 */
> >>> +   4)   2.334 us    |    v4l2_h264_init_reflist_builder [v4l2_h264](); /* = 0x3e */
> >>> +   ...
> >>> +   4)               |    v4l2_h264_build_b_ref_lists [v4l2_h264]() {
> >>> +   ...
> >>> +   4)               |    rkvdec_run_postamble [rockchip_vdec]() {
> >>> +   ...
> >>> +   4) ! 444.208 us  |  } /* rkvdec_h264_run [rockchip_vdec] = 0x0 */
> >>> +
> >>> +DebugFS
> >>> +-------
> >>> +
> >>> +For general advice see the `driver-development-debugging-guide <../../debugging/driver_development_debugging_guide.html>`__.
> >>> +
> >>> +Perf & alternatives
> >>> +-------------------
> >>> +
> >>> +For general advice see the `userspace-debugging-guide <../../debugging/userspace_debugging_guide.html>`__.
> >>> +
> >>> +Example for media devices:
> >>> +
> >>> +Gather statistics data for a decoding job: (This example is on a RK3399 SoC with the rkvdec codec driver using the `fluster test suite <https://github.com/fluendo/fluster>`__)
> >>> +::
> >>> +
> >>> +  perf stat -d python3 fluster.py run -d GStreamer-H.264-V4L2SL-Gst1.0 -ts JVT-AVC_V1 -tv AUD_MW_E -j1
> >>> +  ...
> >>> +  Performance counter stats for 'python3 fluster.py run -d GStreamer-H.264-V4L2SL-Gst1.0 -ts JVT-AVC_V1 -tv AUD_MW_E -j1 -v':
> >>> +
> >>> +           7794.23 msec task-clock:u                     #    0.697 CPUs utilized
> >>> +                 0      context-switches:u               #    0.000 /sec
> >>> +                 0      cpu-migrations:u                 #    0.000 /sec
> >>> +             11901      page-faults:u                    #    1.527 K/sec
> >>> +         882671556      cycles:u                         #    0.113 GHz                         (95.79%)
> >>> +         711708695      instructions:u                   #    0.81  insn per cycle              (95.79%)
> >>> +          10581935      branches:u                       #    1.358 M/sec                       (15.13%)
> >>> +           6871144      branch-misses:u                  #   64.93% of all branches             (95.79%)
> >>> +         281716547      L1-dcache-loads:u                #   36.144 M/sec                       (95.79%)
> >>> +           9019581      L1-dcache-load-misses:u          #    3.20% of all L1-dcache accesses   (95.79%)
> >>> +   <not supported>      LLC-loads:u
> >>> +   <not supported>      LLC-load-misses:u
> >>> +
> >>> +      11.180830431 seconds time elapsed
> >>> +
> >>> +       1.502318000 seconds user
> >>> +       6.377221000 seconds sys
> >>> +
> >>> +The availability of events and metrics depends on the system you are running.
> >>> +
> >>> +Error checking & panic analysis
> >>> +-------------------------------
> >>> +
> >>> +For general advice see the `driver-development-debugging-guide <../../debugging/driver_development_debugging_guide.html>`__.
> >>> +
> >>> +**Copyright** |copy| 2024 : Collabora
> >>
> >> I would add a few more:
> >>
> >> - Implementing vidioc_log_status in the driver: this can log the current status to the kernel log.
> >>   It's called by v4l2-ctl --log-status. Very useful for debugging problems with receiving video
> >>   (TV/S-Video/HDMI/etc) since the video signal is external (so unpredictable). Less useful with
> >>   camera sensor inputs since you have control over what the camera sensor does.
> >
> > To avoid unnecessary complexity in drivers, should we encourage
> > implementing log_status for receivers but discourage it for camera
> > sensors ? I haven't seen many people attempting to do so, but I have
> > pushed back against the debug read/write register ops in sensor drivers.
>
> I'm fine with that.
>
> Logging the current status is particularly useful if you have no control over
> what you receive, so anything can happen. But for camera sensors it is typically
> not needed.
>
> The register debug ops I haven't used in a very long time, and I wonder if it
> shouldn't be deprecated.

For most things I'll agree that you can use "i2ctransfer -f" to send
I2C commands independent of the driver, so implementing it has limited
gain.

However with adv7180 (and potentially others) the driver caches a page
register for accessing different pages of registers.
From userspace you can't easily know which page is currently being
used, so can't change it without potentially messing up the driver's
next access. That rather limits debug options through other routes, so
for that particular device I would be sad to see the ops go. I have a
patch that I need to send which adds support for the register debug
ops to adv7180.

  Dave

> Regards,
>
>         Hans
>
> >
> >> - Run v4l2-compliance to verify the driver. To see the detailed media topology (and check it) use:
> >>   v4l2-compliance -M /dev/mediaX --verbose
> >>   You can also run a full compliance check for all devices referenced in the media topology by
> >>   running v4l2-compliance -m /dev/mediaX
> >>
> >>> diff --git a/Documentation/media/guides/index.rst b/Documentation/media/guides/index.rst
> >>> new file mode 100644
> >>> index 000000000000..0008966c0862
> >>> --- /dev/null
> >>> +++ b/Documentation/media/guides/index.rst
> >>> @@ -0,0 +1,11 @@
> >>> +.. SPDX-License-Identifier: GPL-2.0
> >>> +
> >>> +============
> >>> +Media Guides
> >>> +============
> >>> +
> >>> +.. toctree::
> >>> +    :caption: Table of Contents
> >>> +    :maxdepth: 1
> >>> +
> >>> +    debugging_issues
> >>> diff --git a/Documentation/media/index.rst b/Documentation/media/index.rst
> >>> index d056a9e99dca..5461876fc401 100644
> >>> --- a/Documentation/media/index.rst
> >>> +++ b/Documentation/media/index.rst
> >>> @@ -7,6 +7,7 @@ Media Subsystem Documentation
> >>>  .. toctree::
> >>>     :maxdepth: 2
> >>>
> >>> +   guides/index
> >>>     ../userspace-api/media/index
> >>>     ../driver-api/media/index.rst
> >>>     ../admin-guide/media/index
> >
>
>

