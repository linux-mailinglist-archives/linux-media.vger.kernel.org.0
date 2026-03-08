Return-Path: <linux-media+bounces-54905-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNnjGqH0rWlC+AEAu9opvQ
	(envelope-from <linux-media+bounces-54905-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 23:13:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B0A23263F
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 23:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C31C3014408
	for <lists+linux-media@lfdr.de>; Sun,  8 Mar 2026 22:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593292D8771;
	Sun,  8 Mar 2026 22:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5XwxNF3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9143E17993
	for <linux-media@vger.kernel.org>; Sun,  8 Mar 2026 22:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773008023; cv=pass; b=cOPK9Eii2TNlulnRJePLq1N+CPtavT+VIoy+L4LcFjTgJMh9jG1I3FWWdyLFiYjJzya21Ot7F0JE9aFrUXrg0wmY0Fu7zouaQMixEMwHWnjaZiXH0Mw+74ftns1eLUqKaxA2j0rpJDhFCRhUHs9DQecNUxUoboM8lXZvL8yH23Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773008023; c=relaxed/simple;
	bh=xNloVs6yOx1rSN8xWlshGdsR+uQp6/ScKdeAQSSOgJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cLiDERWdN6fp0KNEAgCRbGaVJKonOiMUjp/4+2IGfFf1ELbO0NQc7GQT0Yp/Fobq4muHdnm1AIsr4iNUuMUgVesx/T77SAcU6+RanJ8wOuWRePMDpbhlu9VtPLlgJ0A8GnQYJgW0WW3DgA6V6qXndrBsqDYEIBuwp36i1jIowdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5XwxNF3; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b96d7053073so192564166b.1
        for <linux-media@vger.kernel.org>; Sun, 08 Mar 2026 15:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773008021; cv=none;
        d=google.com; s=arc-20240605;
        b=OKn/t8rfmhqK0TVguKR1naQLkojGQ9sFZj86hQka4W1swzF8VODWoTITNg03HUMKY5
         R54sTYl24GMhmfZpxG/cNhrFSa3URlRptefH1xx/6yqJiBpuYsAs0eXTEcbEvuXpD9TP
         wEy3B5X6/GrYAQmyrAJl+mVcQSlSmXTsBT03wdfHIr694i3xN9fQMXumPTRKvaYR5fiH
         1OJhXgL1UyAbxvObXsRLnW5ei7DE5nXuodgxFrdMPDMRyP4neT8PSsxMbsmEV3xlD37X
         L/BBDNyyB7Je0iIA6Np9D0hRWKz1gPxHRVzHO0Ua42ia7rZIayUK2iverE/PNqInGtMq
         RXaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LDhKTwFqhOYTwtXWK95p3D3irV3vbREvxRAD7ICMP0Q=;
        fh=I5i3AXyjweK/I8s6xlrR8LUtY3copBksHeOwza7tpW4=;
        b=M3JiemLqCPPMLX9Yz7rW0joUChihFe/j6akU4M0XnlZ1Xszy7QzzE7G2nU5fosIco4
         bCmFjqd8GDFe5DoCI0ueUGbrDuB6w3DDp3zGJizWCIEI8j+ldzcbY5PaUv+iaiZojKdc
         Np/c3/gXdrmf7B2FIWCSM+A5BkcikrzebX7DMmut7gXRvnL8e5CxEBfPZ1exlTQww6DH
         WfRYkDgjGylxXzzqhgd7hHwkrQvijTRfJ1mk8XPjltLdVMwpLq9r2fowJJ58onRkRLtA
         uAJzpzIyeJ3Bpp3n3jwYJs16Yi8tRDIzZqGJRgOrIGFki91Ru9zbQbEoxj53OLMxHHYT
         VO7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773008021; x=1773612821; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDhKTwFqhOYTwtXWK95p3D3irV3vbREvxRAD7ICMP0Q=;
        b=H5XwxNF3K1RP/24n2FUEmgvuyOZ7llQ0Qhk1SR+I3RILPSfczBkQE3jPQco+PpUnav
         0TpDVJ8YpeGNrfuY2OFDCY94ONsfJySbLrO8IV30G2HUtlQCwGddI0YBUrfI6HhL/AiH
         cWSxgJiIacmzqV21391aLstdXQbkhJHBzckNVmLxpQkyVar0i2T4NAkTlOXS9F5ZZh4x
         UotagWfMIkxOXt7B3hqANP+WnnlEaUPkizwpl7LN0RjTL5zOtpAnDChNQL7F78FuY/w8
         YnXtzeUEvRd1KeSqO2lU+MLcjjI6UCuu9C4QnTgeBvgctiRYqNfyc+XjeFZahfVK/9os
         I+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773008021; x=1773612821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LDhKTwFqhOYTwtXWK95p3D3irV3vbREvxRAD7ICMP0Q=;
        b=eUDktWLlwuS0U+F9HF2a/LXws1syqZlREpn2w7EfEn3qqjgxVRKIFpVyIuEnXgboDO
         xgOix6ia3XUdPLfeSjBwpuFwn4LMxYqXu6vB1oU94H7iw4JKE7cFrRMUUhtUhNvzR1u1
         AqkQsuDxZGoCTmOW5PhZjw8b/Oq9w8mJFgU3pd57MScPAABBBqjLpFiqf4xa/NXHw0rS
         yWciffIY/VT/Qh5DyfB7H2Fvxglr98O3wR/UCEgeujLwTI5E+WOrZDSiBvJyV+C089so
         d4q2JYLgjbB6rvRNz/C++DITm+3bBo9HpDLuuVgcs8TzgLk1gMbuUpKjc6hALZMD1dh+
         NJpA==
X-Forwarded-Encrypted: i=1; AJvYcCVKXsUlKBkEcdTVgBM9aoTwDQm4DxAWxVgYtQSyVfH/JMs5dEtN4NAEH/QeaHYvRlCyDGIz5Of3Oq8vgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpCHUYjznseJijsT7YHGahgL5PWtcixn7pAc49e6HXNi7SIojg
	YIf/YczMvl5KwxyGePTlN1Qr3BL5uFPL/hISdA85f/xZuvnstz9ZX2C7ZFcAJUi1fa6vQG4lD8Q
	yepR0Ikdu03eLCuHnQv6OC/G9zjyGPLU=
X-Gm-Gg: ATEYQzworS3Ww/0w1VyrC0XSPrM72324C6f+MgP7TiOg14hF/q0aWjgXmz2FM6Pyt3L
	h2tYb+P8vt2gcylA7roFzUS2CC/rZ86k2pBT3EtDatnaSP9MwrzdCfnFo5Wj1Iyfq8K63O+ZTDi
	U6DeRJ9eVtxly1ifBaiLA+5tXaXb01qwbt+bwL3W+LoTaJSJv+CmIXlIuzlwcck/WMA8S2/c+oq
	HJuHUxmvvRj33XcvvInC4A5qjhvdyHEH6LszQRv7KlgDcBeOb8jDcF7ra0nzVkn6JX0rutSoNsX
	3lTKbBJ9yIZtUZtYzOsvY4uigq3I42+6pnqAHjvK+G5PFDUrWCkbQLCSXZudK7Z5YAEO4TV2Gv/
	OPT/kCCg=
X-Received: by 2002:a17:907:968e:b0:b8f:f136:20f6 with SMTP id
 a640c23a62f3a-b942dbaaa82mr585310066b.22.1773008020677; Sun, 08 Mar 2026
 15:13:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308215840.31197-1-laurentiutopai2004@gmail.com>
In-Reply-To: <20260308215840.31197-1-laurentiutopai2004@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Mar 2026 00:13:04 +0200
X-Gm-Features: AaiRm51lgjLYCWGmF6xsDsxoigCuuB_TjArwvWcdHeb2JPXY3T0nR31j6HyYJTE
Message-ID: <CAHp75Vd0O+Bj-LJWu7JsSbacdcBmEjp4aArA4fb6Kd4Qge_BOA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: comprehensive coding style cleanup
To: Laur <laurentiutopai2004@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D5B0A23263F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54905-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.889];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,checkpatch.pl:url]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 11:59=E2=80=AFPM Laur <laurentiutopai2004@gmail.com>=
 wrote:
