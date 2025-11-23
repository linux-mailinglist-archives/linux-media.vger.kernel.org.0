Return-Path: <linux-media+bounces-47625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0FDC7E8A2
	for <lists+linux-media@lfdr.de>; Sun, 23 Nov 2025 23:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2CA1A4E12F2
	for <lists+linux-media@lfdr.de>; Sun, 23 Nov 2025 22:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD32286D63;
	Sun, 23 Nov 2025 22:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Usl72E/4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC512857C6
	for <linux-media@vger.kernel.org>; Sun, 23 Nov 2025 22:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763938312; cv=none; b=pshcBSg+YGz0njgNEY988Yzo7Ki9tjKY63s+TXNBIm+BO60VHbSZXYEHlYCHeRNoaM8cIfVipt+DYLWa7mgf+45Mdw7bIGm6Nqf3EJjWv7QJo6NlYDBE7kisXfvhdoJX/giH9GolGRn5AHk1z35eV+tN4utD34AC8aDIrgeojOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763938312; c=relaxed/simple;
	bh=XGx1f8qezWKlKgKLLZ301GCSMIBZ1JsSW3EFwWISAzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pcEmqKWYT9Mvei0JDerudVFzP9PMLCEY+//FaQLV31nMOtyfmyBqtyqs/pNFqFQs9wzrOK+eebbQ+k2hq6FpmWd2OJp3EWF1xcFR4d79H/Yh7j2ACj3DpBTsGPUfcYVSUuqfOVDYfQ6WzKpLSKsCq9oJ2ORfZP9oyFY2JGvAduA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Usl72E/4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so20956165e9.1
        for <linux-media@vger.kernel.org>; Sun, 23 Nov 2025 14:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763938309; x=1764543109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxuKr9/wD0hv1o+9Q16IeSgRkNQrWSlYyRysfxG3AMc=;
        b=Usl72E/4lDVylaOAdrgBenfNmYwPULhoCn7bcUbX9lMyLAwFpLkhpQgSbSxfxpz0Fw
         U7Zx3kltDeQeXDAJ6unFxL+Aivuml7u+pH+YdsCp2YTEGuVWvtNC1xcCd7uMu3Q/Zi1H
         So+w5R3mk2TxH/02U99gTzJNVSGSWSO0Mil8Z3yTwlYMMX7WRi1uK8f5XqOsNiqkT51C
         e625YD7BMenXbT1xQlh1jNZ+HEx5hCbLGVP0bL2vVoqbYMLH7zX/HaZb8J8gDdVHI6ik
         M7pyw1B520SlVXnVjbRibWutqDawrzaDB1cUS2V6YdZJ6TaUrsqPTLb/UdqGpThc+NeJ
         b6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763938309; x=1764543109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zxuKr9/wD0hv1o+9Q16IeSgRkNQrWSlYyRysfxG3AMc=;
        b=fVbezrSpqqL9eikw2hGunBXpRbrS2MzftoowiC8DYzv6gXVKcZVpm3Prtmv3PzWzox
         ro0H8I+O9DvSFWGo8mi34tpdCE2QYEVxQEpPz+zgswIOwwBzfNl8wsbGPbjEOnP+rasJ
         ejSAW9nIxjCroqgFbaVN252FPsYdB9zPyS2Ze60O2gT9XuqutXQhKw8j5fOy3/VZAlvO
         61gYWshoAGCH7/ODBOG4X6ylQfJ7KW0MlU02L7QcaABxq0h8tHoiWHALwEodZG/kyL3C
         tWkdGEC2f4i+yswubMFYeFqgb/xNAyR3QLseKoxtoFXVdb5jDrek9zpmtbNOXrFAtY/J
         mYsg==
X-Forwarded-Encrypted: i=1; AJvYcCXht0sRzQTthVDZdSsH+C7YAAjbnffyucY9kjs0h/BCSE0jtTxsKDWEdekY2Cg9F1uKWIanDOJWH/4MdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9XCexLXcjaASQPcszaTjdfJeOJS4BtPNXU2qekq/+dHcOaarQ
	0iVRcopSrM/Tp8VqnIMN5O3qJZzare8AfxLLZ/2R8NkmaxFZ7xWgm2g8
X-Gm-Gg: ASbGnctz/3JqhhjdoyjtVUy0D3WhUeJw7IoXU5ka56K6fEyBuUgWefZ/DwQc7ZykQC4
	BoAkDfrMYLPrfMxSa+c0AENtL7LKtmziej5pL8Kv9hvZUbAW3ARZtcWKgccR6pChGCaFnOE9t0a
	JBIxcL4V+/pBvxz+MVkki0fTw0bTe/EHBwpnLRHJiiFApkqoxmgONvSrvmCD1dfJRlBZn3x84VI
	JFXOsWGfDxtPahG9ECta+WxLv9/+sKM1PhJk3GVuPwA+FB6bhEjaRxAFlCNy12ehj3tA/79MUx9
	e52sXBSYNsPsPMlGXjf9kb97xCjwgCuGc3q3/QTBnQ4SAqATmqFuQhttC8yUf2N1iq1XBYWTr47
	jPeuV7xpEJnYBE1qt9uelOzKdb/etNNanCkkyeo9WFFZxpdh9HcIheyMpTTAOR/vUPM1cPy77kc
	3S1z1l5urTFR+Kmf4DODK2Cys/
