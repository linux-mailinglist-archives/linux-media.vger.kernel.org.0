Return-Path: <linux-media+bounces-19501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F26A699B5DB
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 17:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 958F31F227D5
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 15:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F225A199B9;
	Sat, 12 Oct 2024 15:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSoNuYsE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0298A17C9B
	for <linux-media@vger.kernel.org>; Sat, 12 Oct 2024 15:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728746852; cv=none; b=uD30YdDHmPQn/TjDV1iKZFIJ/are3ZB/poZR2TfmYBbCiqdSGISmcmAN68wm3eOYlL+6aeL8Lk3Ei7Cj+5T2N+PLPT0gcpSyy+0cwFptQcMbX6tE0FEf797kfyu/53UhXXD2t6VPIuYZFMnEUMGvSWSOv/miJ9fHMmUD5/x0AwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728746852; c=relaxed/simple;
	bh=kNKvb0rNVp6vzyaGUwTGZygx9ZxekG8yqQEp4jqXF1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N8h8T2XkCKIUpDIzbgNcVXB9Itdgu9ZiWX6nkXoyt0onJxunKZbYfQ0gIRTmFNm3+w/jzX4k0b39Em4djOTwNe7a4FnS3cLHX7L4ZXLFFfOHSPfihzkF4Z5XGxA53MMmHnFaT76nKp3MLtO1VEoMVeeF6ZgxnEjwfRZfegnu+SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSoNuYsE; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5e988c5813eso1448087eaf.2
        for <linux-media@vger.kernel.org>; Sat, 12 Oct 2024 08:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728746850; x=1729351650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrZ2z4OAc7My1Ph9G3EUZe1keZZllltflrTof5pqzsk=;
        b=bSoNuYsECvAto2sgZ4AZgWYfzZR4eO/02s+dgJMazZgWRhtYG5CCGJRzsIg39PxZr4
         Fpa7MbvWRcuaWbc1JoMndDZKy0kPdG1B4To6GPwlV9ea5d8kq60+vyMmY75OXMZa4Ots
         23At5J79ldQqsFzyz2ToQIMspOR0h1ZCj8at8KmPAmq7YxKidgt0hj8WlUDxU5pIXOhf
         L3TUBBvMmEuuGtDhgSyjY1VtF95gSnzr2EUjlZs2xk/brcDtdzqUF36o7q7uonoyUFjD
         IeDiBEHYK03so9pCIn3tzcaWv6Y29SE4ZT2QC53q2N54arAtZUinrmzb0QA+afyKueyz
         52Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728746850; x=1729351650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrZ2z4OAc7My1Ph9G3EUZe1keZZllltflrTof5pqzsk=;
        b=Oqme+fEFg+AnySoY2eI8CA31nmwfg/rxFwmMAntRimJfyHmZczPT5FlBLvO7OFSjZG
         3pOtjr+JA+IosFyKSXqRFdnkqY/T0s05wcyR1VyUno2o4ySrM9orHK2nSYwVqtxgyqR8
         6wY1Mn7o/jN8xdKB0HsD0vU5H1JiROK56RG77QrWtfPjnw55v7R6i4QnWtsdtVBRTuU+
         irZrlmBWE7eIXIJnqlPc7WcQbcBjaFBTK+9MM364r8uOQdw8kOq4ll0ivCs5mric/cTe
         TcCInmHxRVpxn1GOyU4DmhskvPiEkX5tjYOfyzXLvoQxMUqBD+RYmOap/nAhOw58ZDl9
         whhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtdW6241mK08CpmB/NEiCdFp/3ZDcoBm+m1c7kQC1zd3qgukwNn8AXnZhO4AgMwfPbK4X7IyzqsHucPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFNqCzWDeAGSQrKW3lkMcd/0uhuYGr9Rx1BQ7wT54yVtj/5WRg
	0/sT/X4WpfRM4M19qazVQlMl4pbhhx0hghD4oeqwKVaLPhRjRrefWaJPTBfHB5jLVvG2OXCliXg
	UK8BqAQMGIclHIY+U3vmc2iVZJOygmQ==
X-Google-Smtp-Source: AGHT+IH3neqkdOpTr7uWA4n6mK3DF46/N7yEwf/kYso7EVeWqFHV1bhL0Dh+3fdbylsFLcWiO/O4Cnuhjp3DRDrCGdA=
X-Received: by 2002:a05:6870:9f85:b0:27b:583b:bfc2 with SMTP id
 586e51a60fabf-2886d9e7649mr4973605fac.0.1728746849998; Sat, 12 Oct 2024
 08:27:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011070828.851449-2-u.kleine-koenig@baylibre.com>
 <CAMhs-H8-8wmg_OqxQrO93ZV1Mrh-2GKowoWpvdk5qkvQbQ-F=A@mail.gmail.com> <m5ezhgxp5kwup65cieicws5fviwdapqmwm6ldiojic53pgs5tj@iu5u4wf74fzk>
In-Reply-To: <m5ezhgxp5kwup65cieicws5fviwdapqmwm6ldiojic53pgs5tj@iu5u4wf74fzk>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sat, 12 Oct 2024 17:27:19 +0200
Message-ID: <CAMhs-H8ziPqHPSyk0Hfjy9DWvMTHH035jeoanqxCW9K22rY9fA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 11:46=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello Sergio,
>
> On Fri, Oct 11, 2024 at 09:39:09AM +0200, Sergio Paracuellos wrote:
> > On Fri, Oct 11, 2024 at 9:09=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@baylibre.com> wrote:
> > >
> > > After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> > > return void") .remove() is (again) the right callback to implement fo=
r
> > > platform drivers.
> > >
> > > Convert all platform drivers below drivers/staging/media/ to use
> > > .remove(), with the eventual goal to drop struct
> > > platform_driver::remove_new(). As .remove() and .remove_new() have th=
e
> > > same prototypes, conversion is done by just changing the structure
> > > member name in the driver initializer.
> > >
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> >
> > I sent a patch the other day to convert all staging drivers to use
> > remove which was applied yesterday.
> >
> > See: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git=
/commit/?h=3Dstaging-next&id=3Dc1a5060ec80020ce879fa5b2a16875bd9a5ab930
>
> If you really must grab this quest from me, please coordinate, or at
> least Cc: me on your patches.

I did not know you already have patches for staging and only sent this
to the staging list itself. Sorry for that. If you already have
patches for remaining stuff I stop sending patches about this. Sorry
for the inconvenience and let me know if you need my help in any way.

Best regards,
    Sergio Paracuellos
>
> Uwe

