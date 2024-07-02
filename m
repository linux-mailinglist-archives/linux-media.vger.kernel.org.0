Return-Path: <linux-media+bounces-14543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9BF924217
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 17:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A57728931D
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 15:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0309B1BBBD9;
	Tue,  2 Jul 2024 15:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SZbEu/VZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FF21BB6A5
	for <linux-media@vger.kernel.org>; Tue,  2 Jul 2024 15:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719933336; cv=none; b=TcrK0+6m1q19jNhfnnJxyt0PptcU8aTSIoiJuyp094LjCdmFWeAdxJl9Rdkbs6CMO3ASIxYNUs13eQ/kx5goVV+vDasFhi9YRG+pJALxYiq7f1MpJsfDg0caMxFeVH4EPQOSlvFqUYHgJX2rbKwbsw6r+fa5yvY50pD6mKl9Qzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719933336; c=relaxed/simple;
	bh=7xkuEo06poUvZl7/TJP1HQiPecOFXIyvKsS9JY0m35E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpZ8ZXMfWpUDHOmw566c9gQotPaqXvPbE3+NLvZhW79Ik/WAp4cIgrE20CqR3lqGA82+hzv+kBI4Odc2/7mbPKEwu3ifvNZfIX34Fgr+21UL1cD2YtgkEDQevZL0ge4dw0stpnmkrWb3aZu6RhpQQIkI9oKJofrTsCjXw5+3xdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SZbEu/VZ; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-64789495923so38221487b3.0
        for <linux-media@vger.kernel.org>; Tue, 02 Jul 2024 08:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719933334; x=1720538134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNWhwi3BuKwIDlYJ+Eok6lmEciKDFhWO/KDN1iS7pU8=;
        b=SZbEu/VZbaoF00WnZDPy29RDbBtku+4zR10fxiYlV7XZWgbTasGtM2FCaXV/9Uyjq8
         pPa66Z1tivn+nqRZ2QqDD4bRskwEYFVqJHo0rv5pf8rGCeqsxQw2Zu9Sg0JDqQBFdGeL
         PyV0teWIe3tSzfhuF1aFqXPG/w3bEf9xu5irU2NXm1u7mLzDZ3EE9TCxAhxE7r+pirq6
         EwETQn8lbXJrz8e7+MHpv2eYSy1HQP7HoTayqGUUTpPp6WXwxixkXiQaMCG/YrlRWtMl
         wWGXd/N3sXDQYkA6rfju2a7+MdsilUxDjmk0PCOmuC6DPO3ZlGhsP8CWxciqylE2zjtg
         aN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719933334; x=1720538134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNWhwi3BuKwIDlYJ+Eok6lmEciKDFhWO/KDN1iS7pU8=;
        b=wzbdEDgtgQIM2ry/lYzOena6iO+ajSW8zX5+lJ67qH/6OawXXjB5Tm7AOqjMZZGni6
         /+08RFM9aPQW5eIybBGM0azhMenfEeLgCoIYyOgkgNymvym90jKp+aHlBKXgPAJAVrCJ
         Vj8asYE8hapv0TdlgrE7w0T537N2Rvy/FMx03jnkLc4vw1axNUS1yYSqll074gl2buyZ
         r/S1NIOI+SzcvXkHe9KvR5ugI6rRrRReUKSoz4htT6CO/x1IozR/dCZwQJTDkcEse+V9
         1uoSKcUZJurf12nJlz30GZbNJSrekgioWU5dQkOamIW3MxO9DHR+CZmLVu7WshYCI0rG
         b1VA==
X-Forwarded-Encrypted: i=1; AJvYcCWKzFFvq6owNJNiZ2FMzry5cgoYzo0p3eOsYxf3kTOVkreEuXkBz2iQpFNqGK0adAAfZx3zLfaUJ0uEYamkgtNBM2CJJFD4MmxYYTA=
X-Gm-Message-State: AOJu0YzUv8wc2Tzug7FQ0bnyyKcPxhylbjCKgQ/Iurgrz0eV8nMwrBKe
	31cm1jCer0ZDAn4wifkwJ12ASYB5WrIpd1hjtGwd/Q3JSStATIaTHaWqKKUVEK83kjHXuRPShQU
	KH10XmHOiq5kteTgibjsoT+AV5tlttWAOezzg
X-Google-Smtp-Source: AGHT+IG2EeoEjGrNJPimBuxzgEbGPnYMmLCli/IQeFkWY+JfiCJPJ3fhsOk218T1gggIpWBX9AKMu5hfbJ1J9S3AKQI=
X-Received: by 2002:a81:ae17:0:b0:650:9799:41d2 with SMTP id
 00721157ae682-6509799460cmr10823267b3.30.1719933333549; Tue, 02 Jul 2024
 08:15:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240630011215.42525-1-thorsten.blum@toblux.com>
 <20240701232634.0bddb542ddea123b48dcabdf@linux-foundation.org>
 <20240702064017.GA24838@lst.de> <e0f384b0-6913-4224-a3ea-bdae784f5dab@amd.com>
 <20240702003357.6bfd1d918c56d536bb664c37@linux-foundation.org>
In-Reply-To: <20240702003357.6bfd1d918c56d536bb664c37@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Jul 2024 15:15:19 +0000
Message-ID: <CAJuCfpFCiUfpa45rG74zd-KoQcaA2fwgUw86iSF2CDiFrXCOdA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Remove unnecessary kmalloc() cast
To: Andrew Morton <akpm@linux-foundation.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Christoph Hellwig <hch@lst.de>, Thorsten Blum <thorsten.blum@toblux.com>, jack@suse.cz, 
	linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 7:34=E2=80=AFAM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Tue, 2 Jul 2024 09:13:35 +0200 Christian K=C3=B6nig <christian.koenig@=
amd.com> wrote:
>
> > yes that is
> > intentionally a define and not an inline function.
> >
> > See this patch here which changed that:
> >
> > commit 2c321f3f70bc284510598f712b702ce8d60c4d14
> > Author: Suren Baghdasaryan <surenb@google.com>
> > Date:   Sun Apr 14 19:07:31 2024 -0700
> >
> >      mm: change inlined allocation helpers to account at the call site
>
> Dang, yes, that was a regrettable change.  But hardly the end of the
> world.  I do think each such alteration should have included a comment
> to prevent people from going and cleaning them up.

Sorry I missed this discussion. Yes, the definition was intentional
and I will add comments for all the cases which were changed this way.
Thanks,
Suren.

>
>

