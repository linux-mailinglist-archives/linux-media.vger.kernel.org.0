Return-Path: <linux-media+bounces-11247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F35C8C1745
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 22:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C070C1C21880
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 20:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD4E12C46D;
	Thu,  9 May 2024 20:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jNf+Cg/Q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3C616F8E9;
	Thu,  9 May 2024 20:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715285062; cv=none; b=UYPf+IUOPEAT9x8LcoxzSKcV3IcXTSzMwKxZVnmUL91rZjO7l/7a8kriCHKwdFzkog6bG/7Ccdh42EUu2wrFL0NkafmeH4jTuBtR4cm4jpwbt9M+OjEX/5vShEmYoqOh100d8bOMr0VeFLdjEplEJKIfXv6+KMrbNiGTzRnuMWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715285062; c=relaxed/simple;
	bh=e7lkbL17JFBkXnmrsWxmCdGFxL1hWtBjFhCz2AmDR8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODSQ21enj0tDnv1TeGth0RT5tkxOUuINHQPqqyAEFhBj+UIjbobCmHzhK5vCbtOdEaqhDGpYyqxDvrpOZZ3qiS7Efpvls7b9LHMks/hH4MDgN50KqAdcq7xwIW8GDJdT4CSYzoGJunfdM03JHstURD3Qm0Tms4zMISw4HSFbEek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jNf+Cg/Q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1CC2904;
	Thu,  9 May 2024 22:04:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715285055;
	bh=e7lkbL17JFBkXnmrsWxmCdGFxL1hWtBjFhCz2AmDR8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jNf+Cg/QI9vnCYnFZVb+7XiY/uPBpcyzb1T0SpPUgQM2TRuGcedv6kjwryE2ina5S
	 BMuL/er0UhAn/4bFUpCX1hdj3B4yk1YKgIXkfTkKTtK9yo7yW9MCfZe25UQj7HduwB
	 DrhhW2D1gqLxejn0hKudNIXYZehq9d0E1VdXabwo=
Date: Thu, 9 May 2024 23:04:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 1/3] media: v4l2-subdev: Fix
 v4l2_subdev_state_get_format() documentation
Message-ID: <20240509200410.GA6407@pendragon.ideasonboard.com>
References: <20240508214045.24716-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240508214045.24716-2-laurent.pinchart+renesas@ideasonboard.com>
 <Zj0WFQo0cHReRCcU@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zj0WFQo0cHReRCcU@valkosipuli.retiisi.eu>

On Thu, May 09, 2024 at 06:29:41PM +0000, Sakari Ailus wrote:
> On Thu, May 09, 2024 at 12:40:43AM +0300, Laurent Pinchart wrote:
> > The documentation of the v4l2_subdev_state_get_format() macro
> > incorrectly references __v4l2_subdev_state_get_format() instead of
> > __v4l2_subdev_state_gen_call(). Fix it, and also update the list of
> > similar macros to add the missing v4l2_subdev_state_get_interval().
> > 
> > Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  include/media/v4l2-subdev.h | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index e30c463d90e5..b25b6e97ecbd 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1340,12 +1340,12 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
> >   */
> >  /*
> >   * Wrap v4l2_subdev_state_get_format(), allowing the function to be called with
> > - * two or three arguments. The purpose of the __v4l2_subdev_state_get_format()
> > + * two or three arguments. The purpose of the __v4l2_subdev_state_gen_call()
> >   * macro below is to come up with the name of the function or macro to call,
> 
> You could drop "below" here, too: the macro definition is above the text.

I think "below" here refers to "usage below". I'll drop it nonetheless.

> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks.

> >   * using the last two arguments (_stream and _pad). The selected function or
> >   * macro is then called using the arguments specified by the caller. A similar
> > - * arrangement is used for v4l2_subdev_state_crop() and
> > - * v4l2_subdev_state_compose() below.
> > + * arrangement is used for v4l2_subdev_state_crop(), v4l2_subdev_state_compose()
> > + * and v4l2_subdev_state_get_interval() below.
> >   */
> >  #define v4l2_subdev_state_get_format(state, pad, ...)			\
> >  	__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\

-- 
Regards,

Laurent Pinchart

