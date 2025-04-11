Return-Path: <linux-media+bounces-30040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC4EA863E3
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 919B43B5508
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 16:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E5B21D5AA;
	Fri, 11 Apr 2025 16:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XRMsQ41m"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6E821D3F3;
	Fri, 11 Apr 2025 16:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744390686; cv=none; b=Snn/O/YvIsFCqtSnaUujN4ZPTvrB/qErDDPcUs7M6veD589IQBpt+YRKsEk+pAOYgcTB4+K26WSb+Pl48CnekPedYftz5cfBsy3vsl34OUuljniHbRtAMevd3ixIW2CPGm+t5+yiB757smkUzo7qGd1Q+UOF2SwfkZBi5AIP4H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744390686; c=relaxed/simple;
	bh=E4jEm11fcnZjnMB1s317ynzxOXvTCfSndGWdQjbwZJc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b+LvxjofxSQ8V13g6RphPMfaqZaY7dhjBYViK939iLaSz5vZ3LfI7+9EYGi8T+Jp4RZKZJmVvNKX9kZvk6BwEr392Ey6GSMYt9Nnqxwd2h+bAgfz9VjDZbdZ4f16fBCJyFPOAt579uPNt1i5MoZfpptXYNiVJe2Mh9wNtjwRc2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XRMsQ41m; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744390682;
	bh=E4jEm11fcnZjnMB1s317ynzxOXvTCfSndGWdQjbwZJc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=XRMsQ41mECl42rBuG6RqiEwSnE2l0djnQANtU6R7AfjBR/Dynfo+RL8BougkFn95s
	 DNJgl9GQJF9wiQ7WxOmPIrWwsSz1Kuv67Li2gb0VORBR2ZUwG3iyGgdM1apjDzkAdP
	 /ySnWpEVcGJ60hrlh2OsJFS0ivfqOHvqj2AnpNlqheCrqWemK+qKYQzd1lQYL8W+XS
	 c93eeXkSaXbVCPvS1XPIHNeps9FTRvCrSRnrs5kBMCTAYnnzuIxjngEfyplQH29ULe
	 iSFEgHx8CjYNFv94b+BRj2uOJPk+oLlGKMrhlpUOEh5Np8Gfbl+Aszt28yOZ7KIKZW
	 vC28inHv9sR5w==
Received: from [IPv6:2606:6d00:11:e976::5ac] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8DB5E17E100A;
	Fri, 11 Apr 2025 18:58:00 +0200 (CEST)
Message-ID: <b11f2cd9706c409775a44db06dd8399193be3758.camel@collabora.com>
Subject: Re: [RESEND PATCH v1 0/7] Performance improvement of decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	bob.beckett@collabora.com, dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Fri, 11 Apr 2025 12:57:58 -0400
In-Reply-To: <20250410034002.88-1-jackson.lee@chipsnmedia.com>
References: <20250410034002.88-1-jackson.lee@chipsnmedia.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jackson,

Le jeudi 10 avril 2025 à 12:39 +0900, Jackson.lee a écrit :
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
> 
> v4l2-compliance results:
> ========================
> 
> v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
> 
> Buffer ioctls:
>                 warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS
> not supported
>                 warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS
> not supported
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test CREATE_BUFS maximum buffers: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
> 
> Total for wave5-dec device /dev/video0: 46, Succeeded: 46, Failed: 0,
> Warnings: 2
> Total for wave5-enc device /dev/video1: 46, Succeeded: 46, Failed: 0,
> Warnings: 0
> 
> Fluster test results:
> =====================
> 
> Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-
> Gst1.0
> Using 3 parallel job(s)
> Ran 133/147 tests successfully               in 41.629 secs

Same results here.

> 
> (1 test fails because of not supporting to parse multi frames, 1 test
> fails because of a missing frame and slight corruption,
>  2 tests fail because of sizes which are incompatible with the IP, 11
> tests fail because of unsupported 10 bit format)
> 
> 
> Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-
> Gst1.0
> Using 3 parallel job(s)
> Ran 78/135 tests successfully               in 44.578 secs
> 
> (57 fail because the hardware is unable to decode  MBAFF / FMO /
> Field / Extended profile streams.)

Same results here. There is also JVT-FR-EXT test suite now that you
should include. 23/69 here, without incident, but I did not analyze the
inner results, I'll leave that to you. Though, a quick looks shows that
YUV422 does not work anymore.

