Return-Path: <linux-media+bounces-44041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F54BC7681
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 07:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E9D2189BD7D
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 05:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC67225D1F7;
	Thu,  9 Oct 2025 05:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4e7agll"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761B025D202
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 05:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759986746; cv=none; b=EncskEdm2iOjPXFRLanxH0o298XiiGJkFZ3jZDp73ZOZrjKuK83E/Xd8YcRixWzxoAfjq6vsAjzAog79zJ7q2Ac7bzdZA1j1cqMi9EwntugOH+dmPZh6JD8n5hMLV3Jpr/jDEAIZuJx099o1CkPnwXw2GwgCVJhmde/XcWidcT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759986746; c=relaxed/simple;
	bh=g69ct24MmjxArPvb4htIE2j+DUcuAxYXbKaKt9nNwNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J22c/Z2NJWU4kJD/MOl6cHFm0zvzba45lpe+sH6vtXBntB9ZFLhrC3vNOWEvbmmJ79JEWyplBVqXeYaAOtNOetyHKwFXL4eYjzW0DByt1PXJPcWYl3Pr5L95EYCI0CMQClXG2IlvZIn582sxz4lnmUdUO3RoSs0BRajquDWiWLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4e7agll; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso549811f8f.2
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 22:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759986743; x=1760591543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAc4vwDFuA0RvRFYPmaQPlYUcz1xA/Dd48r7PtXPvic=;
        b=E4e7agllQnLM6hFBvGfLWoi/8M+39pIb1nkfi5LO3p+AxVNHgLR3GbCculbNlqweyb
         4csUgn9whveHADhFW0tUQM9mCbCOcCK6H6q7uInewWjCoOXIqxDYzSO5FyOYIadOWBBC
         9PyZ467fiM+2RJUi0rrIUTwVkf+QbHnmn+EXvQUjbwD4XHDRN+fO/VmWhunTjNK3ZZLG
         0P72nmZo1zatv4WJd+GMDiFFNY33N/KbfJG/7KB4nEJe4HSU7+GKkVWy+SEwTa6FQORx
         Ye+hZboIXtSW8y7MHp5jrGq1aKr7qk0EGQch15JzDrYsq6Le0rMB1csCg0FvPfyJktNT
         Tjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759986743; x=1760591543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAc4vwDFuA0RvRFYPmaQPlYUcz1xA/Dd48r7PtXPvic=;
        b=ZvMDOKQWvhb49kniJOnUSAIhEcVtyoav1DeQzk0Wb0Y3O7yXALxgUyAoTtjGm1cGa/
         SNFXQK1/vOOX1XFd3wUKEu688I56LFQ8ytYQxbzYMG5HZImF6CIU9DUV5K/M192tvzmJ
         U/0FWoz8gS73eGU7aMAGmOik0MyokKRCNP6FhAPfyloXvAK3nvPEO0EQpr45Gb37XGIs
         tJ9SSqzpK3wFNBCtkkakErDkDHik4o2iiEWsmcL9i6GP3pz/NULFIbUtQr1OJC3DtUpz
         /qt4hRCPfLIHB6fyuqY0ig6V17Ap0nyHCCETjL4mTeuIYMqLTGqi8Kv7Huj2GTUK0PeO
         oo/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmR9/VM3ug+FaPlhNUn9lqQYMqrEJXGx6qwblU1V38S+pMY/15sWVvS3zfDT81beXz/23yGs+Frop8OQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF+sfHC6/SpWPHjOSvrM8vde94k3xPD/ldgYuVJn56st11BivJ
	Hmdwswj8w383T5N6pezd3OqmEqWmu3BdFJvYCTUnWPkQPRSS3yYe61JkjuqmRf1e723gz2XtWGe
	h6WR8s+YyzbZjRnxCKA+HWpxcx1lEe20=
X-Gm-Gg: ASbGncsg1lBtzA6w8npeTxG0a8t5aVwCiztml4abgmY5AGGlg8pcf7jNvOi83mj5neO
	GtbSy1MzLf+SL7KCnuW7vPnK/gAckom2GUlKOe5WrAXRnS8Z7IwTGvu39J9kACwE79X3tte1SBx
	6yb8nDUc9cmAtiyxH11uOnMgZeuPenzLhWMiOj7CcZZV6YMQZJJSMUYXNYCVk40BPZTCp5PA0CC
	3SfaEwWT7s01OLs9hYE3zYeA7vIqIpf
X-Google-Smtp-Source: AGHT+IHEqPFGpsLkjdTJExInkzeCUrYeoBDzsTotN3s9CHFAoYRfgbeWdXnEHXE7zwgYrarYKck5hazoT/ajbub9quM=
X-Received: by 2002:a05:6000:1a85:b0:3eb:60a6:3167 with SMTP id
 ffacd0b85a97d-4266e8f7f02mr3364005f8f.32.1759986742670; Wed, 08 Oct 2025
 22:12:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008073046.23231-1-clamor95@gmail.com> <20251008073046.23231-12-clamor95@gmail.com>
 <20251008-craving-composite-81aa70b6e882@spud>
In-Reply-To: <20251008-craving-composite-81aa70b6e882@spud>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 9 Oct 2025 08:12:11 +0300
X-Gm-Features: AS18NWCooDACEZg9v1dc4kKxxOAalz7xHeMkJMNqgQiJE_XE0BU4PgbUW_JYKFI
Message-ID: <CAPVz0n1OEA=WHTzBtVBLQ=6vTAwG_uP1tC3Vbrb67wZDUtyVYA@mail.gmail.com>
Subject: Re: [PATCH v4 11/24] dt-bindings: display: tegra: document Tegra132
 MIPI calibration device
To: Conor Dooley <conor@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 9 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 00:14=
 Conor Dooley <conor@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Oct 08, 2025 at 10:30:33AM +0300, Svyatoslav Ryhel wrote:
> > Document MIPI calibration device found in Tegra132.
>
> Could you explain why a fallback is not suitable? The patchset is really
> too big for me to trivially check that the change is correct.

First of all, this compatible already exists in Linux kernel, I have
just documented it to satisfy warnings. Secondly, each Tegra SoC
generation has unique set of registers which should be configured.
They all differ, hence fallback is not suitable here.

> With an explanation,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml  | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,te=
gra114-mipi.yaml
> > index 193ddb105283..9a500f52f01d 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-m=
ipi.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-m=
ipi.yaml
> > @@ -18,6 +18,7 @@ properties:
> >      enum:
> >        - nvidia,tegra114-mipi
> >        - nvidia,tegra124-mipi
> > +      - nvidia,tegra132-mipi
> >        - nvidia,tegra210-mipi
> >        - nvidia,tegra186-mipi
> >
> > --
> > 2.48.1
> >

