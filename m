Return-Path: <linux-media+bounces-60110-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AAoItqg82ly5QEAu9opvQ
	(envelope-from <linux-media+bounces-60110-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 20:35:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B644A707F
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 20:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC2B5305FFC4
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 18:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6F647D928;
	Thu, 30 Apr 2026 18:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKYNxebG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CB647CC78
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 18:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777574038; cv=none; b=Z33Q1VWx7W1k0Tmsdb0jBtk0p/7Hqg2tUhuU7A5ZmLBQwIOxBdO8f79/xYBQ3S8ZIuHfkXPnrbR2n85Ojqf2QapBMGwMuPmLNswnFquMl289dBVCK0FRpMzOshwIfZ4LDPpaoH4jaDQG7mx9819g+YIX5a1+THFJDhInRX0bzLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777574038; c=relaxed/simple;
	bh=/jhj+TskCXODG9hKampnDGfknOGVmEGixC/boL6nPuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hW8Dip1bPHFThC6u+/vEB2pOAHxyaHB5Nkv3HFPb61R/fVj62iusIZfiwefNLC76X69HdOfWYGmkUUdgRs5uk3AIOrBOtiC7DW8JNF6tFDVO1EYruD65Q9GmfxvJ/Bb4Ymjdn2RstOA1w2pKHES9LMjcae6L1RDu6Aih8/SJrYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKYNxebG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-445795cf6f1so825303f8f.1
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 11:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777574035; x=1778178835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NXLg+nrr3M9M+FT0+QCr6ZD6pc/R7QelMFoBuHbRWoU=;
        b=IKYNxebG99rJmgJdnK+STw62yP2P2cdaJBZG/cigckDb5MYyuKKqqi+dTFU2d9cFZy
         qhJhEBM2t2gYyYxeD5XqrpJttoMPpfwDkqQGaWge8r5FKsdQAdayH4cS/hC2kxIHEYq6
         tGmHwVFWfDn2FZp49tR0EcsXlAigU9Sqe8yADo0AbxH22Zw75c684dLC6hfRE0EgxQSm
         HB1ngLvlfAIWqWDd9zNtUSfCDyoND4JMJTyGyjU3XxM4J+M97HrqUqLRf+QYygwaj1mC
         Ogr8gZjOmeYK1nNMGlcIaHaGVz3S2JshItziqGxqT+GC883q+Byb/VWR9AJNIaDrVgN5
         mk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777574035; x=1778178835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXLg+nrr3M9M+FT0+QCr6ZD6pc/R7QelMFoBuHbRWoU=;
        b=Sma+NfeRkvqQDCvhrg2+lDgBWnJvPR+pvX+0FfXib4nouTygx4emoVeyP59XHzyJsW
         zwrqI/Ok8d3iqIp1jGABcwv0RAUSBavbAc2oxOG1PIKg0C42VKYvp/CKyEx95yPgF08Y
         XEjZtqf1OawRKX6VWA+jjkUFjALRPLjQyb/uYTQtqWQatzr6hi4DmNIGu7WRZZgn8Zq+
         0OoPNNElTU2nB9SuXTrOwKu5lzqssW4IiVkZ6G7qBBE3u8ausg9kr6Bgr/+rmQst5bF+
         dkqWbTUdWhuWy+OLGXlsZOC/+tIkfOpJVZKFoZPesbF4tWhOtk/7d86ngL9mtXT22Y4p
         hWUw==
X-Forwarded-Encrypted: i=1; AFNElJ9lpMw8bbB+XnWl9peludm83YYpy/hKZpb/sS0YDbgbnS+23ptobKOXGGRYkhx8Fx4lQXeeRD/UJ55b3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHH2aNQ5QDj4HQKgVCICLDvDnK/74clYvKaJnegGsrr0FPk6Xn
	U/umWOlAEP1TmDBreLffx7g4lxc92DY5BMc1j3UkZlQxar8iWHDBo1Zi
X-Gm-Gg: AeBDievWU7J+5boPClN6flaaKe7LQvgDZzLvshTJuL/VnqQG3+x2emGFjc4PE+ISsrH
	OTcchM9LHHw6cwJcZ/Z9kjggtQOs1BqN6+0OncUxdZ/ohVtx+w0R3Qz3w9jtSJoi2nkwFnoDJz0
	KT+dF5k8GzzrKYVKy0+hywF+6u/9DpBlrd54pRAZp1BDpktxufquTKkTqCznhvT2UYzDjICOrmX
	A5J7mp6YIQKzOUcqost1nkt8FVvYG0gmAi/lC6hmEeZ6IJJQSjzSFNHbpxbq95k7cqJYLwdXwWS
	Xd/CeJaKsWYgSGaXXtZOfoyROPMZHiLd9bQPPcoMkIQPquQAuc1gpIfPZHWF3bJJ5Y2CqMx3xuy
	tt5Al3iSIu3XGhJ3Hgb4GgagTXnqCOMnsQJgKVuGldJbIHM05wRzdOJTc0++tmwHoFQCOyX7h42
	tGIW7AC3COLRq57nXVA3ns3IK/xV/Gp/WYsIv0zig89Zhq8y2h1SOlusZOhkrThp41A8n8Kccsx
	YAnA+v2Uimo2ptM4BENS3frx6cjf61GHtfwFNhCveLt4AupqvLvd0e59lR/2DzagLx8Scsa25uA
	TA==
X-Received: by 2002:a05:6000:1a8a:b0:43d:77a8:3baf with SMTP id ffacd0b85a97d-4493fa01beamr7079438f8f.32.1777574035154;
        Thu, 30 Apr 2026 11:33:55 -0700 (PDT)
Received: from [10.109.92.8] (net-2-37-141-89.cust.vodafonedsl.it. [2.37.141.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216eecsm13579672f8f.9.2026.04.30.11.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 11:33:54 -0700 (PDT)
Message-ID: <6cce2f4d-7400-4618-82ce-cbd5004c92a4@gmail.com>
Date: Thu, 30 Apr 2026 19:33:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] file: add callback for creating long-term dmabuf
 maps
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Cc: Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi
 <joshi.k@samsung.com>, Anuj Gupta <anuj20.g@samsung.com>,
 Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.1777475843.git.asml.silence@gmail.com>
 <ae941457cf6cacb9d4c16b6ec904da9ef7fed97f.1777475843.git.asml.silence@gmail.com>
 <f0dd8f89-835e-4331-b593-4405ec59f4fe@amd.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <f0dd8f89-835e-4331-b593-4405ec59f4fe@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D3B644A707F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60110-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On 4/30/26 07:03, Christian König wrote:
> On 4/29/26 17:25, Pavel Begunkov wrote:
>> Introduce a new file callback that allows creating long-term dma
>> mapping. All necessary information together with a dmabuf will be passed
>> in the second argument of type struct io_dmabuf_token, which will be
>> defined in following patches.
> 
> Well first of all the naming is probably not the best. Maybe rather call that dma-buf attachment or context or mappping.

"Mapping" or "attachment" would be confusing as maps are created lazily
together with struct io_dmabuf_map. I can name it create_dmabuf_ctx(),
but I decided to use "token" not to collide with dmabuf terminology.
e.g. I wouldn't be surprised to see some dmabuf ctx in the dmabuf
implementation code. Maybe "*io_ctx" would be better.

> Then the patch should probably define the full interface and not just add the callback here and then the structure in a follow up patch.

I strongly prefer splitting patches so that they touch one tree at
a time whenever possible. tbh, I don't see much of a problem it being
not defined as it's just forwarded in first patches, but I can shuffle
it around in the series so that definitions come first.

-- 
Pavel Begunkov


