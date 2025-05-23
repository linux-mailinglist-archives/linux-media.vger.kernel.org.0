Return-Path: <linux-media+bounces-33228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F9EAC1CD1
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 08:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32FD41BC7BF4
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 06:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA478229B0B;
	Fri, 23 May 2025 06:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJ48/bHz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A602F22577D;
	Fri, 23 May 2025 06:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747980866; cv=none; b=WvrCxDhFI/lnrKnp0o32UOD1O928sFvp4GundgjVPS84egmE2twkUF3DyXZuE7IKPeQLatVdVkf6av0yFM1cQp4Etft4s/PXYej+mbu711bYXb7Kf73nXP7Zenh62vnIz7xUGc8S0PiF7Z8GhE2JmtfHjaHxSWPsu30nxKoEWnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747980866; c=relaxed/simple;
	bh=QzJNuVs8vVKFKM8wKyULi4Vvzh4pwY3oC3m/lfAcQ9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUawQ2KfNfzPsQhU1f68lUjSwdFdZVMYvLXL71+OWak/66KLnaUGr6OmxSIc6fKhhLjUjk9Go5KRR45pKdqAhrN9E2oW406oSa2wmKc8+5LQhn45c1qY+HavqtDA7ui30ocHuZcJMyAvmdTIdfRGpyLipDuVO+IwTB21PPMS/rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJ48/bHz; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso9985485b3a.2;
        Thu, 22 May 2025 23:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747980864; x=1748585664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MHl3B8D0g534+xOMHpbFZ1fPtFf+LSieMSonGIYFvHU=;
        b=HJ48/bHzkEfVspe5yIvM20AjtgzFkLFjCV7mHvKXWkNf6sRDpzlptYtri5ehUU6F4r
         XFYNVOTkM9E3fb6Nqd6bxizwLF8PEIQA21CmxMbs76n8VTpbK/vR+P+IbhQccpiBihxt
         5kxgkjbHwFCCnBokPaS+gfQzz8o7Gv/WHR11FhsZKpodO6ZvSHSNJj7A45mBy4fhJo3X
         lsnz2h4NXleaXJqnL30/nGl0BW2Pm6BpgKaQQ/+byIqyn6ReCPEnKliuD3L0CAwf6Ngd
         guUMMt+M6FqbF5ojSODPRo/JpQNcM0PtEWEjg+H2M/KM2a6m/7i1fVbPuxan7/nUfZXx
         F4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747980864; x=1748585664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHl3B8D0g534+xOMHpbFZ1fPtFf+LSieMSonGIYFvHU=;
        b=rJp+jxEAHz+boUv8sHtIVsAAbefKmwfKaiY2lenLwddFSrWa5mEG27G5CEFQ5g/pwS
         L0WVzbWEpYYYbeRvNWqw9hY1JrudDhVONhk9pk2rSaBse+HluUiGGJQgfE6c9rLFChtj
         pQ0lYc7d516QuN40s4tXsv/JqDRjamL0PYN5ZDvEzY9z33IPgSa/VhX9KtshmwtKp4BL
         DVxPT22DkA4p00EKy36czEOopLAhgeQFAhmzJU+v4nNqSLTbIsVit+pvFzNGP4zzqtek
         C+3zsd6/POQ5moJf326USUEgjb7zFr1JVXe4WNbx3CNfbRTp7gK/4W6Kcfjb7TXcXmhY
         ABgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiSjagLz+iYvZqEvY58cUE4xRwrn0wr4OWRIoqOUTGAJfE+FBSXgOUk0f+qFgod3KGydWI0bzMR8fuIu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuaH5nNsWLVS89OPhPJAn2ZVdrQESqcCCFmI7jnemBDYGeAa/b
	m6cL2K+nyY5xDsa4EFnEXSE5lXYh/prrdvvmgI9ldJV5mo1I4E6e9F+u
