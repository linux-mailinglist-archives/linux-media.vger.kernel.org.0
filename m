Return-Path: <linux-media+bounces-57924-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOZSBWEbzml7lAYAu9opvQ
	(envelope-from <linux-media+bounces-57924-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 09:31:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A83DF385379
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 09:31:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B15A930F80AC
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 07:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E0038C2A2;
	Thu,  2 Apr 2026 07:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muPuwK+l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91DC3988FF
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 07:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775114794; cv=pass; b=fJStKyTDQF8/s9qW/wYQMIrMlV+1nwmVf4891sevhjf3Dwd32bw2PBNQbmPLWS5JLyHhex+/SZxmy+ohwEJwFrmcLTyRbpbIFKbeBaNd5cxdI7g9tFlGnHIfFTJURaTN8t1voZxing7Sb87f4BfWHy52NH1qWBfdIZBDRe8HXmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775114794; c=relaxed/simple;
	bh=FsYlSXlZJpdy1ThdoQxU8mkas6T2ddqvGWar7MbfscY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+xUgbVVzU6fZbADBj833CD32rbBMU4hb5bGeXaJifODZ2VvKml25wNH6rOqBYXOA13XT18vq7KatNLxW6BVw1ZvVDfA18fjS2pFZbddweF8TbLgb1lOnbxmRd/ervlG6djSbjurgCpYhGIG4OT/jiqtGf8zPOH471PFvsJvuUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muPuwK+l; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b982b0889d8so71912066b.2
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 00:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775114791; cv=none;
        d=google.com; s=arc-20240605;
        b=jDtbue7VdRgzg+TeZ7x0gQ3oYM9sbXz+NLCh6YKjM69rktcUmLExpG16DWIUsscYRe
         wP0h95ndm27LfOF701hWsyFqsOjzRb/umRP/BbwZRXZHkBunB+BPsDLPDGzT2DaFXgmV
         qVZ46NCWeFmMYDZKJgFYMGNvah3nCqbqSpR525P4ZjwjpuMj3YC2Dy7d1nW3PawoAHZz
         ILSXjofBQ1/4UvTscQ925tMO1gTUZSYNmqLQkUsMK+nTMsZ8HbYK96kyC59zM6h+6X4W
         tkxkpmDJS+uh3m3vKl2u5iNlSNq5jxg+VJtODw7EIIC+SjoJQQWKIS6X/FRydiURQ763
         UGBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FsYlSXlZJpdy1ThdoQxU8mkas6T2ddqvGWar7MbfscY=;
        fh=lzw3vX2ZRhdwb0d7APwAl17ytmLPNNfQSfRC21mAqYA=;
        b=kZbFekDK8kNJAxGBKCnzsuTIBAW/2pMqauXZqLguq2D9/BBsc7mv1czJPvXy4Zt+RL
         Qz7KM2+knSlAhqgFzxUVHWmEitiyGRqNI75EX4nsbqJqUui2PAVfRdqmGyC0/Fn0H20j
         zoxzOdRWFA6PVfnhJl/hRbxwe31iDGG+EEoXEkFRuaXH9AO9oXlKzN42JeDkFsGlX23x
         qqeY88GDNK8qjCh4VnQ+ZRhQatiozCXNxWZe/Tm2sN2aZOHI64hP4Ha/a8WblhSsuLAh
         A38Zw0BFIK9OY1nKcr3V5Gjrj1/8NUcfLksPmB7SuJog+c7j0q5/lq7wjimYxsRKoL0I
         mC+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775114791; x=1775719591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsYlSXlZJpdy1ThdoQxU8mkas6T2ddqvGWar7MbfscY=;
        b=muPuwK+l3I/DuCTL93j7Q2BIu1v9HfaiUK19+rZHSXiDbi3GFHzCA/9y9af81a1aX/
         CcRyekQ4514wClUnqLe6sh3lNYSGPEnrPxlwJLR/qftGDqomDyfQ6u7WHimVYnbV7kjs
         0bbd2MCNv+2efJCWs5qMKlD1qQHXpkIELyDcbCoiFBvGKzRKzZvrdfIIW1Sew4hctWZA
         PrvPun1fpJvQ0e7wPR8DkMBwbdcj0zJbL+sfoG+muF5BZxdPKI19Juca7mWjHxpPC93j
         PxLDP1OHQH5QF+rXp1rMk+jzJuo5m3Y/zVq/o6ozgeEeSXUByvMOrJkkdzuWqkmCUbJ/
         blzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775114791; x=1775719591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FsYlSXlZJpdy1ThdoQxU8mkas6T2ddqvGWar7MbfscY=;
        b=MGsB1W6SzzpxRGnAtgYCTEKrYsB10q8h1AhOInOKz1RZabIQcP+yobbeLyjviZbSmF
         9EgRBsq038FPe18GIKN2RU8WwSBWRqzg0kAAbzRXmKg8ihnoXB2VvgkCrBCTmdAuQVTs
         hH/bdkwqYCJcflIyLhE7SXcOIZnTEJzY3fagBnkOzqNWvROI4MdHFjuQFp+cqQbymPX3
         zB42KxrhmupGTopa4TXuh62pSbYZlNkfN5ZBzoibiSaXaGTvRmntx+cmHXPBEgBldzix
         vScPxGzPKFUxf6Sby3Pf8WXdG80FpBelRyQP9Cq37knoDD/32sfwS67w5+CU5PJtAc/b
         AAKA==
X-Forwarded-Encrypted: i=1; AJvYcCX9Q3TculQ5PoydNTouDMLl/CfKRDh4pzUv2jGUF+kEijHpV49JcXv2fcOcRtgTyC6W3rI32fekwH1Alg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN5CKpgpjg/kYgJth9MX/vXDtiI+/mNTle7hzeLOJprElrqfnv
	ssP6fS0Sg5yOBwLuUCa5nZNTapvIdDnBGTK303GS9Hcmq0GZiswvMDb76D6WW2YUxoKlZHL3BY7
	/XPqd5WbXsDKrAON+dhhrcm4uVubEVKc=
X-Gm-Gg: ATEYQzyXgk1G13ZrpBfFIKIHjLyIMO9qyKNlr+vZofGrNn3noqjJ6Nh6ZB8VXC7qqlv
	8Hwu8lk72XUtSCw1kyg1oqWxnRmgENiuElE1rcvPYa/kOVyz5pzXOoKNdno4IKjHh+P2q+uKaX8
	eIFEdNVI7Ta/2W/O9MnwxjcVkciC/o14bBI50qpP3jY6kudthOyQ+CWmwXxbZQ2wm773MW/AWM1
	yXQBpB7Bj8ZaUmX0xkK5CljpK8TCKyWK5+A23kwgjzeMCNZmtwrw0sZTTIFZ/qnwuRfJfbUiGdQ
	vGIsT+E9WPt7zzrsHO0PRGKLLYKrfCZU7KOJFQ5i2I1dZiqXhfoPEPbea1dOV4JQpnXewt1gzQR
	88hpQe3U=
X-Received: by 2002:a17:907:a315:b0:b8f:a5c8:f75 with SMTP id
 a640c23a62f3a-b9c13ce0cd8mr459776366b.52.1775114790940; Thu, 02 Apr 2026
 00:26:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401170218.40504-1-sairambandikanti@gmail.com> <CAHp75VdwT7tRPhzyHdsR+WyS7-9NS9bme2cGrGfc+p4X6wykgQ@mail.gmail.com>
In-Reply-To: <CAHp75VdwT7tRPhzyHdsR+WyS7-9NS9bme2cGrGfc+p4X6wykgQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 Apr 2026 10:25:54 +0300
X-Gm-Features: AQROBzCp5fS-K4NyHMtTee7gdcJpqRAoxNdcTv8uC5KiyvPavc8H3f1QHGBxPrY
Message-ID: <CAHp75VdMJ_kNDt74bkXfLbMVAE6MKZNnsf+Z2g25LpBonORWsw@mail.gmail.com>
Subject: Re: [PATCH] staging: atomisp: fix memory leak in sh_css_load_firmware
 on error path
To: Sairam Bandikanti <sairambandikanti@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Claude <noreply@anthropic.com>
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
	TAGGED_FROM(0.00)[bounces-57924-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,anthropic.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A83DF385379
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 10:15=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Apr 1, 2026 at 8:02=E2=80=AFPM Sairam Bandikanti
> <sairambandikanti@gmail.com> wrote:
> >
> > sh_css_load_firmware() allocates sh_css_blob_info and fw_minibuffer but
> > all error paths inside the firmware parsing loop use bare 'return'
> > statements, leaking both allocations. Additionally, when the
> > fw_minibuffer allocation itself fails, sh_css_blob_info is leaked.
> >
> > Replace all bare returns with goto to a common err_alloc cleanup label
> > that frees both allocations before returning.
>
> NAK.
>
> > Signed-off-by: Sairam Bandikanti <sairambandikanti@gmail.com>
> > Assisted-by: Claude <noreply@anthropic.com>
>
> Please, use your skills to investigate what the code is doing and not
> blindly follow some stupid AI.

A bit of elaboration. There is indeed an issue with the memory
leaking, but taking into account how the code is organised the problem
lies in the error path of atomisp_pci_probe() to make sure the
ia_css_unload_firmware() is called even on the failed
atomisp_css_load_firmware() and in sh_css_load_firmware() to check
that sh_css_num_binaries is not 0.

It took 5 minutes of browsing code via
https://elixir.bootlin.com/linux/v7.0-rc6/source/...

--=20
With Best Regards,
Andy Shevchenko

