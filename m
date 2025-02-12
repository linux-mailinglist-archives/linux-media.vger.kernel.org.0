Return-Path: <linux-media+bounces-26097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E4CA3329E
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 23:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3514C3A837A
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 22:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353A5260A4E;
	Wed, 12 Feb 2025 22:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5R9GRrv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAA725E44F;
	Wed, 12 Feb 2025 22:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739399391; cv=none; b=VzdvFYnwdaSQuON/M/PBQ+ncZu0IwgjtB/7wuWTR9U2dL+THcd802JjP98nXGrA1JJhff/uaobp+pUuT7EeiwWQwbMR/1xmcbkhyeDG81fghJVYNtdksmGCGOaPPLoGVWrtLaBPX7wNPs5AoWE61e2wRTdB/Wri3jdDpD9qZ9uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739399391; c=relaxed/simple;
	bh=LhEw9QPpOdavL5WIkqJTDi4TOOtHKEvJtP0Vd84Qijg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OtrQw9DWQv6X74vR4JaWN4Tcfk0ZOj/TITU3HbJVkzicVt53S5LskVIlfv8ZDOnUFVeECp0ElC/VXphYG/jUzdc6FRPIz1a4UkqnKbhH1XKP/GWW+aY8ETp5e7qxBCBfjI2E2twfspA0nUtTNOh+ZhfwZEpk77GgxQxVlm8WHck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5R9GRrv; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c077f732faso3277185a.1;
        Wed, 12 Feb 2025 14:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739399389; x=1740004189; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LhEw9QPpOdavL5WIkqJTDi4TOOtHKEvJtP0Vd84Qijg=;
        b=G5R9GRrvhz0geZwmb87PHGhRb93urTPAhdEz30Io+pWm0RaGoJFm8Hdoj5lrbPFqtQ
         doQdUHdtkltKw7TGJPtQES/jHj+emO4zR434jomyxI8pCTtNb7klc6QaCqCtL4TywBvi
         Vl3Lx4EB8vPYjEQwU3TaN5Dqbz4zdHY+UXdK6ymrt+BtUCv7QgaDkbz12ZESAYX/5Fpj
         YAkDSaK8N/oLILaEBkCzAeUqxB1v2Jd3TFz3y75/jh0CnjAoLCuefz6YjDMbrTsmth/1
         AW/GT/nOuc8boJ3Nf6JRp/MBkvYbNJo1Ps1vr3qjgeYH5el1KNlLTGxX0Ab9ot7SLA3u
         75RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739399389; x=1740004189;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LhEw9QPpOdavL5WIkqJTDi4TOOtHKEvJtP0Vd84Qijg=;
        b=qYQ/c+fnjiU8HfFdeVpX+tzpPWdS7UBor4YxS2NYy7/nar1cgIMbciHR5PCklXXoU4
         j8Ya/lqgxFKfip/UQThiipy+K86riHExilZ6px9F10SYGx3yF/12kR0n5B+7ZRk2eE36
         H5Fd0gDdo2vstK51+0uvXpVXE9t4JloAi8mRPxuOtHSnPycBVJVpgnSNr/kqMho+Qvl5
         7oHPVDb+v7rro41IkYZVysAcRqzJ1yKWyqOkzJrfbsOsOC4W1nk2zkacNIIm5YDNI8pr
         uD3tpu/noC+1xzRn35UH2d2mForAokZ2ofWYD5CnqPWq/a3+A2FV8ZT3nU3ITGF7PFdo
         Pngw==
X-Forwarded-Encrypted: i=1; AJvYcCWuNcdbRzLw31QrzIBZJHVqhz7KkyUwKOc08wQaD1A1XK3tHjJwgmMgfJcuGscy/elbMt9x3Z6h+IV/Rao=@vger.kernel.org, AJvYcCXWtj0rbJntKxXwDMXpfaaAE66aS8KsJromIC5JSXRQw1rUq5nI56JIDS7oKSsIbrHvyGpobaIjugStbv4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx0FDRLvCMK/RjYpjVXK0+UoyhcFojhH+COgqRO7zqNDWFxcF+
	elWoBY7j2WDtiDPWPn9RjkZmSWwNgr1McSbNTNVjkvYFdk4PS1QJ
X-Gm-Gg: ASbGncuNgvvRz1tATiJaeZDXwslX3UWueRiauf0HlHbuBXO23NM5mZznQjhpD4JFqRl
	SNEfLclui+Kb+33pbd7umj+eG9tm1ucPzlKGKDhhPm0h1hGTPr9gX3LYiul6lTjtzKedAEQ5141
	OJVwWNdYio9i3OPz/M1AUuYKDfmFSRKFygfC07Y3tpHEDEDMaIU24TYA3Ro+jbLUk+n8lkyMaZl
	mZ9yLqsqE6nTb7jTuLUtwddBcSNwZVprR0a4osFIhbRTeXsK+bhVwX7jLmimSeNTHJsTAzfcy1u
	1cT8I474JjC6Vbnk7PzfAt1nZUHit44lyv6ISBJVfi6qnvnOgPiTYwe5ntLdc8tQmjgk
