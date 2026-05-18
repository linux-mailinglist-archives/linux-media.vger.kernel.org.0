Return-Path: <linux-media+bounces-62000-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDFmFnQbC2pWDgUAu9opvQ
	(envelope-from <linux-media+bounces-62000-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:00:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E3156E371
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6FB6302A187
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB90848A2AA;
	Mon, 18 May 2026 14:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOOc+c5J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8934D481245
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112800; cv=none; b=EOlLVh0O7ASp0xSYT2QJjyhNglhj0Pqe6hGt/oCwYfJ35Zp+/gG4SFFK6Jr+bwOClU2MGNeby0ZvQZhXZ997rU7Az+boF9q6F87Geua8DY5ckRnjQCNLrUnX9grUq3p1qgFqWshTD7jx6ht9labBSMmY5WBp3zZrGu+e6jbQd6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112800; c=relaxed/simple;
	bh=MXTgLfPj/f1h325rq7FWLxCdh3CeoPcDyvJ5aI3aWzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n/BoOFEXdBnv7qVQ+iczN2UgYLihbzdPSIqpQ1WlJaQdRTLm5ntYsRg0FnkdFHqy6tMHeCmbRE+B48GQxonVzwbrC7ttkb6o//r6n3DcoNAVbfbTswzo4V/fCMBYZJINhbbEOgIzZzvvSNWPW6sFGv47YhX8rjZpcxxepJZ6OKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOOc+c5J; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67b32c695efso7118970a12.1
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779112797; x=1779717597; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+WT00WHtAu4WqCgP+skKdKZ8K4Rq+JbbmW7SvyUtdIs=;
        b=OOOc+c5JDZpSmhka23oYEOg+ROkjXJVULMzl2HVHv64Ntjq7Dh8Yd7RWeENxZo9ps5
         KZUQpoIuFMqYgZJmDwjQxwB9VWa7YEtiEWSD1JL3PWwpiwM+iGAcC9vmq8YL+1ZFZcnk
         Pw7BriH8opyUYq0yCxYVdVr4gRcncSEPsnVSvWEQTvF3Gm3bMk1b44T8BMKI9eX9k7Wh
         kk2zXj+9okLSUDZ1fQx0DR9R826qiAdQVWZvZbkPFV6XY3r/jAiok7Jt+DEyvjUZCL3C
         JI8b1ADQtCWzvtZQ+TMmSzNjjvGM5O4y9DKH7WJ0ngBwdJT37RxaXUC/saca5NI91v7m
         2kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112797; x=1779717597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+WT00WHtAu4WqCgP+skKdKZ8K4Rq+JbbmW7SvyUtdIs=;
        b=N2/1XXgWUXm7VQMTd/DqhAQ4TrwldsPSwNB4f/fF55tQy3QWqTee46IwqgxBU8T72Q
         rp1fiRkm6DehwTiIrFqpj2Qs2XABwRgkUR993vmxcJQBpwVQxO2pY/sMJAXeOlWpoY2w
         VhxaIBv0fuCMUAgHnaHTqX6aKaI8h9Lo/yowlh2py+3Wd2rSciHhHx4+VtpXmUREDoVX
         1O4LAQ0QBX9A/gbaxfYU6iaWvEmtzUbpGLgds6BzoU2vKFvYBZMabmzsas9uLXAwWgBl
         rQn1W5SkoTxM/0IMDHKcBZ6D351kgmaVTh/QeMKMjB/IqT5KukMkkHH+mkJ84bQ9ASGr
         5d3w==
X-Forwarded-Encrypted: i=1; AFNElJ+QppdyxO0K4k54JEfKD83wxRWMpvqWuyhVXQCC5luWdPgBoneWaCdl8qic0GKNLzAPwu5mT6mR9ndytQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0TuPxcCgZzXP7GUMagNAdTT4TqS5jbSq9m9hAMF6i0vad4R0E
	vvOyJ0P81cpzRv5/8N2cWbOR/XELNxXPjG66yKTOeGN7mAVNhQqe7I6J
X-Gm-Gg: Acq92OHGtizVOJoceF2/FnEbMvqTlIAkJZBKr/wP8bob4Ht76KnrDtBr4HFngMma+Zf
	6QIzt/UWe0t4VrMzKyjJFgVlLQlvVs/Se/y5gGJj/KZ6sf95ZX3q3HNpRHF/ySh7n7k9J6/dZV8
	vjZ/q2pCSdaY0YaZTZGUbS3rnzYfC1MC2psVH9/0yYtWUhgVhXaP7f9U3sh0LS3cmLB80hzMBby
	ZgrE89myEqIxhkJRQde6g57DNPaWXu6EzswSsp1Xiu/Ck+0Bs8c4LyF/H45uxyu93mzmoemmo+X
	SvKyNxJ21LQpctfHtXRGLkZzpsrIfv3EObebcEuvCUf5PiTAiTkmwBmFgCG7JAO6LgxiArxgX0E
	xuLayv/6/7aVn97RRfoTzxSOk/XARV9fApK5DcjylYMDVJVMi+yCpteJp71fYxknjIxQOJg6QNX
	uGmHCm5/yaFo1yIU/OEMlNl/DJihDwCXeKQrCzjDHHowW7i0k8CWbqjH78txQSB9wC4u5Yv151/
	gqgdnJhT3O3GspnZQN8LiBLV9H0GGUtMXQ0ZQM4TjV7EGs3JJcgZoBxW23u7LrnhPldg8Z0S6Ua
	SViKvLaSaerL
X-Received: by 2002:a17:907:3f1d:b0:bc1:7da0:21 with SMTP id a640c23a62f3a-bd4f34bd0e3mr858876966b.23.1779112796524;
        Mon, 18 May 2026 06:59:56 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4dea94bsm565057266b.33.2026.05.18.06.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 06:59:55 -0700 (PDT)
Message-ID: <166da921-77bd-422e-85af-ef67d6fccc42@gmail.com>
Date: Mon, 18 May 2026 14:59:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] block: introduce dma map backed bio type
To: Christoph Hellwig <hch@lst.de>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Nitesh Shetty <nj.shetty@samsung.com>,
 Kanchan Joshi <joshi.k@samsung.com>, Anuj Gupta <anuj20.g@samsung.com>,
 Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.1777475843.git.asml.silence@gmail.com>
 <646ecd6fde8d9e146cb051efb514deb27ce3883e.1777475843.git.asml.silence@gmail.com>
 <20260513081929.GD5477@lst.de>
 <24833f76-2289-4859-86d1-9215b11a1258@gmail.com>
 <df697a76-c700-4908-ac08-a47ad07e0796@amd.com>
 <4561c621-817c-46be-8ff0-0b557f6c819d@gmail.com>
 <20260518125713.GC5754@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260518125713.GC5754@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62000-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[asmlsilence@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C3E3156E371
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/18/26 13:57, Christoph Hellwig wrote:
> On Mon, May 18, 2026 at 01:40:18PM +0100, Pavel Begunkov wrote:
>>> When that is really a performance critical path then you can use the likely() and unlikely() macros to give the compiler the hint which one to prefer.
>>
>> That might be more penalising than placing them in the right order,
>> and it might be fine as it's new and all that, but it's not a clear
>> cut as it's definitely not created to be a slow path.
> 
> Yes.  Whatever the caller is using at a given time is the fast path here,
> and dynamic branch prediction in modern cpus handles this really well.
> 
>> TBH, not sure
>> why we're bike shedding such things, is it somewhere in the code
>> style?
> 
> It makes reading the code annoying, so it better have a good reason.
> Now for a single conditional it's not much of an issue, but these
> things tend to pile up and then start to get really annoying.
> Always write your code the most straight forward way unless you
> have a good reason not to.

For me, having the most common case first is more natural and
readable, but I'm going to flip it just to avoid spending more
time here.

-- 
Pavel Begunkov


