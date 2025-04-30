Return-Path: <linux-media+bounces-31478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8333DAA5197
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 18:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 381F917DA05
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 16:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8621264FA4;
	Wed, 30 Apr 2025 16:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="fESSCScl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB348264FA0
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 16:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746030341; cv=none; b=PUuNJnJAmtDHjS0KJzxEqBWLMhfUppHyYS1UbHOWcxDNl/eCukagJBD6TqTMHiZdC6K9V7OTChY/Zrv9fVXrSsYDOTx5X4OFa+Rqdv6AsdRkxh3pkC8lVtVU7G7MAqrWATrpDqkiW8rFdLIqQci9bns/9dn3wfsxcmlTOQnJeXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746030341; c=relaxed/simple;
	bh=1PVzdxRp/+kFJAIg/6hMZbJV5KT/kYbP/MLkM4mgXFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsAUsdTyCylN/AbDDD2ysg0jtEKP09ruZfdHRkXnD1uA46ElZIBy0IQGOQhfyneEcGmWzsuUasfYufG2fYGhqj6e+E7wM53tan1iWFT+06RzJKBrdl6YX7g1tX2wrGlSAUj/Ygu0csLXiMbLG60SypmKHLIH7365wqucAGhgAis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=fESSCScl; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7082e46880eso722667b3.1
        for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 09:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1746030337; x=1746635137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYuvroTINkfC6xAaXcm4PuIm1ax6xcO4Y50Rb3BmvI0=;
        b=fESSCSclF5O2b9sup4quDgOBRJ/roLJb19FtfUewz+S9+SUFpeClDRQZ1O3k793Xm0
         +tqiHTxRusOrnAYEXL+t/sCYknagaJxgMgpEXXJA4nO4U3ypFjB7SKKo4RypcAYRjUrF
         RqyA4C5A8TdSHdmgvDLNev4LScAFNAcgIcCAvBMOOsVuMF0nxtCtBKLBjXw22wrPTD08
         kpt8SfNd2rZ8vdqaLM7KfLbPSqe/RpzP69k2kpecbq3F1ZZp6TLaq5XvXcvRhD+IH8CH
         /jLQ85lnw5+0JGT9Ruw64YHxT9Xk2XeN/nhRMx+iqhilCq7YD6yAVIIRGreG9q3wqrkd
         ftaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746030337; x=1746635137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pYuvroTINkfC6xAaXcm4PuIm1ax6xcO4Y50Rb3BmvI0=;
        b=QrSLS9yaGzcP9iLGNnhwcp9jxEAh28iNOLzPtZ7WVTUEdoos/WTFn+VNsvWWlVb3N7
         hosT74T2vhHV/67H65YSU+H5Aw9uD+qRzcrA0xZFwVOAeWB8VeM16S9VnwHnUNbEW3Mm
         mYIRo47VDu1HjHedaIvspsw4FATd9qnL4/qKn1IBlzUfnqmnDyp1caAKcJaomwMKqSGd
         07OtmgsJDjcCkAv003eJ8yIqupLXBNH8APMl48dQEi8lBVcbefffOfgPASC4mZLrOOfc
         9ltstHPtWDuadM1B8KIKaeorneMN54Vrd0nUp70Tzl81HDCHZcdfZs9RexM11hXmu5Kr
         k0lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjcfml7fb/DtVCIZW2teFGEH/whXhS5Yfd00AzfWRWPbskANvU5wQPLPCp6btlP0S7INQEU/ANSfKGIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlX+ZX8PLWMUc4NCbtwZCp2Ig8B5AfGbEqZLNvMldRCM4K8SjQ
	DnUU3kYrkgRT++45SiVlfxdVNyJRZK3S5n3nxqm3pJXw3ikH58SkTfwKSyxYIrYkOKm3K5SqPgA
	VHF12sNMDNHUT5KpwjG88Kxj77qT1JrN+i7qjKg==
X-Gm-Gg: ASbGncuYyOQqwAdb7iD2eSEsbZJBJrYO2kpBs7QzC1Nvv768khObsmMMN9rSXKe8u4/
	Kg3vXxkJy0vOeCdTGB3KexKD0lNvjzrxRcsaZ787+eJ3O8bba37Bzb8yLzwZnfuTUqiq2kuVCIl
	PbADUcxJTHNPCUw2Lsb2sy2eEjo4gIf9A1zGp4UVuPRPq3Fb+mX5nUFw==
