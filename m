Return-Path: <linux-media+bounces-11143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8223D8BFD03
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 14:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F3B01F240DD
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 12:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3B283CBA;
	Wed,  8 May 2024 12:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGedhrWN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187A87C097
	for <linux-media@vger.kernel.org>; Wed,  8 May 2024 12:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715170756; cv=none; b=TJLbkffHtQfJP1bynrnfofWdHctSGNNCr/5EplngiVoRiBuXYSQNYu50GBiWMFzH+amQNBSkmH8b6vSJhyk2yb5p6nrXdE1izSGpy331QFqJiR2DFSOX2AJqmrC519h5CZzQwuyfDFEoaCIQAZzvy+j0yTi+GV08aHKffIKdkSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715170756; c=relaxed/simple;
	bh=nrFRPSsvbUzFt/WPtO/z5CXW81sab0fNEVzfklFIb18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=coXlOShmoXegyno4CcE6h54MWaf/ztZhlrRMghj8Pqnn0OVJ2iE9Hi4GSDVFfW1fZbtfWYX38FtlN1x/4MnxV8q+qSto8WDjDaoH976i4rQFImfhIx7/S20hlDE70shlT/BviKz8z/YJdDSZ7T3eVEHB/RCaVCYLY4ofhX1ytGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGedhrWN; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a59c0a6415fso994925366b.1
        for <linux-media@vger.kernel.org>; Wed, 08 May 2024 05:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715170753; x=1715775553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0iifRV02/55ePrfny4jLlnTG9mGSmMWNkn9IMixe1Bk=;
        b=cGedhrWNa3hK0Ke5Qq4JGcwF167nmSI56D6kmMNGc2Q1FClLdbVqWHnHIvJjopGujH
         f3E24AgvxEA6zehhDoglqVfAhYA8IGhyPEciGeAzP4FZaPrhZbYcG8Yp5ZfdJ6bt9QbY
         QaGqv5pWJyehlErN9180lRpFCeCvzxCHa6GCUpbtK2r5dVIL1zh2WyvBOqTTF80u1liu
         c8DPthi15+KdrqoEnXVzV4hAcUcelTjf5PpxGuwYgXWEiQgfQ+JB8pGPvl3lFJQ7NkrE
         BAcCTQ3b2MWUHE6+7EqwrWruyHIH1ns8hNopgYjHfSo7YAwFpSMspP3eClodPo7A7cN7
         rgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715170753; x=1715775553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iifRV02/55ePrfny4jLlnTG9mGSmMWNkn9IMixe1Bk=;
        b=UMf+CDipq6FQXdefPwCYFJbThTGrYg6PzDsDt091gE1NpXNf25TQgrQxFwzDXAxt2Q
         jd1U9L2aT2sxphPVg9ZQe0pcRVgKhtpATpiSoSA6A0MY3S8g3r+2QAqDQCQEpSN5y3kN
         lBBHKfOtDEHKI/OtX0PJAkYM6fjA3w4Yj9QjB+llts2+W/R8VqfXXxFt7UFDd62pTI52
         rqo8ynXYcsVkLY1BAzqRMQVgHEiJ7BvJ1PwWHegu/86igG6kqKKEfnDP5QnnYRZ9rxyj
         nTwqa/OjIyj68U4zx57oGZnhZbPEkwaHTlXrLJlnrmnW7lXHLX40gaT8UUgaNM/hKtur
         NQQw==
X-Gm-Message-State: AOJu0YzlkyMzWxCZmZ8R3cyoBosN10PSI+4Vu7u/gVVTCTqbRAzBOWO2
	KfFp7NO8YZpvHZVcT+gh6GnwDSZyGpODYRfxnZFZ7AZkHfdIjChd
X-Google-Smtp-Source: AGHT+IGjBhIgvsGfEBX8M1vR2J72/UB3zgzZiT3nW+KDZ6ZU9EFsSvPHrrLLSIiAIYepYzTIx72Y+A==
X-Received: by 2002:a17:907:7f8b:b0:a59:ae57:1658 with SMTP id a640c23a62f3a-a59fb94bee5mr206769266b.30.1715170752938;
        Wed, 08 May 2024 05:19:12 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-50-118.cust.vodafonedsl.it. [188.217.50.118])
        by smtp.gmail.com with ESMTPSA id d19-20020a17090648d300b00a5a06effd3fsm508874ejt.221.2024.05.08.05.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 05:19:12 -0700 (PDT)
Date: Wed, 8 May 2024 14:19:10 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
Message-ID: <Zjttvsa+tnpRihwj@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
 <ZjnMzhoWrt8E0wPJ@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <b536fa94-9799-4f18-a0fa-ea59094035b2@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b536fa94-9799-4f18-a0fa-ea59094035b2@xs4all.nl>

On Wed, May 08, 2024 at 09:16:04AM +0200, Hans Verkuil wrote:
> On 07/05/2024 08:40, Tommaso Merciai wrote:
> > Hi Hans,
> > Thanks for organizing this summit.
> > 
> > On Mon, May 06, 2024 at 01:33:32PM +0200, Hans Verkuil wrote:
> >> Hi all,
> >>
> >> We will organize another Media Summit on Monday September 16th to coincide with
> >> the Open Source Summit Europe in Vienna:
> >>
> >> https://events.linuxfoundation.org/open-source-summit-europe/
> >>
> >> Avnet Silica has very kindly offered to host this summit at their Vienna
> >> office, which is about 35 minutes by public transport from the OSSE venue.
> >>
> >> Location:
> >>
> >> https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+GmbH+(Silica)/@48.183203,16.3100937,15z/data=!4m6!3m5!1s0x476da80e20b26d5b:0x2c5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=ttu
> >>
> >> The meeting room can hold 18 people and has video conferencing support (MS Teams).
> >>
> >> That said, I want to keep remote participation to a minimum. This yearly summit is meant
> >> for active media developers to meet up face-to-face and to discuss media subsystem issues.
> >> But if you are an active media developer, but are not able to attend in person, then this
> >> is an option.
> >>
> >> If you have a topic that you want to discuss, just 'Reply All' to this announcement.
> >> It would be very much appreciated if you can also add a guesstimate of the time
> >> you need for your topic.
> >>
> >> If you want to attend the meeting (either in person or remote), then send an email to me
> >> directly. Since the number of seats is limited, I may have to put people on a waiting list.
> >> Please let me know sooner rather than later (ideally by mid-July) so I have a good idea
> >> what to expect.
> >>
> >> Priority goes to presenters and the core media maintainers. If multiple people of the same
> >> company want to attend, then I may ask to limit attendance to one or two people.
> > 
> > If is possible Martin and me from Avnet Silica we are planning to attend in person the meeting.
> > We are working on some topics to present.
> 
> That should be possible! Esp. since you are hosting this event :-)

Thanks for the confirmation :)

Regards,
Tommaso

> 
> Regards,
> 
> 	Hans
> 
> > 
> > Thanks in advance,
> > Tommaso
> > 
> >>
> >> It is hard to predict how many people want to attend, so I'll see how it goes.
> >>
> >> Regards,
> >>
> >> 	Hans
> >>
> 

