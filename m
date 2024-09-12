Return-Path: <linux-media+bounces-18191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 291F2976736
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 13:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D54A01F23E41
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 11:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA1C1A0BD5;
	Thu, 12 Sep 2024 11:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSfBPxow"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9986318E043;
	Thu, 12 Sep 2024 11:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726139480; cv=none; b=t3wxRJAtTWMtJH8llp7R9bPLj4PoClmUWlB5/d95HD9UA27PlTvqlIvCrSNYAxXOcio5EiR32ACWj2FaxTURyW3cWtqc4clc+fU7t1B4sVaeR08jrn5+mtsybOJBDww/j8DpwEDw39IL5TtUWFx+9JtwQkisVA+j/eAcJF1wkrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726139480; c=relaxed/simple;
	bh=m3Xyn/8ZS+zTxpOr89U1fMdhubbijqdam36gFhcr7So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHtzqifZjeUsYzw4Dw0ymQH1I0MuXQS0TpuoXEI05GJYLeoZSYJG4JPT2ohwCldBlx8QwK4dcDcxCDB9mplUvIfaX9nLq7a2NxYAN4VGNzkoBKtllYVgYAAFu2AuN2I3FNPIn+jXswkfQmPMQOJZ1XXSEvA2v6+QeQ3Ui7xP5YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSfBPxow; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8d2b24b7a8so367021566b.1;
        Thu, 12 Sep 2024 04:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726139477; x=1726744277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ysr1tTQ+NR5cX2Cq4HdlMqiAfbbcfrTBI5MQi4YwZQ=;
        b=hSfBPxowVAkqXv1oXHVPLX8lQGRwP+ChM80dOTf4ORPvBwTEGl3Xd4RpGLjtemofme
         iycFohZsWMmt5Armed3RNFftAHPhN1qOlFYAqD+AHM9hAxuoKuI9/EspfVSU5ghfukBU
         WD8DZIQtHtaX0Fxxdalcjg2nuhdS7fYy3tjA+822WwNuLhf1BE8+L5XRGYE3adK+xvPg
         gvZBjxmjb4WHwNAJbUdqGwYBaQL4kOYOj8I9An4IRPNsZtTJjSmSBP4+97C8OQVYJznx
         KDFKR2ci4UqKQqeOQYdSM9wS/DQgycoY2eS9KuaqHSmCauhES7rXMYNPmZepKaNfo55N
         JKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726139477; x=1726744277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ysr1tTQ+NR5cX2Cq4HdlMqiAfbbcfrTBI5MQi4YwZQ=;
        b=UyidIck7xRmpVZgv6fvYwYgDAHFNzALq4b/8Huev2tFml6dX05ku1RQ/ctx17aOSsh
         J3YV+gfoImF17GMuJ11KFPMeZkkluMTg1o0+NC+9VEG/yErnZn7Mlm2uZtbNRKV4ITIe
         zAXZXy0WWYI4zr6geeGWD+AKo5cImYiBqXv8ejmu3jZgoduDVmIvjMnRqL/e5Y0ZsCPD
         i5jU29C4kKFkmdO8aLhRIaPJrBIXADcdpImRSRRGeIYDfQ3rC7y8jSHBaSG57vy/m/M4
         Ca3/ct80Qz91Os2tLYpUHq+JnFBm1sa4XYcfubbkFZUNvtEQzDae4KJmVkHRKwZTqCA/
         HZ/w==
X-Forwarded-Encrypted: i=1; AJvYcCU4yBwgj6GEaYKpXpzQhE4kcNCe/oxBb73jjA7POn48PfKho9fY8gIu87LkT7DkUVLqhZJbEuqNm1vYFhA=@vger.kernel.org, AJvYcCX6/Hb86zFiz4iR19XuTzA4C4fyFwqRtarYemd5jp1ll5MBgtRGUVcO/EmRJpukcQxH7y8vcLIgTp9KM2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnaY0VzbPMeIKfTdqDy+Fq64ISnr+ELF0GxpkMU4V3F7ReGyEQ
	YlRJFK9mMRvxlqe9zEhG6kgi1KCKQOjFEbZKLvgY0LRro4zx00im
X-Google-Smtp-Source: AGHT+IF3jiQA5KFfOParTbNwMjFosQ5FM0KbFd1M5zS7hv6QhWapPzmadlkhusgXhNA0EchoBqOANQ==
X-Received: by 2002:a17:907:9626:b0:a72:5967:b34 with SMTP id a640c23a62f3a-a902a8c2779mr242250066b.22.1726139476131;
        Thu, 12 Sep 2024 04:11:16 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-48-58.cust.vodafonedsl.it. [188.217.48.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25ced18csm728705066b.161.2024.09.12.04.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 04:11:15 -0700 (PDT)
Date: Thu, 12 Sep 2024 13:11:13 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linuxfancy@googlegroups.com, sakari.ailus@linux.intel.com,
	julien.massot@collabora.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: max96714: add HAS_EVENTS subdev flag
Message-ID: <ZuLMUaxn/oTw5dco@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20240910134428.795273-1-tomm.merciai@gmail.com>
 <20240910134428.795273-2-tomm.merciai@gmail.com>
 <20240912104409.GA25276@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912104409.GA25276@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Sep 12, 2024 at 01:44:09PM +0300, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> On Tue, Sep 10, 2024 at 03:44:27PM +0200, Tommaso Merciai wrote:
> > Controls can be exposed to userspace via a v4l-subdevX device, and
> > userspace has to be able to subscribe to control events so that it is
> > notified when the control changes value. Add missing HAS_EVENTS flag.
> 
> How is this supposed to work, given that the driver doesn't implement
> .subscribe_event() ?

You are completely right, sorry.
I think in both cases I'm missing:

diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
index 94b1bc000e48..2257b6b807ea 100644
--- a/drivers/media/i2c/max96714.c
+++ b/drivers/media/i2c/max96714.c
@@ -17,6 +17,7 @@

 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>

@@ -488,6 +489,8 @@ static int max96714_log_status(struct v4l2_subdev *sd)

 static const struct v4l2_subdev_core_ops max96714_subdev_core_ops = {
        .log_status = max96714_log_status,
+       .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+       .unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };

 static const struct v4l2_subdev_video_ops max96714_video_ops = {

Like you suggest. Or I'm wrong?

Thanks & Regards,
Tommaso

> 
> > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > ---
> >  drivers/media/i2c/max96714.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
> > index 159753b13777..94b1bc000e48 100644
> > --- a/drivers/media/i2c/max96714.c
> > +++ b/drivers/media/i2c/max96714.c
> > @@ -602,7 +602,8 @@ static int max96714_create_subdev(struct max96714_priv *priv)
> >  		goto err_free_ctrl;
> >  	}
> >  
> > -	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
> > +	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > +			  V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
> >  	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> >  	priv->sd.entity.ops = &max96714_entity_ops;
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

