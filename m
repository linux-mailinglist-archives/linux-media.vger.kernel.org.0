Return-Path: <linux-media+bounces-13002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4305D904DA7
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 10:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44C771C20DC2
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 08:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34B516D4E2;
	Wed, 12 Jun 2024 08:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ahHn6kHE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D80616D339
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 08:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718179625; cv=none; b=d9OKav4qau/QT9S4qYFgerAfXZCYEJGTMJLMUKQGSvyzAS0ttMQVSVOk94EACuyf9Tajqc0MR+0F0aHopGncC4KA4hrs2sJA8AiXHAD4uvCFOqp/bJFdny8AKZ2VyE8gkyrplPM9vn+HQu9tYXl07QmEtAf4yEMlrO2eNTTPR4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718179625; c=relaxed/simple;
	bh=6av+qoN26t5Tf5nabpc4fSoHcd7/H1L6nErdK46QxJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPxkMSIiJG1uLSzamuucsyhsYTzhcyZauxNsfjryTLIgtIKSso76JjvpamdLyrWNNYy0DP1RzoN9HowRNe+gX1FX2io8nuHaHG8I/M+eEnAoCaGGBLFT4lWCe6he0kqnLbQkmITnfuYdKD55zKuZ1hLZHFaUEkB7SXMhlbH1F1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ahHn6kHE; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a6ef64b092cso496174066b.1
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 01:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718179621; x=1718784421; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQgwjvaUugiAWJ8nUBVKEJZBllbnZMIj5gbM5iOENS4=;
        b=ahHn6kHEgS/BjBCATZkxKmi/A+jPBhQ396lFwMCHyPv9YYWJJJUPYI7W2dzejFA/jb
         Jwtst6sOXAjfqOET2S3E0iyaY+O1gF625zxAa4x/dN6+xGJf/wQOVbwTadW9ByasJoyI
         /Zb1s6es2l0H+i2rDyyQvka7FLz92RDBAvVl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718179621; x=1718784421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQgwjvaUugiAWJ8nUBVKEJZBllbnZMIj5gbM5iOENS4=;
        b=SNgl57eZy+QaSLkYnDsHkGC8IgglU08rqBnTZo88XZd0MPZz5tD3kK9ShYaj9qimjg
         G831aI2II93SPtgO+71sXA++iw8jUy49NXPvQBFc+eSSA43QPXmj7hMWPRmc6y7OIzFe
         ubGAuG0HnIlHwtfzkd+uDt6sCtLTYlN2UnqA9L6AldF5SG5OzsAz/8klrECAH2OTTvDV
         uwVWJHgNjaB8R4qGOfCWpcBrCc2kFgG2Or5Jw5I3cOEbOmL0rkDI2VDMMYlXjvdKyKX4
         HdZbr/obCeu/UOr4fCA0FF2qXxJpoGPRRI2JSlxoJwl2lDpWfqz2wrsPsP4qdheZABLh
         ZR2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQlrroTNvUN2NmOYuCfalyYC4zNqdBMo6p7QH26UYrWOxQ5aiVHJ0M1UC2Haw6tdX3GdywLTsCtKiHWJj7lyLH62pX/zYB3bma/4c=
X-Gm-Message-State: AOJu0YzZvJH1FbeFizLdANmmpd7ooInkj2CeRREEMv5AlgqRiuqI4TUP
	yHqnnZvOZTsuou5kLQn8dCykxY0b6hQVbIiGyWL+n7xv0y9YKe+o6a83QXwsWRSiMew6uxkt075
	F0A==
