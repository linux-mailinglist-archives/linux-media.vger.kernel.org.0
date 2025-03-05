Return-Path: <linux-media+bounces-27635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 425B6A500B2
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 14:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5D9E7A4D1D
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 13:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA3124887B;
	Wed,  5 Mar 2025 13:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="bmpdWJD0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E76A38DE1
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 13:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741181817; cv=none; b=Erm3A3fUHG6ZL6yFZcMKauR6l4uPI30WscMWJF1xTN/bonoHakVli0X5cEhm0PcnNK3AHKUSomAqIJpRXlO4sfi7kOcjadRfsROabdL6cJ2VuOISkSQIOxvuUTP1WauTNkYC+oIBGteUkm/MfZpggHPrYXi15g6wPRLI+QAoGDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741181817; c=relaxed/simple;
	bh=EKreQ6SC//JlOxvxXFZdCpUk2cpgAK8RbadH5ORr1xI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKulN3KIg5a+6D+M3ygCMvoqlbG4QEe8evu3jlRF5ogL5qSJ4h+mGcHbWgfqeUmua/QskYskv9BcmpM2StHGY/gxQmIQ5IXEsOBWDPaMcIpZdhS1bXGL6XDHSFEMastGVJN/LT8cew5ti3hgqs7z5H6xMUPwEzBXsT+K7eR5e7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=bmpdWJD0; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e589c258663so7135321276.1
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 05:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1741181814; x=1741786614; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kkq/3bloXm6E5kmTVPNSgnRE7RsUtZsJjxixAtIMclU=;
        b=bmpdWJD0cHJhFXLZu1R/YWBXLIBQQQ4kvRFKDxL24kO2+EIR0m26lFn9umfLJzBsoq
         TEQSYquWc3QMlyngeNfCm/2p9o0xb9GaAJyXvdWvRbtNUx/4NWTNDwZWua7UUKPECjBj
         YXSoGyRrN9P0tU61G7C1W+/nsVs6RpIIckOEh179rxDFDUTvJhL/W1p5E7NrazMly65d
         gC16JTRf0TsMzjtVnc2ONgY3TzQ13dDngPWPZlCuFcHPAVtdmJ4Dy7lQpqkW2lYraPXB
         FTFDfIRPSB/UAhLVjLDnDxOLvJORkrlS7DuTLURD9ZPuPxOKQJMPro2Sxj6HeNwJc5Oh
         SvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181814; x=1741786614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kkq/3bloXm6E5kmTVPNSgnRE7RsUtZsJjxixAtIMclU=;
        b=kbN3bTPn/XRSh6yax55mXlcEcF+VAR/PFw67wbVd+U2xU4rA2zDGBK0U7bnTZxb/hj
         1rHZV1sMCSPOGxSeC5yb5a2JhKxl+y8JYdVQkmqUzAvz1cShNWD9sxm86JJgmf32f9un
         yhY9MD5FveIxFrNyNmHC0ZH1rgSH7PEwWuyYYZ4VFR/AmC41yW7IoyjOvgrq7tsBjplC
         OHo+8PUON5y7qkYf9fm8as0fTKwr2uZZk3auF8U8rKkXcFGncDX5xmTEx9CJDL0IViG7
         G4rkemrn993U2kG8PxqRfJemVAPLtF8oJtG3BQ4YMRX6tcjRGMGbceOmaY37fuGgrW14
         egpQ==
X-Gm-Message-State: AOJu0YwC721lS7qdJ5oeypU+U6F7REVMD+k6M33ceV8iZM+ogvW1DGV8
	BTnSqWs7V4LPaSHkQzS2rV6kanFtF8sYmC0SiSoqe14pw44CW2VCLJPvqDerM5dgoyftwYLrHnN
	sYb1BAKUNqavkVbf/c3LL5Chgc8YTAwgZJ2sM6w==
X-Gm-Gg: ASbGnctFm38moRj5/y6zg5U73K4D9C7aNtCYCP4PIH4UjHDBwVzz3G8vRj3mnXr/TcI
	BDf6LzdI6UXj9+EhC+IcdQitFfFG0zoRM6ihBEdGQqiFYynBkKMsfLoY6jl5xxPJkk7izJeeSJP
	x+rrt3KspSvSru0+piRREmLikdzMk4LhVTvThrIYTBOxTyqiHGEHB4EYriQw==
