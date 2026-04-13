Return-Path: <linux-media+bounces-58667-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKYNCz333GlaYgkAu9opvQ
	(envelope-from <linux-media+bounces-58667-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 16:01:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE8D3ECE58
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 16:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4610301CC4A
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 14:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7753CEB91;
	Mon, 13 Apr 2026 14:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPVx46mP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7AB3CAE6E
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 14:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776088848; cv=none; b=W/Rrzolj7adTieXELutUH6DiOuy682HQefS0/hXk7CbQNf7z4GCE6WRFPBtRj6JuasNwm8cBaXNOKrIAwt27sDSVLq4hKX8iltHfQis1tqCVd1EUp7KaWnLWIVKJhK2wx/uqC3kacjHrsj6vTLhhDyF2PaGj6Sepbwnakub7gT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776088848; c=relaxed/simple;
	bh=fNLyV5RZh4wx69G+Whc/Pq0irsltD8c4RoYdy7d+xwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BKjYEkZRBapoALMCfbor+LaseRGoYMAXf5Ee+FRAJJt3SiYW/YintjtZJpepvw3Kk8UVxwt0ILl8LhTQhs+A9saXBxTbcCpwYi/nzcyk81NMMURcTh7P/dzH6mxspne5rgCUrpSKnrw/9Zek7yKFVYTeZjIqn2j9kMW8MyEIduo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPVx46mP; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8acae26e564so13262966d6.2
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 07:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776088846; x=1776693646; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=17vzIRu9LWKDoVYHul0BINcHWZhdKsnTwSxfRfb16Bs=;
        b=QPVx46mPnKhr3zpQM1Gd6QwqRcE1Fl9gt9IxG6faQv+NqOC9RubWyZRMRWV1NsBXFW
         Y1YrR13c8Pr3Qeclg7NbBnEIS0G/51DX6LVeRDDCep5mMechBJgmWCqvPYB2gFcIkZQz
         2WukyFn5p/qRD7RkjkadBU7QixUDOXRcaxyfBlu53vhq27zSRe5k8LFande0ThNDONDJ
         vFUWL4V70GiDDYfrj2NXCUAPr1omsjV9odOCr9hP33wMYGS55qF5GiakfqCuXAZVzxK1
         p9HKJndeYT/32TdIk6xf2ndy3mJfYIm3TMSWAmZebWbax9bfGc2vajYYv22Z0ngsgWkE
         2IwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776088846; x=1776693646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17vzIRu9LWKDoVYHul0BINcHWZhdKsnTwSxfRfb16Bs=;
        b=CPCajPebeEIMv1FoM6lkojGDlrx/Fa1N91vkSpzu55cUhQmOmc2kivM6mhCUTwrTvk
         MbLZHIWv3aZ2gFT4Py+TGC2ySyKhX9zZ2g2mNaUIfbq6X6LgvM+ju/LV2or8uwukzVI3
         GE4gYdFhhuiOyn41B3J1Yqm29GwQaQ/nubhMhl2Uy2HMUMibKwI23yVvFHeo5dF4m/5s
         7bIp7y8nKhCjS6bng7ojh3sqD1oFKXHBh3Jli35B+bFkg1ofQ1+1iBxTyBt8Z45J3cDR
         cjdOBt0jS11N9L7P3bU6ngr7HinnyeJPKtSh3VhX53Fb1x4EsJccAA++h5eWn4d8yaE1
         7pQw==
X-Forwarded-Encrypted: i=1; AFNElJ8YZ9FM2ZaRPoKC/Sr7qWd7KX5v9Cx8/wLO0NbU1N8DH69pqlp5PCodlb32+CjaGNEZjLdbIRXzCftI3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB6ZeLTcaca55DeihyYTZ3jP/s0wS2t26HOpSvKnTkdCDydV0Q
	oQem/7goPHXT7F69xjDCrEB7MsMtZg3b1dAB6amdUV+6qOZg4RPUejw7
X-Gm-Gg: AeBDietp7tfDejcJTWehwBYN0GtTrksSMx69cPENBKEUq16kjVxizI6zLpCqEMkb2ZG
	kCQ9/K44UvNi5n/Tn40MREshYZwRKSc7D6cqTIRNlhR20sg4z45RFg31BteQbw9nNk/GYY8zuFD
	86FoFWOOWEvY0q/TvdmoENXn1TcQGYwmITjHXlA88+oTqcHJW47+5bX2xHmIb0+WhQp7enxpeVt
	0b8zbq/Cgo3J4gmfvdwT/cVwj787vLdjoyZefVD1CfeBryYEHaKZAr4yzSULlNdWx8fXz9VGUbc
	lHJZubwTqEKeoo3vP4XrXC4HSW6/LfgYOf5mgcznssGWIsT9fYE5IbQyvELPGT+nfmhF9DvYpui
	HmMfusNFxs6YGDVBcUm2Pa2o0C9ExyOjJjQbiJw1PkstRd6zzPLVXrDc8qozieZrWfv2wgEY9du
	soT7tFmJnktKdeR2praX6daTiBbXOXrl91v73ILcObNlgOCYbjQgJED6Q=
X-Received: by 2002:a05:6214:8004:b0:89c:5e33:2cc5 with SMTP id 6a1803df08f44-8ac860f3799mr187437446d6.20.1776088845326;
        Mon, 13 Apr 2026 07:00:45 -0700 (PDT)
Received: from [10.254.121.178] (mkmvpn.amd.com. [165.204.54.211])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac849db735sm117139006d6.2.2026.04.13.07.00.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Apr 2026 07:00:44 -0700 (PDT)
Message-ID: <6bf9b402-fa60-4ed9-9c36-7a1c783d0000@gmail.com>
Date: Mon, 13 Apr 2026 16:00:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: fix order of trace and fput
To: Andi Shyti <andi.shyti@kernel.org>
Cc: janusz.krzysztofik@intel.com, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 gaoxiang17@xiaomi.com, sumit.semwal@linaro.org
References: <20260408122437.1364-1-christian.koenig@amd.com>
 <adedTCplYHeJPVKP@zenone.zhora.eu>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <adedTCplYHeJPVKP@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58667-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[114.105.105.172.asn.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7BE8D3ECE58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 14:38, Andi Shyti wrote:
> Hi Christian,
> 
>> @@ -845,9 +845,8 @@ void dma_buf_put(struct dma_buf *dmabuf)
>>  	if (WARN_ON(!dmabuf || !dmabuf->file))
>>  		return;
>>  
>> -	fput(dmabuf->file);
>> -
>>  	DMA_BUF_TRACE(trace_dma_buf_put, dmabuf);
>> +	fput(dmabuf->file);
> 
> funny, I just found out I sent the exact same patch, just few
> minutes later :-) [*]

I liked your patch better since it has more accurate tags.

Just reviewed and pushed that one to drm-misc-fixes, should land upstream by the end of the week.

Regards,
Christian.

> 
> Andi
> 
>>  }
> 
> [*] https://lore.kernel.org/all/20260408123916.2604101-2-andi.shyti@kernel.org/


