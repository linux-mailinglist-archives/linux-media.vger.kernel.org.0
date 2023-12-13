Return-Path: <linux-media+bounces-2338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8258110C5
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 13:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F1F51C208EA
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 12:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF46728DD2;
	Wed, 13 Dec 2023 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Hwp6d+Ej"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CCFFCD;
	Wed, 13 Dec 2023 04:09:03 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BC6666F;
	Wed, 13 Dec 2023 13:08:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702469296;
	bh=jqhRjEL97tn66XG6waeuYNlSKAzpHyL1g4+7ALb8P6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hwp6d+EjAYB0geF68t4m6zgcSbUiP+a93h4cqFqIC3Vzcbm2w9XuqWaArOoceoFlp
	 ISYe3zCw05UnSJi4G81SOMUr8xC/qfJqhBMNag4gvwnMMiO5gQbVLGBxIIIGSs537k
	 HKFJpw8ki6RmYvuiLZW89YKvP8LMgmmqd1+lIOVc=
Date: Wed, 13 Dec 2023 14:09:09 +0200
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
Message-ID: <20231213120909.GC769@pendragon.ideasonboard.com>
References: <20231213112322.1655236-1-arnd@kernel.org>
 <5c5647d5-b389-4d71-9062-3a9921212079@ideasonboard.com>
 <20231213114812.GB769@pendragon.ideasonboard.com>
 <0722393c-8107-4a8f-b3ab-1bbb347a6f1b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0722393c-8107-4a8f-b3ab-1bbb347a6f1b@ideasonboard.com>

On Wed, Dec 13, 2023 at 01:56:48PM +0200, Tomi Valkeinen wrote:
> On 13/12/2023 13:48, Laurent Pinchart wrote:
> > On Wed, Dec 13, 2023 at 01:40:54PM +0200, Tomi Valkeinen wrote:
> >> On 13/12/2023 13:23, Arnd Bergmann wrote:
> >>> From: Arnd Bergmann <arnd@arndb.de>
> >>>
> >>> With clang-16, building without COMMON_CLK triggers a range check on
> >>> udelay() because of a constant division-by-zero calculation:
> >>>
> >>> ld.lld: error: undefined symbol: __bad_udelay
> >>>>>> referenced by mt9m114.c
> >>>>>>                 drivers/media/i2c/mt9m114.o:(mt9m114_power_on) in archive vmlinux.a
> >>>
> >>> In this configuration, the driver already fails to probe, before
> >>> this function gets called, so it's enough to suppress the assertion.
> >>>
> >>> Do this by using fsleep(), which turns long delays into sleep() calls
> >>> in place of the link failure.
> >>>
> >>> This is probably a good idea regardless to avoid overly long dynamic
> >>> udelay() calls on a slow clock.
> >>>
> >>> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>> Fixes: 24d756e914fc ("media: i2c: Add driver for onsemi MT9M114 camera sensor")
> >>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >>> ---
> >>>    drivers/media/i2c/mt9m114.c | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> >>> index 0a22f328981d..68adaecaf481 100644
> >>> --- a/drivers/media/i2c/mt9m114.c
> >>> +++ b/drivers/media/i2c/mt9m114.c
> >>> @@ -2116,7 +2116,7 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
> >>>    		duration = DIV_ROUND_UP(2 * 50 * 1000000, freq);
> >>>    
> >>>    		gpiod_set_value(sensor->reset, 1);
> >>> -		udelay(duration);
> >>> +		fsleep(duration);
> >>>    		gpiod_set_value(sensor->reset, 0);
> >>>    	} else {
> >>>    		/*
> >>
> >> I think this is fine, so:
> >>
> >> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>
> >> But: If we don't have COMMON_CLK (or rather, I think, HAVE_CLK), the
> >> freq will be zero at compile time. So won't the compiler give a warning
> >> for the DIV_ROUND_UP() call?
> >>
> >> Interestingly, for me, this doesn't give a div-by-zero warning:
> >>
> >> 	int x;
> >> 	int y = 0;
> >> 	x = DIV_ROUND_UP(10, y);
> >>
> >> but this does:
> >>
> >> 	int x;
> >> 	const int y = 0;
> >> 	x = DIV_ROUND_UP(10, y);
> >>
> >> And looks like this gives the warning too:
> >>
> >> 	int x;
> >> 	const int y = 0;
> >> 	if (y)
> >> 		x = DIV_ROUND_UP(10, y);
> >>
> >> So, I think, the code in the driver could fail to compile at some later
> >> point, if the compiler warnings are improved (?), or if someone adds a
> >> 'const' in front of 'long freq = clk_get_rate(sensor->clk);' line.
> >>
> >> Maybe worry about that if it actually happens =).
> > 
> > Maybe :-) I would be tempted to make VIDEO_CAMERA_SENSOR depend on
> > COMMON_CLK.
> 
> I think HAVE_CLK would be more correct.

Indeed. Only arch/m68k (for Coldfire), arch/mips (for BCM63xx and
Lantiq) and arch/sh (for pre-DT platforms) still make use of
HAVE_LEGACY_CLK. It takes a long time to address the last users of a
legacy API, but it seems we could get there one day.

-- 
Regards,

Laurent Pinchart

