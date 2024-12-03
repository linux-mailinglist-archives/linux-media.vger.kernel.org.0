Return-Path: <linux-media+bounces-22556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB8B9E2C7D
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 20:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C14F3B34074
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 17:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D7A1FCCFE;
	Tue,  3 Dec 2024 17:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4SAjdCyj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F03B1FA825
	for <linux-media@vger.kernel.org>; Tue,  3 Dec 2024 17:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733246812; cv=none; b=efQITwra0U9u7yuFGEwhdo9Gkd1w4sI8UYe1GIUn40Vwz97Io0PSLyNoVggeiQXUXyM5dECZmwbQ7GWJBkXLgUYF3ET/M4Y/eAR5Eo5DjzM6JUzF/b3RtWprMRbZiNVSWZNkLxr55v+UdGdrM0rZWE0OYZrJ+ZPz2P4jjygSx/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733246812; c=relaxed/simple;
	bh=Aq2zO2su/gJQZo1LKHbVMD9Hcz8GmXaQFYJOvJIHJUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TN6FZDPtr4Jmn0w7n4cpU8PQ0eAj83LUr3YosH8B1jmlh1sBBwPOyQy6WAlXLPPhtnRiEMmmGcjSp/AezV1+IaHz6zvK1NRMIL6K//4IV1OKVgWr04xiSNAm53ifoELxqGl1Y8FT61nvWaWP4e6vqY8gm/kHtkIiAAvhWl9ORUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4SAjdCyj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-434a9f9a225so56025e9.1
        for <linux-media@vger.kernel.org>; Tue, 03 Dec 2024 09:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733246808; x=1733851608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9A/J5jkgomsMiHFvcuDoSxKD5NJW5y7f08S/zY5zTv8=;
        b=4SAjdCyjnIkugf8ljwDjQXnvxNeDEy1R3GoxGeaOuV0Zb0CNbkf+V7fSrTVGXqKVhD
         Cq95lsNfmUSVwpWk+HDaec9oUsAlRMEIbLrmHCDQEND2gQJRoPas9IGX0OeK0z6tTckY
         IVwrqCe6eXV1AkjY3J/otecJDvb1KU6L4sjiCNVzk6o6s+MHOou8A8DEVpoEGCoU7O8R
         tAlak021kRrD++owqZ6JAHiMwFG7BE+AMYGWT5YY9ejwAUgMJYC+b7BVUsJ+eGuPbSMC
         UbGQOZo1SO7gcyygN048hQ+Y4bmLU67CX8HTrLG49d4RHQ1jFrPU7abrroLJE7AWkBYr
         IjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733246808; x=1733851608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9A/J5jkgomsMiHFvcuDoSxKD5NJW5y7f08S/zY5zTv8=;
        b=mmxjfD7iISAZJk2NPUxSZgoWTS7dUUdI/L/lY18FVsU/91j9jZrRyovDkjNvTFNMp0
         rZg7mbM/tp29rvXPagP735DRfo3QUukC/5ScJZUmN/pQLsfkSVE1hEEG7UHjuV5miwn8
         +HH63yrRy0kpmQe0RfVRodCMdvWL3O04gMkCUMGFzeeEKgLHfCmWLTo5aszVovdA7MAn
         InqcVhIe17Ya8Ra96XMsVMVLaNYYTvGPgxWZSdcN57W5rq7FJtyXNRrnoe637GZfWKhd
         8+he3wnzaDXCjxTbyE/uUEulyQAcQnyYdaGxLvSSgDpiF8fREDgqT2Cq49N0LRiOcczc
         RQBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg7tW4wR8rgDloPbSdwpifR+f12pQSXatqCokrxpL47VCR1L6MJzzm87yt6EoFE7uzZPyHEsxNsxX62Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9mX5PYWuGFSf/6fbbUZw9a0GR1SwMxjg0DhpCJBksio17XI3i
	Lg1FrP/RJuZE4NHOx8kmuLhT+o8o6eForLJ6kCtm+BoRPC0DMfreGPqLR/0fow==
