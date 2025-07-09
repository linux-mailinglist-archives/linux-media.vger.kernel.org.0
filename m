Return-Path: <linux-media+bounces-37218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 702ADAFF140
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 20:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA881567F92
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 18:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3E723D28D;
	Wed,  9 Jul 2025 18:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="YKTpj/Jj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E18123B63D
	for <linux-media@vger.kernel.org>; Wed,  9 Jul 2025 18:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752087570; cv=none; b=TgfEh5jWqmKbe3F/zy2CTciPnxCdyqXAoiuBHQuCZb6xAR+OhD9Hh4awslgrDmNdGC1972U18a4wH77Si1D1QnO5hxYegnujGsupEUjzaHdcnKDV1YdpVP17CNXVlNCYL63CJCk8SS660gpJ/eq9qlt52eIMHZ8sluUglLliIZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752087570; c=relaxed/simple;
	bh=XGAkAjqXaeQxQyulCGR3tIaiucKhABUC5GXTck/wb3k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QcpKYfD/B9WGOUamf+hM2uTVJU7S4B6IB2weUgdP814wHhbeewl1cr3uxebblMytpXcyXlMwRX/1bGEdVMGFqLjo7dyZACII3uzfZC2LcOI2mO1fNfVgtalwkYh372sGhQsJm3VgypOrjFgvHsLG1k/bJedE0dN0Fy5OvAS5sUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=YKTpj/Jj; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-70478ba562aso15165196d6.1
        for <linux-media@vger.kernel.org>; Wed, 09 Jul 2025 11:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1752087566; x=1752692366; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hah8xMwtrntwfJmxq5xanQiqWRLwCEWuJJkLlImKYlo=;
        b=YKTpj/JjN7fgTbN08ADDsNCATVFlC0Txf1VmkVXSod9Dpc9Y0PSDpRF4qwVqEWPD6D
         q2MEkWe9PAUcFCSZoUZjJ+//5BX2cjyy0Ff3mvD1ypj3Q9fKFLkoLfQagbgvnSRmCmjo
         Dpn9Nsh8vDFP+y2Ojs30L1I486Qw3SsPsTGoVOcn86SFsoSvT+lY3OPtGBWoR/I4daMW
         byrcU3lzjPOLUMbGXkzl9judU5VLEy3YvhjhHLNgZ7Q5QTTZIb7BvTvwPN4CFx6yY7Mu
         g3c0G7e1cPVsAqZS8gz1vQKsYhbkId4+7CxuOVidRngHhvnfuTBKdNc/uSmOpGg+M2gI
         nRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752087566; x=1752692366;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hah8xMwtrntwfJmxq5xanQiqWRLwCEWuJJkLlImKYlo=;
        b=UyNgHlg+5K9inBmbmliFZ4CMwyRQslg3Guex9itl7LxG0my/3C0nWsJ9dFd/LyX2qB
         5OHWkTg+F+hN//rAGTdGFPFpn+RaohQdJpHf6n8khNi+TQ9/Lu/CpGLRP4/a6B28FacS
         7x+jBefN1qPGsrFbztbrxfxfQ4Krbiad2H+qoJNxqoJYlnAifzC7626EvMw2fgmZAm0+
         E3e0R10lKUCzQ7iV/011tdK3DY/gGASdplXZCcdDmG8Gel9krCFgLqyCzr0EH4qHdmkf
         WLDRVy0XdrRRKt/oJpaJ/CP+WHiWpEyYvxAwLGFnJ4R/Z58QPaxfccYcoYOZeCXm5JKX
         7B/g==
X-Forwarded-Encrypted: i=1; AJvYcCWxRTV5BLKfuUic1KLecOV/0Yzh3o9g1y80bIi734fWMGd7HtL0bB3lkcMEddk4Xc8jhIg2svKI/KhzKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxskGJoLaGhZ4lDWfWtj25eodI1QKWEPHcMdpeM29Yo4WP/9P1/
	NGKVq2egiQlZgAo9wCIhixsWTqjCsSW5NP2FRqXLbWLyKptYqdSQOp5jwl/41pynUk4=
