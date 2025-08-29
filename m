Return-Path: <linux-media+bounces-41354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 355F7B3C259
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 20:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F03F94633FE
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 18:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21B1342C92;
	Fri, 29 Aug 2025 18:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0W21xwK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CDF17A309;
	Fri, 29 Aug 2025 18:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756491626; cv=none; b=qb2bT5jyEBLTK+zWWcQ7OH7UL9DDnaKuYwiluvKPi8yCZGQoSsYl7/uXE5r7zBAlunxbOM0EHmEFyM+V3VPhyUG1pLxzkmv44sCIHekkUYOR7hgzKhPBAksGVD5eQft5H5vd4uv/udIoCXJ3iqkOya5l2JKu6kz86xLqyh3uQbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756491626; c=relaxed/simple;
	bh=PzwCtuB3j9mG3oFLMLpPr0xi6ZQk8WJsFrhJAOjv3gc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHQwgmR1b1aLcBUvq9TK3u3munNPPM8BdVwOBQfrKvgJkZwXw3AMtMtX5+bKmpkg3ZgwpnXBmwCJ2wX5HXDuZ3QVSsNlj/ID7YP2yUnnnrcZaa/VOCnR/ZqRwOObpTYoy50w+T/O7LhJpIOGhZfL7ssQ/u3pl6XMQ3/pMBGIGFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0W21xwK; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3d17f24d42fso206529f8f.1;
        Fri, 29 Aug 2025 11:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756491623; x=1757096423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzwCtuB3j9mG3oFLMLpPr0xi6ZQk8WJsFrhJAOjv3gc=;
        b=a0W21xwKT3hyVx3v3A1z7WZRVnAEiTYb61uAm2bJ2MHLVAFM6xTVi6tcKw5p8VugjT
         NSeefMlSIcyLDB3k8Ka8dNsaIRjt4PLbmpUCw6rbjFzxdNn80LSUGPzK6Ycph5+KYrPv
         5gwqhWIskHKhNXFInoMz7J+Z37TP/Zg9sTTtxljb+vCyRj/9EUoefsrE0uoPJYHkA43H
         0ZwqLGY9/OgqGbJYVwShzj1f8/pASfCax7Gk0imsP5iPTfs5D4oOEGqq+kpnMtQ6qYcH
         6SQhEtcOsKOUCAayRV1y9SBn09wyGtq6tZUUxBsRgHqa+Sk6wXuvjw8mijtf0+acrDPJ
         XAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756491623; x=1757096423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzwCtuB3j9mG3oFLMLpPr0xi6ZQk8WJsFrhJAOjv3gc=;
        b=oIGrWWtt+8+LcTo5DAEPRVXzH0zTbAY7sf+EQq4r1/370iLnZ5TMReVUk6Qbf1/hKz
         XEpcFTY69vQ54wh6wvmel/WpkTyk9CRYxpEGwGMtei4l1iHYm5eLODEAdQExMwEuu2dC
         wd8xN3T6K2XwS95Xa56OOK/Om+PZYBUenbEZHznBfqjZNxDzyp097bV79uzTWnXlJq3P
         fn4KSjplNFhDpO2Yok7wGWvBsXn0rTA3FApWyI/yszsUhGjtQmh8GOeQB8dlnqyVmely
         B6tp9GuBiRKZxPSR6kgHbNPbzIvaBpqckS+jrZTDfc1FtTGxXMJZ562oAdki1mwiAGZT
         yFJg==
X-Forwarded-Encrypted: i=1; AJvYcCWvfPh94gMVcjloCxVewjoTiLwk0fm5/HP0VMIbKqRWhUSyUlliMk6a9Z/zAbtz8knkQ0Fp8z3o0Xjz8zk=@vger.kernel.org, AJvYcCWwUwe0GBolYv0nXCEoJxZBIxZJDlhn5gt3QpwwbJqYweXVc2qC/M1UUPykn2bqVk4x/FvNjRIWgVqB3jto@vger.kernel.org, AJvYcCX5SabpitMXWGOaj4Rt46UkCtS7ggUeEN5PC/z4fiUw5CfGdiGvQuAewOqAbQWlT1/wdChxHQIZkIru@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4CQgp6IJ0w6Pyi6yhwJ+CxAU+tMhL73ajHbVg/5Vf8+Wq8G+t
	h/0RzJ6dZf+6sPomu1SOHCN9XN8Ts7tvF9GwxgxXkJe0XRWNBsw0EJfINX49ClsmcNz/22rgS/Y
	GeNsKT2rbI1Z+Ou0z4UzZFyCDbZTduuw=
X-Gm-Gg: ASbGnctgvNd1WJawVL8BnxUkCJ4/E8KgqAK/KlepYQNEEhUPeiDi/4FooxPAgFnmZyN
	dMZgig+cZXgQFPC8CFwH1Vm2GkTP8iy1wiHwwwsqvnsnrSiD6pmMXaVhP/yf/xMAn8ay4SoGMQ3
	WNHbEjn68eusVc16osKXYJKoncZRDkjF4BJ+pNFcJZVGjXkFQggr47M1qUoZTObj/GyGnR9jmqd
	XWVkay+rCIaTvvT0ws=
X-Google-Smtp-Source: AGHT+IGp5iX3PfKgYVpRfOqVAkOALMD0nOrxDBT3qa9RJ6SnTACUl9cPGngmsEDhmzMvw3wmKKZp3k6xTCxVjnmUiNU=
X-Received: by 2002:a05:6000:238a:b0:3b9:1b9c:4e27 with SMTP id
 ffacd0b85a97d-3c5dcc0c710mr25331314f8f.44.1756491622630; Fri, 29 Aug 2025
 11:20:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819120428.83437-1-clamor95@gmail.com> <aLB_7YS9HsfzfadI@kekkonen.localdomain>
In-Reply-To: <aLB_7YS9HsfzfadI@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 29 Aug 2025 21:20:10 +0300
X-Gm-Features: Ac12FXy_FTo1uRr7aiC4D7-9SjbNknCEpUBg22m0hD1EeHF-N9jAs7HX4hgTUuo
Message-ID: <CAPVz0n1mXvdyzshei8Mbw7KVYCkQjziBA95ton4MKXPnPd0kbQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] media: i2c: add Sony IMX111 CMOS camera sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dongcheng Yan <dongcheng.yan@intel.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Jingjing Xiong <jingjing.xiong@intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 28 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 19:1=
2 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslaw,
>
> On Tue, Aug 19, 2025 at 03:04:25PM +0300, Svyatoslav Ryhel wrote:
> > Add driver for Sony IMX111 CMOS sensor found in LG Optimus 4X and Vu
> > smartphones.
>
> Thanks for the set.
>
> I wonder how would the sensor work with the CCS driver. The register layo=
ut
> appears to be very much aligned with that (I haven't checked whether ther=
e
> are MSRs that depend on the mode).
>

After deeper testing I have found that imx111 may be nokia,smia
compatible, at least most of general registers and CCS logic is
applicable. Some of registers may cause issues, for example,
"phy_ctrl_capability" =3D 0, 0x0 and some insane pll ranges. Maybe that
can be addressed with a firmware patch idk. The trickiest part is that
each mode requires non-standard and non-common manufacturer code
(0x3xxx ranges). If you can explain how to address these issues, I
would love to add imx111 and a few other modules into list of CCS
supported devices.

> --
> Kind regards,
>
> Sakari Ailus

