Return-Path: <linux-media+bounces-27349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAC2A4C4D9
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13F6E18883AD
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 15:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6DE2147F1;
	Mon,  3 Mar 2025 15:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fb2K3wPM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A0E1F17E5;
	Mon,  3 Mar 2025 15:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741015303; cv=none; b=gG7wgnoX3w1ydfVG6gHNSWwywv1DcXCE6I1rHIciz7TCo5fqCIO8HFL0e7+VgototBhhFV0nbjpAYoSu7BoxdqE9MHOac6DYzxFh2yML6MdBJPpqYJptxxHmtzyRHgFosfdqIvjgsY23rLUzCCfGpDAW2O7IVineO3t4439FjfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741015303; c=relaxed/simple;
	bh=HrebyizLFSGpmcx5xB//mRN6/SrWyVmW26AAoBXRoQM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EHq1Jl8h3WfBLGz4nfZzTi8WhDrkE8EMmGLN77aEMHSclQo1cQ1+4qsOJZChz4CX57U/My0g4d3MtXT3H4WYgpxjYwXDcnng/j5lCPX5rVAmpyXYkzGeCCyUBHbcAvPNd/KBA6dk89OstncJ1ZOXo3cfwLCQLU2rLar0Sha3UFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fb2K3wPM; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6dfa69e6922so6696836d6.2;
        Mon, 03 Mar 2025 07:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015301; x=1741620101; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HrebyizLFSGpmcx5xB//mRN6/SrWyVmW26AAoBXRoQM=;
        b=fb2K3wPM9JFw+D0lOuiEoYIyQh8E/05r4ab5iEiGzWQfPeN29Wy+5OIFJVK6OtGZev
         4WLHoT+Rx5q+580zC+Mh/hl4ERkTDF3bprWSzVkaUtqDL37iAdayjZRDL9kOBwjBlIOv
         4pYC+QElM0zTbJOsdyNH5eFhBJQ8EyBIKc/vPHwem6ip4VMImAPTnt+7oRirVrdFktzo
         41nMvYCu9G4nkGdn2zGzluGoNGjiDGQ6cLNF+0HowrVBGWxZHeGgMc6fZBLP/V8J8dZG
         Qe3QW/glu9W9HxVt911NcDnlVdZ+ZvwuLmooE0plunrN2/Jo3IykI+fUanYCYl5RPAvP
         /eoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015301; x=1741620101;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HrebyizLFSGpmcx5xB//mRN6/SrWyVmW26AAoBXRoQM=;
        b=tl9b3JlgA+RxJ4wfrxHjD0ucmxUjGFQM9e6DecpQl+sKXHly6MiQxiSjImn8QecqKv
         BFjkbeYFc+EylV0DxGk5IlfA6vIdoARjlCEH1HyGwSG+zJdvvfrTgro6MZ1TMNAtxksi
         wMwbvyZDRibZ1YIHXEt48oGAnf1+SnGazFdp+veaG46r3yTHN1pgEPcrISwMifV1Aoe8
         3+FGjQlWBFKhNQX4ZMKrPKe46brDW4qxu1cqBto+E1IDbR4UnV6PD2LsjMrAVOovVK0c
         bY8a1nlbzH+To0lAlOUhwQiH0tbDiTqn+4etjvyeoZTmn+wbYK7JvPOszW9GPsTfYqXg
         PDXw==
X-Forwarded-Encrypted: i=1; AJvYcCVA+Q7CFtH/GnnoxbgdORWykQiSTgL4E4WHPK0rlpFe8ciaenVVtSdWRtmllXGZT5GWC9ZXWVxJtXCFGOFj@vger.kernel.org, AJvYcCXFyoYPUZRrYsIKm6JwP0mQ9yOVSqAs6WaG7Xb7rpy/9J5aVOoJZJwpw4HFw4P4FgYwn+a4L4xqKz+V@vger.kernel.org, AJvYcCXiwiYdLnBJKUs7cVt9DSPD4HBakb0TwNuKD7QfUNTYwa3guOtSrYuRXxWtdLCeU9yJEcdjCVESteSjyQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT3suJZWmwWNmTbNGmFXZBYRtQS5oBHRQbkwRqZxlWSMTQTj8Z
	+K+Ma9SqDfcGwqLncoU68Rsq4LoYkQb//RWN4k2LNrP8MiWNtvP9
