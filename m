Return-Path: <linux-media+bounces-8690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C59D899594
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 08:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7B82B23FE0
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 06:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BC422331;
	Fri,  5 Apr 2024 06:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="nzOigP0p"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6041D556
	for <linux-media@vger.kernel.org>; Fri,  5 Apr 2024 06:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712299036; cv=pass; b=MANw6MP8QxSi/aV8NsTePY15M+ehSlP6cH3hQ01Ql0Dmd6pNAZWvfvYtq00WuWHKPEudSyJYW85e8mHW83e+RGqBNQ/jwGy27yElaJqjkvX9O57Utaq4KFqWsZJ2zv06PJGBGyzKzzHwnSZXZEGGhjiO/I995jzNDCQ6IL7ItK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712299036; c=relaxed/simple;
	bh=eX4PaOKsd5q3QuPSE2T74yutEitbdiy86YcRrLqgM6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nk7dxblGBKA0wKYqO1JS6vl5t24NK3ePwPLw7DKlWhvcSb1NZn7fMxLtZkPGiW9EZ3qieXYiQoVxqH5itbSjmbLdIJj9r/wpwUknKgpE+KWbz5vyrPgK2L44d/XzEQMTpPbI9L0UGOEiCTkG7DvvGNSdEUg+mCe03Pto9hd7Px4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=nzOigP0p; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4V9pgT2RDzz49Q20;
	Fri,  5 Apr 2024 09:37:09 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1712299030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jnAY8Z+eKQspcsx1Syltzm+I1/hi44armaUYBdctWUE=;
	b=nzOigP0pY2+JUoNR5wAjWhlLJrHglBFxWAl5c60NSTsf3ZSJce0kqmgnmE7IXORU5rYOwY
	wr5CL8XNqj99/3WtKAk0b70JfZojPSfUU24xFfVsu047NLSVjQKkp7ox7foVL9H3OKZs/0
	Vs+qb6mcPHvxeA01PXmTLFGdkvJWQPASyrfKrPYZORGQob40Yt4Sbho4YDt8mBNZ0CZdto
	Dnk56j9m9N46abvCCalg38KrD05IOIpaoIuP8pGjQvslezL0+j/GwsK+aJ24FuYiYNTvn4
	ibr/o3mZ84AUxIIq9aqe8uFLfi/DgsIUIwAy3pjn/+QfwLc2t1S4Xfnn/SMaDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1712299030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jnAY8Z+eKQspcsx1Syltzm+I1/hi44armaUYBdctWUE=;
	b=ASFZXxDWxPAlkwfuOH2JlSjiMairaijFixSYSjVm380eJOOeJchc+XE2BOTwWhGzJ6Bfzx
	ohhb4kouH6WlEQTIWUSnh1aRCl+ZG8kHyKvsXisCc1RXG8Ts3UtYNqS5KLpOHdddQHpJuY
	FCQIrImrAzTLAAsxzm7s+8vUAYd1gFT8C3HkDBccghdcWv/dND4a9A1D64XskrxWBJRr22
	lW39vaUaU69AC5yldY/7eYXa91LLkGoWV4u6kl5PRsJAxRqnYWGQPyMKn/0FUMfm+hLWMj
	uloWeWy80VFHV12d98+QiC4jrLuXFbyRk5auMLqa9M28aLbrWlOp38FvNvkjGA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1712299030; a=rsa-sha256;
	cv=none;
	b=ugaW6KPf+/9U5YoIxH5iRsfDKc36xwrqYtX/j8hJQ0WSARzuxu+7c9gLHTOM7LWJOxYWlQ
	1T7AQMTTgZMyEleK0TtQDD+Sb3eZ88yKh9scgcmjUvMu5iZhFx6Fyju90pQcjedCLgBHmF
	Xpfl/MesUEypbQ1ZGBvEYF8C9pmNTNFrFamXKXBwCAbtxIan5DmFmOnCbH0yteyk0Ioe82
	RT8c7bN/CJknIhwCzblRriYGSEx4F6ZIsw1ft3lqtb1z0/GzNRmMTAMLgoaeqllbiCS2z+
	HhxWo8sHF5JUHAw7Va8z/4UHLK5yEpoazfnAj+Ovy4i3I2e8QPnfO/MnelFkXA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C109B634C93;
	Fri,  5 Apr 2024 09:37:08 +0300 (EEST)
