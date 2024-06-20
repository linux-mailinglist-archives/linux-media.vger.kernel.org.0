Return-Path: <linux-media+bounces-13775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CE8910015
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 11:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 049FBB2384A
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 09:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93D019DF82;
	Thu, 20 Jun 2024 09:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQXtiUPx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8231D19AD6B
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 09:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718874922; cv=none; b=LR5Z0TFd5hZP3vMxuciKKJqZsDp45JVkdqC0/9ptS3NRBjZhGGFRYSEAZfODre1L76Pta5/kibxfaNqp76hy5NKWBuK1zjimEbtW4IsK+Q5RfKPxXo8QcyBq2u2vEhHPVkJQ2QJzamwdtHqdowzBcV683dOJqsBD2dl6JQtpY0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718874922; c=relaxed/simple;
	bh=twrKicxt/rd7uHUWZ9PB4Nj/C1XsrWrLk7y1UUM0q1s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=utA8ksoCplfqEtZ1Jho6cpJ/ftY90Hqw1Ko9+APtH3e1AFpoykmu+J0sOXblWzk2WUWEyFEwxYJFZtncr+EOPdnQKYlv/Ep499gjDJWZ1zvLhgkB2HJwD1JH+ppNKzSHRK71YvOIA21ELZUSjZswJYivPIayp9YXYKXH535zSkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQXtiUPx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-35f06861ae6so540416f8f.2
        for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 02:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718874918; x=1719479718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ssz6l0c4GlCVyQ6sIifih4sFsZrfN+AIGv56k+ZMISE=;
        b=jQXtiUPxs/9vVbzVzViFQmJk+1jaf1Cy4WfAbNZIcvKnavNGuYniTzqU8Dxh8PfUQ6
         PPlPgvPL49gjifQ6z2J59qyRmLTHKp5HtWs/OuQpM91Zb/pLdpyLPonnJIl55NCDCT79
         joTlycjUDPI3vX4tVVjZTUdC+MRgPG77DqfwLCxWTjvVyJgw4qtyaEZLRxpdfOM4CEb5
         VgnRrAnULK72he6QKo8E9upvQ6fhZbvgzbnDoSCyYF1XgWEF8Z4yCPidd6BGLfNbqJMl
         hk+OpwzihPmo7rvzl+ASLDzOdIGc+ejsGIt3mkRsdCF2iSzx0VlaZdMAF9kYHekdoahT
         fo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718874918; x=1719479718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssz6l0c4GlCVyQ6sIifih4sFsZrfN+AIGv56k+ZMISE=;
        b=c6gQvxTbQkI+UA1+DGSvme8FB5YYlg3HJ0yi28Lxma/scu9Z/OMYDwnmtbWYjNIVWo
         xyNdgWmgCQvQHZJqldobGm/f+2o37a6GkWWYs1SfG1RCGSjL2DIaSbQY/4g7jXfaIvtF
         3WzQy7+r6b+CXO1C40+qBgENwjj4oyMJRZX6pPRMayQTnug/gpqJsmz1X/h5y9cmesXj
         DU2NSkq5Mnp1+GWExys0uAQ7RYWti8gb4k7rxTgnBvQP/HI9mbjstTIEkkavr3uPUhtQ
         ovoTxEDxv1jDiDoHKYAD3lcCjJLMmSfU/AtNvwQYqMQ02y1joJggQRAdG5Gs9geXiTgU
         XDNQ==
X-Gm-Message-State: AOJu0YzK/dqXW+3gD6fvdZmrm46X4jaWbteEp5wwD4OfJSLSpUR951Po
	epnwWEzfaEl9HUZGvHevQaqsCu7yGvPmK5r95Em6swCYHaIxiOmuKS5z6D58
X-Google-Smtp-Source: AGHT+IHcA3sx6dlxQ0suIOCsJ7mMvRCb3Xn8l97/IYGVGDDRn6Z8nnyYAz3A0jPuVyGs4Altj2IWSw==
X-Received: by 2002:a05:6000:136d:b0:365:3c04:c941 with SMTP id ffacd0b85a97d-3653c04ca93mr512886f8f.24.1718874918269;
        Thu, 20 Jun 2024 02:15:18 -0700 (PDT)
Received: from cheofusi.cheofusi ([129.0.189.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3632d8562a1sm4591060f8f.2.2024.06.20.02.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 02:15:17 -0700 (PDT)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH v4l-utils] common: Use posix_memalign for allocating userptr buffers
Date: Thu, 20 Jun 2024 10:15:05 +0100
Message-Id: <20240620091505.359637-1-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When dealing with a userptr pointing to a buffer in userspace,
videobuf2 swaps the corresponding physical pages with other pages
so we have a contiguous area of memory for DMA. This only works if
the userptr is page aligned.

The current way of allocating user buffers using malloc only
guarantees alignment up to `alignof(max_align_t)`, which is usually
16. So replace malloc with posix_memalign to ensure the returned
pointer is on a page boundary.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 utils/common/v4l-helpers.h | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index cf0e92d..92a6fdc 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -1652,6 +1652,19 @@ static inline int v4l_queue_munmap_bufs(struct v4l_fd *f, struct v4l_queue *q,
 	return 0;
 }
 
+static inline void *userptr_malloc(size_t size)
+{
+	int v4l2_page_size = getpagesize();
+	void *ptr_addr = 0;
+
+	int ret = posix_memalign(&ptr_addr, v4l2_page_size, size);
+	if (ret != 0) {
+		fprintf(stderr, "malloc via posix_memalign failed\n");
+		return 0;
+	}
+	return ptr_addr;
+}
+
 static inline int v4l_queue_alloc_bufs(struct v4l_fd *f,
 		struct v4l_queue *q, unsigned from)
 {
@@ -1661,7 +1674,7 @@ static inline int v4l_queue_alloc_bufs(struct v4l_fd *f,
 		return 0;
 	for (b = from; b < v4l_queue_g_buffers(q); b++) {
 		for (p = 0; p < v4l_queue_g_num_planes(q); p++) {
-			void *m = malloc(v4l_queue_g_length(q, p));
+			void *m = userptr_malloc(v4l_queue_g_length(q, p));
 
 			if (m == NULL)
 				return errno;
-- 
2.39.2