X-Google-Smtp-Source: AGHT+IHd+mzxsbQHzg2KdqaE0D0IMCI4DPD74nxHKEsYaPw4wosN4rVl4mhlvOGDdXpSNiN3p5emIlAjRcnS9XKmP/Y=
X-Received: by 2002:a05:690c:700b:b0:708:73bc:abdc with SMTP id
 00721157ae682-708abdac21fmr56602207b3.22.1746030336612; Wed, 30 Apr 2025
 09:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVXrHVugCMoWkCRVGotOEeTuuJJ6rC7CC7Kf_seo3J5og@mail.gmail.com>
 <20250430131856.GB25516@pendragon.ideasonboard.com> <CAPY8ntBPSC6KZcBVt35QWx_ZPYwkSJSVzhhaXokbjkWJDVJRqA@mail.gmail.com>
 <20250430160445.GB31516@pendragon.ideasonboard.com>
In-Reply-To: <20250430160445.GB31516@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 30 Apr 2025 17:25:14 +0100
X-Gm-Features: ATxdqUFmSnHhLyB4xlaoBz0z3J5u5ayEJkVVl-qFWx18SUxO7BsGgktwlOcreUk
Message-ID: <CAPY8ntBb5x+F=xj=KVrkfq=JqdshgCS548YjRt4OuhhyVJNkVw@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: sony,imx290: Update usage example
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Apr 2025 at 17:04, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 30, 2025 at 02:52:01PM +0100, Dave Stevenson wrote:
> > On Wed, 30 Apr 2025 at 14:19, Laurent Pinchart wrote:
> > > On Wed, Apr 30, 2025 at 03:03:10PM +0200, Geert Uytterhoeven wrote:
> > > > On Wed, 30 Apr 2025 at 14:58, Niklas S=C3=B6derlund wrote:
> > > > > Since commit 98e0500eadb7 ("media: i2c: imx290: Add configurable =
link
> > > > > frequency and pixel rate") the driver expects two specific
> > > > > link-frequency settings 2-lane (445500000, 297000000) and 4-lane
> > > > > (222750000, 148500000) operation. The driver fails to probe witho=
ut
> > > > > these exact settings.
> > > > >
> > > > > Update the example in the bindings to match this to make it easie=
r for
> > > > > users to incorporate this sensor in their device tree description=
s
> > > > > without having to read the driver sources when the driver fails t=
o
> > > > > probe.
> > > > >
> > > > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ra=
gnatech.se>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yam=
l
> > > > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yam=
l
> > > > > @@ -136,7 +136,7 @@ examples:
> > > > >              port {
> > > > >                  imx290_ep: endpoint {
> > > > >                      data-lanes =3D <1 2 3 4>;
> > > > > -                    link-frequencies =3D /bits/ 64 <445500000>;
> > > > > +                    link-frequencies =3D /bits/ 64 <222750000 14=
8500000>;
> > > > >                      remote-endpoint =3D <&csiphy0_ep>;
> > > > >                  };
> > > > >              };
> > > >
> > > > I guess the link-frequencies property should gain a rule that it
> > > > needs two values, too?
> > >
> > > The driver doesn't require two frequencies (unless I'm mistaken), it
> > > could operate with a single one (albeit not in all resolutions), so I
> > > don't think we should require two frequencies in the bindings.
> >
> > The driver does require both due to 98e0500eadb7 ("media: i2c: imx290:
> > Add configurable link frequency and pixel rate") and
> > imx290_check_link_freqs()
>
> I realized after sending the previous e-mail that I was indeed mistaken.
> I thought the driver iterated over the DT link frequencies to check if
> they're supported, but it goes the other way around.
>
> > However I'd agree that it'd be better to make the driver accept just
> > the one and make any compensations, rather than amend the binding. I'm
> > happy to try and find a few minutes to make a patch for that.
>
> That would be nice, thanks.
>
> > My experience of this family of sensors says that we should be able to
> > run any resolution at any link frequency, but it needs changes to
> > HBLANK to ensure there is sufficient time per line.
> > Dropping to the lower link freq for the 720p mode is only because that
> > is what the datasheet describes for the precanned HD720p. The window
> > cropping mode lists no such requirement, and yet could produce exactly
> > that same 720p output.
>
> And with more information about the INCKSEL registers we could possibly
> even support other frequencies.

I have no extra information there.
The minimal changes that are made to INCKSEL 1 & 2 to switch between
the two link frequencies makes it look pretty fixed rather than
flexible PLLs, and I haven't got the time to go randomly poking to
reverse engineer it.

  Dave

