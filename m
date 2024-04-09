Return-Path: <linux-media+bounces-8876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 340C889D4D4
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 10:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E24A82833CA
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 08:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B5975811;
	Tue,  9 Apr 2024 08:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="jSBcAXc7"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC913BBD8
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 08:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712652475; cv=pass; b=gdJzm3i7Uydwge+rFhyEOY4cf0iLE8wOxOIihYdX97OE22BVWm5LaKv1eW7RYT34H5arrpxU8LHn91QQxLq9jRY0Rd51BitcauOmFbS15dWqh7fYVew3fKKd5JXOYKITz/qrxlc4I6LVJb7ZXhHMVu2LQ+oyXpoKn924H3Cv/P8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712652475; c=relaxed/simple;
	bh=BEA2LBq3Dz4espXog72xsAfXPa4z2ibMnxnTaRTfBSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbfWdb1AHc+yxCoOw9mVxJ/qVOJcC/pcMiVb8cqCnbk4VvS+YbOJ867xYwoJqdoDo6gvlDFpK240TMFGm616F427ztiH8i8e3X1KHVO35NP02z+l7/uKK083VwA4zfBCwfz179GBPAxh2/YzEuJzRXnvOEog1lh848euU/6KFtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=jSBcAXc7; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VDKNN220Fz49Pyv;
	Tue,  9 Apr 2024 11:47:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1712652468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SZVfr99KoyKbib7b2DCBmkr19eO8ZlDXMkzPElInk20=;
	b=jSBcAXc78KYyEoBMbJ38oTcpsl3KGCxNhtGbGH1TLtvmhtkmCpgaLhCKjk6udlUY8s9xhZ
	SeErTfAKilVi3DXlfaWA37I6WTJI51/POsWClA6b64tsbvqGZyYmCXFF7aQvFrXRz2akvo
	iG1AwVl77Bd8rtDQMLYItJFVrYOYbDtw+4JX/nHAZHNU4VQ4UPbeLXsvqE6LVyLtlEVrWM
	Q3ptVSr53Hq+NgyrlDc+Pq8L0nPKaknrgvHscKJeXsGyHYljjt3TbD2/jgfSjVVjO2GkYk
	LaW6PyfRG+9SkwsIPVaEtgQYXtX+IlPVz6a0AXJCV7g0zM//ZbzjOGnTG6ZvXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1712652468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SZVfr99KoyKbib7b2DCBmkr19eO8ZlDXMkzPElInk20=;
	b=ZZrDnGNsvqpkcvxEZys4I19R1KhGXaNnoEkEm/K6NJvd02i9u3iX72QAqgi84fmYnsY+Nw
	hi21tJacOiYknzXkl04FCKtqrYkHWskMqQnSzrbCQJaYNWQUogIV7czPCgp7Qf1sZxgaBY
	1SZWts3ya+NeAIqgEzdSstumx5fCsP3n0y1vRa9pgdjUAsOUd4KlIfOe8lZRJxVZqt8Nqy
	jbEVXVNdGtLonJ7a4IaMQpYAZIq7wnp/8zBS5aDOnt6dYakZ13XUhD54Hcan4DMFqBW0Ki
	ozaY1Kpcg0es3EAYZGObC0ezJtRnkBDfPOi7RuBZ0rK1ijOyfNcYJyCqt/OqGQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1712652468; a=rsa-sha256;
	cv=none;
	b=nHmrQYQzp3ba+8A0+1Uw5CFrhpcc2MU+Ughg3X+QGkAA8qOFrkFMahphfV7tXCUHoCovNU
	wzfh/UG5DlBdXiMWrYot8FvVNL8soVBuTsd5gaqNCwKDAVdDdUUl8uOPyvq0kogXZ/r6wJ
	86x2PiIKtStXhlS7SXTsyHyGEcjtZ24FrKq4xCOnH5uLAQs+NjWVGVRurH93WM/EQT1TUO
	hgcVjcWF+BdVlt9m1uNnfL91lgOgAswQSQifuOmhzyFrBLjoBqnF9NcjktTczMp9OnGzjX
	h90hy2qFKY4yiaiFJFbyL0M5JMCZwUOQ4JAwEUWADxzQb0b5BoigKGeeMoQ0YQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id EB6F0634C93;
	Tue,  9 Apr 2024 11:47:47 +0300 (EEST)
Date: Tue, 9 Apr 2024 08:47:47 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: v4l2-core: hold videodev_lock until dev reg,
 finishes
Message-ID: <ZhUAs8jubWMWUOBH@valkosipuli.retiisi.eu>
References: <50f691d3-f49b-4279-9048-48319afd86f9@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50f691d3-f49b-4279-9048-48319afd86f9@xs4all.nl>

Hi Hans,

On Fri, Feb 23, 2024 at 09:45:36AM +0100, Hans Verkuil wrote:
> After the new V4L2 device node was registered, some additional
> initialization was done before the device node was marked as
> 'registered'. During the time between creating the device node
> and marking it as 'registered' it was possible to open the
> device node, which would return -ENODEV since the 'registered'
> flag was not yet set.
> 
> Hold the videodev_lock mutex from just before the device node
> is registered until the 'registered' flag is set. Since v4l2_open
> will take the same lock, it will wait until this registration
> process is finished. This resolves this race condition.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks for the patch.

This seems worth a Fixes: tag if not cc'ing to stable.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index d13954bd31fd..bae73b8c52ff 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -1036,8 +1036,10 @@ int __video_register_device(struct video_device *vdev,
>  	vdev->dev.devt = MKDEV(VIDEO_MAJOR, vdev->minor);
>  	vdev->dev.parent = vdev->dev_parent;
>  	dev_set_name(&vdev->dev, "%s%d", name_base, vdev->num);
> +	mutex_lock(&videodev_lock);
>  	ret = device_register(&vdev->dev);
>  	if (ret < 0) {
> +		mutex_unlock(&videodev_lock);
>  		pr_err("%s: device_register failed\n", __func__);
>  		goto cleanup;
>  	}
> @@ -1057,6 +1059,7 @@ int __video_register_device(struct video_device *vdev,
> 
>  	/* Part 6: Activate this minor. The char device can now be used. */
>  	set_bit(V4L2_FL_REGISTERED, &vdev->flags);
> +	mutex_unlock(&videodev_lock);
> 
>  	return 0;
> 

-- 
Kind regards,

Sakari Ailus

