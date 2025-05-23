Return-Path: <linux-media+bounces-33225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D977CAC1CB4
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 07:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D27A21BC4EF8
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 05:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A02C225A32;
	Fri, 23 May 2025 05:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L09WXxAe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8F6204C0F;
	Fri, 23 May 2025 05:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747979916; cv=none; b=hFOFwvI0+7dAqGeOtxCq49+38lbKpCEFqVlwYoOgAVsgT6sh+2ucupfKsUqvFJRdVrUmo6YJt2Oj2jURrhYoMkofv75zgzA97qdZEPNPeJkLZscYpDg/OD+J51ttgmll7NpYqa88DtZeil/phiIS/ddcoF618gex69zcUy9hzug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747979916; c=relaxed/simple;
	bh=owZ/lU8dtupeRTF15mnxjml4CvEQKy8zwKtEkgHkWn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NH9kMgmmDvUPyeA0Fq5lk0CfAkDtytxqtT9dg6gBo28M3x9PrrWY1+xIocNsSeKvuv3FEWj07GwA+4ss0+ELC7XzTKqY+BxQE4exoZhmIBJw4/EnDFIP+FtOcH6UZxCVdDVXZEki0FOiPwK4/W722ThsGLQGTvj9WSi8MjGFN2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L09WXxAe; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b26f5cd984cso6566843a12.3;
        Thu, 22 May 2025 22:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747979914; x=1748584714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2yC9lrfG1PxVLBogrteX7LxyUkKTOJwJKIR9j9soKH4=;
        b=L09WXxAelekOeOZmJU3KEAUMMa+dqDZ7E91l8WZ06pErCMNgPTtPRTdP5JVhVQG8dj
         +tAqGaGmYYlHZwmtRKxtrEX89jT4Ic5tO0DMAaUJLsTyQMq+7iHY/GqEAajTUbuqTtPp
         hgoY+XjCu3YJyuGUxsAqg/FPx4lXG5jXxLuJcGJ00b6w2aRbf3YHq4QkKOZcTsBrSiTc
         kRiEFu0TzHzYoRudEzXLIbSauQpea8sfHdDuvRkmn0ly4DcWPjFQTCL4JZXoAGAJfoJq
         C7reCcc+4TvDFgptuA0ZbeU+rpSC0mybV5IMgyGJSqJ0ezNU7r55zHpmL7+5sGY3rC09
         VrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747979914; x=1748584714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yC9lrfG1PxVLBogrteX7LxyUkKTOJwJKIR9j9soKH4=;
        b=t0v8yhwwIswlNeM+zgHxDlo7FjfIhA9Nk8bhyF+6MmH3O3MmyleQtNt1PmMbhlv4XN
         zRo2s9OtiSSlKYZsF6fvpA20WjnIihh60DszLsNkXA2Dq9pwNpoDQyGKNxaIxA0PNlel
         BJf/Yg4gUi9GDFeQAlHmIHJ8wCvEW1eGNjfAQm/x9AK0Z8rwERxfculQumr947+Bm5o0
         dHWY4EVrurm+JXGN1tVk+mkBdNeTMfm+dYa+SZCFVFAyIkHM9Tdb9AYO2a0qSwjyzdiG
         nUL/T0suVKOCoz1ww6QCOv09IFM4KeWXcZaoNyfBBnXV6ibFucJ9RF3FNhbHXcB8VMkB
         CvQg==
X-Forwarded-Encrypted: i=1; AJvYcCVDxjXxf8oN3Semj7h0jJBRX0cYj4IaFg2S7TckL2HKbTlcfaSttGXuZE2eFMa/o1pDgcmBUHAdML8dTn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaboCOJe5MdOq5BSZzv7vwvORKI8YzBnNKYGfx9RhAlWx0hu4J
	SJB8rVsqslqclZ1vlwG4mYgbqV9zeRLl++epQYmLgNEORJj53mLGowyE
X-Gm-Gg: ASbGnctsjIGSuNeL7yOJ141cBj1MqnJ2ihtIKjyHqb99j8NtKE4jAd8Y1dWqo0rgffW
	9XoLjOlVJgHO0hROKU/Mi0S5bCVPh9FuS+COkxd0+vMC8FpBdeLbFN4ejZ3N68CmwH0fG4d7jAO
	r/1xnPR6c/J5WxbiH0nSnPu3SrbZWZ5VGEV685JNKOKNHSNZRkHaH0vpebgsJqA1kDUqLyuCt09
	AYu0ahc2jzSDEK4WTJqvdYDcEg0QVpisYU3dix3uV/d1ftxit9nNf9dlA5Lqy8qzUFxRTfPWaDY
	+QC42tqSNhRCQMLWehiU/B0zb4/jbUrpqb1PmCTTMoVBtwmxUMs=
X-Google-Smtp-Source: AGHT+IF64/8o+6vAg+hZspj9EWdeCaklWFEjqbqK4Y+/f1M+1By+5sa1g2OuLuYF++Vswc8mONqEyA==
X-Received: by 2002:a17:902:e844:b0:224:1c41:a4bc with SMTP id d9443c01a7336-233f219a0d8mr26981835ad.12.1747979914443;
        Thu, 22 May 2025 22:58:34 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac959esm117665315ad.33.2025.05.22.22.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:58:33 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 5474C42439C3; Fri, 23 May 2025 12:58:30 +0700 (WIB)
Date: Fri, 23 May 2025 12:58:30 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Hanne-Lotta =?utf-8?B?TcOkZW5ww6TDpA==?= <hannelotta@gmail.com>,
	mchehab@kernel.org, ribalda@chromium.org, hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com, hljunggr@cisco.com,
	dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com,
	Jonathan.Cameron@huawei.com, corbet@lwn.net,
	ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
	W_Armin@gmx.de, mpearson-lenovo@squebb.ca,
	skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 1/4] docs: Improve grammar in Userspace API/DVB API
Message-ID: <aDAOhl7gKhkcTEjk@archie.me>
References: <20250522115255.137450-1-hannelotta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mw+femNPDBom7NIr"
Content-Disposition: inline
In-Reply-To: <20250522115255.137450-1-hannelotta@gmail.com>


--mw+femNPDBom7NIr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 02:52:52PM +0300, Hanne-Lotta M=C3=A4enp=C3=A4=C3=
=A4 wrote:
>    #. On Satellite and Cable delivery systems, the bandwidth depends on
> -     the symbol rate. So, the Kernel will silently ignore any setting
> -     :ref:`DTV-BANDWIDTH-HZ`. I will however fill it back with a
> -     bandwidth estimation.
> +     the symbol rate. The kernel will silently ignore any setting
> +     :ref:`DTV-BANDWIDTH-HZ` and overwrites it with bandwidth estimation.
"The kernel will silently ignore any :ref:`DTV-BANDWIDTH-HZ` setting ..."
> =20
>       Such bandwidth estimation takes into account the symbol rate set wi=
th
>       :ref:`DTV-SYMBOL-RATE`, and the rolloff factor, with is fixed for

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--mw+femNPDBom7NIr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDAOgAAKCRD2uYlJVVFO
o9u0AP0Xys56re20EnXGptNdWmdJS8g6Z+F9QJt+Wr6I4Kqf3gD+PQUaje/WI57e
sdkr/fLl5iCAx/bAYBG+rx1FZAPTegg=
=TzqD
-----END PGP SIGNATURE-----

--mw+femNPDBom7NIr--

