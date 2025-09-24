Return-Path: <linux-media+bounces-43029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2ABB992A8
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 11:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23A344A0E99
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 09:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F63D2D73B3;
	Wed, 24 Sep 2025 09:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l/ZWjiSx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2393E23C516;
	Wed, 24 Sep 2025 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758706445; cv=none; b=D14B2CMMuIeJidXFBHBHq+og+/vTbdc9K38T3vgHv00E2qzpWlV18oFK/E3l+ZfTJknzPImxo0LucJYUBZ4Uj4/oEvtEdEZcl/dVrjOYLDqMUMvHzpjxmgQ6yKtCq8KN59m2c0h2k7XKTl/+3TJtrlSH9teCNaRY6R3oAq6MeYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758706445; c=relaxed/simple;
	bh=DG1GGK4/bRPMtO811mt5QTe3fue860uM71QZUOrcN84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EVqmFeMOyee1GGRJ6UONMkYy0JPt1rFUYESq1VJJ17VqGs+eZ63hd45Jj00xo7ZWsTZVd66oVu3OvA09IuFher66ajmsboM85lFi66OTuR5dGfFtoU95XuFTRusK7nkABd4DG7r+lU/HW3Tg7oqYX0d5U5HGWHMg1cNRvee0Jec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l/ZWjiSx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DABC4C7B;
	Wed, 24 Sep 2025 11:32:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758706354;
	bh=DG1GGK4/bRPMtO811mt5QTe3fue860uM71QZUOrcN84=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l/ZWjiSxIhHoqMV1/x/ADwUSAVOM2YdeWuHFLPgdi7SSVrDJVpJrYJQzOEbFqy1Zg
	 eN4c+5FYCFn6hSlKD8ryE1vzYMRG+lTf+fnYBNLuK73yHp9xXl8bcqP7X2yJNzWGF9
	 d0SD13T4AMODYxzroVHKdfSnMKmvZjt42OFtPVCo=
Message-ID: <05bdc515-004e-4a45-bc5c-523be1c0fe3e@ideasonboard.com>
Date: Wed, 24 Sep 2025 12:33:53 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/16] media: cadence,ti: CSI2RX Multistream Support
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev,
 laurent.pinchart@ideasonboard.com, mripard@kernel.org
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com,
 vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com,
 changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
 sjoerd@collabora.com, hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250911102832.1583440-1-r-donadkar@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250911102832.1583440-1-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/09/2025 13:28, Rishikesh Donadkar wrote:
> This series adds multi-stream support and PM support for Cadence CSI2RX
> and TI CSI2RX SHIM drivers.
> 
> PM patches are picked from:
> https://lore.kernel.org/all/20250902-ti_csi_pm-v2-0-59a3be199940@ideasonboard.com/
> 
> PATCH 01 :    Remove word size alignment restriction on frame width
> PATCH 02-07:  Support multiple DMA contexts/video nodes in TI CSI2RX
> PATCH 08-09:  Use get_frame_desc to propagate virtual channel
>               information across Cadence and TI CSI-RX subdevs
> PATCH 10-11:  Use new multi-stream APIs across the drivers to support
>               multiplexed cameras from sources like UB960 (FPDLink)
> PATCH 12:     Optimize stream on by submitting all queued buffers to DMA
> PATCH 13:     Change the drain architecture to support multi-stream and
>               implement completion barriers for last drain.
> PATCH 14-16:  Runtime PM and System PM support for CSI-RX.
> 
> Testing for this series has been done on top of media tree with 4x IMX219
> camera modules connected to TI's AM62A using V3 Link fusion mini board.
> 
> Overlay and defconfig changes for the same can be found below:
> https://github.com/RISHI27-dot/linux/commits/u/multistream_v7/

I made a quick test with this branch, am62a-sk with fpdlink, but:

