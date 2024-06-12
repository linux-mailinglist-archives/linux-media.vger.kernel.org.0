Return-Path: <linux-media+bounces-13116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9EF905E33
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 00:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C13201C215A7
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 22:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D8C127E3F;
	Wed, 12 Jun 2024 22:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcPwsHXf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6518B4315D;
	Wed, 12 Jun 2024 22:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718229711; cv=none; b=qhFmYuDrvqXFhOSD5n063uetVNNqvFkIXvaCbTWIw1D2jW39idTrog7NP42Z+WrlCtvm3Hy0an7KGlBXBWt3UWvvJieh7vGEqyXvJ0JIqqnHIwOjOV9ZvVu+XV4PxYMfnTZ7ywWkZcvt78q2v3itJp+najQf3FX6rHsMhkvlf54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718229711; c=relaxed/simple;
	bh=Uih+X4X2ngsvHGmo3y1qNHpmM9uwrd521ue+S26TsZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmOBjBq0COHOBJtoSwf/SQKXIwhr05cltaGIlfGUNSMcXJ8uR2ZAJ3/PtLH6mbPY1SaFZ043mSlWrZUJBwma+9DO/BFonMDXDrrrvNJkAxbBvmZ58RuRs/wmhgY4dVxy3Gtc6oznPfm1OI8HkSafIr7uNyqxqrgqi8vPDIQ8WHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcPwsHXf; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57c68682d1aso195940a12.3;
        Wed, 12 Jun 2024 15:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718229708; x=1718834508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0t1xiHBOEtEaHKk2K15+YhtWVGfJsDQCqRsuRN68uRo=;
        b=NcPwsHXfdunTXNfCSOdUBrGaqldXTfVTxlVHL8CsrG0q5GFzACIxMCtUwYpZ3FiSqf
         P++zSKkjiM9ER5wmUFcdt7yzwqaE3VGQ3D7qIW56JpcvKec3lEpccVl7r0LTOK/2RryF
         yCEfR/ezwqqZmHWFvdAsETvHml93tWGqHmd3H1SIxYJrM76quHqCPEGmmW/1dETUGJgu
         mQgqcUE/v/lCA59qhraYBHPqC0WAfK8HSsh+L/LnHSbHROp4NjjLmhr4xM9zfibVkdVQ
         Ok6udj7Tm91j5xNlAR/SfdcFAWpfmVkAu6EHtfkr7VvyFsWgM7nL/+40K6Xc3caoaEa/
         1WAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718229708; x=1718834508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0t1xiHBOEtEaHKk2K15+YhtWVGfJsDQCqRsuRN68uRo=;
        b=vL80spk+WPzyBn5bqUSsv2zdB+nzEx3B4ND8Sf7qbjM3s0P4G20QZaM58qnda5LLr3
         2uNq9zSNxELiLmK4iYRGfsJGuGZXxnQB1wuDkKOX+dE2+OZUqd8UpiK8Z9Uddik99be1
         hEMTtoPw63v9lf8L6nUCrluzsuFfvqpLPIERxu5B7J0mxb7KTPDJab0lLdH9gTzW8zjt
         Aka5o2AU7f3FNPgXjA7N0l2OGUJphiGhgbJmn3LuplErwaQgEOrWOGkN+nWZsNr5KgeX
         RB3ZwhDM5715bwM/hbO1t/ykzFYYsqS/m5ZZOXniKR8RuTqzSICDcYwCckyPj61tHpvZ
         3YwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc8pCGWy7XXwQV3EVHcsSD8fqHdRVsOREe9jSPk+gReiZY7OjapqvIYM0hzLeq+I4KLCFmJzQaaMFzcpHfJfkFGiAo3SPvfjtQAM2aV7NZ4+k1Ucb+MQc22cZrwUyCW5S5HzyUMnC7JIRDX8mfuyOZDqp5Hut/jrmye1pbEYFH8ODQ4pl/
X-Gm-Message-State: AOJu0YxVpYe8PLzRNAqY98XUrEWu8/0mHZ2ui1so7SfWF5/xENA5mw8o
	1tLFaskHP2oYv5ejPIp63262mDigmNh1IIvT0gV/oV9zSqxzcA7r
X-Google-Smtp-Source: AGHT+IGXHUoQjW5UUOvB7a2fVV6YK1Tfy9Qw3eHdvf0ofWkmBRuLTT/YgANHaR+rS0PamfigwXFtiA==
X-Received: by 2002:a50:c19a:0:b0:57c:7594:4436 with SMTP id 4fb4d7f45d1cf-57ca9750ab2mr1839313a12.12.1718229707348;
        Wed, 12 Jun 2024 15:01:47 -0700 (PDT)
