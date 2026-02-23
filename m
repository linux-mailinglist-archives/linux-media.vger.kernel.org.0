Return-Path: <linux-media+bounces-53181-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rwduGFAsnGkKAgQAu9opvQ
	(envelope-from <linux-media+bounces-53181-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 11:30:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38655174E81
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 11:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A415730240A2
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683C135BDB7;
	Mon, 23 Feb 2026 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GX+4NOG3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680BF356A24
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771842528; cv=pass; b=V47dLAcPu/pEDnzvFwpeoXrLVqusstWax6VlmQlgfTjZwuouByyFrz9KF+CtJaZgC+GbKSoC/6ZlDfdbTtxJMSfJUD62Yggo91dHHlO9vm2oUpXxSQ5NZE7pNN+WTIk6yWnjY4TZIL3+leIt/Fyeswp40MhMya65E7zEIy7QhJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771842528; c=relaxed/simple;
	bh=0aOHaWuvrFRRWue6R6H8kRolCuY+20g9nCrRvjTV3fM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IkvaxQCAkukjX6+bX1ASADjbyxA34fV77Op/xj8+QcR3thfRJmLjItv8uWo7UllJ3q49SJ8uw2RDzI0E14mSv7PXAtiENXoBi9IdTi+ARvhLJDj+HF3o/cyZJrLCW+vTnePlKaROyGHyCyxyw7R6lW5ps7p7GJbHuYPbYPihDwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GX+4NOG3; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59e6253b16bso4621029e87.1
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 02:28:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771842526; cv=none;
        d=google.com; s=arc-20240605;
        b=eG5LE3+XGjRVfH9XwT0wNyQ3pR5QkwLZOWFXi37+WVW8jVQzjWlcVc7Jm0emssZkQJ
         nieK3ESKIuqPS4mKRiAtmcaR21Z4QQ0lnnXzprxu7ZxE8WqqpHPiZ8kkd2r/KaFeu8x0
         U0wJGTK0caZfshgGxMrkBFcinYDkPTRP7UN9sY8tCflcLoEukINagjwKNxKeVNMEeghy
         2lleT7lyNGhE9oxyuPoLfxwlmhGEF0qOd+s/6pCa7hHUhJpVKu2WDoaiKrt+VqWajwpl
         7jE0OhHk+ixp3tNFlhhzJZrE8I3HFXH8O1o4zM3lzhUIgiCWOZrMbHSZyAK99dZnJLjQ
         PRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8py5tNAl3xM6Z2IJ2JOjBVdlv6BkoOSvLuQWV0gF6kM=;
        fh=mDFi5RyFaGf1vOqVUf1/EbK5585Fp9tFCbi975oznWs=;
        b=jaYsB+Cl3o0gcGJWhtTQ+z3FCG4DZJBPswgh6/z6D5JziKFNxRI5kawsJFgfo+05rs
         RIq1VJB3GFUq1W1/fb3pyWwfj4oTMoWxXMG/PCAKdmbM5oE0YCOIYTL06dR1MZNUVXIK
         FgNo/C8SgP+MnD75CG2M6uWnK3nNE8+9EjL5hAlXwn8KZyIVvfhm+F03e4TZRfKBXJ5h
         z/AqtSj7qVrhOT0arfnZoA0kRYIYa4cxQKkc72tQ8hiUy0t4pLxrySj6ncbctMwj1Qs3
         0/1r7tg5jmdeGgSsjTBr5EuNW6R720S2AWjgvnVR/gHFKZu7q7EZD1YzJAvhtlZLii6T
         dAgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771842526; x=1772447326; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8py5tNAl3xM6Z2IJ2JOjBVdlv6BkoOSvLuQWV0gF6kM=;
        b=GX+4NOG3NPDI16RzB2XNFc5srRBcThCHlyF1d8usS8kLJDnKaB0SRQ+W9/jewYvvbm
         LYmY4Ttkysve0WEy0X2flDPN1DZOpUwgCLP6aT50/ZkSqPjonwWq1vCP+5nTCah4V3b8
         9dU7xDb9tLdcBr/0ztg/WXhQ5jdDZGdq6OeYC7Z37NtcWKqBZnSQAnCd5YKYcaq8B1VX
         F49cmLbFh8BuY8KiP5jDP1SrR0tLMqirclLJfdnFhBCZIrk7NGlXWnotjCCLsdxFsCa8
         lX5PbtvG8lkqK00Pk2ENB4yTpEgIK7S3xfxFPbECsM30RDbCL/GPYJwLehxHSy2PbZfh
         2UxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771842526; x=1772447326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8py5tNAl3xM6Z2IJ2JOjBVdlv6BkoOSvLuQWV0gF6kM=;
        b=qRw6dDIiAlXsCHmx0078cD7IpgobowhXyPxYdj/ZUVAfIJbKgefx7WOytrQFW0UxAw
         RV52nDmSeJg7l+dvzczj75DH3oTa7ql3lDXP8DGF5F8UG6YNLK6v5HquN30uFONQQ7iD
         cMOfFApnVv++y/tR50rn5SNMk6BPKNLQc3zbXG9rajE/g6Y1MYgMyR57IzZRnYpz5hBo
         WHLZbNRShF804Th+rBawyECNYuGRv9AwxxNpIlmFmFh54TxzZLt6DBbJI3bY3tPOoYN/
         T88JC0sJaX1ja4TzhzUkV/IClFu5lyYSKQK14vGFZgKODAkkE4gry2WQIUDUQVjk9d18
         CXsA==
X-Forwarded-Encrypted: i=1; AJvYcCW6qtqCkiK3XyS4XfNO9q5tXJKUaSc4TX+HId81dGjPMPdbvBdR0fkTPkFwROOOpMNB285aPPBymMrRsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUpLJUoZDWoDKAAdlq7x/tQRV+asWxChVutFODxmJ3IwWKJx1o
	4fNGGRyqARM3dvjr5aOxNi72KdEwjamQnFF6B16OlzP4T19OQM6UKtq/X7M0yfmNCymFKbA/PwP
	ytTWkenKTPoX0D7X4Dzel5PVe1dVcHuOnKpV61J4d3A==
X-Gm-Gg: AZuq6aLkmifeadMJlX4MQxQS2FvOqflIK89xB1YzbmmMPgcCW3MeSoImCCVh1SxLe/e
	mSwYB7nTOlBrO2zIw+/QJnkfSdsLJUjcjWKdo5UBUQifammRwJpBD7iV5AbddyzKjLX13kTAPDs
	UdgZBhqBT2s1fPXeRA1niyMEV4bIFoKiHeliknJCmtf/j5bZaazQmRUok19TwVNoRmCdDX8Uz/M
	3EmXE0V/l/Ms5mz587dbLy1w01fH11nE1Ffwip7j7DuLXGpmxxAxJt+HLBQrOri6Rxdj7gq/wAJ
	RNPBrpIIFnuJEKCRNdGP/pa28Ut4OBDIisu+iGxm
X-Received: by 2002:a05:6512:340e:b0:59e:5fc8:95f6 with SMTP id
 2adb3069b0e04-5a0ed9a1a4bmr2566973e87.35.1771842525582; Mon, 23 Feb 2026
 02:28:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113140446.196930-1-marco.crivellari@suse.com>
In-Reply-To: <20260113140446.196930-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 23 Feb 2026 11:28:34 +0100
X-Gm-Features: AaiRm51OBeI5xUrrAVqZfBI0xjoXJ_-YyEq9iSFx9LcfY5ZExzMVJEGNpOh343A
Message-ID: <CAAofZF5BL4ony740iB-jiHZqoD6YX9b-X8PrpU76C4yzXBjT+Q@mail.gmail.com>
Subject: Re: [PATCH] media: platform: Add WQ_PERCPU to alloc_workqueue users
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,ideasonboard.com];
	TAGGED_FROM(0.00)[bounces-53181-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 38655174E81
X-Rspamd-Action: no action

On Tue, Jan 13, 2026 at 3:04=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
>  drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer

