Return-Path: <linux-media+bounces-45778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 13486C13E9F
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 10:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 760DB4FD9CB
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 09:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31992D7392;
	Tue, 28 Oct 2025 09:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="SxpPySr/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF367405A
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761644858; cv=none; b=dIkMKdtZ8b8D4npeN68KEq74oMWkVnP7CBqLMw4sYjlNPGt2OQgPMFXnZDmKdnC7XYr6xxguRJXBU9Fe1+LLeyjqO+gvS8JJ+rKIPeTzPEQKbN86P9Xdfp+a1Yq5lLBDU2ebj9NzvLgxQLltqEqyl1XSU/484NMZovE/AcewamE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761644858; c=relaxed/simple;
	bh=fGcN/mnc+npBuOP7cFZCpYdNMDGQEaN2qai4gWsr0CI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fkLYgclDLr/UM9+XCMa9xmRm4CBYfI8GMzfOCq/ty6GED6o+g8dU7zXmkXq3DwkR/P9GAPR78pmlxdEx3tIB+1Gdqe2qoLbHstWks3UGUDy2ozCa5gxj4O7UGYtx9qQwj1cGsauS39yjY6h5LI1B+vtp1ox1MD1k2wGN4xn9V0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=SxpPySr/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-474975af41dso39137565e9.2
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 02:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1761644855; x=1762249655; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=768yZp3cA3mcqTuMW9me8j/QG9lDuH2jp1SmYQqm0eQ=;
        b=SxpPySr/zFrB7ady2cnI+rHVCk019fL+7VzAKVAzRl56oHRKQXfWns0+hgu+ZxMfZE
         FWkpsHReI5nZv354E54WkgtM3xahm7gOFHzSoHbrCzz5uQpCIGIqvsIn6OP+HQc4+bKF
         Daf6KG6uP/ENTmUqij9kUDJQZj5AAxrBwuU0DO39GzM3aE8XC7+96B5mtvugzO8eeBIP
         6OLdco3wb9WCrcXyJiGrSRzA3bYeeiLrImCVcZhFabJq3y0tQl9RHf5W+7aIl38TpnBR
         YRdS+SJePdkQ3sZ8LhBqfsM4mX3IXTYFG70YHJsQ130w8JItiSK9UQ4qXubhTYNGM31a
         xSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761644855; x=1762249655;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=768yZp3cA3mcqTuMW9me8j/QG9lDuH2jp1SmYQqm0eQ=;
        b=NiNPBvwWNrsDAh9BixRkLBuJDOwjQ+AYvFqa9yfHvpmhewuO4rAeKpIsBOC2nqfUmy
         ocDBZL0TOosHQUeVnEQDYcYjDM3MY2raa5x7ixOP5wnmgn54dB7QffRnQbNqRupWFs/g
         RGQPPDWX3IQHZAIzQQP3NhVJRBufSwqOOMEWEYeF41x7Q71tfgHm6AgYRaiRlXwY54ST
         j7Q2Hq35NdJjmMgn7DGSS/7hoWdxMuc2V/W8seYYedUAxPFacjKfZ4iTQKYX7Eqx99th
         g+7gELuGO67S0EqUVipjJUlbPxxYf5RECnwG2r0K8zXreP0vKZ0e7hN5ktRDfiifeDnF
         p3bA==
X-Gm-Message-State: AOJu0Yw+mRc+x08bYEP9ycclO0NCjyKWaOai1sSWDcqk334XjtxByxeB
	4nyjdC1xt6/oZD343S5P41YVDkGWttUvctbrypL/W3SQFY9h4rkHbXGZBt/yn5jWlh8=
X-Gm-Gg: ASbGncsyDJtLTs3b+ccZ6dyokbD3mNA4g+KRJ7+afUixDeeSayXrPQXo3B17KhXa4bZ
	K/HMD8GN6rLRohHaaAwxYZ2suYc1OlM2MjBANsGlu/nzaXej+2n86wgWHy+DDpNv0UsZX5EkzvW
	oci59jfsiJegEci80NQ18yPYfsFvOLR6W+MsbizDw59BFeyu6zRG3a6/BPaqqa9eOyUK0jCBIYd
	XfzY1TGu940mj2Lx2P+tbV19OfK3Yb2cXyO+01Tlm+GzXhAvxKNZxPru03jmv4gcgEvkKqT8UbA
	LAQEiJMNoxAyI+76TV4NCNSZ9uBe9ZyZmOkj67tpcRtKhgSk2m6nFj9a1p5KhSRfuVnIVDvfQYm
	Y0r3t5KqwAHOL0puc6HESbzjNT7C8Z0WDxb4Gn/+FUFnUFPtfhLF4rw+gWhhAzpTapxCU2NZuiR
	P9YfT+
