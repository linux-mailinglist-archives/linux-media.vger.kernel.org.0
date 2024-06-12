Return-Path: <linux-media+bounces-12996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B65C6904C6B
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 09:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C4A61F21198
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 07:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E3D13B59F;
	Wed, 12 Jun 2024 07:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SASMj3Fn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC4413A275
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 07:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718176234; cv=none; b=GZHHfTWh5JUQdH/DN7pCqjqpXBlEi32vNP3kET6c4vl8ilDH9yFJu8lJ8cIbImk1S/NHZnfZqZFjyGGHIX3cfYw8qOqmO6968UPfAK58CA7155/gO8A9M7lInJN8hGb0fIBKtmHodxyXKDUFbKIlW/B95wAob4gDC2w4ojNr/og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718176234; c=relaxed/simple;
	bh=1o/gFU9Ian4pVcY6MxgbiyqxezsRx4Nv+5BHP8bQw0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y35Q1GBbRXygxt8LvgAQ13+p+5mTdA4C3FzZgzVf1aubPkTOzKgtTaOL78yo9VJXEYPZiAinqhd70EeoTma8P3iYAdVF/MT3EvApYmFQ88zVSBSNPzzkPg+W19mSzimRmAFJU9TzOc2tpGwu7kR/l1i5IhwBrVlFyobwzY6qaY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SASMj3Fn; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-80aca73c536so1748968241.2
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 00:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718176231; x=1718781031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bM2+17oBlePEtcKdiUjDY5lch+b1Yrq3cISRNdJNQ8=;
        b=SASMj3FnOWkwNu9DtlKExiTROBhrFdkY4OSszh7M9+yYKQC4wrT0JAk0VZOF+QbQhn
         tp2useE+120oYoBFqvyoiN+M12s6exvHl+IYCFVlI9FxsPi64jOle8eqCSNhBLsF+uXM
         CNTBcM0V3IqXQ39f5cp6LWJupEIfWHQAlviF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718176231; x=1718781031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bM2+17oBlePEtcKdiUjDY5lch+b1Yrq3cISRNdJNQ8=;
        b=r+7506UXFJrh6LFHs36k1eswXCHMud6YTpBRN69QDhYXQPVt/9OZ3ojSPo8GnVejAJ
         +RGkp9TQc1+BpVh8g73VO6gDADUY/Oh0BwGx585bV9hEn+Eqo6SLO2rk9oowvkNv1qeu
         wXxbp3ju/PW6dZ2ma8LwkUm+w0+1XxDzUiBRCFSm4gui/4emkqGiKdw6hb2Drv8XodQm
         wwCz7MwISNoHGLq7s6Gzdot47TfxmgqpfBjZCOkzRaR2fCeSF+BPQE1mxeVDRSXLay3S
         Z9C3+v5KGBZfO9t29CS/nMkANm6jbaRhTnh0Ajj2EpfWHGO8s4FldttppSjGv5iIlVtV
         Ftpg==
X-Forwarded-Encrypted: i=1; AJvYcCWeh51qZkrWP3aSyoy5aDmjtZEkKkc1Oxib/Z2v+VziniK5F97oMARKOQ/KayjgBWser/Ye7Tsqw9xl1xf6YYohGghZh9XJU0mD4Cc=
X-Gm-Message-State: AOJu0YxvZp5YCwps/69lACtm6glsxIUhyA626U5ARClWE7s6To5IPCvH
	/LAE74M5YYW7FL95iK3q8mAsL4yY/cNECFwZf5HiHu5rfkz4BD3/REd5jWDvGw7w00ZpvLcVNEA
	DekWPM/ozaWi2ALVMh3aAt0SfsFZBkIldfwY+
X-Google-Smtp-Source: AGHT+IFS5KzcW4igNK03/Q0JcLKEr8IqRAJwrlw/d3oQ8lo1omrdlx4NCq2DVKKSP0yuXtc8dziCh8t349+sSzRpFv0=
X-Received: by 2002:a05:6102:3225:b0:48d:89dc:ef62 with SMTP id
 ada2fe7eead31-48d91e707b4mr991266137.31.1718176231503; Wed, 12 Jun 2024
 00:10:31 -0700 (PDT)
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
From: Steve Cho <stevecho@chromium.org>
Date: Wed, 12 Jun 2024 16:10:20 +0900
Message-ID: <CAC-pXoOO2=L7B5PuCyrYMXCrDGEPHcOPM+O7RE9Px2L1A8KzFA@mail.gmail.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Tomasz Figa <tfiga@chromium.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Hidenori Kobayashi <hidenorik@chromium.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I would be presenting 2 short topics (15mins each) following Hans's suggest=
ion.

- V4L2 testing on Chromium using virtual video decode driver (VISL)
- V4L2 video decoding testing with KernelCI

On Wed, Jun 12, 2024 at 3:46=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
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
> The vb2 framework can certainly use some more work, and esp. better suppo=
rt
> for codecs, since that's where the main pain is at the moment.
>
> But I would need to see a proper proposal first. I assume that's what you
> plan to present?
>
> > That said, I wouldn't be able to travel this time unfortunately, so it
> > would be nice if we could arrange this topic in a time slot friendly
> > for remote attendance from Japan. Also +Hidenori Kobayashi from my
> > team who would also be interested in joining remotely.
>
> That would mean a slot in the morning, right? Since Japan is 7 hours ahea=
d
> of CEST.
>
> Regards,
>
>         Hans
>
> >
> > Best,
> > Tomasz
>
>

