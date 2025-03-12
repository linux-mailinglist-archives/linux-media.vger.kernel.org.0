Return-Path: <linux-media+bounces-28089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B133A5E0A7
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 16:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37B90189E11A
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 15:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B776C252907;
	Wed, 12 Mar 2025 15:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCfYJm8h"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EF92512E7
	for <linux-media@vger.kernel.org>; Wed, 12 Mar 2025 15:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741794006; cv=none; b=XCpiNXdRlmYfZ+AILGFTdzqNWGQ8Ca6vwuTeQh8VOWjS8WzdwFGoT7eqE7HcHuS2tdOMrSbZnC+r3GJfO3xzZwiJlknoAA4I94ZC1gT7NYaAg86expLubXF8BwATAtYAbFZ77ycevW6mhAXMdujbW/x+9irKZ09koT134RMZCU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741794006; c=relaxed/simple;
	bh=mJybPb52oWS3dn3FgtICS8YROy7NuLm7KipGo6hgBj8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E1z69ELapAWg4CJ4Rvctm6cSEmNNuKqYs9nJ+2/V2K+JYFp243AFHfnuaTb9VyTDLwAL9TnaiuIRZHP9MIZV+bEa6vCsKvC/ws/5210Y/BD27DNe29kTlqnsyUu4rDvy92hlQTCm2x+GjhYFDY14+k3cUkuIzECmzZE61UOn1VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCfYJm8h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD01C4CEEC;
	Wed, 12 Mar 2025 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741794005;
	bh=mJybPb52oWS3dn3FgtICS8YROy7NuLm7KipGo6hgBj8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GCfYJm8hyj6do93uGFIfleLXHKf0hnc8xnerH4wuPUfr9x4a8Q29L0x1ajXG+RNCb
	 rgGFYvRTsGMe/cdVZoMABREaz5kHUVMoBknTyrB4x66Yd4bo+QgP3lwvfYJ0Y+yHq7
	 hk7Q7uk3JrTnwLTueIi/ZHiZgAtF9f7dekdB8SZ3/1lutl36Xxx1oNU3AyiL+MBkbh
	 qzg4fneiPfVoBj2nxnqnyUoEYMEqdJB/Gm4Hz5Q9/20Ltwy4C/F7Fp9MiG4xwIGmGu
	 8wVJxijWWEERSXDdMtfQlCcjFWOa26lU4lpE4bmZkbgrOhPBHse7OIBGySPK85M0RJ
	 u2aAs0dqOPYmQ==
Date: Wed, 12 Mar 2025 16:39:59 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Arthur Marsh
 <arthur.marsh@internode.on.net>
Subject: Re: [PATCH for v6.14] media: rtl2832_sdr: assign vb2 lock before
 vb2_queue_init
Message-ID: <20250312163959.5c081bf8@sal.lan>
In-Reply-To: <51010d80-56a6-4803-82bb-6632ca7f1ae2@xs4all.nl>
References: <51010d80-56a6-4803-82bb-6632ca7f1ae2@xs4all.nl>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 24 Feb 2025 15:40:58 +0100
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> Commit c780d01cf1a6 ("media: vb2: vb2_core_queue_init(): sanity check lock and
> wait_prepare/finish") added a sanity check to ensure that if there are no
> wait_prepare/finish callbacks set by the driver, then the vb2_queue lock must
> be set, since otherwise the vb2 core cannot do correct locking.
> 
> The rtl2832_sdr.c triggered this warning: it turns out that while the driver
> does set this lock, it sets it too late. So move it up to before the
> vb2_queue_init() call.
> 
> Reported-by: Arthur Marsh <arthur.marsh@internode.on.net>
> Fixes: 8fcd2795d22a ("media: rtl2832_sdr: drop vb2_ops_wait_prepare/finish")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>

Patch looks good to me. As Arthur already tested, it sounds ready to go.

Feel free to pick it and merge if you want:

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Otherwise, I'll try to do it later this week.

> ---
> Arthur, it would be great if you can test this patch!
> 
> Regards,
> 
> 	Hans
> ---
> diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
> index 05254d8717db..0357624968f1 100644
> --- a/drivers/media/dvb-frontends/rtl2832_sdr.c
> +++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
> @@ -1363,6 +1363,7 @@ static int rtl2832_sdr_probe(struct platform_device *pdev)
>  	dev->vb_queue.ops = &rtl2832_sdr_vb2_ops;
>  	dev->vb_queue.mem_ops = &vb2_vmalloc_memops;
>  	dev->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	dev->vb_queue.lock = &dev->vb_queue_lock;
>  	ret = vb2_queue_init(&dev->vb_queue);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Could not initialize vb2 queue\n");
> @@ -1421,7 +1422,6 @@ static int rtl2832_sdr_probe(struct platform_device *pdev)
>  	/* Init video_device structure */
>  	dev->vdev = rtl2832_sdr_template;
>  	dev->vdev.queue = &dev->vb_queue;
> -	dev->vdev.queue->lock = &dev->vb_queue_lock;
>  	video_set_drvdata(&dev->vdev, dev);
> 
>  	/* Register the v4l2_device structure */
> 

