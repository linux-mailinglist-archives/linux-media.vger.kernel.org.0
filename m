Return-Path: <linux-media+bounces-23129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 899739EBFBF
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 01:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8403A2838EF
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 00:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A863259C;
	Wed, 11 Dec 2024 00:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="YpLjZILz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B33195
	for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 00:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733875479; cv=none; b=dftF+oezmqQYVVymkgYR0Wv155V/fMZP01iz4tWkX5wZSrYRaPSJSS7CKp5zBJn0zfsR8b6KejDg5BI8YI66gYC0XP0ElE51bSlLooqf8W9DrQCtopZJWT7CJ76AZDhc5rPcD+HnPlaELUT3J+UQkvvTjwvLmJd2GMF5XzWc3+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733875479; c=relaxed/simple;
	bh=OCHV6HmvuE1qzKNAPSoYhRL/7FV4ReXNkxuSygUjwFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TenxGcqHlN5rr8mREsQJS0WILqgnlyJdoDDxw3fSWPjOmxpmY9mgeW+hdZV5vqavW8py6+mG5nXrwFuiiBEP/zzR6b2n6j9Kv+WfK6Hj8vTnlyPhzNitBC69JA8+3W0dqUBNzNcnVlf37aRXkB4e4Mt9ew2cpeSNYK1HhqykvJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=YpLjZILz; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e398484b60bso5099546276.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 16:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1733875477; x=1734480277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCHV6HmvuE1qzKNAPSoYhRL/7FV4ReXNkxuSygUjwFc=;
        b=YpLjZILzLMYgXC7X3hw3H3EPw5j4ApF7GiexGBB+lCJcoVysqfJDNhgGbn3MTUGS11
         vt+LQTNUBG2/RV6wYQUAcf4Yl/tMbLy58Fj5WAacs1QD0H7VMR4ZR4g3TwScRCEMN+vp
         ML4mzeT6dy5kpGBM0I1acJnIeEQof47hQ85Mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733875477; x=1734480277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCHV6HmvuE1qzKNAPSoYhRL/7FV4ReXNkxuSygUjwFc=;
        b=RX2J+GexclVufZQ5Kd5pf8QgjNhIsBoliDhb0GfaCfhtOXy8Ylrg8amrRLPC/YGQcm
         fWa42PQkcQe61rDgDGMbaLrntANT+tR7LLqDBHoYFL74Sk1e7SLgfPuqi2oqkQhLSRnZ
         Hd36S3nFkzN+Cj3yLWQ1wQRvvrT3df32FSsMpaFlPbGHkFR2plRpab0qtBQJ9swKrX3I
         xOnlGpMmyiVSOdg049BK3KPZ6qiDQhfFlgvpAOukAyCh5G4EP1sR7kaTjA1XVQ9dNOjC
         74RR23vlFVFXpAxlNhAOXfm2qQW6FXhzOka7lKTr/wGzi9UmnTxn3Bbneno/KG30TXHO
         dHcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVErdtGY1l8Wkr7PIoLi4BWAkqyvAlRbtClMqSvNzbo4tL1WuAeRlVZ9ZObUujFb3onpJ5kLQ4GDgp5NA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkk8VomT9tJ53xr6d0CbbL+fI418szX64XQqtN/0SxeKOMjSyB
	qc0YWrcRk/ZEyEhG/COkHt6ttPWrJTNJ/x/1QMh20uyTQKp3o8z5tdCHDXk1h/jaAwasIuUVr5O
	yeYySAvLMkApD4AIDt51qvZVU8lwLGDQ0kjp9jg==
X-Gm-Gg: ASbGnctkRyeuNxjJq73wzR0Cubd/ZT/HCQDRXzZW4cD5AY6zCkxTaj1GyZODnA/hXSs
	B+Vkirfkk8x468PNH35vRAyj5q4N26PYOFliG
X-Google-Smtp-Source: AGHT+IHAdKnSSZvTjoIr7mwXDQmX65FsKpemA7psolWqer3VHIGe/o3rpMktPHVLVXQ+RdM6hXLdwcEW5U5tsp0AJDI=
X-Received: by 2002:a05:6902:120c:b0:e2b:e0ba:d50 with SMTP id
 3f1490d57ef6-e3c8e42e3a6mr1140093276.5.1733875477096; Tue, 10 Dec 2024
 16:04:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
 <20241204-udmabuf-fixes-v2-1-23887289de1c@google.com> <CAEXW_YRb4PsFgEvHW2QBDY5dxJ+aoMTn3qtj5v9eboxO3SxPLg@mail.gmail.com>
 <CAG48ez2cTrD2_4iKo3+zrPH=e29znYOKLBkC4OLA3yhsu5oMNA@mail.gmail.com>
In-Reply-To: <CAG48ez2cTrD2_4iKo3+zrPH=e29znYOKLBkC4OLA3yhsu5oMNA@mail.gmail.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Tue, 10 Dec 2024 19:04:26 -0500
Message-ID: <CAEXW_YRUVwWxuoWs1fU8OCsOf+vAWc__csX2Ed0W+yVr0Y49aA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] udmabuf: fix racy memfd sealing check
To: Jann Horn <jannh@google.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, John Stultz <jstultz@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, Julian Orth <ju.orth@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 6:12=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
>
> On Tue, Dec 10, 2024 at 11:51=E2=80=AFPM Joel Fernandes <joel@joelfernand=
es.org> wrote:
> > On Wed, Dec 4, 2024 at 11:27=E2=80=AFAM Jann Horn <jannh@google.com> wr=
ote:
> > > The current check_memfd_seals() is racy: Since we first do
> > > check_memfd_seals() and then udmabuf_pin_folios() without holding any
> > > relevant lock across both, F_SEAL_WRITE can be set in between.
> > > This is problematic because we can end up holding pins to pages in a
> > > write-sealed memfd.
> > >
> > > Fix it using the inode lock, that's probably the easiest way.
> > > In the future, we might want to consider moving this logic into memfd=
,
> > > especially if anyone else wants to use memfd_pin_folios().
> >
> > I am curious, why is it not possible to have a reproducer for this
> > issue, is it not reproducible and is theoretical?
>
> Sorry, I think I must have forgotten about this part when I wrote the
> cover letter: The original bug reporter (Julian) linked to a
> reproducer that is linked in the bugzilla bug report, at
> <https://github.com/mahkoh/udmabuf-seal>. I haven't tried running it
> myself though.

Thanks, I appreciate the pointer to the reproducer.

Acked-by: Joel Fernandes (Google) <joel@joelfernandes.org>

thanks,

 - Joel

