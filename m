Return-Path: <linux-media+bounces-58723-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nJGiEscI3mnRmQkAu9opvQ
	(envelope-from <linux-media+bounces-58723-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 11:28:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D591B3F7E79
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 11:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48142300AB31
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 09:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04DFC3BD23C;
	Tue, 14 Apr 2026 09:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkAeRuZK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2282D34B697
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158914; cv=pass; b=eHPvZGrWG3KOZ6+qtWi+1Ek9aXgkRb+Hwl3va/9C19+YX+qGEFIRmOtOnkP5k/HteDjQ2QfzGZGZKU3H08huqM2xwxjGz6SHZ87vTMf388jCq3xqY2WHheZvOgwEOsGdUSZ3EtGCpymiqrvjkS9UMMkhMbbq2jqhLfcE3LdfLOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158914; c=relaxed/simple;
	bh=S0tgmUHkcrWQ6G8DB2v4KMGgpg0DX/f7SeHE8XinXvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uIeZBL4c9bOWOOTaowK4wN0ksWTz4pHwYegCqbTJRK6jhsW4L4/N+4tKAQWpGzNgYxSMXMmxEXlLpktJ2+Jlt1z71sKjkiAVzwQYiTgdc99nRoUf6xDZYOlBSHT+VzXwtG3Q/Va5OVMN5RGruTtnNA+pQouksiKMT0vFTzr9tK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkAeRuZK; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9382e59c0eso959896766b.0
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 02:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776158911; cv=none;
        d=google.com; s=arc-20240605;
        b=OwkdSexn4jHkt34L6MMS5w098PhGebLkfNU64h0xQFKoJs0fsf+UDQhDN848mdbTpp
         VvtvxhAL4jEPqX+8v1HfhvGNeaxWFFukzBDs6I6+9tDbJUMit4N0AEtCfYC3fY2PR5bH
         2Z2aKBNdsV/D+rcZK1JRlYerMqk1mJcHbdbk/bB5HXQxVPU1IzT8X6w8ClOPjGxa16Pz
         NNbNp42udNfUDS5Pnf/qArDs36vkByQUhHF08IVFoFVLk3yJ3lUN1WgXpSDNh+ZITfSN
         kMsCzuVuh7iK7N69GhxM+qekq2qY6dBTj9g+5TFRx+6dbqKdqCp+NEwj3o+KGl1hjdZA
         9Jqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S0c17HBzzMbEFO8QMpld+K6t3UX5CRd9Uatl/nTsytQ=;
        fh=kMU1zDy5iIOyZCisrbWpBgSABBTuW0YOSILBCfzzcaI=;
        b=A2Z+xErmCP0QkI3/S1mEMRhL85ppd1MKfYnt9v0BvbVpXByrbpVRwJYvkOSPQ7vzl7
         TVhqGEEJIqiZ1P8vTi/xUTzIf1zoo1zZoBTYez0g4B2R3SmWqIOaoN37aDLEGHtEAgnz
         hBDF9lck0QnICtRXf3xJJ+QqNkUAhjis4yz2tgLWZNJgK4GwqdfqUp7qT4SXft9bK4/H
         bYP/k2UDUBISC6UiH5tZi/TGLHHhprIIToUfDy2AZWqpFzVwKe5ovjWazc3wQ2xo2d09
         +P0WC94COwm6LOnjdx0XLYUDqn8xuWzMcKngUy6CRB0z1iEDMJDYuxUHQ8jXXYEl6FxF
         eEcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776158911; x=1776763711; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0c17HBzzMbEFO8QMpld+K6t3UX5CRd9Uatl/nTsytQ=;
        b=XkAeRuZK16QNE16vAKMaZwr93OYb0mVDdD4FITRmAQ7leEouCR3eBOHUBykYnXSw1N
         owd+iWoYjZNPWkzIJXukhAQALPgZZjSgvJ06XZGanJGtC1xGQFJ0QFaacbbMzEWcqoSz
         fywRKUg40cZr6s4r3A+l0Qrbje1oqeRaMxjlPZEVPEbA3tyOcZlWxD/bf+VovRXWn9Ud
         6HY/D80wH2BXyfaLv5bnU827x38K/pbiYeVPKtG5JTrtt8pbWmqfkIsM8TYd1TwtKf42
         f00UFai69jOTmyJHRjfQr2FKjbxeByWs+75sUA7XPEM3Y+wnvpH0uOg00f7CTNyj5WVu
         M89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776158911; x=1776763711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S0c17HBzzMbEFO8QMpld+K6t3UX5CRd9Uatl/nTsytQ=;
        b=NzJZ2YaLSEyz1k5aAAmfT180wE0VUOPAJJXhm8QgWgG92qAEqNjTGUnHF6NA5YBDWp
         ZAY4o/6JqhZtHKtDxWbqq/1zAchSw34lBzL59x93BkOyw/xP3tkF5gQf0WdEr7Ig/rrs
         kbxt4tjTVXSMtSrTN5+sPuMEnqPiqHcGnfa6aAAiSYy4sYVVOEQja3feJ6iE7nt5Y0Pn
         gY6AK85L2EwGCjZRCDS5wl3CxURwVIzSrlp1Jsmq7BJdB+OFGnIzOFl6w9PtyJmBsepW
         PjaS7iGYaWwW58ZyVwecUGK8Qi2Ke31liTpuNDE5xcmhN4+TbTkj0YygkyzUnP8uplgT
         mvWw==
X-Forwarded-Encrypted: i=1; AFNElJ/Nt8xik2hCA991tDpveFeD2NUS0NWvlHSOLXvo8/3Ef151vDtcEhQuFhivUCVcDXuI4GUr+M1xv2XAlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnokZGpcROqAj8wD0KXIZC47AacEU61HjjXQ9nBnMTmYMdiTiy
	DtF6Jgpa6z8vlpEcOuuhT8azSRGHTr0hKi1WkwK7Qms6s0YKycVRoEWwVIOSpcEmXo2Tk4floTp
	FwE7EKTdfBWo9xaDyYu/eUKsUq9nJnOrA8gCXkg0=
X-Gm-Gg: AeBDievzRxJtFyOUUkWVw5jmvnSsUCcSztRQy3yqW8t1SwGlpI1qm6F2EcSLOaRaqc/
	iSD8LjfNG8wcxsrTxmqum/lDF7VmOVMgR+PpXhqiM2XUlr3XSLKHTW2/bsnaExtkKLhYeauFMXQ
	6zGhMd9G0XEcVCGwBfrs6JT2HYSTwNiBoJXvmBN/74hpY3Qdljin0XA9Fl38rabcAa0vxR9O+i0
	pZYrCzI4MILobKhT+9hDz/kYc6F3ctUZEgGBwe6Xrtqmql6Apdd/HtakOgOFCIuzFgW1y4mJG/y
	2j57ozaO0JTRssJmSi7Xr0tCn0KcI32ecfPGPbhuT6saS8zItyYzJWwoz4tTgTgpKUNsdQUWgLu
	LVY26uVY=
X-Received: by 2002:a17:907:1c1d:b0:b97:cdcb:a296 with SMTP id
 a640c23a62f3a-b9d7248ab05mr789863266b.19.1776158911306; Tue, 14 Apr 2026
 02:28:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413112904.98864-1-feng@innora.ai>
In-Reply-To: <20260413112904.98864-1-feng@innora.ai>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Apr 2026 12:27:54 +0300
X-Gm-Features: AQROBzCR8zLKYAWLihhcXz_VskeGU9AEe4QbGCQP9GPOjDs-hPQDGrtnJ9YqQ4o
Message-ID: <CAHp75VcoNkEQs7QQLDg8xZjdouNc8Yc6Vjg+Pdqb7LViqSKysg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: use kvmalloc_objs() for
 overflow-safe allocations
To: Feng Ning <feng@innora.ai>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58723-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,innora.ai:email]
X-Rspamd-Queue-Id: D591B3F7E79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 2:29=E2=80=AFPM Feng Ning <feng@innora.ai> wrote:
>
> From: feng <feng@innora.ai>

