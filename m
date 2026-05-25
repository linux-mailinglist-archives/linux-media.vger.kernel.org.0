Return-Path: <linux-media+bounces-62700-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCbyGXv6E2oxIQcAu9opvQ
	(envelope-from <linux-media+bounces-62700-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 09:30:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7655C7266
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 09:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BCC03029AD0
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 07:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8BF3D330C;
	Mon, 25 May 2026 07:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlHC2Qlk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6335D3D1CB2
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 07:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779694154; cv=none; b=k5Z1NiPj/YnREJDOHWxPa0t89659PYpV5ICLMDmCnAuGo8yeQkWLEJbAkDBXLP92n3bhnw/VST3AxfvXfxYkqjQuoKkq89lvZqQlZIxS2ZS3/zM4586YsGQXAbGQI40SgevlEyvs4V0D1U7TFKIV8IpQZO1FrV1oAWnmocEsiK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779694154; c=relaxed/simple;
	bh=Dg6xOhAfC8nAS8w2UlP1hkcGBI6/eEQ9ST3cagLZT4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dTCbwqMN0QrnUFavWbHhK4H10DfGGOnr7zZz5tfLZWGfWcHPU9Kzc3bmhYKOqpyDyzDvtnnnTzzOBRSK+VrQKS0HPf+JnQwzImRrSQflH4to7/8yHOOxVjztBQZVVO3wrD1fM1OLwzoCmarpSGL9bUtcXLYYuBEXjkR7jrniEVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlHC2Qlk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49056b9f04aso18890245e9.0
        for <linux-media@vger.kernel.org>; Mon, 25 May 2026 00:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779694152; x=1780298952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m+/CremarURMLXbq9HZsozt2//0CtuRcgdYp3OMzrIs=;
        b=UlHC2QlkIb4XLnXGJy7wJ9WEAIolGMLkGZ4XYlME8S5AEhdyWcsYCae0wgtAz5uZ6+
         wDxbJJc9Qcy9N4zpjKC7zI5pmqbWBoSZDbWXiLTEehoIUXCaj34l+WX6RaOvip1EfiRN
         BWYI+Lt8tA7PBSZL/Rc7fB0gydpI+H2O6cCgLPmW57JUpG8J7z0/QgZ2aUm1B9SPftOE
         Rp+dcu5/00PDGT9i0OHnPZ0cYSSdG0yV5Eq+2sDJGN61sVIoGEdfy28aIcecT3IQko+W
         ZWSGztFHDohN0gSU1UiEHLFPN28TmZTWsrNkupph4hd+MoKIvQjrfq5Tc9IWiVAk6hog
         kHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779694152; x=1780298952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+/CremarURMLXbq9HZsozt2//0CtuRcgdYp3OMzrIs=;
        b=UOQolBnsEkTVWHvTim8Yk5wjm1FgpvI/JV4iFIIJ3weqZ6blnUYnECxriV5ova7HKA
         E0NMyonc+0AoACmeKDxyCyPPY5sbqG5JcCUXUmD8Jo0+RliosW7xAFnSnstso/Xx6t/s
         lCidENReFOttgVzD1xP6IOrYgBhliuCfftkRiHPQQqw2y7pPUZw8EQ85ytjCqb9120eg
         s4aUI+Nue3Qrybi1Qq5dp3zpg2g6w3xef65glP7jUOBEZRXbJnq7LjJz61pBcao0IJGm
         Bl1mjquIoZLO4Vw10LnhcaxhAQsk7yvNXYK2DACWK+tMttvSI5vvIKG6buh0xxrhq9AG
         naKw==
X-Forwarded-Encrypted: i=1; AFNElJ9n4QgH3+T7h5Y50EursAHB7gYXALlv+qJscYsai/HE/VqKPpYgZkWwqtMzQFpN8jUDJtm7A9hTLZFNgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9LFBiCXp5jcRP0zwE9sLEozSIP+Ayj4c7meeoovq8GGU6yAPZ
	HFe1WQ2xgYYW4n59dAgpwTjND/x4rieFtuP3wpmTdeINzw8TH7pWZ5z9
X-Gm-Gg: Acq92OEQdbS1qqbQJqg9gI3G8tqQZumxX/sbw8NWES3J7i9BEYjiKYjnTv6FIC21Co6
	NS1Vr73LihmH5yFRf59AeyML+y4llGYWD1LleTRNexSXiuEy/Je8xII/4eRMpeQwfN6M51et/vb
	x5NLbRMrvHzmFM2eElWEuLHN8y7vytjfUI1QB2jfcL2nmeKITHXrBUIVnkk26eAW9H0wh8oo9mF
	7fC2zTQ9AJ7rL79UI9JFwTj2HS6sN4MlpCpb8BX69Dno5i8AJIpgcpMgHKmKbIABllILJcab5wn
	xKCbzstBvXHIP8vIZq8L3W8DdY5OjiyhU0sPTK4mnRlcmoQ245hxm0WjS7gxAHhAC32sCVRHQ2k
	yxOciSM/1LArrKBteLnYpBWgW1k2EzuMv8J8Sc/jSGbPU71Pxbjx3HsWXO1WUcG8q93Ex6jWgW4
	N2K7oQ+1hCAC4UXQzR8HHbRzG/x2y6JpvlhoAh25VOY2evRbSRPkHbwneIp5cjgF1uMvCa27hW6
	305h26VrRnm6T2IaaX8PQohNW/8zTjErpNm+78PkyHjiBi1kMLk57ozJ9NFyrI7gfg0IU70S6Fe
	33buhAFHN/rylYzu5u3l990=
X-Received: by 2002:a05:600c:c4a1:b0:490:1640:8269 with SMTP id 5b1f17b1804b1-490426d1a16mr227253215e9.18.1779694151663;
        Mon, 25 May 2026 00:29:11 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428d4cefsm81771025e9.14.2026.05.25.00.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 00:29:10 -0700 (PDT)
Message-ID: <57ae2e2f-8523-4cba-ad77-920535edd236@gmail.com>
Date: Mon, 25 May 2026 08:29:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <20260513081929.GD5477@lst.de>
 <24833f76-2289-4859-86d1-9215b11a1258@gmail.com>
 <20260520083043.GA18893@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260520083043.GA18893@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62700-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BC7655C7266
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 09:30, Christoph Hellwig wrote:
> On Mon, May 18, 2026 at 11:29:54AM +0100, Pavel Begunkov wrote:
>>>>    	BIO_ZONE_WRITE_PLUGGING, /* bio handled through zone write plugging */
>>>>    	BIO_EMULATES_ZONE_APPEND, /* bio emulates a zone append operation */
>>>> +	BIO_DMABUF_MAP, /* Using premmaped dma buffers */
>>>
>>> Shouldn't this be a REQ_ flag as we should never mix and match bios with
>>> and without this flag in a single request?
>>
>> Do you mean adding both and propagating it from bio to req? submit_bio()
>> takes a bio, so we still need to set it there before it reaches blk-mq.
>> And there might be bio-based drivers using it in the future.
> 
> I think I forgot to reply to this, so let's do this now.
> 
> REQ_ is actually used by both bios and requests, so if you set it in
> bio->bi_opf it will automatically get propagated to the request, but
> it can also always be tested on the bio, including by bio-based
> drivers.

Ah yes, good point, thanks

-- 
Pavel Begunkov