>
> Clean up atomisp_cmd.c to comply with Linux Kernel coding standards.
> This patch addresses multiple checkpatch.pl issues:
> -Fixed block comment formatting(trailing */ on separate lines).
> -Replaced hardcoded function names in logs with %s and __func__.
> -Fixed comma spacing and converted leading spaces to tabs.
> -Removed redundant else branches and void return statements.
> -Merged multiple line dereferences to improve readability.

At least some of the pieces may be split to separate change(s).

...

> @@ -1024,11 +1022,9 @@ v4l2_fmt_to_sh_fmt(u32 fmt)
>                 return IA_CSS_FRAME_FORMAT_RGBA888;
>         case V4L2_PIX_FMT_RGB565:
>                 return IA_CSS_FRAME_FORMAT_RGB565;
> -#if 0
>         case V4L2_PIX_FMT_JPEG:
>         case V4L2_PIX_FMT_CUSTOM_M10MO_RAW:
>                 return IA_CSS_FRAME_FORMAT_BINARY_8;
> -#endif
>         case V4L2_PIX_FMT_SBGGR16:
>         case V4L2_PIX_FMT_SBGGR10:
>         case V4L2_PIX_FMT_SGBRG10:

You need to understand the code you are modifying. Blind follow of the
tool that has tons of false positives (checkpatch is a recommendation
tool, it doesn't mean it's sometimes correct or useful) is not good
idea.

NAK.

--=20
With Best Regards,
Andy Shevchenko

