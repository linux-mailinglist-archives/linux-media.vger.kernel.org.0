Return-Path: <linux-media+bounces-20916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C859BCBB4
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 12:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3D5FB2389C
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 11:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9671D4341;
	Tue,  5 Nov 2024 11:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYHau+JN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9B31C231D;
	Tue,  5 Nov 2024 11:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730805862; cv=none; b=CJ33I5kkgf9u+IVXfYpeCOvx2Sv4Ywur0cHEqPzZ9wRgpscMB99+/g/y1Lrv1MD9PluAjPLiAJCPrtWDMJe16Tap6H3OIll+OkZAza8wi3YOzdYO6jZ/QX9sHiWgeJORchtCHfIwJWIpX7VtcAN6BI0OpZs+rkKqxfARcrjJ6nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730805862; c=relaxed/simple;
	bh=hUrqnnoL8jXf+jGAZsFBDGhCRXnNB0l4ZzW77nhgG2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHAZfroO31kWkp0H3sIz0pL1tQYe4AoxMlKkwq5D2paACE+UfmMXd6pauT+tjisvZR/ZNL3de4CNUwUfCuqun5AVtawvjYW7TUi1mqOYuWPN+GFl3RpzrJniBfJhkYPohg4nP1gnVBMlQ6Rv/Mpog0obSBmURINx2Jfn2f/9W60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYHau+JN; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-50e08caccaaso1600288e0c.3;
        Tue, 05 Nov 2024 03:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730805860; x=1731410660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUrqnnoL8jXf+jGAZsFBDGhCRXnNB0l4ZzW77nhgG2Q=;
        b=nYHau+JN2vsfZcGp7b++NsSE+lMazb0YGb2u0sUkiZlK8de47H1LRLllsz/T4pHIqP
         rhSg3vALJILzX7ispInV4UYoYV0Xsdj9uB9QxM4osmxBgaqlF0Y5mUu21A29VSOHDXRV
         ZqUsMI8lPYEJ15K9pkQq0KympSgfKm29ICPZoTXuOGr8DYJJY3nqdiShx5StXXlYaRS/
         Fto3M43l4JEJyokA1A03xpY7b08v8gODbSAJEyWTmKlnQSCQbDa6lpaqmlccLLddnx8W
         +nrkgdNDemvf8vtpkXJfxqjwrPWCKtjr495Q3o5jKhGX8xQhOcay4ri4PiOeb9Uyu66d
         igCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730805860; x=1731410660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUrqnnoL8jXf+jGAZsFBDGhCRXnNB0l4ZzW77nhgG2Q=;
        b=jjoJEbzLzVgEVlLxPnCHwlYZ28/WvBTc5IRK0UkcsewJBZi+5d+HAwhN7JWh9eZFoL
         45ag0o/1vjqitHa+wJ5YCP1+1w7mZdHQEgd9U+iwfqqqu+zXsKOEQ4rt9m++7v3YEbau
         7uLZsPHI+6ULXbe+bvu5Uj6JNl/lRhh0Y2H0mThqL7fjoUD0W8dQwDKU9o81c/vJWSzG
         Sfte1I/180DdK9EE8EYQMbguEs1jtAunQZS5m3rROhBXecqQ5E8R54GiZoQvhaXTnSkc
         DUO/f8vO74KzLvViNaCOPXvD6Cvt/8+Nky06KQeKim4c5hrsC9ak2JIC/6RCSmS5i4dI
         3vlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwZ0bYUnpchF+ojwfgLi5lDg5nExnnAYKr8uadIVpOm5Jm57ATcpj24ZLvSVC6fyid33GsfTKqw0AyOFI=@vger.kernel.org, AJvYcCXjf+8ysnTO+wna60dUalXLSE2MAqz/hPVXR+40wqu0CJbCwjIWylfRAmDcp/lJhN5q/IaqoYa27FzyvG0306E7IvY=@vger.kernel.org, AJvYcCXkofZqFpKj7voqTUARn1J+qkPYGzCCp05uIQYJfcV0dUgjZJndN+jg39wI+9OewTvWkGiO6ztFOXJ6HGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzBsl6AgvIYU+OKvGc+hQWcYVzsqN7VDzQlHZdsmzW0ECuno6U
	V4rZ6zEiJqx8t57O7g04HnRt9EUBVjFSP+IpxALjnORWJjxIEP2l+MpEV/InDulhESUQJxdWbU5
	JPBgkyRS2IrA3tRDdm8KjYlUS8dy4WQ==
X-Google-Smtp-Source: AGHT+IF/rtyD+IDNlDzzDLElKEiEJTXh0T0jsp0VaIh3Mm2qGBGac5yFcKg3VKdfT4mEpkQSUIddReVZAOVvlvEYFo8=
X-Received: by 2002:a05:6122:d93:b0:50d:4cb8:5afd with SMTP id
 71dfb90a1353d-5105d027a0bmr20932043e0c.4.1730805859676; Tue, 05 Nov 2024
 03:24:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <Zyn_CHKpENoIoDVs@kekkonen.localdomain>
In-Reply-To: <Zyn_CHKpENoIoDVs@kekkonen.localdomain>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 5 Nov 2024 11:23:53 +0000
Message-ID: <CA+V-a8vUbfO1urE=SSzTFaFNUBJKyVf4JDUFpqfv=yZY5qzJ9Q@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] media: ov5645: Add support for streams
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Tue, Nov 5, 2024 at 11:18=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Prabhakar,
>
> On Fri, Oct 18, 2024 at 04:32:20PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Hi All,
> >
> > This patch series aims to add the below features,
> > - Support subdev active state
> > - Support for streams
> > - Support for virtual channel
> > - Code cleanup
>
> Thanks for these!
>
> I've taken patches 2--8, 1st is redundant with recent framework improveme=
nt
> and the last two need the metadata patches (and agreeing on the sensor
> interface). I've marked the two last as "changes requested", please repos=
t
> once we have the new API agreed on.
>
Thank you.

Cheers,
Prabhakar