X-Google-Smtp-Source: AGHT+IFWHLGEgecjsi14d17d8QJAN0DfHwsjIZ3qxpUH1YdvcBO32/JOe3vpDKUGwmEPQRfYE+sNaw==
X-Received: by 2002:a05:600c:6290:b0:46e:3d41:6001 with SMTP id 5b1f17b1804b1-47717e6d477mr28815885e9.34.1761644854176;
        Tue, 28 Oct 2025 02:47:34 -0700 (PDT)
Received: from [192.168.4.57] ([79.79.193.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd477c92sm184692565e9.2.2025.10.28.02.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 02:47:33 -0700 (PDT)
Message-ID: <3a603410869cf876e7693880e0f6ca8ced27be7b.camel@ndufresne.ca>
Subject: Re: [PATCH] media: v4l2-ctrls: set AV1 sequence flags for testing
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Pavan Bobba <opensource206@gmail.com>, mchehab@kernel.org, 
	hverkuil@kernel.org, ribalda@chromium.org,
 laurent.pinchart@ideasonboard.com, 	hansg@kernel.org, yunkec@google.com,
 sakari.ailus@linux.intel.com, 	james.cowgill@blaize.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 28 Oct 2025 09:47:32 +0000
In-Reply-To: <20251028062623.12700-1-opensource206@gmail.com>
References: <20251028062623.12700-1-opensource206@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-kxVl3pXhlxWcSMfpspLf"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-kxVl3pXhlxWcSMfpspLf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 28 octobre 2025 =C3=A0 11:56 +0530, Pavan Bobba a =C3=A9crit=C2=A0=
:
> Initialize additional AV1 sequence parameters in std_init_compound()
> to make the default AV1 sequence control compatible with compliance
> and userspace testing tools.
>=20
> Specifically, set:
> =C2=A0- enable both SUBSAMPLING_X and SUBSAMPLING_Y flags
>=20
> These defaults help ensure that V4L2_CID_AV1_SEQUENCE behaves
> consistently during validation and v4l2-compliance tests.
>=20
> Signed-off-by: Pavan Bobba <opensource206@gmail.com>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-core.c | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index fa03341588e4..8809912797d2 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -160,7 +160,13 @@ static void std_init_compound(const struct v4l2_ctrl=
 *ctrl, u32 idx,
> =C2=A0		break;
> =C2=A0	case V4L2_CTRL_TYPE_AV1_SEQUENCE:
> =C2=A0		p_av1_sequence =3D p;
> +		/*
> +		 *setting below parameters to make AV1 sequence compatible
> +		 *for the testing
> +		 */
> =C2=A0		p_av1_sequence->bit_depth =3D 8;
> +		p_av1_sequence->flags |=3D V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_X |
> +			V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_Y;

There is a bit of a lack of clarity upon why we do this. I would comment on
that.

/**
 * The initial profile is 0 which only allows YUV 420 subsampled data. Set =
the =C2=A0
 * subsampling flags accordingly.
 */

With the correction:
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

cheers,
Nicolas

> =C2=A0		break;
> =C2=A0	case V4L2_CTRL_TYPE_FWHT_PARAMS:
> =C2=A0		p_fwht_params =3D p;

--=-kxVl3pXhlxWcSMfpspLf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQCRNAAKCRDZQZRRKWBy
9AlJAQD/1RfF7gfX/ljsf3B9plPP0YJ2UE8a+X8pA4lJofOB9AEA7h73+bcEcBvf
1DaAHAJAnIPGp6p8vGgGrEp6sZffvwc=
=zBmI
-----END PGP SIGNATURE-----

--=-kxVl3pXhlxWcSMfpspLf--

