Return-Path: <linux-media+bounces-59995-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JtEA7sk8mlmoQEAu9opvQ
	(envelope-from <linux-media+bounces-59995-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 17:33:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BF039496FC1
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 17:33:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 33729301A75F
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 15:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A4E37CD45;
	Wed, 29 Apr 2026 15:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qMkRCmAG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B894288530
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 15:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476610; cv=none; b=rECuYD0fMdCujsJlqiS+f6I6WRId18PN12akhqobVm/hHzcuVRQQRmoL9vf9G4K1gaH+L8M2via8e6E1dtEFBRWWOnMagnhPAxD9sDgRyhRhb6imaGop7lqRP0t1K+p279Qmb1cBPsl3tudPvUsblL4ltH/igZQDshO//+rWPTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476610; c=relaxed/simple;
	bh=rzuxUcixg/aGo1wsLI7mfQXDoDsrq+gCA/2UqCKDcbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HlimmA5fyPKuWf//ojUjb/Ngn9YLG4uqTYTzNV420fkdhmo7x+uvWVr5X9Z2dczcGoycOsx1HiQdBlBj1TBi3flwb1nn/TdyQNZTpOy4kREu9R7zS8ezMtcs1rV5z3UtwaDpqQCPZcjdkerst0KDiJ+pfdOM50pFkWGvXvTZxd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qMkRCmAG; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so9976295f8f.1
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 08:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777476608; x=1778081408; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FOLuNiA/kfZwdLV9E2p8TNPc5d6B3zFK/DDHPjJ4Ciw=;
        b=qMkRCmAGPF/CQdcPyMvL7/b3NrrRRQjb9rPJFbEO+e47eRTPnAFflJ7b7/PXCP3za1
         3ecR+Hipy0pr2biy0kmthF9f41ammpPrxLG4BQqO5tHigxmxrKm3zPWOFdhUVbOwpl+G
         dDvxE4hDeh7HYZdShxmepG+bcgdeMrvNTKjgP4hW4567eU776FPkTErKOZTp2J/+JrFG
         jVTk2AjOa4qDaPOr34pI7R7g2xRo/jz7rj0pmtPYD8ZGilkaOFPgMqghJJlgE09MsMLy
         gmb8sXsShLrMJEFyD2OUoNV8ga1ftTKs0EPkyc4QBg7KjbnrHqqABWouhVnp7eKEkqjx
         QwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476608; x=1778081408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOLuNiA/kfZwdLV9E2p8TNPc5d6B3zFK/DDHPjJ4Ciw=;
        b=M4RrdTRHebJ0zqBtLNtJAp0X0s5Gnn4DvFYmtalxdKY97BDi20YTxAM6m0uuW6vUpW
         1lPNdB/8Td6Fmpwhfj59B7Ez8HslLtytZxk6UiClEQgUOzn7ryFiuQwr205Cdytx4Os6
         wlHHHKX0i5EPWxZAp94nA1mlfTy3FBZaBLf3NZQUCh93LWAneb6wmyjlhTY4757qmTsX
         Btz/HOL1Ins/qdB2IGNqCFDfzZF4+vldb2AoDAjKw5YRx+2JWD7s1Y9u5zyaTB72SAlW
         XzhPSaHq6/ctIhbu13IkNMr/6F3xWTUIMEHA5Q8mREkckYRZuWuQP8JWbwNWtJ8nyzN1
         ZsAw==
X-Forwarded-Encrypted: i=1; AFNElJ8ssD197bAn1Mi2el18NLYlbVC1ObRzesa7q8xn65C7t2cl8HvvAE06ec0TAGF0OeEHK7fsyoemtGvWAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMCkq710dLrk9q32fHNuyB1BAbGNFvKOV6/gZrzkbkI/ezcQSz
	lL8cCrnzHguR7xj/trY8GUsAnuJJHRq8OimHx9F7PY2nQ5bp+8QmrJBjy8jUMuqS
X-Gm-Gg: AeBDievHPXZBSYMOweMixsiy8BLyRehWbSVMPGiwRhCT9UNXJxsE4XxLdKPXF2ICfEh
	UlEhl+C0ifdyIiLk8Z0BH6zhsJcVNEXHTNIbVLDFvFqQrFEvbvtq/4i8uy9pXNoKVAza3CILILs
	vuBJS6Gqy++lI7UIwQIrH1F6aRIkfCqHw4Hzgy+Bdx0gbgwuYoh6T///cgVx8mluP//TcwmTMyE
	9cCFi94wayM0tj7JHXQ7Zz2CSTOObEppJNWX8Ad8oXv4xPvJHf5YS1xaxtRrFMzqq+DFswJWnmh
	NKwEX3BEM2Osr8Utsgdy1g5hw2bhApvmLy3fxPkayYNqTDppjBR2OcKXhCFlWBdJh5lufko5X8W
	nwe7WElA1jRKaPZ3aqCCdO8d2CqAbWfeFIzrqRoBrE4gAC/xWKObcuK9io6LoB1h+mAQ2pzcs9s
	9nhImByMf6CWyhjM/G/H/YKLAkhcHzPussEnbjEDhNRTBgyutoMgYY+YxpaVdQwjcHUEgN2Czzm
	hDMCiAS+mTzVCwZWNM8FviRv0EgrQSgMz83b7EaLg==
X-Received: by 2002:a05:6000:4313:b0:43d:d037:d59c with SMTP id ffacd0b85a97d-4478eb81cf7mr7566713f8f.16.1777476607642;
        Wed, 29 Apr 2026 08:30:07 -0700 (PDT)
Received: from [10.228.209.141] ([82.132.184.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b3d481fdsm6740381f8f.8.2026.04.29.08.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:30:07 -0700 (PDT)
Message-ID: <46bf2c04-72ab-48a2-a8e1-9f4423eb17a6@gmail.com>
Date: Wed, 29 Apr 2026 16:29:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] nvme-pci: implement dma_token backed requests
To: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc: Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi
 <joshi.k@samsung.com>, Anuj Gupta <anuj20.g@samsung.com>,
 Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.1777475843.git.asml.silence@gmail.com>
 <5cecb1157ab784f9f303a91449fdf11b03aa6002.1777475843.git.asml.silence@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <5cecb1157ab784f9f303a91449fdf11b03aa6002.1777475843.git.asml.silence@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: BF039496FC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59995-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On 4/29/26 16:25, Pavel Begunkov wrote:
> Enable BIO_DMABUF_MAP backed requests. It creates a prp list for the
> dmabuf when it's mapped, which is then used to initialise requests.

I left nvme request / map setup as it was in Keith's work for the most
part (apart from rebases, adapting it, etc.). It appears I have some
use for prp lists, and I know Kanchan, Nitesh and Anuj already have some
patches adding sgl support and some other optimisations. Hopefully, I
addressed most all feedback from v2.

-- 
Pavel Begunkov