Please, make sure you have your full name being spelled in From: as well.

> Replace open-coded width * height * sizeof() multiplications with
> kvmalloc_objs() and array_size() to prevent integer overflow in buffer
> allocations.
>
> The atomisp driver computes DVS, morphing table, shading table, and
> statistics buffer sizes using unchecked arithmetic.  When dimensions are
> large, the product can silently wrap, causing kvmalloc() to allocate an
> undersized buffer.
>
> kvmalloc_objs() uses size_mul() internally, which saturates to SIZE_MAX
> on overflow, so kvmalloc() returns NULL instead of succeeding with too
> few bytes.  array_size() provides the same overflow protection for the
> two-factor dimension products.

...

>  #include "sh_css_param_dvs.h"
> +#include <linux/overflow.h>
> +#include <linux/slab.h>

In the previous version it was located correctly IIRC. So, you should have

overflow.h
slab.h
...blank line...
The rest of the custom headers below

>  #include <assert_support.h>
>  #include <type_support.h>
>  #include <ia_css_err.h>

...

>                 /* Generate Y buffers  */
> -               dvs_config->xcoords_y =3D kvmalloc(width_y * height_y * s=
izeof(uint32_t),
> -                                                GFP_KERNEL);
> +               dvs_config->xcoords_y =3D kvmalloc_objs(*dvs_config->xcoo=
rds_y,
> +                                                      array_size(width_y=
, height_y));
>                 if (!dvs_config->xcoords_y) {
>                         IA_CSS_ERROR("out of memory");
>                         err =3D -ENOMEM;
>                         goto exit;
>                 }
>
> -               dvs_config->ycoords_y =3D kvmalloc(width_y * height_y * s=
izeof(uint32_t),
> -                                                GFP_KERNEL);
> +               dvs_config->ycoords_y =3D kvmalloc_objs(*dvs_config->ycoo=
rds_y,
> +                                                      array_size(width_y=
, height_y));

