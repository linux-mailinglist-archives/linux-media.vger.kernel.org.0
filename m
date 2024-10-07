Return-Path: <linux-media+bounces-19141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD459992740
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 10:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1166284281
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 08:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A57A18C01C;
	Mon,  7 Oct 2024 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTVH5krJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF1B16F909;
	Mon,  7 Oct 2024 08:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728290369; cv=none; b=q4gGvwHiafVrKFoExDzFamzyCZPzZUi57TWK7eRGUO8SnUd4MRTEFdeQjmVU8oq4u3K86BfORFpnqQC7B6UZeIqxNdQvvR+/q2OTV3stYy8mANGe2B2t6mLtAZHuiQzdNeW8HAd42dW9za9dj9VsYXnzKwPN7U+/aCcrecIKOgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728290369; c=relaxed/simple;
	bh=9k7Y4c/hhOvuRWVVPUzkVMrQ1gz0vDeevhjMeJwkHx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pTRr0F0T3h3uZxa4I6WYCHcnXIaVs9tMtovR7/h6rnIk1FJaEd/x9+WohjEPTCJjdaeGyD94Upg33dRFgEcpwgRUIsB/xK2/gAEhR/uBBo6Yxv0qQudLSRJyHnNscWuXswxnZDrBo/xyRfep4vYRodDIIu0uuHbPiqG5nx628kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTVH5krJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso41540245e9.2;
        Mon, 07 Oct 2024 01:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728290365; x=1728895165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kgqgUblZEOn6S4lzBI2hhbB7tsPXrcoYH8WdcFD/Ebw=;
        b=bTVH5krJzRzqrvnGobamNiy3+u1/OVDD36Q4S74c4wUe2AGLG2Jg4r0hUMnKKYOZXN
         J/LgXKE5++TeybpTkIOJeTHQE3d2JYiQZ16ioB2u55oV4fqBjW8Y67xPL+17vrMdNf57
         MiYJoCTu6WklNkpTmpM9oIBNM5SFbB9cKwJStS/a748cCbd7Y3TrjcuwTF49MKX/jo62
         sIAOP3m4SEFiKLKIhJSlM0UpI1EP4nXmJwYklqAK7DF0eW0q5uh/gYb0dubg37FRZ/++
         1wykm8/o5FTU17Jk2sJ6qv7U74vsKb9C8zwcZgJtYoEOQyyoFPzPUl20GQrDyjlwOl3r
         sQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728290365; x=1728895165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgqgUblZEOn6S4lzBI2hhbB7tsPXrcoYH8WdcFD/Ebw=;
        b=bMpWFcNh7SkD10CBHYRApnrh62gXkUhwKRyR1CGbdosKjDpdY1PSBh1xTtoWmkLTc1
         9hdLHXvAcZAMLWsiXNOUgZxlsAIjfbTe7BNq83tY3uDsGkpwtRyuGPOapNedxWgi2Qa7
         c0w09jKAqEl9D/M5l7JcZzrzgW23kjQCnWJvMn8G35McUd2Gt2uQovp1h29w6ljb1JD0
         NL9oyF3pYyo4lTl/TXvkx8nThCUVHM553nqhZeS8SgQAUwk76foEfvzE9AcjYwYdt88w
         ETgrjggR05lJ4cQ0CxVSDmC0/WfafLaqBtQW0uIShFnULfm5xDj+4JPblpz8lVnJc65n
         j/aw==
X-Forwarded-Encrypted: i=1; AJvYcCVEbW48EIJE5zu0A+Fmp4zQKr64o+juYTJcUW4+DoDy/ozMlOWNlOgQetCLdxD9UjWTdOcTaq28+r3t1xE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3v7+DxBgzMe1CtPztW77HQTKME6z6WubiUUhTysUP8vgb7dnN
	dpBeG8CN895/6CwWUbe8TDNv0IfgKz0g1w07la0D0wyDgCXDED6dLHj34PxvBFE=
X-Google-Smtp-Source: AGHT+IEsRghjNhCM57yu1Q8QL0Y7ELKIyN1xZmdPSv7iNm4czQBnmoO90GoyuU+ZJy4nV4A6UNbbxw==
X-Received: by 2002:a05:600c:468f:b0:42c:af06:718 with SMTP id 5b1f17b1804b1-42f85aea086mr78623355e9.28.1728290364933;
        Mon, 07 Oct 2024 01:39:24 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f89e83356sm67968385e9.3.2024.10.07.01.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 01:39:24 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] dma-buf: Use atomic64_inc_return() in dma_buf_getfile()
Date: Mon,  7 Oct 2024 10:37:52 +0200
Message-ID: <20241007083921.47525-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use atomic64_inc_return(&ref) instead of atomic64_add_return(1, &ref)
to use optimized implementation and ease register pressure around
the primitive for targets that implement optimized variant.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 8892bc701a66..a3649db76add 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -558,7 +558,7 @@ static struct file *dma_buf_getfile(size_t size, int flags)
 	 * Override ->i_ino with the unique and dmabuffs specific
 	 * value.
 	 */
-	inode->i_ino = atomic64_add_return(1, &dmabuf_inode);
+	inode->i_ino = atomic64_inc_return(&dmabuf_inode);
 	flags &= O_ACCMODE | O_NONBLOCK;
 	file = alloc_file_pseudo(inode, dma_buf_mnt, "dmabuf",
 				 flags, &dma_buf_fops);
-- 
2.46.2


