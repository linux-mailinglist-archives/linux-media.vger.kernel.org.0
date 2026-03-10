Return-Path: <linux-media+bounces-55211-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLJIMtM4sGlZhQIAu9opvQ
	(envelope-from <linux-media+bounces-55211-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 16:29:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C646253873
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 16:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D00B3026B65
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 15:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE283112B7;
	Tue, 10 Mar 2026 15:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aLfTq5gT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392952FD1BF
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 15:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773156557; cv=pass; b=MBOabtEjnUffJndNINg0JcLLvRZElGFNE2zWPJFR815JNIiT0xkKJMU0opa97lVOBsPAufRjSeFwjkyEgGKfAi4TKWcgnkQapybln3ygvgcu2VdjfaYqr30X99XaowOdEZ2oBTC4PiFUpoTLenMG6+PNW6VyxmNG31ZU6Sr+PzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773156557; c=relaxed/simple;
	bh=zIiWwFMgmclSsyKUbL5OghY1eU+rJVt+C6uIngJuqC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OayN3kytyhLtGxXL3uXei9j2WxZfGkJtK6ibiIPprjW/kZ/7+/L4XdVYdI2teRi+CC9IYD06v81kdM6nvwVGXzk4dvDDFB/PleRHESQ9TdV+H7SQ5OTgaNKTSagin9lRJxGXXzbH9+9EHglJ228U4e0s2EahOEWaNY20FOdhxgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aLfTq5gT; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852ef20fe8so75155e9.1
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773156555; cv=none;
        d=google.com; s=arc-20240605;
        b=F3EZj46WTGjHUHo2fdDIKyiknD6UFJHr/h96v5Fhgv47mKKXYgOGcVfbW7KfAu7Ewr
         woh6v7a5gHyX0Y+IJERDLXEl9KIg+aW+9k5E7j8RI8Zs7w9NbUtPNsU9wq7ZGM5QS7W6
         H7xbAzkDqaN9NQw9rK9l1xIBBdQPChKyOtbcYpqyjlp10gp6s6t5sJubOCjJEusW7SAf
         hEj0U7ZfiHGy8Qnngzru+diCdIOkdjrcTPwsXPYs37T7R9nri7ugw+hW8VtAf/MH0X+O
         AlR1Kx+1Tyc4eg976a0RBhSB6G8evp9zefCl0RZvu/zYpx2jYsiyEv5Z39rBDBlT1Eiu
         O4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zIiWwFMgmclSsyKUbL5OghY1eU+rJVt+C6uIngJuqC4=;
        fh=V6GyNyjf67gokDhiK0CDDLd/y02lP2CleEog10gy2DE=;
        b=VCqsbTViwoV3E24u7Ym+nRZloV4EeNfahyegYzVhNTpLc8ihQIlxe1iqssMnmFUnDL
         u2WSGkd06j4zWyxLl+JZLcSlosUvVBh8EJaBdwE2kiLz/z9ZhEURO49Sa9yXqgBOD15c
         f6Cn37Sr/8C0z6VUYFwn5+VNKGd2QHMI9FnhSgVktVFT4gRq+KI5oMBXhQvR5mU2w/zH
         idI6cPANeOoRBgghE3+xK4iH60rOLWf1EXfAXM2OWRtztFFSLIeFyoURDqhfr0swVOdM
         bPvlFbd3/5hbhOxCd2AQ4ahMzFaM03G5mAegFtoEsZR2kGCfJN79w9+HpHrgL961ZHD9
         UiIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773156555; x=1773761355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIiWwFMgmclSsyKUbL5OghY1eU+rJVt+C6uIngJuqC4=;
        b=aLfTq5gTppVXkbPdRwF7zbth/5Duh0xITRBRQGe3ngKUVB2mYeY8sffpJQpj8a4RuF
         mZaogF1QgjGKOSTaPpTubaYXR5jpx9/XWxJwws6aBPAtkTsQzqD1HKe1BuFTLx4a21WQ
         A1ReW1QGiEFxbTrOtcg6lInoDp4NKEiOfv2+olsb5BTe/RrylgMJwzSzZzBrGLCtwo4S
         cgngqLJ3/dsZoRdrxBiwY8LWi2GGIH41pBR3EOT/uSCIaHzesE2y6iECECFSD2YpQU3Q
         TVlsEsEBWcS/7Emm0xQKsEiRvckiAjnUl0budBjF4nw6sZciPTmLRZg1w7bWzjQ/hseY
         aiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773156555; x=1773761355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zIiWwFMgmclSsyKUbL5OghY1eU+rJVt+C6uIngJuqC4=;
        b=ajxUyHLgZ7qfglbdPNWLKdtX9EBeGIGarWzss/8qpEpnNv2kBEVPvIs1IxJHOdSrQI
         uncjs83opVHcam+HbGNHf8sm0qebaCkXPGKYf94MgS9zfFkUAhnHl4kiY7Nl/7aQcZ1X
         sJi4QIHXGIN4pgFnMjRtV7p8vTSO9r0qpoM4Ua3BsrjEu14qBN0UU0tC2l+XHUO3sVjS
         ZGkmUfHooFjUOSbvoy1HCia4VU37f0eFKM1Dnrs7HVb4t5ONN8II4QYObfZCgDpGh3S6
         VKZteLPfIuo/29PilyYhTq/3utlJjOZvmfVclIhle44L8EsOnUwj5nsy93dxEDLCnn02
         aCIw==
X-Forwarded-Encrypted: i=1; AJvYcCVs/vV0tBj87GZLlDkEOVMahTuAJzM2ZdxGhROe3BGODlcj29Ly272UThrnciz+fW+FiVeC5v7iiacZgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaYYR1iAKLl97iXgiGu0j5SH06bGttCD0zyHx/7oWyOCaq/cOP
	hQZAZF7qPYXfgz7Fb33uFXV6kUYEqtNtDyW4yhRh1CIh9KiT2cjjMEw/H7dUVKDkIIVOfMPSe0x
	MDhLcAVBsbUj0zYcvBAiD5hNs8/L84ykUcSob+GW7
X-Gm-Gg: ATEYQzyl4zcfbvlXMQX3rZBxRetZbwRWYwwNjohnoscrvsfpSrF06Gkj9B/HRBUIycT
	fVKuY8fFxB371LrTVi4dHEvr6skfCUA+gwJs8OvEJH40sdFjhdi9elgkR9nfyusLrYhWn1RK9ff
	vAwV5kgV8y/94RdEgr6odUF3PyuYuzW7+iLkk9T6RpYQ6zMbSlBRTL4H6VasJjJgjpakY036S+b
	iMgU9A/+0k6LgOHXGBhFre5Sq2sMxjwL692O4XuE2JTnM7dTUp1NI8n+fnpAKUGOr3/kyb7NX2X
	LX8pVuQJxkCtrt7JMZ0ZiHWhC+G9Ez/de6u84g==
X-Received: by 2002:a05:600c:1c03:b0:483:6a76:11a6 with SMTP id
 5b1f17b1804b1-4854368e59emr1089915e9.5.1773156554348; Tue, 10 Mar 2026
 08:29:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-cma-heap-clear-pages-v2-0-ecbbed3d7e6d@kernel.org> <20260310-cma-heap-clear-pages-v2-2-ecbbed3d7e6d@kernel.org>
In-Reply-To: <20260310-cma-heap-clear-pages-v2-2-ecbbed3d7e6d@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 10 Mar 2026 08:29:01 -0700
X-Gm-Features: AaiRm52I43ALNUPu6gwaVYUD5_lwue7logMuffJ6OYtcEMWpxfloG1qbQuiJ490
Message-ID: <CABdmKX1RFZJuvRtnebPzQDs-8DVEK4gzVa=V8LAztmCG0Cicqg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Clear CMA highages using helper
To: Linus Walleij <linusw@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6C646253873
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-55211-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 1:53=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Currently the CMA allocator clears highmem pages using
> kmap()->clear_page()->kunmap(), but there is a helper
> static inline in <linux/highmem.h> that does the same for
> us so use clear_highpage() instead of open coding this.
>
> Suggested-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

Thanks!

