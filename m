Return-Path: <linux-media+bounces-61927-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IRyKYjmCmqJ9AQAu9opvQ
	(envelope-from <linux-media+bounces-61927-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:14:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D9F56A80B
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D76C301DEF8
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2657F32694F;
	Mon, 18 May 2026 10:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1ZDf3kA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158AB31F9B8
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 10:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099255; cv=none; b=ixHZfY9d2GKg1V3cLQCFVBHy48fwXXaKsCdXc2P/IIPVJ0pQs4+nxt0J4IxdN1Iyq/lv240AyEBr17/zg3hU94rvJcmHU3xFGN1L7j4IIs0oDNT7BKQlb1Fd/n9jInr1oI1XqIh/iKVaFizUarRbDuZmxrAovAgPejV/f9FNKzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099255; c=relaxed/simple;
	bh=3CuHTJb7a1uf/Vt2GUcQwRyWkRY1v//75zEJ72jrsaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jAE9mAR8qBQxekIwoyy0Em4H6pQWMTwQdU6IVkRTU1oJVwX9Hq+XUHllPCvDkLpM0ZGJi67Hy+tdzWR5s7YRvPrVsXgSv0lIBUZM3xNTP+iXm2Lfl0UnnnQPH7YqV7En/GXGgvg7PzfAg+P1/cI2HxZT7tmB37UHcJa5fwyAPUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1ZDf3kA; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48909558b3aso22501935e9.0
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 03:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779099252; x=1779704052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HqBDj90Kc3B5RL3RITDRmt05U20tIBaa43CY99Xd9RQ=;
        b=R1ZDf3kABY32pxy0h+kPbdKnYZrzH+iwDxvK0ocrMzmv6o/u7R6jnvJNBjuqGhkdpP
         iB1W2mKv4uHNINJ4/JHtzaDwU9PoOKCte0Dt79zh0ecxFFMPRqapHpVfQA+keKfmXxIS
         8DayMB3M23H8ChWcpQzKj5cxBTOrA7GD1qECTci1sCGjehOqYyruEyGzahz/9HNyMIAI
         dRpw5nxgLiUc9hrvd/73CZz3dusoKm1en3BGRDHuSHotzc8LXPnDIGRjijVTeFqz9yi6
         qssw9j+pbQAZjKy7HRStnmeQzG53nx0zF/WhTSRPfs+mJDUbdUBlAoLY7uWrqoLow0SF
         p8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779099252; x=1779704052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqBDj90Kc3B5RL3RITDRmt05U20tIBaa43CY99Xd9RQ=;
        b=omu9NtvA6fr5f9KY21ayNKEvgoorWgdErEiXGTkJKainH5zjSql59PUQUSJZj0kz4t
         JWtjNv63zbaw/PyQlRwJH6MdKB+8IvtAu+AI4CWy0YTHPGbyF4GCu249K1rv+lRLA2SY
         JD1ZvN4IwDAKF7cBeS2L1kJk1vosOZRPr1u47y/CbSvq3MnIKDhvmff9FRbZQs06FGcH
         rxm1Jq3Q4JNH4sR0YTtJ6Ls1nH/5OmxmXzNQmh5fO6Zss+3nBzX52VB75g3JoNq0ZNiS
         BQmnKI3nY9cPWILjmRblinNhB84WZIwF1AWekODXTai/JXE4ymqd1R51oBOuTdG1c1po
         3t+g==
X-Forwarded-Encrypted: i=1; AFNElJ+dtFu15ltc660wZSTlQYCzFHrIQazm4wgFVghLeyL3MrW6/r5vPBl5L/a+xzqohCxWOAUwMW7FmTLlbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNUJKW5F7qzacszToD4RJEjCgw8Ffp6DGTtDiS5b2hWGmFWvMT
	89m75HpW31a8ejRADiMFnNP5UHFz8/9TkjtDjvIr8Tl+7pB8wIvpvdWe
X-Gm-Gg: Acq92OGxq8LpurKs33IOCWVY63eXsQ+YOzDxfhr+U96fN7jjeca1VV5r41GnfMTd4R+
	+RKwZRH4ePwBOah9GucZyMUY5R4Kdh1V0/Romqh4vR/pu9DJwszu3tphPavUnecRbkk8B2NuCRL
	t5HcNMmaCrsmVdx4KufrBMLgkZmx6SsUaeBfl7h7G7LdzJZUgF2mXnPkjgoHUyie38b9zhs/FOW
	kQn7EDsWmxzlvXN5WxVo/PEljueNmTLHYjA0aJsZWWuraU6jTipFsvGUTTVtcBhKApZ9e7LD7Qr
	t6of+SJSOhUvPcVH8G1GzW8unM3+h8Jp18Q+G8uzKAKacP4wYjItIJa04xG+nREHQTg14gIuV8k
	LTXLOuGWgnAlDZFYE/Ks5bgxjC94a2vG2SvJoTMvYXz88IvTlWhMY30kUjDiQCrAnZEFSLM4ANn
	ytf0cXhkZywxYWbHl2dPmJrB7nQRVA0h8u/RLe03z4YXmUNCl26lvfhbcoH9wR3Pv4LL9BUpszN
	XurPwFUTopkvcLQg+xuM250wM48uHSvNIQddD1PqkMVg6hITzPoYU6EWpM=
X-Received: by 2002:a05:600c:3b12:b0:488:b14f:b8ed with SMTP id 5b1f17b1804b1-48fe59ab80emr218398395e9.0.1779099252361;
        Mon, 18 May 2026 03:14:12 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:6e9b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0f72sm38877974f8f.25.2026.05.18.03.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:14:11 -0700 (PDT)
Message-ID: <ebf41920-5852-428f-b98a-e0f44c8f3315@gmail.com>
Date: Mon, 18 May 2026 11:14:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] lib: add dmabuf token infrastructure
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.1777475843.git.asml.silence@gmail.com>
 <c61e6d928f86f4cb253ae350272e6039faefd3a6.1777475843.git.asml.silence@gmail.com>
 <20260513082431.GA6461@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260513082431.GA6461@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 11D9F56A80B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61927-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[asmlsilence@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/13/26 09:24, Christoph Hellwig wrote:
> Naming and placement:
> 
> This is about dma-buf based I/O.  So I'd expect it to be named dma-buf-io
> and no io-dmabuf, and live in drivers/dma-buf and not the unrelated lib/.
> But I'd like to hear from the dma-buf maintainers about that.

Looking at what Ming is saying, it'd make more sense to keep some of the
parts like iterator and the file op more flexible and not automatically
imply dma-buf even if it's the main and for now the only medium. I.e.
ublk/fuse can use a similar interface for mapping buffers to the server
even without dma mappings.

I don't know how the API should look like, maybe passing memfd, and dma-buf
supports mmap, but I think it's better to call the op something like
"register_buffer" instead and keep all it in lib/ for the same reasons.

> Config option:  as this unconditionally when DMA_SHARED_BUFFER is enabled,
> why does it need a separate config option?

More clearly marking relevant code, easier to make optional if needed,
and gives some introspection via /proc/config.

> Interface:  io_dmabuf_token_create / ->create_dmabuf_token filling
> in a structure allocated by the caller feels odd.

It's minimising pointer chasing. "token" is mainly used by io_uring in
the hot path, and io_uring just keeps it as a part of a larger struct.
For the same reasons "map" is allocated by the driver.

I can add an extra parameter to io_dmabuf_token_create() for how
many extra bytes to allocate for the caller's use, if that makes
things any better for you, but it was easier to just pass an
already allocated struct.

   My gut feeling
> would be to move most of io_dmabuf_token_create into a helper called
> by ->create_dmabuf_token so that the token is allocated in the
> driver data structure and returned from create_dmabuf_token.

-- 
Pavel Begunkov


