Return-Path: <linux-media+bounces-12989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BF3904ACB
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 07:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 353B0283B39
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 05:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA07374E9;
	Wed, 12 Jun 2024 05:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="SE8oQZwu"
X-Original-To: linux-media@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A59F36AF2
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 05:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718169821; cv=none; b=K5Co6kAGYv91WSkC0RJF7i2o4SCAmbXw0zXKjXiCtpEbUnT//a6V1JXyf6fpisVJeRkQBMNGVO9GjLJLl1qzlVm00sSCO7YlLIgwasPOi0BDP1auVzTWuYKeh1exIY4o/l5fOe2dYrs8AQksORZKYj2R0WyZzPD6DH/E9W8jstk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718169821; c=relaxed/simple;
	bh=26a9aogFFQ6QWc11kY+KtmVRlU7+xrXNx1HH+oHtcXs=;
	h=Date:From:Subject:To:Cc:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RY6fQl/bel8R2QzFqneywyrqGR3a3lCRQnQ8x5XLaI7vA2igJamJHQ/ADefLr4lEnp9B9dMd1oGOTS9gtuk+jT0UZGtzMxNZ+holNK7i2x0pVrumpwDomfsa7/ldEn9zRTBJ3bZdELC2rzPSe70vk8T531HHcCXxhATIFm/e22I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=SE8oQZwu; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Envelope-To: mehdi.djait.k@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1718169817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wbMyZcQy/EuPZsKGMdB3xw3iRWsXhVM6qxIencI5Uio=;
	b=SE8oQZwuF1or8Al4mBxdn/0hs5SnM7LHqHb7yl9lhhh/qYKpJUZos0HclWWvhTG14RAkSZ
	VPXy1gDXUZfjJpyKqayxAK+AvCTd8Mnwj5M7ex7crP1uW5PeM89hltSvay24efM6ZndDhQ
	JLxWQ43LUItgAaPkw/BUMOtFLXEvAZWWZYZW5zjRqp+L8Nunuzw245iy9KpNRWfpztGu4f
	Hv6wwAXeGDLB2NIi0S7JDAMsL9H/L65xef6VKKmGcgcswRc5Bya8pLJPJSwy622ixVgz9s
	t4XwvrxlWx7Zc1eQxslbZDz8wddKtSvbPJSTneehQEf+TGg7cF+h18b/1IC2Ew==
X-Envelope-To: mchehab@kernel.org
X-Envelope-To: heiko@sntech.de
X-Envelope-To: hverkuil-cisco@xs4all.nl
X-Envelope-To: krzysztof.kozlowski+dt@linaro.org
X-Envelope-To: robh+dt@kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: linux-media@vger.kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: thomas.petazzoni@bootlin.com
X-Envelope-To: alexandre.belloni@bootlin.com
X-Envelope-To: maxime.chevallier@bootlin.com
X-Envelope-To: paul.kocialkowski@bootlin.com
X-Envelope-To: michael.riesch@wolfvision.net
X-Envelope-To: laurent.pinchart@ideasonboard.com
X-Envelope-To: mehdi.djait@bootlin.com
Date: Wed, 12 Jun 2024 02:23:13 -0300
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
Subject: Re: [RESEND Patch v13 2/3] media: rockchip: Add a driver for
 Rockchip's camera interface
To: Mehdi Djait <mehdi.djait.k@gmail.com>
Cc: mchehab@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	alexandre.belloni@bootlin.com, maxime.chevallier@bootlin.com,
	paul.kocialkowski@bootlin.com, michael.riesch@wolfvision.net,
	laurent.pinchart@ideasonboard.com, Mehdi Djait <mehdi.djait@bootlin.com>
Message-Id: <PACYES.KP3K6W0JOIAK1@packett.cool>
In-Reply-To: <715d89214d1ed6a8bb16cbb6268718a737485560.1707677804.git.mehdi.djait.k@gmail.com>
References: <cover.1707677804.git.mehdi.djait.k@gmail.com>
	<715d89214d1ed6a8bb16cbb6268718a737485560.1707677804.git.mehdi.djait.k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Migadu-Flow: FLOW_OUT

Hi,

a couple more comments on this driver:

On Sun, Feb 11 2024 at 20:03:31 +01:00:00, Mehdi Djait 
<mehdi.djait.k@gmail.com> wrote:
> +static int cif_stream_start(struct cif_stream *stream)
> +{
> +	u32 val, fmt_type, xfer_mode = 0;
> +	struct cif_device *cif_dev = stream->cifdev;
> +	struct cif_remote *remote_info = &cif_dev->remote;
> +	int ret;
> +	u32 input_mode;
> +
> +	stream->frame_idx = 0;
> +	stream->frame_phase = 0;
> +
> +	fmt_type = stream->cif_fmt_in->fmt_type;
> +	input_mode = (remote_info->std == V4L2_STD_NTSC) ?
> +		      CIF_FORMAT_INPUT_MODE_NTSC :
> +		      CIF_FORMAT_INPUT_MODE_PAL;

Mode logic needs to be expanded for cameras; I'm trying to get it 
working correctly,
so far managed to get some cursed selfies with the wrong pixel format 
:) but either
way I could send a patch when I have it working well.

