Return-Path: <linux-media+bounces-29920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4146A84375
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 14:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3617C1B8421F
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 12:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D63828541C;
	Thu, 10 Apr 2025 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dxNqze0v"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9EF2853E5;
	Thu, 10 Apr 2025 12:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288767; cv=none; b=cxbD0A6j3xULqVbRAytajtnpwrks7a9d6UI8YgHFkrCo9pOIvQRQlvx7BW6aIpZcKxSii7Y/BXyiCqincM02GVvq2JKI4lYZr8Auun+JLq9E20C6N19/fgda3Jy8GZsyjUSwN9LQuG1gE/BEu0mNlknVmzDexsAcd5Q6L9H1V/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288767; c=relaxed/simple;
	bh=/eNrs1XYBAEtkRLVC7n9Um+XZ0niyf8go02McgTE+cs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dO0WoVC1DwSK8CudRvE9WsPrJaqQZKa5aHwstUIVeHyD7IBYeQjRonj2jsef8WhwzHMKBmRziQ940ayGHGAWEn8etBDN7N8sxKkZ2O/wnxcsQtUxlIv7mQXapiHWcFs3FreSuEm/JvqSqI0kgmblA0zNleM1KDldbp2/UaXdRtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dxNqze0v; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744288763;
	bh=/eNrs1XYBAEtkRLVC7n9Um+XZ0niyf8go02McgTE+cs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=dxNqze0vhbx4/g/IgvWvfCjjZKpGBxlJ3Me6+CtgtZbVSUtxLLYODrZ+i16CXu2uW
	 lMRVpwKGBC2xn+BFhiKRBkFz29leFB6+mlCUGmry9F76rNJ0p3fPqhIL9r5jNRf2XY
	 kaqnDZJC+4iH+Wqw2izF3gj89ZDVd3N7ipPu+LdJ2egyFUvmGOAzbX+trniyGcx7TK
	 EURJPj1bq0XBkeerJ0QMlabOwe5vXcSiv6Cb8URI7rFjjwugIB0/sT5St9LXUREBCx
	 UN+wP6bK8I+mdtPKE1/WwrRVeZDA6tdR45oGsomlKVQMMi1fnQOBdPmIGDxFk4tH0L
	 ifSd9r5arOwmw==
Received: from [IPv6:2606:6d00:11:e976::5ac] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1118717E017D;
	Thu, 10 Apr 2025 14:39:21 +0200 (CEST)
Message-ID: <cb2266a3ff0cf9d57bdfdf3e88dc82c211d18e83.camel@collabora.com>
Subject: Re: [RESEND PATCH v1 0/7] Performance improvement of decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	bob.beckett@collabora.com, dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Thu, 10 Apr 2025 08:39:20 -0400
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

Hi,

Le jeudi 10 avril 2025 à 12:39 +0900, Jackson.lee a écrit :
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
> 
> v4l2-compliance results:
> ========================

What there reason for a resend within 3h ?

Nicolas

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

