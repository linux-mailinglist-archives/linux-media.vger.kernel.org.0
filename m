Return-Path: <linux-media+bounces-52308-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHg6Kp8EhmmyJAQAu9opvQ
	(envelope-from <linux-media+bounces-52308-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 16:11:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3713EFF881
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 16:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 719703067054
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 15:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A814527F18F;
	Fri,  6 Feb 2026 15:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8ZJSo9v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4F4278E5D
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 15:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770390374; cv=pass; b=fZ5SNDVD8NsiO982Eu03sQAI6quxP3QKP2NofyWKaVW9gYTbGO0xxZZKGwelqn1TnaeFZL9xNrqByjT/mTk+stWk5zfsInDVCscgwjSsYo5USoCJy+5vRY9qEgC925f78Ng4FFh5zViiuwbQcIJ3srnG4oKQbv8dHcE+3I3zKrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770390374; c=relaxed/simple;
	bh=OufKA992AHTujMMKlyMPMaSNXhGWNlCrvEQi1Oda2p4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jEirPZvWYTNEmJBxvBZUMT39n6ePJEOTDZcslrJtVsmeCz1tPeU0+AuXy2szmB6xPV5YvS5s0JZzuPIJE3oeKGQ0EyOXRm+QCD0Kl5RR+DxHH69KMRnBwWipImd1xOcFl2XwfqKQZR8mHwORhV3820hAjMYeyTr48zZXFhrBzBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8ZJSo9v; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-658b7d13f09so3677660a12.2
        for <linux-media@vger.kernel.org>; Fri, 06 Feb 2026 07:06:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770390372; cv=none;
        d=google.com; s=arc-20240605;
        b=JbZOYPt3ozcMFTaj8kkVweM2aYnYJwXX69Qnyw9GrlG0t2OuLVi9veE2Qr3+sff1UJ
         0hDy1A9lihjvhOmwGsvGZCRE8DpaeHvLv8Y72tc6VsSfo2CTg9hEcHax3kM9PHA3XQQD
         hYEz7QmftMhwTZmP1aizTZY8YvQGeLDzdcaJkyQPFzqMdv/dke0qWJ19V5dHLsAlw8NA
         J2FZdtChOdh5qJqvDLZj2lz75dKDIpVjZ5LJqCefC+nPAbl9ZVf+lR43LLYIPuhhEuuh
         wsnFmvlowFB4LMjlGiCPRAi3nOhjgY/vLw5NK4HAWAFCY4isGE9nGWguahTQ9S1NazlQ
         p4ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hGQBxRDZvTlf47Wu9lDxdnyR2cqQuj+x+M/+cDeQX7w=;
        fh=xxKUqMJxoBS+cN20QB/j4Av6O+vB2dlKl9hHULBQKco=;
        b=MY8Oq3WVpZepJ0P8+anvTh1a/6rTz5QXAAQbI/CMl4SRKPRs5wpbgGbZLMQ/NhQNXo
         Vu7ETQWIXt3lZjenGqCPb6qHJvPj6y87IiNIK80ncMCiz8SgZnPuL9HuFNpj4nS4mC5X
         cFHWA/eqf1ysEVEkq2ortyL94HQencso3VquHYMIV/QjXgTv3RS1a14qJN9Wa7CJTkCg
         n06XQ9XpIv/b3OTgGuI7mHVc1KHwOpl8pm0FUNOQw+VcmOrNnwcl+ZWgl1XJGDeOkLNN
         UdwlWBMJ8LIYCjmh7NWrHVnr0mBi0xjx58dX3pXgDiA1Am9GNFN3bqQDSydPJwcn0wz1
         OyNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770390372; x=1770995172; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hGQBxRDZvTlf47Wu9lDxdnyR2cqQuj+x+M/+cDeQX7w=;
        b=h8ZJSo9vlSS5hxQXXJL2q2luhnxCw60rmiHlGjAP+CKSS8DdsC2VK0+XVie7uqk+fH
         NUQ+0I13UPnygzD19MWKJM6ld6u2hnrDDLxr3HQn5EUl4xn6E2x2WuDUcCGakAouh2i4
         prDofeb8LjqBtqHIbJyq8XM6HlDKY1kCDh5HalVtOE3FvDv0c6G1+Q1ndPVrP1qaRaZ7
         bHvsjFftiFbNHfJYASqwwg6YD36l1yJXjXYp/UWYCHsg9RbsJNTMI9AGGxfL96ngTqkx
         hYgLF37th3uZaWfJD9Ios4F9Wocsg6I7ozYacy5Cl6ZkqhwwzkeZb/oywNGUDaGze76e
         8MTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770390372; x=1770995172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGQBxRDZvTlf47Wu9lDxdnyR2cqQuj+x+M/+cDeQX7w=;
        b=DSqtX20djK3xSfaljJSAox11WVN2UuxU4FMb7UveD51kbr6MjJZSpP2Qzbusskn9oO
         gDLjzTlWlPMyztwWbIWHFmXhCdYPo6EsJcJ7aqOx2NAn6KSEt6PTXK1k0drOduECGt0h
         w7O3YT3vzeMhEz5zmp6t69uLYRxTnMFKwWYvJ0vPZTHdPDAygwsdQ+Kw3CoIsrIKNZQT
         wvl2rbq+TW+WiIu+iGcvPRRxpiby9zhUNMaTl3aOfBSNseWYTVDzZY+MptxjScM+AoLn
         2z+9ziB7gxv1GVusAKWbkhY7KzjxbqtfOG2Kbzs4mtiR1I5aRhYYmcMuYygt6d8qhS6/
         fBlw==
X-Forwarded-Encrypted: i=1; AJvYcCU+Rz7eu4quUYhLC73yycP0rmRK6789ebjW0eP3iIU1oTQkrW/1IJgnPxyU0h2F/kEs6otU6q+9zebqkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoWecvCxmn4ChjjOptR17oe4fbMs4SKa/AUQqEuog18j0dvZxA
	9sHKFbpr/ttnHfbWu7e1I9Qp/mDyxenhnj5Oooda2kqx94spjCRLhzSn+E93ZBhGi44O+5YWUND
	VjjwHN//xU+ftDpdQu2VHois6SdPXKA==
X-Gm-Gg: AZuq6aI7JaWR3fHBqit1XqPa2+MyWPzWk+P6rNstPe605JqAtsYO7Z3cp0Q7srrou5V
	XmTEVmAJmb4mLiY71yXeL4PkIo0x+EgnVoAfnBcJHy6ZJnD38hn9V36qG3Ljm6pzGjAefSP7ZCP
	nj1JH5T8BV3eCjiZR3zt2ntsMdSSIYeYtx9gWlYcOEJfTekiIjrBWi6hFQTNA6Ou18ckbuSSkOH
	aPNBLsL/Eb/6FIqxszwZBqpG7WZRFNCd9n7iGeaTyEh3IQWtmt00ebBiqT5q15w0Y+lEi9/23sA
	jmyMMLsSIvkubF6cNVasmrIn4XkBYF3BzUkL36LNTr7pli8T0b/9sDMoL24A4P3o9vC4
X-Received: by 2002:a05:6402:5113:b0:658:dbf:d1a0 with SMTP id
 4fb4d7f45d1cf-659841a2f31mr1582224a12.30.1770390372219; Fri, 06 Feb 2026
 07:06:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763725387.git.asml.silence@gmail.com> <12530de6d1907afb44be3e76e7668b935f1fd441.1763725387.git.asml.silence@gmail.com>
In-Reply-To: <12530de6d1907afb44be3e76e7668b935f1fd441.1763725387.git.asml.silence@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Fri, 6 Feb 2026 20:35:34 +0530
X-Gm-Features: AZwV_QhZUfBhtu2huNeoyo9GkYijd3hbyMiyHPwiXwArHA1o3azl0x64XYjc0yI
Message-ID: <CACzX3AuNL0g_VvxMSbUu185rvn97+NpZqOVj246-9q9hAVPa9g@mail.gmail.com>
Subject: Re: [RFC v2 04/11] block: introduce dma token backed bio type
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52308-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.971];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anuj1072538@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3713EFF881
X-Rspamd-Action: no action

> @@ -328,6 +328,29 @@ int bio_split_io_at(struct bio *bio, const struct queue_limits *lim,
>         unsigned nsegs = 0, bytes = 0, gaps = 0;
>         struct bvec_iter iter;
>
> +       if (bio_flagged(bio, BIO_DMA_TOKEN)) {
> +               int offset = offset_in_page(bio->bi_iter.bi_bvec_done);
> +
> +               nsegs = ALIGN(bio->bi_iter.bi_size + offset, PAGE_SIZE);
> +               nsegs >>= PAGE_SHIFT;
> +
> +               if (offset & lim->dma_alignment || bytes & len_align_mask)
> +                       return -EINVAL;

bytes == 0 is a dead check here. Probably you would like to check the
length of the first and last segment to match with what the normal path
below is doing.