Wouldn't make sense to have now the array_size in the temporary
variable because I don't see it changes in between.

  size_t xy_array_size;
  ...
  xy_array_size =3D array_size(...);
  ...
  dvs_config->ycoords_y =3D kvmalloc_objs(*dvs_config->ycoords_y, xy_array_=
size);

>                 if (!dvs_config->ycoords_y) {

>                         IA_CSS_ERROR("out of memory");

Also consider killing these (all -ENOMEM) error messages from the
driver (in a separate change), the kernel MM will print much more
before even coming to this point.

>                         err =3D -ENOMEM;

...

>  #include <linux/math.h>
> +#include <linux/overflow.h>
> +#include <linux/slab.h>

Here the headers are well located!

>  #include "gdc_device.h"                /* gdc_lut_store(), ... */
>  #include "isp.h"                       /* ISP_VEC_ELEMBITS */

...

> -       me->ver_proj =3D kvmalloc(grid->width * IA_CSS_DVS_NUM_COEF_TYPES=
 *
> -                               sizeof(*me->ver_proj), GFP_KERNEL);
> +       me->ver_proj =3D kvmalloc_objs(*me->ver_proj,
> +                                    array_size(grid->width,
> +                                               IA_CSS_DVS_NUM_COEF_TYPES=
));

It's better to have the logical wrap, exempli gratia

       me->ver_proj =3D kvmalloc_objs(*me->ver_proj,
                                    array_size(grid->width,
IA_CSS_DVS_NUM_COEF_TYPES));

OR (if that is too long)

       me->ver_proj =3D
               kvmalloc_objs(*me->ver_proj,
                             array_size(grid->width,
IA_CSS_DVS_NUM_COEF_TYPES));

>         if (!me->ver_proj)
>                 goto err;

...

Otherwise the patch looks good to me. Note, that comments apply to the
entire change whenever it seems the case.

--=20
With Best Regards,
Andy Shevchenko

