Return-Path: <linux-media+bounces-30354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DA7A9017D
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 15:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B983816BD74
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 13:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18237190678;
	Wed, 16 Apr 2025 13:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4YFRp8q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2AF12C544;
	Wed, 16 Apr 2025 13:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809038; cv=none; b=cyYGe4ztVuykY3Wz3ayo/Yd2SMm6R0OU4uXDU1y6S9sF6eChEPMnCM5yJF2LiOFvubBh10beksu+TRNuBC0UyyjDKubsvBC2GUei6Kqds8iDgt3X0Ws5RsMnD6f2x2jFzAjZIIqX9LYy0DnI8p/MD/2xwFwTuX7nyz4/B/Nn/CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809038; c=relaxed/simple;
	bh=nGPmIN7HlFz5o32FevVEN7AqnjhO41otKal2+cM8IT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bxp3hZBhXvW5WzsE8QLY6KdqYb2eydJfA00/WSeBM7KGfCrK+hYagDDcHPEsBjZJoXxDm+VM0+9zPVyAmkyOvqlCTW1OMrv32dYmKB8aPkqYKUDmgD0qkvrV2Rp5i4L8kJRiSld355enOax+848LMQiJH9BebY10xsG/FHHCuBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4YFRp8q; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so11731868a12.0;
        Wed, 16 Apr 2025 06:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744809035; x=1745413835; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRO8aGUvOoVbnGeSQUjoMxLi5AELOxWjzfGZqcFi9xM=;
        b=d4YFRp8qoxpMpK3X1Vlifxucrdtkr5lhBSRuF6tZh/XM1wgxQ7b93DC3WXCyHnM6ww
         4NNM7dxl5+XUof1f9c51stb2cYUFfFD1RfA3Ej3rrpoCFBau5RrG5Ovcc3vvbBJuGypy
         wSpU0e2BQXzEPe9myQ9Go96/dNCY+TnlwcDf1l+cTO2t5uZ+qGmcOSjOtfxpKIBO1OOz
         zDhpeVbCRSw02B43TFht0nEQ11bvizmUY2gKbHEYm6PflEr/suDsZEBOAqeUBF5aZkFM
         lvN1VGc6TBngG40JsPrfbtKmn5pCgN4TDTw2EvjF5zUVUBOTbYVT26qGEw0T4G3O4Ohl
         VkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744809035; x=1745413835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gRO8aGUvOoVbnGeSQUjoMxLi5AELOxWjzfGZqcFi9xM=;
        b=PJLnF4hW4ccF+r6bAw8yd8tcgv1rTAUQ1vUh0egwrsAF2JTvnmNjkdtz+JeXwjgtvT
         +00vHOd4RJWIul8dQ8gW47hEDOrKC21a695JRrNu+KIc05CjMkvUmpfXSMJU6Ny9DksY
         svbX/we6Fug8vEvPxb/axKU8VgRCsEwacU5j7ephvOsoHO9ja+v6GlGeseG0QG3ZwX+o
         GVTT0PvHap0PkGHHlAuBn347ACxv8puT6Ly3QoepVwHO73Q6oUaIAstVZ36okBiVQYpR
         WAeFEzzaeGppwTRImv2VqS8O2Yonf5wrMbTF1uIL7ItnLOqyLKCf4uSyuQLBBZxop9P1
         W7/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVToyeZalTrESWDNhm695p5TibTZVn5Z99sprkhfTRWuQ33SCLg/0RCd/y+tN/aJmvDahdFqlB0unuoNg==@vger.kernel.org, AJvYcCWoKt2kBuYBnC10dY2vKGC6b1Szq/metbRkV+B76mRdXEsJcZK7bylsp0o5OqJknlee5DkRLQNk1tpOdO/Vyf4GzUTAZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLJCO8IvwznGXEnRIi/NwZpovitfrXK/IMiV9TlY4npoIOSjgV
	5KR5OfwFa9FcNv24C/R0ky202rwUXrXxxvIv+ZHDJKFq5RmPS+eLpfwY9HVrD/Le7R889mY5EHL
	v5+R7gOjpjrAigwp0IwzAqw/o9MA=