Received: from mehdi-archlinux ([2a02:8109:aa27:2d00::f836])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb743ade6sm40620a12.95.2024.06.12.15.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 15:01:46 -0700 (PDT)
Date: Thu, 13 Jun 2024 00:01:44 +0200
From: Mehdi Djait <mehdi.djait.k@gmail.com>
To: Val Packett <val@packett.cool>
Cc: mchehab@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, alexandre.belloni@bootlin.com,
	maxime.chevallier@bootlin.com, paul.kocialkowski@bootlin.com,
	michael.riesch@wolfvision.net, laurent.pinchart@ideasonboard.com,
	Mehdi Djait <mehdi.djait@bootlin.com>
Subject: Re: [RESEND Patch v13 2/3] media: rockchip: Add a driver for
 Rockchip's camera interface
Message-ID: <ZmoayNhtB8bXquQi@mehdi-archlinux>
References: <cover.1707677804.git.mehdi.djait.k@gmail.com>
 <715d89214d1ed6a8bb16cbb6268718a737485560.1707677804.git.mehdi.djait.k@gmail.com>
 <PACYES.KP3K6W0JOIAK1@packett.cool>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PACYES.KP3K6W0JOIAK1@packett.cool>

Hi Val :)

And sorry for the late response!

On Wed, Jun 12, 2024 at 02:23:13AM -0300, Val Packett wrote:
> Hi,
> 
> a couple more comments on this driver:
> 
> On Sun, Feb 11 2024 at 20:03:31 +01:00:00, Mehdi Djait
> <mehdi.djait.k@gmail.com> wrote:
> > +static int cif_stream_start(struct cif_stream *stream)
> > +{
> > +	u32 val, fmt_type, xfer_mode = 0;
> > +	struct cif_device *cif_dev = stream->cifdev;
> > +	struct cif_remote *remote_info = &cif_dev->remote;
> > +	int ret;
> > +	u32 input_mode;
> > +
> > +	stream->frame_idx = 0;
> > +	stream->frame_phase = 0;
> > +
> > +	fmt_type = stream->cif_fmt_in->fmt_type;
> > +	input_mode = (remote_info->std == V4L2_STD_NTSC) ?
> > +		      CIF_FORMAT_INPUT_MODE_NTSC :
> > +		      CIF_FORMAT_INPUT_MODE_PAL;
> 
> Mode logic needs to be expanded for cameras; I'm trying to get it working
> correctly,
> so far managed to get some cursed selfies with the wrong pixel format :) but
> either
> way I could send a patch when I have it working well.
> 

Do you mind sharing which sensor is connected on one end to the camera
and the other end to cif ?

I developed this driver using the tw9900 NTSC/PAL/SECAM Video Decoder 
and I know that more patches are needed to make this driver work 
with other sensors. Look at the series from Michael Riesch where he
adds support for other sensors on top of this series:
https://lore.kernel.org/linux-media/20240220-v6-8-topic-rk3568-vicap-v1-0-2680a1fa640b@wolfvision.net/

PLEASE NOTE: For the moment being I am not working on this driver as I
don't have access to the hardware.

I need a rockchip board that can boot upstream kernel AND that has
DVP (Digital Video Port) camera interface to continue working on CIF.
I have some candidates but I am still not entirely sure how to proceed
further.

ALSO NOTE: This driver still need some more work as you can see in the
last round of reviews: it should be converted to a media device centric
driver that correctly uses the Media Controller.

Look at the discussion here: https://lore.kernel.org/linux-media/ZeWqEkcoYN6gXWS9@valkosipuli.retiisi.eu/

