Return-Path: <linux-media+bounces-57585-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEdXHPlHymkQ7QUAu9opvQ
	(envelope-from <linux-media+bounces-57585-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:52:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EA93589BA
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:52:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8FA7A300DEFC
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6E23815F2;
	Mon, 30 Mar 2026 09:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3HOaNQw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8903AF67A
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 09:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864363; cv=none; b=a58kbNuSV9hJvu+pQ74V8uxAYzTSsf3lr4fXBrBDk43U7qUnBPDXhNFfOTqcKtED+U4yngUrrQp7RqthEz53CMHhiXMp94RUGl9QdmUlGq+oChhpZeIT2bTvCICHSDBrouAboRolk36AA+5QyeYwNLSc6xN3dRp53UgB6McOKJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864363; c=relaxed/simple;
	bh=I9JWL0TnRVg/zBZcrP4TkUOOuUEXZ2luMJ61hcty0oE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TnGwuDqbDoOMqExpOFbAZOObXErDMsurFLUzmj7khLdraugYHfDG4wjenx05lhxzfm0XMtAutloQMDNnDqeHvv0H5me4jkDI8ITWjhaIkfsqrFDm3cnWgKUxsbDq++CoHej7ooodWL7BCLuWjv9+L63Po/XE9kB0r/ldNmoJCKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3HOaNQw; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66b2f6e983bso4562919a12.0
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 02:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774864360; x=1775469160; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cn7BPueizG0aOaXVcVQhQ6g9SE/PtvAJOzX0fQc+gbI=;
        b=l3HOaNQwnRoDqfzMKpf7olWVTGhjZn94vLmBIeQtBcg2loi+stpi9YZbvtumaZnNem
         dWBWCkGCD3smRdkBHauDsKNdq136oLBm5r5VRY6Kdj4XsSkAFXYuL/AauO/WU1ugRl+L
         va8uqZKNoA26yulNMm9p599v8tuDR2PgMRv1RcI423DW8PrQI+dH5TtL7MqlJQpXIPda
         v3lKbHXca3B8bYJX070aTa9bOrLG3JzZNNzjzTn8LkCCEKmvEJP6mWW9bWF/Q4epBF7u
         6IrMzdZyGk98s9CeswI6RW2qc69QZ1WeM2jz642UpPkUi/hUVpw+DgsmeE6xC0RyX9W1
         gFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864360; x=1775469160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cn7BPueizG0aOaXVcVQhQ6g9SE/PtvAJOzX0fQc+gbI=;
        b=pzYZFdBJLFQ4sGENFBIbxUcljApYXqExWxXwjqTknLBjGK/JJdUP6mbMpPcrLp+kdJ
         REAse1XMFYL1Kfz4Oh6+DpkOm7mEMSYzSiCDb0ycQ8dDVIadtdK0MhC1EKa7BZSJH1QW
         oFLoW0eqGjZSvtm6Ow4IeOjAL0QRBbuY9yPr6zB1KIOYMJXdDgazz6hvfJ+cgQ/wN6VS
         8KA1rbBK26xYo5t0m3qwuyPnSIksp57a9fZfAofBnyuT9z32royHtoBs8wGNOCotVMH2
         277K0eQ1DI1IvDIn/A1UW45W/yhK2iiTmkFNizzybzuT/pBSIUQzu1b8Aj9a10d5tFGJ
         O0sw==
X-Forwarded-Encrypted: i=1; AJvYcCU3xFz0Az4ceEDghnqXvIY1Pzd+cvzDf7NTfrPeQXXJ/OvKq9zKlbw6wu9cVfzrpX2h6Zv+f1Z1LKrvkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ0P2/w4KOyV8vvNJAUr1aUl4WMawut34Me+iy92cZILFny6WG
	pC7gqBsiecBgjuQLQ2QwwwUiEJezax1Uo0uMy4gn4EQGTjn3ZQhcDycD
X-Gm-Gg: ATEYQzzAElJwwhDVaj9IP1Wq1hK6vnQ/vjbL0+irQWojo4JUuoVEAH5I7hnPHh/w2OY
	XYn4J1V++ZRSrFakDNkyLpFfzpmTej8G90bji6MeAO3M88G3uJtw+KHqNRcglkMffqXXifV50t9
	VehBa3YQ8ymzs/ykB4c4VP3r2v15mTwOzE9oH+PsHYq7jXPm5LkEOCiBq4sI6djFQJfrcFYLqxP
	Z/t5LSIhH5Gd3C36MM7UEafLpcWi93z3BxRuNRN/zW9xUzydY/15ZzC4u8mUVhXTq2klfpDGyl0
	NOMvoRm4PUqj/37pV9o+OgH8ER0fyRApadIdeZ761cIgudBV7/UlXl+ATySdIkU4DoGgPS0BAnw
	YqSn/CP28L21AC5SxQ8BMPVjXKBZAl7kZEnpVe+/kgVd6/nL7s4EE/IVy60VAsbg1psB5WTNpMD
	cloVwG1UN6wh/24xNrh+x6rPcq3BFydpUG65JXqaO+GjZQ
X-Received: by 2002:a05:6402:528f:b0:66c:12ad:d769 with SMTP id 4fb4d7f45d1cf-66c12add9fbmr216280a12.7.1774864360007;
        Mon, 30 Mar 2026 02:52:40 -0700 (PDT)
Received: from [192.168.178.84] ([134.19.50.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b75ba970esm2306523a12.19.2026.03.30.02.52.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:52:39 -0700 (PDT)
Message-ID: <45754304-12c4-44b2-965c-fee97f839808@gmail.com>
Date: Mon, 30 Mar 2026 11:52:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Dereference correct dma_fence in
 dma_fence_chain_find_seqno()
To: Li Ming <ming.li@zohomail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20260327-fix_dma_fence_chain_find_seqno-v1-1-60e80bfb43c8@zohomail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20260327-fix_dma_fence_chain_find_seqno-v1-1-60e80bfb43c8@zohomail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57585-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,zohomail.com:email]
X-Rspamd-Queue-Id: 42EA93589BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 15:33, Li Ming wrote:
> dma_fence_chain_find_seqno() uses dma_fence_chain_for_each() to walk a
> given dma_fence_chain. dma_fence_chain_for_each() always holds a
> reference for the current fence during iteration. The reference must
> be dropped after breaking out. Instead of dereferencing the last fence
> as intended, dma_fence_chain_find_seqno() incorrectly dereferences the
> first fence in the chain.

Well once more: Absolutely clear NAK and please search the mailing list for similar changes before you send a patch out.

The existing code is perfectly correct and I can't count how often I had to reject that patch.

I think the functionality is obvious but it looks like we really need to add a comment here.

Regards,
Christian.

> 
> Fixes: 7bf60c52e093 ("dma-buf: add new dma_fence_chain container v7")
> Signed-off-by: Li Ming <ming.li@zohomail.com>
> ---
>  drivers/dma-buf/dma-fence-chain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index a8a90acf4f34..71fa173aef13 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -103,7 +103,7 @@ int dma_fence_chain_find_seqno(struct dma_fence **pfence, uint64_t seqno)
>                     to_dma_fence_chain(*pfence)->prev_seqno < seqno)
>                         break;
>         }
> -       dma_fence_put(&chain->base);
> +       dma_fence_put(*pfence);
> 
>         return 0;
>  }
> 
> ---
> base-commit: c369299895a591d96745d6492d4888259b004a9e
> change-id: 20260327-fix_dma_fence_chain_find_seqno-7adea64efe01
> 
> Best regards,
> --
> Li Ming <ming.li@zohomail.com>
> 


