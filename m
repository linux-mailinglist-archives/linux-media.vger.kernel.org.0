Return-Path: <linux-media+bounces-19949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0369A5A79
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 08:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0048B227F0
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 06:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304631D04BB;
	Mon, 21 Oct 2024 06:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glccYX24"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1C119925B;
	Mon, 21 Oct 2024 06:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729492560; cv=none; b=li31XaYBdCW6FVOb94kZ73JfaemK4rtaH5M5Y9aQDwgshjoCfaHzR657tZnPKI9OLUQ3rFy2oqlD1kOP3vOeS9lepWZhfChvC5jMsw3uuD3okMYeWN0T89zMonXxmszqi6cjx+OSZme+xyzFnIm4ZBhpZdaaJpQVFsdX+XlVxr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729492560; c=relaxed/simple;
	bh=OPJG7Ecza/KsVBHcd9BJsZuQlbRTDX5i78on73TbsTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0WgaRtUYzF9MbnDolJCRtlxM9ZLEzvpe6fY+uyySpLmdeCX2a7Fcd6VZRK78VztJmmqBGVljOoY3c7AWaJ7OMi/0v/mdwJLlNN94VBmKrEEnt/yc9iQOz2RevQkHovHcfKGL89H81P/UWFN8fEb6TT7Ye20+GBdBF0ks7rvDa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glccYX24; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539fb49c64aso5529721e87.0;
        Sun, 20 Oct 2024 23:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729492556; x=1730097356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W1pfGKavCZbHtdE4vu7K5bxv48Yu8nyPCZ1bbJN5rx0=;
        b=glccYX24LMc95uXB1nXJzhrBRlImOhxaIHyjNO90Eq37N4jWYXbBxyl4vW8vxE+fCc
         45yfM8jvKuT/QMRtrQSA1Z+Hr0cpr82bEjE30zrgYCepUvw16MPzAm8lxfiI9WB3BObW
         2X2whAXeJ/KxRHCkKMZmeoeNpV0b1h+2RF7pGskeDpC5yms62JZ9IibzFB5jiVzR96JB
         mk88ctomaySgiaxE/0wOqKglzweEte/fvn20HKx8l2NzMe9BiJMBEzhUQa8u288noOGR
         o1M6SiH4OvZassYETPANPF1FaBtmKiplSsoQvUUAA4LrzOI+FVeeEvW4pAuUSXrWgKfL
         M3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729492556; x=1730097356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1pfGKavCZbHtdE4vu7K5bxv48Yu8nyPCZ1bbJN5rx0=;
        b=Q/AHeZPku33g6q1arbQCyaAcH2Xcgj+TP4BioA/kpgTl2htH8DJQMAOopmSrzCEwj0
         XTV+fsfr5Yq8ruhMWK0c54ga2zv1xPmDe6B3CrhEnLhdKWJ174VLe7M+Y0U6fr/I9r1r
         uDpDe0xqYzPS8DyGpHuGXaJ1dGv5fV9jy5NLqYGR2mLStRQpzRbKR1BZe1bZakxkbBhT
         7jLAl7j9wUVS0We245U3diRNVUOnqU2qV6mkrqqlpv3dFj+sW9Of47OPw/AfJLxUAcps
         JiPE8uwRFC3eaJcGrqsWmbC3YDB5wdykP5mhKz+j75CoH3b9q9tomqZVkzqsHReiWYKE
         ZCJw==
X-Forwarded-Encrypted: i=1; AJvYcCU4Ytc1RJbDpjtUTozKVglN6bpNZj8pzrLkE9CF2e+38pvT/9J5Cf+Huuj497tMpGXvcqnUcpI3crsnRTw=@vger.kernel.org, AJvYcCXVyLbBMTaw/RZUgzdRWxC7XMiPlpMSZ0xJU2lMmHcTeBFrtHc7pkY+njlDBm5UrEc3Pf7JaSX/em8e/ks=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5oQYYJgjLuw0EWY5BY+8fB0VLNSXZM8B0Vs4kYXKCqBNImYMb
	5Udke2hRlnxvJbKiPzwArN0uNVuojn5uYUKCqyBN7juDg7Jj+NUQ