X-Google-Smtp-Source: AGHT+IESmZVGU/v0KYW/6bzV+RFXHcPc+t+SW5L4XDrg1IEfRlSYGmIYKgwvZyLtCisDC3CxKu0jk/TIkzAF5sKSjf8=
X-Received: by 2002:a05:690c:6f8f:b0:6fd:2f47:f4f9 with SMTP id
 00721157ae682-6fda2fe14c9mr42517727b3.9.1741181814379; Wed, 05 Mar 2025
 05:36:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ab1fef54-d83f-46e2-a6c8-42b0761368fc@xs4all.nl> <d29353c7-7ae2-411b-9c13-3fbd7bd63da2@xs4all.nl>
In-Reply-To: <d29353c7-7ae2-411b-9c13-3fbd7bd63da2@xs4all.nl>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 5 Mar 2025 13:36:32 +0000
X-Gm-Features: AQ5f1JpMfDzHyAbcc6ybZkt_pmYeIRbz7NLF46s8CzKRV6SW6WT3T-8qv_j5Tl0
Message-ID: <CAPY8ntDF_u5jkExSCLW1qmQUaS+sh6HE4ui7uQnkgiWJ7B8XAQ@mail.gmail.com>
Subject: Re: [ANN v2] Media Summit 2025: Nice in May or Amsterdam in August?
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Nicolas Dufresne <nicolas@ndufresne.ca>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	"stanimir.k.varbanov@gmail.com" <stanimir.k.varbanov@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, Tomasz Figa <tfiga@chromium.org>, 
	"Hu, Jerry W" <jerry.w.hu@intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Steve Cho <stevecho@chromium.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Thu, 27 Feb 2025 at 10:05, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi all,
>
> Just a friendly reminder to reply if you want to attend the Media Summit, and
> if so, which place works for you.

A yes from me.

> Currently the preference seems to be Nice.

Nice would be my preference too.

Thanks
  Dave

> Regards,
>
>         Hans
>
> On 20/02/2025 11:24, Hans Verkuil wrote:
> > [Repost because I mixed up a Lyon and Nice, and to provide more info on the other
> >  events that take place in Nice. Also added Kevin Hilman to the CC list.]
> >
> > Hi all,
> >
> > We want to organize a Media Summit this year as well to meet each other face-to-face.
> > We try to co-locate with an existing conference, and this year there are two options:
> >
> > 1) Co-locate with the Embedded Recipes conference in Nice in France which is held on May 14-16:
> >
> >    https://embedded-recipes.org/2025/
> >
> >    So a media summit would probably take place on May 11 or 12.
> >
> >    This conference is a one room, one track format. But the room holds up to 200
> >    people and the expectation is that it is not a problem to get tickets for it.
> >    And we might be able to reserve some tickets for us as well.
> >
> >    There is a libcamera workshop on Friday, and AFAIK a pipewire workshop on the same day.
> >    GStreamer plans an event during the weekend after ER.
> >
> > 2) Co-locate with the Open Source Summit Europe in Amsterdam which is held on August 25-27.
> >
> >    https://events.linuxfoundation.org/open-source-summit-europe/
> >
> >    The Embedded Linux Conference Europe is part of that event. The summit would
> >    probably be on August 24 or 28.
> >
> > I know that getting permission to travel is still a problem for many, which is why we
> > try to co-locate with a larger event.
> >
> > So: if you are a core media maintainer or an active media developer, and want to join
> > the Media Summit, which of these two options would work for you?
> >
> > If possible, I would like to get an idea of what I can expect in about two weeks time.
> > I'll send out a reminder in about a week as well.
> >
> > Feel free to forward this if you know other people who might be interested.
> >
> > If you haven't been to one of these Media Summits before, then you can find the report
> > on last year's summit here:
> >
> > https://lore.kernel.org/linux-media/45e4f5d4-f6c4-4f0b-96b5-f5e1125b0845@xs4all.nl/
> >
> > That should give you an idea of what to expect.
> >
> > Regards,
> >
> >       Hans
> >
>

