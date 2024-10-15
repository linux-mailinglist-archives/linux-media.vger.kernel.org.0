Return-Path: <linux-media+bounces-19641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6519699DE0B
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 08:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7ACB1F22DD0
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 06:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8164318991B;
	Tue, 15 Oct 2024 06:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JT9y5awk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DA01591EA;
	Tue, 15 Oct 2024 06:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728972983; cv=none; b=Ey9SHiq+RSfAEX8H+RaqK43oGTqi5JFVAzdF7RVP6iGenFIeSmWNDxGP6mpp1KHTW6pCUlXWxOsTb7CXbS/+o2VP7F5guNEj4Y7lGXAPnTFoB4zdiEgYDiZQ255eOugpkmSJGYoZEiJ+C2dWZ56Zc0mqjqNAbDsxQ9hRLmOShvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728972983; c=relaxed/simple;
	bh=ZlHhCGlulVeT/IfhfpRes5ZYNQIIDk4AdvMXoih0ql4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZu7fwu/VhF9SLGQE2wW73noFB1IJvNnutxh6VlaFeBOnEJh0Eynr+UssR8qkCqYQlpqswUWSonM3iYKZHrsSdEL26QX6XctEVnRvRrWA3JS2MAWbK4tinoY+H4HpYIiHrAFFHlWLXhG+AUIqnL1sKt/QJY2Z6bvr1J1y9f8NrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JT9y5awk; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d461162b8so3293469f8f.1;
        Mon, 14 Oct 2024 23:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728972976; x=1729577776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jbF6lZf6Y3cFo/FJEKPYC02XHoVdgFNRcp1kazpDm0U=;
        b=JT9y5awk8JmyQnSAFdUvx/ZYrpB6I/GmB+RONCdBSB/V4TRXmCWYZHI6PTRow/vKbo
         r61Mb8Pm+YPwl3AZG7IzdKgN19UYK2eEFbEdnj56i2SMRVCqfgbBmbECTEsBCTaPNlKZ
         9FHyT0G1ALAbf3/t/NDqmhEsXArcGGrHICE39/72ePqzqMnTzvWR7LSZIZ2Rkeic0Hbb
         k7xQqi2LWyqCW2CutcEeaJq38XA1Sj0lDSsRbcIcruCer+ZSOVmAQFF6S21JvDzrBpCw
         gtYds8OKRR0eyUGTp+bNDJlF4dEcgdNkw252DxDLKBT27AWQd7RETjQKZxz2jjMBo81z
         5cKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728972976; x=1729577776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbF6lZf6Y3cFo/FJEKPYC02XHoVdgFNRcp1kazpDm0U=;
        b=d6Ztt2DJwcC/uMR4gqbR0F7KLbues7C4+H8sC8mI7szRA8LSD5L5UHjDCBdnsD4VBl
         aaH9lf6b6TSo4v7P3OqVbZWvMsrUTG2ynbeBTh6O9zR0erEAVyWrgtTyw3e/XZ0gdSuK
         8hOEiejXyK8XJbDHcTTNEuiB0cvEc9iyqh+iMadaxSoDgRifoPYNVAX7DYYKzeNfBeCr
         E2PmSLfNGhZQWBzuOTUIXaim++9XufeRx36lbKFi29QO3jChQaS5XsWH4E62d8DluiuT
         zvQibr2APlFXXhbjMSXad8KQQyrUIPd3h9H2VkiOeF5aIVdPL3zbVxWoJGwx2YuoehzP
         1meQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu1VhFTqG4sR7NF3A6LvMaiDBm8sYvfiwHadffjCNrzcpCk6ITF4lvM3+mRnWz22lVkv1DhBvi7wh2Bc0=@vger.kernel.org, AJvYcCW3VGP6ftSGunavg0UCeklJCYfammgMFVlODAwY1rQksgubqgJZ088mAkRa399QI3AgRCoISu6v/3Ual3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcYLx5wW+CYbsrmidZdFQt6EdGov3xyP1SIA34VN5l8tHxYWUE
	cU4/AGAXV55HgpXT6dSNQCm6OtbIewGMLQE2FkVTz5m+UFVLcDLF
