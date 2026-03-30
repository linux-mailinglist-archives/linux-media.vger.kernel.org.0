Return-Path: <linux-media+bounces-57568-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBv5Gks9ymnD6gUAu9opvQ
	(envelope-from <linux-media+bounces-57568-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:07:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 579E3357D29
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2BD3C307C779
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 08:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9AC3B3BFE;
	Mon, 30 Mar 2026 08:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rt/9yuw7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDA23AF676
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 08:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860854; cv=pass; b=UD5eq/nFBn1I2nXszk1HJDtJyPrQezsQQHLQSRyzUlAqFrq4Yy4dCPAMXHfd7IGI6Ft2U8yb8ImNecJidmb69qiszq4LkLoywUI07iXSk6FdCvsxYb7zR81fCNzjizduTetWCAHK877hwuUhn8uv+big0KHwW98MmTU9N74jwDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860854; c=relaxed/simple;
	bh=HNxM95WlIu5Lk/QekeknIKUHWej903tFP5tcv6R7JRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gm8G7SJ4OpO+bopU3BgUw/PirfGdQ1zxgG1nYAfXBhOUk4HgA2YzA1iJM54VyyOc5ME4WzLEB7w1EnnUm8aAHrP+vt+MAAoX8hYKPbU7f/z3ufqfoEKgw2tZ7RZV/TPo6HcQkpFMZGjrB42RDxij9d3Rel6WSOdTzfrgs8DAx4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rt/9yuw7; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9825ba7f9dso793798266b.0
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 01:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774860852; cv=none;
        d=google.com; s=arc-20240605;
        b=CztgvXZPtSjkZqGHXSnFERqE1oYSmBtc1T2togtGQqYNiqQnllgXa9dRRqQnvNIsqp
         n0aJjcISEJG1kopsqWKDOnmnpq13l4GO9gbRNEB1fpoK8AJd2R5YAbCZjScltYtuS+N5
         8Z0QDqcG6qN+me4BhfeGnrvFbT93lx4PC93Ovf7XGFQaA4rr4OmU3Q3WGhRLfGrXeKQK
         +hgNsNDtC2KxGqCHm7Sj+whqrSTMNMjtuOERkGtRqtZ/sWj8JdDeHYNcFREEwfcieZCS
         s20NWjHVunKXnvWZytlG2bd3sbY2McOIAPGDm2ITUB+IVt+nRS52MZhCTwXDYVd77wyn
         2dqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=28a1s1exaF1LEG4PHeiHxuwcHnnKjfA2nX9LzJwMQX8=;
        fh=TY6XzanjwuSyrCVnsJaXQbzyKams+kP93k7gkz5Jy5E=;
        b=kcjG9O5zgKUBaKxA1sXN4uRY5GX59cok1l7z0kkanbyDAJ04aOwGoBWjIOcKcAsDV1
         JRckddsCD55fN4W/rHZzoScmwsoaM9JW5AVOSRe5euvt8f65XqikBhQgqJw6954fBuYF
         rlFGXvewD93sgH3W5kunJCQbgZTu8SOq7kaOmZLMDpXEdv7beteOOs5BlU9fWKgIIMhK
         aks3KYBkp3iRxy8snyErbEolk0kSk0NZKXL0k0MoTCdjUipYUIKdPtUwJz3pqPMxnCI2
         J/vTIaRd9Lchp335rZhZ/DRdaaMcSnfVv5Ky7RtZMDugGmGtjxgR0HtnmP75ZVs/CQ2I
         uStQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774860852; x=1775465652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28a1s1exaF1LEG4PHeiHxuwcHnnKjfA2nX9LzJwMQX8=;
        b=rt/9yuw7hBZ/XFB4EkAex2+musI3i0rjDNyPNQHxoiPIS1qtRFKcpCB/NGOYhEI9aA
         I1NyBnCv4Tg+BO3ahRmQc/mCCl5SeCPxvV6J+w70M6jqyl8/Q1LLWSwb3itl9q/VUoeH
         YQ5LNvsHfKte3DJT+zbzaiuOHwyn+EgjiMEM/w79LcOYQ63ti0E9in21Dmc4drwg2EiV
         o5HP/0zugKFzo9KuPglAyApWEcRcDvlf9/tONrwbbJ2WzbAcj45mL+N+OfRK+6lcErBO
         9UtrJhaMrwyqpnOpV78fLoSR4CuFBEnzrnhg+/Hf+5327kzJhOSMB2dOCFOqrtnVv6Fo
         sJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860852; x=1775465652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=28a1s1exaF1LEG4PHeiHxuwcHnnKjfA2nX9LzJwMQX8=;
        b=PQVDMwDZrbcvfIv28jHxfaHCiyaIIzgVeaY9UpMsG4RgIYqZAwwTmLFfaJxecPkwQI
         0d+n+q3127q5ntMOmzccMKd6PFeq0qLkKrORoAiYuYL8UjAnpZ+SJbT+pAengDmn3Kij
         7ErJEEIdOnjQanSqrKcrPGa86W/YBDZ/C978A2wQO35A6U7i3CPaZYj7r28SBLmQYxjW
         61y8hr9FLaVUUQzl5qEBp+crCeUcSaCNKF5s/f55gJYl5201pmbdiSqJBThk3dTgsTkJ
         sPN/TKgQS4/Yh/1TPnO32zgLIYhp6pEr04vgeEOP+jTlAZE+N+1undbTXGbiF4gxa0sY
         PgFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV09gq7ugDReiiQNExKzvBz3a5RB8Tdcnr30bfSfK1gdwJRYF4OnovPLgclG0rxtzR4Aqk6K3j+hpkaEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyibUJc9pZ+EJxIntDFKBiGFowjv/Y3iR9Bem5Iof6EyrhCBqae
	a6M48H7bsdixchED3wsSGl36u6HRbHfE+glbJXT6BDubiqjy0hE6N1XS9LSe/mQRGfdwFIP21aR
	y9fPLUmev5bDv4klJ4pVg8RBg0iOnEDQ=
X-Gm-Gg: ATEYQzzk27fq/iMl8iIlWX0WwV6Ayp2mqW7Tp57JuoYM6zM5CmTk8nqBZeMLMwMMEg6
	tmjqbpdT1chIn5R6Y2/UTlygRvYAXk6dV2Anilz+ezh9WPaRJ1iRYXXAyEqcGC+Ty1URVzLdX2m
	CgsJC2tEOwlfmwLQSyXUQZ4QRb69HzCmGFHINyGNd3gWoYLdbyh/o4xwxWiOrLR1qIpoFqOTPkq
	cz09iNerxAPW0YcnXoWYTvdRRqYsft2mMM90ROvbc0ryopWb6zSTLKO/XPh8DYLnNSNAXBbchJY
	nbe6B25T6m0stoYtgZTufnx0zAJStBhixw6AWnHRqgui8LwLS8QEuLBt1amzPXwABuhA5EAh3TD
	mILVI29g=
X-Received: by 2002:a17:907:9702:b0:b98:654:d9eb with SMTP id
 a640c23a62f3a-b9b2e9f2a5amr819725566b.22.1774860851683; Mon, 30 Mar 2026
 01:54:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330073549.5782-1-robyserbanpascu06@gmail.com> <20260330073549.5782-4-robyserbanpascu06@gmail.com>
In-Reply-To: <20260330073549.5782-4-robyserbanpascu06@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 Mar 2026 11:53:35 +0300
X-Gm-Features: AQROBzCE--T4kUYa7KyYdaUv4_8VLHD_UIld1T5clwfY6-zBdFelAq09jqbXbAk
Message-ID: <CAHp75Vdyjr5YCoV2r2yoNHmYWL_PhXQG4CpR9d+ftU-WA=0GBw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] staging: media: atomisp: reformat block comments
To: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, daniel.baluta@nxp.com, 
	simona.toaca@nxp.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, d-gole@ti.com, 
	m-chadhry@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57568-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 579E3357D29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 10:36=E2=80=AFAM Serban-Pascu Robert
<robyserbanpascu06@gmail.com> wrote:
>
> Add missing asterisks to block comments to conform with the
> standard Linux kernel comment style.

I don't believe it's the only problem like this in the entire driver.
Fix more of them if not all.

...

> -/* this extra define is needed because we want to use it also
> -   in the preprocessor, and that doesn't work with enums.
> +/*
> + * this extra define is needed because we want to use it also
> + * in the preprocessor, and that doesn't work with enums.

You should also respect English grammar:
this --> This
define --> #define

>   */
>  #define N_GDC_ID_CPP 2

--=20
With Best Regards,
Andy Shevchenko