X-Gm-Gg: ASbGncsJ38ukqHcTi9tlAaRyo5E2vOzH/MsJB30lIGC32UnC1ka4OxUkg6xtzBWKRpR
	IZz4VI4biCk28kNLnlPy4GhpZvi95wvGwdLvOEXSb8djjGydlAxu1ugUm6/4+CwFoFsFKTSrH6f
	ZMWZXvdSXjlY7/X+cz2FlXrFsrf2G/uU/i/hkBmw9HcCsnQ9VVPDztlAbuktarDItCvMEfh2o8H
	W/3isARzIsTeLHg1SHQtQwM8cLXeba/KyxDHV3eLZ3CEIOUrgna+RHazjbr+sit1xG4nDUPCUmH
	AuFv1ljLmhohXHL10NVtPVnoGn1MZFlGJ9De3uP0d6ThhUdrCMn7d2Jc0/FzEA2Texa4gIxPrLV
	wRSReM3F2Ux0blet3WgH/7/Q0
X-Google-Smtp-Source: AGHT+IGBBETzxZWMvDcCEcqz2J8GCxkX6hwH+yjvXjOxreqG4J8OkC1oBoHwtqvBKWGvMd20rORHoA==
X-Received: by 2002:a05:6214:21e7:b0:6c3:5dbd:449c with SMTP id 6a1803df08f44-6e8a0c81d59mr76308736d6.1.1741015301052;
        Mon, 03 Mar 2025 07:21:41 -0800 (PST)
Received: from ?IPv6:2600:1002:a012:8f2c:2830:5371:cdd2:ac36? ([2600:1002:a012:8f2c:2830:5371:cdd2:ac36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976ccacdsm54029836d6.87.2025.03.03.07.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:21:40 -0800 (PST)
Message-ID: <c7141c6554b396d3ddaf7e0e540b80e5990b416b.camel@gmail.com>
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
Date: Mon, 03 Mar 2025 10:21:38 -0500
In-Reply-To: <3d729159-4d13-4a61-88c7-3be992b23728@kernel.org>
References: <20250214231759.119481-1-mattwmajewski@gmail.com>
	 <20250214231759.119481-2-mattwmajewski@gmail.com>
	 <20250218-eggplant-skylark-of-swiftness-dcf6ba@krzk-bin>
	 <69cb2e95c291f17cff42b45e7c871f30a85c060d.camel@gmail.com>
	 <3d729159-4d13-4a61-88c7-3be992b23728@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-03-03 at 08:31 +0100, Krzysztof Kozlowski wrote:
> On 26/02/2025 23:41, Matthew Majewski wrote:
> >=20
> > As I wrote, supported devices/hardware is anything that provides a
> > MEM_TO_MEM capable dma-controller with interleaved transfer
> > support. I
> > did not list specific devices because the bindings are supposed to
> > be
> > generic, as they are not describing actual silicon. But if you want
> > me
>=20
> I already told you that no. Bindings are not supposed to be generic.
>=20
> From where did you get such information?

There are generic bindings in the kernel and I based my bindings off of
them. spi-gpio.yaml, i2c-gpio.yaml, video-mux.yaml, etc are all generic
bindings, no?

>=20
> > to list some devices which provide a compatible dma-controller,
> > here
> > are devices I found in the current mainline kernel:
> >=20
> > - TI OMAP Soc Family
> > - TI Davinci Soc Family
> > - TI Keystone Processor Family
> > - IMX27 Processor and variants
> > - Several Microchip Processors (sama5, sam9x7, sam9x60)
>=20
> That's too generic - you just listed SoCs, which consist of dozen or
> hundred of devices. Which hardware piece is here?
>=20
> Maybe this is not for a real device, but then this should be marked
> clearly.
>=20

I listed devices that have a compatible dma-controller, so the list is
a bit big, sorry. I also specifically mentioned the BeagleBone black
board which I have been testing on.=20

"m2m-deinterlace" used to be a part of the mach-imx27_visstrim_m10.c
board file, but was removed with commit 879c0e5e0ac711 (ARM: imx:
Remove i.MX27 board files). So at least the Vistrim M10 device was
explicitly using the m2m-deinterlace device.=C2=A0

When the move away from board files was made towards device-tree, m2m-
deinterlace support was never ported over to device-tree. This is what
I am doing now.=20

And yes, m2m-deinterlace is not a "real device" if by "real device" you
mean an actual piece of silicon on a specific piece of hardware. I
think there is just some semantic confusion here. I will no longer
refer to it as a "device" then, please let me know what the more
appropriate term is and I will modify the description accordingly.

> >=20
> > I think an appropriate analogy for m2m-deinterlace would be spi-
> > gpio.
> > Since spi-gpio leverages gpio for bitbanging the spi protocol, the
> > bindings do not need to describe any clocks, spi-controller
> > registers,
>=20
> Sure, SPI GPIO is Linux driver, not a device and I am asking about it
> all the time.
>=20

My point was that spi-gpio has dt-bindings even though these bindings
do not describe a specific hardware device, hence it is "generic".=20

Best,
Matthew



