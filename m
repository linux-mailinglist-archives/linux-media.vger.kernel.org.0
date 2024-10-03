Return-Path: <linux-media+bounces-19077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 709A798F9E6
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 00:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E17381F237BC
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 22:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763951C232D;
	Thu,  3 Oct 2024 22:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eUhFZW38"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188071C2459
	for <linux-media@vger.kernel.org>; Thu,  3 Oct 2024 22:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727994790; cv=none; b=SfRlSLt98a/Vin3KW4VyDed/+ysamZvGDjNyharQy94aMfIHnhTGtKmqGFXshq/+YPC17VJlxNjE65pCMK15DTAXaNkp96rVx1LBvs6LE9Xdqc1yR6zKLne/3VWhenHLOxO67V/qmI6/qzndIvUi90ngzy33i5rDgFhTReLwHvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727994790; c=relaxed/simple;
	bh=Q1sv2lwAy0lB6/yNGElyjIG/W4drVSl3KoQLKKZ2Nng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KX2r6e9NfZh+mvfE+a6GB+MvEUVMS/cq8F7M+0y4v7EvWnRIw0qyfEkCLGal/LWqQOQFwzQgqlXcPseHf1ttWvl6y8IXT6lNOWOW43DudNIMuuZVOF4OI8NMLvctv0CJEp1+PXDJXcFF8M9Vy+94fEjhHog2kh2QhfIbu/tExps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eUhFZW38; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-84ea1e5e964so1392555241.0
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2024 15:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727994788; x=1728599588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtzfA1MH/zA5mKi+nmbhzqTSK6zZLbLlx1RPp3/kisI=;
        b=eUhFZW38rISa1igCHAhE+NCm3w4mc0QbIrXjubPmx0LvxgzObVsi3K2deZkdjrKMQ8
         hPJMeW3adGHiVfdTyw4OL5pHKA91XsuUdaBUAVNUkhbMAw/uvUnNHQ97srR8yW6siYw/
         ntNDgGNjG79G2PgPmKu12JrTOK2eZpkvi8AJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727994788; x=1728599588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtzfA1MH/zA5mKi+nmbhzqTSK6zZLbLlx1RPp3/kisI=;
        b=Sujp6Li2fF5wF7FN7TpIFeGXOLI/5Pw9oX34wuk08pCBBZYkUdUAk6i6DH7MK2fD2K
         XxZ226JANZ0z7PQv3/5xRNz/WnT6zRxt4RiEa9x++ezSYLH+DIP1pMaNA/98w+el/2a8
         q1tFmUL6P0IDAqCIqRJtiBmrzYBnIzn0S6DGU+2lMTvSoxQSmL3YdTqLEksfLoJNewsb
         Xqrx0bHMswJGSLlRcTDK58rFAAv2yctCvBhEflx59XAARVZ+emQO7UoHWKhu6toOwv6r
         ULW2KvrzxcP/boyqVtfv+lU1WUSysh0VN35Ulv0myNUTwM2DWH/tYyS+a106mcDnqBhk
         q15w==
X-Forwarded-Encrypted: i=1; AJvYcCWnLZNC7ENHMsOCkFrWlSi+BCIphTdxWZlrHXBwrc1swe0T4856686D0Zn2axtqUW5GxAnN1TZttoFmdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiOUfFb9FxMf4eSUtqHqLm75gExiIgx95FkH5RrPFtBqykXJyl
	Gczd6nQoFl0feKhcR3pDcxLg/U+ioIJHMP7zvnEoudPuKVSRQkSWRd+C4pgBEZCi1+6wA9BK7cE
	qxusJuVG2YCbhh4UzGJ3FfjqLb2fpxovVyS0b
X-Google-Smtp-Source: AGHT+IEVqw9mp5VC9UDNmVCmJwPT6j4bx95Nh3sJ+vVlHviamVrXiAooVXiSVjvpVNReZ++Y4JmXVUWltHEI1kh7Kik=
X-Received: by 2002:a05:6102:6cb:b0:49b:e4eb:37d2 with SMTP id
 ada2fe7eead31-4a3f4ed7c7emr3742349137.11.1727994787888; Thu, 03 Oct 2024
 15:33:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529-b4-media_docs_improve-v2-0-66318b2da726@collabora.com> <20240529-b4-media_docs_improve-v2-3-66318b2da726@collabora.com>
