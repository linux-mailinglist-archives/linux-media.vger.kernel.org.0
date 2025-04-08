Return-Path: <linux-media+bounces-29674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5E8A81766
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C36EC8A4B4B
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C718624501C;
	Tue,  8 Apr 2025 21:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bUYQVNPN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8781F417F
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 21:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744146405; cv=none; b=Sr9NM0yfWhHU+fbEzcloEt8DJzVeHh54nxOc5ylpT1xnzieVd3zhXZZYtvPkJqTFJY0nBEkNnhzFn1hMnOEO3H/4XrHTEE1vE2csFnTps7EFVmD5PDVsmkfUaaM+POYaPjwCEeKCAiymk33ICv5G1fnEvYRRs1v5GRyucDFJGDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744146405; c=relaxed/simple;
	bh=seJ0itVPChjCXzHyNYmmxVsY1OmJxyFgVndIqcyspqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xnrt5Le/3Wa2sPyID7zKBYPsD8TRCrgldusLSn3CD+NwDLigAYTVvx+pAvfIIqa9wYahkR8f+n2z8qb1lcIPMuLbdcohPiXKTVlsMG4ixJ+bOjp2EQ7mNELgBFzK1VSc7IIdRr++eqmD021VwNtU1K8cHSzJkoSuGE/098Wf/l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bUYQVNPN; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5499659e669so6298286e87.3
        for <linux-media@vger.kernel.org>; Tue, 08 Apr 2025 14:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744146401; x=1744751201; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SBdmCF8pThOsuVXFbo+87gcUOD5tsz8smal5lCLLYTQ=;
        b=bUYQVNPNShGMQy6320sxlBdhU7lshWBsnSeTjIxDrp0uBqZwQ//fh4t2slLHsajXZl
         SQ4GJqA654qJ5I1w659lnoZQf6+jUlsRDutXj9s1CDbp1rxlXibLQpOBq8jQ9SIzsql8
         GvPWh1aP2C4AUUXdqPV0B35o1FVo93sTghv4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744146401; x=1744751201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBdmCF8pThOsuVXFbo+87gcUOD5tsz8smal5lCLLYTQ=;
        b=CUoCtkjC/ay+wVuQYfx9G6fideljLr4s4W88zSicTNbn6OWI+vRPX7goRX/QkA3RF/
         QQRoRBytvBiOfGM6eutC5lFJ3UIW8ORZmkjdJHhj19RaDzDL1i1zhExzy5qbZTFxFR2j
         nW41MzK9WBzwPLQV0g+vCdTgDpm2cww9iRoY2nVyEYtd+9Wzuzs+O5DeT9R0HkyrHNGW
         bOHK7cgIiUskPzgR/X/2gkKriQWSRCBMhajLtvavBU7SnF79cxx1QMQw1lbmkyAprccE
         +9FIGNi214U99Fu/b7mZG616izRg7yE+Az3q9a2tppE6pEKI7AxYLsS3rpCcVx5w7ZCJ
         Gw/Q==
X-Gm-Message-State: AOJu0YzHpZ3WENnmPpKMw21/rsWbrMGyWkbfMtCupXUcLHtyOmrEjd7v
	me56AG747cvd7vz0gzB6VpNi9+6/GLPL3QolR6YQBPxO9ESmQCq6+fbMhqVOD6XjBZ51G1uWtLs
	=
X-Gm-Gg: ASbGncsz65BysiTHxVTFoX7oZ5N54CJsGm14GTWGV3Xk7y3POX3fL0F1ZS8EUtiD1/w
	DBAhQM9ONu2Qf3uOXEJSbDCb6ovnilINklrM4D8QjicJu+GDO5zARPcb+SyqN0m9sFDf3iMmqrd
	g/Lr437yWs0dEQJAfSG4RUwAN75kz6oO2I9HdKdt7BfeovErBV+90q0YFHNeZ4XkaLTV9vyKYfb
	B3SLJkV63PLarvkTCbLw8QqKyi+ylmn7M8ztPmMVy25GFVVTEy9Ec4vzR8NQldf62RMF0GgCZPF
	SgWRRp6pgSm386yyUOFi+Dy+NJShXrb2o/hIMkPDdSazl9OG6eMXZGEEU7OmeDiC1fB1ItxEbaV
	e2lNNdti+R7/v4lQ1seUuxg==
X-Google-Smtp-Source: AGHT+IHSAPR/vgSywtm6454RSf5DEkAhcHEPAsW68ce17g8F0cNLbCnZKMP8pShU1ej/M2d8SM4qnA==
X-Received: by 2002:a05:6512:4010:b0:549:7d6e:fe84 with SMTP id 2adb3069b0e04-54c437c02fcmr128120e87.53.1744146401285;
        Tue, 08 Apr 2025 14:06:41 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f03141cddsm19603791fa.41.2025.04.08.14.06.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 14:06:39 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30c2d427194so57761751fa.0
        for <linux-media@vger.kernel.org>; Tue, 08 Apr 2025 14:06:39 -0700 (PDT)
