Return-Path: <linux-media+bounces-18199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E61D9769A5
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 14:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C29801C209E8
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 12:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662511A4E7E;
	Thu, 12 Sep 2024 12:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cwv65M57"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE0E1E49F;
	Thu, 12 Sep 2024 12:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726145558; cv=none; b=C0yw8RXpd/gbd+A4z4sVRrhcnAqd6HCnykMe1w8aCw12K9U+CuzC0kOE+Cza8kfZa38CtDntiH5Tx06/nm+tw9fZL75k7Z7RSHhzNj1q/D4PbBleK3fnpV/PqOnfKCvpYNcrpqXNivyj31LJr1IBmaZgpjMdFKCgD7+X96cT1QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726145558; c=relaxed/simple;
	bh=y7yM4Q60DD8U1Bzv3z89ZzVMdBYL8VitI4YDOTovzjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXG1o285eImQhTwX5s2dqEpSWWBpvQehV4jJKblaKv0agDeU3ZUrT8SOnOb4ZW0rWafScRJ3m0E2BgAnaa9opg/EV/aRMBKf+eHr313Yfl4m5d5IzyvnC8NfLo/msKcapPzxRiwRMZMjDN00k8vvMnOKLmvHGK0O5+qOgs10vNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cwv65M57; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f761461150so14530531fa.0;
        Thu, 12 Sep 2024 05:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726145555; x=1726750355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ytO9HCxMCj8cetm6dPrmT5rccBLZqht4jH1pAmf1N20=;
        b=Cwv65M57J7ftfCLuWCx4A8uuIusW4JfxpSJBc93XAchYkJ7JZHdewLw8Je3Ohe0jO/
         FIZDwe109mnHDkPzhCxH179a49IFexl3l5Li3IO2j4bX+EH1WAV6LJMUiMcDzYwEhnrh
         Y/vtg0cXachKk0Qe8YDKTc+lQxddX5XmAPk17g/FGwUCbtWjRXor6fbl8ahpZOP5SD2Y
         wOpKlEB1kmJA/WtiGbTada8hi9yHZPujhBI5ylFoJ/v8N7JEbNOqAIBSRwHRMAotiDSC
         8dzatWpwpne8uGQPAPmBYZm5LQXKMimvjUp/V6YSGtjbyRRuLRyJPov00as0prF1n871
         0ymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726145555; x=1726750355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytO9HCxMCj8cetm6dPrmT5rccBLZqht4jH1pAmf1N20=;
        b=qMTk4H7pujjye+aGi6VxKIWaXLvOudtZyV41wDB7GmZpr945u4gUUtF8TPG66uoHHR
         bvs6K/gOo9Mvyk9M/9CSdsFjJsMVKDZk7GbTOxjl5/9bmJfvqkuNu8YS1VV5brV6e3iw
         8afitqqSkudVh/oUMYU0AkiZha/PDuuOw1KNGZvKvJPThQecdxd8vX1hJmkOjuk3yIgn
         RCvf0wHxeQLBnhuhn71FYWfwuUPwSfEntFEXuAq+0T/9UBXIU3JR2m3nzsqsK/Q1Fj9X
         Ql5Xt1S6HbP98gtewDd42WQELgzyrhWXe9fQ0+Ea6UytZFFVtkod+m/2YXTprqX5czSc
         Bm0g==
X-Forwarded-Encrypted: i=1; AJvYcCUeT5ew3MvdhAig9qGlByruwNElyAa6WJPAo1R54hB0YDbFL6UOIbMbYC/gStgIFxZ1ybNbwFFzJiRBypQ=@vger.kernel.org, AJvYcCUsLi3BwtLLpDMXUjOi/e8ThmmZrS0IYOtGf5kEbz+TDqP/tWJrIk7zEZAfB/nIJlB5N/rzoDtcK8kD090=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdh9vGB6uyCqiMchyZHAYPidOArpd09UnMBQ1B1gQYipt+u29A
	H/r9DCuTN0C5kaEcN7hB5hR2jjk1yvFGAtBwnVTTcrNFvLvGM4Xt