In-Reply-To: <20240529-b4-media_docs_improve-v2-3-66318b2da726@collabora.com>
From: Steve Cho <stevecho@chromium.org>
Date: Thu, 3 Oct 2024 15:32:57 -0700
Message-ID: <CAC-pXoNcKErc5J=pUXC3BM9ZTfUodqOdXaM9t_U-esgHdrsiGA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/3] docs: media: Debugging guide for the media subsystem
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	hverkuil-cisco@xs4all.nl, mauro.chehab@linux.intel.com, kernel@collabora.com, 
	bob.beckett@collabora.com, nicolas.dufresne@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Sebastian. I found this overview to be helpful.
Information about different tools are scattered around, so sometimes
not easy to find.

On Tue, Sep 24, 2024 at 1:47=E2=80=AFAM Sebastian Fricke
<sebastian.fricke@collabora.com> wrote:
>
> Create a guides section for all documentation material, that isn't
> strictly related to a specific piece of code.
>
> Provide a guide for developers on how to debug code with a focus on the
> media subsystem. This document aims to provide a rough overview over the
> possibilities and a rational to help choosing the right tool for the
> given circumstances.
>
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> ---
>  Documentation/media/guides/debugging_issues.rst | 174 ++++++++++++++++++=
++++++
>  Documentation/media/guides/index.rst            |  11 ++
>  Documentation/media/index.rst                   |   1 +
>  3 files changed, 186 insertions(+)
>
> diff --git a/Documentation/media/guides/debugging_issues.rst b/Documentat=
ion/media/guides/debugging_issues.rst
> new file mode 100644
> index 000000000000..5f37801dd4ba
> --- /dev/null
> +++ b/Documentation/media/guides/debugging_issues.rst
> @@ -0,0 +1,174 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: <isonum.txt>
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Debugging and tracing in the media subsystem
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This document serves as a starting point and lookup for debugging device
> +drivers in the media subsystem.
Also can be used for debugging from user space as you mentioned in the
cover letter.

> +
> +.. contents::
> +    :depth: 3
> +
> +General debugging advice
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +For general advice see the `general-debugging-guide <../../debugging/ind=
ex.html>`__.
> +
> +Available tools
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +dev_debug module parameter
> +--------------------------
> +
> +For a general overview please see the `driver-development-debugging-guid=
e <../../debugging/driver_development_debugging_guide.html>`__.
> +
> +Every video device provides a `dev_debug` parameter, which allows to get=
 further insights into the IOCTLs in the background.
> +::
> +
> +  # cat /sys/class/video4linux/video3/name
> +  rkvdec
> +  # echo 0xff > /sys/class/video4linux/video3/dev_debug
> +  # dmesg -wH
> +  [...] videodev: v4l2_open: video3: open (0)
> +  [  +0.000036] video3: VIDIOC_QUERYCAP: driver=3Drkvdec, card=3Drkvdec,=
 bus=3Dplatform:rkvdec, version=3D0x00060900, capabilities=3D0x84204000, de=
vice_caps=3D0x04204000
mentioning limitations or known issues for tools would be helpful.
Yes, I saw you did it for some of tools.
e.g. I find dmesg to be helpful to scan through different ioctl calls
happening,
but it doesn't necessarily provide details about detailed setups for
each ioctl call.

