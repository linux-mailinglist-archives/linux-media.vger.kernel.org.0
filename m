Return-Path: <linux-media+bounces-14605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83473926761
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 19:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16661B20C5C
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 17:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD591862BE;
	Wed,  3 Jul 2024 17:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pfX2WZcY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A101C68D
	for <linux-media@vger.kernel.org>; Wed,  3 Jul 2024 17:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720028738; cv=none; b=B4DAU6KRWCrupVqM0PQhLcLhs3Dnktr/BXxJ6ybIHIEx6oHqlY6a686De10pGtbkmXVaEXtuh11oVLXpv4N7IMGEQ0yQPn+tHoiCjPubrcBIDxdm+a3mW2K5s5ZJp/wxhldmEbzyiqe2fD5n5jdYoV/wpji6FdZe/NFbJB4IJJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720028738; c=relaxed/simple;
	bh=ZFx/AckbAn6Lg2bbrC5Gs3Kyo9xcbmBm8MnNgPXHVZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JSI3j83zZojnXgiteLwCEvDmwVyN0SNCynKaIEnciy83e9AAs/oeRMbOTdssewwh7Yxx/37tJSjdn3qqPLSJuy9MkG6XlP2h5HbKFKiTxJcUivnggsdfjgEOrd/DMJ64PdxkZ1mMo42FsxSWq9Qx9FoiScMzch0dcGDbfW55e9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pfX2WZcY; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-64b417e1511so51862417b3.3
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2024 10:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720028736; x=1720633536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhxR4AnmOLb2e8qgt4elcn3tmPYz1HfQBknaKkg9ViY=;
        b=pfX2WZcYWJxW8EgUYeR4iqpcFNMNlk2PI1rHa3mDFv12nL0Z4Hmjhj8bLu8y5zU59V
         jsjXr6CgtAiXyNT5r/U2nj1ASKZ0BKqoP3MB5nP2UwN5EAVncegani8pyuOt2Y3HFue5
         66gZ3L9qTBwJZ0vO8jlKqCzyN315Yky/gBTOsT3lf6mXv/PED2CWMyQKMgSSoDvtbKqZ
         XduELPVoftWrGyFVUPfOZao1XpLQ9DmZ4QlickrZ1M3jdO5FqXqeRv6YyXP0aMtADNUb
         SxsMs5m/4WqPJwzRVUM9+BnjWtXeeGQjEKl6KeHVkcNIJgRg7AFy7eb9czZP8//Xb6Hd
         zVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720028736; x=1720633536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhxR4AnmOLb2e8qgt4elcn3tmPYz1HfQBknaKkg9ViY=;
        b=U4mpVDDYxAS/+KFRMQ58ZNwFY1kEF73xRK2Oka3VB5d+asRKMAgDan6PTPwYBlEYvR
         PkEvl0/VQNRqWQQ5jzYJwUr7vccUOTVuendotgzvrPSxJKDCUZH0/0jLKKutz0jek34D
         hlQ2FZqsYzoOYddZJ3RcHqxvpt1QsDCsxqCxsySGEVMWxnACXaA/GgBkEkp1yPPXX3OX
         BEbJCAn6IV8wm1VLrWUPlWDOGRkQcaRPQSGHe2nZbJ9aTyvHr3oLJtAP0ozNaL3lYkzi
         hv2MKXXcWHZYfgF+EIR6o+BBld0fmXqHDYs109G2hGYkN106QtRBJUMngZdqLFXd1pDz
         vJDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGqj/s77C1LvTDueiuvrER+xIWwIfh2eSZmQJyJ6T0Eqa8e86IgGV4X4T+2wDI1yTayqGVEanz19o+1IIIdem+oyLSNtYhw1gy7zw=
X-Gm-Message-State: AOJu0Yybwt6GE4ESpk3UwzIw2aVcz9HZKxZJRwYwSre5kWfDpxB9Dfw7
	MEylkbECwYUjOf4btXBBig7xFDg9jm5OpJ2c74zI8G03Db3qJkRuejue31dL0Lt1r7FKWeHIjZy
	UTfOggbpYTO/oCCUl6zBYgnJsY8+mwq9EeKPN
X-Google-Smtp-Source: AGHT+IGhOytUB8CaG/gAFJEC68exEInJu4ze08dBFswC7EHqqNiHxCYGfnPatnT8gPM2A0u1TbA00DVz/5EvCS/GRV4=
X-Received: by 2002:a81:7c54:0:b0:646:25c7:178e with SMTP id
 00721157ae682-64c7123c013mr127129437b3.5.1720028735529; Wed, 03 Jul 2024
 10:45:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240630011215.42525-1-thorsten.blum@toblux.com>
 <20240701232634.0bddb542ddea123b48dcabdf@linux-foundation.org>
 <20240702064017.GA24838@lst.de> <e0f384b0-6913-4224-a3ea-bdae784f5dab@amd.com>
 <20240702003357.6bfd1d918c56d536bb664c37@linux-foundation.org> <CAJuCfpFCiUfpa45rG74zd-KoQcaA2fwgUw86iSF2CDiFrXCOdA@mail.gmail.com>
In-Reply-To: <CAJuCfpFCiUfpa45rG74zd-KoQcaA2fwgUw86iSF2CDiFrXCOdA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 3 Jul 2024 10:45:21 -0700
Message-ID: <CAJuCfpHJPtduJwOyxTFT9RVmWZCcWULWhUN4ZPEt6earHp=MXA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Remove unnecessary kmalloc() cast
To: Andrew Morton <akpm@linux-foundation.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Christoph Hellwig <hch@lst.de>, Thorsten Blum <thorsten.blum@toblux.com>, jack@suse.cz, 
	linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 8:15=E2=80=AFAM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Tue, Jul 2, 2024 at 7:34=E2=80=AFAM Andrew Morton <akpm@linux-foundati=
on.org> wrote:
> >
> > On Tue, 2 Jul 2024 09:13:35 +0200 Christian K=C3=B6nig <christian.koeni=
g@amd.com> wrote:
> >
> > > yes that is
> > > intentionally a define and not an inline function.
> > >
> > > See this patch here which changed that:
> > >
> > > commit 2c321f3f70bc284510598f712b702ce8d60c4d14
> > > Author: Suren Baghdasaryan <surenb@google.com>
> > > Date:   Sun Apr 14 19:07:31 2024 -0700
> > >
> > >      mm: change inlined allocation helpers to account at the call sit=
e
> >
> > Dang, yes, that was a regrettable change.  But hardly the end of the
> > world.  I do think each such alteration should have included a comment
> > to prevent people from going and cleaning them up.
>
> Sorry I missed this discussion. Yes, the definition was intentional
> and I will add comments for all the cases which were changed this way.

Posted https://lore.kernel.org/all/20240703174225.3891393-1-surenb@google.c=
om/
adding clarifying comments.
Thanks,
Suren.

> Thanks,
> Suren.
>
> >
> >