> +static int subdev_notifier_complete(struct v4l2_async_notifier 
> *notifier)
> +{
> +	struct cif_device *cif_dev;
> +	struct v4l2_subdev *sd;
> +	int ret;
> +
> +	cif_dev = container_of(notifier, struct cif_device, notifier);
> +	sd = cif_dev->remote.sd;
> +
> +	mutex_lock(&cif_dev->media_dev.graph_mutex);
> +

Potential deadlock with this lock:

[    3.438667] ======================================================
[    3.438672] WARNING: possible circular locking dependency detected
[    3.438677] 6.10.0-rc1-next-20240531 #151 Not tainted
[    3.438684] ------------------------------------------------------
[    3.438687] kworker/u8:1/25 is trying to acquire lock:
[    3.438695] c152d41c (videodev_lock){+.+.}-{4:4}, at: 
__video_register_device+0xf4/0x15b0
[    3.438737]
[    3.438737] but task is already holding lock:
[    3.438740] c31981fc (&mdev->graph_mutex){+.+.}-{4:4}, at: 
subdev_notifier_complete+0x20/0x80
[    3.438765]
[    3.438765] which lock already depends on the new lock.
[    3.438765]
[    3.438769]
[    3.438769] the existing dependency chain (in reverse order) is:
[    3.438772]
[    3.438772] -> #1 (&mdev->graph_mutex){+.+.}-{4:4}:
[    3.438786]        lock_acquire+0x110/0x374
[    3.438809]        __mutex_lock+0xac/0xf2c
[    3.438828]        mutex_lock_nested+0x1c/0x24
[    3.438843]        media_device_register_entity+0x80/0x1e8
[    3.438857]        __video_register_device+0xab0/0x15b0
[    3.438869]        cif_register_stream_vdev+0x158/0x18c
[    3.438880]        cif_plat_probe+0x20c/0x424
[    3.438888]        platform_probe+0x5c/0xb0
[    3.438905]        really_probe+0xc8/0x2cc
[    3.438916]        __driver_probe_device+0x88/0x1a0
[    3.438926]        driver_probe_device+0x30/0x108
[    3.438936]        __driver_attach+0x94/0x184
[    3.438946]        bus_for_each_dev+0x7c/0xcc
[    3.438955]        bus_add_driver+0xcc/0x1ec
[    3.438964]        driver_register+0x7c/0x114
[    3.438975]        do_one_initcall+0x7c/0x2f8
[    3.438989]        kernel_init_freeable+0x1b0/0x20c
[    3.439010]        kernel_init+0x14/0x12c
[    3.439024]        ret_from_fork+0x14/0x28
[    3.439033]
[    3.439033] -> #0 (videodev_lock){+.+.}-{4:4}:
[    3.439048]        check_prev_add+0x134/0x17d8
[    3.439065]        __lock_acquire+0x17e0/0x21fc
[    3.439080]        lock_acquire+0x110/0x374
[    3.439095]        __mutex_lock+0xac/0xf2c
[    3.439109]        mutex_lock_nested+0x1c/0x24
[    3.439123]        __video_register_device+0xf4/0x15b0
[    3.439135]        __v4l2_device_register_subdev_nodes+0xd8/0x1a0
[    3.439152]        subdev_notifier_complete+0x2c/0x80
[    3.439160]        __v4l2_async_register_subdev+0xa8/0x1a0
[    3.439176]        gc0308_probe+0x654/0x6f4
[    3.439187]        i2c_device_probe+0x168/0x268
[    3.439201]        really_probe+0xc8/0x2cc
[    3.439211]        __driver_probe_device+0x88/0x1a0
[    3.439221]        driver_probe_device+0x30/0x108
[    3.439231]        __device_attach_driver+0x94/0x10c
[    3.439241]        bus_for_each_drv+0x90/0xe4
[    3.439250]        __device_attach+0xac/0x1b0
[    3.439260]        bus_probe_device+0x8c/0x90
[    3.439269]        deferred_probe_work_func+0x7c/0xac
[    3.439279]        process_one_work+0x23c/0x6bc
[    3.439295]        worker_thread+0x190/0x3d8
[    3.439308]        kthread+0xf8/0x114
[    3.439321]        ret_from_fork+0x14/0x28
[    3.439330]
[    3.439330] other info that might help us debug this:
[    3.439330]
[    3.439333]  Possible unsafe locking scenario:
[    3.439333]
[    3.439336]        CPU0                    CPU1
[    3.439339]        ----                    ----
[    3.439341]   lock(&mdev->graph_mutex);
[    3.439349]                                lock(videodev_lock);
[    3.439356]                                lock(&mdev->graph_mutex);
[    3.439363]   lock(videodev_lock);
[    3.439370]
[    3.439370]  *** DEADLOCK ***
[    3.439370]
[    3.439373] 5 locks held by kworker/u8:1/25:
[    3.439379]  #0: c28106b4 
((wq_completion)events_unbound){+.+.}-{0:0}, at: 
process_one_work+0x1ac/0x6bc
[    3.439408]  #1: f0889f20 (deferred_probe_work){+.+.}-{0:0}, at: 
process_one_work+0x1d4/0x6bc
[    3.439436]  #2: c303ec9c (&dev->mutex){....}-{4:4}, at: 
__device_attach+0x30/0x1b0
[    3.439461]  #3: c152d3d0 (list_lock){+.+.}-{4:4}, at: 
__v4l2_async_register_subdev+0x50/0x1a0
[    3.439491]  #4: c31981fc (&mdev->graph_mutex){+.+.}-{4:4}, at: 
subdev_notifier_complete+0x20/0x80

> 



