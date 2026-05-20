Return-Path: <linux-media+bounces-62231-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Kk/Fo6ADWosyAUAu9opvQ
	(envelope-from <linux-media+bounces-62231-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 11:36:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C20F258ADE2
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 11:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 915D83050A6D
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 09:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2B83C871D;
	Wed, 20 May 2026 09:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vlei2OGN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166443C5DBE;
	Wed, 20 May 2026 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269674; cv=none; b=O4M09lV48xSweGJ+zOtVadO56oJeg/m2xkuLCgC+2UQVQwh1tgxE4uWH6JuFLkjdvg4cKz19RF+o2oXlAaDnJfOg+Wsm68YRhhmmJN9yhaFI0ODUPhr857+BncOeCZVYLs0gZ+mCACw4HZ9GXOtYCAzI0+wp3fuCTLDbSZfPDT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269674; c=relaxed/simple;
	bh=5HFx0kutWuskaztWSqMBgCSRGotKZd7xtrFqkSqr3DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7UX+h7MvITtAVrx8FWSq4lNIV7j1TXVCux7Wt5w9pTDJG4lYKppAOTbIHHg3S63MDKgCbvfk//WoK4hLavBaN9oorApHgcrpjAvgot9iHiThcQkFh/lqbQTKuwNKadmPROucthoOOAXbQ83vQ8ljOGTi10i13viI8C3ij6/R9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Vlei2OGN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59D9F512;
	Wed, 20 May 2026 11:34:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779269650;
	bh=5HFx0kutWuskaztWSqMBgCSRGotKZd7xtrFqkSqr3DI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vlei2OGN+yKxn/Qoe3U0zrBS3HMuSoO3Cj0AaMYKcovaecdZskkSkh0sf/+zXJpJJ
	 lcjvu1ViTMNgb8QkBYPybL31TbSpoZWXuIocbSj3DbA8Jx5aZIucAECvHWWGjD5vYm
	 0oV+by7YO1GC/sM6abpZdZmjZ+/cAIMmjm54bTfQ=
Date: Wed, 20 May 2026 11:34:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ma Ke <make24@iscas.ac.cn>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-dev: do not fire driver's release on
 __video_register_device() failure
Message-ID: <20260520093421.GA215344@killaraus.ideasonboard.com>
References: <20260520090624.1071139-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520090624.1071139-1-lgs201920130244@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62231-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C20F258ADE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 05:06:24PM +0800, Guangshuo Li wrote:
> video_register_device() / __video_register_device() registers vdev->dev
> with device_register(). Before the call the video core sets
> 
> 	vdev->dev.release = v4l2_device_release;
> 
> v4l2_device_release() invokes vdev->release(vdev) as its last step, and
> the driver's vdev->release hook is commonly video_device_release(), which
> kfree()s the vdev that the driver allocated with video_device_alloc().
> 
> When device_register() fails inside __video_register_device() the core
> does
> 
> 	put_device(&vdev->dev);
> 	return ret;
> 
> which drops the only reference and fires the v4l2_device_release()
> chain:
> 
>   __video_register_device()
>     device_register() -> -E*
>     put_device(&vdev->dev)
>       -> v4l2_device_release()
>          -> vdev->release(vdev)
>             -> video_device_release(vdev)   /* kfree(vdev), free #1 */
> 
> video_register_device() returns the error to the driver. Drivers that
> follow the documented ownership contract release vdev on their own error
> path, e.g.
> 
>   driver_probe()
>     if (video_register_device(vdev, ...))
>       goto err_release_vdev;
>     ...
>   err_release_vdev:
>     video_device_release(vdev);   /* free #2 -- DOUBLE FREE */
> 
> This is the contract documented in
> Documentation/driver-api/media/v4l2-dev.rst: the driver owns vdev and
> is responsible for releasing it if video_register_device() fails. As
> Hans Verkuil pointed out, the right place to fix this is the v4l2 core
> rather than every individual driver, because drivers are expected to
> follow the documented ownership contract.
> 
> Neutralise vdev->release around put_device() in the device_register()
> failure path so the device core cleanup does not run the driver's
> release hook. The driver-supplied release is restored before returning
> so the caller can release vdev according to the documented contract.
> Successful registration is unchanged, so the normal teardown sequence
> continues to call the driver's release hook and free vdev exactly once on
> unregister.
> 
> Fixes: 2a934fdb01db ("media: v4l2-dev: fix error handling in __video_register_device()")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 6ce623a1245a..73648549eb2a 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -1075,9 +1075,14 @@ int __video_register_device(struct video_device *vdev,
>  	mutex_lock(&videodev_lock);
>  	ret = device_register(&vdev->dev);
>  	if (ret < 0) {
> +		void (*release)(struct video_device *) = vdev->release;
> +
>  		mutex_unlock(&videodev_lock);
>  		pr_err("%s: device_register failed\n", __func__);
> +
> +		vdev->release = video_device_release_empty;
>  		put_device(&vdev->dev);
> +		vdev->release = release;

That looks like a big hack. There must be something wrong somewhere else
in the design.

>  		return ret;
>  	}
>  

-- 
Regards,

Laurent Pinchart

