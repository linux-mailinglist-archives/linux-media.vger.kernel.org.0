Return-Path: <linux-media+bounces-211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF4F7E9A78
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 11:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 263FB1C208FB
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 10:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73871BDF7;
	Mon, 13 Nov 2023 10:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="f/FRopg0"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A76219BBD
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 10:42:29 +0000 (UTC)
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8157910CB
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 02:42:26 -0800 (PST)
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4STQwv3VBLzySy
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 12:42:20 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1699872143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x81oY68QDS5qDT0CUmzY95yPRnzsXk4evZudt6cmcZE=;
	b=f/FRopg0TyW/8MH4LM+AU0CLM8OCRXDAaqOmnfNbKIdfR+MMJnv+C5pz/QfPnLchPff609
	oZqiRwJuEQ1JGCJLBhDeMFBZIataLlJHZJpKu2IJG8FcY5Dq5V8e+1eU7jHyUHsVXP66rR
	WRwQTc8trlHurIJwP2I5weGi3mufpYM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1699872143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x81oY68QDS5qDT0CUmzY95yPRnzsXk4evZudt6cmcZE=;
	b=rLAWVWfjM82EqyJK39JlKsHVzgpkNBwgAVP0DibcrWqfkDvU8CzIRAM7bgc1og41dZVB/9
	MliWCvXY4VkoMEYMopfBghlE3/WbcurGjT3p9fEdpBAK9glCOIp+4OsIxbuxuI35lHjhzx
	F4OIptkHap8Va8jPrjCkbDh2VvJyVow=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1699872143; a=rsa-sha256; cv=none;
	b=I2JS6WJgPXVsH1AvhbRYy5lUcWefTDEN0ijUNf9ji1i0m52sFpSAxn0A3hqH5LJLEHVZDZ
	Q0QRFU6ix9UCpC+E6PyTBFJmaa5pzBfkkH/rsBzCFslS1ZM5ZzlTPTK2eX6lj50AsrpuDf
	SH7tWwg3EV7qlBDSE0ygtHal0+ltnu0=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3DE73634C93;
	Mon, 13 Nov 2023 12:42:16 +0200 (EET)
Date: Mon, 13 Nov 2023 10:42:16 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v1 1/2] media: v4l2-subdev: Drop unreacheable warning
Message-ID: <ZVH9iO5XPay8In_R@valkosipuli.retiisi.eu>
References: <20231113101718.6098-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231113101718.6098-2-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113101718.6098-2-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent,

On Mon, Nov 13, 2023 at 12:17:17PM +0200, Laurent Pinchart wrote:
> The v4l2_subdev_link_validate_get_format() function warns if the pad
> given as argument belongs to a non-subdev entity. This can't happen, as
> the function is called from v4l2_subdev_link_validate() only (indirectly
> through v4l2_subdev_link_validate_locked()), and that function ensures
> that both ends of the link are subdevs.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index be86b906c985..67d43206ce32 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1184,14 +1184,6 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad, u32 stream,
>  	struct v4l2_subdev *sd;
>  	int ret;
>  
> -	if (!is_media_entity_v4l2_subdev(pad->entity)) {
> -		WARN(pad->entity->function != MEDIA_ENT_F_IO_V4L,
> -		     "Driver bug! Wrong media entity type 0x%08x, entity %s\n",
> -		     pad->entity->function, pad->entity->name);
> -
> -		return -EINVAL;
> -	}
> -
>  	sd = media_entity_to_v4l2_subdev(pad->entity);

It'd be good to check sd is non-NULL here, although pad presumably is
always a pad of a sub-device entity.

>  
>  	fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;

-- 
Regards,

Sakari Ailus

