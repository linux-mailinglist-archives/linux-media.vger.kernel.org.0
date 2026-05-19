Return-Path: <linux-media+bounces-62104-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNDSKugXDGrrVwUAu9opvQ
	(envelope-from <linux-media+bounces-62104-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 09:57:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D72BE579884
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 09:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 25BB73001CE7
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 07:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96973DDDCB;
	Tue, 19 May 2026 07:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ks1aaa+s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0463B19D9
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 07:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177339; cv=none; b=dwH5gz15WcUbWtSfjZkN6QLcooLk+uyf/njf6k3codsBLhWJCSm7oAl8OOxNIvms9/Tdl7dfZsfG/4inbSWPajgrCFLkvJoriqTLEAtr4eYv3BNa3d+Q/um2BANxIXaB30n+QGevloznOSh1jBLo6gP6/rAHR/hr4p9Ulmegfwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177339; c=relaxed/simple;
	bh=MXBiZ/wthBntpSi+XVh/5KZUGWD1ymfLzKpiLi2B+50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZxbntN9+1RtDHaLbmZKC568C91nFoTh3cjtpsxZsHfuqp776HEFwm7dKVR/w7gy8vrZVfdlDUyW6DuQIbRc8KuQjvU7F9rofQkq6dYW+PFl958dmXtHJwx1VPbjYBlJR7Dx7K5Sk3t6n2dCIwEL5kDo3czUEvZ0zjl+5+g/3SjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ks1aaa+s; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso22860965e9.2
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 00:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779177335; x=1779782135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a/lqih5w8kOsHKdyaSXO9SGORGhwE1abTlQDwvsKNOc=;
        b=ks1aaa+sOp1IU4Gt4nMoXDYLCXD3Mx+MGbDkxgF8grRjAcwSob1Qq/k4toYk6mwLeV
         qoEL9iT9F7oFpcFmcO+ka12sKKyWyymSGfBm47llOR7KuUZ4EyRJBO0cGW9IQunqoYtw
         D2U5DyBoASaN5/xXTiSQMwJjMBgh+drWKglYcIJ7eHQ0mBqVANk+svcqRzgmxR87zZs+
         VgzkEyi7wlvf+Pe7YnQnM6SMSw6nPlH6O1esy7/oTVXftAKeiccmv49bvoyPTYfW8u89
         c6rT6f2ScKw48a6OOo73lL9scxd4NYF8QO8lTGKzXhKvvHF1KGy1qtd8ESF65fOoDbuI
         KGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779177335; x=1779782135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/lqih5w8kOsHKdyaSXO9SGORGhwE1abTlQDwvsKNOc=;
        b=JRYt2U++Dl7KyDepboxTC3B4Z8YtmHW5tRau30CsazUVEbP7DAZ3dTLf8/uSSGdoLy
         24/T3JCEZAj0tv5n0X9OoKS9hSh1EdoeChL3YJVNnJgsx8WAA+6cT+iFApAbmNFCD9c0
         buVgCFl/bzZ1/SDjoeDGUmJYgJg05DZEetPVDq/QVuGHEaGE2DXTIqMCralqP0R8aoQ4
         mY5QfUjAQvy0teSemAZSa3WYgNHbhSEHn0WKfWpmhdpW73JDUjvUMXqtyWy6pU9GryWh
         PFIDhOOwvgn+JqXmGNM8/4zMxKeHID2uqTOWwSNGxTbld0OD5An9nJIZQLpSABtZ+9En
         Pr/g==
X-Forwarded-Encrypted: i=1; AFNElJ/U0FaeVF3Q/1Kga3eL17OwUUS6HnywX3Vt/kdWV9Cjh6Tk1QYQFlwldvQKUi5wvxADKJSBHMZ0g1y79g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpAUMoIGxerEYnSWzOBSZ9k4NWZ0aSlpjX5I5Sfu8Jorj5MBVX
	6PV5k1F0/iguU0jo6FFUqWkpc8xF+Kv05Uveuy75EAHrLPu9mhk+SadH
X-Gm-Gg: Acq92OGf0qttCx6FB3dp674Ajlxt+BWfs+f5++/CyOAuvvr4LengYOwj4ix2ZDl7aWF
	UorKdXnu5BGqOkyFcyNFqdtTL52XjTIeU/OFnvBaHQJQjp+ncPhwFc1uVHjjO+SjJRxV/CYGVC5
	HLo5lsz1J+EF6Jjq2ciZV2HZ7uKT1DAo2/nTWwrZCfyCogCDITOiFvLRdbJvvBGOw3xupdzbxwZ
	Qxt3hP+Tvv8YILPqydO0WtEQyjyHFt4NvCsu3m5O+cUUDxE8IkyuEIRp5rid1+/lmlIdbPC8jIQ
	8JnAE6nUt0UATkJXj7+VMkLKUCtBf5+DSC/A2AqKzeywder91naUDhg0KmydaL5gUh8VCGD1Ono
	lRP6w1WoShDmekyxDulas7rDPQw2CrpHvGDMaYONgwk0EX0kYktRWphWet12akVPPUSi5iMZmkJ
	xtNHsJIsjMLx4/p4SmPLxw03tekjWFG2HHV6XlPZw3wjOk/WAMrna6QpRSg7FDRHm/6iqhT3vsP
	xzCOWIkv952H+Ab23Y6A4Pgkkk5LeiGRFCDnt05iUKUCRrBfvIhE3R8zJG7HnO2jD7mEhzVrKkM
	cw==
X-Received: by 2002:a05:600c:470e:b0:489:201c:dc46 with SMTP id 5b1f17b1804b1-48fe60ea590mr265981195e9.12.1779177335066;
        Tue, 19 May 2026 00:55:35 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88e5asm329088665e9.6.2026.05.19.00.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:55:34 -0700 (PDT)
Message-ID: <9933142a-4ce2-4219-9574-73da30edd74e@gmail.com>
Date: Tue, 19 May 2026 08:55:32 +0100
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
 <ebf41920-5852-428f-b98a-e0f44c8f3315@gmail.com>
 <20260518125326.GA5754@lst.de>
 <ea47051e-697f-4017-a514-be6ef7c110e9@gmail.com>
 <20260519065653.GB8173@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260519065653.GB8173@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62104-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[asmlsilence@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D72BE579884
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 07:56, Christoph Hellwig wrote:
> On Mon, May 18, 2026 at 03:23:53PM +0100, Pavel Begunkov wrote:
>> To be fair, it's not that dma-buf specific. This lib/ code only
>> does some resv locking, fence waiting and queuing fences,
> 
> But all the dma resv/fence stuff is pretty tied into the dma-buf
> ecosystem.  I don't think it would really apply to something not
> doing DMA at all.

The point is that those can be separated to reuse the rest.
  >> otherwise
>> all the attaching is done by the driver behind callbacks. Switching
>> it to some memfd could be pretty simple. But The main thing it'd
>> need to share is iterator handling like forwarding in the block
>> layer, and it should be fine as it's already passed as a completely
>> opaque object with no knowledge about pages / dma / etc. for the
>> middle layers.
> 
> But none of that really sits in the current lib/ code anyway?

It's about naming. E.g. passing a DMABUF_ITER that doesn't have a
dma-buf would be confusing, and then it'll need renaming at all
layers to support the use case.

>>> lib/ is most certainly the wrong place for something that absolutely
>>> is not library functionality but directly interacts with a few
>>> subsystems.
>>
>> It only interacts with dma-buf, and even for dma-buf attachments
>> are created by the driver. Block, nvme, io_uring are users, either
>> using the helpers or implementing callbacks.
>>
>> Ok. Let's assume for the argument's sake it's not dma-buf
>> specific, if not lib/, where would you put it? I was also
>> assuming that dma-buf being under drivers/ is rather a relic
>> of the past rather than the desired location, hmm?
> 
> drivers/dma-buf is a pretty natural place for it, I could not thing

_If_ there is no dma mappings, drivers/dma-buf would definitely
be an awkward spot. Just trying to understand your criteria for
placement, let's say of a generic buffer registration code assuming
there is no dma-buf involved at all. Again, just a hypothetical.

> where else you'd place dma-buffers.  I'm not sure how hmm has anything
> to do with it.

Looks there is some confusion. It's was meant as an interjection
with an open question, I didn't mention the HMM subsystem.

-- 
Pavel Begunkov


