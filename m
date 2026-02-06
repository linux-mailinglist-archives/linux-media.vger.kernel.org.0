Return-Path: <linux-media+bounces-52321-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOYqLIMshmnkKAQAu9opvQ
	(envelope-from <linux-media+bounces-52321-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 19:01:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5686E10191F
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 19:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 833A73006B44
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 18:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42DD836EAB4;
	Fri,  6 Feb 2026 18:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXH925yQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A0F2D8DD0
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 18:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770400891; cv=none; b=DvHloEuzaGeW4ubIy1FDwB2AtJytpk6r4ihXbn7YQ216AWBAADwMOIx+duf68t6ORJvNbsS592zJo1BdEPXKVCuIIxQVH/qtxf8+E6IKEQGKp0BTeA40jFEJ7dyJkVvap8LLIcmxSe6ttiGXpw79OAi7wFC3kXtNclDP9A4U9rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770400891; c=relaxed/simple;
	bh=lSzknfIv//vW3XrZo3ZB5GwoTGxjRj4lI8kJmwNoH0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VvLU6CKedZkC47JHDEI3sAAF8You2fTfIxjMtebdS81huBGCbyagV6JAJt7d/5EqI4hHLlmsCcXBhBbL1Y3JyFxamAfp4qlBvNLDdsGAYAkYqvpDSss7+g5EuNny/e4elE61kVkJwgO4mUzdzrSTwZ9kHsUAeBQrUfAOIHMRRpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXH925yQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so22557345e9.3
        for <linux-media@vger.kernel.org>; Fri, 06 Feb 2026 10:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770400890; x=1771005690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=chld7W3Rbl2PUp6cBiIbC1iT7uESUsO9DngY57S8hBw=;
        b=nXH925yQME2C/lv7xU3N2pyQIphEEpo2HaEr2mjExOB/V12/17synnPdfVx259zHFa
         s/OseDtCvCMxhdFsZLcZGyLFKeicyTGl9TNKK2V162hPxUPSZHxJvxdUWBxeC/uRPbZV
         ba34+SNbt/Tyv8GVhI7vlL39IXY+/iV9t0h1tjdxAzd5rIXvEQYsjGIB/YCOysu+iWg7
         Iu/7ambw7HtnGIKk40JQ/GMgK1cQalk+dr13K8cVTiJXvWpMR0GV5NdL01XtEFRO/VwC
         HQnhdy7a0ZGyIpNM5WWwzlA4q4iNp6c8P5xGdITM5xHOLCZj2YzbHJzegInrFimdGerZ
         mTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770400890; x=1771005690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chld7W3Rbl2PUp6cBiIbC1iT7uESUsO9DngY57S8hBw=;
        b=q6HpMRleKQ3YliK11Y9cWOscaZKWIvVLr2tpJdb7qt+lSb2jIleB+svVO0fjy/hjrl
         T6VX6gU5ag9o4d7NsV+S2ht6YeWCENZwUFevQ4NTMItxl6ZBRD0z8V7mMCMq6CGaFa3v
         Brg8MiOZ1ZQl8ujVt9OFGcdNyIO7qk0SOyvgSFXa7Cl86ttKoAggM01Rx6WxVA9+WlFe
         UhaWIsoCh/x79xXndRVmur48N/fKJtivAqV8Lf21OdnneYrPFjI/x3vhKmffsnX8u0GS
         UWdRr0KgebfzborEwdMXGNQ6gM257M3cjZoLZMBkYwxI/9fWiUg4MP6hw/YE8jeAeruZ
         9nYg==
X-Forwarded-Encrypted: i=1; AJvYcCUBjbCWYAQHXZucmElGHzjK/KbdIOlg+TcGDcPr43lLo8qhQW6ks3qwJZbj8PeCf2AeQ1jj83UUC8uwug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZJ3WdsuZ+1cAyPq73JXZyVAbZXdzpFsc63hV7Hdggpg2+MAje
	RA64/jxGCoLtRuRZX5S7CKl6B0fAMRZW6LsAy4AUw6gyajlnxrFZx5Pw
X-Gm-Gg: AZuq6aLrCPyZtS16oo2aMU+2ZapoSWznemq0e1xQ4q8xi43Z77I2rWHR0KLlKdks8pp
	UNBxTua8oDDhc2XJoV7oZ/YATYraGhe5MWBvCZUCRSQpWzKYbVRSVjEFNgz3IRDiZ5GYeMZaOSt
	SkTLN/9Gxpur0w08xnIE+726IJSzR36zxQUJgehuYXySuah4oHDIJC34Zp5OLNAwo7VQCNSnnAm
	EIGsl9+heaJBFXnnVNqJcWPbqMXJ9qYi1fz6221EiUzFjevVfXmE/stD1kufw5Ph/OvcpZImWYe
	EG0FyPZbvZByXb5XFkmvYcS2gMRkKwlG619zVUjaVbP3JyFROuHy7WiSN+DEqgd7TAg/MIDS7AC
	sReruUSH6QwOGKFyRMELzhRknMc2SYAHI7DZJPXRg3SbBz0kCgyzdbjsbTjvC7PjlqhAb1BxbEg
	Xtn1mpYFnRlT7mzoReaEbu1XsLJH8Gc9rd+UCLjIvM8Mar/GTp7/QPojXk8TQu+xqultthohJqY
	lBJ3njImu90tSxEiIzMQ8DhgelwFtxh9AVacsitsgVxBVP/PNtz8tvXKgxGgUINlA==
X-Received: by 2002:a05:600c:628d:b0:47d:6856:9bd9 with SMTP id 5b1f17b1804b1-48320216d31mr49104765e9.23.1770400889507;
        Fri, 06 Feb 2026 10:01:29 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483203e126dsm51230805e9.2.2026.02.06.10.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 10:01:29 -0800 (PST)
Message-ID: <b0ec01bc-4cbd-431b-bcdd-084cc14553be@gmail.com>
Date: Fri, 6 Feb 2026 18:01:31 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 05/11] block: add infra to handle dmabuf tokens
To: Anuj gupta <anuj1072538@gmail.com>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
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
 <51cddd97b31d80ec8842a88b9f3c9881419e8a7b.1763725387.git.asml.silence@gmail.com>
 <CACzX3AupFeAy0-pPsZ51ixd7qW++LYYjiKBZ3aK5Y2JDrB_JWw@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CACzX3AupFeAy0-pPsZ51ixd7qW++LYYjiKBZ3aK5Y2JDrB_JWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52321-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[asmlsilence@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5686E10191F
X-Rspamd-Action: no action

On 2/6/26 15:08, Anuj gupta wrote:
>> +
>> +       dma_fence_init(&fence->base, &blk_mq_dma_fence_ops, &fence->lock,
>> +                       token->fence_ctx, atomic_inc_return(&token->fence_seq));
>> +       spin_lock_init(&fence->lock);
> 
> nit lock should be initialized before handing its address to
> dma_fence_init()

Good catch, thanks, I'll apply that and other suggestions. And I still
need to address bits Christoph pointed out during review.

-- 
Pavel Begunkov