Date: Fri, 5 Apr 2024 06:37:08 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>
Subject: Re: [v4l-utils] [PATCH 6/8] v4l2-compliance: Support the changed
 routing API
Message-ID: <Zg-cFGj8UKew3YLN@valkosipuli.retiisi.eu>
References: <20240402000033.4007-1-laurent.pinchart@ideasonboard.com>
 <20240402000033.4007-7-laurent.pinchart@ideasonboard.com>
 <f1575622-d1e8-45ac-bc4b-aa73373536d3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1575622-d1e8-45ac-bc4b-aa73373536d3@ideasonboard.com>

Moi,

On Tue, Apr 02, 2024 at 01:54:00PM +0300, Tomi Valkeinen wrote:
> On 02/04/2024 03:00, Laurent Pinchart wrote:
> > Set len_routes of struct v4l2_subdev_routing. ENOSPC error code is no
> > longer used, i.e. having room for fewer routes than exist in the
> > configuration is not considered an error anymore.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >   utils/v4l2-compliance/v4l2-compliance.cpp   | 12 +++++++-----
> >   utils/v4l2-compliance/v4l2-test-subdevs.cpp | 19 +++++++++++--------
> >   2 files changed, 18 insertions(+), 13 deletions(-)
> > 
> > diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> > index 2cf979096bd0..72fe0bd778ab 100644
> > --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> > +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> > @@ -1272,15 +1272,17 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
> >   			for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
> >   				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
> > +				struct v4l2_subdev_routing &routing = sd_routing[which];
> > -				sd_routing[which].which = which;
> > -				sd_routing[which].routes = (__u64)sd_routes[which];
> > -				sd_routing[which].num_routes = NUM_ROUTES_MAX;
> > +				routing.which = which;
> > +				routing.routes = (__u64)sd_routes[which];
> > +				routing.len_routes = NUM_ROUTES_MAX;
> > +				routing.num_routes = 0;
> 
> Not part of this series, but something I noticed while testing. Our
> routing code is broken for 32-bit userspace: we convert the routes
> pointer to u64, which ends up sign extending the address.
> 
> Interestingly gcc gives "cast from pointer to integer of different size
> [-Wpointer-to-int-cast]", but g++ doesn't, and "command-line option
> ‘-Wpointer-to-int-cast’ is valid for C/ObjC but not for C++". So we don't
> get any warnings for the bugs.

Nice find!

> 
> With a quick look I found these places to fix. Will you add a patch to
> your series, or should I send this as a separate one?
> 
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index 72fe0bd7..a969b69c 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -1275,7 +1275,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>                                 struct v4l2_subdev_routing &routing = sd_routing[which];
>                                 routing.which = which;
> -                               routing.routes = (__u64)sd_routes[which];
> +                               routing.routes = (__u64)(uintptr_t)sd_routes[which];

I don't think you need the second cast anymore as it's already an integer.
Same for the rest.

>                                 routing.len_routes = NUM_ROUTES_MAX;
>                                 routing.num_routes = 0;
> @@ -1307,7 +1307,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>                                         routes = sd_routes[which];
>                                 } else {
>                                         dummy_routing.num_routes = 1;
> -                                       dummy_routing.routes = (__u64)&dummy_routes;
> +                                       dummy_routing.routes = (__u64)(uintptr_t)&dummy_routes;
>                                         dummy_routes[0].source_pad = pad;
>                                         dummy_routes[0].source_stream = 0;
>                                         dummy_routes[0].sink_pad = pad;
> diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> index e26d09ed..21d7776a 100644
> --- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> @@ -587,7 +587,7 @@ int testSubDevRouting(struct node *node, unsigned which)
>         int ret;
>         routing.which = which;
> -       routing.routes = (__u64)&routes;
> +       routing.routes = (__u64)(uintptr_t)&routes;
>         routing.len_routes = 0;
>         routing.num_routes = 0;
>         memset(routing.reserved, 0xff, sizeof(routing.reserved));
> 
> 
>  Tomi
> 

-- 
Terveisin,

Sakari Ailus

