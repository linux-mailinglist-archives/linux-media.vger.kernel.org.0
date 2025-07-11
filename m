Return-Path: <linux-media+bounces-37534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DA8B0258B
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 22:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C5345840C9
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 20:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925321EA7FF;
	Fri, 11 Jul 2025 20:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="gPPoXjWd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414A9194C86
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 20:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752264138; cv=none; b=PjGFYSZSfUhwa8/rNjLmnWYwUgW0qC4HV4JmvcPCzubfXodhamlCo+KCjCQ51aZl1AhKmH/7OEcJT3o35f7YsRNCqm3FANWuSKbMidP7NY/x9lhsvDKX5zh+kS54bX203vXAA0ltlScebR2/dFTMsG9eX0LFXiBDAlbxt0Qy8SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752264138; c=relaxed/simple;
	bh=zKywbrbbA5eqISP3tLnGOY+FB7tTc2FyEfuH/fp7gzo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L22RyDLgSrFem/9Ie3w9n4Tv0VNAsdqiMxiCTGKu+jgRDZUrymPBrDqI/9krhzFpRHjHhjoFvngoJYLozFozNLTVkaqY9N3BL/vWZIe6Kxim8UtyXarkvbofIh481L7MQ1jiEk9ctsg0aWZZeFf3FdpKcF1otrCbxrk/uTE0sEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=gPPoXjWd; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a9bff7fc6dso21709621cf.1
        for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 13:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1752264135; x=1752868935; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CnoRRDhtGSOPAPWiKhq8LlJyfNIEUB0lnKlvZ+LO7jU=;
        b=gPPoXjWdsztlmCjAu9eXOioV3u7z1TwU2EJ+pE7y5CRtc9t2gKm+i3QRgjzbRY0UQC
         prm3QGdf1HxjilO7HkrZFvyWoBayDgFJY0kAmN5DJK4BuDQlQSrJwWNeQWp6ix7Dnjqy
         IpHx/O/SuDfx22eoEnfM60PEjsZN+MalWw4DFFvQ589YSVU2c62wrlAVRvdz+Xip9Xr6
         VpcQRwPFcSgdmxGb3wZzBC3B/5wHs1nIQc2OUKm9YbZ8UbC2xPYepe/KFMwvmPbNcG72
         wNbAiy/MDWZ0Ko1atD2OH1qoaXoCmGI+e6NtoiwdndjIHxtgijVsQ6XODvXUwX7sJbxj
         iWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752264135; x=1752868935;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnoRRDhtGSOPAPWiKhq8LlJyfNIEUB0lnKlvZ+LO7jU=;
        b=a0nk5tnhSb7YpMnAE9d9a0d57n7wf+TgPO50UePhPz0b+aoppaa2lfwstxSL7innKK
         lBvkA24V38lVxirqWF/nALs1az3VAxQWOPCucOt3BIb0owo3Ri/ZtoIfAMnMxsyaib5d
         DehfRqLL7RM5WjSRbw8aC30zh2Nv5XSAMlIKs4d9Nt0nyQDhC2mP+Sf6LAKokEF9xGCE
         fPzT0xG3gjZf7nd5J/lzXx+dXQLu1HqFWa/9b+Y+OCLbrdqpby7h3dKEuIpQgkqbuIJu
         fvPwuY2NOr+9AQhj8zMtOTSjbSIsrGJZiL3nwaFhxMxrI1XBk7X8oO/c4fdoiDImKJee
         AYAw==
X-Forwarded-Encrypted: i=1; AJvYcCVskNNyADSnrBMMqaWq9QsMFSRdXIzPknDIv62bzxG3kTE9aJsfWkZ5UXR6b6FFj4/67vZejSrskF+mLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcwpuAXjp1MNp0gdR+RH9UVl8sokePa3KQC2R7KLyCMjR3OKti
	iNgshfd0bUsiaGCl0/aLBMjr30h9Mwd4HUscLrQ6J4gSTk8AwwuTBjDb6pJDf2toFTg=