X-Received: by 2002:a05:651c:210c:b0:30d:b31e:2628 with SMTP id
 38308e7fff4ca-30f4389fb43mr1201091fa.27.1744146399310; Tue, 08 Apr 2025
 14:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all.nl> <18ac3f06-58c2-4121-86a5-f8a2b5d1e47c@xs4all.nl>
In-Reply-To: <18ac3f06-58c2-4121-86a5-f8a2b5d1e47c@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 8 Apr 2025 23:06:27 +0200
X-Gmail-Original-Message-ID: <CANiDSCtqa0uzXMidCWuikc+6JfA75LTRMqyq=kn2ou4MnXL-qQ@mail.gmail.com>
X-Gm-Features: ATxdqUEjozGDmb2BjnlfO_Ab4TPeC_IJkd02cr-zZQo7dDmEHgd3ZJxybs3B4P8
Message-ID: <CANiDSCtqa0uzXMidCWuikc+6JfA75LTRMqyq=kn2ou4MnXL-qQ@mail.gmail.com>
Subject: Re: [ANN] Registration and Request for Topics for the Media Summit on
 May 13th in Nice, France
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	"stanimir.k.varbanov@gmail.com" <stanimir.k.varbanov@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Michael Tretter <m.tretter@pengutronix.de>, 
	Tomasz Figa <tfiga@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>, 
	Steve Cho <stevecho@chromium.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Kevin Hilman <khilman@baylibre.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

Thanks for organizing this.

I would like the following topic:

Openness Framework for ISPs
-------------------------------------------

Different people have different feelings of what is open and what is
not. I would like to propose a framework to harmonize the criteria
among the subsystem.
Yeah... it is a very abstract title with a very bad description... but
it is also a very abstract topic that I believe has been dragging us.
Face to face time could be of great use here.

guesstimate: difficult one to guess

Best regards!


On Fri, 28 Mar 2025 at 14:58, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi all,
>
> Just a gentle reminder! If you plan to attend and haven't emailed me yet, please
> do so.
>
> I currently have 7 confirmed in-person attendees, and 3 remote attendees.
>
> I have three proposed topics as well.
>
> It's early days yet, so I hope we'll get more attendees and topics to discuss.
>
> The plan is to post a first draft agenda by mid-April, so more topics are welcome!
>
> Regards,
>
>         Hans
>
> On 14/03/2025 10:59, Hans Verkuil wrote:
> > Hi all,
> >
> > We will organize another Media Summit on Tuesday May 13th to coincide with
> > the Embedded Recipes Conference in Nice, France:
> >
> > https://embedded-recipes.org/2025/
> >
> > Note that there are also some workshops held after this conference:
> >
> > https://embedded-recipes.org/2025/workshops/
> >
> > And apparently a gStreamer event during the weekend. If anyone has more
> > details about this, please reply to this post.
> >
> > The Media Summit will be held at Hotel Campanile:
> >
> > https://nice-aeroport.campanile.com/en-us/
> >
> > It is close to the Airport and to the Embedded Recipes venue.
> >
> > The meeting room can hold up to 30 people and has video conferencing support.
> >
> > That said, I want to keep remote participation to a minimum. This yearly summit is meant
> > for active media developers to meet up face-to-face and to discuss media subsystem issues.
> > But if you are an active media developer and are really not able to attend in person, then
> > remote participation is an option.
> >
> > If you want to attend the meeting (either in person or remote), then send an email to me
> > directly. The deadline for that is May 2nd as the hotel needs to know the final number of
> > attendees by then. We have more seats available than last year, so I do not expect to run out.
> > In the unlikely case that this becomes a problem, then I will revisit this.
> >
> > There is no registration fee.
> >
> > If you have a topic that you want to discuss, just 'Reply All' to this announcement.
> > It would be very much appreciated if you can also add a guesstimate of the time
> > you need for your topic.
> >
> > See last year's Media Summit Report as an example of what to expect:
> >
> > https://lore.kernel.org/linux-media/45e4f5d4-f6c4-4f0b-96b5-f5e1125b0845@xs4all.nl/
> >
> > There are two topics already for the upcoming Media Summit:
> >
> > Paul Kocialkowski:
> > Stateless video encoding uAPI
> >
> > Hans Verkuil:
> > Status of Media CI/Multi-committers
> > Duration guesstimate: 1 hour
> >
> > Regards,
> >
> >       Hans
> >
>


-- 
Ricardo Ribalda