X-Google-Smtp-Source: AGHT+IF9Tqh/ORJZEo3R5Xg7ZJWy7sWzF8MjqLc9q+tvrWwYorpVbwyCo218uq/Fj/Pad8uOgoxn1g==
X-Received: by 2002:a05:600c:840f:b0:477:7479:f081 with SMTP id 5b1f17b1804b1-477c0181443mr112383465e9.12.1763938308511;
        Sun, 23 Nov 2025 14:51:48 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9190sm24849064f8f.33.2025.11.23.14.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 14:51:47 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org,
	io-uring@vger.kernel.org
Cc: Vishal Verma <vishal1.verma@intel.com>,
	tushar.gohad@intel.com,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [RFC v2 04/11] block: introduce dma token backed bio type
Date: Sun, 23 Nov 2025 22:51:24 +0000
Message-ID: <12530de6d1907afb44be3e76e7668b935f1fd441.1763725387.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1763725387.git.asml.silence@gmail.com>
References: <cover.1763725387.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Premapped buffers don't require a generic bio_vec since these have
already been dma mapped. Repurpose the bi_io_vec space for the dma
token as they are mutually exclusive, and provide setup to support
dma tokens.

In order to use this, a driver must implement the dma_map blk-mq op,
in which case it must be aware that any given bio may be using a
dma_tag instead of a bio_vec.

Suggested-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 block/bio.c               | 21 +++++++++++++++++++++
 block/blk-merge.c         | 23 +++++++++++++++++++++++
 block/blk.h               |  3 ++-
 block/fops.c              |  2 ++
 include/linux/bio.h       | 19 ++++++++++++++++---
 include/linux/blk_types.h |  8 +++++++-
 6 files changed, 71 insertions(+), 5 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 7b13bdf72de0..8793f1ee559d 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -843,6 +843,11 @@ static int __bio_clone(struct bio *bio, struct bio *bio_src, gfp_t gfp)
 		bio_clone_blkg_association(bio, bio_src);
 	}
 
+	if (bio_flagged(bio_src, BIO_DMA_TOKEN)) {
+		bio->dma_token = bio_src->dma_token;
+		bio_set_flag(bio, BIO_DMA_TOKEN);
+	}
+
 	if (bio_crypt_clone(bio, bio_src, gfp) < 0)
 		return -ENOMEM;
 	if (bio_integrity(bio_src) &&
@@ -1167,6 +1172,18 @@ void bio_iov_bvec_set(struct bio *bio, const struct iov_iter *iter)
 	bio_set_flag(bio, BIO_CLONED);
 }
 
+void bio_iov_dma_token_set(struct bio *bio, struct iov_iter *iter)
+{
+	WARN_ON_ONCE(bio->bi_max_vecs);
+
+	bio->dma_token = iter->dma_token;
+	bio->bi_vcnt = 0;
+	bio->bi_iter.bi_bvec_done = iter->iov_offset;
+	bio->bi_iter.bi_size = iov_iter_count(iter);
+	bio->bi_opf |= REQ_NOMERGE;
+	bio_set_flag(bio, BIO_DMA_TOKEN);
+}
+
 static unsigned int get_contig_folio_len(unsigned int *num_pages,
 					 struct page **pages, unsigned int i,
 					 struct folio *folio, size_t left,
@@ -1349,6 +1366,10 @@ int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter,
 		bio_iov_bvec_set(bio, iter);
 		iov_iter_advance(iter, bio->bi_iter.bi_size);
 		return 0;
+	} else if (iov_iter_is_dma_token(iter)) {
+		bio_iov_dma_token_set(bio, iter);
+		iov_iter_advance(iter, bio->bi_iter.bi_size);
+		return 0;
 	}
 
 	if (iov_iter_extract_will_pin(iter))