> > +static int subdev_notifier_complete(struct v4l2_async_notifier
> > *notifier)
> > +{
> > +	struct cif_device *cif_dev;
> > +	struct v4l2_subdev *sd;
> > +	int ret;
> > +
> > +	cif_dev = container_of(notifier, struct cif_device, notifier);
> > +	sd = cif_dev->remote.sd;
> > +
> > +	mutex_lock(&cif_dev->media_dev.graph_mutex);
> > +
> 
> Potential deadlock with this lock:

I will look more into this when/if I contine working on this driver

Still I am happy that other people are taking a look at this series and
doing something with it!

--
Kind Regards
Mehdi Djait

> 
> [    3.438667] ======================================================
> [    3.438672] WARNING: possible circular locking dependency detected
> [    3.438677] 6.10.0-rc1-next-20240531 #151 Not tainted
> [    3.438684] ------------------------------------------------------
> [    3.438687] kworker/u8:1/25 is trying to acquire lock:
> [    3.438695] c152d41c (videodev_lock){+.+.}-{4:4}, at:
> __video_register_device+0xf4/0x15b0
> [    3.438737]
> [    3.438737] but task is already holding lock:
> [    3.438740] c31981fc (&mdev->graph_mutex){+.+.}-{4:4}, at:
> subdev_notifier_complete+0x20/0x80
> [    3.438765]
> [    3.438765] which lock already depends on the new lock.
> [    3.438765]
> [    3.438769]
> [    3.438769] the existing dependency chain (in reverse order) is:
> [    3.438772]
> [    3.438772] -> #1 (&mdev->graph_mutex){+.+.}-{4:4}:
> [    3.438786]        lock_acquire+0x110/0x374
> [    3.438809]        __mutex_lock+0xac/0xf2c
> [    3.438828]        mutex_lock_nested+0x1c/0x24
> [    3.438843]        media_device_register_entity+0x80/0x1e8
> [    3.438857]        __video_register_device+0xab0/0x15b0
> [    3.438869]        cif_register_stream_vdev+0x158/0x18c
> [    3.438880]        cif_plat_probe+0x20c/0x424
> [    3.438888]        platform_probe+0x5c/0xb0
> [    3.438905]        really_probe+0xc8/0x2cc
> [    3.438916]        __driver_probe_device+0x88/0x1a0
> [    3.438926]        driver_probe_device+0x30/0x108
> [    3.438936]        __driver_attach+0x94/0x184
> [    3.438946]        bus_for_each_dev+0x7c/0xcc
> [    3.438955]        bus_add_driver+0xcc/0x1ec
> [    3.438964]        driver_register+0x7c/0x114
> [    3.438975]        do_one_initcall+0x7c/0x2f8
> [    3.438989]        kernel_init_freeable+0x1b0/0x20c
> [    3.439010]        kernel_init+0x14/0x12c
> [    3.439024]        ret_from_fork+0x14/0x28
> [    3.439033]
> [    3.439033] -> #0 (videodev_lock){+.+.}-{4:4}:
> [    3.439048]        check_prev_add+0x134/0x17d8
> [    3.439065]        __lock_acquire+0x17e0/0x21fc
> [    3.439080]        lock_acquire+0x110/0x374
> [    3.439095]        __mutex_lock+0xac/0xf2c
> [    3.439109]        mutex_lock_nested+0x1c/0x24
> [    3.439123]        __video_register_device+0xf4/0x15b0
> [    3.439135]        __v4l2_device_register_subdev_nodes+0xd8/0x1a0
> [    3.439152]        subdev_notifier_complete+0x2c/0x80
> [    3.439160]        __v4l2_async_register_subdev+0xa8/0x1a0
> [    3.439176]        gc0308_probe+0x654/0x6f4
> [    3.439187]        i2c_device_probe+0x168/0x268
> [    3.439201]        really_probe+0xc8/0x2cc
> [    3.439211]        __driver_probe_device+0x88/0x1a0
> [    3.439221]        driver_probe_device+0x30/0x108
> [    3.439231]        __device_attach_driver+0x94/0x10c
> [    3.439241]        bus_for_each_drv+0x90/0xe4
> [    3.439250]        __device_attach+0xac/0x1b0
> [    3.439260]        bus_probe_device+0x8c/0x90
> [    3.439269]        deferred_probe_work_func+0x7c/0xac
> [    3.439279]        process_one_work+0x23c/0x6bc
> [    3.439295]        worker_thread+0x190/0x3d8
> [    3.439308]        kthread+0xf8/0x114
> [    3.439321]        ret_from_fork+0x14/0x28
> [    3.439330]
> [    3.439330] other info that might help us debug this:
> [    3.439330]
> [    3.439333]  Possible unsafe locking scenario:
> [    3.439333]
> [    3.439336]        CPU0                    CPU1
> [    3.439339]        ----                    ----
> [    3.439341]   lock(&mdev->graph_mutex);
> [    3.439349]                                lock(videodev_lock);
> [    3.439356]                                lock(&mdev->graph_mutex);
> [    3.439363]   lock(videodev_lock);
> [    3.439370]
> [    3.439370]  *** DEADLOCK ***
> [    3.439370]
> [    3.439373] 5 locks held by kworker/u8:1/25:
> [    3.439379]  #0: c28106b4 ((wq_completion)events_unbound){+.+.}-{0:0},
> at: process_one_work+0x1ac/0x6bc
> [    3.439408]  #1: f0889f20 (deferred_probe_work){+.+.}-{0:0}, at:
> process_one_work+0x1d4/0x6bc
> [    3.439436]  #2: c303ec9c (&dev->mutex){....}-{4:4}, at:
> __device_attach+0x30/0x1b0
> [    3.439461]  #3: c152d3d0 (list_lock){+.+.}-{4:4}, at:
> __v4l2_async_register_subdev+0x50/0x1a0
> [    3.439491]  #4: c31981fc (&mdev->graph_mutex){+.+.}-{4:4}, at:
> subdev_notifier_complete+0x20/0x80
> 
> > 
> 
> 

