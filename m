Return-Path: <linux-media+bounces-2312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D2C810DC6
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 10:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93DCB281AC1
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 09:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C842209F;
	Wed, 13 Dec 2023 09:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ClCGkiUO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B5A83;
	Wed, 13 Dec 2023 01:58:44 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E19386CF;
	Wed, 13 Dec 2023 10:57:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702461477;
	bh=JoJj/ykH0cPZRaBJ01vpWhfVB89teGr3YCkf7ZkjkBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ClCGkiUOsI5Xe9NfB+qY7rWUtusoLoTo4VtEjyCcz47GrfEFzJFLdDzHqs6bRtfuS
	 q7pBJh8iWxmS/m2HMLS+kRWE2HxA7t/5o1whiv48zLIWRxx8Yzh4B3B94qQNKwCJVG
	 vJegemlkP9RF1WOweAqa15z1Tp97GQsLMNTSqYMw=
Date: Wed, 13 Dec 2023 11:58:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] media: i2c: mt9m114: add CONFIG_COMMON_CLK dependency
Message-ID: <20231213095849.GA2191@pendragon.ideasonboard.com>
References: <20231212213625.3653558-1-arnd@kernel.org>
 <ZXlmnmGepRnMyNfr@kekkonen.localdomain>
 <97a826ab-cd68-4494-884e-f7bd512a7bef@app.fastmail.com>
 <ZXl0-8VgzF3YH18i@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZXl0-8VgzF3YH18i@kekkonen.localdomain>

On Wed, Dec 13, 2023 at 09:10:19AM +0000, Sakari Ailus wrote:
> Hi Arnd,
> 
> On Wed, Dec 13, 2023 at 09:39:01AM +0100, Arnd Bergmann wrote:
> > On Wed, Dec 13, 2023, at 09:09, Sakari Ailus wrote:
> > > On Tue, Dec 12, 2023 at 10:18:04PM +0100, Arnd Bergmann wrote:
> > >> From: Arnd Bergmann <arnd@arndb.de>
> > >> 
> > >> With clang-16, building without COMMON_CLK triggers a range check on
> > >> udelay() because of a constant division-by-zero calculation:
> > >> 
> > >> ld.lld: error: undefined symbol: __bad_udelay
> > >> >>> referenced by mt9m114.c
> > >> >>>               drivers/media/i2c/mt9m114.o:(mt9m114_power_on) in archive vmlinux.a
> > >> 
> > >> Avoid this by adding a Kconfig dependency that avoids the broken build.
> > >
> > > This sounds like an odd way to fix an issue with udelay(). On which arch
> > > does it happen? Wouldn't it be better to fix the udelay() problem in the
> > > source?
> > >
> > > A quick check reveals there are about 2400 files using udelay.
> > 
> > I observed this on arm, but same sanity check exists on arc, m68k,
> > microblaze, nios2 and xtensa, all of which try to discourage
> > overly large constant delays busy loops. On Arm that limit is
> > any delay of over 2 miliseconds, at which time a driver should
> > generally use either msleep() to avoid a busy-loop, or (in extreme
> > cases) mdelay().
> > 
> > I first tried to rewrite the mt9m114_power_on() function to
> > have an upper bound on the udelay, but that didn't avoid the
> > link error because it still got into undefined C. Disabling
> > the driver without COMMON_CLK seemed easier since it already
> > fails to probe if mt9m114_clk_init() runs into a zero clk.
> > 
> > Maybe we could just fall back to the soft reset when the
> > clock rate is unknown?
> 
> The datasheet says the input clock range is between 6 MHz and 54 MHz. We
> could check that, and return an error if it's not in the range. The rate is
> needed for other reasons, too, and the sensor is unlikely to work if it's
> (more than little) off.
> 
> I wonder if this could address the Clang 16 issue, too? I'd replace
> udelay() with fsleep() in any case, and at the very least Clang should be
> happy with this.

I'm fine with both of those changes.

> > diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> > index 0a22f328981d..88a67568edf8 100644
> > --- a/drivers/media/i2c/mt9m114.c
> > +++ b/drivers/media/i2c/mt9m114.c
> > @@ -2092,6 +2092,7 @@ static void mt9m114_ifp_cleanup(struct mt9m114 *sensor)
> >  
> >  static int mt9m114_power_on(struct mt9m114 *sensor)
> >  {
> > +       long freq;
> >         int ret;
> >  
> >         /* Enable power and clocks. */
> > @@ -2104,9 +2105,10 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
> >         if (ret < 0)
> >                 goto error_regulator;
> >  
> > +       freq = clk_get_rate(sensor->clk);
> > +
> >         /* Perform a hard reset if available, or a soft reset otherwise. */
> > -       if (sensor->reset) {
> > -               long freq = clk_get_rate(sensor->clk);
> > +       if (sensor->reset && freq) {
> >                 unsigned int duration;
> >  
> >                 /*

-- 
Regards,

Laurent Pinchart

