Return-Path: <linux-media+bounces-59986-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHyTIjok8mlmoQEAu9opvQ
	(envelope-from <linux-media+bounces-59986-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 17:31:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1909E496F0C
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 17:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0073301727A
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 15:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF5D37F721;
	Wed, 29 Apr 2026 15:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxbT4MqG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9399737E2F8
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 15:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476401; cv=none; b=JnwM/Ta9zd5g+2OIHNVT9FGh9R+dZNRihr8qG+S8pab/kAY+1sTf38M+8eScEIRxf/KUsD5xAJRkwRIwnw5xLEbJSxagrUAOdxb1uNl3YOsnQE64kB6ys5KMTvUu4y9IM9BMF0CeTa49KXDNddRWNzyDdZeIMGiQY04P9JGxlwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476401; c=relaxed/simple;
	bh=Rg4ViyjWjJ0uH1MionkRUKz+M0sp6VZkQ9UyDJex3kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0akUxskZO+ktSS6fcR5L42Hxk2elenLFA77MCxuxw8WREGoCV/pDx+9Fp6bfPzKSrM5BCCu9J9oEQt2crzSiu/WoxucjeOT+gyHJzlWvxCDQS/JB0ndREOjj93hlZVVVKhiYH4NovpWJYGZawl/q/wcPjLr2/iL0Ze1se8lJFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxbT4MqG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43eada6d900so12149096f8f.0
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 08:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777476393; x=1778081193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOTrV0WGracSIFm0V666o5CRu83OUP8NlZEfiWwVSJE=;
        b=ZxbT4MqGYb41heJHzUNkeNrQqqbwivoko4YMr5UyQTxSL8WB1OyORAio38DxntrS6u
         auZrBgzdXlS/Zd+QO9j19xJeT986+p4M04JYGsA9Cy1qY7tyv6ZXSsqeu3lOu5KcvgSf
         bwH040Jp458XcQ78nGYH+2kcXG0HqNQhcSaQEopmU66xpyEEMarI7UgAdVTwheElzo5Z
         2HR0Fn7PnbcP6s0xfsjdbr5X0o3yQ4BN/63ISgNQnvQCaJQJJrImNwWpwl1p/TSCFX2Z
         otPWWi2MPrnCArGZBi2AILWhP9XjXJtLKVR4fjzxCf2rtAdcaSa+MtvsIi8IVnFvQkLk
         9NQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476393; x=1778081193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nOTrV0WGracSIFm0V666o5CRu83OUP8NlZEfiWwVSJE=;
        b=ZuTN8jlUwBoCHHDcEdjBUqND/HwDT4UQegrZ7p6jTOFwqWtEfYedscNn6DYOk/dCdd
         zVzl4q83T0m48PY6YetvDYA705A8GQE0JG5RCuWu1SzvqSJGazue1EuLZiO+iGCQdClH
         fVrlQrvA23xzqXyLK68iUpCyprQPBXadZeshTgIQIPHFe/dtgDXYt388DRP7lScLVkKC
         n5FrL74gsNzY0dEC21+0CqIoohVsrLFaQ/vj5Log5ZBlx8/Bz6DM2gQa2VexXn/WEM5m
         vA9Jac1y0lO5nsnLvXtx4uVXiE0bTxn/6TD88luV37XAxSUDbgOCtWVLDS3EMKzQp6jw
         n8mA==
X-Forwarded-Encrypted: i=1; AFNElJ9CQv2j201We/T4S7XlEWEWswfbEQ9uL7oFjAnCUtxsROqck66RESu4wgekTwA0dkSAvg1ubIdgDstuxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhPXxCLXgVMssRrTzs4GbWZ4oclr9jzX8xUlCCGdaXRIrPkTnp
	Lx4I1953G/sWinkfHqRocBLkiwxKX7Y/UD00GlGyskuRLEi1aTLxcFnz
X-Gm-Gg: AeBDietPsqvSMZbolAacecFAljULLgZEm4W2PXChvHyVOJVqriLxQO6Zq5y+eZ3zxEU
	M1fR8cUnSxSWi3DlL7i1JTAxJsqMoDqJvKdxHUSRnrDyZ7VU+JQ/CT2Sid9k8m4dsxAM/9vUS5D
	eUz6w/kHcu/DjK5OpCJ24P35AGX/h/57Gs4xoVns4tE/bOlCDIx7SmVDdGSKadCcHiBMK7gul2K
	VBobcx65YXvxOFtEdvdFx71q1k6dwXY3+W8fvlSbZnwoSNmT/DVpNhoS8D/WDjXjBjr1sawNTKA
	3b7U7U6qoNxuYbLXFJngT/ldp2tDRAkaQ/mhwZMZ9eLuDl+L7Dy/Spsa9p/7SuPAoNh3RXcqgBx
	4tF3d97OhM61+fKuu+knslWDbzJPx6J4SLqNXt5giLlKil0PIwbLIs9iVza4K2popQZ+bZWx8mP
	UsxQLEyP7moO7R08NX/Le7IOh7wyMXCpZpRWNVJ8IoyJpeYz9yZWfmnHqfwf8z1Xqf7gY2QFsOI
	n9RFQDZQKSuzyGS3dr0O+pnQr/kzsaI+/+koTiJBOhF
X-Received: by 2002:a05:6000:250f:b0:43f:e41d:85f2 with SMTP id ffacd0b85a97d-4464839c9bcmr15101656f8f.2.1777476392719;
        Wed, 29 Apr 2026 08:26:32 -0700 (PDT)
Received: from 127.0.0.1localhost ([82.132.184.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5c22sm6382951f8f.28.2026.04.29.08.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:26:32 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	io-uring@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Cc: asml.silence@gmail.com,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>,
	Tushar Gohad <tushar.gohad@intel.com>,
	William Power <william.power@intel.com>,
	Phil Cayton <phil.cayton@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v3 03/10] block: move bvec init into __bio_clone
Date: Wed, 29 Apr 2026 16:25:49 +0100
Message-ID: <43a91f54d61d3329316e40c69ace781b4d35fe0b.1777475843.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777475843.git.asml.silence@gmail.com>
References: <cover.1777475843.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1909E496F0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[gmail.com,samsung.com,intel.com,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59986-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[asmlsilence@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

To quote Cristoph: "Historically __bio_clone itself does not clone the
payload, just the bio. But we got rid of the callers that want to clone
a bio but not the payload long time ago". So let's move ->bi_io_vec
assignment into __bio_clone(), so we have a single point where it's set.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 block/bio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 4d46af0cd256..0734b50d4992 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -851,6 +851,7 @@ static int __bio_clone(struct bio *bio, struct bio *bio_src, gfp_t gfp)
 	bio->bi_write_hint = bio_src->bi_write_hint;
 	bio->bi_write_stream = bio_src->bi_write_stream;
 	bio->bi_iter = bio_src->bi_iter;
+	bio->bi_io_vec = bio_src->bi_io_vec;
 
 	if (bio->bi_bdev) {
 		if (bio->bi_bdev == bio_src->bi_bdev &&
@@ -893,8 +894,6 @@ struct bio *bio_alloc_clone(struct block_device *bdev, struct bio *bio_src,
 		bio_put(bio);
 		return NULL;
 	}
-	bio->bi_io_vec = bio_src->bi_io_vec;
-
 	return bio;
 }
 EXPORT_SYMBOL(bio_alloc_clone);
@@ -914,7 +913,7 @@ int bio_init_clone(struct block_device *bdev, struct bio *bio,
 {
 	int ret;
 
-	bio_init(bio, bdev, bio_src->bi_io_vec, 0, bio_src->bi_opf);
+	bio_init(bio, bdev, NULL, 0, bio_src->bi_opf);
 	ret = __bio_clone(bio, bio_src, gfp);
 	if (ret)
 		bio_uninit(bio);
-- 
2.53.0


