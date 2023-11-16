Return-Path: <linux-media+bounces-465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B367EE739
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 20:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D005A1C2094B
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 19:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CE33A8E6;
	Thu, 16 Nov 2023 19:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jrz29i05"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA177D4E
	for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023 11:14:12 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6bd32d1a040so1161251b3a.3
        for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023 11:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700162052; x=1700766852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eVfmF+WaYqBufuKhkvOgsH1LmjL21XWKZ2k2AqPWwJc=;
        b=jrz29i05WeKnFRnsktJywCIU05aehODjeHgybSUHh0dVMkoFZIn7qDZHxN3GywAqdT
         HdCDtB8FebsS8XhF/FNSBItdCv/r1kMivRi8hJTGePQP7hp3+sL8VukrrBZYDEQEc4yT
         mBx1lkB1Kvej0FIFuuHg1UXlX2FIzYKOpuXWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700162052; x=1700766852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVfmF+WaYqBufuKhkvOgsH1LmjL21XWKZ2k2AqPWwJc=;
        b=e+DbdJOUcyApXW3tzmU1p+BsfELJb3HjiTkXxXsa7E9M/EzKwXNph+GdzZtXkx5S7b
         VCZC00w4qTR1ugb57kPYePvgT2gaKszo1WFKZY/tbb8PyqZQJZeWK5nsQHyzYuMAPtmS
         ne1BEJPr/zwsnfU8L9cNszdkd+n1cECPH0e9ps8Gy6ZRBcCoGCpkvHpKMEucQawbGpyj
         YuS33RXAJKIk1gDt8QUfbOPvzQfIqp5gJX66z5iwIs7YKzrXE0Cjl9QLxrTqpU/KswRR
         u+WWQiOOB6KKH1ctReq+IlNc91Ocyp5qgmkqvvczJ4+Zyxe9MNfR2tF1AnJPeObq3yiP
         lV5Q==
X-Gm-Message-State: AOJu0Yzn97prIsW5AKDm7+k5UegXGWUaHsxWo0Mgs5MFy6Dpt1s6bPuR
	XOltYeqn+QWJkyZMhyrHUJ11nA==
X-Google-Smtp-Source: AGHT+IEhiV51XKMD1zOBA5sD1OXQnyONH1asnHIR7eOg2pPSelrDFt5DBTV7MXEVihwsOKosOCrQ0A==
X-Received: by 2002:a05:6a20:8421:b0:185:876f:4f4d with SMTP id c33-20020a056a20842100b00185876f4f4dmr20888854pzd.32.1700162052390;
        Thu, 16 Nov 2023 11:14:12 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id it14-20020a056a00458e00b006c8721330fesm83721pfb.74.2023.11.16.11.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 11:14:12 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Kees Cook <keescook@chromium.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Azeem Shaikh <azeemshaikh38@gmail.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] dma-buf: Replace strlcpy() with strscpy()
Date: Thu, 16 Nov 2023 11:14:10 -0800
Message-Id: <20231116191409.work.634-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603; i=keescook@chromium.org;
 h=from:subject:message-id; bh=ujMUNo3RU3wpVThFuzKIZ2gb6sD3uJtU27PlSfCQHtw=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlVmoBZbJJwqB7WG04tbh2/UJo2fxHw9dAlFGyu
 eEfMPCM8D+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZVZqAQAKCRCJcvTf3G3A
 JtT+D/9ZzA0yA7kvOO/Y+64NFTRleFpB8MdlXKFS7ysgcMx4Q/lTBKhkKLD6qvD9NiIXGTKSGrh
 3GGTQlSXtD3gnP9vhfnsdQPxm7Nme0HfgCADjlK12TQqmzTEluquxp57OqhgDPqrFwjp8zEkEHB
 Hznzi9UF9cqj/T63wcAuGjXC8mx550cZDOzWaKfsxIIwENsPZLrbekUNeZsgQPN8un/mTeTasXh
 Dim2vXCq1wg+zmIYt4wb3MFHvAeNDMdbudLjwnaxS7KH4SAhXIV+iQTJjOW5gj+CnOEliIjO0eP
 fctBuohDOYWiyPZ/b5LKRsaNIaNLhlsKrsXW7qpvTi8NTdNME/ndlbETv7KqumwjSQtiDoIqNmf
 t4ZH9yrrcuYCaDcaA0D5Mh7Z3fyLsNgiO5WZ5JDwGOfxsVz5Ux99LctSgV9M1T6ygM6fYkp3X5/
 jHoeIUVCzQ/rFkZqtLD3RMj0C94i6hEM9oWm1/HyfB+sFVvdNn7zG+RyuryDoT2rOjrig1Y4IES
 i8Zu0UB9f03CJHQeC9RkPMDoG4U+ZEA9wgMwqQ2eNX8M3t3UGzFepxFW11XLyXTfEq8GKLh8Qxd
 qYRKZLWDQkcbtBf6aRIGrTkqc3Xw6N6aymKwpizpCz/BphPJrIy5TIkEpZI9xYTbwzO+eW77/2H
 cTml0Zt rnUC/efg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

strlcpy() reads the entire source buffer first. This read may exceed
the destination size limit. This is both inefficient and can lead
to linear read overflows if a source string is not NUL-terminated[1].
Additionally, it returns the size of the source string, not the
resulting size of the destination string. In an effort to remove strlcpy()
completely[2], replace strlcpy() here with strscpy().

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy [1]
Link: https://github.com/KSPP/linux/issues/89 [2]
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Azeem Shaikh <azeemshaikh38@gmail.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma-buf/dma-buf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 21916bba77d5..8fe5aa67b167 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -46,12 +46,12 @@ static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
 {
 	struct dma_buf *dmabuf;
 	char name[DMA_BUF_NAME_LEN];
-	size_t ret = 0;
+	ssize_t ret = 0;
 
 	dmabuf = dentry->d_fsdata;
 	spin_lock(&dmabuf->name_lock);
 	if (dmabuf->name)
-		ret = strlcpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
+		ret = strscpy(name, dmabuf->name, sizeof(name));
 	spin_unlock(&dmabuf->name_lock);
 
 	return dynamic_dname(buffer, buflen, "/%s:%s",
-- 
2.34.1


