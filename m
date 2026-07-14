Return-Path: <linux-media+bounces-67575-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wnb7CFZNVmpZ3AAAu9opvQ
	(envelope-from <linux-media+bounces-67575-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 16:53:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E11475617D
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 16:53:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=iuDjeDZI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67575-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67575-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DE99305B160
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 14:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774F248B37F;
	Tue, 14 Jul 2026 14:49:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9152048A2B8
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 14:49:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784040545; cv=none; b=mD0VyeVOsb8/wBF01m/id5w5beUkwbPfjqlxLVeZCd2ObAlqU2qGqzcUqJF456CV7hlMvCUfOGxgzB4NdCZxWOC56ic+HhFz+jTMDO5Iq5PSTeMTIQseQGiwIizASWuc6Ihmw0nr4x+4Kniz3jylyqoAFRVa6KFO9F770EazTfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784040545; c=relaxed/simple;
	bh=gPBEjdyji6cUpDbtJJ1jZhYTKfnTZMFMevK4TwfqdxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TkSPGTi4Xf4B2Yrxj1hxfIwXOw/ArbrkUlHnjYSHOk6a5tdRbHtTJNZW73BAvlRkHfcN3xNLV1cmBZY5fXjG9h2aZuIRyQojC3Kf07TR94dRntrF96lWbxMy5Abod3Zc3O0e7dDQupLfvsjKHOpqbsFCCO3Cny2WV+Trg64rjWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuDjeDZI; arc=none smtp.client-ip=209.85.161.49
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6a30bcadd95so546368eaf.1
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 07:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784040540; x=1784645340; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k8/cdwxu0uottieq8qk96CFsJjE7R/FEoysB551YuTo=;
        b=iuDjeDZIcNYP/fWTTqqHJzNq1FJh8DG7W3KPG/G9oSPuiiuzh9lskbAioO73wR58ct
         zPQuyUkZWtFkLDrYalhsjCxJBkx9KwnB1gkWGfy7SsxAoAwzKcWHm8K+VKBlxfOTp0Hq
         DR2/VX34uLMl2d5TXEJnFjbf/MbJAfZIkP/YFnuDZX4/j7KUL+Sk/OcGk3SN1j/kaS95
         6+fyqnXnc1c7d9UN48rorZkY8e84X85YHnzuHMF9ZAvvCUrieHH504nrMzxq1IWi8ucc
         lmS0DX+vrIPjryAqwUzJjJwDdvlsXab+ITzi2MSOCa1vh1zmXa0qtZX0a85NlyIL7fl1
         YTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784040540; x=1784645340;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8/cdwxu0uottieq8qk96CFsJjE7R/FEoysB551YuTo=;
        b=TiDLiZQmFNKxQ4IC8ltoyp9OGK8wGw4dDBbjMBtwrAbzohzHn/sQS3RC/8mf8Ut1pZ
         wEGh/UHhyok+kM59VOcmItwi9g1lHuY7GGXK8mI8FqTDCrtIW06FDQa6tSjr54A1z6tA
         MQCtPdppS01H2TnirB/fnAy+UtSW9FOvvoNuVslA6BI+jINVHSi3fBTGbkRkaalu9fxn
         QcV5Kr8p14sEY1+CZJrkQkOixGBK1ItJxilmqFd6AyQInf+HBFMV2FEydmsKL6KVdyUs
         opn5VOPG+sip63zTS8NxRyYsdXW1mTuN72S4Kc69Knj4/Wxnf3dIw7SbLMqv2YpL8L9x
         aG7g==
X-Forwarded-Encrypted: i=1; AFNElJ/lV3N1vRVtrMHKtPd1stDwpLNNAdyHLQ4paPygxywGFlk3vwGgb8mJtQGuPnJH3i5grSbXEixyRIVisg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Cq9vpG1HTuCXLdoQW+FOU3mM8P/atQ4VdGht3LnU5bu+kGQ5
	iGCDDPNv3E3riJ/8Keme/XM7IyZarjFJm7ItwYa7pQoM1QwIfm/TD9sB41QWY5EsQhk=
X-Gm-Gg: AfdE7cktUkv44idOpjKZgSNUpRE/NoX2e7loTyqovALUvdlu9ZBLSjFAtMbAfexEpnY
	qqD4p1NL7khyXoZL9MWib5oKbEWCBs2BeYPv32Gl3h4KYHWHoZZhXKPuef7PCcfHVY6OCuiHWzg
	oEGX4j4DHKi2SP05SVj8rdKSAIFAnnLPhyRqBzeXjiUgNzejw/m6na+0dK1VvgCUr9wlxR8LSM8
	rHjEc9lMTwJKXRtVu8O4W+qXecj2LiL5h58lx5DDmgvHIHiNBcbmXXu5YSyDNe/+KfdFargrbiL
	1NLbsCQAf3XOj7mZnUmh0ARKgUNidoE5fTKJ5L3ZEK/WSchvTXd/uUsQhedU6X+3WZED6Aves5i
	1Y4gwFb4ehLg06hHUAkdYKTsn0csuhtw+EYnWYNiPUP3DpErG60BC+/wcrr40Z/r6AFu71TVP/q
	nOQ9rT
X-Received: by 2002:a05:6820:81cb:b0:6a3:73f7:18b3 with SMTP id 006d021491bc7-6a39be39be7mr6231360eaf.23.1784040539847;
        Tue, 14 Jul 2026 07:48:59 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a37b58f98csm11294977eaf.13.2026.07.14.07.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:48:59 -0700 (PDT)
Date: Tue, 14 Jul 2026 17:48:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alfie Varghese <alfievarghese22@gmail.com>
Cc: neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v2] staging: media: meson: vdec: propagate devm_clk_get()
 errors
Message-ID: <alZMVMH5t9WI3iSC@stanley.mountain>
References: <20260714140458.1276-1-alfievarghese22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714140458.1276-1-alfievarghese22@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-67575-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alfievarghese22@gmail.com,m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:dan.carpenter@linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,stanley.mountain:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E11475617D

On Tue, Jul 14, 2026 at 07:34:58PM +0530, Alfie Varghese wrote:
> vdec_probe() hardcodes -EPROBE_DEFER for all devm_clk_get() failures.
> This masks the actual error code returned by the clock framework, such
> as -ENOENT when a clock is not registered or -ENOMEM on allocation
> failure.
> 
> Return PTR_ERR() instead to propagate the real error to the caller.
> 
> Fixes: 4f75e7dfa6dc ("media: meson: vdec: add driver")
> Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter


