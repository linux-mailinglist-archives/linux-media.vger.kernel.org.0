Return-Path: <linux-media+bounces-56733-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADpaIABEwWnpRwQAu9opvQ
	(envelope-from <linux-media+bounces-56733-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:45:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF44A2F33B4
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F395303F049
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 13:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78BCC3AC0C4;
	Mon, 23 Mar 2026 13:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwT+4rsE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF271DE3DC
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 13:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273023; cv=pass; b=cqnIe8rhM9bVt99QfI89f8KG++qfo5bcKMKfVvzuPGefokUcavF0Lcp4LBHzFyXLiHqw7h0OwzFP8FVbyBBvWQQotvD8GbIdKJeP5uqUo5QVu/55+V43hdJ7ARJMkRWpNHFD8dG1kdki+fstu2GfNmStkICBrDJIjz57X4Dv5/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273023; c=relaxed/simple;
	bh=/G6oVkXvhHmwEyhL18Nw3vuTBba+ZEuChKrvgwSjlNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RGl9gWOVCeQx9UrJLLFs1IeT8GM8jnE4OLtSoVxsGSgjmGlbbc9gZyd3C1Eby3inB7xLkLi8MbH9h6vyR4bnkW03K06RpXzlbp4GtI1JgjfFZSv+pONKbl3zg/C9IPbIG3l7vYdFmm5cdIroSyHANZp1mRTNo2GLpjI32abRlc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwT+4rsE; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b97a9f4b4dcso35647866b.3
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 06:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774273021; cv=none;
        d=google.com; s=arc-20240605;
        b=dATjlP1KVnFys+YssW6jV9+i6r1hj9EYHHFFHI8EWwys2uw8V42a8Qoobx76PglCdh
         CTbxdr/Xn7H6SW/5aOkQ6f3YdY2fObKSMNZdEGy7HfnR/VI/VAiXS1OuMtOB92lO6bpP
         4As9Q3UnCzQLYL9p2SRMH8Zb1sCh4kKqV2Yazjc3jQ6axX8PtixTowwGg0rgMKH+7VSW
         gEsXphtTZKgqjENbMuJA9En35NxPxDkkrPxoEWloWS+cPwBD0H4RZ4NWZuSk3DHNbcwM
         ZvFdq5K37q67HQ3sS12OaQkrUWts0dAQgz6vrBJLR0+3T4uKa0eBLrnHkwhZGERSEwMt
         cb7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/G6oVkXvhHmwEyhL18Nw3vuTBba+ZEuChKrvgwSjlNY=;
        fh=FtF2j7oQ9dp/clBPv+2fCKlzuNLWCtUoaOAg1wohi/I=;
        b=SMi23te3ZGEfYYyV94+HphE7hoLY6VHxUzBFpRdrjpdrzZatQW1v0wl3qmL0Rze0/p
         J3YAkGPq+L1Fh4CFpVH+IlkQ2gjnF9UM037D6Ed8RjxpUk/DaVI8PQ/aesLys3/QMjnX
         +VKfWPCpI7UQVwHI+V/wTxtFxcEUl7AK466ue91CTuFXpbUPoxl6WDe09t2JCNq1Cp0Z
         Q2occITimFp7ejLjbrIvJW3gfyVJWS4ERYPprk9Tv1/13dUlvHFunGgQNmfu/M1xXIvK
         UpowgdNWLW2tw4lydPNrbis6DAFOuIT4IkOpGXqGqPsH8SjGwJ4h/Gdyo3gl7riOVe5R
         bBRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273021; x=1774877821; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/G6oVkXvhHmwEyhL18Nw3vuTBba+ZEuChKrvgwSjlNY=;
        b=dwT+4rsEhWTIkMLyJy7BdwwCIHgfRKRV6hT6iaj5aj93zYS67Rj32NIHAZUBSPO2lf
         Sr80XrVNeGy8jznxEvZ+tfTkIIUrvTD6vZFfRseotICHT9np2BV3uj5QrK+k4zlLCY2N
         /W4CFIGkoQlrHM0wMKaUMjnkN0y+D7pfjmDp2rCcu5lfLPSltuORLhtKl8prSIZNy306
         E+rMZhToh3rvulWVcTT0nwiumo5uLLjgLuBjvk6t4KbrEewGhd0nwVhSG3MTobTKFfQA
         5QJWYiAXll08dyoMi0l+tg2ctVIiW5nTOda87SvBOXHU5yeCqhdGi9RFo1J94Cbr1liD
         n1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273021; x=1774877821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/G6oVkXvhHmwEyhL18Nw3vuTBba+ZEuChKrvgwSjlNY=;
        b=XCre23z2aMMqDjYK+1k4f44SSHW3T16w3VbiiCphv+xVvyJDa/N4GZlMD7SxiY+nWZ
         Ep/OP9MIAw6yYN9MqLzlbkk6xV6iSZnVRd3+ZjDQFqdsGdmUKWx5Vnuc6KA7e4aQgzbZ
         FDsBQETHGpPUuO8bnkU6tlKYwUUkfgOsB+N3AUJD1CXp95N0EMRZQX0KN3cpLvbOZCes
         rmGZoBiUHV/53vp4st/nFk1IASJLcrJxgn3U7ittu1bGjO40Z+CUQ1Zx5keqb5OAvBMj
         hQYniE1dOo94CoO1FeK8LzIJFMv03ariQVNndPWtP1IkK73fC7vPzztoaGM5W9sRFXMg
         b3yg==
X-Forwarded-Encrypted: i=1; AJvYcCXaq3T9FQjgLmXHFgcj7rTVDIb8iC/tCn+hB0q1Jtq125rSJX17Zlj9Y0PuD7gP7eC3vHnsCZrpQSkDbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+R7hYJ47nXIoKEJu9CT+Xi3gimu08mRPnap1enRe0MQyMdeF0
	HhMZE3Oq0j0me7gSR4MAd+jgnVSDsce4HQL+1KFuEtpADz7obHkm40boSW06YoxI+p8+9wNo9Lw
	0t1ASpH0n656/X7G+LS+dPN4hECUoRQ==
X-Gm-Gg: ATEYQzx9HoMWXfHRdur9rJGL+mQpR86xk1uNWMK5CrnBihchhz/DjCU1iIdX+QO0hku
	N0g8bP9OfiQu2x19KFFtlhGeS/ubVjh6L/lArxVNojv1wa5IhOwDpkxbtFCIq7xRxYXJeeL0o3M
	y/Co7hrSsnDGnMs69YxA5iNNJsumdTn9yh4jMAvkegrD2CVX3IXQ6PlYOdwNn4CATSZeiwDmFkV
	alYs3ULWBxq7CjBHc1hFHhvHmSKKjx81yWNvxnflzGVeucHgYAH6g/mTiZAAB1gkZzu3gaZea90
	7ZMGleCcQya9CzAUZZP42NgUmQGCbR9tsnVTsYEEWoFVqdaFkw==
X-Received: by 2002:a17:907:3f98:b0:b98:4b5e:da5e with SMTP id
 a640c23a62f3a-b984b5efa8bmr621165866b.43.1774273020740; Mon, 23 Mar 2026
 06:37:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322142506.42022-1-med08elkadiri@gmail.com> <acEPK6l3_gFQEuFj@ashevche-desk.local>
In-Reply-To: <acEPK6l3_gFQEuFj@ashevche-desk.local>
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Date: Mon, 23 Mar 2026 14:36:49 +0100
X-Gm-Features: AQROBzBtvGecoHnJqvMLYEjNSPvW9HPpt7WoD5i1UZyFuty2-6oqopHNZttB8cQ
Message-ID: <CAAMeuQTKwjVr5fKTkgbXibwdzToxjLUqLaTNKDZjQbuVK0wvEA@mail.gmail.com>
Subject: Re: [PATCH v2] media: atomisp: fix spelling mistake
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-56733-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[med08elkadiri@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Queue-Id: DF44A2F33B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 11:00=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> Is this the only typo in the entire driver?
> Please, run `codespell` against the driver.

Hello Andy,
Thank you for reviewing my patch and for pointing out the need to run
codespell on the entire driver.
I=E2=80=99ll follow your advice, check the entire atomisp driver, and send =
an
updated version with the corrections.
I appreciate your guidance and time.

--
Best regards,
Mohammed EL Kadiri