X-Google-Smtp-Source: AGHT+IG6vdlYxit/AdljTLepLeieV1E+odEU9nyRzPGkOJwrmOuaIKNo4TjVxmBjwH+2E3FU2wNTEQ==
X-Received: by 2002:a05:6512:1091:b0:539:94f5:bf with SMTP id 2adb3069b0e04-53a154eb367mr7864174e87.59.1729492556104;
        Sun, 20 Oct 2024 23:35:56 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-51-176.cust.vodafonedsl.it. [188.217.51.176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a915a114asm164164466b.222.2024.10.20.23.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 23:35:55 -0700 (PDT)
Date: Mon, 21 Oct 2024 08:35:53 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: sakari.ailus@linux.intel.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-subdev: Refactor events
Message-ID: <ZxX2SVl/p0i7Nemi@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20241020163534.1720297-1-tomm.merciai@gmail.com>
 <20241020164354.GG7770@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241020164354.GG7770@pendragon.ideasonboard.com>

Hi Laurent,
Thanks for your review.

On Sun, Oct 20, 2024 at 07:43:54PM +0300, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> Thank you for the patch.
> 
> On Sun, Oct 20, 2024 at 06:35:32PM +0200, Tommaso Merciai wrote:
> > Controls can be exposed to userspace via a v4l-subdevX device, and
> > userspace has to be able to subscribe to control events so that it is
> > notified when the control changes value.
> > If a control handler is set for the subdev then set the HAS_EVENTS
> > flag automatically into v4l2_subdev_init_finalize() and use
> > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> > as default if subdev don't have .(un)subscribe control operations.
> 
> I would add here
> 
> This simplifies subdev drivers by avoiding the need to set the
> V4L2_SUBDEV_FL_HAS_EVENTS flag and plug the event handlers, and ensures
> consistency of the API exposed to userspace.
> 
> And you can also add
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Oks, Thanks again.

> 
> Now, can we simplify sensor drivers to drop the event handlers and the
> flag ? :-)

Yep, plan is add all to support v4l2_subdev_init_finalize()
Removing:

 .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
 .unsubscribe_event = v4l2_event_subdev_unsubscribe,

if are used. And ofc V4L2_SUBDEV_FL_HAS_EVENTS.

Meanwhile I think I will send v3 with your
suggestions. :)

Thanks & Regards,
Tommaso

> 
> > ---
> > Changes since v1:
> >  - Aligned event subscription with unsubscription as suggested by LPinchart,
> >    SAilus
> > 
> >  drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++++++++++--
> >  1 file changed, 20 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 3a4ba08810d2..fad8fa1f63e8 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -691,10 +691,25 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  		return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
> >  
> >  	case VIDIOC_SUBSCRIBE_EVENT:
> > -		return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
> > +		if (v4l2_subdev_has_op(sd, core, subscribe_event))
> > +			return v4l2_subdev_call(sd, core, subscribe_event,
> > +						vfh, arg);
> > +
> > +		if ((sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
> > +		    vfh->ctrl_handler)
> > +			return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
> > +
> > +		return -ENOIOCTLCMD;
> >  
> >  	case VIDIOC_UNSUBSCRIBE_EVENT:
> > -		return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
> > +		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> > +			return v4l2_subdev_call(sd, core, unsubscribe_event,
> > +						vfh, arg);
> > +
> > +		if (sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS)
> > +			return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
> > +
> > +		return -ENOIOCTLCMD;
> >  
> >  #ifdef CONFIG_VIDEO_ADV_DEBUG
> >  	case VIDIOC_DBG_G_REGISTER:
> > @@ -1641,6 +1656,9 @@ int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
> >  		}
> >  	}
> >  
> > +	if (sd->ctrl_handler)
> > +		sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
> > +
> >  	state = __v4l2_subdev_state_alloc(sd, name, key);
> >  	if (IS_ERR(state))
> >  		return PTR_ERR(state);
> 
> -- 
> Regards,
> 
> Laurent Pinchart

