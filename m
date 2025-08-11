Return-Path: <linux-media+bounces-39430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F55B20AA8
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 15:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B533C18C07C8
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 13:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D091A5B8F;
	Mon, 11 Aug 2025 13:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="KxR+jFMl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B083192D8A
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 13:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920135; cv=none; b=jJAAXVtXUqMGxbv+6tyPvYutKdYjI60hxzfJgNFNCNVf/YDLGCucflKGBujFJT6YNbzQN7Q5d1hxrbOhHaBacGWEaLxPpwnG8C3xmQ1ljyyTTQ6HgHHL0eWgFk+ZCaUxPFZco0j+yMLuvSEhykI0kpTaOsFmawj8BpG/z73iTFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920135; c=relaxed/simple;
	bh=UKSmwahiogqW1pXeYgXf8Eygszt2u88JnqRx0xZfhNE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ItHxu/PjnSyeOKidE21OfOJjxN1ZMz+VAo1X0SO5w1VKoWb5jxseIQE0HTdRcdYQA3w0VGMQt6Hvaa33wWAdVwfulKG6LtkhoGoyXv23m2g6QdIUOze95UHSk8hxdjCeeMiblR3OfDRhc+mM821Re9VowidTkUkubgAKC6e5oGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=KxR+jFMl; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-7074bad055eso26646206d6.3
        for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 06:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1754920133; x=1755524933; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VWV2hjLplr0Slgw9ppK6HuD7SF+ufb5rfXPdExiThcw=;
        b=KxR+jFMl7g9MOP7OQkT8K39aZxS38oEgAzwBVrLJNvPwl5RvbiOGs3D2XdlcsNyrvo
         Sa8g5Xo5r3TTYHbzAXqHhb/Pqtb97nTgnS+c4LGQYvg3yf0r88cmVIwDswJhHIviesyo
         7TGALZ3txQEhwxQbMDwirB3hN9cq0599NfVQ+8oNTWMIjgux+r+2qBOsAphNxZJULfyc
         yQonSR2JKLgn6OCsznmzfi6QnctjKhjyAfvpXM0Qw+rB5ix+xpHrjO7b5fBvbN46Nwc2
         ZatVxIap0aatIEmpcrEpRTWmGYZfMls+4mE5otYq6FYzWGbqRFOracjGD9mulyWH0vGs
         g6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920133; x=1755524933;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWV2hjLplr0Slgw9ppK6HuD7SF+ufb5rfXPdExiThcw=;
        b=YcOgz5mYkdf2RkKPcmWV2oIs/pERUmGDd6himxv+xR6WGeBKWy9dqpXLDvzrz2G7Vk
         6xlM2rpRGlBmFAeX3UCwtoJn60Dw/CU6TBIh1J2bithHV1esXNdw3wiimoYPWY0vBrwI
         FcwtykP0vBIOwHHmkSDr81pjhSOOovVy8kPuxteq/BvXBeQVZTSYsPfceTEwxlJLrQO8
         WyrA/3BPqm9A94RZVINfuhBcYGnLRiNHXjjdR+bK0Dz5GlZkofriTbNpcyJAUOLozPUn
         8Y0o9jgeO3c0mdcg8xb2f9U29eQvftcN3nd8FxEzF5o9oKSeYUjc/tOD9CGDPfeQYYtR
         ndmQ==
X-Gm-Message-State: AOJu0YzZLPO+1hcjykPj2xgmG72VsxwaACqax6RGaWiOyH3N23uqtJSV
	Hn6/F2josofBkQyk+PfhRDRLrQVxm/59cWUk/59oe3+Lbzt9wA0OYRZMy8r/2Lr6J6k=
X-Gm-Gg: ASbGnctv3WkUP+/fSl6K3zzMzwlWmx4BSJq1QRGPSJkM65xspuzLVntbrhi0dXwZq/V
	sQJd8rW3s5dMQqsqVg8n6l7/+PHkqVn9lwEGM8jpmmB1BMsk2nKVsqlyHdc0yTWVf0jk17VpVDp
	Xdo78wcodB5sf7v8NWoK1afTyOqLC7S+qFkjcHYZJxb1VaZxQ0UsSnqoGgHz/w4jbkVZi3v5v3g
	oRHJ7sfyLLYTzr2c5mvJ0hl1lCAU/38cb+fvJUUuCEQIueTqWQZm4rwYw2KlzZMeORVLnJKuOH7
	ojAtpJqJBCZwLwrJ2a0PLtjjp1SAsIOFjUrqEb8Yl3g2Fay4S+y6XadWUV5lCQ3qOGv10qAZ9v6
	NISIVlCNLU7Jbap7WkJpVs20lZp4=
X-Google-Smtp-Source: AGHT+IGWo1UxGtBJWVYSzxpvE5ZF5/dBz2Is5MsjfG1C/pxYl+/rzztidkfAyi1zkWZdsKT8xJCVpw==
X-Received: by 2002:a05:6214:2466:b0:6fb:1c3:f527 with SMTP id 6a1803df08f44-7099a4833a2mr205043136d6.39.1754920132919;
        Mon, 11 Aug 2025 06:48:52 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::c41? ([2606:6d00:11:5a76::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cd89d8dsm156083316d6.53.2025.08.11.06.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:48:51 -0700 (PDT)
Message-ID: <9b86fb9ac5b9cfdb773fef2db33fc13d011f53f4.camel@ndufresne.ca>
Subject: Re: [PATCH 64/80] media: rkvdec: Remove redundant
 pm_runtime_mark_last_busy() calls
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Mon, 11 Aug 2025 09:48:50 -0400
In-Reply-To: <20250704075450.3221972-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
	 <20250704075450.3221972-1-sakari.ailus@linux.intel.com>
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
	protocol="application/pgp-signature"; boundary="=-mWE7/NTeJOJLJAFXEhhw"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-mWE7/NTeJOJLJAFXEhhw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

Le vendredi 04 juillet 2025 =C3=A0 10:54 +0300, Sakari Ailus a =C3=A9crit=
=C2=A0:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:
> https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@li=
nux.i
> ntel.com>.
>=20
> In brief, this patch depends on PM runtime patches adding marking the las=
t
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git://git.kernel.org/pub/scm/l=
inux/kernel/git/rafael/linux-pm.git \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 pm-runtime-6.17-rc1
>=20
> =C2=A0drivers/staging/media/rkvdec/rkvdec.c | 1 -

This driver was de-stage during 6.17, I will port it, no action required.

Nicolas

> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c
> b/drivers/staging/media/rkvdec/rkvdec.c
> index d707088ec0dc..445f7c92eee3 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -765,7 +765,6 @@ static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
> =C2=A0{
> =C2=A0	struct rkvdec_dev *rkvdec =3D ctx->dev;
> =C2=A0
> -	pm_runtime_mark_last_busy(rkvdec->dev);
> =C2=A0	pm_runtime_put_autosuspend(rkvdec->dev);
> =C2=A0	rkvdec_job_finish_no_pm(ctx, result);
> =C2=A0}

--=-mWE7/NTeJOJLJAFXEhhw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaJn0wgAKCRDZQZRRKWBy
9DLPAQCqPt0lXZfnbdVvPntu1sqxcp/kkdwbjcqoHkgLxA145AD+NS/iRHqsrNt9
OFMoxaM4XZImGCGuuAnhiF3H/IWu/AM=
=SIv5
-----END PGP SIGNATURE-----

--=-mWE7/NTeJOJLJAFXEhhw--