X-Google-Smtp-Source: AGHT+IHtffj4kVB4CU+gpKVz68ja5fHOozQcjDr/J/MrRREyVkAKol011obQVXY72TaTGZUGL8+Etg==
X-Received: by 2002:a05:6000:118c:b0:37d:2ceb:ef92 with SMTP id ffacd0b85a97d-37d5fedbb12mr7547393f8f.27.1728972976285;
        Mon, 14 Oct 2024 23:16:16 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-51-176.cust.vodafonedsl.it. [188.217.51.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa87bd7sm684919f8f.35.2024.10.14.23.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 23:16:15 -0700 (PDT)
Date: Tue, 15 Oct 2024 08:16:13 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: sakari.ailus@linux.intel.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5645: add HAS_EVENTS support
Message-ID: <Zw4IrU8bOOtq26Gx@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20241014173840.412695-1-tomm.merciai@gmail.com>
 <20241014175452.GB13238@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014175452.GB13238@pendragon.ideasonboard.com>

Hi Laurent,
Thanks for your review.

On Mon, Oct 14, 2024 at 08:54:52PM +0300, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> Thank you for the patch.
> 
> On Mon, Oct 14, 2024 at 07:38:40PM +0200, Tommaso Merciai wrote:
> > Controls can be exposed to userspace via a v4l-subdevX device, and
> > userspace has to be able to subscribe to control events so that it is
> > notified when the control changes value.
> > Add missing HAS_EVENTS support: flag and .(un)subscribe_event().
> > 
> > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > ---
> >  drivers/media/i2c/ov5645.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > index 0c32bd2940ec..2c5145d5c616 100644
> > --- a/drivers/media/i2c/ov5645.c
> > +++ b/drivers/media/i2c/ov5645.c
> > @@ -29,6 +29,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/types.h>
> >  #include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-event.h>
> >  #include <media/v4l2-fwnode.h>
> >  #include <media/v4l2-subdev.h>
> >  
> > @@ -1034,6 +1035,11 @@ static const struct v4l2_subdev_video_ops ov5645_video_ops = {
> >  	.s_stream = ov5645_s_stream,
> >  };
> >  
> > +static const struct v4l2_subdev_core_ops ov5645_subdev_core_ops = {
> > +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> > +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > +};
> > +
> >  static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
> >  	.enum_mbus_code = ov5645_enum_mbus_code,
> >  	.enum_frame_size = ov5645_enum_frame_size,
> > @@ -1043,6 +1049,7 @@ static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
> >  };
> >  
> >  static const struct v4l2_subdev_ops ov5645_subdev_ops = {
> > +	.core = &ov5645_subdev_core_ops,
> >  	.video = &ov5645_video_ops,
> >  	.pad = &ov5645_subdev_pad_ops,
> >  };
> > @@ -1178,7 +1185,8 @@ static int ov5645_probe(struct i2c_client *client)
> >  
> >  	v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_ops);
> >  	ov5645->sd.internal_ops = &ov5645_internal_ops;
> > -	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > +			    V4L2_SUBDEV_FL_HAS_EVENTS;
> 
> Instead of patching every subdev driver, should we handle all of this in
> the subdev core ? If a control handler is set for the subdev, we could
> set the HAS_EVENTS flag automatically, and default to
> v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> if there are no control operations.

Well :)
Not every subdev drivers, but only the ones I'm testing.

Yesterday I was playing with ov5645 :) And I got:

v4l2-compliance -d /dev/v4l-subdev1

test VIDIOC_G/S/TRY_EXT_CTRLS: OK
fail: v4l2-test-controls.cpp(1108): subscribe event for control 'User Controls' failed

Joke apart fully agree and thanks for your hint!
I will take  a look :)

> 
> >  	ov5645->pad.flags = MEDIA_PAD_FL_SOURCE;
> >  	ov5645->sd.dev = &client->dev;
> >  	ov5645->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> 
> -- 
> Regards,
> 
> Laurent Pinchart

Thanks & Regards,
Tommaso

