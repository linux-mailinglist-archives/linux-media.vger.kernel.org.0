Return-Path: <linux-media+bounces-2335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E3F81107D
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 12:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51F98281730
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 11:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF352575C;
	Wed, 13 Dec 2023 11:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bWhhRaBN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C81EB;
	Wed, 13 Dec 2023 03:48:06 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91C4D4A9;
	Wed, 13 Dec 2023 12:47:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702468039;
	bh=K5vzJMZCByu2FUPV6KuqqU9Oq1PbXacIfstj1rPq/7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bWhhRaBNUo2jZyMdx+toUqPxhZmYst0bqZgyUgb3ezFtaHvlU7NSFCNP57b15eWom
	 NQ2f7LRfvRz/iwNTe6U2cuHTsmf3kSPE0UCoCQnffcseia+6+317MIrVSjcyi3emRQ
	 GiasRiljz7r2+xTZ0y0xbvMgXJYwc1+edUps42yQ=
Date: Wed, 13 Dec 2023 13:48:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] [v2] media: i2c: mt9m114: use fsleep() in place of
 udelay()
Message-ID: <20231213114812.GB769@pendragon.ideasonboard.com>
References: <20231213112322.1655236-1-arnd@kernel.org>
 <5c5647d5-b389-4d71-9062-3a9921212079@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5c5647d5-b389-4d71-9062-3a9921212079@ideasonboard.com>

On Wed, Dec 13, 2023 at 01:40:54PM +0200, Tomi Valkeinen wrote:
> On 13/12/2023 13:23, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > With clang-16, building without COMMON_CLK triggers a range check on
> > udelay() because of a constant division-by-zero calculation:
> > 
> > ld.lld: error: undefined symbol: __bad_udelay
> >>>> referenced by mt9m114.c
> >>>>                drivers/media/i2c/mt9m114.o:(mt9m114_power_on) in archive vmlinux.a
> > 
> > In this configuration, the driver already fails to probe, before
> > this function gets called, so it's enough to suppress the assertion.
> > 
> > Do this by using fsleep(), which turns long delays into sleep() calls
> > in place of the link failure.
> > 
> > This is probably a good idea regardless to avoid overly long dynamic
> > udelay() calls on a slow clock.
> > 
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Fixes: 24d756e914fc ("media: i2c: Add driver for onsemi MT9M114 camera sensor")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >   drivers/media/i2c/mt9m114.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> > index 0a22f328981d..68adaecaf481 100644
> > --- a/drivers/media/i2c/mt9m114.c
> > +++ b/drivers/media/i2c/mt9m114.c
> > @@ -2116,7 +2116,7 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
> >   		duration = DIV_ROUND_UP(2 * 50 * 1000000, freq);
> >   
> >   		gpiod_set_value(sensor->reset, 1);
> > -		udelay(duration);
> > +		fsleep(duration);
> >   		gpiod_set_value(sensor->reset, 0);
> >   	} else {
> >   		/*
> 
> I think this is fine, so:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> But: If we don't have COMMON_CLK (or rather, I think, HAVE_CLK), the 
> freq will be zero at compile time. So won't the compiler give a warning 
> for the DIV_ROUND_UP() call?
> 
> Interestingly, for me, this doesn't give a div-by-zero warning:
> 
> 	int x;
> 	int y = 0;
> 	x = DIV_ROUND_UP(10, y);
> 
> but this does:
> 
> 	int x;
> 	const int y = 0;
> 	x = DIV_ROUND_UP(10, y);
> 
> And looks like this gives the warning too:
> 
> 	int x;
> 	const int y = 0;
> 	if (y)
> 		x = DIV_ROUND_UP(10, y);
> 
> So, I think, the code in the driver could fail to compile at some later 
> point, if the compiler warnings are improved (?), or if someone adds a 
> 'const' in front of 'long freq = clk_get_rate(sensor->clk);' line.
> 
> Maybe worry about that if it actually happens =).

Maybe :-) I would be tempted to make VIDEO_CAMERA_SENSOR depend on
COMMON_CLK.

-- 
Regards,

Laurent Pinchart

