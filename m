Return-Path: <linux-media+bounces-58193-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGb3EEQa1Wli0wcAu9opvQ
	(envelope-from <linux-media+bounces-58193-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 16:52:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 795E03B0662
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 16:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB9983051B46
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 14:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F662DF701;
	Tue,  7 Apr 2026 14:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jO8sk51S"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F4D3054EF
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 14:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775573218; cv=pass; b=mAqyRNSmKAYRO4fnjOCMuFjCvr5+nCF9YnukHEMGjAnvQ4RCvnWw/CrtMkWjhL4gPTnHeqk+ENm6Gol11NNSIMsDxUsd09VScEtvhlQgYSK5VwFyr/da519gZUR4UHSEMeeMJ4Yh+l7aWaRKZxTSNwh7H6vLzhIOvZRk+wyDANc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775573218; c=relaxed/simple;
	bh=3Cnx71gl60criqRh+/EmGRELRaf+tx0+/NasoC8ft6M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HzaRKgo8TGJjSRi3eWkNj/oNhrpCvTmE4AFIlpVwYcyPiNoW1/ZD3MwCsxpyPohd/1CeZT94PlpLiu5c9kZPz0skppQBipUrnsc9etxS/G/LnyNbWoqYBfzyGuGqx9/FD3r3oVCH/nOyNBSNJxKAFUkXrDK5oN3APZghT4nQm4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jO8sk51S; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso4739622f8f.0
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 07:46:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775573213; cv=none;
        d=google.com; s=arc-20240605;
        b=SeiSgBOmMqaBvUgznok9dyk0sb8P+y05uUgrJDQRbtaOBLn0NOZa0sT3nHfnA8SQFp
         z4DPsk9YQ0ucdNbl84+UMdd6WNyeU+Fupb21BoAdP3S317DkJyFPMW+NEey8xV1lA+yP
         xu7KWkUvo6fJp2SD/NtzZtXxWqbAZ0swlntnqEkXUSKONsmAcLtRQx4qxzd7/mnKOkYr
         z3TDv2u4W9jyJvi1Zob/k1e459kvARGEjOtQuPzJ2QrpnGcCdQnGkCcGfZfg+bXtOZdv
         49ke6DrhyBf9gAfgIbCRAJKyZzaWF7Bto7GiS3MGQ8u+8lm2EPif1q/pqGaS7yxAl71y
         /Lzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3Cnx71gl60criqRh+/EmGRELRaf+tx0+/NasoC8ft6M=;
        fh=mBBE/VWqrbiUlr0Vjf3FceErINPR3dHvFHhzfg+jKSY=;
        b=YJydSZGXN6VnJwVrnn1ysuyt3VbrzL4GulrzN0FFzK6jc4RhEZfyD6lelZe1KNEzQi
         TP6PI7xKtt3ENEe9Dw4kjQzg9NefXkERV0m4inwEaW3+Z1Vm7rRHtsNdSG8MO0uNuyqt
         Af4ln5HjLU03k1kZluPP18UsRQt71/4Bc0+KIm3m5k3+ZNfH1yVciW6ZL4baruUsyDvu
         YWuhdHsonhnfpD/qL2VHmeCxMjwDzNuLavrr5ojksx2CGwa6w9YXF9uA6nonKOKHsEp0
         t0b4PKdCwwtyPXyvm3Gn49zNjJYc+dLzC4l9+JXuS5WJRMjnGQCTbvTdCzz1CvxoP5f/
         c9KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775573213; x=1776178013; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3Cnx71gl60criqRh+/EmGRELRaf+tx0+/NasoC8ft6M=;
        b=jO8sk51SdOIQbAJ6+YmrQ0o+To7n/QHmcyYcTykKjw/EYI+6QAAfBjCE9TJrBEW6G3
         Z5jChK4FrqrPMqOAcAWjdQA/Ldqe0JpCSeOuhOYFWAMbx42gvx5XrtOV6H+uSE5fQMof
         6r5tWEjiMHP6QbNmLllLAkHoNPpXI+B5oIEZBvJM38TbjsJxDdwljGwHZ7+SRpO+P/5T
         bqeTqBOWDrrEY/Bii+lg3XZZUzGOThig/5ij7wm7L4pv8KAxHX9FyNhldehdDP0vm2v0
         /nk5N3EYMEBno9YB8F3SbmUuOByHTrH0xKJGSmOU+kVmvUqbHxCA8YecCrA0xpmTjkpn
         biEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775573213; x=1776178013;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Cnx71gl60criqRh+/EmGRELRaf+tx0+/NasoC8ft6M=;
        b=EwEKsnDZk1DGhvJzY0KpfT96q5cd9Ce4XTqWgcn09MoyS/1MfaQm8cQLCthog1l+8J
         ngNik+Z6t6Z7qCs/Xz2YDDVuESIMP4l1C9AksdE5RWqhWVfJTyO269OU8iWwR68LrQBV
         B5H4NzeTEzbiSfgQMWXXwIJ9/g2B4OkQzuMCj9Mmhj1l0Qe9cuSWQqOIqE+f4lOsRlHA
         3sKUDjLC1Qbm4gUfnp08sQmhdcRI5FPtpP+v0OdL3j/WxeJ9q2m3Ep3gOrbkXJgmCoXt
         j2NTmUxwPwqin4WT2HWUS3PGgKpm/bJ/NBc9ECpzdpWTzoygZI0WhE/kdjuy6ncGlKQc
         ONpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTPRBwpsbGPDH80j2vdGXfeC6D9Lh2Ob9AGNaHtIOoMbb+JQ6sOXcFKrv26bc/VjOA/OvggQ8rQx/Qkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YydjRRbTKktK92qH9ljmWH/WiAZY7KEJnzzP01i5LazKMWqg+eq
	2vTNBnvUrXD0YnrXK6lLAEVojcIfEsDiu+axeQjvTZsC3MjK3dy8cP225PMU/gWFisIOtH/bsrA
	0ZrznrOGahRvqE0/dD0MMNVm1vIcMV5W3tTvSxvU=
X-Gm-Gg: AeBDietglTLpTHyKgA3PZ5XSkBBbMceJ2WphOYalluhlHMRArgw/E1yvmfdWkbXaKtI
	Gw/tDd//Ua3iKjarnhBpSCHT7tzuVJhAZUr3/lfr2yqL5U2Ij5+RTOdYQ3z40mCF9rxJuLrWQzz
	TqUkvOgB2Ojpl0Ii1d+dLCoGLZU7+mLMOZZuqafSXzi3W4xw2KZjztg0cNeZLmaEb4zP/qXTaxl
	8u6fu+g50ENUVvL9bmhWhWd1Zw6iOTWiCJhK1gKWSxMHWafn1ghFVxdWh2xm6k2S0F7U2zPHq2q
	Yx+MTdiSZZyoOeXe3OXJEGU53tX/JYCjK/IImoyKZ0zEJVjXwGIoyvwqta6qDFZsr8g0uFsK5kk
	Tb05pwbhtsgUbHxmMDtr1jwUZC+kGiBRYc1bI
X-Received: by 2002:a05:6000:1886:b0:43c:ffee:ee95 with SMTP id
 ffacd0b85a97d-43d2927bbfbmr26716584f8f.16.1775573213177; Tue, 07 Apr 2026
 07:46:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Tue, 7 Apr 2026 16:46:49 +0200
X-Gm-Features: AQROBzCcgtjlQ31v9YNz445uL8yl3kw-1JhuneAShdXjcufJcizxivNqJRSZBmk
Message-ID: <CALoEA-wrnqUM_5hDGUL1xJi3crf64ApE7fUrb2_47xVzhBT35Q@mail.gmail.com>
Subject: [RFC] staging: media: atomisp: change copy_from_compatible to iov_iter
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-staging@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58193-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joshuacrofts1@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 795E03B0662
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andy

I've had some spare time and looked at the copy_from_compatible function
in pci/atomisp_cmd.c. You've recommended checking out the korg1212 driver
and patch for adding iov_iter support. What I find strange is that the korg1212
driver already expects to receive the userspace data in the form of iov_iter,
meanwhile atomisp expects a from and to pointer along with a boolean
whether it's coming from the kernel or userspace. My question is whether
you meant this as a local fix where I'd use an iov_iter in the atomisp_cmd.c
file (maybe separating the functions to user/kernel, since I don't
really like the
passing of the from_user boolean) or if you were hinting to a ground-up
rebuild of the underlying atomisp architecture (which is definitely a tedious
task, looking at the source code).

Thanks for your time.

Kind regards

CJD

