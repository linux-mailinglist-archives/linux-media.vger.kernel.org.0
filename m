Return-Path: <linux-media+bounces-4548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DE984541C
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 10:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC60A1F28E33
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 09:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E50215D5A9;
	Thu,  1 Feb 2024 09:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EpyODtBe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EA515CD7C
	for <linux-media@vger.kernel.org>; Thu,  1 Feb 2024 09:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706780005; cv=none; b=cfbX5BERtpMal/Iik5SsV0uPpgb1j4wct1kJa9E3C4aqyN/TTqW8fnyh+ceFVQr3+6bzqR7xgMWFQTjbF/tWg6+5Fq8c+dQHPm3WNADZy2+H5K1+H0aP/ZKRJJagUrpCku3vWAZtKe7Pa3ViLHgtGNI7NTnoz4WVUJLTfT6Lc2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706780005; c=relaxed/simple;
	bh=eYEY3wLbnOVVp3XHVTf3+CvOLRkf2e7eKBN81o9mahs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXyq4hYSnKI/p5W3vNhcq7EC0yvZRmYbeuU9lZQ+hhl3Rvw5VoDG9FdBM+W5b00GXXpDcr1dhUGQikw0T9++AR2YJvoAWATiBZYYgORJinqbLIKObhw9M2pK2w9B0PciwwdyHz5jYLtkuuxeuvFzZwmdtbOc8gksCHRkOQeoIZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EpyODtBe; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d751bc0c15so6178845ad.2
        for <linux-media@vger.kernel.org>; Thu, 01 Feb 2024 01:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706780003; x=1707384803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tV3qCJdKmAGKOGl5k3jwb82q845QvpC7mtS6cwfbwVI=;
        b=EpyODtBe8gJltQunLmjL8vOB9lNRHMRoYqFNJQBGEHR7MH+AdE5lglQeiRyWtS7c8t
         7kxxIjTtW1xjB+pp7yHH1jOU+/wL/1bQBmvHq8JEYqU6YAZcYeL9Ygwi0jNStaM3yd2H
         ErNG4wViqc1aH7GiZ5Z02aRkVJvMf7ZdMW4gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706780003; x=1707384803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tV3qCJdKmAGKOGl5k3jwb82q845QvpC7mtS6cwfbwVI=;
        b=J59Mmexh3oKi9VuCn3tbHj1J/xknQF3ws/0k+Kr3rifSpx4Cu1eo3sHQsmdVJsOcTq
         wv2bxxnqfNntvXX4W6m32uuq97v690m4cPX5EoHI0WpUX7tlq7mgHyB7gX/z9Pnaj3Zl
         IgQ3OCbnswcJk2cBSSXA0GoGUuxzfiVA/ok5WXbHxOCAXH1PpBOm7Q9tzvXHMlM++6rK
         YK8/51P/tm7CW+E2OzcSq21Alb+QnMvwCQqfo85VXyaVDGta54vZsNREHx3J2ARuubUa
         lNMReXcnob1yvgZJ6yu4FecJEFBrLbM0KEXDLJ0eAd/Escpt+SXuc4S64YhvpQVK48fz
         JMKg==
X-Gm-Message-State: AOJu0YwIL756PaUnkESD8alHLzfHAbnbc15NinbfC6SujRoPzaLXn3QM
	RpRCFUOr6NoIcnIAvQah/DU18HMICWmNd6NuzDPFRpEF3FnAQYj/jlrkm9VfahTlIjcMP1c9zFc
	=
X-Google-Smtp-Source: AGHT+IHC3Xj/LkX6h/NZdqA5ZXYy3V51i4s+G9/6M752GXmblqrTwBKvyu+A10cr9YefOBkhnHpeTA==
X-Received: by 2002:a17:902:8f87:b0:1d9:11bd:a7af with SMTP id z7-20020a1709028f8700b001d911bda7afmr3972558plo.28.1706780003491;
        Thu, 01 Feb 2024 01:33:23 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVkACmcBf6JceWg8dGJOIKKV1fYksaS5IICc73sI7ni2bCGgpdFjVhgVHteNVkcAzl2CjE/nFbMm4I3mB9b1ae1Ss2t0KWY/x9aHVqaog9hMdhgEHoVVCq9nMiRgKwlZMLO0QiU8UHD6wJvzMfld1CoJFo/r6PL8xbZPkD7f1/BXrEeRPSkbV83vbDI1hNQkOzcp6Uez1AhYfKV4zNhgz/JUKjczFAJcUkLVpcqlGcNFdfKxM5C3bT/q11LI6t5JGXcT29xT2tmmG32szPC4HEHD6zNhBDHlJ5FjxY83N5QLwXuXt0QH9qrcHYlI9xv7EwqyiULi6sgL+yYt/puA3e8qUWzHb9wFTNs0CWEvvIiQpz4YuY=
Received: from google.com (KD124209171220.ppp-bb.dion.ne.jp. [124.209.171.220])
        by smtp.gmail.com with ESMTPSA id kb16-20020a170903339000b001d8ec844fe7sm6464237plb.283.2024.02.01.01.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 01:33:23 -0800 (PST)
Date: Thu, 1 Feb 2024 18:33:13 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v7 17/19] media: mc: Check pad flag validity
Message-ID: <20240201093313.GB69174@google.com>
References: <20231002105557.28972-1-sakari.ailus@linux.intel.com>
 <20231002105557.28972-18-sakari.ailus@linux.intel.com>
 <20240201091713.GA69174@google.com>
 <Zbtiucur0Y_gSEQc@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zbtiucur0Y_gSEQc@kekkonen.localdomain>

On (24/02/01 09:22), Sakari Ailus wrote:
> Hi Sergey,
> 
> Thanks for the review.

Hi Sakari,

> On Thu, Feb 01, 2024 at 06:17:13PM +0900, Sergey Senozhatsky wrote:
> > On (23/10/02 13:55), Sakari Ailus wrote:
[..]
> > > @@ -197,6 +197,7 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> > >  	struct media_device *mdev = entity->graph_obj.mdev;
> > >  	struct media_pad *iter;
> > >  	unsigned int i = 0;
> > > +	int ret = 0;
> > >  
> > >  	if (num_pads >= MEDIA_ENTITY_MAX_PADS)
> > >  		return -E2BIG;
> > > @@ -210,15 +211,27 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> > >  	media_entity_for_each_pad(entity, iter) {
> > >  		iter->entity = entity;
> > >  		iter->index = i++;
> > > +
> > > +		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> > > +					     MEDIA_PAD_FL_SOURCE)) != 1) {
> > > +			ret = -EINVAL;
> > 
> > Can we please have some sort of WARN_ON() or pr_err() here?
> > This is a pretty big change.
> 
> Doing proper input validation is hardly anything unusual, is it?

Well, function requirements change quite significantly, to the point
that drivers that worked before won't work after.

> I'm fine with a WARN_ON() though, I'll add that to v8.

Thanks!

