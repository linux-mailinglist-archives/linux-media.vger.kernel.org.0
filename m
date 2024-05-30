Return-Path: <linux-media+bounces-12281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6888D528F
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 21:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D56121F24CF1
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 19:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162D74D8C0;
	Thu, 30 May 2024 19:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q1rob1t1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A1B12E6D
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 19:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717098338; cv=none; b=n9xD33OeHqps0uVdH1EOStn0mQPwjeQQuaR3lM01Z7nt4ldpMsxPuENG7bzAxhr1Q1i1pmgo+RY7ZJamKgDBpBVvRA6t0lXGWIJUeAq3boAmcN5MtMvJkODgOx+o8GMwrKPNasfEVET7IcgjxY/ob8Cg9MlTyFID/3Q3HyEzeAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717098338; c=relaxed/simple;
	bh=Py4kZFR6qa7MkI2lydyCw9v5jFm7lV3MMGAYeR1cq2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igE+/0J0SAwDlnXzbCZnML+UYEm087m5l6xXUYFpuiivQrIYJf6GjXDI3MydrUeO5znRQbYe9421vVIJWfoskOFxBboI5Gl2SxFdvI7pgtAY4Q5V0icCNpflO5h6/fQwbQrnG7KQo9eM3kOoG8c4plLeTktHY3JIFMw+Z69zVgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=q1rob1t1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B27066B;
	Thu, 30 May 2024 21:45:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717098324;
	bh=Py4kZFR6qa7MkI2lydyCw9v5jFm7lV3MMGAYeR1cq2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q1rob1t107HCCR+KwvWAxxPA8KyUu2E/VLAHhMKHeNBPrUWVs46uGSGxNtJLfdyVn
	 y7aJM7g8B9IBU1TlpGtlNKEm+mMiUYFUet6AIpbTiPToQsymqM0Wd3DnHdON5oz2+N
	 rlbs/UwAyU8J6hYtwaoJy9PwbmBrcH6RZxYOyD2g=
Date: Thu, 30 May 2024 22:45:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v1 1/9] media: vimc: Don't iterate over single pad
Message-ID: <20240530194515.GA28160@pendragon.ideasonboard.com>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
 <20240424235741.17093-2-laurent.pinchart@ideasonboard.com>
 <bad644d0-f139-4df4-bac8-e64cc8e8324c@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bad644d0-f139-4df4-bac8-e64cc8e8324c@linuxfoundation.org>

Hi Shuah,

On Thu, May 30, 2024 at 01:27:53PM -0600, Shuah Khan wrote:
> On 4/24/24 17:57, Laurent Pinchart wrote:
> > The .init_state() operations of the debayer and sensor entities iterate
> > over the entity's pads. In practice, the iteration covers a single pad
> > only. Access the pad directly and remove the loops.
> 
> I am not seeing much of a reason to do this. This code is good
> even when num_pads change.
> 
> Don't change the loops.

Why so ? Beside the fact that the loop wastes some CPU cycles, the
current code implies that there would be multiple source pads, which is
confusing for the reader. I think the result of this patch is both
improved efficiency and improved readability.

> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >   drivers/media/test-drivers/vimc/vimc-debayer.c |  9 +++------
> >   drivers/media/test-drivers/vimc/vimc-sensor.c  | 10 +++-------
> >   2 files changed, 6 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
> > index d72ed086e00b..e1bf6db73050 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-debayer.c
> > +++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
> > @@ -155,16 +155,13 @@ static int vimc_debayer_init_state(struct v4l2_subdev *sd,
> >   {
> >   	struct vimc_debayer_device *vdebayer = v4l2_get_subdevdata(sd);
> >   	struct v4l2_mbus_framefmt *mf;
> > -	unsigned int i;
> >   
> >   	mf = v4l2_subdev_state_get_format(sd_state, 0);
> >   	*mf = sink_fmt_default;
> >   
> > -	for (i = 1; i < sd->entity.num_pads; i++) {
> > -		mf = v4l2_subdev_state_get_format(sd_state, i);
> > -		*mf = sink_fmt_default;
> > -		mf->code = vdebayer->src_code;
> > -	}
> > +	mf = v4l2_subdev_state_get_format(sd_state, 1);
> > +	*mf = sink_fmt_default;
> > +	mf->code = vdebayer->src_code;
> >   
> >   	return 0;
> >   }
> > diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
> > index 5e34b1aed95e..b535b3ffecff 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-sensor.c
> > +++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
> > @@ -44,14 +44,10 @@ static const struct v4l2_mbus_framefmt fmt_default = {
> >   static int vimc_sensor_init_state(struct v4l2_subdev *sd,
> >   				  struct v4l2_subdev_state *sd_state)
> >   {
> > -	unsigned int i;
> > +	struct v4l2_mbus_framefmt *mf;
> >   
> > -	for (i = 0; i < sd->entity.num_pads; i++) {
> > -		struct v4l2_mbus_framefmt *mf;
> > -
> > -		mf = v4l2_subdev_state_get_format(sd_state, i);
> > -		*mf = fmt_default;
> > -	}
> > +	mf = v4l2_subdev_state_get_format(sd_state, 0);
> > +	*mf = fmt_default;
> >   
> >   	return 0;
> >   }

-- 
Regards,

Laurent Pinchart

