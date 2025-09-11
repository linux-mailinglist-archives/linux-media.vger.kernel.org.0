Return-Path: <linux-media+bounces-42332-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1076B531F3
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 14:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A86F17295F
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 12:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A18320A2E;
	Thu, 11 Sep 2025 12:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="vKbkO4zM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C15A3203B9
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 12:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757593205; cv=none; b=TpT2gCDWiT12rbj+3TFDeyv0/fGRdcBvc4If9kyX8tVADlnGJWjxYaxXuAN84otxUBR9RBSYyy6zOI5xUVDOq0GejP9XqAWfmAPrMRhb8/6LTOYWPPL4z3gjNeQ9ME1hk9NV45DeWk6mguBSV2RZly9MTRTR5hqMROu/tkTvATE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757593205; c=relaxed/simple;
	bh=TwuWfqOnv4RBClY+2TA4HgMzpoljXCgbsQl28FeyPIU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GjQiV/mkndSs4xq1RA5pBmf+A0Wb6etUUh/u226gKQysuGneCrna/suIVtOhB9KvT6J22qr9k/hZqg/jB9pYGsLKzmdgoQ59If2RXZdbrIKA7GvDtPekQgwSKca8H7rwpzNoexRXrOyv59S0eawpHWpwxDyjIqgJv9UiQ+fcXeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=vKbkO4zM; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-726dec342bbso5852186d6.1
        for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 05:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1757593202; x=1758198002; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TwuWfqOnv4RBClY+2TA4HgMzpoljXCgbsQl28FeyPIU=;
        b=vKbkO4zM8lUp/CctZwxbRoHweUvFhDl20pLswAK+uwu3ylyKlkFiFws5no9vXHIu7E
         hjYu7W0m8vEn0iwQE9Q2WRjTh1KKVKZwY2RpUBIXQXpwaLvN7Lii1NVAhe8WzJF1Wjxc
         haHd+7exCWhFoac2zoKh70fIzSvXZrmDomQtz+GUPBYv/kTpv2FutRUwLWioFns1WQrt
         /avXzOAmRIapspLRdC+y37wAkLhiDbWYpMjLgYmuJ41UprOrSE6jZLBr8LY8MqWuffSN
         JuRiwqL+qjqR7H8H7iPXruFZ6sPQcwrwLCdjrSfaV1MXr90MiFOeHM966GTl8lTmTOSo
         vFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757593202; x=1758198002;
        h=mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwuWfqOnv4RBClY+2TA4HgMzpoljXCgbsQl28FeyPIU=;
        b=dg2jwEm3eWL9sJN0bZMSfoI7dcWwcx9nv2U/q4KFb09wMudQrzoyA7JQykL8DIM6pn
         e30TstF/l9qJ5/8R4ZO+PN5PkgV0i9ls2RKGrqTKQY+Z0I8tYHp2JyXCbBDNd/qpiglw
         E03b4L+ih/ogWS/5Ey1mg80NmSEMDAq19g+8Sh1QYk99ozhDP8Ns8g3ws7VTKnhxDvOP
         F2rGKwnxyLivYIWoCc+3lJAMkuQTixPuuh1h2okNN8jdK8b9gBNZ+5RFlvc10GQfBmfY
         /WmqQ4V8UAI0M4b168E+rbem+SglP1GXxkltnIXjZ/SxCnel5/t4f0sd3gFANuUrSsST
         rUkw==
X-Forwarded-Encrypted: i=1; AJvYcCUUfmfZuju+V3CzKRhvMbWvFAbKaW9jEl5ShyI7QnabAFPsWGJ+O6Pb1irsel61BbJohB4RLWkRd1zjTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzusOwy0EwchqGXSBlG7whVEbn6J0E1iu3rIuKliJAzwr1S0vMk
	fH8jcKuSzpOTzzeMXf33GXEfV8VHhpzLW8Ln9JZo/ngHSzBVMOHFsS1hoPbKqPldq+k=
X-Gm-Gg: ASbGncswABE+DWUX2aiNBvGtBtrG/UyL9qfVpZfukfPLvo4VHPUaoeoPxKkQbOdnJou
	IhyAjvGDBaZpxlk81Q71GptIjgQjaitjViOkfb0WL6futbp/8HvebvuNvfbZhH8yYzRx9iZfiGl
	7Il8LzhNO0UBHwzOZbl69HjITT2E3WMmeYm5jotlrvIoAsk7fhHIdIGpP3Q77VDl3jSIsP+4GlX
	0a+uaT2w/Xp3bVMAN4zBU+gRFwd/NdKUeQz5/aUKx7rIOYn/Gn43rJ8uvrIJj2ixYlrujC89qkA
	vYndD7L7GVhCbhOCY8qVHXEQ4d6UoAjBavqxO1H8Uk7vNq6jF/QGV7NOIgZpD6Vn79gFZr/rVL2
	UTaBKVqfDnTiZlpjJSrnEREezyqc=