X-Gm-Gg: ASbGnctj9ZZSx29AE+bT6845Pn8ytlnhWh2RZKx9/Hqjscb0bBwvx3ZAGW5BwYLGlIa
	3lee8eyWolSXaAwOYk7z3g5+K3Odr6GQQdi8yUXUPRp3dZ7Zp7VVKVGZsB7BPvj+w85LqkikP9w
	jW1NcBIpGayIqVwAUX79bSh3Za
X-Google-Smtp-Source: AGHT+IEEXFtDxCPj4w/aLMxkgEHhIq3Ai44oeviKbHNLKlLM8Oqlvat0/MpIjsT2dCp0iV5fFf6QZBekFELGzydmHNM=
X-Received: by 2002:a17:907:96a0:b0:aca:a686:8558 with SMTP id
 a640c23a62f3a-acb42876fa9mr129698666b.6.1744809034848; Wed, 16 Apr 2025
 06:10:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402202510.432888-1-hdegoede@redhat.com> <20250402202510.432888-9-hdegoede@redhat.com>
 <CAHp75VcJcPAEi2dhVnOL6Um78VEwT9DsvC+h20ZHZ0kdoPH--Q@mail.gmail.com>
 <cb7b67c0-e68c-408c-a0aa-c6a862590c52@redhat.com> <CAHp75Vfa6FHMx71tUqcXKxyOwdVCiRLiRp9Zs+-4Sj8CpyOTPA@mail.gmail.com>
In-Reply-To: <CAHp75Vfa6FHMx71tUqcXKxyOwdVCiRLiRp9Zs+-4Sj8CpyOTPA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 16 Apr 2025 16:09:58 +0300
X-Gm-Features: ATxdqUGedEe-H5oW1DbpJiryvFRGgIdEsGk4zk7l7HzNqUBvWVJKP4RwpVLm9FQ
Message-ID: <CAHp75VdVbcMo+2ctJcax1t0Gp-eN=bycZFWPMzinmo_=Z1e_3w@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] platform/x86: int3472: Add handshake pin support
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>, 
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 4:09=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Apr 16, 2025 at 2:06=E2=80=AFPM Hans de Goede <hdegoede@redhat.co=
m> wrote:
> > On 2-Apr-25 10:56 PM, Andy Shevchenko wrote:
> > > On Wed, Apr 2, 2025 at 11:25=E2=80=AFPM Hans de Goede <hdegoede@redha=
t.com> wrote:

...

> > >>                         if (ret)
> > >>                                 err_msg =3D "Failed to map regulator=
 to sensor\n";
> > >>
> > >> +                       break;
> > >> +               case INT3472_GPIO_TYPE_HANDSHAKE:
> > >> +                       /* Setups using a handshake pin need 25 ms e=
nable delay */
> > >> +                       ret =3D skl_int3472_register_regulator(int34=
72, gpio,
> > >> +                                                            25 * US=
EC_PER_MSEC,
> > >> +                                                            con_id,=
 NULL);
> > >> +                       if (ret)
> > >> +                               err_msg =3D "Failed to map regulator=
 to sensor\n";
> > >
> > > A copy and paste mistake? Yes, I know that they are both represented
> > > as regulators, but don't we want a bit of uniqueness in the messages?
> >
> > I actually did this on purpose to allow the compiler to use a single st=
ring
> > for these saving some space. The difference of which case we hit should=
 be clear
> > from the earlier printed (dbg) message printed above the switch-case.
>
> I understand the idea, but if debug messages are off, how do we know
> that? Or err_msg here is also a debug leveled one?

FWIW, you may use "... %s ...", regulator->name (maybe, I haven't
checked) or similar, so the format string is the same.

--=20
With Best Regards,
Andy Shevchenko

