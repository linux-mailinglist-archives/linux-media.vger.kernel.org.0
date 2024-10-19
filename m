Return-Path: <linux-media+bounces-19921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B379A5130
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 00:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 022DE284091
	for <lists+linux-media@lfdr.de>; Sat, 19 Oct 2024 22:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55C3192B61;
	Sat, 19 Oct 2024 22:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="miJoMlMf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160F713C816;
	Sat, 19 Oct 2024 22:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729375646; cv=none; b=C5GeoMbJ5RSEZ22Qy5hV/fU1Bz7dDeSjssd/UKRyfWlgzgcyulGNhLEJKudjAMqUysmx4zVhPD12ThPf4tDkxKxHO9yqMwXNdd6q0XZeCM8D1VxInUY0ic6rTxUWYX4ZK1CHw0EwgIJiUZBGqC7CxRga3wavCTIV31nYBIgCNN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729375646; c=relaxed/simple;
	bh=0LUTZqUipEXL14ilbJk6721G/0g/yF0ZGfCWetGB1W4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwnPRENaJEp07VLDJEyblAN0gfpNkKUSYr+kScPiFznIhaOJIi71otyQl9bpj5fl+CWwCR7te46lHr8VPrGJN3/jY4WVldjhahz1pFXp9uBBG5muJ6tNCek32EMwJ6yMynV5gdwekkDf7qRk4rZ/kuyJVxTAV6hLN9AKZNAFBHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=miJoMlMf; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9a0f198d38so439124966b.1;
        Sat, 19 Oct 2024 15:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729375642; x=1729980442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ohj4wBioIhDNTozf+32bPov1V5/3rrHwgVYb++NtFDk=;
        b=miJoMlMfsnnown8R6z+epkH0IXduAXLz7A4KYp24fyHcqXw7psy4Hnkb3bZyyl/l+X
         vqzt2jFa39CRpmxnIYG95E9Wq9b7KVbwLfF9b4c+a3hT7c+oXFufpoKqD4TAPAyLisGh
         xWZhDhJ82k7iBl/nXh1Z7BnKVPrAO250vFIfcD0Z2Adae5eRGNllFA3O7Nj3pUQhy/dU
         0a+nHn8Yb4j39aXciF18PoSCq17jkAec+UupmgL7UHecqTewe24ep7y8oQDYmBVvtaSl
         /ngI2z19+uoBrZoMZJtFxBug8w81Ba+eSScnamXS8FU8Ad07vUOAqIlwuJfySBSlrrwE
         3wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729375642; x=1729980442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ohj4wBioIhDNTozf+32bPov1V5/3rrHwgVYb++NtFDk=;
        b=ZEtVCXJpK3kfp43+KY0hlLeZnz0/3iLP/nDcPtvK9CGzQHZIosdyDgdNBU1gWABQEp
         t9d2Fku1GD5gBb7KGPw0qAtgxg4Vl7Z9g41pKtezqrbBaA/0xn/I9M98XUUA2Bx0HDLF
         E+ZXZrTQaQUeqNgr51TYpggukRMHEvKgpt1+vCx5XnAbyYuYlHRJt1SVZxhfn3NFzBKK
         xQqK/DYyxf+js1wWU3BB/fVT8Ks8VQ0vHtUI/G17zLe2PfIxaGO4eNpz+bQNHt5GrBi+
         ml1bYWD8RsYssee37wnu1nhUw7qqd2St5RVrUyQiqnLzpKAi3/si7R2Kse7tVcsTooG3
         qdeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGoCAmd+jb8r+7hG/VvVyt1nLvFt5STe/X8GKjsXUdWV/2XrBHk4yPfA/goXP9UtX2htimw9YmnNdPDqE=@vger.kernel.org, AJvYcCXhckdwrlDFkykq3mR3GqOTkiAPI4GbzFlj4zn5lO8aVD60vQEBjsq5cFSBui6oIVbZYJBaOYup0w6pHDI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJsTHZQLrveSufC0jcaO4j3wdyaJSEBqJr96CgZxhsExaBLEZk
	ghYFO/KKT2qt2kFGqxd6cZnIPBjfiYyX1ZBxPFl7FGAuIk0XRjmaBuT7Tw==
X-Google-Smtp-Source: AGHT+IFSyRepdvilXBxT3R+fRt5ciE419Oga/5nfiIh3Vtb3V9YWSon+b0afFdmKHLadj2rwrsf17Q==
X-Received: by 2002:a17:907:728b:b0:a99:e5d5:5654 with SMTP id a640c23a62f3a-a9a69773f30mr722364466b.6.1729375642097;
        Sat, 19 Oct 2024 15:07:22 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-51-176.cust.vodafonedsl.it. [188.217.51.176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912f62cbsm23855166b.76.2024.10.19.15.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 15:07:21 -0700 (PDT)
Date: Sun, 20 Oct 2024 00:07:19 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: laurent.pinchart@ideasonboard.com, prabhakar.csengg@gmail.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: Refactor events
Message-ID: <ZxQtlwVZ9JfIM8tl@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20241018171104.1624426-1-tomm.merciai@gmail.com>
 <ZxK3VsNdFjULfRxK@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxK3VsNdFjULfRxK@kekkonen.localdomain>

Hi Sakari,

On Fri, Oct 18, 2024 at 07:30:30PM +0000, Sakari Ailus wrote:
> Hi Tommaso,
> 
> Thanks for working on this.

In real it's a Laurent's suggestion :)

> 
> On Fri, Oct 18, 2024 at 07:11:03PM +0200, Tommaso Merciai wrote:
> > Controls can be exposed to userspace via a v4l-subdevX device, and
> > userspace has to be able to subscribe to control events so that it is
> > notified when the control changes value.
> > If a control handler is set for the subdev then set the HAS_EVENTS
> > flag automatically into v4l2_subdev_init_finalize() and use
> > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> > as default if subdev don't have .(un)subscribe control operations.
> > 
> > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++++++++++--
> >  1 file changed, 20 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 3a4ba08810d2..77ca829b9983 100644
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
> > +		     vfh->ctrl_handler)
> > +			return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
> > +
> > +		return -ENOIOCTLCMD;
> 
> While this mostly does the same thing, I prefer the order of tests below.
> Could you align event subscription with unsubscription?

What about:

	case VIDIOC_SUBSCRIBE_EVENT:
		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
			return -ENOIOCTLCMD;

		if (v4l2_subdev_has_op(sd, core, subscribe_event))
			return v4l2_subdev_call(sd, core, subscribe_event,
						vfh, arg);

		if (!vfh->ctrl_handler)
			return -ENOTTY;

		return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);

	case VIDIOC_UNSUBSCRIBE_EVENT:
		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
			return -ENOIOCTLCMD;

		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
			return v4l2_subdev_call(sd, core, unsubscribe_event,
						vfh, arg);

		return v4l2_event_subdev_unsubscribe(sd, vfh, arg);

?

Thanks & Regards,
Tommaso

> 
> >  
> >  	case VIDIOC_UNSUBSCRIBE_EVENT:
> > -		return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
> > +		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
> > +			return -ENOIOCTLCMD;
> > +
> > +		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> > +			return v4l2_subdev_call(sd, core, unsubscribe_event,
> > +						vfh, arg);
> > +
> > +		return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
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
> Kind regards,
> 
> Sakari Ailus