> +
> +`Full documentation <../../driver-api/media/v4l2-dev.html#video-device-d=
ebugging>`__
> +
> +dev_dbg / v4l2_dbg
> +------------------
> +
> +- Difference between both?
> +
> +  - v4l2_dbg utilizes v4l2_printk under the hood, which further uses pri=
ntk directly, thus it cannot be targeted by dynamic debug
> +  - dev_dbg can be targeted by dynamic debug
> +  - v4l2_dbg has a more specific prefix format for the media subsystem, =
while dev_dbg only highlights the driver name and the location of the log
> +
> +Dynamic debug
> +-------------
> +
> +For general advice see the `userspace-debugging-guide <../../debugging/u=
serspace_debugging_guide.html>`__.
> +
> +Here is one example, that enables all available `pr_debug()`'s within th=
e file:
> +::
> +
> +  $ alias ddcmd=3D'echo $* > /proc/dynamic_debug/control'
> +  $ ddcmd '-p; file v4l2-h264.c +p'
> +  $ grep =3Dp /proc/dynamic_debug/control
> +   drivers/media/v4l2-core/v4l2-h264.c:372 [v4l2_h264]print_ref_list_b =
=3Dp "ref_pic_list_b%u (cur_poc %u%c) %s"
> +   drivers/media/v4l2-core/v4l2-h264.c:333 [v4l2_h264]print_ref_list_p =
=3Dp "ref_pic_list_p (cur_poc %u%c) %s\n"
As you know, dynamic debug was not consistently working for our team
for multiple reasons.
Mentioning few known issues or FAQ would be helpful.

> +
> +Ftrace
> +------
> +
> +For general advice see the `userspace-debugging-guide <../../debugging/u=
serspace_debugging_guide.html>`__.
general advice link is here, but shouldn't we at least provide 1
sentence summary for each tool?

Also, brief explanation about the below examples would be helpful too.
Sometimes people can get lost what you are trying to highlight here.

> +
> +Trace whenever the `rkvdec_try_ctrl` function is called
> +::
> +
> +  $ cd /sys/kernel/tracing
> +  $ echo function > /sys/kernel/tracing/current_tracer
> +  $ echo rkvdec_try_ctrl > set_ftrace_filter
> +  $ echo 1 > tracing_on
> +  $ cat trace
> +   h264parse0:sink-6359    [001] ...1. 172714.547523: rkvdec_try_ctrl <-=
try_or_set_cluster
> +   h264parse0:sink-6359    [005] ...1. 172714.567386: rkvdec_try_ctrl <-=
try_or_set_cluster
> +
> +Find out from where the calls originate
> +::
> +
> +  $ echo 1 > options/func_stack_trace
> +   h264parse0:sink-6715    [002] ..... 172837.967762: rkvdec_try_ctrl <-=
try_or_set_cluster
> +   h264parse0:sink-6715    [002] ..... 172837.967773: <stack trace>
> +   =3D> rkvdec_try_ctrl
> +   =3D> try_or_set_cluster
> +   =3D> try_set_ext_ctrls_common
> +   =3D> try_set_ext_ctrls
> +   =3D> v4l2_s_ext_ctrls
> +   =3D> v4l_s_ext_ctrls
> +   ...
> +   h264parse0:sink-6715    [004] ..... 172837.985747: rkvdec_try_ctrl <-=
try_or_set_cluster
> +   h264parse0:sink-6715    [004] ..... 172837.985750: <stack trace>
> +   =3D> rkvdec_try_ctrl
> +   =3D> try_or_set_cluster
> +   =3D> v4l2_ctrl_request_setup
> +   =3D> rkvdec_run_preamble
> +   =3D> rkvdec_h264_run
> +   =3D> rkvdec_device_run
> +   ...
> +
> +Trace the children of a function call and show the return values (requir=
es config `FUNCTION_GRAPH_RETVAL`)
> +::
> +
> +  echo function_graph > current_tracer
> +  echo rkvdec_h264_run > set_graph_function
> +  echo 4 > max_graph_depth
> +  echo do_interrupt_handler mutex_* > set_graph_notrace
> +  echo 1 > options/funcgraph-retval
> +   ...
> +   4)               |  rkvdec_h264_run [rockchip_vdec]() {
> +   4)               |    v4l2_ctrl_find [videodev]() {
> +   ...
> +   4)               |    rkvdec_run_preamble [rockchip_vdec]() {
> +   4)   4.666 us    |      v4l2_m2m_next_buf [v4l2_mem2mem](); /* =3D 0x=
ffff000005782000 */
> +   ...
> +   4)               |      v4l2_ctrl_request_setup [videodev]() {
> +   4)   4.667 us    |        media_request_object_find [mc](); /* =3D 0x=
ffff000005e3aa98 */
> +   4)   1.750 us    |        find_ref [videodev](); /* =3D 0xffff0000083=
3b2a0 */
> +   ...
> +   4)   1.750 us    |      v4l2_m2m_buf_copy_metadata [v4l2_mem2mem](); =
/* =3D 0x0 */
> +   4) ! 114.333 us  |    } /* rkvdec_run_preamble [rockchip_vdec] =3D 0x=
0 */
> +   4)   2.334 us    |    v4l2_h264_init_reflist_builder [v4l2_h264](); /=
* =3D 0x3e */
> +   ...
> +   4)               |    v4l2_h264_build_b_ref_lists [v4l2_h264]() {
> +   ...
> +   4)               |    rkvdec_run_postamble [rockchip_vdec]() {
> +   ...
> +   4) ! 444.208 us  |  } /* rkvdec_h264_run [rockchip_vdec] =3D 0x0 */
> +
> +DebugFS
> +-------
> +
> +For general advice see the `driver-development-debugging-guide <../../de=
bugging/driver_development_debugging_guide.html>`__.
> +
> +Perf & alternatives
> +-------------------
> +
> +For general advice see the `userspace-debugging-guide <../../debugging/u=
serspace_debugging_guide.html>`__.
> +
> +Example for media devices:
> +
> +Gather statistics data for a decoding job: (This example is on a RK3399 =
SoC with the rkvdec codec driver using the `fluster test suite <https://git=
hub.com/fluendo/fluster>`__)
> +::
> +
> +  perf stat -d python3 fluster.py run -d GStreamer-H.264-V4L2SL-Gst1.0 -=
ts JVT-AVC_V1 -tv AUD_MW_E -j1
Some people might have no idea what this cmd is trying to do. :)