[  214.387480] ======================================================
[  214.393648] WARNING: possible circular locking dependency detected
[  214.399817] 6.17.0-rc1+ #1 Not tainted
[  214.403557] ------------------------------------------------------
[  214.409723] python3/408 is trying to acquire lock:
[  214.414506] ffff0008079e00f8 (&csi->mutex){+.+.}-{4:4}, at:
ti_csi2rx_sd_enable_streams+0x80/0xc0 [j721e_csi2rx]
[  214.424701]
[  214.424701] but task is already holding lock:
[  214.430520] ffff000803de5568
(j721e_csi2rx:1471:sd->active_state->lock){+.+.}-{4:4}, at:
v4l2_subdev_enable_streams+0xc0/0x
3a0 [videodev]
[  214.442977]
[  214.442977] which lock already depends on the new lock.
[  214.442977]
[  214.451135]
[  214.451135] the existing dependency chain (in reverse order) is:
[  214.458601]
[  214.458601] -> #1 (j721e_csi2rx:1471:sd->active_state->lock){+.+.}-{4:4}:
[  214.466864]        __mutex_lock+0xc8/0x8a8
[  214.470959]        mutex_lock_nested+0x2c/0x40
[  214.475395]        ti_csi2rx_get_route+0x50/0xe8 [j721e_csi2rx]
[  214.481312]        ti_csi2rx_get_vc.isra.0+0xe4/0x1b8 [j721e_csi2rx]
[  214.487661]        ti_csi2rx_start_streaming+0xe8/0x250 [j721e_csi2rx]
[  214.494182]        vb2_start_streaming+0x74/0x190 [videobuf2_common]
[  214.500552]        vb2_core_streamon+0x108/0x1d8 [videobuf2_common]
[  214.506829]        vb2_ioctl_streamon+0x54/0xa0 [videobuf2_v4l2]
[  214.512842]        v4l_streamon+0x2c/0x40 [videodev]
[  214.517890]        __video_do_ioctl+0x2e0/0x3d8 [videodev]
[  214.523447]        video_usercopy+0x310/0x870 [videodev]
[  214.528831]        video_ioctl2+0x20/0x38 [videodev]
[  214.533869]        v4l2_ioctl+0x48/0x70 [videodev]
[  214.538730]        __arm64_sys_ioctl+0xb4/0x118
[  214.543259]        invoke_syscall+0x50/0x120
[  214.547524]        el0_svc_common.constprop.0+0x48/0xf0
[  214.552740]        do_el0_svc+0x24/0x38
[  214.556570]        el0_svc+0x4c/0x178
[  214.560229]        el0t_64_sync_handler+0xa0/0xe8
[  214.564926]        el0t_64_sync+0x1a4/0x1a8
[  214.569104]
[  214.569104] -> #0 (&csi->mutex){+.+.}-{4:4}:
[  214.574855]        __lock_acquire+0x136c/0x1f78
[  214.579381]        lock_acquire+0x250/0x350
[  214.583557]        __mutex_lock+0xc8/0x8a8
[  214.587647]        mutex_lock_nested+0x2c/0x40
[  214.592082]        ti_csi2rx_sd_enable_streams+0x80/0xc0 [j721e_csi2rx]
[  214.598694]        v4l2_subdev_enable_streams+0x208/0x3a0 [videodev]
[  214.605128]        ti_csi2rx_start_streaming+0x158/0x250 [j721e_csi2rx]
[  214.611738]        vb2_start_streaming+0x74/0x190 [videobuf2_common]
[  214.618107]        vb2_core_streamon+0x108/0x1d8 [videobuf2_common]
[  214.624383]        vb2_ioctl_streamon+0x54/0xa0 [videobuf2_v4l2]
[  214.630395]        v4l_streamon+0x2c/0x40 [videodev]
[  214.635436]        __video_do_ioctl+0x2e0/0x3d8 [videodev]
[  214.640994]        video_usercopy+0x310/0x870 [videodev]
[  214.646379]        video_ioctl2+0x20/0x38 [videodev]
[  214.651415]        v4l2_ioctl+0x48/0x70 [videodev]
[  214.656280]        __arm64_sys_ioctl+0xb4/0x118
[  214.660807]        invoke_syscall+0x50/0x120
[  214.665071]        el0_svc_common.constprop.0+0x48/0xf0
[  214.670288]        do_el0_svc+0x24/0x38
[  214.674117]        el0_svc+0x4c/0x178
[  214.677775]        el0t_64_sync_handler+0xa0/0xe8
[  214.682472]        el0t_64_sync+0x1a4/0x1a8
[  214.686649]
[  214.686649] other info that might help us debug this:
[  214.686649]
[  214.694637]  Possible unsafe locking scenario:
[  214.694637]
[  214.700543]        CPU0                    CPU1
[  214.705061]        ----                    ----
[  214.709579]   lock(j721e_csi2rx:1471:sd->active_state->lock);
[  214.715320]                                lock(&csi->mutex);
[  214.721060]
lock(j721e_csi2rx:1471:sd->active_state->lock);
[  214.729314]   lock(&csi->mutex);
[  214.732540]
[  214.732540]  *** DEADLOCK ***
[  214.732540]
[  214.738447] 2 locks held by python3/408:
[  214.742361]  #0: ffff0008079e18f0 (&ctx->mutex){+.+.}-{4:4}, at:
__video_do_ioctl+0xe8/0x3d8 [videodev]
[  214.751844]  #1: ffff000803de5568
(j721e_csi2rx:1471:sd->active_state->lock){+.+.}-{4:4}, at:
v4l2_subdev_enable_streams+0x
c0/0x3a0 [videodev]
[  214.764705]
[  214.764705] stack backtrace:
[  214.769054] CPU: 2 UID: 0 PID: 408 Comm: python3 Not tainted
6.17.0-rc1+ #1 PREEMPT
[  214.769064] Hardware name: Texas Instruments AM62A7 SK (DT)
[  214.769068] Call trace:
[  214.769073]  show_stack+0x20/0x38 (C)
[  214.769084]  dump_stack_lvl+0x8c/0xd0
[  214.769094]  dump_stack+0x18/0x28
[  214.769102]  print_circular_bug+0x28c/0x370
[  214.769110]  check_noncircular+0x170/0x188
[  214.769117]  __lock_acquire+0x136c/0x1f78
[  214.769125]  lock_acquire+0x250/0x350
[  214.769133]  __mutex_lock+0xc8/0x8a8
[  214.769141]  mutex_lock_nested+0x2c/0x40
[  214.769148]  ti_csi2rx_sd_enable_streams+0x80/0xc0 [j721e_csi2rx]
[  214.769164]  v4l2_subdev_enable_streams+0x208/0x3a0 [videodev]
[  214.769255]  ti_csi2rx_start_streaming+0x158/0x250 [j721e_csi2rx]
[  214.769268]  vb2_start_streaming+0x74/0x190 [videobuf2_common]
[  214.769298]  vb2_core_streamon+0x108/0x1d8 [videobuf2_common]
[  214.769326]  vb2_ioctl_streamon+0x54/0xa0 [videobuf2_v4l2]
[  214.769348]  v4l_streamon+0x2c/0x40 [videodev]
[  214.769438]  __video_do_ioctl+0x2e0/0x3d8 [videodev]
[  214.769528]  video_usercopy+0x310/0x870 [videodev]
[  214.769617]  video_ioctl2+0x20/0x38 [videodev]
[  214.769704]  v4l2_ioctl+0x48/0x70 [videodev]
[  214.769793]  __arm64_sys_ioctl+0xb4/0x118
[  214.769804]  invoke_syscall+0x50/0x120
[  214.769812]  el0_svc_common.constprop.0+0x48/0xf0
[  214.769819]  do_el0_svc+0x24/0x38
[  214.769826]  el0_svc+0x4c/0x178
[  214.769835]  el0t_64_sync_handler+0xa0/0xe8
[  214.769844]  el0t_64_sync+0x1a4/0x1a8

 Tomi


