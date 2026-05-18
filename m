Return-Path: <linux-media+bounces-61917-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAq/IHzaCmou8wQAu9opvQ
	(envelope-from <linux-media+bounces-61917-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:23:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 816FF5699F2
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 43A43305F1BC
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493723E5A15;
	Mon, 18 May 2026 09:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFnLsH8T"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DFE3E3DB6
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 09:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095485; cv=none; b=rs0/f4fPcvjoUhldo3XPWZaoX1lZFPnnA3x4YDel177lLe1ARagPJAvP9TDK2R8NEBHe+BgK2CPkVJk69FEFnwbyE/Dj1tDgsrdQD5DzH5iiBPs+Aq6Rrbnq/iZnVYXOyXnBO7FgpMD3bkKTFgbxikqRWiQWw3uxXdVxCd+FrVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095485; c=relaxed/simple;
	bh=j5e+A246+gurA03hzDlo2iGh6kM3EeFHUQqmWGHP3pM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LB8i3FgHvgkeuZOMIkfqehZjw10M9J4oSZjFSq5D/wFWdF29xFVWHqCzIjXg/ug0Xyvnp3Mhe8h0VMRI0kQu0fNRvTq/oEHOWc6zWxjlssHMyK2drXKK5G2jMJ5mt/2CCu3qYTGR6+4x6vLhSODB5HTZ3Z0vrgiCx1xpOU8gB4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFnLsH8T; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48ff4f8ef0dso22966595e9.3
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 02:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779095482; x=1779700282; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RUPmegXaiRoLRWLvDg/ljmtDOi29ffNPo2bGfVCm61A=;
        b=BFnLsH8Tg26vGHAXWv6a24uzDk/Tpsulz41kzt+ZbHVOS9jEJvDyKHFb4y/hIrGdYH
         kes4rZjsp0TtpdR+RR7r3VA10Ae36DyUop1QmyudUUJ/fRvSIWPbwnpmM8EisvWxXy6C
         9EoP+nckTPN/CMfo90C8CypEw5VBq6rcoxJpav0NxCVybJpvSqGmeFZtDWKp5l1kSrWU
         CU88bdz6bdSdqOc+Gz8iJR1ImMiAmshF1ag3ov5OTx7Qa4a8cD0z1NILcLL6hE4nIE0H
         dufH0Ef8666pMpPh+N6cMsvAjvj67rlrEpGrftKwlBIY6eOiL6RoJvIoBmpWd9Zbn3A3
         EaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095482; x=1779700282;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RUPmegXaiRoLRWLvDg/ljmtDOi29ffNPo2bGfVCm61A=;
        b=Fn5VHiTFS0di/4u7VRRDlTEiTSRSUSQSJmIjACcgUyb+Ct7R6lhxFOAz8zaxNJ7L7d
         V+UPvjGnGCYXV7sKv0z+YvIlup4tLLLJk8c7A5XW7eH189W8kd3ajyvsNTDx7fa8lT33
         X1RQ8GWlVeEiwtn0+aC4fHAkMpisMLNff9TkrTQ/l73+2Gu8zxe+jt2x4sqNz7zD849j
         /tXJzqcTiiLRd3HlhShzD1QErX0mdNRJbVuiKWGZvpa2piW+ImGTg8peV0RFVz9uRdv8
         KerK+Cl7EVEFM7tOJelPZl4YVAQLDQwPTuovicDU1lWf8JZorK3ZHs/rK9YBBVVViVWn
         zplA==
X-Forwarded-Encrypted: i=1; AFNElJ8ReGGZbNSwny59z27xXspjTwg8lWtKA6ACk1QpPBhmPZlBk0crcNbowmgihiZEqGkTV/KH9V+Whl2XWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyFzleKhWxkvwO7NiagfQRF6E1jHcoV27MzQa0h6ojgq1ay1DW
	SNh7JeDTunoelIeKRAeLF8WYcsgf9O9Or0nOEcXZScz85b6h2S/a0+yH
X-Gm-Gg: Acq92OEvTZmrvvB1cuDx4afzl0WqRp1rW+O26bC2usdrMkPq8fPN3gL1GkbAnQhl8+c
	EWHJ+ipiF+ZBNaxbPb5+KnD0Ty2uCsuIOVo59WDaBZuYn+08Tqne43ztggsDftg62ahG8gLSmJK
	UvHMKhFKO1Ihr3V5WCYRvrhvsksNx7rYCIAxCfACkp1XY1nnCy5iY+WG50nutLs9IGzZF6Teopc
	tMsibpE1kCxMCL78SpKQZXb+b6dzrY3V6pOr+baytV0xxpl4oZVXzJqeDlAwzBXwgvf/64d0q6B
	u/yfCxYQau1lvteUJEE3WrjWTxm5IQu+1K2Z2UNBFX0V/XSuuNOQjH4kHma5bqEHM0CwAkk2Df9
	+SxD1cm0IM/bGKJQDY5eJH8z4IFjwbWEAq43ynfgqKj41yJ8xKgxTCSiSgB/OXqvu8rEpQKdYCl
	LkO184Bf/PaDxGuuEzZaQLzbRhUmuKMB1sa44QgMCL/2z2rkeuU/kEbFNAThO8k9UoqL8ixA3p8
	Ul3vvdzJn3yefGpmH5gw/glGyzYvtsWI2q9vnOAKrFiIJhnCx6d/HRb8qE=
X-Received: by 2002:a05:600d:10:b0:48a:568f:ae6d with SMTP id 5b1f17b1804b1-48fe60e7d79mr178172895e9.8.1779095482306;
        Mon, 18 May 2026 02:11:22 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:6e9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe79ce3sm80272945e9.31.2026.05.18.02.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 02:11:21 -0700 (PDT)
Message-ID: <d262dbc0-48c1-4994-917a-1f975c60b2af@gmail.com>
Date: Mon, 18 May 2026 10:11:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pavel Begunkov <asml.silence@gmail.com>
Subject: Re: [PATCH v3 04/10] block: introduce dma map backed bio type
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
 <646ecd6fde8d9e146cb051efb514deb27ce3883e.1777475843.git.asml.silence@gmail.com>
 <20260513083937.GD6461@lst.de>
Content-Language: en-US
In-Reply-To: <20260513083937.GD6461@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 816FF5699F2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61917-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/13/26 09:39, Christoph Hellwig wrote:
>> +	union {
>> +		struct bio_vec		*bi_io_vec;
>> +		/* Driver specific dma map, present only with BIO_DMABUF_MAP */
>> +		struct io_dmabuf_map	*dmabuf_map;
>> +	};
> 
> ... and please add the bi_ prefix we're using for all (well except for
> one oddity) fields in struct bio.

Ok, going to add

-- 
Pavel Begunkov


