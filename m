Return-Path: <linux-media+bounces-30353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D397DA8FE34
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 15:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 608E48A0F22
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 13:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4CB19342F;
	Wed, 16 Apr 2025 13:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chfd1kvv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933F2149C7B;
	Wed, 16 Apr 2025 13:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744808983; cv=none; b=OcI6odfyxNUyWARmeHbcsPYxk65DpZUaAUv+HPNVMJfAibeIafTbJSFMU5RRx16Juikelv/9z9O55SH38rOguTJTW1nnzuNr23RyumCD8LO1MiGfCnF/pEQThuC20XhWIZiuUFTwpmi4qQxigpOWyYY6s0eefF/YjYIC+JEtBlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744808983; c=relaxed/simple;
	bh=dCezzfBqMLZltiPI/p9MOtl9dwON0wRC0Uf5EOvdCeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKtYKPckhRTbSovF6GpBESZHovNt6X7G1yaBQzH8+LV5UYOH9SLNS+rOmzTrDglf6kU2l5nScc9H/CUm3BdYNuomSezy9qNKplfYL7RML3/AAo4X6V8zd+zf/BBUPRVRW97oS6x3eyyP35NALnZ4POrPKi6hIMM13Hka71aZclM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chfd1kvv; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abbd96bef64so1290482666b.3;
        Wed, 16 Apr 2025 06:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744808980; x=1745413780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VB/DvHtpXcfRxnOXAk6/5pvVUJtr4/af5j8A6nLt4U=;
        b=chfd1kvvM0GIaBLgr39M+nWCSH1/SdSLmi62hkqVBITOv8R+6em+Szk7z/tmaz49LZ
         NqefDOpj8BuOTHnQrCu2g7oDD3MH+i73u2paIlU21Tjxw8bPy6dhn8YWc462fzdkUUr9
         X9yR520IEnikMMgk4VRAypUqliZjcgMSeda/akuPDeGx2sfd0WqC0wbabhHEJ+pDCUTe
         /uE1oZSSEYd1ncRkcWDum/eciP+jMYjZw5R5e4oeZuBYHWIT2bpQ/JFk9vnIwMCl5XOS
         AtYmsUrt+D1YSe8weLAM09sRB7CUtdK/7D/FZFNL455NOLLRVStg8/O4kLuA8bHzN0wg
         Pr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744808980; x=1745413780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2VB/DvHtpXcfRxnOXAk6/5pvVUJtr4/af5j8A6nLt4U=;
        b=t9VWbSGC5vJcYbWLXcEsySDd9Nw+4BlWM2tjz2NG0oHozd1qSpMRDkaL0B5NwzTZuT
         X8YtmgpOWNvN/RFjhlDz2uCfDvwRUEXtkBZBdPG0TnZAY+rgyfG58J/SIbKsbKBYFXPb
         XsFU4wafnjWCrVA4rsR3L5ZqA5H1eSh7dPKfIb7w7M1fShKmQfeOwZ0+ooaHKmSO7c5P
         Zx9ei9WzB9pgbPBxmTj5f7pZ1OgXcPxIRGw5jVT9xRKrJWryzIku8mYL+dA8M/n5lkmj
         KjTxsP7O8HV5wGzfDpP99OFzaF3lLaZ+dNQE3/0wySHZcq1jBYtIEd6dsQA/2NohvwRi
         /XcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrM3lvaJ5OuyDHbWrh+3zqSAGGlCkwOrvOlwysV5F0wAlzSMvIgWEsKjUsnihm9ijl/zwEwgEQGcd3EQ==@vger.kernel.org, AJvYcCW0Lq104wTynOG1vfe7yfCGWEjvMqUF5BGb4eSD88Wc9wUtzqzO/M40f8TzT3muc0nG8nrEXWFoU/PzzthM0pR7mNJkdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwotfDI6aUCYJP4qhL4T49jer1YKKhIH4636/p86J5n5C9UG5Th
	aRCyd+mSE490fvulopa4jl+0P3HLHdgFpY26WOd56cNcNqvvnI2v+jZg0zNVjlo4lDmjsA+nX6E
	MRGqHuLF+X3LjpBsdD4LNK5bTCvM=
X-Gm-Gg: ASbGncsFSUuBsW9QtzNy2VlHEWw6vrYWCTIT9ZLEoPnQVuQJzlyR7wal/n94+t/ey1m
	cKagNinXXDSu34I5slJ8WCkNPOOe+z7MRjP3gYFmlMJzbWs8bT7TyGt81UIhXlulqXrsNt1E6GY
	uiTrjwg4zTAfC6+aTL3DkSD/RYrnOpQ8WBMzw=
X-Google-Smtp-Source: AGHT+IETWIOfktrFECPfrtPZ+oiJ9K8YjXwf3B+ElnMClUeHd4qxkRERWprF2SGN2lnbVNG9pPZUdHKhN6CDuMuSX0s=
X-Received: by 2002:a17:906:ee8e:b0:ac3:5c8e:d3f5 with SMTP id
 a640c23a62f3a-acb42a4af82mr180132966b.27.1744808978353; Wed, 16 Apr 2025
 06:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402202510.432888-1-hdegoede@redhat.com> <20250402202510.432888-9-hdegoede@redhat.com>
 <CAHp75VcJcPAEi2dhVnOL6Um78VEwT9DsvC+h20ZHZ0kdoPH--Q@mail.gmail.com> <cb7b67c0-e68c-408c-a0aa-c6a862590c52@redhat.com>
In-Reply-To: <cb7b67c0-e68c-408c-a0aa-c6a862590c52@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 16 Apr 2025 16:09:01 +0300
X-Gm-Features: ATxdqUE-GT44bVaINMUhyviZiazTjhc4wanuHr-odGcsGUOH7suH7KY2v0kFkU4
Message-ID: <CAHp75Vfa6FHMx71tUqcXKxyOwdVCiRLiRp9Zs+-4Sj8CpyOTPA@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] platform/x86: int3472: Add handshake pin support
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>, 
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 2:06=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> On 2-Apr-25 10:56 PM, Andy Shevchenko wrote:
> > On Wed, Apr 2, 2025 at 11:25=E2=80=AFPM Hans de Goede <hdegoede@redhat.=
com> wrote:

...

> >>                         if (ret)
> >>                                 err_msg =3D "Failed to map regulator t=
o sensor\n";
> >>
> >> +                       break;
> >> +               case INT3472_GPIO_TYPE_HANDSHAKE:
> >> +                       /* Setups using a handshake pin need 25 ms ena=
ble delay */
> >> +                       ret =3D skl_int3472_register_regulator(int3472=
, gpio,
> >> +                                                            25 * USEC=
_PER_MSEC,
> >> +                                                            con_id, N=
ULL);
> >> +                       if (ret)
> >> +                               err_msg =3D "Failed to map regulator t=
o sensor\n";
> >
> > A copy and paste mistake? Yes, I know that they are both represented
> > as regulators, but don't we want a bit of uniqueness in the messages?
>
> I actually did this on purpose to allow the compiler to use a single stri=
ng
> for these saving some space. The difference of which case we hit should b=
e clear
> from the earlier printed (dbg) message printed above the switch-case.

I understand the idea, but if debug messages are off, how do we know
that? Or err_msg here is also a debug leveled one?

--=20
With Best Regards,
Andy Shevchenko