X-Gm-Gg: ASbGncsWnI8LqwcRUmi+gQF3K8CbRGMzYYC6bb982/JzACYEv5UrgI/bBzzr2HIgC8u
	JXCZyC2/lrjz0/ikUWXO590D11w5V28FkKuGYmbpyLV/IGp/j0M2aF59yRUCGqLictE7snyzqF+
	wcbLlwc1W/Qn85ePvt91WIZlqsJTZPEHpvMe92Q76Lrqn6dySw0GnLUpOH58isFsPxogIlaVi18
	4pO2tS4ckWE4ljTusbcZ1jZs8kFroPJpKBHtRKoxfVj5NdirugxtPhUTQC3R6G1hniPgRY7zKVR
	Z94RMuwA00KWNARB9NQHkDfuKKRnmfBFqAsCGyRTp678zo3I6iNJujUMQlhZ6ohkRUOi9uCTzJI
	4rA==
X-Google-Smtp-Source: AGHT+IEsmXyVdEbnWdXGnl0jejitKG8pR37Z+42TY6cq1R1SWQIVZRAxicjh2OAHwFA4l3xkXwgkCA==
X-Received: by 2002:a05:6214:5f82:b0:704:886b:72dc with SMTP id 6a1803df08f44-704959cbf6emr8146366d6.2.1752087566238;
        Wed, 09 Jul 2025 11:59:26 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::5ac? ([2606:6d00:17:b699::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4cc7407sm96838676d6.8.2025.07.09.11.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 11:59:25 -0700 (PDT)
Message-ID: <b45e0cabadac5d2d9dbdc467b1c29f8eaae72c9c.camel@ndufresne.ca>
Subject: Re: [PATCH 1/8] media: uapi: Introduce V4L2 extensible params
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Dafna Hirschfeld	
 <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner	 <heiko@sntech.de>, Dan Scally
 <dan.scally@ideasonboard.com>, Sakari Ailus	 <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 09 Jul 2025 14:59:23 -0400
In-Reply-To: <20250708-extensible-parameters-validation-v1-1-9fc27c9c728c@ideasonboard.com>
References: 
	<20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
	 <20250708-extensible-parameters-validation-v1-1-9fc27c9c728c@ideasonboard.com>
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
	protocol="application/pgp-signature"; boundary="=-qC+6NnOKYiwDd0VA7yXp"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-qC+6NnOKYiwDd0VA7yXp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 08 juillet 2025 =C3=A0 12:40 +0200, Jacopo Mondi a =C3=A9crit=C2=
=A0:
> Introduce v4l2-extensible-params.h in the Linux kernel uAPI.
>=20
> The header defines two types that all drivers that use the extensible
> parameters format for ISP configuration shall use to build their own
> parameters format.
>=20
> The newly introduce type v4l2_params_block represent the
> header to be prepend to each ISP configuration block and the
> v4l2_params_buffer type represent the base type for the configuration
> parameters buffer.
>=20
> The newly introduced header is not meant to be used directly by
> applications which should instead use the platform-specific ones.
>=20
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 ++
> =C2=A0include/uapi/linux/media/v4l2-extensible-params.h | 106 +++++++++++=
+++++++++++
> =C2=A02 files changed, 112 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 658543062bba3b7e600699d7271ffc89250ba7e5..49a9329e5fe8874bdbaca1394=
6ea28bd80134cb3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25968,6 +25968,12 @@ F:	drivers/media/i2c/vd55g1.c
> =C2=A0F:	drivers/media/i2c/vd56g3.c
> =C2=A0F:	drivers/media/i2c/vgxy61.c
> =C2=A0
> +V4L2 EXTENSIBLE PARAMETERS FORMAT
> +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	include/uapi/linux/media/v4l2-extensible-params.h
> +
> =C2=A0VF610 NAND DRIVER
> =C2=A0M:	Stefan Agner <stefan@agner.ch>
> =C2=A0L:	linux-mtd@lists.infradead.org
> diff --git a/include/uapi/linux/media/v4l2-extensible-params.h b/include/=
uapi/linux/media/v4l2-extensible-params.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..ed37da433c6b1a34523b6a9be=
fde5c0dee601cfb
> --- /dev/null
> +++ b/include/uapi/linux/media/v4l2-extensible-params.h
> @@ -0,0 +1,106 @@
> +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR MIT) =
*/
> +/*
> + * Video4Linux2 extensible configuration parameters base types
> + *
> + * Copyright (C) 2025 Ideas On Board Oy
> + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> + */
> +
> +#ifndef _UAPI_V4L2_PARAMS_H_
> +#define _UAPI_V4L2_PARAMS_H_
> +
> +#ifndef _UAPI_V4L2_EXTENSIBLE_PARAMS_GUARD_
> +/*
> + * Note: each ISP driver exposes a different uAPI, where the types layou=
t
> + * match (more or less strictly) the hardware registers layout.
> + *
> + * This file defines the base types on which each ISP driver can impleme=
nt its
> + * own types that define its uAPI.
> + *
> + * This file is not meant to be included directly by applications which =
shall
> + * instead only include the ISP-specific implementation.
> + */
> +#error "This file should not be included directly by applications"
> +#endif
> +
> +#include <linux/types.h>
> +
> +/**
> + * struct v4l2_params_block - V4L2 extensible parameters block header
> + *
> + * This structure represents the common part of all the ISP configuratio=
n
> + * blocks. Each parameters block shall embed an instance of this structu=
re type
> + * as its first member, followed by the block-specific configuration dat=
a. The
> + * driver inspects this common header to discern the block type and its =
size and
> + * properly handle the block content by casting it to the correct block-=
specific
> + * type.
> + *
> + * The @type field is one of the values enumerated by each platform-spec=
ific ISP
> + * block types which specifies how the data should be interpreted by the=
 driver.
> + * The @size field specifies the size of the parameters block and is use=
d by the
> + * driver for validation purposes.
> + *
> + * The @flags field is a bitmask of platform-specific control flags.
> + *
> + * Userspace shall never use this type directly but use the platform spe=
cific
> + * one with the associated data types.
> + *
> + * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_block_type`
> + * - Amlogic C3: :c:type:`c3_isp_params_block_type`
> + *
> + * @type: The parameters block type (platform-specific)
> + * @flags: A bitmask of block flags (platform-specific)
> + * @size: Size (in bytes) of the parameters block, including this header
> + */
> +struct v4l2_params_block {
> +	__u16 type;
> +	__u16 flags;
> +	__u32 size;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct v4l2_params_buffer - V4L2 extensible parameters configuration
> + *
> + * This struct contains the configuration parameters of the ISP algorith=
ms,
> + * serialized by userspace into a data buffer. Each configuration parame=
ter
> + * block is represented by a block-specific structure which contains a
> + * :c:type:`v4l2_params_block` entry as first member. Userspace populate=
s
> + * the @data buffer with configuration parameters for the blocks that it=
 intends
> + * to configure. As a consequence, the data buffer effective size change=
s
> + * according to the number of ISP blocks that userspace intends to confi=
gure and
> + * is set by userspace in the @data_size field.
> + *
> + * The parameters buffer is versioned by the @version field to allow mod=
ifying
> + * and extending its definition. Userspace shall populate the @version f=
ield to
> + * inform the driver about the version it intends to use. The driver wil=
l parse
> + * and handle the @data buffer according to the data layout specific to =
the
> + * indicated version and return an error if the desired version is not
> + * supported.
> + *
> + * For each ISP block that userspace wants to configure, a block-specifi=
c
> + * structure is appended to the @data buffer, one after the other withou=
t gaps
> + * in between nor overlaps. Userspace shall populate the @data_size fiel=
d with
> + * the effective size, in bytes, of the @data buffer.
> + *
> + * Each ISP driver using the extensible parameters format shall define a
> + * type which is type-convertible to this one, with the difference that =
the
> + * @data member shall actually a memory buffer of platform-specific size=
 and

There is some word(s) missing here, "shall actually <> a memory buffer".

Nicolas

>=20
> + * not a pointer.
> + *
> + * Userspace shall never use this type directly but use the platform spe=
cific
> + * one with the associated data types.
> + *
> + * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_cfg`
> + * - Amlogic C3: :c:type:`c3_isp_params_cfg`
> + *
> + * @version: The parameters buffer version (platform-specific)
> + * @data_size: The configuration data effective size, excluding this hea=
der
> + * @data: The configuration data
> + */
> +struct v4l2_params_buffer {
> +	__u32 version;
> +	__u32 data_size;
> +	__u8 data[];
> +};
> +
> +#endif /* _UAPI_V4L2_PARAMS_H_ */

--=-qC+6NnOKYiwDd0VA7yXp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaG68DAAKCRDZQZRRKWBy
9N4QAQDuYZURTpzmoJglyeKORvbV7cP8/jDhLqozIEG7DMDUPAD9GBadfAg5f3J/
wIhi7od+eQPA7nxYjDzWzOxYbIsriAE=
=qXwV
-----END PGP SIGNATURE-----

--=-qC+6NnOKYiwDd0VA7yXp--

