Return-Path: <linux-media+bounces-12548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 175768FBE4D
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 23:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C52F128715E
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 21:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F022814D43E;
	Tue,  4 Jun 2024 21:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TLqBAdzy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B2214C5BA
	for <linux-media@vger.kernel.org>; Tue,  4 Jun 2024 21:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717537737; cv=none; b=cMx8gzSKDgw7ahiczhUYgJp+5/GFQO0ES9kMxREWAogMmUfdMASVts97QepTHrOkWhGfqjdyGgZrqlEjCgCH3gqzJS+jx9NZ680vU2yPAAa2JB6pPzNWgYQ2U/iIXnS6DYtoFUzHxvCHC4Qk9NQYNXmD+G3HExkMHfNPzsM+BY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717537737; c=relaxed/simple;
	bh=IRWZWDyIfD866bu1iHsqV5MIwWhs/68+p5kgY24NSTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qWgnKSO4i16CO1+/uSEpPvDmwzXhJVl/g+bi/o8VNIAIlcpjpNECpzbc/XRoTTrqp2NsEJAabEzrm/sUxKmfOJn7kvgOY7amw3GAf20im5nJ5lY5HSUHWTiWANl/7kU13fjbEUXn8ns7jmqi30A+C37djtn4cLfzG8wspMQuWgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TLqBAdzy; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-80ad2893ae5so468602241.3
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2024 14:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717537735; x=1718142535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4ENqaSOEce3ETYuXHj1qdhP9pTGq8Gy5gP1OKt6MjE=;
        b=TLqBAdzylk/KvYw9Hy3c4NjtfVQtnXJ0KDyQYbtd7SmbvfMghbNmXUk7WFylt8+h8o
         Dk/qZKWmPwySrage6cidZQF59t96TRgZI631HPR2Yw/iaDE75TpcY2VYpDswUFoCP4Se
         9aT58NP1ue4Gwb5VP1pq9vTe6sSAGsrti23WM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717537735; x=1718142535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4ENqaSOEce3ETYuXHj1qdhP9pTGq8Gy5gP1OKt6MjE=;
        b=ukSrYTVA/M+1QiLJLtXjmdpujkuqhnDSXCoRf0L2zpbTlFjhz3kJSISD2SNa3aLC3C
         7SNtcvPPK+3fBi/7c6YGm1+sWG1g5paK1JdRAR5l5OCmvrXD9V5CX7VXHCsWmX/g++2J
         lBUy8NCDSTwxu9jRA/rLiyLBkd7Ggdp+t6wJvUon/JoFX+jZWRtPU3sZfbNJQtmLgUyA
         Q3BFkCPhJPTKc6DC410C/yfMKXLnJKJIFnATQ7MMekRt2dFp7CtBAoVhxD7dFMRdemTR
         5oN8dmFFUcbtyOGeISN9AQfT5ebuVzMdjUqY193Yn6DSgw/A4i3Md5K8qWrKRMOpMPAE
         J7Yw==
X-Gm-Message-State: AOJu0Ywbl6xLn2KYEwQlyZL+Q0adn6cGPg2ARJZVvSJVdAzvy/UpH7vc
	H12hZUclBw7JJn5CEdTAI6b2O3C3c87lC0EYC7qAYfZc25wbxsE3j5ceMz0fYdMiZ6NQjxnam97
	dEr14lNIH1NEA0BcoaS6u5h7nj2mzG753VixE
X-Google-Smtp-Source: AGHT+IEtJgFA6iwOOFwPYRB6Cs4MOKMuqsg4/DjbJB4sytGr904pTnfUa6989L7fj4P+0qQwjtJLFEpnGmH5niohvmc=
X-Received: by 2002:a05:6102:1982:b0:48b:bff0:5b0f with SMTP id
 ada2fe7eead31-48c044f347cmr947988137.0.1717537734671; Tue, 04 Jun 2024
 14:48:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl> <568b8c9d-410f-49a8-a560-0cf948297ab4@xs4all.nl>
In-Reply-To: <568b8c9d-410f-49a8-a560-0cf948297ab4@xs4all.nl>
From: Steve Cho <stevecho@chromium.org>
Date: Tue, 4 Jun 2024 14:48:43 -0700
Message-ID: <CAC-pXoO3pmM87dywsGFX1Vs=gXhUy6eqVEYZ+5JRcRhxHFzZqg@mail.gmail.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

If allowed, I would like to talk about how V4L2 virtual video decode
driver is used to enhance testing on Chromium.
I expect it to be 30mins.

Steve

On Wed, May 15, 2024 at 2:32=E2=80=AFAM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> Hi all,
>
> On 5/6/24 13:33, Hans Verkuil wrote:
> > Hi all,
> >
> > We will organize another Media Summit on Monday September 16th to coinc=
ide with
> > the Open Source Summit Europe in Vienna:
> >
> > https://events.linuxfoundation.org/open-source-summit-europe/
> >
> > Avnet Silica has very kindly offered to host this summit at their Vienn=
a
> > office, which is about 35 minutes by public transport from the OSSE ven=
ue.
> >
> > Location:
> >
> > https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+GmbH=
+(Silica)/@48.183203,16.3100937,15z/data=3D!4m6!3m5!1s0x476da80e20b26d5b:0x=
2c5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=3Dtt=
u
> >
> > The meeting room can hold 18 people and has video conferencing support =
(MS Teams).
> >
> > That said, I want to keep remote participation to a minimum. This yearl=
y summit is meant
> > for active media developers to meet up face-to-face and to discuss medi=
a subsystem issues.
> > But if you are an active media developer, but are not able to attend in=
 person, then this
> > is an option.
> >
> > If you have a topic that you want to discuss, just 'Reply All' to this =
announcement.
> > It would be very much appreciated if you can also add a guesstimate of =
the time
> > you need for your topic.
> >
> > If you want to attend the meeting (either in person or remote), then se=
nd an email to me
> > directly. Since the number of seats is limited, I may have to put peopl=
e on a waiting list.
> > Please let me know sooner rather than later (ideally by mid-July) so I =
have a good idea
> > what to expect.
> >
> > Priority goes to presenters and the core media maintainers. If multiple=
 people of the same
> > company want to attend, then I may ask to limit attendance to one or tw=
o people.
> >
> > It is hard to predict how many people want to attend, so I'll see how i=
t goes.
>
> Just a quick update:
>
> After just 9 days I already have 5 people who want to present something.
> And currently I have 10 people who want to attend in person and one remot=
ely.
>
> So I am confident that we should be able to fill that room :-)
>
> Regards,
>
>         Hans
>

