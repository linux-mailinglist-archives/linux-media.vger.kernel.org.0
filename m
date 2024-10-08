Return-Path: <linux-media+bounces-19245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3304F9947ED
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 14:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE0C2B24D12
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 12:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B661DE3A2;
	Tue,  8 Oct 2024 12:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="RYURahtC";
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="Ib9new5v"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C041DDA36;
	Tue,  8 Oct 2024 12:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728388863; cv=fail; b=aR2S5eR3tY4UjEG0bD1GHoF4ALRV00Y5VFRF+PZjbriwZa8MZm7FvgUozu/2+IYvDyq3j1dH8bu7gD0oEAAOs8hQGoWOY/epgqjrFhaTAQR1rvpt+R5/0J+34zpHs7INxGNxLsRhQZLvbcEpDnn7SKzvqq1Fxd4Rv6ndsoqdm0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728388863; c=relaxed/simple;
	bh=b1P3DJk/6hfkSCnVQuxHt+Ux8LUCWKKpIGVzlcmNA0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vd+551GbIcuuamXnuu0sI93a2LaCYUqxUbYu5N1sJI4sFhBR+VLCigLI0tsb9nFjTKVQ9jUvyxYB94xu0xn19f0qgDdEhKvZcP951Qwy7ccfRlL0+QewnlSRKFSB0xzgmzDsIusSgH1tWbAMxt/wRY3c2mfkCi+YtEscbQ3+KK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=RYURahtC; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=Ib9new5v; arc=fail smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4XNDsL1G9Mz49Pwl;
	Tue,  8 Oct 2024 14:52:22 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1728388342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U/1XjZ8pkIPE3lI97nZZnbcpCWTZVXjxc7zkc/9HM1M=;
	b=RYURahtCmVnySZmKapolw8ViCcq5lJ2BkQEMp1UpemEG/ODBqu8kgoHn9QFLVBC9UTKl6L
	W0d0KeqPHxGOWnTv0W0g/6QdT/7sgc4gNT+u5HH9ZmaH/y+eb7CF59Ign9nP4sca3u2a5Z
	HVwY+vIDWDCpKsnaK/UqbmTGtLXMk+UYpYwJywUQZ9q6OHUdizAQ3oQTN5BqOiIOMPChf5
	l799kqxzipMalW4w3cvCzxfGtdBeHTMHFnRASfuBMcSv+8dTon54JEiNCHddCruTWWH8ad
	ron9fiylHeNGvBg+l99iWGSVC+kJsCBAHMvEDuWsaxS0mPPWRs3SWMGarJa2AA==
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4XNDs97169zyRx;
	Tue,  8 Oct 2024 14:52:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1728388334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U/1XjZ8pkIPE3lI97nZZnbcpCWTZVXjxc7zkc/9HM1M=;
	b=Ib9new5vglA0JYX/xJisWGgvH6vzKC0ctR1J7NBeUt2OrolKwqRTtzd4iHb2NuN7AOBqjJ
	/9upfe9aJwRJE17j8av5ehstbNt+0DF0t5IcZuiasmhWuL1kUhSV0hP4yHdk2mKMuGPlQ3
	0APdLgpVdHKI5YTMaJ4RnI7Jp2OsPso=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1728388334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U/1XjZ8pkIPE3lI97nZZnbcpCWTZVXjxc7zkc/9HM1M=;
	b=xdSSDQROEFpeWY85dTW3FKy8Uks27Ql3uWRoSRDKrB1G/UY3BHZR665BCc1j9QoQyqTei8
	m5J2CFLStaw26wK7R2B6vyV4JB//q1NNhm60NEi+8WeWc4YvJRJrgLAXUZddXYQryfIq11
	T9XP87nVEsq1xNEiNWEtnnUPoBTJF6g=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1728388334; a=rsa-sha256; cv=none;
	b=xu6Ltj/i7Bvwjg+t1+v6vrZODN6IHByVP50vkI+HUGAjff99SMjtp6rlQrQVj1PtIEJJm2
	CahD/42SYXNKKRJRh+CrfTeANoW4sgkerkxLub/cKIwvsf1N4iQK+WFeVsAzsbLcBLtd06
	FqnN2Mk0Jpl4ABKPRCDwqsy9dlMqf7A=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 7D29E634CBD;
	Tue,  8 Oct 2024 14:52:11 +0300 (EEST)
Date: Tue, 8 Oct 2024 11:52:11 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] media: uvcvideo: Support partial control reads
Message-ID: <ZwUc6-hbqDgBiqRl@valkosipuli.retiisi.eu>
References: <20241008-uvc-readless-v1-0-042ac4581f44@chromium.org>
 <20241008-uvc-readless-v1-1-042ac4581f44@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008-uvc-readless-v1-1-042ac4581f44@chromium.org>

Hi Ricardo,

On Tue, Oct 08, 2024 at 07:06:14AM +0000, Ricardo Ribalda wrote:
> Some cameras, like the ELMO MX-P3, do not return all the bytes
> requested from a control if it can fit in less bytes.
> Eg: Returning 0xab instead of 0x00ab.
> usb 3-9: Failed to query (GET_DEF) UVC control 3 on unit 2: 1 (exp. 2).
> 
> Extend the returned value from the camera and return it.
> 
> Cc: stable@vger.kernel.org
> Fixes: a763b9fb58be ("media: uvcvideo: Do not return positive errors in uvc_query_ctrl()")

Is this really the patch that introduced the problem?

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index cd9c29532fb0..853dfb7b5f7b 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -79,11 +79,16 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	if (likely(ret == size))
>  		return 0;
>  
> +	if (ret > 0 && ret < size) {
> +		memset(data + ret, 0, size - ret);

It'd be nice to have a comment in the code why this is being done
(including it's little endian).

> +		return 0;
> +	}
> +
>  	if (ret != -EPIPE) {
>  		dev_err(&dev->udev->dev,
>  			"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
>  			uvc_query_name(query), cs, unit, ret, size);
> -		return ret < 0 ? ret : -EPIPE;
> +		return ret ? ret : -EPIPE;
>  	}
>  
>  	/* Reuse data[0] to request the error code. */
> 

-- 
Kind regards,

Sakari Ailus

