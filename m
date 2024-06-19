Return-Path: <linux-media+bounces-13709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC4E90F0E3
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 16:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EC831C24919
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 14:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1338F1DA4C;
	Wed, 19 Jun 2024 14:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EJaiHwHp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521644D8B4
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 14:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718807875; cv=none; b=Nm3ZTiq3pLCBc6oLcPkQsI4oOjtiRMG58aPnvOkUt9zh1GNJukaaiqr0buZQWRqJ9FCNVhW92w/2CK9iq0+N59d1JRmozYF7eXqE4QUhVHymNSceHEry/X5iN6ej0n90hkjJ17lcdIG/dyjgJ2jyDMV9iXt+kIkXYhgn6UQ7CXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718807875; c=relaxed/simple;
	bh=xz8466KeS3kFFR0h/8XeCqzSrxi1hZ75OsH8Tv9FjPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k0iQ3qJ+vXpN9sYzamVTm4Rv7SHJ+q1bCIC0Gdhq8Lv7wIg0IDInc9BEpkJA9BYQvW+9OOFUSrt/0wo4DOSmTLUjoc0y7wtGt2hd6gDmHA8OpZkU1oheiUr4V07E0VnfLB/y11JmFDI1UV/FIQyPE8YTLG/xlHd7dz8fzr4+rkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EJaiHwHp; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57cbc66a0a6so540576a12.1
        for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 07:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718807870; x=1719412670; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mW6qIwgaMhv1Ukx6IUSceUqe9uJpeRHrbJHiEQy9EwE=;
        b=EJaiHwHprRqUXvGvwRBw5AcTvT/Qwd758d8F1zyOXd//VDqQphHziP4K96uf9N8337
         q3Un43RAtXDTkVE9XbcbNo3n2e2Y5ZsTExjxncHstu2VLXiYmKOe7adTi2iSBJMkSWgL
         VCuTLibikSimhZDssQQZCyV7XC9yFLPT1O2nkkPDY4FOg9rGGudFjwv17R7B32+FWC+h
         8tZLRqA31RohYeZzc3CKHmLX8rhqskC9t8IjQsXqJR/S3EKR756zKwx14J7fewvUQtx9
         ylJyCz7vk5PLewX4f+D28tNuj0qIJuXE6UAtjOUJcb3C68cZJCqYVZ3Vbb3gHYIZmaa5
         N7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718807870; x=1719412670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mW6qIwgaMhv1Ukx6IUSceUqe9uJpeRHrbJHiEQy9EwE=;
        b=NrhK2dUArESOIrsTkAXbiEfcm7v/1EDeTLR61BF+xvZnbMHhkTQ/PdhZnoIq3p9SPe
         7A28yciBL1tW62hju0vOsaN0XvkIgWLNB2k185vpfTwjqnD6Y1uW/4W44DDXzQ4wVi5J
         oaqXLPnhLw7AyFCLkMXpL/yTgi0nj2m1tqaYb0SC8dBev3YxlhRIC7qaTWP+63y/NE5o
         yfpZtZo5EAK1Ct7k07SvX4F3H5MUCddarHWxPLytfJYP14pWpwZP8hzgqhLyYkYMvhTF
         gXblVV2akBnJeAqT55VUzjRzRVjXq3io7NMu/S4vQW9zl/ODasIV0t3yOf0V90zmZ22x
         Zd2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVavVtP7c5M1QQs9TaOuWTZqKuLrBZu39l6tiu3MEV3ipJB5ISjIeYE+hzyUMifHE3V+8SEFYff5rtmcTz7xKcYEaTVrpOUdjljJYM=
X-Gm-Message-State: AOJu0Yw6AHFMJd8ahReo/iKCCvu+5WHpUH0iuyj5gaqgl2EXTn5inXye
	H2imdXlBt6XtCGSTW0U2zUV0whhtlbUyi5a2/HBTu/+scT6VNLg/1agfL3rTb2QbdP47XwcRniH
	oErP3rkv01lDbVb5oisbkp/5z7PT2OC/FSuBZQA==
X-Google-Smtp-Source: AGHT+IHuis2PWxnbeePb9S0U1LQ2x2sGfOwuZsNdXB0g7qlMm761qcR5dMpoqfdYtNv6UIguJ9ZLskZKA13dNPaiPkc=
X-Received: by 2002:a50:d4da:0:b0:57c:b82e:884b with SMTP id
 4fb4d7f45d1cf-57d06ade10bmr1620556a12.19.1718807870558; Wed, 19 Jun 2024
 07:37:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606020213.49854-1-21cnbao@gmail.com> <ZmctTwAuzkObaXLi@google.com>
In-Reply-To: <ZmctTwAuzkObaXLi@google.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 19 Jun 2024 20:07:38 +0530
Message-ID: <CAO_48GE_YHFFjKBb6hhZQ4--3j3H3+AUTaPkZWfHTGgBa=b78Q@mail.gmail.com>
Subject: Re: [PATCH] dma-buf/heaps: Correct the types of fd_flags and heap_flags
To: Carlos Llamas <cmllamas@google.com>
Cc: Barry Song <21cnbao@gmail.com>, linaro-mm-sig@lists.linaro.org, 
	linux-media@vger.kernel.org, Brian.Starkey@arm.com, 
	benjamin.gaignard@collabora.com, christian.koenig@amd.com, 
	dri-devel@lists.freedesktop.org, jstultz@google.com, 
	linux-kernel@vger.kernel.org, tjmercier@google.com, v-songbaohua@oppo.com, 
	hailong.liu@oppo.com
Content-Type: text/plain; charset="UTF-8"

Hi Barry,

On Mon, 10 Jun 2024 at 22:14, Carlos Llamas <cmllamas@google.com> wrote:
>
> On Thu, Jun 06, 2024 at 02:02:13PM +1200, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > dma_heap_allocation_data defines the UAPI as follows:
> >
> >  struct dma_heap_allocation_data {
> >         __u64 len;
> >         __u32 fd;
> >         __u32 fd_flags;
> >         __u64 heap_flags;
> >  };
> >
> > But dma heaps are casting both fd_flags and heap_flags into
> > unsigned long. This patch makes dma heaps - cma heap and
> > system heap have consistent types with UAPI.
> >
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>

Thanks for this cleanup; pushed to drm-misc-next.

> > ---
>
> Looks good to me, thanks!
>
> Reviewed-by: Carlos Llamas <cmllamas@google.com>


Best,
Sumit.