X-Gm-Gg: ASbGncvEnSWBpolS2SPHjkR1KlghBWysw54fX/UXTQ7S612+rGmHaED/IIuJ1jTT23z
	RqZKzGZbU91hn67M2Y3RSeC7YTkXZo2Db9ls68I4mnzl6NJj0wHllRHH8YhsZFqGBm7WOB9JGEo
	eznU6xn0wR+crJ9vzBLjiylyCw6Y5SK5y6qlSM7u5shq3p4qjgeUa04sCYQ4Xp5zBm4wQ2yqJms
	YnhE17RF4t/kRf3HHgUdwYNQA/82AHvZ5KIAzW/LEIrxyv0fJcxSNu7LTYYOuRlQa8YZxPzKW3E
	BOPmOWV/s2maE+l+HX5B2h9BdMDUXy+q4UCLUjLL82A9d/Q2wO0TXj8gmUDKjBSfYhVGLjXNJfk
	CpSxyFvgTi6p35cEwAODSlywRaXEtsCkmPQz22w==
X-Google-Smtp-Source: AGHT+IEuLOxF/UAqwKLexQXJclEkYrpc7aYrRvWVeUsA+st+Tdi3sBUDzBI9yFbWLfbip40hyoxWTg==
X-Received: by 2002:a05:622a:a38c:b0:4ab:37d7:c3c2 with SMTP id d75a77b69052e-4ab37d7c5b1mr34888811cf.14.1752264135009;
        Fri, 11 Jul 2025 13:02:15 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::5ac? ([2606:6d00:17:b699::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edefb923sm24313601cf.75.2025.07.11.13.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 13:02:13 -0700 (PDT)
Message-ID: <447205bfe4089eb6231fa17a1fff3d58806ec7d3.camel@ndufresne.ca>
Subject: Re: [PATCH 8/8] media: rkvdec: Unstage the driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel	 <sebastian.reichel@collabora.com>, Cristian Ciocaltea	
 <cristian.ciocaltea@collabora.com>, Alexey Charkov <alchark@gmail.com>, 
 Dragan Simic <dsimic@manjaro.org>, Jianfeng Liu
 <liujianfeng1994@gmail.com>, Nicolas Frattaroli	
 <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>,
  Andy Yan <andy.yan@rock-chips.com>, Frank Wang
 <frank.wang@rock-chips.com>, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-rockchip@lists.infradead.org,
 Ezequiel Garcia	 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda
 <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>,  Yunke Cao
 <yunkec@google.com>, linux-media@vger.kernel.org, kernel@collabora.com
Date: Fri, 11 Jul 2025 16:02:11 -0400
In-Reply-To: <20250623160722.55938-9-detlev.casanova@collabora.com>
References: <20250623160722.55938-1-detlev.casanova@collabora.com>
	 <20250623160722.55938-9-detlev.casanova@collabora.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0MU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT6ImQQTFg
 oAQQIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBO8NUoEVxMPCGgRvEtlBlFEpYHL0BQJ
 oLLLGBQkJZfd1AAoJENlBlFEpYHL0BEkA/3qkWYt99myYFSmTJUF8UB/7OroEm3vr1HRqXeQe9Qp2
 AP0bsoAe6KjEPa/pJfuJ2khrOPPHxvyt/PBNbI5BYcIABLQnTmljb2xhcyBEdWZyZXNuZSA8bmljb
 2xhc0BuZHVmcmVzbmUuY2E+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyy+AUJCWX3dQAKCRDZQZRRKWBy9FJ5AQCNy8SX8DpHbLa
 cy58vgDwyIpB89mok9eWGGejY9mqpRwEAhHzs+/n5xlVlM3bqy1yHnAzJqVwqBE1D0jG0a9V6VQI=
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-TRLqz3hiMlUTgCc1wc3h"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-TRLqz3hiMlUTgCc1wc3h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 23 juin 2025 =C3=A0 12:07 -0400, Detlev Casanova a =C3=A9crit=C2=
=A0:
> The TODO list for unstaging being empty, the driver can now be moved to t=
he
> main media folder.
>=20
> Also add myself as maintainer.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
8 ++++++++
> =C2=A0drivers/media/platform/rockchip/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 1 +
> =C2=A0drivers/media/platform/rockchip/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 1 +
> =C2=A0.../media =3D> media/platform/rockchip}/rkvdec/Kconfig=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 0
> =C2=A0.../media =3D> media/platform/rockchip}/rkvdec/Makefile=C2=A0=C2=A0=
=C2=A0=C2=A0 | 0
> =C2=A0.../platform/rockchip}/rkvdec/rkvdec-h264.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
> =C2=A0.../platform/rockchip}/rkvdec/rkvdec-regs.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
> =C2=A0.../media =3D> media/platform/rockchip}/rkvdec/rkvdec-vp9.c | 0
> =C2=A0.../media =3D> media/platform/rockchip}/rkvdec/rkvdec.c=C2=A0=C2=A0=
=C2=A0=C2=A0 | 0
> =C2=A0.../media =3D> media/platform/rockchip}/rkvdec/rkvdec.h=C2=A0=C2=A0=
=C2=A0=C2=A0 | 0
> =C2=A0drivers/staging/media/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 --
> =C2=A0drivers/staging/media/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
> =C2=A012 files changed, 10 insertions(+), 3 deletions(-)
> =C2=A0rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/=
Kconfig
> (100%)
> =C2=A0rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/=
Makefile
> (100%)
> =C2=A0rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/=
rkvdec-
> h264.c (100%)
> =C2=A0rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/=
rkvdec-
> regs.h (100%)
> =C2=A0rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/=
rkvdec-vp9.c
> (100%)
> =C2=A0rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/=
rkvdec.c
> (100%)
> =C2=A0rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/=
rkvdec.h
> (100%)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c3f7fbd0d67af..d05a153c21526 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21466,6 +21466,14 @@ S:	Maintained
> =C2=A0F:	Documentation/devicetree/bindings/media/rockchip-rga.yaml
> =C2=A0F:	drivers/media/platform/rockchip/rga/
> =C2=A0
> +ROCKCHIP RKVDEC VIDEO DECODER DRIVER
> +M:	Detlev Casanova <detlev.casanova@collabora.com>
> +L:	linux-media@vger.kernel.org
> +L:	linux-rockchip@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +F:	drivers/media/platform/rockchip/rkvdec/
> +
> =C2=A0ROCKCHIP RK3308 INTERNAL AUDIO CODEC
> =C2=A0M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
> =C2=A0S:	Maintained
> diff --git a/drivers/media/platform/rockchip/Kconfig
> b/drivers/media/platform/rockchip/Kconfig
> index b41d3960c1b41..9bbeec4996aa2 100644
> --- a/drivers/media/platform/rockchip/Kconfig
> +++ b/drivers/media/platform/rockchip/Kconfig
> @@ -4,3 +4,4 @@ comment "Rockchip media platform drivers"
> =C2=A0
> =C2=A0source "drivers/media/platform/rockchip/rga/Kconfig"
> =C2=A0source "drivers/media/platform/rockchip/rkisp1/Kconfig"
> +source "drivers/media/platform/rockchip/rkvdec/Kconfig"
> diff --git a/drivers/media/platform/rockchip/Makefile
> b/drivers/media/platform/rockchip/Makefile
> index 4f782b876ac9b..286dc5c53f7e1 100644
> --- a/drivers/media/platform/rockchip/Makefile
> +++ b/drivers/media/platform/rockchip/Makefile
> @@ -1,3 +1,4 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> =C2=A0obj-y +=3D rga/
> =C2=A0obj-y +=3D rkisp1/
> +obj-y +=3D rkvdec/
> diff --git a/drivers/staging/media/rkvdec/Kconfig
> b/drivers/media/platform/rockchip/rkvdec/Kconfig
> similarity index 100%
> rename from drivers/staging/media/rkvdec/Kconfig
> rename to drivers/media/platform/rockchip/rkvdec/Kconfig
> diff --git a/drivers/staging/media/rkvdec/Makefile
> b/drivers/media/platform/rockchip/rkvdec/Makefile
> similarity index 100%
> rename from drivers/staging/media/rkvdec/Makefile
> rename to drivers/media/platform/rockchip/rkvdec/Makefile
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
> similarity index 100%
> rename from drivers/staging/media/rkvdec/rkvdec-h264.c
> rename to drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
> diff --git a/drivers/staging/media/rkvdec/rkvdec-regs.h
> b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
> similarity index 100%
> rename from drivers/staging/media/rkvdec/rkvdec-regs.h
> rename to drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
> diff --git a/drivers/staging/media/rkvdec/rkvdec-vp9.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> similarity index 100%
> rename from drivers/staging/media/rkvdec/rkvdec-vp9.c
> rename to drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> similarity index 100%
> rename from drivers/staging/media/rkvdec/rkvdec.c
> rename to drivers/media/platform/rockchip/rkvdec/rkvdec.c
> diff --git a/drivers/staging/media/rkvdec/rkvdec.h
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> similarity index 100%
> rename from drivers/staging/media/rkvdec/rkvdec.h
> rename to drivers/media/platform/rockchip/rkvdec/rkvdec.h
> diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfi=
g
> index b442148543995..b9d52a51841b5 100644
> --- a/drivers/staging/media/Kconfig
> +++ b/drivers/staging/media/Kconfig
> @@ -32,8 +32,6 @@ source "drivers/staging/media/max96712/Kconfig"
> =C2=A0
> =C2=A0source "drivers/staging/media/meson/vdec/Kconfig"
> =C2=A0
> -source "drivers/staging/media/rkvdec/Kconfig"
> -
> =C2=A0source "drivers/staging/media/starfive/Kconfig"
> =C2=A0
> =C2=A0source "drivers/staging/media/sunxi/Kconfig"
> diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makef=
ile
> index ad4e9619a9e07..102ca632ddf5c 100644
> --- a/drivers/staging/media/Makefile
> +++ b/drivers/staging/media/Makefile
> @@ -4,7 +4,6 @@ obj-$(CONFIG_INTEL_ATOMISP)=C2=A0=C2=A0=C2=A0=C2=A0 +=3D =
atomisp/
> =C2=A0obj-$(CONFIG_VIDEO_IMX_MEDIA)	+=3D imx/
> =C2=A0obj-$(CONFIG_VIDEO_MAX96712)	+=3D max96712/
> =C2=A0obj-$(CONFIG_VIDEO_MESON_VDEC)	+=3D meson/vdec/
> -obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC)	+=3D rkvdec/
> =C2=A0obj-$(CONFIG_VIDEO_STARFIVE_CAMSS)	+=3D starfive/
> =C2=A0obj-$(CONFIG_VIDEO_SUNXI)	+=3D sunxi/
> =C2=A0obj-$(CONFIG_VIDEO_TEGRA)	+=3D tegra-video/

--=-TRLqz3hiMlUTgCc1wc3h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaHFtwwAKCRDZQZRRKWBy
9D0OAQDCzPQPG7xg4OYY8o6mQuA7YYMPvLnXfsqOsELbI81nggEAn4NKzS6Zv5SL
gInU8ELc0LBcICoE9Vc3ZGnrhMUvzQo=
=TPsc
-----END PGP SIGNATURE-----

--=-TRLqz3hiMlUTgCc1wc3h--

