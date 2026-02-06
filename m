Return-Path: <linux-media+bounces-52309-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELy4NDMEhmmyJAQAu9opvQ
	(envelope-from <linux-media+bounces-52309-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 16:09:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C372FF7C3
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 16:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B4D3302EABE
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 15:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF5A28469F;
	Fri,  6 Feb 2026 15:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WR+xHuiq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1DB27E07E
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 15:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770390533; cv=pass; b=qAeN0layy7v7LuIqV8K5UFd0BvHHGe3U4WrsZECPeO2rwKyiHdIWy1eSD2UPw1M5sf73stcGVtBUhbkSbkRvRskFQ61uy8nyu/ErJwUDVWbgO8NjZvxqQ0viKsitgkDg+dLMFZI3KnRYriVPEAX8D/eeaoZs3DgLiyONMJU6N94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770390533; c=relaxed/simple;
	bh=FmcW3+jk1TotXNp0abhfHHj1CNo1HgJv38wXpbipRZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mq9Xgr5Q1x/usJsXdBhqJ1gxlf1qnqCQgZ/7b2r4P2H2VLvH/ma+G8r/YS3KuIE9OGePLh0iat8XTVpShmYwvn/9MORy6/UE1MUcsQ+uAmzChD0lrFuUllidIuURFQKDdtwLG3JORTefwNJUV1LIi6RzT3Z2CXUJSqtI0tJlQH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WR+xHuiq; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65378ba2ff7so1055566a12.2
        for <linux-media@vger.kernel.org>; Fri, 06 Feb 2026 07:08:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770390531; cv=none;
        d=google.com; s=arc-20240605;
        b=CerryVldzX641T6gybcZFLsSEcW8YkcuI++ejn6PWbNyp1bXMAiq/KLk43Hs20q6+c
         SzIY2MqQS50rpLSPVv619TaLTdkOuLjXTNwIJmbM/WTXqnONSaqeyU7wnJBj38yESPkZ
         nIOFB1QQA1vgcznnA4LJiGrBv3nZyzjUqo1/+BOCUCPZr7Ow0lTD3BtphEo3JzghxY2C
         oELYuxOdoWt6wI30rDlJ6uh7iOd8CccZbnhaRKg+FKXtVM/wuj5NcHPgTPZiDZJDcpkS
         4qut3C0PaAlooGuLm8XkApCuayjyUM2+7yYOmf26AxowhQowZjQSAW8cyShQhnSQpOJB
         wf/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IV2wXVQGGux8HdfCehvXRHDBtsaFVEwot7iSA9nA38k=;
        fh=MpGRqc5uNvmO8+YmOubw2WJOah7yaH0No8GgiS2EOOI=;
        b=bOFpERQobq3FnrV84nfj3MTlvsTR+xmR4GHLQQ9hG0vger+eJFhhhMPfbTx3PYytq2
         okCBsnyWXuIxTuUDn9n6YrylfcIekCVkfLH/DYFq8V5cMayXaw75hNqqXZPe4iPTNoyX
         8KK9NzEIQJjbmGksFjDfzm6YqyHR9bl4Zl/+z9F5FCeFheP/lffUt5P6Fu4XbKRHO8/n
         /LoQCrlfsWGi2TQM3kamKDYM0Kk6L/zz5mKM25Ti7fSqdfsrCG2DSpUi12Y26YwzDo2H
         cyHbwpexb9UaxieD9iMF3t50tsZRwxwoSp116+JQy0oij8ahNom7k2d/z2smuuJ45sHA
         nWsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770390531; x=1770995331; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IV2wXVQGGux8HdfCehvXRHDBtsaFVEwot7iSA9nA38k=;
        b=WR+xHuiqvLCmeR7rhyGhO4/EwrBaQa3a6rSz1gf5I28lqTnIaym+sW0J5xNtMzszE3
         SUmp2/WeTD7mcyCB82AoY80uSjupBet0cijyEjKlIO572PNOY/h5PcRSKPib4ab9Z+4N
         /DPXqqAIH9bqx5T8gDWAubblFgKs9+y6pOgNa1a8Ah9HRPPusDwQhE/dgFeQdZcUgy46
         qEmAsWuqWsVREbHBkuG5kzqa6yY3M7PWrk3z4Moh2RJjY44U3Jo4g6IYun742m5n6Pi/
         iRddR11zq+/xH79/rzcLbGQ/Qk2Oa+LmzNUaSKdbwVOVE2YGWoYUzO7LXhaznte2lsU2
         bP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770390531; x=1770995331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IV2wXVQGGux8HdfCehvXRHDBtsaFVEwot7iSA9nA38k=;
        b=Si5+StPcsB0w9QCKv1YG75Iwd5flOvo1dT6HzkA4EntdtPZJi6iCx8A/hzd88hFaY1
         dqHsovXETGCAuNtmfDVcF7vLJ177jHnd7UNyf9lmAXw8xasTIFJMb3FVv08CQZsVtpLa
         Y7LKba62Ic2Bf3laYqA7XjfZKmKtutj4YLqWjpOkMubsi8N6lWYE/ilorpmVuWNv8jEn
         AfNCHzYFmaYs80+tM2z1G8PBA2SC8SZwv5E1DvkjZcc1V1A2pTkivdzp52IjS6XYa3uW
         KJ+RmGAoRmx374vLfmd4g2B9DZdohVD/pqp8KQxdS9Ce1QOJH+PJGW/UZJIZGlyXY8To
         3I8g==
X-Forwarded-Encrypted: i=1; AJvYcCVrA5EPCjjwH9v7h0bycdSrrEgLnMDptZ7xpF72TTxmLG6IVcyG96d8XRRBkP2P8tyxQSPcwJwW2TZLiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1TxV0mnjrhBX4g5lDVCJ4BQPQ60ExlFzEpPQ9F91QQWIbmypm
	I9PCyJS0jVcwSrjUQ98CeoM5oBW8aJWo1Mh3OOHRn92RPj5uk0wkEQiQpp+rkQheb/Ua8VJWQRv
	A1wKoyW6KeEk53gNU0ZmOMGikOsgL+g==
X-Gm-Gg: AZuq6aJBVT5r5IEAeDBLZYlKcC4J/woSpuxp4EUo1DedqrTJRh1lNcw5fB1PVYoZb2K
	TmRY5figl0X6Q8A1SXQr80yHp7cdmj/FVLU7HRcNPYGEiErttwqpXKA9VXFzBQQYl5fUCuzH1Yt
	Q/70qEGlTOjzjpDXHDXV6daUxzE/Fhgk/RhGJfb3k5s/wD77J1tC3r8xKOk9pqdrkbBwrdRgv/w
	frxkLwgL1a9jWW7UIlIOvPeGvmUA5q0rTOF+t0ASzIO4B5VSWZCLw4rKmts4JnQShfd0wEDKaBR
	WTeIjZn0RGGKoj9nX985R8b8fFwEmhhw1qUpr3ldBXFg/zUYKmr5qE84Zw==
X-Received: by 2002:a05:6402:278c:b0:64c:69e6:ad3e with SMTP id
 4fb4d7f45d1cf-65984192b46mr1665335a12.33.1770390531549; Fri, 06 Feb 2026
 07:08:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763725387.git.asml.silence@gmail.com> <51cddd97b31d80ec8842a88b9f3c9881419e8a7b.1763725387.git.asml.silence@gmail.com>
In-Reply-To: <51cddd97b31d80ec8842a88b9f3c9881419e8a7b.1763725387.git.asml.silence@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Fri, 6 Feb 2026 20:38:13 +0530
X-Gm-Features: AZwV_QhSbcTXF1vOFniIsckdgf0WRvSvELPcT6UCzLuL9aGCZaYlbLnCwaCB9sE
Message-ID: <CACzX3AupFeAy0-pPsZ51ixd7qW++LYYjiKBZ3aK5Y2JDrB_JWw@mail.gmail.com>
Subject: Re: [RFC v2 05/11] block: add infra to handle dmabuf tokens
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org, 
	Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com, 
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52309-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anuj1072538@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4C372FF7C3
X-Rspamd-Action: no action

> +
> +       dma_fence_init(&fence->base, &blk_mq_dma_fence_ops, &fence->lock,
> +                       token->fence_ctx, atomic_inc_return(&token->fence_seq));
> +       spin_lock_init(&fence->lock);

nit lock should be initialized before handing its address to
dma_fence_init()