> +  ...
> +  Performance counter stats for 'python3 fluster.py run -d GStreamer-H.2=
64-V4L2SL-Gst1.0 -ts JVT-AVC_V1 -tv AUD_MW_E -j1 -v':
> +
> +           7794.23 msec task-clock:u                     #    0.697 CPUs=
 utilized
> +                 0      context-switches:u               #    0.000 /sec
> +                 0      cpu-migrations:u                 #    0.000 /sec
> +             11901      page-faults:u                    #    1.527 K/se=
c
> +         882671556      cycles:u                         #    0.113 GHz =
                        (95.79%)
> +         711708695      instructions:u                   #    0.81  insn=
 per cycle              (95.79%)
> +          10581935      branches:u                       #    1.358 M/se=
c                       (15.13%)
> +           6871144      branch-misses:u                  #   64.93% of a=
ll branches             (95.79%)
> +         281716547      L1-dcache-loads:u                #   36.144 M/se=
c                       (95.79%)
> +           9019581      L1-dcache-load-misses:u          #    3.20% of a=
ll L1-dcache accesses   (95.79%)
> +   <not supported>      LLC-loads:u
> +   <not supported>      LLC-load-misses:u
> +
> +      11.180830431 seconds time elapsed
> +
> +       1.502318000 seconds user
> +       6.377221000 seconds sys
> +
> +The availability of events and metrics depends on the system you are run=
ning.
> +
> +Error checking & panic analysis
> +-------------------------------
> +
> +For general advice see the `driver-development-debugging-guide <../../de=
bugging/driver_development_debugging_guide.html>`__.
> +
> +**Copyright** |copy| 2024 : Collabora
> diff --git a/Documentation/media/guides/index.rst b/Documentation/media/g=
uides/index.rst
> new file mode 100644
> index 000000000000..0008966c0862
> --- /dev/null
> +++ b/Documentation/media/guides/index.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Media Guides
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. toctree::
> +    :caption: Table of Contents
> +    :maxdepth: 1
> +
> +    debugging_issues
> diff --git a/Documentation/media/index.rst b/Documentation/media/index.rs=
t
> index d056a9e99dca..5461876fc401 100644
> --- a/Documentation/media/index.rst
> +++ b/Documentation/media/index.rst
> @@ -7,6 +7,7 @@ Media Subsystem Documentation
>  .. toctree::
>     :maxdepth: 2
>
> +   guides/index
>     ../userspace-api/media/index
>     ../driver-api/media/index.rst
>     ../admin-guide/media/index
>
> --
> 2.25.1
>