> 
> Seek test
> =====================
> 1. gst-play-1.0 seek.264
> 2. this will use waylandsink since gst-play-1.0 uses playbin.
>    if you don't want to hook up display,
>    you can run gst-play-1.0 seek.264 --videosink=fakevideosink
> instead
> 3. Let pipeline run for 2-3 seconds
> 4. press SPACE key to pause
> 5. press 0 to reset
> press SPACE to start again
> 
> gst-play-1.0 seek.264 --videosink=fakevideosink
> Press 'k' to see a list of keyboard shortcuts.
> Now playing /root/seek.264
> Redistribute latency...
> Redistribute latency...
> Redistribute latency...
> Redistribute latency...
> Redistribute latency...aused
> 0:00:09.9 / 0:00:09.7
> Reached end of play list.

So, I managed to resurrect my device. Once side effect of this series
is that the driver is no longer silent in normal cases. Pretty 'q'
while playing, or seeking seems to fill the kernel logs with these two
error.

[ 5037.457307] vdec 4210000.video-codec: wave5_vpu_dec_finish_decode:
could not get output info.
[ 5037.457436] vdec 4210000.video-codec:
wave5_vpu_firmware_command_queue_error_check: result not ready: 0x800

This needs fixing for the next version. The condition that makes these
non error needs to be tested so that we don't get spammed anymore. They
also occur while running fluster.

> 
> Sequence Change test
> =====================
> gst-launch-1.0 filesrc location=./switch_1080p_720p_240frames.h264 !
> h264parse ! v4l2h264dec ! filesink location=./h264_output_420.yuv
> Setting pipeline to PAUSED ...
> Pipeline is PREROLLING ...
> Redistribute latency...
> Redistribute latency...
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> Redistribute latency...
> New clock: GstSystemClock
> Got EOS from element "pipeline0".
> Execution ended after 0:00:05.772414400
> Setting pipeline to NULL ...
> Freeing pipeline ...

I did a test of my own here, and did get kernel splat. The warning
indicate that the state machine is no longer respected. This needs to
be address in v2, we added these check, since the locking is bound to
legal use of the state machine.

[  401.018648] Execution of a job in state STOP illegal.
[  401.023761] WARNING: CPU: 0 PID: 635 at
drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c:1715
wave5_vpu_dec_device_run+0x448/0x83c [wave5]
[  401.036890] Modules linked in: rfkill ip6table_filter ip6_tables
iptable_filter ip_tables x_tables rpmsg_ctrl rpmsg_char
phy_cadence_torrent rtc_tps6594 tps6594_esm tps6594_regulator
tps6594_pfsm pinctrl_tps6594 gpio_regmap ti_am335x_adc cdns3 kfifo_buf
cdns_usb_common qrtr mux_gpio omap_mailbox phy_j721e_wiz wave5
phy_can_transceiver ti_k3_r5_remoteproc v4l2_mem2mem
videobuf2_dma_contig videobuf2_memops tps6594_i2c videobuf2_v4l2
tps6594_core at24 k3_j72xx_bandgap sa2ul videodev m_can_platform
videobuf2_common authenc m_can ti_k3_dsp_remoteproc mc cdns3_ti
ti_am335x_tscadc can_dev rti_wdt fuse drm backlight dm_mod ipv6
[  401.091795] CPU: 0 UID: 1000 PID: 635 Comm: h264parse0:sink Tainted:
G        W           6.15.0-rc1-jacinto+ #1 PREEMPT 
[  401.102731] Tainted: [W]=WARN
[  401.105687] Hardware name: Texas Instruments J721S2 EVM (DT)
[  401.111330] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS
BTYPE=--)
[  401.118277] pc : wave5_vpu_dec_device_run+0x448/0x83c [wave5]
[  401.124015] lr : wave5_vpu_dec_device_run+0x448/0x83c [wave5]
[  401.129749] sp : ffff800084a0ba40
[  401.133051] x29: ffff800084a0baf0 x28: ffff00080a64c130 x27:
ffff800084a0bc08
[  401.140175] x26: 00000000c058560f x25: 0000000000000000 x24:
ffff00081331c000
[  401.147297] x23: ffff00081331c010 x22: ffff00080ed059a8 x21:
ffff00081331dbc0
[  401.154418] x20: ffff00081331d000 x19: 0000000000000000 x18:
0000000000000006
[  401.161540] x17: 0000000000000000 x16: 0000000000000000 x15:
072e076c07610767
[  401.168662] x14: ffff00080ee0b500 x13: 072e076c07610767 x12:
ffff800082107128
[  401.175783] x11: 0000000000000058 x10: 0000000000000018 x9 :
ffff00080ee0b500
[  401.182907] x8 : 00000000000004c7 x7 : ffff00080ee0b500 x6 :
ffff80008215f128
[  401.190028] x5 : 0000000000000000 x4 : 0000000000000000 x3 :
0000000000000001
[  401.197149] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
ffff00080ee0b480
[  401.204272] Call trace:
[  401.206709]  wave5_vpu_dec_device_run+0x448/0x83c [wave5] (P)
[  401.212448]  v4l2_m2m_try_run+0x84/0x134 [v4l2_mem2mem]
[  401.217667]  v4l2_m2m_qbuf+0x184/0x240 [v4l2_mem2mem]
[  401.222709]  v4l2_m2m_ioctl_qbuf+0x18/0x4e0 [v4l2_mem2mem]
[  401.228184]  v4l_qbuf+0x48/0x70 [videodev]
[  401.232292]  __video_do_ioctl+0x40c/0x4a0 [videodev]
[  401.237260]  video_usercopy+0x1e0/0x688 [videodev]
[  401.242054]  video_ioctl2+0x18/0x38 [videodev]
[  401.246500]  v4l2_ioctl+0x40/0x60 [videodev]
[  401.250774]  __arm64_sys_ioctl+0xb4/0xf4
[  401.254690]  invoke_syscall+0x48/0x104
[  401.258433]  el0_svc_common.constprop.0+0x40/0xe0
[  401.263125]  do_el0_svc+0x1c/0x28
[  401.266431]  el0_svc+0x30/0xcc
[  401.269480]  el0t_64_sync_handler+0x10c/0x138
[  401.273827]  el0t_64_sync+0x198/0x19c
[  401.277480] ---[ end trace 0000000000000000 ]---
[  401.316876] ------------[ cut here ]------------
[  401.321523] Execution of a job in state STOP illegal.
[  401.326992] WARNING: CPU: 0 PID: 635 at
drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c:1715
wave5_vpu_dec_device_run+0x448/0x83c [wave5]


