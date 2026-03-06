Return-Path: <linux-media+bounces-54829-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JBEHkgaq2lNaAEAu9opvQ
	(envelope-from <linux-media+bounces-54829-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 19:17:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2449A2269DB
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 19:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40AED30A08B6
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 18:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3FB421A0E;
	Fri,  6 Mar 2026 18:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BDqqKVXC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3CA36C586
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 18:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772821031; cv=none; b=UV64Qd9+8VF/196U9D1Q82YjBK4y+wbsRgkbwier0qvnzML6p2VUdxGN66qrYhs0zM+tP38nT6fgd29bZa8QYmdNCXryr4+SH4UZgZdPph/Q/ursouwa9Ka2x+o4R7yr4H40BYF5WDnxeVXBBSSUw5IB1SDRIDI5wNr/7hAUGlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772821031; c=relaxed/simple;
	bh=tSfUI3NJI4sLf/nmJL25/P/qckWuIbQ2wxSW9jiF/QY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Td4a4Cd+c3SMuHYQTdXty+0ETAyZCIHuQ8MRGL3yzH1WwAYMcOgyumaFdQnFR3liuYK9TxBimcrS7GTcpD0prd8TiXk82T3nfmHSrK7AjVU2AyPuJo4mh2Ssbg3/oYk4yAF7kTsim6ZQu7qH9hmFD0MFTAuqAv4rID+e6IgmhaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BDqqKVXC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48529c325f0so4367225e9.0
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 10:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772821029; x=1773425829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JKhWB5WYBOgtNloQxw0BE+V1Qr8Hll+qJ9pU1AjFn3k=;
        b=BDqqKVXCRaRrNa96j7ok/jk/5AKDKairm2dSXvZiesFXPu53lv15uF0sKbq/i2ZTIt
         fgzHHeOzl1BpmPcIz2Q/2skgHsPw6/CshJEJjQFv09FLBHJJXjSUAE/fYHUa/YS4N87j
         Tg0wQQoev1bMnzq7ssU/cnWSD66jo5fij3+OLv6xeL8o1Xsd19hQ7IEkq6CjG/hut1HD
         azGxtm2TJ/pkynJKZTzg/a5Diahw2+luGGY8nGR4Q2LGRj84xJnAtgicwERwt+OOWAm3
         32FxHRwbdLBdgt9pBho6clooVUyF66UDNuoof+mJzqhWJ8Zkg7E3WnX3r6qFOXChG4OY
         d+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772821029; x=1773425829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKhWB5WYBOgtNloQxw0BE+V1Qr8Hll+qJ9pU1AjFn3k=;
        b=eUJfLrxudLjQsqGzlr1IrDZDnpaONT103JwwFxNbnxHnXza+Mj7uV2lXfnthqrEdUA
         JcdDdzUh9JpQq9IzSpdnxzFj8E4enh74iYjmt1Z2qaBHWUSka1uAs0vYs4CC/Ky6FLpk
         tjVX3niYWO3jnSYCf+nqgsc5mNpC1CNd5aezSSUbkMkg/EWR+eTdipB9lR5w6ie+P2kH
         rTcQjmLnwQSoZmH64dOI7U6sVZN4ZR4m44D9FmROD/JMbGZ17K1AEBuK5YXbzUGJcLWB
         pL3hGHiWeXO7gLm8NvVoixBM3LF4THL40Kp9rMzoSJ3xoZCPwXfyKjlzjOm2ygB99G+e
         ZAww==
X-Forwarded-Encrypted: i=1; AJvYcCWDRfP3YZUz3IdjECVfa6Gwhzvv3w9ylJylleVqkT99gKkHmqkqpEf+6YHRCnKe1oTg+dL6yFbFpNFNrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiKOZ71P6mn+oc5tPtTTDFcsJwtRG5fOSqiGAT+SEGTmTZ1Hbt
	AQdWEnr2v+7YoSjsZ+6yoXNMD8bHolCNDpKoyOPRN45cC5MxV4tThRcNIw6F+pTKTUE=
X-Gm-Gg: ATEYQzwQAWdQfNTqLLq5p0haqh159lym2SEU8acuSGsFqBT85vbehrbfcDypkDySq+e
	ONldKo6MRDzgueMBOCmuyV4LNFLq9Y77BvLwD7QGpAUydlfWG1st28IPWdd4mhs0eYHHpK6LPnN
	eKZ2zoZPXvu2H8b0UU1HNo79W63ApjID+j0p1PojRg4MJcZbmZQQcjkKWUqXCo2sF+wOOjCD1Xu
	9dKZxthl0hZAqUZTaE2X9JCI42/dh9Sewt4kKLrIxHvpIGzVxGopZtpX3BVml5SMqGEGUP/oBZU
	bQQQzFlG5q/EamToqR4rKfyfDbpD5qyYbnL0jjSlLrDta296yhGE/y3pk/8+uBQRFgb0W4E8pYX
	BJkZzTqzY9bC+cdY0YTf01gg3PXPcJcDxMzzLQDSkhZ0APXwaFw0/TCujGTcnDsoS2zSDGW89mW
	V5kRH154bx7MI5c5RCSUJwuTx/NcQq
X-Received: by 2002:a05:600c:c088:b0:483:79a6:e7e1 with SMTP id 5b1f17b1804b1-48526919935mr46682665e9.7.1772821028821;
        Fri, 06 Mar 2026 10:17:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a20sm250849705e9.9.2026.03.06.10.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:17:08 -0800 (PST)
Date: Fri, 6 Mar 2026 21:17:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Richard Lyu <richard.lyu@suse.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: staging: ipu3: img-mmu: fix sign-to-unsigned
 conversion
Message-ID: <aasaIXvtS36ke9f_@stanley.mountain>
References: <20260306144307.670648-1-richard.lyu@suse.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306144307.670648-1-richard.lyu@suse.com>
X-Rspamd-Queue-Id: 2449A2269DB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54829-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,suse.com:email]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 10:43:20PM +0800, Richard Lyu wrote:
> imgu_mmu_unmap() returns size_t (unsigned), representing the number of
> bytes successfully unmapped. However, when the alignment check fails,
> it currently returns -EINVAL.
> 
> On 64-bit systems, this negative error code is implicitly converted
> to a very large unsigned value (18446744073709551594). The same happens
> on 32-bit systems as well, although the resulting value is smaller.
> 
> Return 0 when the alignment check fails to correctly indicate that
> no bytes were unmapped while resolving the following
> -Wsign-conversion warning:
> 
> drivers/staging/media/ipu3/ipu3-mmu.c:393:24: warning: unsigned
> conversion from 'int' to 'size_t' {aka 'long unsigned int'} changes
> value from '-22' to '18446744073709551594' [-Wsign-conversion]
>   393 |         return -EINVAL;
> 
> All callers ignore the return value, so this change does not affect
> existing behavior.
> 
> Fixes: 26f5689592e2 ("media: staging/intel-ipu3: mmu: Implement driver")
> Signed-off-by: Richard Lyu <richard.lyu@suse.com>
> ---
> v2:
> - Added note that this affects 32-bit systems as well.
> - Clarified that all callers ignore the return value.
> - Added Fixes tag.
> - Link: https://lore.kernel.org/all/aarQeHfQuq20gXH0@stanley.mountain/

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter



