Return-Path: <linux-media+bounces-12165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C32638D3A97
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 17:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA4501C20B03
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 15:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6BA11802A7;
	Wed, 29 May 2024 15:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WDV6kijH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBDC1591EC
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 15:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716995982; cv=none; b=p2SwS5bazhvhpBQx/DwhwUzbEUeqPDjQ3OC+A5Rp62m+8ChUD7feAkYj5RnQTQggOQuTK0TYt0u4+2w7C8pLMqfX4ZnqQEOZdicC/7vGB4glQeHaf/QWC5g4ik8pOkw04AkpgTNV1cXQ8wNI854KkP13uUUZeua5o56g+WflMOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716995982; c=relaxed/simple;
	bh=5xb9/pFTUjXMFfCpbbsAlw8Ymuv/0WvozQ/HI2hJ3eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tsYI5EXNwJVztlIwYNaSWmtJiR6KLkCT1ILfroW4EMC32BSYG2NQUjX1OGNq6yVobhRTdIZhA41bLN87iwHjrVpCJxGamAR3vDPGVvTNXmZ7HmHTBCdKkFACXpCZeyRPaKHA/A6rMjnBQVwZ3vPB9XLM8ib+dhwBlgIkxBM1BoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WDV6kijH; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5785199f7d1so992974a12.2
        for <linux-media@vger.kernel.org>; Wed, 29 May 2024 08:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716995979; x=1717600779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LVMlvGvu+yE6fLI+Siw+dExoNxH7F0Khba0Cygf9Ass=;
        b=WDV6kijHr7Us1cbFW9ii6bLQB1uXfcz0+0x9Ji7IGWpeE2Uu8QgqYpCJEBCgqbM/6o
         yichZl+iqPkRthA5JX/VCrZZ7B+hUKIpmm+qlx52Hgs1k2LHeje7o/nqi7Kw5Gon6Pnx
         KwOIyqL6j2ybGUHMu72mHyKu7jUKhX9/l6FOVHuCMhlg8IVaUnQFlfOUA857DHfUxh1P
         Z0H2EgqdCIS0s4GRG5XQW3Vztb8pqnK1V30u5nQGnba4fLsCtJIvizoESSeEfXs726kg
         7L/PVlfBDyT8+1NoxsCD+jDnsrcujedTG/xyJMMH1lFjFDmHFJWuoRCS8do0Zw2ew6uO
         2tdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716995979; x=1717600779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVMlvGvu+yE6fLI+Siw+dExoNxH7F0Khba0Cygf9Ass=;
        b=Y+aa3Zz7J4qpyTPNvyPbI8OOiDczAG9Ym7wcWoV3XaTE63EJ15IeTpa6FHYLfIlhgx
         1nk6EMh6t1i/5ldWCdXJQTIbBtS71oWbcuhp4vJyGgm9wFhgOd3f7DeTNQ7Ly/f6rQd1
         Kz8pZ8wqmQEbyCF0or/L5/A9DLDDVivYKZqOmlOl+l9CFmktL4e9wL6XlCyX+wxBduIj
         Za1ShwSXU7j1F4vssUEZyLy2qsVszBxZ5ehGR0owRrUvH13Z304cCWwPn2DrNkHETVKU
         E9Sb1Ir9QPJk7K5VAHR4DMdybD4UtQe0uIjkHwBtAP6FLcwhhINTgc5eUquLN8U19Cs+
         xfjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmST0iGQdOO39Jd2dRV2uXcyoj1J+BwmKhftavrIforlR8bB8pPndGiPzpILILLX8sI0Dw/1MVXh5AgwFxTFXholreHBluaS73L/8=
X-Gm-Message-State: AOJu0YwIRpgSTEc1Isn2Nr9CIyTj2b1FS70zKjqZRdzT3LKx+JV/Mbkw
	19MwK2wp60i4tq8CBn02BY9YMicnxd2PlS1tIvyxjEKAbhNyyszlgQDqfVlSRIQ=
X-Google-Smtp-Source: AGHT+IHCd3nqrD6LOXts5/qJL2JDZ9MXajPdxTu0OJ82kiARsXhmJOxs0nDRy4z6dcf/PiB8YDe+3g==
X-Received: by 2002:a50:d649:0:b0:572:6af5:1b61 with SMTP id 4fb4d7f45d1cf-57851915266mr14199318a12.6.1716995978643;
        Wed, 29 May 2024 08:19:38 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-578524bbb5dsm8489083a12.95.2024.05.29.08.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 08:19:37 -0700 (PDT)
Date: Wed, 29 May 2024 18:19:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	prabhakar.csengg@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 resend 2/8] hwtracing: use for_each_endpoint_of_node()
Message-ID: <501d8e92-43c8-4205-9c3a-819888fbd5f2@moroto.mountain>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <87fru14hl7.wl-kuninori.morimoto.gx@renesas.com>
 <20240529004047.GB1436@pendragon.ideasonboard.com>
 <7fbf421c-6477-4fc4-93a5-10e2788522c4@moroto.mountain>
 <20240529145253.GE19014@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529145253.GE19014@pendragon.ideasonboard.com>

On Wed, May 29, 2024 at 05:52:53PM +0300, Laurent Pinchart wrote:
> On Wed, May 29, 2024 at 05:34:41PM +0300, Dan Carpenter wrote:
> > On Wed, May 29, 2024 at 03:40:47AM +0300, Laurent Pinchart wrote:
> > > > @@ -286,7 +286,7 @@ static int of_get_coresight_platform_data(struct device *dev,
> > > >  	}
> > > >  
> > > >  	/* Iterate through each output port to discover topology */
> > > > -	while ((ep = of_graph_get_next_endpoint(parent, ep))) {
> > > > +	for_each_endpoint_of_node(parent, ep) {
> > > >  		/*
> > > >  		 * Legacy binding mixes input/output ports under the
> > > >  		 * same parent. So, skip the input ports if we are dealing
> > > 
> > > I think there's a bug below. The loop contains
> > > 
> > > 		ret = of_coresight_parse_endpoint(dev, ep, pdata);
> > > 		if (ret)
> > > 			return ret;
> > > 
> > > which leaks the reference to ep. This is not introduced by this patch,
> > 
> > Someone should create for_each_endpoint_of_node_scoped().
> > 
> > #define for_each_endpoint_of_node_scoped(parent, child) \
> >         for (struct device_node *child __free(device_node) =           \
> >              of_graph_get_next_endpoint(parent, NULL); child != NULL;  \
> >              child = of_graph_get_next_endpoint(parent, child))
> 
> I was thinking about that too :-) I wondered if we should then bother
> taking and releasing references, given that references to the children
> can't be leaked out of the loop. My reasoning was that the parent
> device_node is guaranteed to be valid throughout the loop, so borrowing
> references to children instead of creating new ones within the loop
> should be fine. This assumes that endpoints and ports can't vanish while
> the parent is there. Thinking further about it, it may not be a safe
> assumption for the future. As we anyway use functions internally that
> create new references, we can as well handle them correctly.
> 
> Using this new macro, the loop body would need to call of_node_get() if
> it wants to get a reference out of the loop.

The child pointer is declared local to just the loop so you'd need
create a different function scoped variable.  If it's not local to the
loop then we'd end up taking a reference on each iteration and never
releasing anything except on error paths.

> That's the right thing to
> do, and I think it would be less error-prone than having to drop
> references when exiting from the loop as we do today. It would still be
> nice if we could have an API that allows catching this missing
> of_node_get() automatically, but I don't see a simple way to do so at
> the moment.

That's an interesting point.

If we did "function_scope_var = ep;" here then we'd need to take a
second reference as you say.  With other cleanup stuff like kfree() it's
very hard to miss it if we forget to call "no_free_ptr(&ep)" because
it's on the success path.  It leads to an immediate crash in testing.
But here it's just ref counting so possibly we might miss that sort of
bug.

regards,
dan carpenter


