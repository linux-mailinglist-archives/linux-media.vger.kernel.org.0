Return-Path: <linux-media+bounces-20443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 957019B37B1
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 18:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7FD11C21CB5
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 17:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24B01DF27F;
	Mon, 28 Oct 2024 17:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRi6v2AW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24741DF251;
	Mon, 28 Oct 2024 17:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730136759; cv=none; b=tW1oioB0k7SIp+hmcB0EQbsKZPmDk0Wj3zWKy3ya4aTHIs8+bPACwxsA9kqyYpFBw2ltGhPMzKv6uCrwVf3VTHZhh3RteApoiODYQE5YjYwR/rLxoaHEYoV/sZCEsF52n9ZChqzduFh4lspmNfOp7C4Q8CBEPlY1hDKIOY15dco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730136759; c=relaxed/simple;
	bh=ovhTjd8e0XI25whd5UTTdMSx258AGClEYaqz4D6Ch4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQOpkNC1MFWwG+yBR/AgOtisDgk9LvL5XTSNf5HCRGyVcTyvgBzNGqum8GxRjIgehcDb9lfnK7jsluu7ht1YzTmlDDWy8w2LTySfOTCa+uuH/Vqpi4h4v64HO7jOMJGx2VCow5v0MBfQYurW99j9U/Xj6jVslUospRA+8TnTfIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRi6v2AW; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e13375d3so5178352e87.3;
        Mon, 28 Oct 2024 10:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730136755; x=1730741555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mj2liF4nx7VZnKh8QeIkwojRqh8+MN+fPrkECh/R5qw=;
        b=PRi6v2AWKBNjfuvHKQZgSn4rwYlEBKFCsSdTVGEBbjRDKioYs6z3cAwR4q5mDt9qIJ
         MA0EhKEP//9ZhqTsae3JIVwDoPWAnzLz0xnfXYvD8A3xz3ysXoqdjD2LBiYTGAGVs9Z7
         P8M7nfnuZNAJ/315dDAP57AJEx1+ON3n9jCuTMaB1CmNWAbY7uuH7m4rhBmVhG9jbAET
         eKFmIBJv7CqUo4ddpUrmNctq3vNZ52Qd1E4qL+8ZUKWUUkHQ9GHvb6a5H5PrQVMX1eCa
         srbZlN161ZgQcS/dAmmaL7h/w35cHaXc2hmQ23KItyy5d/IXv5qrVAiCuVc4p71eLFkN
         gzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730136755; x=1730741555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mj2liF4nx7VZnKh8QeIkwojRqh8+MN+fPrkECh/R5qw=;
        b=MupSHUwCAKsbhk83UmsoxBClpD3qKChIRbcfjeqyd5Q2ALGN3r+iZgnyeMUfVG5bNe
         NCTBSRdMEC245032EM93dUX0kw+RD9S5srBMYVxvzDMC/x+RzuSULtiuDbH69Cv4nWX0
         L1CHyhhyEQNvflPCxTzv2MYN8TjzNIjefq1w1neycFHmgqTcIZfw2KrVvnRwcyFHIvMA
         cDTYNv7ygsd8MbDV9aANU87RphiGJQzzrNeAbay0JVOVsbKULiRTwm4QcyJUm+mFtrV6
         obLsTzuNL1rAAS7ZaerCfrqn3BSgLznTy9d/yZBxydPTk0+BrL/sCFx5YxZowbpUk24R
         v6eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJFaeak237j+E4KFMMDD5BDcvlk/XTPwbrFzORQNaTk6mBzX6ymPsDJ4sXR6hj7s+7Hl3icIk8rxy2AOA=@vger.kernel.org, AJvYcCXIDLkWK4ba5x612Qp/7xWDT8SV3MvzVVkP+5w/PyFwzWH6fO0soLfaaCW/pWnkT03EZj8cs7ljpFl7LHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6PnCER0ofGCmZAmO2c9siSfXMtTKAqDnRf6HWG0FtORvRvHcj
	YOjyJVDIRXZmh14/8hY9WGOOdHPd05VHKC9vIPIewyph6VeV2ZTj
X-Google-Smtp-Source: AGHT+IFV+6aSOEl6abiaqOBxdAUIdLFxGz+OaTJw++DV3keSeb3siTfJAxm04D1j03mDh3moa6Uu8g==
X-Received: by 2002:a05:6512:1310:b0:535:d4e6:14e2 with SMTP id 2adb3069b0e04-53b348f1399mr4327085e87.36.1730136754512;
        Mon, 28 Oct 2024 10:32:34 -0700 (PDT)
