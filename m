Return-Path: <linux-media+bounces-50549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA5AD1832B
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 11:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C3903051309
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E28352C4E;
	Tue, 13 Jan 2026 10:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hICQuWbU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6418028489E
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301181; cv=none; b=FvW4iHsx08/c/NULuf7U6fTmniqADi8nGuNoD1V0y6a1RbVFwNKNeLXUhm+2qCaHkKggp5SqnOcwHQ3/3dxNwSYrOqd+G5CBmqPoGwGpX6uvGC+L42iCuRXioca0B9TC7ksB/dA1DE9l7ETWcHVCvua5Ivhvz6HiArAXSxdByyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301181; c=relaxed/simple;
	bh=phQkMRc9uXp6z9O4ml78EGTe1vFbrgTMKpp5BSSPlGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SBeJlRDY2SsPyqPgCOcEwTCXG6PR02Du0gvYpAzegVBmEETuHsKEJV7JlJJoc9i8nbS+r8A87INtNByzxxpAjh0hb6TCTbPnhNMfvbx6cMeh9RFaFGEFWY/of4NcDuGQxSkX6FEzzjKGmViajgH1LZM4R2Hp2FNVSyVTCBnT7oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hICQuWbU; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65378ba2ff7so24957a12.2
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 02:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768301179; x=1768905979; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMCuJOi1+oBIvIAI7NFLBlD0HNwog3LXejzEb0VUQdc=;
        b=hICQuWbUUSvV1cEuLkLIJN0A9z8r2wOW0Bvc3A1J0mwJhIyZHY5B+DQvM4UKelgacz
         w+4pFwumWcMgztRwMr8gDhFGb6avxTa82SuSYYYy4FT1P5Fg/zKBwK3fInpctO+Yojg3
         Hdn496WS0+J3tnoNmi34rS9QYYmQPvogL7tJsotipn8lGrG25L0XPP91Awts/BM+L3KF
         H5EBswePjROnHPxs0D8LTBldV4oo3odKQkXcrCAmTg4KX4FHBTbGwg6k7bM1KgpcAcwR
         Ic2dEfWacD9RBVnl2RA7Yrlx8HZC6Ji2WuZERzWsjOgLq/Uh5sthwj+eR9XsAMaMOBMD
         GZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301179; x=1768905979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HMCuJOi1+oBIvIAI7NFLBlD0HNwog3LXejzEb0VUQdc=;
        b=BgG6754ND4Ae4HIo+I3yQy0XMpgGGy5hOvJxaE0ggDZrgtQVDBlAOY5DUvFrJ6Tp+5
         b/KfrBgA2cWd8Xt7Km0k/sf3YSmgITeusQiJYx/ZfmAZoEnXD5ArPrwIagyP9psXwM70
         sjqiHWDZ6Xea0xcqKeVhPj1bCPPvQmsiPqatqNVvi+H79WasQtwXEo2fWnLio80Q+KhN
         6NFyftw/sW+7vz2qWuS0SqjOAovPL5Etu1fzi8R5gLyhdp0YNAYlFCshoBvB2RyU55Ps
         njdgacg7AyaUzQ14Qft5qYPsXDx1gtKio/Ir5kD/eEawyhuF6JFCGHxuQuHtSZ4v7dsG
         JLCA==
X-Forwarded-Encrypted: i=1; AJvYcCWbkaAdkpTTGLD/curahf4L1cMU8dB7Jqw9KugekU7Z5vrLgpPsAnR3AwfMy8eZ82kNIeJih9UhynLjBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoP7tzFUjQ1M8VBE7uIuQauov/JAzu5s90rVbd48SoFz/aovsb
	Y4LuZ1xrQn/bhGVT/Y5+LWlEkQtZbE2IRLGbC9SWCm+KRNw0Wxc8/6RtLmJ20je0qWzlO8Ko08i
	U36O8Qnj/XWNvvSR61YN2Qm+CHhMU85Po/muVhds=
X-Gm-Gg: AY/fxX4YJJK0mnOR+AOAEz7piGOmPV5AYmfjWd4oxfr1mSZCmacs10x7ehvDOyHOCfa
	NPWwNmJL1lR7bnqRf3nQGVAUX0verjw/0iIo4EXcZDkrFZIGSGevI7HBK7QRj6zB2YLcVf25Wq0
	Jeqj9uvlwQcfOHDYJqFUXcl4kLpeI250MvqYh4XKUfj1TJgLKDI+WDkcGZfD7h/g4CRL8MjDFt4
	Zs5/09brrQKaolzwotuTqhoVZDb/YK+zzxrQubUqPq0xY6dPM75DeLfRJA0Y/THCgsU0kpooeHC
	XNBeJ16HEgZYtVhhXuo0dqZyl9ejaHVS+HNKdOTbiJ6i88k1aMI8tSg1PHTYw0mULhLAS6k=
X-Google-Smtp-Source: AGHT+IFvcKdJ0j5f9eQm3Qlk1sAfB7/uI7rC4aNzVw7Rb0zMuVIPNClTkUQbi7S1flZZwS91TvVPRBaeaxlwPmdgaIo=
X-Received: by 2002:a17:907:3c86:b0:b7c:fe7c:e383 with SMTP id
 a640c23a62f3a-b8444f2399cmr2165465666b.22.1768301178551; Tue, 13 Jan 2026
 02:46:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112190054.9828-1-dev.anubhavk@gmail.com> <aWVIF_rkHzxs3k-r@smile.fi.intel.com>
 <CAF6CsJwg8EFtCT+zyKWex=RbWu4TyZanbXnqip=J7=sCZDab5Q@mail.gmail.com>
In-Reply-To: <CAF6CsJwg8EFtCT+zyKWex=RbWu4TyZanbXnqip=J7=sCZDab5Q@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Jan 2026 12:45:42 +0200
X-Gm-Features: AZwV_Qgo07UCug5OmxVy2XeBP03USTgg59_YqwKL7rGkPAp_1sKRMrW2Q8eDeFM
Message-ID: <CAHp75VcuO2qNeWLcrDqVfE_aQs=2ZiRB0CDxJpFquXJ6jd5eSg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: refactor sizeof(struct type) to sizeof(*ptr)
To: Anubhav Kokane <dev.anubhavk@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, hansg@kernel.org, mchehab@kernel.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 12:37=E2=80=AFPM Anubhav Kokane <dev.anubhavk@gmail=
.com> wrote:
> On Tue, Jan 13, 2026 at 12:44=E2=80=AFAM Andy Shevchenko  wrote:
> > the preferred way is to switch to use kcalloc() in all three places.
> >
> >                 x =3D kcalloc(count, sizeof(*...), ...);
> >                 if (!x)
> >                         ...handle error...
> >
> >                 while (count--) {
> >                         ...
> >                 }
> >                 ...
> > err:
> >                 list_for_each... {
> >                         ...
> >                 }
> >                 kfree(x);

> Thank you for the feedback.

You're welcome!

> I looked into implementing kcalloc() as suggested. But the issue is struc=
t
> atomisp_s3a_buf (and the other buffers) are defined as list nodes with
> struct list_head list embedded in them.

Yes, and how does it affect the allocation?

> The driver relies on adding these
> individually to asd->s3a_stats and freeing them individually using kfree(=
)
> in multiple cleanup paths (including error path here).

Is it the issue? Instead of incrementing by a pointer size, you will
increment an address by a structure size, this is how + operator works
in C from the beginning (or close enough to that time).

> Switching to kcalloc() would mean the s3a_buf is no longer a standalone
> object but a slice of an array. This would lead to invalid or double free=
s
> if the existing code tries kfree() on this array element.

How? As I showed above you need to carefully move and replace
individual handling by a common one. So, instead of allocation per
item it will be an allocation per bucket.

> Addressing this requires a larger refactor of the buffer management logic
> across the driver,

Exactly! And that's what I think is the best way moving forward. You
will kill two birds with one stone: fixing the issue at hand and
improving the memory allocations in the driver in this area a lot.

> would you prefer I stick to the sizeof(*ptr) hardening for
> now to fix the checkpatch warning?

See above. As now I think this is unneeded churn as the idea would
still be the same =E2=80=94 moving towards kcalloc().

--=20
With Best Regards,
Andy Shevchenko