X-Google-Smtp-Source: AGHT+IH0x9DmNS2qPD9l5XI68tNGsf2A3a6bjm44jnqGnxF8JxBVd2yMChDXwMQVblQOvwAFkUtGkw==
X-Received: by 2002:a05:6214:5184:b0:70d:b0eb:3ce3 with SMTP id 6a1803df08f44-7393159535fmr206140906d6.21.1757593201986;
        Thu, 11 Sep 2025 05:20:01 -0700 (PDT)
Received: from ?IPv6:2606:6d00:10:aee0::c41? ([2606:6d00:10:aee0::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-763b680037bsm10028206d6.29.2025.09.11.05.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 05:20:00 -0700 (PDT)
Message-ID: <8de2817ef2e923d78c37fd7ebe37466738ee6b20.camel@ndufresne.ca>
Subject: Re: [PATCH v4l-utils] Change install dir of libv4l2tracer.so
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jianfeng Liu <liujianfeng1994@gmail.com>, linux-media@vger.kernel.org
Date: Thu, 11 Sep 2025 08:19:56 -0400
In-Reply-To: <20250911014853.323700-1-liujianfeng1994@gmail.com>
References: <20250911014853.323700-1-liujianfeng1994@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-yUvCZPPdtRR8jZRn4L1+"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-yUvCZPPdtRR8jZRn4L1+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 11 septembre 2025 =C3=A0 09:48 +0800, Jianfeng Liu a =C3=A9crit=C2=
=A0:
> The default install dir of libv4l2tracer.so is libdir, which will
> be packaged to libv4l-dev in debian or libv4l-devel in fedora by default.
> While libv4l2tracer.so is different from other library files like
> libv4lconvert.so in this path, it is only used by v4l2-tracer at runtime,
> =C2=A0and it is not a good idea to let binary file in v4l-utils depend on
> libv4l development package.
>=20
> Installing libv4l2tracer.so to the default libdir won't pass debian
> lintian test because this library doesn't have a SONAME, so it's
> better to change the install dir of it, just like other v4l plugin
> libraries.

You forgot the important part in your commit message, how this patch fixes =
it ?

>=20
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---
>=20
> =C2=A0meson_options.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> =C2=A0utils/v4l2-tracer/meson.build | 5 ++++-
> =C2=A02 files changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/meson_options.txt b/meson_options.txt
> index 1e4aa87f..db18d939 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -46,6 +46,8 @@ option('libv4l2subdir', type : 'string', value : 'libv4=
l',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description : 'Set libv4l2 lib=
rary subdir')
> =C2=A0option('libv4lconvertsubdir', type : 'string', value : 'libv4l',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description : 'Set libv4lconve=
rt library subdir')
> +option('libv4l2tracersubdir', type : 'string', value : 'v4l2-tracer',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description : 'Set libv4l2tracer li=
brary subdir')

I don't see why its nicer to keep the libv4l2 wrapper appart from the v4l2
tracer wrapper, this is the same type of shared object. Place them in the s=
ame
directory please.

Nicolas

> =C2=A0option('systemdsystemunitdir', type : 'string',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description : 'Set systemd sys=
tem unit directory')
> =C2=A0option('udevdir', type : 'string',
> diff --git a/utils/v4l2-tracer/meson.build b/utils/v4l2-tracer/meson.buil=
d
> index d059eb6d..92deac31 100644
> --- a/utils/v4l2-tracer/meson.build
> +++ b/utils/v4l2-tracer/meson.build
> @@ -24,9 +24,12 @@ libv4l2_tracer_incdir =3D [
> =C2=A0=C2=A0=C2=A0=C2=A0 v4l2_utils_incdir,
> =C2=A0]
> =C2=A0
> +libv4l2tracerdir =3D get_option('prefix') / get_option('libdir') / get_o=
ption('libv4l2tracersubdir')
> +
> =C2=A0libv4l2tracer =3D shared_module('v4l2tracer',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libv4l2tracer_sources,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install : true,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 install_dir : libv4l2tracerdir,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpp_args : v4l2_wrapper_args,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dependencies : libv4l2tracer_deps,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 include_directories : libv4l2_tracer_incd=
ir)
> @@ -51,7 +54,7 @@ v4l2_tracer_deps =3D [
> =C2=A0]
> =C2=A0
> =C2=A0v4l2_tracer_cpp_args =3D [
> -=C2=A0=C2=A0=C2=A0 '-DLIBTRACER_PATH=3D"@0@"'.format(get_option('prefix'=
) / get_option('libdir')),
> +=C2=A0=C2=A0=C2=A0 '-DLIBTRACER_PATH=3D"@0@"'.format(libv4l2tracerdir),
> =C2=A0]
> =C2=A0
> =C2=A0if have_visibility

--=-yUvCZPPdtRR8jZRn4L1+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaMK+bAAKCRDZQZRRKWBy
9DFXAQCnh61EBPk1rtmR1Av7HSj/i1GLT03JEsXnrvbYY1crSAEAw64bjTifhdsc
zN7EznMwVsX+G7ZKaoIW+eFOWitCwgQ=
=BP8L
-----END PGP SIGNATURE-----

--=-yUvCZPPdtRR8jZRn4L1+--

