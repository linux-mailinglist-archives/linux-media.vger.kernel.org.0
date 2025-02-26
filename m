Return-Path: <linux-media+bounces-27105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91085A46EB3
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 23:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CBFF7A5586
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 22:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8F725D1F7;
	Wed, 26 Feb 2025 22:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXG3Nxin"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2A125D1E1;
	Wed, 26 Feb 2025 22:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740609701; cv=none; b=EtFjkTSuZBqQL6Lc03U341uHPvt4DEIKO/zT57ZX6XHmN2/E0kx73JXSnF9D3gq3gTs6hLKtMl93ZKqJYMYnpLcDA30ReOfwI30Bwh4FqHSy3PiQO+9SLM6Imz2l+G8+oUpy5dyQ/oEac925j4yAZQ89H4vuQlEOiuNr1MzKpig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740609701; c=relaxed/simple;
	bh=Qbf6pdMB9rWRlTmv9kPhr5EySnUr/WkW64EZ9c1V2N0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h/VyWdYfTtOk+iT3zvovYHSE2zSE+irWlCFG8F6j51W9qkExiznOWZ3Z1JzSYHTfslmQ6h7EMB3OA/535zEItB47iEerqDiDqcX/qICwe89rIr35nTUKdCOql9SgqknumiIBF2hJx245tIYOBkIdaYmTjWpU/0Tzuf1hhc5jo0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXG3Nxin; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e241443e8dso667346d6.0;
        Wed, 26 Feb 2025 14:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740609699; x=1741214499; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qbf6pdMB9rWRlTmv9kPhr5EySnUr/WkW64EZ9c1V2N0=;
        b=HXG3NxinLSXM24yZa0pmPpACc7mCmrBkgvrobMxP80p/tIDvtZ8QpbKbTtJK7EcK3N
         fR9tB0qZUpSFxCx4+if403YuNkz+CWKF8toCwX//pIXLa4fOZMRUiWceCwdGetkbwtzn
         820fyfcCyB7QuyGBNuLSvmconbixM6bfiGZQStyxsGKMHbPKU9ex/CdCIBaiciZpHp3R
         WvSfubUnZYbWwf8K4e54w7fRi1YWFPGQIy9sOvTcAMQdznTNiyYsmLHJSuuC6HHZYKgc
         DlDZx04W1Y6q0mR/9QIa1j5njdAFWqKT2Gfs1ZJrFLTYzjR30N5b9q/TNAOPz3cx5I0z
         fDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740609699; x=1741214499;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qbf6pdMB9rWRlTmv9kPhr5EySnUr/WkW64EZ9c1V2N0=;
        b=WGQyZyw30X3+auAS53PSB4nZPtbYy+yigngHGLWngnc8kbKWIof1Th5m7ujRRJQ0g1
         99T75Nw8rNwCdP48Yu2JWGnrxh/fpxIFWCD9jq96154Hnz9hGNk/aA/E6jbqAJiWnznS
         hwJevqEw1/KoI2eRVnhJTLgGJ/NAvakqGidcOxlwxecG7uC6YsiZspPIfqVOI4fNEFPW
         XVjqywdgAIrbE8iUzypD7jfqCILdYLQN2rU/OGTuLMBzI9IaJa+DQC+xnk5SjOZA29JX
         6lEOXTMDJns/k/ryQaBhhRj6TS1AP7el5Irc6UahGvFARfSN0mGhOrJs306qOTWpxp0L
         SHgg==
X-Forwarded-Encrypted: i=1; AJvYcCUgm0KH02Dnb2sdxiTi5kZo2gBv3eL79ph/QxT70sPjEJ15wU5Z9PTJShh52+ZUF9CfkSxf2XXKPPjYLYA=@vger.kernel.org, AJvYcCV6Ke53ieK7C8oT0+ie9re2B6KD/HjHSYV824C0tenfLAXMajonOa38xAIplsDc0OYWNelDWpAEXA5c@vger.kernel.org, AJvYcCXC3nvRcbZUEBHLJLV9NzaKrHFD5+6SBaJs05xyZMRiSAaHppVOOOmg+FC/2vdEBxUpg+iA5p9y78pmqhae@vger.kernel.org
X-Gm-Message-State: AOJu0YyPrBHReH4K2naIZmyacrI2kPAwsXq9pVva1NDG6jESiMZrJ6bX
	yJlE/8UxIheinvXMnpXCzbrgNK+Fx6j22iF2PneVqJRAo/eXTT6N