X-Google-Smtp-Source: AGHT+IHQKmSa8aTQdsfTrONvZJKSM97H7YcxBVGNGuRc72tLjanr7qTdjvVPb2MNj3NudiJ05YeuIg==
X-Received: by 2002:a05:651c:b07:b0:2f3:cb70:d447 with SMTP id 38308e7fff4ca-2f787f4246dmr23681831fa.40.1726145554232;
        Thu, 12 Sep 2024 05:52:34 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-48-58.cust.vodafonedsl.it. [188.217.48.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a901c737f09sm168417666b.30.2024.09.12.05.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 05:52:33 -0700 (PDT)
Date: Thu, 12 Sep 2024 14:52:31 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linuxfancy@googlegroups.com, julien.massot@collabora.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: max96714: add HAS_EVENTS subdev flag
Message-ID: <ZuLkDzJN5rbqwmpD@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20240910134428.795273-1-tomm.merciai@gmail.com>
 <20240910134428.795273-2-tomm.merciai@gmail.com>
 <20240912104409.GA25276@pendragon.ideasonboard.com>
 <ZuLMUaxn/oTw5dco@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20240912120510.GB25276@pendragon.ideasonboard.com>
 <ZuLbPMluhB4NL7ty@kekkonen.localdomain>
 <20240912121816.GC25276@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912121816.GC25276@pendragon.ideasonboard.com>

Hi Laurent, Sakari,
Thanks for your comments.

On Thu, Sep 12, 2024 at 03:18:16PM +0300, Laurent Pinchart wrote:
> On Thu, Sep 12, 2024 at 12:14:52PM +0000, Sakari Ailus wrote:
> > On Thu, Sep 12, 2024 at 03:05:10PM +0300, Laurent Pinchart wrote:
> > > On Thu, Sep 12, 2024 at 01:11:13PM +0200, Tommaso Merciai wrote:
> > > > On Thu, Sep 12, 2024 at 01:44:09PM +0300, Laurent Pinchart wrote:
> > > > > On Tue, Sep 10, 2024 at 03:44:27PM +0200, Tommaso Merciai wrote:
> > > > > > Controls can be exposed to userspace via a v4l-subdevX device, and
> > > > > > userspace has to be able to subscribe to control events so that it is
> > > > > > notified when the control changes value. Add missing HAS_EVENTS flag.
> > > > > 
> > > > > How is this supposed to work, given that the driver doesn't implement
> > > > > .subscribe_event() ?
> > > > 
> > > > You are completely right, sorry.
> > > > I think in both cases I'm missing:
> > > > 
> > > > diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
> > > > index 94b1bc000e48..2257b6b807ea 100644
> > > > --- a/drivers/media/i2c/max96714.c
> > > > +++ b/drivers/media/i2c/max96714.c
> > > > @@ -17,6 +17,7 @@
> > > > 
> > > >  #include <media/v4l2-cci.h>
> > > >  #include <media/v4l2-ctrls.h>
> > > > +#include <media/v4l2-event.h>
> > > >  #include <media/v4l2-fwnode.h>
> > > >  #include <media/v4l2-subdev.h>
> > > > 
> > > > @@ -488,6 +489,8 @@ static int max96714_log_status(struct v4l2_subdev *sd)
> > > > 
> > > >  static const struct v4l2_subdev_core_ops max96714_subdev_core_ops = {
> > > >         .log_status = max96714_log_status,
> > > > +       .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> > > > +       .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > > >  };
> > > > 
> > > >  static const struct v4l2_subdev_video_ops max96714_video_ops = {
> > > > 
> > > > Like you suggest. Or I'm wrong?
> > > 
> > > That looks better :-)
> > > 
> > > Out of curiosity, what's your use case for control events ?
> > 
> > I'm not sure if there's a use case, however control event should be
> > supported when a driver supports controls.
> 
> Not disputing that. That's why I asked "out of curiosity".

No use case :'(.
Sakari point me that we are missing events flag, some days ago.

Thanks & Regards,
Tommaso

> 
> -- 
> Regards,
> 
> Laurent Pinchart

