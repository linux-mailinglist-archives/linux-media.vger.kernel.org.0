Return-Path: <linux-media+bounces-62008-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cC5MC4ghC2reDgUAu9opvQ
	(envelope-from <linux-media+bounces-62008-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:26:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C27756EB60
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BB06130275B8
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D263E8321;
	Mon, 18 May 2026 14:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFK1UxCj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6676948C8BC
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 14:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114244; cv=none; b=qHduYtDn6EqVW65Edloa3gTuAvsC9aGvDVORo43KxHVOpEzzv9aNZMG+Bgg/6sl/wzLn5gldeEHOi4WoGpcmWHIiJwDRu+P3FIpGscsTf7MtXrQxMXtmnoswHef75isCwcL5d4mjuzKGfBUrGejCds/Kczm1WpV0McVyJBRwQgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114244; c=relaxed/simple;
	bh=Ja0DTfaEYIoGmin0aywYwaWpB4UWlA4iW9ZxB9BMNMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mHfQmfgVK2QiHZwO7wsVW8esS0T4lwQhzISP9Z0a+gl8YtFx1eKpvGz9niTYZUv6NX4s8ELbTUSZIdjGwgjGqend8L07fLiSU2muB00MCEyZ0sE8ZKqqrqaKbEhOPcL3ZIebcnZBW/Kkhvjn86j0uWtexA8uX7uSx+nVvP9Mnmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFK1UxCj; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bd11a3729e8so383703466b.0
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 07:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779114237; x=1779719037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m58bYDJ543WmyZ11IWytLuY71YuFJ2Bw6ePCWpryz/I=;
        b=jFK1UxCj/9hu/WpBG5drcZwxOWtR6cGYB4ErAsxcCoLRnUmHgxSqEAMVAolDJJrH9Z
         1hdwdgmStI3zkbuwkOFKLgAduKUp4s7IUV0QrqjtVZyxKN2R7lpp0/keTjJeNXORBfRY
         iKxXU0l5N5r8xvhB9XCY4w6jrNvDuJXLhYZ9wYbjP+gKbOrmICrOApzAhigvnRrrinaL
         Gb3NRTZM32EVOdDbYX5+S47nP2KhGAiP8F7wO2/WZgTZ0Wdf97sbuXSYfnv1T9IEtqU5
         Nv1u3gHY/kqeewKzSvB0u83tg+4FS0uxqPRyB/9oZfAlZtbMwcY0Wlc9g1oZrrMLTZS/
         v+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114237; x=1779719037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m58bYDJ543WmyZ11IWytLuY71YuFJ2Bw6ePCWpryz/I=;
        b=mLnlruwf0mQBaFr1y0DsJQYySoEa3q2ErVux1hm02VEynttlIPKXTg52NS5a2sbM6w
         gp2c13AiB617lM8XzUV7FxJoqCIgVUHG2DzzEdbcjbc5bpJ89f/dGPdElV2JISZSqJqG
         BFUOO4NQni+CnCIsCnaNWTf94Xv2tx3tUNDQZz9quWD2aC+f46nptp7MufPnYfjQfOGc
         7X+JLSzgDfvMw6IuQfAxlyxfKgW6GTo44/Hanze32bgVCdI8hygFw6wFWfzG1+38L0j2
         0i22Zx1xMv0/tlj+kfgMdwatY8LgS1ZPVLXWCBY8x9nGJLZsURy6e14/kKD1gXlALS/w
         2eKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zjB9tJTssYWa6lhu753YTa2S0nufZ91vmJu/NmH2XpELeoUEhTl71UCniXgC/GCF2Ep9M6K8ba0UDbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxo5RDy6K69AvysfnQZXChR/Sljqwc2pygHOnElgzZ6mDCogGx
	2uYBIixTDW4PTfkGw3oHtGlfo2LUF9vUK2uQOcv5XM6DXc9uWjz3SrYP
X-Gm-Gg: Acq92OHtXHcAb9cEKtWM+F6EVyDs2mLOWHQsoKsWTGXGjTHlUKZr0SaOATvlrpHHARq
	dZcQ08R5I+ZjsKdbSAsI/VzBbMtGAQPZNQYp7+ELZ1D9AyAIl8rcuSX5F0AsUYORJjYqokaq5NH
	kr2kManTyO6oaWKYM1xkzPScTucBq3xUQoBAosU59XAghNF4zl/UHk0hTbAGw9z+dz4YIIqe5uQ
	Kh/wRs/SKgEXcQNZEgxqJv32W1W1qfPEGhGBt1Cm7xBRatjm9zOad/EhGFCeTKmje6xP+fukn5I
	XZnTXdFE/reOa5ItUz5TfMlH2TfP/87RJwvVh69YLyotMiJU7eph1m85OJdcrCHLoKIdJ87P7s1
	bm0pqa3pyOP2VP/0SY3klas56WbzyKMA7KATySPW5G9eslV1ALGQKHg+5zzMXgx8NBsUrSrznNX
	w2jBCRcb8m4AMj1Pc/iEfOCdOSt8xLX2QgHw80ahzGqRur+X8mrst8wVibKjJi5AfnxKmadNbQW
	17WvchEKWDhKJWs7JxpXeiQ1EuyF13zGdjx8IwMvPlNPeaIJkVbAFe+bvoEldUX75elgwLaCwKZ
	yg==
X-Received: by 2002:a17:907:c291:b0:bd5:7a3:a58b with SMTP id a640c23a62f3a-bd517994249mr821357066b.46.1779114237152;
        Mon, 18 May 2026 07:23:57 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310d58c79sm5325464a12.12.2026.05.18.07.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 07:23:56 -0700 (PDT)
Message-ID: <ea47051e-697f-4017-a514-be6ef7c110e9@gmail.com>
Date: Mon, 18 May 2026 15:23:53 +0100
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
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260518125326.GA5754@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62008-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[asmlsilence@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0C27756EB60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/18/26 13:53, Christoph Hellwig wrote:
> On Mon, May 18, 2026 at 11:14:09AM +0100, Pavel Begunkov wrote:
>>> This is about dma-buf based I/O.  So I'd expect it to be named dma-buf-io
>>> and no io-dmabuf, and live in drivers/dma-buf and not the unrelated lib/.
>>> But I'd like to hear from the dma-buf maintainers about that.
>>
>> Looking at what Ming is saying, it'd make more sense to keep some of the
>> parts like iterator and the file op more flexible and not automatically
>> imply dma-buf even if it's the main and for now the only medium. I.e.
>> ublk/fuse can use a similar interface for mapping buffers to the server
>> even without dma mappings.
>>
>> I don't know how the API should look like, maybe passing memfd, and dma-buf
>> supports mmap, but I think it's better to call the op something like
>> "register_buffer" instead and keep all it in lib/ for the same reasons.
> 
> Let's get the current version landed.  If we come up with some kind of
> non-dma dmabuf in the future we can refactor it and move it around.
> I'm a little skeptic we'll be able to share code as long as dmabuf
> is allergic to physical addresses, though.

To be fair, it's not that dma-buf specific. This lib/ code only
does some resv locking, fence waiting and queuing fences, otherwise
all the attaching is done by the driver behind callbacks. Switching
it to some memfd could be pretty simple. But The main thing it'd
need to share is iterator handling like forwarding in the block
layer, and it should be fine as it's already passed as a completely
opaque object with no knowledge about pages / dma / etc. for the
middle layers.

> lib/ is most certainly the wrong place for something that absolutely
> is not library functionality but directly interacts with a few
> subsystems.

It only interacts with dma-buf, and even for dma-buf attachments
are created by the driver. Block, nvme, io_uring are users, either
using the helpers or implementing callbacks.

Ok. Let's assume for the argument's sake it's not dma-buf
specific, if not lib/, where would you put it? I was also
assuming that dma-buf being under drivers/ is rather a relic
of the past rather than the desired location, hmm?


-- 
Pavel Begunkov


