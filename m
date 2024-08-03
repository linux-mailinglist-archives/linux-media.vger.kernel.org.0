Return-Path: <linux-media+bounces-15740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDC69467FD
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 08:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA9CC2827C5
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 06:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE4B14EC50;
	Sat,  3 Aug 2024 06:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YiFHQdJE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0550B14D28F
	for <linux-media@vger.kernel.org>; Sat,  3 Aug 2024 06:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722665466; cv=none; b=ctxTpCbGVRkn5PGVxQuaHHyh4kfc3cn5fEYGrRS6x49oyxEwGHCStJCoP5GMmg8g/bHhknoYIyxPDymrkV0rk4bp+X0nl1677ZOgL4+WNGIxahICQII01WIgNNFIMEPVdJuollMQhTGor13fD/1NWvjEeeVv1SYkCPWNSHPQ82Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722665466; c=relaxed/simple;
	bh=M+Ud9zj5zxvYJ4r8nyLdhfUxJMwYZX9z7+g4PGtLCnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwocu05Q+0E2WsEpgK68WLa4d013oXl9WPAoEjSpjZhdXWPickfqANdoHNtSR1rFhM/lp1mqybh00fOnk48tjBPMehgxoVLRM77BmmeuSFXT5Y7hsq1O04fdrYgNhM9KA9JQymI4mVWRvxfDt3ybWMAEHQxIgCDUvA4u9l9M1lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YiFHQdJE; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3db157d3bb9so5131563b6e.2
        for <linux-media@vger.kernel.org>; Fri, 02 Aug 2024 23:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722665461; x=1723270261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4xHXuQbEIlF6T6PWN7yL7W7i12ECySoqyc3OAvP7660=;
        b=YiFHQdJEGKIYfKqC00EznUTIuwTRIuZbIeYl6WJ4L9gWXbc63fIcg1Dc9J33yXzliX
         IwqpRZuxMeneaKgt7OBUN5CW9qQGXDDjLNk98A5la+EkzeJfTDH0KSOdVEJiBTOL9GLD
         vyaX2pXc9EJcVhzLB7nVmqjkjvXVP8k6Bw+38oWGDL4V5nzJ9av8Ae66N3orVlPcDjFc
         xa2DWW7ZbIN/hwmt0ZR4LPaFnSBuiBgg6cQy4s7G92PKpqhfX2a1fqzY1YTeBwUKIFbB
         brEmutwDFXhy8RezbHAKxuxxUL3VgZGRGUE9wLFf3/qbsjrh+jXTUOYMhl97aA5lHK62
         o72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722665461; x=1723270261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xHXuQbEIlF6T6PWN7yL7W7i12ECySoqyc3OAvP7660=;
        b=BAxp5nzUBmIyO5MIyoDnD5xO/y4/rlIYHhV3kYTyYKao63HntzY//rFyOjMY1yBG9W
         YOPeBlfOEAHGpu7/3j2tXJg+o6U4c7cgYclcjrbDopkvGJy8d6X1EpTMqN9ipuPLngwO
         vq6ho1QIq1wx+bFHkHccFsf3nMKCTP5YlLR+me0D7YrT5MlKdpCsgaUvAFynnhHzp1hq
         52oZiehys0tYPaDxGoLJ9sHOK/zRc4nfxzzY9nUT/GEjW8YNPuYrrZXnellOXVzYD7ds
         yDdwI0jwxLwT/lpOVvtWFgD9nBgZhd+f+THfZTpj1WGA0Q6klszsOFVbSVUQvBerAZYD
         TWWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXghF3acr2K+Whn9erRLqbbFxWj4iZnGc/sa/8fLi4vY4QhCt1Bc0Q7KerfTvYmLyHq03qZC3mkySvYX/wSZ45hs+jRF6z+2vv2oL8=
X-Gm-Message-State: AOJu0YxgFLtasEDaLvQ3uYnRT3rE8F5GVX4zWJQigl1LnITO9Xh4HEvg
	r7LRad3byYgWVOzk6BdLl3seVBjB6UoRc2moSa5rVJMLwL1Ot8Ed8DPZGKHMkc8=
X-Google-Smtp-Source: AGHT+IHRmFwg9h+RQHxo9nAy0g9i1yt4x6Wdms+udQI9gwDyyIOAQZpruLkfKCJ5FsshubfS5JIUmA==
X-Received: by 2002:a05:6830:631a:b0:709:4d7a:3438 with SMTP id 46e09a7af769-709b32081c5mr7524324a34.11.1722665461056;
        Fri, 02 Aug 2024 23:11:01 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70a3a750d08sm1119236a34.62.2024.08.02.23.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 23:11:00 -0700 (PDT)
Date: Sat, 3 Aug 2024 01:10:58 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sean Whitton <spwhitton@spwhitton.name>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	~lkcamp/patches@lists.sr.ht, helen.koike@collabora.com,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Add parentheses around macro
 definitions
Message-ID: <cf999a28-7227-4ee9-bc5f-9fe8c370458c@suswa.mountain>
References: <20240730062348.46205-2-spwhitton@spwhitton.name>
 <2024073020-reload-vanquish-f937@gregkh>
 <87v80i475p.fsf@melete.silentflame.com>
 <8d383b9d-d029-4706-91c5-9623fddf5df3@suswa.mountain>
 <878qxe41c8.fsf@melete.silentflame.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qxe41c8.fsf@melete.silentflame.com>

On Sat, Aug 03, 2024 at 01:33:43PM +0800, Sean Whitton wrote:
> Hello,
> 
> On Fri 02 Aug 2024 at 11:28pm -05, Dan Carpenter wrote:
> 
> > *You* need to figure out what the proper thing is.  Not us.  That's the
> > difficult part of writing a patch.  Once you know what the correct thing
> > is, then the rest is just typing.
> >
> > That business of defining STORAGE_CLASS_SP_C is weird.  Figure out the
> > authors intention and find a better way to do it.
> >
> > Figure out why your code compiled as well because putting parentheses
> > around (static inline) is a syntax error.
> 
> I asked follow-up questions because it seems like at least partially a
> matter of style to say that the business of defining STORAGE_CLASS_SP_C
> is weird.

I'm a domain expert when it comes to kernel style.  ;)  Trust me, it's
weird.  There are other places which do it as will but it's not normal.

> Maybe there is a better approach than what is currently done,
> but maybe there isn't.

Correct.  Just because it's weird, doesn't mean it's wrong.  Figure out
why the author did what they did and after that you'll probably be able
to judge if it makes sense.

> Maybe the checkpatch warning should just be
> suppressed (if that's something that can be done).

Yes.  Try to suppress the warning.  You don't need anyone's permission.
I think it will be difficult and I doubt you will succeed.  But you
never know until you try.  Even if you don't succeed, it's a useful
exercise.

> I would be grateful for some additional pointers.
> 

Ok.  Here was your question.

> I don't know what the author's intention was.  Are you saying that you
> think this preprocessor mechanism should just be replaced with
> hardcoding 'extern' or 'static inline' in each file which includes one
> of these headers?

The answer is you need to figure out what the author's intention was.
1) Look through the git log.  2) Try removing it and see if anything
breaks.  3) Do a grep for __INLINE_SP__.  (I deleted some extra hints
here because if I give any more hints then it's just me doing the
project).

Once you know why the macro exists then you can decide it we should do a
sed to replace it.  The sed to get rid of the macro is just an automated
one liner thing.  The difficult part is answering why the macro was
created and do we still need it?

regards,
dan carpenter


