Return-Path: <linux-media+bounces-52307-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AdHCWADhmmyJAQAu9opvQ
	(envelope-from <linux-media+bounces-52307-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 16:06:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BABFBFF71C
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 16:06:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C729D3063B74
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 15:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B360278E5D;
	Fri,  6 Feb 2026 15:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h21RnEhN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC14241C8C
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 15:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770390208; cv=pass; b=qkKs51YN8KhABc9s7IVDbU3kfZpuAKcDbdXq/6JoIVyyyjgLR8wMPjh+AlvlRVqFp+FTFeufZlm7l+3Rim32NJiUhEA3dKzwGszLPbfUEyHrs00r1qAQtdphJJAyZ3cc0dnwR148T38z+LDhN7Y4weRQE/sSzU7UPSMrqgUAafs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770390208; c=relaxed/simple;
	bh=2r86Fx4ramj4tYJizidhOVEFXq0HJLOP0RBDUmIE1UQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n38mBhvBuNK30osTeCp6nEdBGg3pZguczl7Fl0zkPqm9NhBAIO1y/aCd+BGhUNv4iG498397duk/76rW5YGGs74FJHEW7NmlZq806TyONVRtNNG74vx679K/qur6Cd6QelpGnbP69mLMFN79WT9PgS40zQ1+GrZhloZXTdWiMWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h21RnEhN; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64b9cb94ff5so2908129a12.2
        for <linux-media@vger.kernel.org>; Fri, 06 Feb 2026 07:03:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770390206; cv=none;
        d=google.com; s=arc-20240605;
        b=afkTXo1wCMs+7PqoIkSFMm9dXYG4eOaZAm85SK9y1Beh2XM84y0w/ZJlTljkYAUfpF
         dDccD0zNJO9jkbEFZ2FsswdvIM46UPBbG8C/SuSlvHJK/qC1/ZhzP0UGAkQFMlUMhzW1
         XTLO4ZJw9s8r+2ev/m4+SyRPJMtMWnJfIPA0uAVS1iCXWATvGyyDNaC3hsgTZvcIPsuz
         X55Ccz3lIw40cEtTpekUltpdbeMGK+Tl8fvlq+NN108pd7wHLoksYz3oN1uyEfM6V3sV
         PuZXznYcYXxti0EZHsG4Ki+TgfP9kqu4vDE9r6URutF1yU9oDYFxs6NHKBVEJ/uJSuO0
         OV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cbNYgILYh6T0L6GkBJIakhSOuBf8eodDKh7A+HpUyVc=;
        fh=7ciy3YC6ApFCsGUyLvHP/69A+mLPDQV8M6r2zchrs9k=;
        b=QH0Ah6POmJBYO+jvPyWpaovbkCDX4iwKOX6AcpWz81nMs+ad7mtHoOxpZDPpONO9lc
         9EyuzjLWKnT2GsspBpIMTNY1zD0qOIjHCeG90UZ4ah8AOZZVvAAWSCdpS4ZZq/Hyvte9
         gU842GD+k5azGYSkXNSdYIIFJO3PguvdFC9izHx1lLZiuhPf2BH6uaEmko5K0imZULLY
         KFwjECkNgY5xT/1+DwUCps/QBxbL7MuCIjFPwtbz9i/S2v6Eq1qXaZDNmghRY89aMTsO
         LoX8K51wBVy2jkzEnZf+49HWme/xqlGRofWO26fhYUKCm5AnGzxcPlt4YTJjAlahmyun
         QfsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770390206; x=1770995006; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cbNYgILYh6T0L6GkBJIakhSOuBf8eodDKh7A+HpUyVc=;
        b=h21RnEhNnb9U9nu7M9xtGxoq26lZ7RtZ5y8tnf++MzxNIeR/zoxGlSz2+uQVuNC9PZ
         yHSw66h35LTh51liKBCVsnULW4SPHEuf3U3wTeDKQ52JocVwVDTH/70Dh7mmfY/61EKi
         obOtto54jhMqGxzf20TJdO7GQMozHonKh+1T6BstjMVN2L6xeZt3DpF/An/Jz17SRps4
         QVoXKTvxdLczce/F7XPYXkx4J52KeOvNUOcWW4JH0wDPPqiEOL8vVaajHSrUH0z8PxHZ
         wM4ocik+fMaMfkWZttzhB2VxtImFzKbgvs0BU2fr408oAXoUxpQ6YQQbx52KCmkVdQK2
         DCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770390206; x=1770995006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbNYgILYh6T0L6GkBJIakhSOuBf8eodDKh7A+HpUyVc=;
        b=ElnjzQPwi5w34LKQXRwDcmstYuwdIHqR7ItUkVbranFHNFIAYnPtB/1as1NSWoIcuD
         XAMIBLC+8LhQ/02Q0ZZV2B5uehC4kaNP8QqBAPtYGpcU3ICOshRDgKVNQu4seQsAN27a
         Jf/IB9/D9nNmjKmPDKKKnvCTUnpyMoe/TTHRnLO37Ti5VscbZ30FfDyOPAS19roFxFOF
         XlEhUQAmAIew3C7fxSZPvoKbpGQRXuMAKOMIhYOoaPRiRddovh+IMzapMFVjhD5VYOTQ
         WLD4+xY87Bu+Cdez0o9RBd+2Fg7M0waXfnG2ErasRWdeXaSMhKMsQDr/YfsBjyqaeC4I
         5gaw==
X-Forwarded-Encrypted: i=1; AJvYcCUeZQBBAk5s9P+qco6a6SW1GCJGFFMNvs+Mz/rn7QSPRnWrbVNhajrR42MmqUVWOO7xZmV5y4axj/j4mg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx34WzV9+epkWXwMq62Ey+GWFcwdovHygNR9pg9uwuHe8LqJNyt
	W6LvI9WAWvLkOBDTp8ulgp6AbFJkTA3HaZ3Y4AvpltY4Nixp6zVjHUSewgQ7ZCfOlj5pmd2zvE/
	tjmO+pJ5bRn5FihbAsA27Hh0INDEl6Q==
X-Gm-Gg: AZuq6aIiEEv6bMOwxXXE691PGtohSzGkuoIkgoECKxH09Sf2QJ2oICgzRySV3doth7m
	Po33YghiHrAa1kIAAGNV6S/kj93RkpgSoIp48nT8OkWn0Kkwp4wFNvzdvfjLB87R6bJqxbTsSfg
	U0vJamgxQ2sK52wHhkWtlU8OdZepJ1enKU10yVKjBvH/yBvWPErRXH2Xj9s+y9QiN/45kzAGzSZ
	XVR2tfPdm1beDF+X+O6C1K1T4nxctURrRbV5TV8zyhYXc6H9r4Hl7SIaYI3D9abCRHl5rmSAxFq
	iFwmjb8LCZ8bxlEqv8zZcjWfAiVwc7Fm2AdxxyCOvq4Vse/e7CbAoM9iUg==
X-Received: by 2002:a05:6402:3583:b0:659:4383:c491 with SMTP id
 4fb4d7f45d1cf-65984193946mr1569160a12.33.1770390205748; Fri, 06 Feb 2026
 07:03:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763725387.git.asml.silence@gmail.com> <f57269489c4d6f670ab1f9de4d0764030d8d080c.1763725387.git.asml.silence@gmail.com>
In-Reply-To: <f57269489c4d6f670ab1f9de4d0764030d8d080c.1763725387.git.asml.silence@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Fri, 6 Feb 2026 20:32:47 +0530
X-Gm-Features: AZwV_QgZhDOY8h13FRDtMZqnV6_xaqir1VOWq2MTchb4BXyrN5R68VQhosU9bGY
Message-ID: <CACzX3Av_g5g=ssfSjHzkosEj7DMU=+xY5fpdU-zYGYc0cUWPSA@mail.gmail.com>
Subject: Re: [RFC v2 02/11] iov_iter: introduce iter type for pre-registered dma
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org, 
	Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com, 
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52307-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anuj1072538@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BABFBFF71C
X-Rspamd-Action: no action

> +void iov_iter_dma_token(struct iov_iter *i, unsigned int direction,
> +                       struct dma_token *token,
> +                       loff_t off, size_t count)
> +{
> +       WARN_ON(direction & ~(READ | WRITE));
> +       *i = (struct iov_iter){
> +               .iter_type = ITER_DMA_TOKEN,
> +               .data_source = direction,
> +               .dma_token = token,
> +               .iov_offset = 0,

nit: iov_offset is getting below too. can get rid of this one.
> +               .count = count,
> +               .iov_offset = off,
> +       };

