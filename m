Return-Path: <linux-media+bounces-15718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD5E945526
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 02:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B95BD1C229C6
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 00:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90BD4C70;
	Fri,  2 Aug 2024 00:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXRCfHm7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64604C66
	for <linux-media@vger.kernel.org>; Fri,  2 Aug 2024 00:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722557728; cv=none; b=SZPAsc14//KD5kFqPjFf7QKsXTlemd7SO4qTLH3HUiVkvnROJd/O+kNGSOx/gWJ/l68NutKr3CNU152xNKLUScJ5UBc/gt943rSPhsCpMdAe4bgHWXlOiUc5z9EaL89kuC9mRqUvHgFOydZw3xkLBW1S3q2Nfhxk9scqtZuvixg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722557728; c=relaxed/simple;
	bh=TI1Tt6uRe+U7ScIw6Lib7iZ+s45VoSzO7jc6413jasE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=UpI4tBFjuU1qMr5A3rkTSIdD/m2fjv+hFWwzI6tuwCiYeDPHYurHyJTf9vlOPtzFdtgBgWgbZY4fUQbaORKsYBOGzKVwO2HglGm7WVIlXadX2VSipTVwGL1rcIy0AWFBMzlaRkLU0iYdPB3kzorIjs8xi1FS0zc6NzMAAeuPrGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXRCfHm7; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-65f9e25fffaso64430757b3.3
        for <linux-media@vger.kernel.org>; Thu, 01 Aug 2024 17:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722557725; x=1723162525; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFd0EqEbiUkMYRzQgwthsacfCXHOeNT6QgdFC/GwmSY=;
        b=YXRCfHm7CL4s78OKpV9t9OvwYLIV2k2RAdduLBbTIN2ijBgGdm1YTdJc+Pvr+OneGD
         60UBchX0SpqTvmX85L8RZmm99r8On2xTpIyneTZXgwnZsyv52zU4MFS7QlEHcyOhUleU
         2m7cfofaHPNe7XgMa6TR1RMchOYkHsat87VB4sSMcp0q/4t5Ov7Lwca00kMZPnJUhegD
         bOC/dT/bo7nZkq9NZPN5zCCBIX/XURNxu7HJmvOgvqsb+Peiu2Ytzroui5bwd/xCMupF
         vyhg3zPOQhwbxtTMUzaNNlMgE/0au0eq7958HedOdXQTeQsY6JZSAXuNAYeX1ebvaDur
         plOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722557725; x=1723162525;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFd0EqEbiUkMYRzQgwthsacfCXHOeNT6QgdFC/GwmSY=;
        b=QqiC0EL3Mt6+Av35nnAFuSggPd8pcwwv0OnVLdVEmIcfr50mXukNWfE/iXjw+tqN7o
         jFGduMtqwUgx5gwCiMiHX784qJU5oEYQXImexRBHuzzVSmZXXT1DyX29YBlndR2eUBxl
         mztFrA3qUP40gZ1tnqmokjLgYD0EnN2QrfmsdPJSn1OSLNO9f+s52OiZTaVuMTPerc5d
         fVkl3Piaij5bddGTTEYtvdchfV/6Yd/4QHra68oT07wQ4ugrSkCp1KCHKpsg2rL2JYS0
         nTOmxZP5+zKXUvmYxuHWT8yf0n5z+ChxJxsdV4tf8JWhX6V/4cSHF4/YDnhgSvXOUu6L
         haPw==
X-Gm-Message-State: AOJu0YygfXwcyLkVd7WgWgKN8q7noy9o3gzHf8IITTp8MACFvfqK7EfY
	RsFk513sULK2yA3SM+uJEf0zfIfbBY1qzzMC446PFbzi3YCTXxTsEI98mqGUF6Rwkmx89S2cPyL
	exF8E89jYLVVo/3LVXjPPX1YntSU/vA==
X-Google-Smtp-Source: AGHT+IHYqiQzTnpsED/FpRedZbSdcie5+EAsiM/qQZzpeRuawn/HsLqp8ZTqFOCEi71tCYzu5Vu2HC4e5xdn1w837yE=
X-Received: by 2002:a0d:e085:0:b0:64b:4a9f:540d with SMTP id
 00721157ae682-68962f546d7mr19207337b3.31.1722557725519; Thu, 01 Aug 2024
 17:15:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723020521.16953-1-rosenp@gmail.com>
In-Reply-To: <20240723020521.16953-1-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 1 Aug 2024 17:15:14 -0700
Message-ID: <CAKxU2N_vcuCVLRTR1dq96Bgoku-VmuucLMt5z1YaZvSdTJ+crQ@mail.gmail.com>
Subject: Re: [PATCH] v4l-utils: fix compilation with external intl
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 7:05=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> Currently there's an assumption that intl is provided by libc. This is
> not always the case, especially when deciding to use external Gettext.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
ping
> ---
>  lib/libdvbv5/meson.build   | 1 +
>  meson.build                | 2 ++
>  utils/dvb/meson.build      | 1 +
>  utils/ir-ctl/meson.build   | 1 +
>  utils/keytable/meson.build | 1 +
>  5 files changed, 6 insertions(+)
>
> diff --git a/lib/libdvbv5/meson.build b/lib/libdvbv5/meson.build
> index 0b92e404..8f5929fc 100644
> --- a/lib/libdvbv5/meson.build
> +++ b/lib/libdvbv5/meson.build
> @@ -124,6 +124,7 @@ install_headers(libdvbv5_api, subdir: 'libdvbv5')
>
>  libdvbv5_deps =3D [
>      dep_iconv,
> +    dep_intl,
>      dep_libm,
>      dep_librt,
>      dep_libudev,
> diff --git a/meson.build b/meson.build
> index 423876e1..d6c692f1 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -202,6 +202,8 @@ size_t iconv (iconv_t cd, char * *inbuf, size_t *inby=
tesleft, char * *outbuf, si
>      endif
>  endif
>
> +dep_intl =3D dependency('intl')
> +
>  have_gconv =3D cc.has_header('gconv.h', required : get_option('gconv'))
>
>  # Detect system gconv directory
> diff --git a/utils/dvb/meson.build b/utils/dvb/meson.build
> index 871f5a39..762028bd 100644
> --- a/utils/dvb/meson.build
> +++ b/utils/dvb/meson.build
> @@ -1,5 +1,6 @@
>  dvb_common_deps =3D  [
>      dep_argp,
> +    dep_intl,
>      dep_libdvbv5,
>      dep_libudev,
>      dep_threads,
> diff --git a/utils/ir-ctl/meson.build b/utils/ir-ctl/meson.build
> index 24d73a15..fd26a624 100644
> --- a/utils/ir-ctl/meson.build
> +++ b/utils/ir-ctl/meson.build
> @@ -12,6 +12,7 @@ ir_ctl_sources =3D files(
>
>  ir_ctl_deps =3D  [
>      dep_argp,
> +    dep_intl,
>  ]
>
>  ir_ctl =3D executable('ir-ctl',
> diff --git a/utils/keytable/meson.build b/utils/keytable/meson.build
> index 76ce329e..c02d4ea9 100644
> --- a/utils/keytable/meson.build
> +++ b/utils/keytable/meson.build
> @@ -11,6 +11,7 @@ ir_keytable_sources =3D files(
>
>  ir_keytable_deps =3D [
>      dep_argp,
> +    dep_intl,
>  ]
>
>  ir_keytable_system_dir =3D udevdir
> --
> 2.45.2
>