Received: from tom-desktop (net-188-217-53-167.cust.vodafonedsl.it. [188.217.53.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bddbsm10079036f8f.27.2024.10.28.10.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:32:34 -0700 (PDT)
Date: Mon, 28 Oct 2024 18:32:32 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: sakari.ailus@linux.intel.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-subdev: Refactor events
Message-ID: <Zx/KsKBtVBWfziXo@tom-desktop>
References: <20241020163534.1720297-1-tomm.merciai@gmail.com>
 <20241020164354.GG7770@pendragon.ideasonboard.com>
 <ZxX2SVl/p0i7Nemi@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20241021073034.GC14328@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021073034.GC14328@pendragon.ideasonboard.com>

Hi Laurent, Sakari,

Sorry for the delay.
Back on this topic.

On Mon, Oct 21, 2024 at 10:30:34AM +0300, Laurent Pinchart wrote:
> On Mon, Oct 21, 2024 at 08:35:53AM +0200, Tommaso Merciai wrote:
> > Hi Laurent,
> > Thanks for your review.
> > 
> > On Sun, Oct 20, 2024 at 07:43:54PM +0300, Laurent Pinchart wrote:
> > > Hi Tommaso,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Sun, Oct 20, 2024 at 06:35:32PM +0200, Tommaso Merciai wrote:
> > > > Controls can be exposed to userspace via a v4l-subdevX device, and
> > > > userspace has to be able to subscribe to control events so that it is
> > > > notified when the control changes value.
> > > > If a control handler is set for the subdev then set the HAS_EVENTS
> > > > flag automatically into v4l2_subdev_init_finalize() and use
> > > > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> > > > as default if subdev don't have .(un)subscribe control operations.
> > > 
> > > I would add here
> > > 
> > > This simplifies subdev drivers by avoiding the need to set the
> > > V4L2_SUBDEV_FL_HAS_EVENTS flag and plug the event handlers, and ensures
> > > consistency of the API exposed to userspace.
> > > 
> > > And you can also add
> > > 
> > > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > 
> > > > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > > 
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Oks, Thanks again.
> > 
> > > Now, can we simplify sensor drivers to drop the event handlers and the
> > > flag ? :-)
> > 
> > Yep, plan is add all to support v4l2_subdev_init_finalize()
> > Removing:
> > 
> >  .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> >  .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > 
> > if are used. And ofc V4L2_SUBDEV_FL_HAS_EVENTS.
> 
> What I meant is looking at the I2C sensor drivers that currently
> 
> - call v4l2_subdev_init_finalize()
> - set V4L2_SUBDEV_FL_HAS_EVENTS
> - set the .subscribe_event() and .unsubscribe_event() handlers
> 
> and dropping the flag and handlers from them. Is that what you plan to
> work on ?

It's ok for you per/driver patch or you prefer a big single patch?

Meanwhile I've prepared something here:

https://gitlab.freedesktop.org/linux-media/users/tmerciai/-/compare/next...v6.12.0-rc1-nxp?from_project_id=22111

Let me know if you prefer (un)squashed version.
Thanks in advance. :)

Thanks & Regards,
Tommaso

> 
> > Meanwhile I think I will send v3 with your
> > suggestions. :)
> > 
> > > > ---
> > > > Changes since v1:
> > > >  - Aligned event subscription with unsubscription as suggested by LPinchart,
> > > >    SAilus
> > > > 
> > > >  drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++++++++++--
> > > >  1 file changed, 20 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > index 3a4ba08810d2..fad8fa1f63e8 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > @@ -691,10 +691,25 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > > >  		return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
> > > >  
> > > >  	case VIDIOC_SUBSCRIBE_EVENT:
> > > > -		return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
> > > > +		if (v4l2_subdev_has_op(sd, core, subscribe_event))
> > > > +			return v4l2_subdev_call(sd, core, subscribe_event,
> > > > +						vfh, arg);
> > > > +
> > > > +		if ((sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
> > > > +		    vfh->ctrl_handler)
> > > > +			return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
> > > > +
> > > > +		return -ENOIOCTLCMD;
> > > >  
> > > >  	case VIDIOC_UNSUBSCRIBE_EVENT:
> > > > -		return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
> > > > +		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> > > > +			return v4l2_subdev_call(sd, core, unsubscribe_event,
> > > > +						vfh, arg);
> > > > +
> > > > +		if (sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS)
> > > > +			return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
> > > > +
> > > > +		return -ENOIOCTLCMD;
> > > >  
> > > >  #ifdef CONFIG_VIDEO_ADV_DEBUG
> > > >  	case VIDIOC_DBG_G_REGISTER:
> > > > @@ -1641,6 +1656,9 @@ int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
> > > >  		}
> > > >  	}
> > > >  
> > > > +	if (sd->ctrl_handler)
> > > > +		sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
> > > > +
> > > >  	state = __v4l2_subdev_state_alloc(sd, name, key);
> > > >  	if (IS_ERR(state))
> > > >  		return PTR_ERR(state);
> 
> -- 
> Regards,
> 
> Laurent Pinchart

