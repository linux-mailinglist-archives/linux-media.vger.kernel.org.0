Return-Path: <linux-media+bounces-13974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D33491352E
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 18:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FFB01C212C6
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 16:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F5A8F77;
	Sat, 22 Jun 2024 16:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Q0XmDJfn"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC195C8C7;
	Sat, 22 Jun 2024 16:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719074858; cv=pass; b=OjKx6oO6fDq5Od0LDgz177H8ZZFWTuYVKr8NHjmMhc/lKkTqwdrFA8pParMhASbW62X6CmYoyOu6gm25y8Y7VpZVDsX+n/kS0JJJtJLwHF5gIJUza8JJOMeiglI888B3Msd2TLn/ZsEA88tXZ+GUMKYbdsZ+LQa97pqRZUh5NXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719074858; c=relaxed/simple;
	bh=j4FT13T3zrdSrzx3vsBMF2frCNHV9masxl6ek/pcNFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRZPFfkVQeNpEuCJeJwaqggFKpW9hbGHVoYVR+ATWxjVikxQBISuxWq3RH6Jp4rEFtQbQ5rl/Wub5TMvBRSv6009Nd6Hy6kEjRLOhvdt08iwODOG40Yh1aPBi3VME20Y1z5Tk/sohGIqLeNTcdZh4xKpXwRGmHtuoEItCjiZr2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Q0XmDJfn; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4W60Wp1bRFz49QhT;
	Sat, 22 Jun 2024 19:47:34 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1719074854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KtY3MCLf5pNxADYjBpQpzMi8fGwEWgS1XE+bkxux7QY=;
	b=Q0XmDJfnXoC8D0TKLHyFFJaOagp/eOypqY9cVoQWVOCFgenIioUIR8gnaS2A6aR80eGBN3
	QLwNM25Hpck3EAVyhPrOmTTtG53jVaesbdHbTEzKp9KqbzTo20XR58Kq8Jvc52V3W/SjZa
	ME4xEOUIrLpKq8hagaMWnHCATxe0Bd80G+AGxpRCZ3jFzPoNnL0777016beS5acxw8IEvN
	2QI/fGs1Zq9cNbjSkrdhlaUDm0UFRxs7Cor853FzbbITNLytoihuvuJ55/wqx66Oym0H0X
	k+0E36ETJqVP2uANhBduZ1BnSgipaNbQkNbXWHhkvGQY/5sffGDtRjJtcK8O0Q==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1719074854; a=rsa-sha256;
	cv=none;
	b=LkltzSYW8k6HdFVKFTzAru7qFQtZ3v10TdAXz+fx8HqjsQUbcwe4AhpV13KrVyRD/rXh8V
	BRnar4wGidq6x9F0LaxE2x79gaG5F1pwParN5Xr1NQuZ58bqagcePMmYxgJYdctPb1x3u2
	GfHIpfs9F2iZMrvVWHJdJPj9KVASzA7RE50KD+mY1GutBWuAdeLLAyUv2btnEFsfYW59t1
	7relf3tMD+nuQqcPGFKT9N/JEaZTxb45N00bOATPOxEoYpkaPvfrHBf4OjvfsE7ViCPWti
	X7s2arOjRl6d+S+IxINmvtOmSVc5kkhKUO6m6aQiCf/hSmH1KXPV4wGGffqRdA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1719074854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KtY3MCLf5pNxADYjBpQpzMi8fGwEWgS1XE+bkxux7QY=;
	b=TroOFEahvi+/X/8aA/A5pBuW+vG1EEg2Yr+8S5dJ4hJ0PzuXwEDPggKMr1QVri7DwlTBWE
	40i4JvCVwg/8/FwITCvStmjUR7izHh0Wehz2tP86lG5M0DthZNY6OAREpkRMhhQnLp795J
	G6biACkDZqRRu4Yd++qyf6ehxKbO29p4TazIMzoe1RZyVYXiklHo3B+Gy4U5+UIEteDiyV
	1njpz+W7KW8AiOCvDYXxjw8rEkF0JhxiJ6Dj5/S6HowGDj8MC+6tVxXe6guAYyy8x9J1VB
	zBqeWQ3/8pPJ/D/gT8QFOUrJMcTZeXo3xFzQi4SlTrNu/VdvMKj36Sk4UvAJBQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 8EA66634C93;
	Sat, 22 Jun 2024 19:47:33 +0300 (EEST)
Date: Sat, 22 Jun 2024 16:47:33 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 4/8] media: v4l2-subdev: Refactor warnings in
 v4l2_subdev_link_validate()
Message-ID: <ZncAJRoydaWoxGRj@valkosipuli.retiisi.eu>
References: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240619012356.22685-5-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619012356.22685-5-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent,

Thanks for the patch.

On Wed, Jun 19, 2024 at 04:23:52AM +0300, Laurent Pinchart wrote:
> The v4l2_subdev_link_validate() function prints a one-time warning if it
> gets called on a link whose source or sink is not a subdev. As links get
> validated in the context of their sink, a call to the helper when the
> link's sink is not a subdev indicates that the driver has set its
> .link_validate() handler to v4l2_subdev_link_validate() on a non-subdev
> entity, which is a clear driver bug. On the other hand, the link's
> source not being a subdev indicates that the helper is used for a subdev
> connected to a video output device, which is a lesser issue, if only
> because this is currently common practice.
> 
> There are no drivers left in the kernel that use
> v4l2_subdev_link_validate() in a context where it may get called on a
> non-subdev sink. Replace the pr_warn_once() with a WARN_ON() in this
> case to make sure that new offenders won't be introduced.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 4f71199bf592..2d5e39c79620 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1451,11 +1451,15 @@ int v4l2_subdev_link_validate(struct media_link *link)
>  	bool states_locked;
>  	int ret;
>  
> -	if (!is_media_entity_v4l2_subdev(link->sink->entity) ||
> -	    !is_media_entity_v4l2_subdev(link->source->entity)) {
> -		pr_warn_once("%s of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
> -			     !is_media_entity_v4l2_subdev(link->sink->entity) ?
> -			     "sink" : "source",
> +	/*
> +	 * Links are validated in the context of the sink entity. Usage of this
> +	 * helper on a sink that is not a subdev is a clear driver bug.
> +	 */
> +	if (WARN_ON(!is_media_entity_v4l2_subdev(link->sink->entity)))
> +		return -EINVAL;

WARN*() is nowadays deprecated. Could you continue to use pr_warn_once()
for this (or dev_warn_one())?

> +
> +	if (!is_media_entity_v4l2_subdev(link->source->entity)) {
> +		pr_warn_once("source of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
>  			     link->source->entity->name, link->source->index,
>  			     link->sink->entity->name, link->sink->index);
>  		return 0;

-- 
Kind regards,

Sakari Ailus