To test:
gst-launch-1.0 videotestsrc num-buffers=3 ! video/x-raw,format=NV12,width=320,height=240 ! v4l2h264enc ! filesink location=340x240.h264
gst-launch-1.0 videotestsrc num-buffers=3 ! video/x-raw,format=NV12,width=640,height=480 ! v4l2h264enc ! filesink location=640x480.h264
cat 340x240.h264 640x480.h264 340x240.h264 640x480.h264  > drc.h264
gst-launch-1.0 filesrc location=drc.h264  ! parsebin ! v4l2h264dec ! fakevideosink -v


> 
> Change since v0:
> ===================
> * For [PATCH v1 2/7] media: chips-media: wave5: Improve performance
> of decoder
>  - separates the previous patch to a few patches
> 
> * For [PATCH v1 3/7] media: chips-media: wave5: Fix not to be closed
>  - separated from the previous patch of performance improvement of
>    decoder
> 
> * For [PATCH v1 4/7] media: chips-media: wave5: Use spinlock whenever
> state is changed
>  - separated from the previous patch of performance improvement of
>    decoder
> 
> * For [PATCH v1 5/7] media: chips-media: wave5: Fix not to free
> resources normally when
>     instance was destroyed
>  - separated from the previous patch of performance improvement of
>    decoder
> 
> * For [PATCH v1 7/7] media: chips-media: wave5: Fix SError of kernel
> panic when closed
>  - separated from the previous patch of performance improvement of
>    decoder
> 
> Jackson Lee (7):
>   media: chips-media: wave5: Fix Null reference while testing fluster
>   media: chips-media: wave5: Improve performance of decoder
>   media: chips-media: wave5: Fix not to be closed
>   media: chips-media: wave5: Use spinlock whenever state is changed
>   media: chips-media: wave5: Fix not to free resources normally when
>     instance was destroyed
>   media: chips-media: wave5: Reduce high CPU load
>   media: chips-media: wave5: Fix SError of kernel panic when closed
> 
>  .../platform/chips-media/wave5/wave5-helper.c |  10 +-
>  .../chips-media/wave5/wave5-vpu-dec.c         | 116 +++++++++++-----
> --
>  .../chips-media/wave5/wave5-vpu-enc.c         |   8 +-
>  .../platform/chips-media/wave5/wave5-vpu.c    |  70 +++++++++--
>  .../platform/chips-media/wave5/wave5-vpuapi.c |  36 +++---
>  .../platform/chips-media/wave5/wave5-vpuapi.h |  10 ++
>  .../chips-media/wave5/wave5-vpuconfig.h       |   1 +
>  7 files changed, 179 insertions(+), 72 deletions(-)

-- 
Nicolas Dufresne
Principal Engineer at Collabora

