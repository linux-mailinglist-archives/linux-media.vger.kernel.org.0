Return-Path: <linux-media+bounces-30825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F1FA993B2
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3BFA1BA393A
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 15:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898FB29C346;
	Wed, 23 Apr 2025 15:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1CESpb3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52025284685;
	Wed, 23 Apr 2025 15:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745422757; cv=none; b=geFVQBCldWazizg3mG+Y4CKVE8flt6IhMsB5QA27DH/YXM1DYM+IK7f89WzMzCToZ7Uv7/kZcxI1VFROBHJpwPaY3zbhe9ZmD6pFp82IsrG49WP9o+xaWoUilWPZt6/VUFBwCJ5TtzjQYTqJQmBug74kFiniTf5RSTpK3GlF+rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745422757; c=relaxed/simple;
	bh=g8o74qgPUiRwXVRyK/BERAq+dsSuVIqbL2PhqxEof7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l1g9gxMeVFtlcvRLMICrVqV+W81EpOSh5VKLEWxAQhWWxSHopFBJQIAo/GqvIXb2G3rtRy2KJZ1Ke88Vmpcii+cRB6m3fYPz4Uc3wUVY7hgDHobfxYN4FdDjcgPx4uQ0C52B9jOYFK0CRry9rr1RG2XNWbKebZXRGYb7NybZ7W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1CESpb3; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acacb8743a7so189040366b.1;
        Wed, 23 Apr 2025 08:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745422752; x=1746027552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8o74qgPUiRwXVRyK/BERAq+dsSuVIqbL2PhqxEof7E=;
        b=I1CESpb3YL3pxsGxGc6cukCMUrGxfZfqMKIJJoYni6LrZa+hO3D5iLFRbsTrpTMHr2
         NaDKEULxf12R/3vQ6BOjoDa/9a3lnXNwb5Us+/tl3ZOSj6KgEEsZeHZWkkvDyrNTnL+p
         T8V6i0XyFHlJjWCl0j+SoTVkhaTKfclgAum4iNn5489LCLA6WdwuuFcmZ2GhkSoTWzHo
         RUbIFD4l4vHneFFCyngsyLJIqCmgA3f9/vMZ+FrVe/0NRpXRfBk7oK+ICpC0+FeVb92t
         LuX842367p/qrOxFrm6VUGrCQ4EG2nYHbsREDXc1QKMCCOCfuwgkbdyD6fdnceFsrRxi
         Kw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745422752; x=1746027552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g8o74qgPUiRwXVRyK/BERAq+dsSuVIqbL2PhqxEof7E=;
        b=KgvGr0iX5A+qqXYXi3MrvrY4UlZW0e2Rby4fhk1yU+Bl3hGai/OLZyLrvOw3Nx2mSC
         RuDUWI9uj4Jo9dXewpOZpQd8brkTy+YV9Roz6lsRr0GgNZerial0m+iBkBSaHu7RkKjl
         dR7ZIV1ZzIIxAwhb8jRB+JSVTXSk1IP3KN3tcKPoX3865aMAutAw60oFLUZkk0CGZbUh
         mmn/riOwNiNe1jTgc1APPWGl6kxMJyldZlspi45kmqLfLdbMrXw/SFXOl6lln2H1kqrm
         Nkm3/58EihI24F/FJSaDre0u8SqjQfDSH3wW9tm5b+3VtBd4WxGBuWODobzOU1hsF1bM
         SERA==
X-Forwarded-Encrypted: i=1; AJvYcCU0kPyaXFcF/bGtVLmfc7Rocsbhz2tVU6hJ0ZwiL969F5S/vBBgmZ6GvNfn/CcsJJzBBgl7UYA1/xFGQseTAeHQvIqjOA==@vger.kernel.org, AJvYcCVAe58MEErZW2fAlKmtdWib8UAkKI+MiV79a/DnzJHWAw5vHUiLCu91/O0B653VwkCZdKF+qyKYcHoXmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtte9r2RWru1acEhPuw/g+3EPvTRxCq1L+k17E8Xqy82d9uIpc
	Ls7OX9H/HmExfdvtuIAgqQXkkQStv09Ip+tLlRbepr3O/iCCTy9Q4ABp69MlQ2SsMEnz49Rs/GB
	IYOcj2BxMygXMv5GecqTCZEzB2BY=
X-Gm-Gg: ASbGncvcbKkmMrVQob7Q05Gibjy3qWHtSlci3+EALHPGrI0aL7U4W8ha1lPY+bdOsRB
	6qgpbPExGbZz/cvaiCkvX8/hB7pfLdZs+7jmymBv/ytC3NzofirLif6GqeQn4m7j5tc7mZwctRb
	XA1lXP5FrzzaKdNIA0l8CaW4KW
X-Google-Smtp-Source: AGHT+IGHDKUSF8JBWX2LR8EO4tKAK/iL+VHWfmlIK8VSF74lfcqcLWNJtvC/cJLnKqFok28nXMzjIUXVDJY8zzFFhYU=
X-Received: by 2002:a17:907:7f86:b0:aca:d276:fa5 with SMTP id
 a640c23a62f3a-ace3ef0beffmr399752966b.0.1745422752323; Wed, 23 Apr 2025
 08:39:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417111337.38142-1-hdegoede@redhat.com> <20250417111337.38142-6-hdegoede@redhat.com>
 <aAErdSgr_F8L7Sgw@smile.fi.intel.com> <09254093-8962-3d53-bf56-78eebb23fdd5@linux.intel.com>
In-Reply-To: <09254093-8962-3d53-bf56-78eebb23fdd5@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 23 Apr 2025 18:38:35 +0300
X-Gm-Features: ATxdqUHbr3HsMjNqYfx_8omQCeiZtfH_V_z21X-A3tCaTwqrXLc0-Xuvc73IlX0
Message-ID: <CAHp75VeS6HhgdgOrLM2y6wa7op0wnUQ8wdijbCj1QrNK4CcO0g@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] platform/x86: int3472: Make regulator supply name configurable
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Dan Scally <djrscally@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>, 
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 4:58=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> On Thu, 17 Apr 2025, Andy Shevchenko wrote:
> > On Thu, Apr 17, 2025 at 01:13:33PM +0200, Hans de Goede wrote:
> > > This is a preparation patch for registering multiple regulators, whic=
h
> > > requires a different supply-name for each regulator. Make supply-name
> > > a parameter to skl_int3472_register_regulator() and use con-id to set=
 it
> > > so that the existing int3472_gpio_map remapping can be used with it.
> > >
> > > Since supply-name is a parameter now, drop the fixed
> > > skl_int3472_regulator_map_supplies[] array and instead add lower- and
> > > upper-case mappings of the passed-in supply-name to the regulator.
> >
> > With a comment and static_assert() LGTM now,
> > Reviewed-by: Andy Shevchenko <andy@kernel.org>
>
> In the lack of context what this refers to exactly, can you confirm those
> are already present so no updates are required to v4? Thanks.

It should be read that way "since Hans *added* a comment _and_
static_assert() the change LGTM now", i.o.w. no updates required by
me.

--=20
With Best Regards,
Andy Shevchenko

