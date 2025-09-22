Return-Path: <linux-media+bounces-42874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D568DB8EF7C
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 06:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97454178E64
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 04:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BB0223337;
	Mon, 22 Sep 2025 04:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYR/Kqfb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE9C213E7A
	for <linux-media@vger.kernel.org>; Mon, 22 Sep 2025 04:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758517126; cv=none; b=t5D5ibdjBxqUp/TyUGe/8q4wY6sihkMHxk6J++H++t8AMMyKY3yUgpi1T/aGLZXLMtXZovVm8SYa/JTuEVyJgYmpT14BKFtxHnNELAmue1nUVSk9/eqakZMxXtLlvPnKYgSbg3WE8U+tkhXUQnc0zdgqSvvCDx60za9tre3wBqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758517126; c=relaxed/simple;
	bh=gkSr/k2qBC7NL/bwKC6Jo0OE761W8V3Gi8qHsc2TEio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mi0O1g8H7+mSssvCp2mMeuZ+uDs9ZCj1GF+nAo3gBy1x/aC3hItZdi+Eu3T3ySlB4ODGDCQBZlaHTg3kZ9JIEBXJ8BXoUV4dXfkNJzL8pBt2kEUHEjjQ0MkGq8YZpdtwQ1LeqrV5p2XLVleIBYXAxSkTFIHRrAz6dex4ptJaYmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYR/Kqfb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45e03730f83so15471395e9.0
        for <linux-media@vger.kernel.org>; Sun, 21 Sep 2025 21:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758517121; x=1759121921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAvsa2EzVq4+dzbR4C+qjrwq8bLpvzRB2OJRPqfQHYU=;
        b=ZYR/KqfbKbzK80vyUXnOVuWed32NC4SwVc+D3FRQsOgZn8OyGjy6bOymTlLXjt0Wm7
         k5e2SrKP3eYPMoxhNbatdcOLG3jy+XX4vsZLpOzTTu3kw6oVd+NuWiNt/c3Q9rr/HEuy
         8AFvBALRwUVaT5oa5FlkYuX5WeYStg8260GjmYA0/QqLRQPMX8v6Mca5h9XJwtE/alxe
         zMULISy2+XT4Cy86ZIWy6aBrUZNqHNv8Qx0m53Td+MNwrRkf0JdoscNY/l8OMTtvU5yX
         Ii1mWLCvk3t+qrTzzERmifd3DIJSU7NF1RgCvjbL2O8FvZReMgLtnU1lgXpRZFERFXaO
         MGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758517121; x=1759121921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AAvsa2EzVq4+dzbR4C+qjrwq8bLpvzRB2OJRPqfQHYU=;
        b=jFdizgmaGUD74KB871SDHoixS0S0fK2d7kx6t5t2oKg0raR5/l0twuqU488Ehy0a7F
         YDGH2Ju7dcYDyzaxK1c03nX//W5yCwdaFYiFPcHceZsTg6nYj5bM/WbVh38wSd97Pc6w
         WCmZ82TO/K3Lxad8oWao3nHvwSv93mo3zH4waSxGWD9wdhRT2SedrFgPycar7FbHrdsq
         3/4XPK3lCsZTihaYeudbcMxcsIB+eEFQV8q1H6Bhk5ikCjJZ5yXSBkT8hJMlkvkzP8KM
         oj7Yzhpsb1qrW4cMWrLzlNgKHJ3sAcIIRXmfxJU3IitVRy8KWJfwoLz7SBvoreZ7FtqJ
         58dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ/BoNav8JGho02wR5HYVf78/XNzQ+vp/4s5yKkRutV5xrYzB5OxwHZIsCtTrCMomIH0XAERhsjeNvSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQGn6xxuUBcI6VM/qCvIaqirKbbp/D5/S1lppK2FXem51ck5A8
	SqDJaNswKmafDDWtDGyBnL3zQV8tFwVSQOYsJW0Z6E0RoFYq61qIZhilmmv+V8RLnjYQqOLsabQ
	utyAUyu0ujwu7ajKIVPyYQb5jaKOVLh0=
X-Gm-Gg: ASbGncuQdvGyIhjBiNaG5jRM7UqrmDQUrYmM3XDsw4rZZMz6n+P2nJx9T1HknnQl2lq
	ybIjeoqjscFO3NWhf/cNumPb8V9RFnhAeOfbBDNJVkJkg9Wq9idTWUE+flvMvO5CdV9ZOyrRnLx
	tTZv01VI8RqYR9BeDWUB1IE20UE+eA0DaeTWIuVT/RUkMj2LyAlrCXMsl7RyrOWcoTlE/z58akM
	u/teizO
X-Google-Smtp-Source: AGHT+IEqpf+fahmlNxfcBD+gdZTresTyKx8zIRWfM243PFo4NiJuTkwOy4u6cIIp5K/YP1nuLHVN24tHIMe3nvhD4kQ=
X-Received: by 2002:a05:600c:1f90:b0:45d:d609:1199 with SMTP id
 5b1f17b1804b1-467f06887b5mr105306365e9.30.1758517120934; Sun, 21 Sep 2025
 21:58:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com> <20250906135345.241229-19-clamor95@gmail.com>
 <2331830.3VsfAaAtOV@senjougahara>
In-Reply-To: <2331830.3VsfAaAtOV@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 22 Sep 2025 07:58:28 +0300
X-Gm-Features: AS18NWAi5iIH6gMmyrHteYV1m4FMyO6_CjTfEQzBzZCFo1CBmqpAnZAs7VssVwE
Message-ID: <CAPVz0n2AjRPMuZbLAnc=9TriPHDLOFok+Qz3zoSpQSKX1R=cqg@mail.gmail.com>
Subject: Re: [PATCH v2 18/23] staging: media: tegra-video: tegra20: increase
 maximum VI clock frequency
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko <digetx@gmail.com>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 07:54 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Increase maximum VI clock frequency to 450MHz to allow correct work wit=
h
> > high resolution camera sensors.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/tegra20.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stag=
ing/media/tegra-video/tegra20.c
> > index e0da496bb50f..3c5bafebfcd8 100644
> > --- a/drivers/staging/media/tegra-video/tegra20.c
> > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > @@ -590,7 +590,7 @@ const struct tegra_vi_soc tegra20_vi_soc =3D {
> >       .ops =3D &tegra20_vi_ops,
> >       .hw_revision =3D 1,
> >       .vi_max_channels =3D 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
> > -     .vi_max_clk_hz =3D 150000000,
> > +     .vi_max_clk_hz =3D 450000000,
> >       .has_h_v_flip =3D true,
> >  };
> >
> >
>
> Where does the 450MHz come from? Instead of hardcoding this value for eac=
h SoC, could we just clk_set_rate(ULONG_MAX) like e.g. the vic driver does,=
 or does that get a too high rate?
>

This values comes from downstream 3.1 tegra30 sources and setting it
higher breaks VI, I have tried. If it is set lower (150MHz as it was)
it breaks VI for cameras with resolution higher then 2MP

>