X-Google-Smtp-Source: AGHT+IFMXhQ0DWxvBdkruPQuHgXAC8StdFKS1vAYPY3U8Dwi45vpq8d5Mj34sG8bbaTgZH05LZoUIg==
X-Received: by 2002:a17:907:6d08:b0:a6f:49f0:437a with SMTP id a640c23a62f3a-a6f49f04526mr53981166b.5.1718179620843;
        Wed, 12 Jun 2024 01:07:00 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f335878cbsm218847866b.214.2024.06.12.01.07.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 01:07:00 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6f0e153eddso470618066b.0
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 01:07:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3ykDXOw7mntp2S/NAEV9QDdG6WWTzD3ZGNLZQqkF3Zp+bz/DE44cMIXq4IQP4zRkyJLYryzRpWfg+Oa1qc3bsjHvdfwQTj/BtfdQ=
X-Received: by 2002:a17:906:135b:b0:a6f:4b2a:2879 with SMTP id
 a640c23a62f3a-a6f4b2a28a2mr36088166b.66.1718179619549; Wed, 12 Jun 2024
 01:06:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
 <7CB6738E-DADE-4F4D-9501-C701B2F3F2B7@collabora.com> <CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
 <2326f490-d9dc-4fa9-a9dd-86e56d7ba6d2@xs4all.nl>
In-Reply-To: <2326f490-d9dc-4fa9-a9dd-86e56d7ba6d2@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 12 Jun 2024 17:06:35 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C60LJT=Qc2_RqXYazsmCK5xWQ7oXW81K7=McL6Q7=A-g@mail.gmail.com>
Message-ID: <CAAFQd5C60LJT=Qc2_RqXYazsmCK5xWQ7oXW81K7=McL6Q7=A-g@mail.gmail.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
	Hidenori Kobayashi <hidenorik@chromium.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 3:47=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 6/12/24 06:12, Tomasz Figa wrote:
> > On Wed, May 15, 2024 at 1:19=E2=80=AFAM Daniel Almeida
> > <daniel.almeida@collabora.com> wrote:
> >>
> >> Hi Hans, all,
> >>
> >> I=E2=80=99d like to attend in person and discuss the use of Rust in th=
e subsystem, especially in light of [0] and [1].
> >>
> >> Please note that these are new submissions that are unrelated with wha=
t was discussed last year.
> >>
> >> 30 minutes will do.
> >>
> >> [0] https://lwn.net/ml/linux-media/20240227215146.46487-1-daniel.almei=
da@collabora.com/
> >> [1] https://lwn.net/Articles/970565
> >
> > Somewhat related to the topic: I see potential for a quite big
> > redesign of the videobuf2 framework going forward and recently with
> > more Rust adoption I'm starting to think it could benefit from being
> > implemented in Rust, since we would have to rewrite it quite a bit
> > anyway. Especially since it's a part of the subsystem that has to deal
> > with memory management, object lifetime and asynchronousness quite a
> > lot and we had a history of issues there. So it could be interesting
> > to hear everyone's thoughts.
>
> I think it is far too soon to write a framework like that in Rust. To be
> honest, I won't even consider it until Linus officially accepts Rust as a
> second language in the kernel, instead of as an experiment.
>

Given the speed of development and adoption in drivers, I would
consider this just a matter of time. And the redesign that I mentioned
would likely need quite some time to prepare as well.

In addition, the more secure, redesigned version could coexist with
the C version (as an experiment, same kind as Rust support today), as
I would expect that the driver API would likely stay the same. The
redesign would be mostly about how things are handled internally in
the framework.

> The vb2 framework can certainly use some more work, and esp. better suppo=
rt
> for codecs, since that's where the main pain is at the moment.
>
> But I would need to see a proper proposal first. I assume that's what you
> plan to present?
>

Actually, if I could get a 30 minutes slot, I could indeed present a
list of problems that need to be addressed in vb2 and some proposals
on how to do that. (And why it may require going as far as a
redesign.)

> > That said, I wouldn't be able to travel this time unfortunately, so it
> > would be nice if we could arrange this topic in a time slot friendly
> > for remote attendance from Japan. Also +Hidenori Kobayashi from my
> > team who would also be interested in joining remotely.
>
> That would mean a slot in the morning, right? Since Japan is 7 hours ahea=
d
> of CEST.

Correct. I can probably stay online until around 8pm, which should be
1pm in Vienna. (So I guess until lunchtime?)

>
> Regards,
>
>         Hans
>
> >
> > Best,
> > Tomasz
>