X-Gm-Gg: ASbGncvsl90AdDlo4Dosb5O2Z3NDCbS0RjS1H6bgDj/hIOq8y8xyrKLK4fcWto5Iy+s
	vcl2iwTnb+hAs+W9TTdeqWUNP2luei3JJODQXACMrnbKSt3b4d0vrgfTk2HnblOED5jpXmWOA6d
	OaVj9kIluEdSXy7lWtE8ZFR/1HlBAA2yjlGcfOHwxRFAsk41AHKQVGTiLdkl1ThbJOowKTxGFg0
	cL6Wc7sAxNytgBzieY3sKvEjZXkD0LTTMHv+nccRZ3U9wdmxK/iOOnm7fanGV70pKbLOBuJ11WN
	y+kkg+R+fjREW0JWkfB7NtJhoj2ZUImfZ5CvYuE3LEd2VxC/MUC+2DwwJSTjXA==
X-Google-Smtp-Source: AGHT+IF8NcYpLF/vCpsLTmL2BavFzYK0IE92XL7WtADDDe8q+CJGuAknVVIFrJ5MaDtWDYAN1k9fkw==
X-Received: by 2002:a05:6a00:2d04:b0:73c:a55c:6cdf with SMTP id d2e1a72fcca58-742a978ebbbmr35788381b3a.1.1747980863708;
        Thu, 22 May 2025 23:14:23 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742af5d1cbbsm12065992b3a.149.2025.05.22.23.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 23:14:22 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id D2C4942439C3; Fri, 23 May 2025 13:14:20 +0700 (WIB)
Date: Fri, 23 May 2025 13:14:20 +0700
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
Subject: Re: [PATCH v2 4/4] docs: Fix typos, improve grammar in Userspace API
Message-ID: <aDASPKOpCjv3rUeQ@archie.me>
References: <20250522115255.137450-1-hannelotta@gmail.com>
 <20250522115255.137450-4-hannelotta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7URSTXlAz4njnFY8"
Content-Disposition: inline
In-Reply-To: <20250522115255.137450-4-hannelotta@gmail.com>


--7URSTXlAz4njnFY8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 02:52:55PM +0300, Hanne-Lotta M=C3=A4enp=C3=A4=C3=
=A4 wrote:
> diff --git a/Documentation/userspace-api/sysfs-platform_profile.rst b/Doc=
umentation/userspace-api/sysfs-platform_profile.rst
> index 7f013356118a..6613e188242a 100644
> --- a/Documentation/userspace-api/sysfs-platform_profile.rst
> +++ b/Documentation/userspace-api/sysfs-platform_profile.rst
> @@ -18,9 +18,9 @@ API for selecting the platform profile of these automat=
ic mechanisms.
>  Note that this API is only for selecting the platform profile, it is
>  NOT a goal of this API to allow monitoring the resulting performance
>  characteristics. Monitoring performance is best done with device/vendor
> -specific tools such as e.g. turbostat.
> +specific tools, e.g. turbostat.
> =20
> -Specifically when selecting a high performance profile the actual achiev=
ed
> +Specifically, when selecting a high performance profile the actual achie=
ved
>  performance may be limited by various factors such as: the heat generated
>  by other components, room temperature, free air flow at the bottom of a
>  laptop, etc. It is explicitly NOT a goal of this API to let userspace kn=
ow
> @@ -44,7 +44,7 @@ added. Drivers which wish to introduce new profile name=
s must:
>  "Custom" profile support
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  The platform_profile class also supports profiles advertising a "custom"
> -profile. This is intended to be set by drivers when the setttings in the
> +profile. This is intended to be set by drivers when the settings in the
>  driver have been modified in a way that a standard profile doesn't repre=
sent
>  the current state.
> =20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--7URSTXlAz4njnFY8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDASPAAKCRD2uYlJVVFO
o7K9AQCAadOCdr3sLHWQNMQdtCOg92nM0uxCES3VUJaSEZRzoQEAk4qnDQ4yVHkO
T7roqthiiUAgSj8C3VgyyYkT8DK/YwY=
=u/LH
-----END PGP SIGNATURE-----

--7URSTXlAz4njnFY8--

