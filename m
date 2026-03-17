Return-Path: <linux-media+bounces-56049-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kC9QCXRBuWnp9wEAu9opvQ
	(envelope-from <linux-media+bounces-56049-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:56:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B51922A952D
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CEAF30D1E65
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D463A3B3BF0;
	Tue, 17 Mar 2026 11:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqtZeSER"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FEC3B19C7
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 11:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748272; cv=pass; b=ejatO0Y3nHMFXYxtA5GtBVE6EQmNrvo6fr37gkikl2cyjY9ypQmuCi8tgwClDW9Zygk/O+7oTZIMkScHxPjhHUmgpRFNZP7lJjkSvEnPDnNfhzBvFOvu1Y40Uv9XY+UrUxLu/U7rphBIA/rsU8Oq40l/upXrMxu2ELJND5IN1z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748272; c=relaxed/simple;
	bh=8eDL+Y3X+8pX5273rhUkUH7wXXTl5oL/fIUGWdNBy68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bk5ZfCGS3R5AX4P86QTael1SbT6ql9lSBQ+2qJeK/coh9GHJNxgqktzv2R0/8udAAE1zpgBoHIC54Fo7BCfv3NoT0eCvUg6xBAcjAyNn1wF46TgDldMEOo7MpdnPcakNY3nIcXgskfA6kggRs6Z+P3WpPxEIMWtv6wDjBs8zWS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqtZeSER; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79a2ee65171so29649797b3.2
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 04:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773748270; cv=none;
        d=google.com; s=arc-20240605;
        b=fPwKLv9fzXaCWfY82DQDy0Q0pi6QY9VCTR3i7k6GcfYuues5mDBDYBXUgVzH4kyDqt
         PQ0PnBqunb61ch+AmHDumze9SDwZsSQ/AezhvioqLnTUq5tSBihcnOBonTQfpvV+xnIN
         ZndmNE27joH7lHoGP4Y1s9wWTfTuL/Lv4otqFuN3rKSyFp3azGjSrof/wK5IxK4wLHh4
         jmMf/QF6RLa7RbL7TLbGKEYCe3whC2+bAzikutMN6gdLWszNps/FOHNfWcGWWoq9bu9m
         +hpZxVy8deax1BvzmiopzUegxnJnOpNGwOBVUL9tZcE8NKvrCe/ULj4ULxjHUCRjhr/q
         1cjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8eDL+Y3X+8pX5273rhUkUH7wXXTl5oL/fIUGWdNBy68=;
        fh=jr3BGX5L0+OltfguqfpSBmkWAIeG23PKpM3mC3I92Xc=;
        b=BfaBMvcNHUyanExtoI2B11Oym9SOk8PhzongrnfDRFglER6R793RYKrqJfr/88Q18p
         UhQgMLgp0OhKWZyAFaHJV+PlgZF/ebxlZRNDvuq0xZAJYB4X0EJrWG4BtLCUxuEA4mA9
         HhaaCzPJ6wU76ukhquQX7V5ARA5RYRirrxzEJiG6Y7Zkf88cMNH0cgBDw685wUksBgzc
         L85U4jwMxqOsijNVgyvcnc4DNxt9jizV8wMWAqBRTArN1LliY21b3W2+eKxDgAMMKieI
         QpWjerDv5lHMg5rOW3Hn5+p0HcT7b5YquGWFwIavSxyPgPIaTssUXic2w5kPNQsIDeeo
         kUew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773748270; x=1774353070; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8eDL+Y3X+8pX5273rhUkUH7wXXTl5oL/fIUGWdNBy68=;
        b=RqtZeSER+ucRq8kOKCF3oo6GP6IPdnxJdj3b+ciU1pzTcfZABBICM37VGv7OFNoIJY
         GBWidtE/VOQoESqa0elwOiwRiEll9kJgSaRBiQw0Rxa4XHMmQFH+WF60oDEr2GhPhtu4
         PgiqDgiEfg80eSk53BzEqtUaaM26Ryi5krSGUe0AWGXn0mWDnmzL3W3GGPcGimQOrI8B
         Jm+eOE00a/DhZIDX+VSsV2YUGk25LswIbqtvhmM4KWT0dbfKLihOOaQ85lPNIfWZQC0Y
         XTIFey9QnKk1ijUowmv6X1eoE0qYXR30CQZGKFo7/YsrJ8ufHFcMuaqXS59J7YxeMQHT
         yPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773748270; x=1774353070;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8eDL+Y3X+8pX5273rhUkUH7wXXTl5oL/fIUGWdNBy68=;
        b=GeQf9W8js/x6uUapjT2fKWCajv+PomgWM0GFt4RR0t7GbfeseeToXgJPZCoIw0p0TI
         v/ANZ5DciVCRq28IjNmrQ7Pt0PGbwBQ9PP1j3H6hS1UTiWz5ykVKYz60J/wRtIHSJ5B3
         RaXWuBrwuPz8//LnW5Ev9tmxF3WzjtbciNInHj2q6Kmz2jRmDlETt79ySuq6+bEQy1fl
         vklQkSaJEyqTG0Fmjcbi9QJOFAsmQSXUkqXBrx+xtRI4TolQCdUQvgmfw5Jqh3PAgbnP
         C/KOxNV54UuaOeusNn5Rbya0KU/BQybHFnUChAonFOz2NQPuhtKwAukG5pnw7l7MRA9S
         heWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT7v4BN5YwC57cjXS0SbUYYIFZM+koCpkP4Ezx1KFtOnZO/KFzHRppfZINZYWK8RVFPCCTTvlKOz9InA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLidhK9tLQEsNPIgul8zmDBQDI0HEkJpldd5AYuxVRHf+KpfqM
	yj8/20n5AAJxBO+qmMpmfssK1FRODenCAPDwan8Rfm6/bPNshjgYDOe0cxeRo/O/q+CrCdETMhG
	jn/KYOlG9/C9tBzzn+avluHxMAc8hj90=
X-Gm-Gg: ATEYQzzu89O6qc2qKKGGy3mLCeWmcESdVVo62E//agiu3GIr7TwJTGC+3qTjNEkWvJv
	N/FuJi5dyq/SoDZwbsxykwmEdT9F2xu9io7p3w/eY6jKZg1yHTYj8YoDj79bAwatJsVQ707C4hw
	dwnORcfFba/mI8/rO8MiZk7jwSIihXLAGGEDNHu7Hq+tAohoa2ohgdPaTkQa21+0ZkAiwVt6Yoj
	0ktjQK+UDP6ALG+rqW4zeg2O8BEuWplcgoCtj7ZTEIIlTjD19CPRGT//CHrmRn35jKwMRRBPeyv
	XyW0y7i4Kw==
X-Received: by 2002:a05:690c:389:b0:799:23b7:5680 with SMTP id
 00721157ae682-79a1c129452mr172898477b3.27.1773748270287; Tue, 17 Mar 2026
 04:51:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310203646.8869-1-rayfraytech@gmail.com> <20260311170423.13157-1-rayfraytech@gmail.com>
 <abkJ0TOrtMR4sTjd@kekkonen.localdomain>
In-Reply-To: <abkJ0TOrtMR4sTjd@kekkonen.localdomain>
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Date: Tue, 17 Mar 2026 12:50:58 +0100
X-Gm-Features: AaiRm51nstSTvZRHkOW1q7xv4ApowkamlBVcycD_uIs-L5kwFIS43Rz_nVyUzjY
Message-ID: <CAJioSGd=7LoMA2gTNK_6vejtjfFJFwHvnh76Z7EYowq8MVQqQw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: remove unnecessary braces in
 single statement blocks
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-56049-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rayfraytech@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B51922A952D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

On Tue, Mar 17, 2026 at 8:59 AM Sakari Ailus wrote:
> Did you write this manually or generate it with e.g. Coccinelle?

I made the changes manually, file by file, using Vim.

Best regards,
Oskar Ray-Frayssinet

