Return-Path: <linux-media+bounces-13813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5F5910555
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 15:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE5C41F2239F
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 13:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453DC1AF68B;
	Thu, 20 Jun 2024 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="v0GYSZ18"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53641AD9CA
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718888479; cv=pass; b=focHUfvf23OESKTOL2R3UCAkXU5EfaOjibiBqZe4zmHuIMyNttNi42gJcqyNAdGp5HPXWXsRwWSGq3ggN0cHPeiSfUeog5BElkmcwawSo8CLSWbiaN0bWBrUiDET+amJaEDLZ62WgRw1Z99kH3C0pMjaIXBaRG85PaH5PUufxQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718888479; c=relaxed/simple;
	bh=WwJg+qeukXqzShpm6A3ROtjUzL2JlWha6al4xYxBrjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1btBh0auw9CTQLljtJPEhbtWLTbrx4b7xMYBn5dnY/R3gE7BhrI7FvAkqM2KV0IwEnEsMKgzY09N5ea1eO++296FGvYaw+QqU5dB2UdZA4BUn4q1NSAR/Ef28ey3nz/bbKLw+wSsL2z6KCml/ZsJnXy0Y1DsiDo9h0AmudmemI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=v0GYSZ18; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4W4gbR6dcQz49RHC;
	Thu, 20 Jun 2024 16:01:07 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1718888468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cpRMn0EpqX/3EG0sl2FXppeBuLkFYmwiCLNRkKkk1PE=;
	b=v0GYSZ18t0AEJaA7sFElc9fGf7vWDs9qli7peHsYLGaFVtxxmssOvb9tqX3CRXy4YsebHr
	5WyWu1zg4drfEvDA2bky+XMAOEqOdkdNBIIDKVS+ZhO4sW9GqOhe52n1cQZzoQfU3ndTwh
	Xhh/nLA8zTepZ1TB8cGkHdcq36iP56LJz07c7Vvxvk5bbHErK6a+L9XZHuHgg6Chm70xso
	WktIyHwReus4z/QhFUodx2HsEAaUI3k4RWRJwwS25058or1maAXxV+nvrYQ1E8y4MfeoFD
	O9iWcFf6Jf7C++sNqVVbIjyaBS3AVGQxNkpoJt0sLwpTGwgonTWSBt2kBA1sMA==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1718888468; a=rsa-sha256;
	cv=none;
	b=MKREaEoN0SIzDYg8GNn5L4h+ZOAx5F8OTPe9Su+7w578AJSK9EJTXG+FUO5OJuRQUHto/f
	9NIxh95S/4UBf1/W6iCKrrNpiygTXvJ9wMx2iG5TQ26C2TKO5+iZI6UUU67D03bRv3ZCo2
	9hLe0vm9DqLf6RI8FmQMcqFpD/upyVebCUsVr3ITIbaZIdMBf9CFNECbM56+Rl0OkilPjT
	QE8m372ZBbPhdhQkX9Fk+ZRYpbq7/mFWrZJdMGFS9EQxXA2qz8RMaY7oEaofsdllNiKH7E
	RWfKCMwtKA6DpWOOB7qjRTRyCkQuo4NFSy11gyzK2pJL+X/4GkqqQTfD1rGdRA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1718888468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cpRMn0EpqX/3EG0sl2FXppeBuLkFYmwiCLNRkKkk1PE=;
	b=QAwHpXaWW+8+ibLyAwwj88DcYLjm9usZ454IR/5usclobC6JHWhyMNbXmPWFgb9Atr67+N
	dB9TELHK9izCU/QK9yKmQtTpuU7EK0Qr5u7XzdM1/sZwiVTaV2pBUGe8JiL6ZwwP/Ecq6A
	4p9DAftsnOty4UgY/K1yF9pU55tGZnBrbZA7aiO7RrFKFZgt4FWMDTTZfx5Lul6U3H11M0
	a481KY33OzPrUHfoaXRLH9ei7LPylXFmv+ojaXO+0Vz0f93RRnhHiNgk/H9lYkrNSmVgbO
	KV/OFn+q/oPpeqKl6Xg52GzF8fMvGJZ6lWufBokhKwiJ0sH/fTb+GJxdb6kKgQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id DE627634C93;
	Thu, 20 Jun 2024 16:01:06 +0300 (EEST)
Date: Thu, 20 Jun 2024 13:01:06 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v1 1/9] media: vimc: Don't iterate over single pad
Message-ID: <ZnQoEnZXFCUrjda0@valkosipuli.retiisi.eu>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
 <20240424235741.17093-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424235741.17093-2-laurent.pinchart@ideasonboard.com>

Hi Laurent,

On Thu, Apr 25, 2024 at 02:57:33AM +0300, Laurent Pinchart wrote:
> The .init_state() operations of the debayer and sensor entities iterate
> over the entity's pads. In practice, the iteration covers a single pad
> only. Access the pad directly and remove the loops.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/test-drivers/vimc/vimc-debayer.c |  9 +++------
>  drivers/media/test-drivers/vimc/vimc-sensor.c  | 10 +++-------
>  2 files changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
> index d72ed086e00b..e1bf6db73050 100644
> --- a/drivers/media/test-drivers/vimc/vimc-debayer.c
> +++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
> @@ -155,16 +155,13 @@ static int vimc_debayer_init_state(struct v4l2_subdev *sd,
>  {
>  	struct vimc_debayer_device *vdebayer = v4l2_get_subdevdata(sd);
>  	struct v4l2_mbus_framefmt *mf;
> -	unsigned int i;
>  
>  	mf = v4l2_subdev_state_get_format(sd_state, 0);
>  	*mf = sink_fmt_default;
>  
> -	for (i = 1; i < sd->entity.num_pads; i++) {
> -		mf = v4l2_subdev_state_get_format(sd_state, i);
> -		*mf = sink_fmt_default;
> -		mf->code = vdebayer->src_code;
> -	}
> +	mf = v4l2_subdev_state_get_format(sd_state, 1);

You can assign in variable declaration as this is just about obtaining the
appropriate state pointer.

> +	*mf = sink_fmt_default;
> +	mf->code = vdebayer->src_code;
>  
>  	return 0;
>  }
> diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
> index 5e34b1aed95e..b535b3ffecff 100644
> --- a/drivers/media/test-drivers/vimc/vimc-sensor.c
> +++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
> @@ -44,14 +44,10 @@ static const struct v4l2_mbus_framefmt fmt_default = {
>  static int vimc_sensor_init_state(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state)
>  {
> -	unsigned int i;
> +	struct v4l2_mbus_framefmt *mf;
>  
> -	for (i = 0; i < sd->entity.num_pads; i++) {
> -		struct v4l2_mbus_framefmt *mf;
> -
> -		mf = v4l2_subdev_state_get_format(sd_state, i);
> -		*mf = fmt_default;
> -	}
> +	mf = v4l2_subdev_state_get_format(sd_state, 0);

Ditto.

Up to you though.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> +	*mf = fmt_default;
>  
>  	return 0;
>  }

-- 
Kind regards,

Sakari Ailus