X-Gm-Gg: ASbGncuaYb3KRt8aejorU+SsltjzYz6pklaKRLz9wJvljDxj+VFNFyw3YiwuM4jF1FJ
	qT4kY8yEgTkn4Q+Dw3+ROlzXypBXVYomlzhgUPPPZK7S/zjlUlxKZo1GyV6TedmcNE26E3OhPbh
	lpYVUqkYJzJQMGF2K5DtlN6dAwJAmMFHjw6pvhIb2AYDjb7oiGR7ujB8n9jinZd2uGZDrXCEQhU
	2WO8lRfr2MdowbothnXBf6PykPwjVND/TSJzQ==
X-Google-Smtp-Source: AGHT+IFZqTIc4JHhlvLFIIqiUiNlQB9koDtYePpOB1Asac3qhzzJf/qabHheeO4gqnlhnImPyoFMHQ==
X-Received: by 2002:a05:600c:1f93:b0:42b:a961:e51 with SMTP id 5b1f17b1804b1-434d04fbed7mr1401935e9.0.1733246807548;
        Tue, 03 Dec 2024 09:26:47 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:92ba:3294:39ee:2d61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f70d9csm201336315e9.38.2024.12.03.09.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 09:26:47 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Tue, 03 Dec 2024 18:25:35 +0100
Subject: [PATCH 1/3] udmabuf: fix racy memfd sealing check
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-udmabuf-fixes-v1-1-f99281c345aa@google.com>
References: <20241203-udmabuf-fixes-v1-0-f99281c345aa@google.com>
In-Reply-To: <20241203-udmabuf-fixes-v1-0-f99281c345aa@google.com>
To: Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 John Stultz <john.stultz@linaro.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Jann Horn <jannh@google.com>, Julian Orth <ju.orth@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733246802; l=1642;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=Aq2zO2su/gJQZo1LKHbVMD9Hcz8GmXaQFYJOvJIHJUg=;
 b=nHri5mQURsQCt6qUqaiD5aSYbBqGWvkkFAyFFqtmxx/10lRP3oWxueAag4of6Gz9UdJJ7j6rF
 fH9tuFCVgXJDnU7/j0wwtosFko/X7UkQaHlRmJaTrIACgXmedoy/Ws4
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

The current check_memfd_seals() is racy: Since we first do
check_memfd_seals() and then udmabuf_pin_folios() without holding any
relevant lock across both, F_SEAL_WRITE can be set in between.
This is problematic because we can end up holding pins to pages in a
write-sealed memfd.

Fix it using the inode lock, that's probably the easiest way.
In the future, we might want to consider moving this logic into memfd,
especially if anyone else wants to use memfd_pin_folios().

Reported-by: Julian Orth <ju.orth@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219106
Closes: https://lore.kernel.org/r/CAG48ez0w8HrFEZtJkfmkVKFDhE5aP7nz=obrimeTgpD+StkV9w@mail.gmail.com
Fixes: fbb0de795078 ("Add udmabuf misc device")
Cc: stable@vger.kernel.org
Signed-off-by: Jann Horn <jannh@google.com>
---
 drivers/dma-buf/udmabuf.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 8ce1f074c2d32a0a9f59ff7184359e37d56548c6..662b9a26e06668bf59ab36d07c0648c7b02ee5ae 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -436,14 +436,15 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 		}
 
+		inode_lock_shared(memfd->f_inode);
 		ret = check_memfd_seals(memfd);
-		if (ret < 0) {
-			fput(memfd);
-			goto err;
-		}
+		if (ret)
+			goto out_unlock;
 
 		ret = udmabuf_pin_folios(ubuf, memfd, list[i].offset,
 					 list[i].size, folios);
+out_unlock:
+		inode_unlock_shared(memfd->f_inode);
 		fput(memfd);
 		if (ret)
 			goto err;

-- 
2.47.0.338.g60cca15819-goog