diff --git a/block/blk-merge.c b/block/blk-merge.c
index d3115d7469df..c02a5f9c99e6 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -328,6 +328,29 @@ int bio_split_io_at(struct bio *bio, const struct queue_limits *lim,
 	unsigned nsegs = 0, bytes = 0, gaps = 0;
 	struct bvec_iter iter;
 
+	if (bio_flagged(bio, BIO_DMA_TOKEN)) {
+		int offset = offset_in_page(bio->bi_iter.bi_bvec_done);
+
+		nsegs = ALIGN(bio->bi_iter.bi_size + offset, PAGE_SIZE);
+		nsegs >>= PAGE_SHIFT;
+
+		if (offset & lim->dma_alignment || bytes & len_align_mask)
+			return -EINVAL;
+
+		if (bio->bi_iter.bi_size > max_bytes) {
+			bytes = max_bytes;
+			nsegs = (bytes + offset) >> PAGE_SHIFT;
+			goto split;
+		} else if (nsegs > lim->max_segments) {
+			nsegs = lim->max_segments;
+			bytes = PAGE_SIZE * nsegs - offset;
+			goto split;
+		}
+
+		*segs = nsegs;
+		return 0;
+	}
+
 	bio_for_each_bvec(bv, bio, iter) {
 		if (bv.bv_offset & lim->dma_alignment ||
 		    bv.bv_len & len_align_mask)
diff --git a/block/blk.h b/block/blk.h
index e4c433f62dfc..2c72f2630faf 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -398,7 +398,8 @@ static inline struct bio *__bio_split_to_limits(struct bio *bio,
 	switch (bio_op(bio)) {
 	case REQ_OP_READ:
 	case REQ_OP_WRITE:
-		if (bio_may_need_split(bio, lim))
+		if (bio_may_need_split(bio, lim) ||
+		    bio_flagged(bio, BIO_DMA_TOKEN))
 			return bio_split_rw(bio, lim, nr_segs);
 		*nr_segs = 1;
 		return bio;
diff --git a/block/fops.c b/block/fops.c
index 5e3db9fead77..41f8795874a9 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -354,6 +354,8 @@ static ssize_t __blkdev_direct_IO_async(struct kiocb *iocb,
 		 * bio_iov_iter_get_pages() and set the bvec directly.
 		 */
 		bio_iov_bvec_set(bio, iter);
+	} else if (iov_iter_is_dma_token(iter)) {
+		bio_iov_dma_token_set(bio, iter);
 	} else {
 		ret = blkdev_iov_iter_get_pages(bio, iter, bdev);
 		if (unlikely(ret))
diff --git a/include/linux/bio.h b/include/linux/bio.h
index c75a9b3672aa..f83342640e71 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -108,16 +108,26 @@ static inline bool bio_next_segment(const struct bio *bio,
 #define bio_for_each_segment_all(bvl, bio, iter) \
 	for (bvl = bvec_init_iter_all(&iter); bio_next_segment((bio), &iter); )
 
+static inline void bio_advance_iter_dma_token(struct bvec_iter *iter,
+						unsigned int bytes)
+{
+	iter->bi_bvec_done += bytes;
+	iter->bi_size -= bytes;
+}
+
 static inline void bio_advance_iter(const struct bio *bio,
 				    struct bvec_iter *iter, unsigned int bytes)
 {
 	iter->bi_sector += bytes >> 9;
 
-	if (bio_no_advance_iter(bio))
+	if (bio_no_advance_iter(bio)) {
 		iter->bi_size -= bytes;
-	else
+	} else if (bio_flagged(bio, BIO_DMA_TOKEN)) {
+		bio_advance_iter_dma_token(iter, bytes);
+	} else {
 		bvec_iter_advance(bio->bi_io_vec, iter, bytes);
 		/* TODO: It is reasonable to complete bio with error here. */
+	}
 }
 
 /* @bytes should be less or equal to bvec[i->bi_idx].bv_len */
@@ -129,6 +139,8 @@ static inline void bio_advance_iter_single(const struct bio *bio,
 
 	if (bio_no_advance_iter(bio))
 		iter->bi_size -= bytes;
+	else if (bio_flagged(bio, BIO_DMA_TOKEN))
+		bio_advance_iter_dma_token(iter, bytes);
 	else
 		bvec_iter_advance_single(bio->bi_io_vec, iter, bytes);
 }
@@ -398,7 +410,7 @@ static inline void bio_wouldblock_error(struct bio *bio)
  */
 static inline int bio_iov_vecs_to_alloc(struct iov_iter *iter, int max_segs)
 {
-	if (iov_iter_is_bvec(iter))
+	if (iov_iter_is_bvec(iter) || iov_iter_is_dma_token(iter))
 		return 0;
 	return iov_iter_npages(iter, max_segs);
 }
@@ -452,6 +464,7 @@ int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter,
 		unsigned len_align_mask);
 
 void bio_iov_bvec_set(struct bio *bio, const struct iov_iter *iter);
+void bio_iov_dma_token_set(struct bio *bio, struct iov_iter *iter);
 void __bio_release_pages(struct bio *bio, bool mark_dirty);
 extern void bio_set_pages_dirty(struct bio *bio);
 extern void bio_check_pages_dirty(struct bio *bio);
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index cbbcb9051ec3..3bc7f89d4e66 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -275,7 +275,12 @@ struct bio {
 
 	atomic_t		__bi_cnt;	/* pin count */
 
-	struct bio_vec		*bi_io_vec;	/* the actual vec list */
+	union {
+		struct bio_vec		*bi_io_vec;	/* the actual vec list */
+		/* Driver specific dma map, present only with BIO_DMA_TOKEN */
+		struct dma_token	*dma_token;
+	};
+
 
 	struct bio_set		*bi_pool;
 };
@@ -315,6 +320,7 @@ enum {
 	BIO_REMAPPED,
 	BIO_ZONE_WRITE_PLUGGING, /* bio handled through zone write plugging */
 	BIO_EMULATES_ZONE_APPEND, /* bio emulates a zone append operation */
+	BIO_DMA_TOKEN, /* Using premmaped dma buffers */
 	BIO_FLAG_LAST
 };
 
-- 
2.52.0


