Return-Path: <linux-media+bounces-36743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47351AF83FB
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 01:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F22053BF0DC
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 23:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0AA2D876F;
	Thu,  3 Jul 2025 23:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Lnr1s1kA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5631FDA89;
	Thu,  3 Jul 2025 23:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751583991; cv=none; b=SHZJMHADVd4uIXy8MuQQLcXK+WFf5nce73BSGTbiAd7XsZe0ddafJo0CSVZXinyMCVL0qzoo5RkFlPPGlUhP5WizClUpWubfBeIHHLdsPkwdE3JsBTqFz44kGV0hdhgJ+VPje2AiG1ue0naE7zVOlsJXsarFKPnvWvQoC9T2nIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751583991; c=relaxed/simple;
	bh=/ajfnkWaRbkGkBvx9GENS+5QVl5WLXHuFNUWQUSfTNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYlc/YzyUbTkPq5IYm+Zp5Sl3WrCvUSdGnV2VCE0N8i0TaRQoJqs3VG6cTvUbVem2q3Uowdmbxl66p7JGqEMRbeM7NMkPbuspyuMdYZKPPHTiOiOHu7zgwG6SLsaMi9az7carrhghWS1riGaoVAyYr3oT5bMnDUzZWZN1gXcS4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Lnr1s1kA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A82C9669;
	Fri,  4 Jul 2025 01:06:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751583964;
	bh=/ajfnkWaRbkGkBvx9GENS+5QVl5WLXHuFNUWQUSfTNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lnr1s1kA6wQIS7pmg5MAKg2cPzyAfqL0rzX1TuknSV0moj8iSivUxsHX46TkTX6K6
	 qeEzCUQZH3bu4N+JlcviOGA8ibwibca+SyvYcI0b++GagFYNiUAu+A4P9D2DmGG30/
	 PhnrEiWPM6IexfAQGmv6UazCszYr8e/LrWzIkeP4=
Date: Fri, 4 Jul 2025 02:06:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 02/11] media: adv7180: Add missing lock in suspend
 callback
Message-ID: <20250703230601.GG16835@pendragon.ideasonboard.com>
References: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
 <20250703205223.2810806-3-niklas.soderlund+renesas@ragnatech.se>
 <20250703224326.GD3798@pendragon.ideasonboard.com>
 <20250703225139.GC3900914@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703225139.GC3900914@ragnatech.se>

On Fri, Jul 04, 2025 at 12:51:39AM +0200, Niklas Söderlund wrote:
> On 2025-07-04 01:43:26 +0300, Laurent Pinchart wrote:
> > On Thu, Jul 03, 2025 at 10:52:14PM +0200, Niklas Söderlund wrote:
> > > The adv7180_set_power() utilizes adv7180_write() which in turn requires
> > > the state mutex to be held, take it before calling adv7180_set_power()
> > > to avoid tripping a lockdep_assert_held().
> > > 
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > >  drivers/media/i2c/adv7180.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> > > index 2519bc53333c..0c5511a7667d 100644
> > > --- a/drivers/media/i2c/adv7180.c
> > > +++ b/drivers/media/i2c/adv7180.c
> > > @@ -1565,6 +1565,8 @@ static int adv7180_suspend(struct device *dev)
> > >  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > >  	struct adv7180_state *state = to_state(sd);
> > >  
> > > +	guard(mutex)(&state->mutex);
> > > +
> > >  	return adv7180_set_power(state, false);
> > 
> > Doesn't adv7180_resume() suffer from the same issue ? And how about
> > adv7180_set_pad_format() ?
> 
> They do. But they will be fixed / reworked in later commits in the 
> series. So it seems a but of churn to add a guard in this commit only to 
> remove it later ;-)

It's a small churn :-) It would make the patch less confusing.

> > >  }
> > >  

-- 
Regards,

Laurent Pinchart

