Return-Path: <linux-media+bounces-48724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B199CCB9BB7
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 21:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3D033090401
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 20:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7C0245019;
	Fri, 12 Dec 2025 20:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="kMcM4LWP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC7E2D6E4A
	for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 20:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765570258; cv=none; b=OiL0vyqZbXKz2yVbQB1fDAzwZr+LbeLScYRD/XY7If+EgpMZ293Mp791KyqydwEGEb0AYoym2oRKxLDObYOapqIwRCgBxid8iaU16AGEfhf5LLN6c8OGw602VQMOwcSdLG2r+Sh38g+rAkwCw2Y/c39IsR5fev/AtTE8h2/dQIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765570258; c=relaxed/simple;
	bh=4gfCtO9+aoCvqYEay1XZJUUI1s50LzgL381O6T7z7FE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RfW6hGVCImRjQE1D7f/HTaIhGJuvhVocIdSjnq5/mP6zMtf4erXfjIE+yNea6noOjotOPINvebTzjqD2fjZRLyajMnROOq53rmt0WKLoTiVqxkgm/J1R4CoGcnztHdDqgL3SRWPb/Gv1+5HckGiY7GTSfQALJOpn6Amih+UwLiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=kMcM4LWP; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29845b06dd2so19484165ad.2
        for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 12:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1765570255; x=1766175055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gsVed5WgXtZPXSfJ2PXjLRbNCmFwRAyF31OH8siBSJw=;
        b=kMcM4LWPOOW5aofuFjI2DOpQEcNRY9pNxIjsXTaODIbDPKMC5FNcR7RvUO9eXo7mUq
         6BsGnJ80Xlb32jsfGAp+kCt1gImNMKb/QKdXHMJzk3bvdv8jJhbJphheaDpf4gyuL5OG
         HydGJQiIETyM9h3gNatOuE/XUa43fmZn6KP8wz9r5te3Ta0LYeDWaXyvX2hZGRTaXuXg
         /iNRw/JmobBVs/4eJJRU3EsIFK6gjThqYZOWcBvyjw/thYYPRJAIm93s1R1dBxjNosQg
         yLY2UQskQxlKMiLFwHf+C19An1ecALJSPCTKVzeWTZrQ5wRsmfgnj+Hjun9X4HRLWPjc
         cWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765570255; x=1766175055;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsVed5WgXtZPXSfJ2PXjLRbNCmFwRAyF31OH8siBSJw=;
        b=dReHmZJYcZD7wWo0/vedK6znQ9K+kHnN1ZsjIC1fo0qj3br3DAmvHsiF/qo+OysukT
         MyHBxM1Gy2eTIioaePmws6HIp8oZ3NwDaaBCal0BkoSJjbWhkVfDJoh5MCO0MltGK0oy
         jpe7Z2d8z3HN89Q/5amg270T9BpgSdy99JFTA/DZ3jA4+exEDSGsF2ya3U5rU3pFAoJg
         W478vTjTx9eNKqK7AymKmEfAyHfS53rAf7yWZtJnhhdAIGgCy7dBqGaF7j6X4VdrJpTs
         EjSsxEwoZqFpeZoTxKZyh/ryf4GH2Nfsa7+YhzhL7xlMBac8mRscEkLlZ+iBmWG4YED6
         ij9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPgSaYwoAvANl7+F/KSn7ShmLf0MAJ9DNrndgCO+GqJviUuKjHDkEeog06jIX6n6aaSrIynkAFmNrt4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhsLGqV0uUkKqx0/Jc8UKwV7+FBSSgBUiU81UxDrfkoK6N51v4
	CFF5XrQqXNqp/EkA98uzFmL5pXjzUb7Hp/oJGKdFljaZQjg7g2vhvOrdtATTqPwg0QE=
X-Gm-Gg: AY/fxX7d661m0rrPGJTQvwlFWT8GSvv2uF4nbEsx0j8YQPqeBVJBBYyyHyRQmIIcG08
	kQQ7kt0F7XjxOuQ/54oIHWBY/OIwNGrmujZmHMpGeXWia5SEHuJNMXyekJ87xzItu75wYMosr9f
	l6B0VCqvpUE7pxgKkD6nV5JBxrIZfGQQrrZIas6IP3xHsnI9g3WdEuznLArgyG1W84uisD0gBld
	mQ0MNGbWYWlLmqgykcUMtL4aQhblt2miwC0Gw18dDfQfkSquEuQ0HHC0FBcOfCRBq4qtUVQ1w80
	jHNFodbTuXApMBg/Qck3PoZFl7On8/sTHJY/WE6FcOrTJrI2lfIrQkP449WuFu58IK2TEXJgPHA
	0dOevLHcJDYUpZHpWJXKvr0tDF4kx2S7/tDSFdej/WaAsRoknlthP5wFFXUj2ObqxmUrZHTTg2q
	eIDYHxMbndxPH1FLdFVBxPcn9c0hLuLl118o0Xgc+/O0n5vWbwgg==
X-Google-Smtp-Source: AGHT+IH4YKlBbDeLqTy95z05gm75S6dqOblA2F2FrB859WtV1ZEekn7/gpBPyoL8TMFo+3JpfAzaQQ==
X-Received: by 2002:a17:902:f688:b0:29f:29a8:608b with SMTP id d9443c01a7336-29f29a861cemr19807075ad.13.1765570255065;
        Fri, 12 Dec 2025 12:10:55 -0800 (PST)
Received: from [172.20.4.188] (221x255x142x61.ap221.ftth.ucom.ne.jp. [221.255.142.61])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9d38c7fsm62825655ad.39.2025.12.12.12.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 12:10:54 -0800 (PST)
Message-ID: <2729b31b-ba58-4f32-b71a-75bd07524ac8@kernel.dk>
Date: Fri, 12 Dec 2025 13:10:50 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 03/11] block: move around bio flagging helpers
To: Pavel Begunkov <asml.silence@gmail.com>,
 Christoph Hellwig <hch@infradead.org>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 tushar.gohad@intel.com, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <cover.1763725387.git.asml.silence@gmail.com>
 <6cb3193d3249ab5ca54e8aecbfc24086db09b753.1763725387.git.asml.silence@gmail.com>
 <aTFl290ou0_RIT6-@infradead.org>
 <4ed581b6-af0f-49e6-8782-63f85e02503c@gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <4ed581b6-af0f-49e6-8782-63f85e02503c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/11/25 6:08 PM, Pavel Begunkov wrote:
> On 12/4/25 10:43, Christoph Hellwig wrote:
>> On Sun, Nov 23, 2025 at 10:51:23PM +0000, Pavel Begunkov wrote:
>>> We'll need bio_flagged() earlier in bio.h in the next patch, move it
>>> together with all related helpers, and mark the bio_flagged()'s bio
>>> argument as const.
>>>
>>> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
>>
>> Looks good:
>>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>
>> Maybe ask Jens to queue it up ASAP to get it out of the way?
> 
> I was away, so a bit late for that. I definitely wouldn't
> mind if Jens pulls it in, but for a separate patch I'd need
> to justify it, and I don't think it brings anything
> meaningful in itself.

I like getting prep stuff like that out of the way, and honestly the
patch makes sense on its own anyway as it's always nicer to have related
code closer together.

-- 
Jens Axboe

