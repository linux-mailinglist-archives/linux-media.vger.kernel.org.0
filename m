Return-Path: <linux-media+bounces-54577-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIshH2RBqWkZ3gAAu9opvQ
	(envelope-from <linux-media+bounces-54577-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 09:40:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E543C20D93F
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 09:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4223230D6E2F
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 08:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5AFC372EF7;
	Thu,  5 Mar 2026 08:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4xQNHT0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CD12405EB
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 08:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699800; cv=pass; b=eN2v934/Msk7dXTpIMA8GMvY9oP8mUWuKB1058Kif+dJHhoPv3Ve/AxbjNG5Strq50+lQVPKqAd338SVGx4UZ5o2ILsSBjZusrDgJ7GfgK/lLsGnvbeGbKI83cfQ2IiYrW61s6+f6VLw+xsFSmgIN8dN+StbrY/n5K1cOQID45Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699800; c=relaxed/simple;
	bh=hSOSB0OeD4m9d1BJ3woE+QzZlposwfo3umzcGKPJDQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEpXerdaM0if7Zkp730fOTlpFhWosKxpLvG9KYx8zhCp6mCwvBOm41UyQe75xBOO3C9hsn6cONGoNCWLKFltWeFGO6YnCIrj4ifflxnw4LZk2CuHxARu+Ed7MQDJbx10ObFyv5pln/X13qjVcYZmXi4yHUuDW9SRj9r1/dw8qLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4xQNHT0; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439ce3605ecso369037f8f.0
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 00:36:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772699797; cv=none;
        d=google.com; s=arc-20240605;
        b=iNzx2MF1lxKITOHcOC2cbJHQ08gJhHWLNLaj0ndpz4CLgDPhJ5A3tSOfvRpdtXZasy
         fohVuglbwTEsdfqUSmMZc5Z+4kPPRaja2oqc/WIafCLelCIErZ1OyXVesdfV7SrHtCNo
         XOXAis3X+ILpYpNqM69CRrYOiDlLovq5KWace6cBx23kpnIx/y25pR1NGrmjFrQAE/6P
         fj9u3j96dGjoTq1JwIMPLsXbFRtQ1vZ0C7YbkBhvEeSkHFBr4laLaI4MOEnuN83zexZA
         j3GsfbuX1fPDgVwj//BHSP+8pSQ/K3GoeLLra5O6PY6rVTzdWLlcMdUhyRz3ZydJ5rcM
         QWAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k5G0xZ9vhNKI2yHTPb4OU1Vd6k8/Kyp+TwAEkhLBCXQ=;
        fh=UsZp1W7rDFEoAgHYaayiJhJKrfaa3Ha31gXLOukkhr0=;
        b=S9tcwTczKYtGS1qVV7+BzHwERo6iMKQcvL2x0RgXzeGF57iJhZDylfuZerifrnEr+S
         vTv5ugeFJ67Z+bxEKzZYfUuhe0590PRKjJxLkMELRW+nVpnvr3+AUGfkMQY0azc/G70o
         Tzl2FNr1tut9ppRWCT6CSpqvrXear4GYXnoeYXkx5Md4h8n1r5wUWxsKaRiA0yWQ6Wg5
         9Qpe99/RLO5IGYIRDY0aBGEq1D6Us+XJGRwwxjHjPo6EEysQs/rO0BdnE3EwMl6ESqVb
         ePLidWZ8ra4zoBmS1hwOqsQfwB5tZBg6AGqcZhn4CUBl9HSakYjVDZS9ql4V6XroffK9
         h59A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772699797; x=1773304597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5G0xZ9vhNKI2yHTPb4OU1Vd6k8/Kyp+TwAEkhLBCXQ=;
        b=j4xQNHT0UYnKQ+rEpWViENzb2S8/eUp7RUqLRzhktHaKal2AlCu9GJt1IE/dnrHk/K
         y1UC0IQfVS4f0gix9ENFVNahdD16k2Dv3+qyqqqGxmrZz5Q3C7dcltuczp2kfurtw4rc
         /JjAduQknDw3S3Iy13wuZx9sszLNtSmx87jfq63ayZdcrvV+Qp+ubL6p9XVkP260IpoC
         pdzAiGbryN5WirerS+KXhGKLKQEqrlqRP062NUQ8/uPX09AUzdnUEdpNkCdE1uzEH96O
         6cXkLUgNH/36W0/oS0+KBi1rSblzHETiaH6kkTyibsLQoCS3z+JAssW/Lj6zPQMAWy2r
         ZK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699797; x=1773304597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k5G0xZ9vhNKI2yHTPb4OU1Vd6k8/Kyp+TwAEkhLBCXQ=;
        b=Ndlp77Jz2pks/nh5VzJLK/K4XcSZjXoLMtWJIX0haB+maOU1gx2I+aE4hStEJh3I/j
         TjGJEiG8bRYK+jtf6tQn0dAVSASuW/7GajgvKp9wdol7jCURQv/iP+L+QvZerL3R4dIw
         placflE3cXdvf9nAV4YfwkI1lF7zXWabw+PSclxm8YNx/WBLL84b6gjeifXvaBlF0/Ee
         GoCAAAGUFAVWUpIIoWk6Mvk4cnS+37VdRYjb279XSDGMyaSuyEQQ73EX3bcfb5vZA9EG
         O3dVanf4f90TXH4hDwwye6gzYqqQxw8RLKm8tL+5i7Pp7FPfcA6FLB3ZGImL4Og0ZIvS
         5Z3g==
X-Forwarded-Encrypted: i=1; AJvYcCUDTnge6dRw8J1u8k3nV1cFI4o2ReSEEqzWj8cJjaSY1buCBnZOTIbEVzqxBnoTJZm0xTHdROw+gEzjWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YymazP+AppIBlb5e0LcCLLz0dXD2++k2GBJjZcmwHbzhYiXbvfy
	+gwf81gLiRI6mYCPhnLB8PEPT10nVPG1yM8wpG178V+QTEO0yE924AvgD1xx2kDOiO2Qe84Q3Zb
	903fPjsSW3I6/k7wSzaAVQZzA4iaVk1s=
X-Gm-Gg: ATEYQzwUHjlS5KEppSItyEBJVSy2iGsxQM59vTt/yf9oArlGVNMjcnSXtMT88DZ/D88
	yD3m6u1IN7nxTGlUXnGCPoNnw4WvBCTFlCudEfQGztrNu+fSYcz/yW2BSlEm4brNch0NuvcyWVL
	wBf8Ctnqt8kTRdrqYS/e4QrKdbFCQFUKnYd57r3iudbrXMJGNfmJ6DdxO7Jpk7O5tFr+IiUgcpV
	BjK5oxCKp8G76tZmIegV1fvrDi2eYsvmdBLMjZekv6533aw9DErnTXn73s8hMG5eDE8oY2+BC/R
	cC2FaWtw
X-Received: by 2002:a05:6000:3113:b0:431:808:2d58 with SMTP id
 ffacd0b85a97d-439c801f516mr8369434f8f.51.1772699797219; Thu, 05 Mar 2026
 00:36:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304185001.82988-1-clamor95@gmail.com> <20260304185001.82988-3-clamor95@gmail.com>
 <aainoYv6RXkXFcHv@kekkonen.localdomain>
In-Reply-To: <aainoYv6RXkXFcHv@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 5 Mar 2026 10:36:25 +0200
X-Gm-Features: AaiRm51wWcAzTlCAo16hjl9YtY3WCpC_whcBCHj-JdnT9M7JLgnBhssMy-E9L0E
Message-ID: <CAPVz0n2e3HCJRo0_Q5zbYp4w_-=ZCypoaw9vaN0NTfFr7qgorw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: i2c: mt9m114: add support for Aptina MI1040
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E543C20D93F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54577-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Action: no action

=D1=81=D1=80, 4 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 23:43 Sakar=
i Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> One more thing...
>
> On Wed, Mar 04, 2026 at 08:50:01PM +0200, Svyatoslav Ryhel wrote:
> > @@ -2646,9 +2658,18 @@ static void mt9m114_remove(struct i2c_client *cl=
ient)
> >       pm_runtime_set_suspended(dev);
> >  }
> >
> > +static const struct mt9m114_model_info mt9m114_models_default =3D {
> > +     .state_standby_polling =3D true,
> > +};
> > +
> > +static const struct mt9m114_model_info mt9m114_models_aptina =3D {
> > +     .state_standby_polling =3D false,
> > +};
> > +
> >  static const struct of_device_id mt9m114_of_ids[] =3D {
> > -     { .compatible =3D "onnn,mt9m114" },
> > -     { /* sentinel */ },
> > +     { .compatible =3D "onnn,mt9m114", .data =3D &mt9m114_models_defau=
lt },
> > +     { .compatible =3D "aptina,mi1040", .data =3D &mt9m114_models_apti=
na },
> > +     { /* sentinel */ }
>
> The driver also supports ACPI. mt9m114_models_default needs to be added t=
o
> the ACPI data, too; otherwise ACPI support breaks.
>

So turn into

static const struct acpi_device_id mt9m114_acpi_ids[] =3D {
    { "INT33F0" },
    { /* sentinel */ },
};

into

static const struct acpi_device_id mt9m114_acpi_ids[] =3D {
    { "INT33F0", (kernel_ulong_t)&mt9m114_models_default },
    { /* sentinel */ }
};

I want to be as specific as possible to avoid any misunderstandings.
Additionally, please ensure these are all the required changes to
avoid unwanted reiterations, as I may not be as familiar with the
media framework as you are. Thank you!

> >  };
> >  MODULE_DEVICE_TABLE(of, mt9m114_of_ids);
> >
>
> --
> Kind regards,
>
> Sakari Ailus