X-Gm-Gg: ASbGncspw/U1baou43f7z4+1WT4CFxXjDqGoME4kqHEby62SEWnWuL2O2CEestSpTB2
	4ZDSnugLQdyXUigeHpPv6O6cxnOg9SZ3vFikkZCT4JHWEHZKBfWQaaDlaFJ+G4FIS+fiVSXeCuL
	TFD1Y7bfAr/kVMYvb6mrmLRdc4hqG6unQUqZKVA29Ady+gH3PPh/itYZE9hJb5UYzFMDTvd7Hjl
	VE7++rOmtu1VtJH7qlMrV/RsqhyyffNA+OxdYEq2t15/4NDluOLbnJmTh1mF4a55dGrTMC36F2x
	6ETLOwoNpamlVw5gIKhSWxTG0pfHLCIfNRV1mBtMVY0FlaKCtRWKrfvUEIyzo/YkefHzvSo7TkR
	4vRatlQ==
X-Google-Smtp-Source: AGHT+IEzn/PG+RBqyb/tDnoYBHFaH7nC7MSNsCeG4Y6DHN/r5jkgDjgEjr6TLU5Kc6SwRg6WlTBCaw==
X-Received: by 2002:a05:620a:1712:b0:7c0:af16:b4a8 with SMTP id af79cd13be357-7c0ceee5300mr1331316285a.3.1740609698879;
        Wed, 26 Feb 2025 14:41:38 -0800 (PST)
Received: from ?IPv6:2600:1002:a012:8f2c:b83e:9ea7:2886:546f? ([2600:1002:a012:8f2c:b83e:9ea7:2886:546f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c378d9fe6dsm15570485a.77.2025.02.26.14.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 14:41:37 -0800 (PST)
Message-ID: <69cb2e95c291f17cff42b45e7c871f30a85c060d.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add dt bindings for
 m2m-deinterlace device
From: Matthew Majewski <mattwmajewski@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil	 <hverkuil@xs4all.nl>, "Dr. David Alan
 Gilbert" <linux@treblig.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>, Andrzej Pietrasiewicz
 <andrzejtp2010@gmail.com>, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Wed, 26 Feb 2025 17:41:35 -0500
In-Reply-To: <20250218-eggplant-skylark-of-swiftness-dcf6ba@krzk-bin>
References: <20250214231759.119481-1-mattwmajewski@gmail.com>
	 <20250214231759.119481-2-mattwmajewski@gmail.com>
	 <20250218-eggplant-skylark-of-swiftness-dcf6ba@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Tue, 2025-02-18 at 09:30 +0100, Krzysztof Kozlowski wrote:
> On Fri, Feb 14, 2025 at 06:17:58PM -0500, Matthew Majewski wrote:
> > Create a new yaml schema file to describe the device tree bindings
> > for
> > generic m2m-deinterlace device.
> >=20
> > This device is supported on any hardware that provides a MEM_TO_MEM
>=20
> Which device? I don't see here any device name/model.

By "device" I am referring to the m2m-deinterlace device, which I
explained is a quasi-virtual device. If this is confusing wording I can
change.=20

> I asked to provide here some examples of devices.

As I wrote, supported devices/hardware is anything that provides a
MEM_TO_MEM capable dma-controller with interleaved transfer support. I
did not list specific devices because the bindings are supposed to be
generic, as they are not describing actual silicon. But if you want me
to list some devices which provide a compatible dma-controller, here
are devices I found in the current mainline kernel:

- TI OMAP Soc Family
- TI Davinci Soc Family
- TI Keystone Processor Family
- IMX27 Processor and variants
- Several Microchip Processors (sama5, sam9x7, sam9x60)

As I mentioned in my original email, I have personally tested on a
BeagleBone Black with an AM335X OMAP processor. There are likely many
more devices with compatible dma-controllers that could be supported
with additional dmaengine driver support.=20


> > capable dma channel with interleaved trasfer support. Device tree
> > bindings are for providing appropriate dma channel to device.
>=20
> Don't describe what DT is, but the hardware.
>=20

Ok, will remove reference to DT.

> > +description: |-
> > +=C2=A0 A generic memory2memory device for deinterlacing video using
> > dmaengine. It can
> > +=C2=A0 convert between interlaced buffer formats and can convert
> > interlaced to
> > +=C2=A0 progressive using a simple line-doubling algorithm. This device
> > can be used on
> > +=C2=A0 any hardware that provides a MEM_TO_MEM capable dma controller
> > that supports
> > +=C2=A0 interleaved transfers.
>=20
> And how do you program that device to deinterlace? How do you signal
> end
> of frame/data when writing to the memory?
>=20
> It still looks all this is for driver :/
>=20

All of the deinterlacing is handled by the dma channel. To simplify a
bit, m2m-deinterlace basically just translates video format information
into appropriate interleaved dma transfers. Everything else (and
everything hardware specific) is handled by the dma engine, such as
initiation and signaling completion of transfers.=20

I think an appropriate analogy for m2m-deinterlace would be spi-gpio.
Since spi-gpio leverages gpio for bitbanging the spi protocol, the
bindings do not need to describe any clocks, spi-controller registers,
etc. All of the hardware specific components are abstracted away by the
gpio controller. But the spi-gpio bindings still exist to specify which
gpios are used.

Best,
Matthew