X-Google-Smtp-Source: AGHT+IFTQkv4xr0P0x72xV0ZftDGC6yXqRNkIg/YxOLjoPFJ+/5r2iNCx1+FzXPPj42y5Uf0QsfNww==
X-Received: by 2002:a05:620a:4725:b0:7b6:cb84:8132 with SMTP id af79cd13be357-7c06fcd5338mr271807885a.13.1739399388826;
        Wed, 12 Feb 2025 14:29:48 -0800 (PST)
Received: from ?IPv6:2600:1002:a012:94a2:c438:570:6155:5ffc? ([2600:1002:a012:94a2:c438:570:6155:5ffc])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041ded0dcsm908737985a.9.2025.02.12.14.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:29:48 -0800 (PST)
Message-ID: <91fbc8f06f4d57f5e3d25dfec99e2fdb76b0a4cb.camel@gmail.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: Add dt bindings for
 m2m-deinterlace device
From: Matthew Majewski <mattwmajewski@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil	
 <hverkuil@xs4all.nl>, "Dr. David Alan Gilbert" <linux@treblig.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Uwe Kleine-Konig
 <u.kleine-koenig@baylibre.com>, Andrzej Pietrasiewicz
 <andrzejtp2010@gmail.com>
Cc: devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 12 Feb 2025 17:29:26 -0500
In-Reply-To: <5e9432d7-0be1-4d98-9a61-cd288e53e772@kernel.org>
References: <20250212170901.3881838-1-mattwmajewski@gmail.com>
	 <20250212170901.3881838-2-mattwmajewski@gmail.com>
	 <5e9432d7-0be1-4d98-9a61-cd288e53e772@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof, thanks for the quick feedback.=20

On Wed, 2025-02-12 at 18:22 +0100, Krzysztof Kozlowski wrote:
> On 12/02/2025 18:09, Matthew Majewski wrote:
> > Create a new yaml schema file to describe the device tree bindings
> > for
> > the generic m2m-deinterlace driver.
>=20
>=20
> Bindings are for hardware, not drivers, and usually not generic.
>=20

Ok, I'll change the wording from "driver" to "device" in V2.

> Please describe here exemplary devices.

The m2m-deinterlace device can be used on any hardware that provides a
MEM_TO_MEM and interleaved capable dma channel. I'll note that in the
commit message for V2 as well.

> >=20
> > +description: |
> > +=C2=A0 A generic memory2memory device for deinterlacing video
> > +=C2=A0 using dmaengine.
>=20
> And what is this generic device supposed to do? What fits to generic
> device?
>=20

The term "generic" was taken from the driver description. It's generic
insofar as it only relies on the dmaengine API for processing (and
hence is relatively platform agnostic).

I will add more information about the device in the description for V2.
I'll also mention that it's intended for converting between interlaced
and non-interlaced formats by line-doubling.=20

> > +
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 const: m2m-deinterlace
> > +
> > +=C2=A0 dma-names:
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: rxtx
> > +
> > +=C2=A0 dmas:
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: mem-to-mem capable DMA c=
hannel
> > +
> > +required:
> > +=C2=A0 - compatible
> > +=C2=A0 - dma-names
> > +=C2=A0 - dmas
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +=C2=A0 - |
> > +=C2=A0=C2=A0=C2=A0 m2m-deinterlace {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "m2m-deinter=
lace";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma-names =3D "rxtx";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dmas =3D <&edma 20 0>;
>=20
>=20
> This all looks rather like bindings for driver and not even quite
> generic because looks quite simple. I guess media folks will provide
> more input, but anyway it looks a bit not-DT-enough.
>=20
> > +=C2=A0=C2=A0=C2=A0 };

Yes, the bindings are much simpler than a typical media device, but
that is because the m2m-deinterlace device only needs to be provided a
handle to a dma channel to function properly. My reasoning for adding=20
dt-bindings for this device is because it is a consumer of a dma-
channel and the dt bindings are a platform-agnostic way to be able to
provide a specific dma channel to the device.

As an example, say on an embedded device I have a dma controller which
provides multiple interleaved MEM_TO_MEM capable channels. I want the
m2m-deinterlace device to consume one particular channel because it is
higher-priority than the others. With these dt-bindings I can simply
specify the correct dma channel that should be used. Without the
device-tree bindings I would have to manually edit the driver to filter
for the correct dma channel to be used, but then the device is no
longer "generic".

It would be helpful to hear what the media people have to say about it.
The m2m-deinterlace device is a bit of an edge-case since it's not
quite a "virtual" device since it relies on the presence of specific
dma hardware. However, it doesn't follow the typical conventions of any
other in-tree media driver that consumes a dma channel, which all seem
to have dt-bindings.=20

Best,
Matthew

