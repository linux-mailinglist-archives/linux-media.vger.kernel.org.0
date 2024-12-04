Return-Path: <linux-media+bounces-22639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EED6D9E3FA0
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 17:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A71DC282180
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 16:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E69C20D4FC;
	Wed,  4 Dec 2024 16:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nHtWyHxu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C28156962
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 16:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733329625; cv=none; b=FjKHi1KlbprzeflbfAACYGWQtppIHhUnaWFET+hAFW+4nHJCTwpH7/b5R4dsWgL2nXGL8jeDS/W0ySPiEmq43C7SWrg6HfHrs4osFKsVkNY/53JnjTzkPgfRRnH4K20JqcrLnzBJWbLVy1sbWtvdYLrQnG7WPmzeb2d6pxrY118=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733329625; c=relaxed/simple;
	bh=Tb4zTg8gwUbDaogCnGrqjqwGKOpD1jahUvTB+lbqtzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CVaxgYaSGdpQYK3ielyZ7S+Grf0KyLWa1hWFUENIJqu38Tc5vL4UbMYFBppEH94Tx9sXGG/9RXyrI3azySngGT6Rm2devTpYJ4YwAHWtllG76/VlEAuIAWyRkT1J9XpiYc3Y/Td0rHblwsigeyL6ClV2+9YB1feONPSLUsoVuc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nHtWyHxu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434a9f9a225so60215e9.1
        for <linux-media@vger.kernel.org>; Wed, 04 Dec 2024 08:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733329621; x=1733934421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9G1+IA4HE6z5Jl984QuG0eTi6gYVIS+JAIiJpGUT64=;
        b=nHtWyHxuXQRjOMdNrhEB6NLoK3rnkKQbbuBVs9TqL3+5rdKYuiAzoaG+vv508D/rfB
         UoJGmSYPjwXmsBGamgihduaUltJIpDcRgY/r9rV2wGxgTsZH40yPJPa3pJpUxc37rky1
         U6bTdxGhky8+oHiClGs2maV725B3l/+fm+6+RCiKt31IqGU7HRlG7+QP7rULXgFzXDbL
         exWO6ALc2aAwu3YKMwGeX6c5uqnDGK++9DVz/uUepkrwhD0egCEU2x1EI3qUTRe+t8Hk
         rHuRvAgTD6guaSlBsGyWfWUmJxJ+9nMPiRhe7WhHFoVX30SGZsb/x7fKqEDWvi1bl2Fo
         08hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733329621; x=1733934421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9G1+IA4HE6z5Jl984QuG0eTi6gYVIS+JAIiJpGUT64=;
        b=AlPFozZaulcl6KnoeNTmow/iEJiVhlYkqx4+eChW9VymcnlYD/DgHvZcNmHHWrA3pd
         +iMEpAsAgVbzdNtY89kuHWGVjJNdD4FHjGttbtj7PSnAB6+ZKiP64MdNfoxwMkv4YN4V
         7olIRoeYrGLKT6vO2P1gPY0tKJyAfAyf4wILwamy+RxM98eLMJyt/FXN01Q+kHF3hfoa
         i5cGE3gmYWeRwLdC3p4mgQH4TRcNYbloMVXjHJ5/isdGagvjb2m8TT2JukQfL3HHyvXS
         qwwA81FRUQ1eg3dB2Bx8dOaQ/rvFEfwv82BuAncRg0mfkJVyu3ti8NIFP52VUg+vhemk
         Tx3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrd1E4tzWVetmiSmGyKOE2i5R/rj+vMUN20SWK+d3572qeBkYCOYztck9qdue/7MPwP17XFNe0833QzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw09bIfrzPlUSLaJMI0b162sO2VqP3pRuhydGlUQrK/YtXcpECq
	aR2S3oNGPppyeuyW+9MPISmp5y6xRv+4lgLX4wGd8GUWlMkJ08gyhkz4EKP8bYuTh1xkNQFRBlL
	4uIWJ
X-Gm-Gg: ASbGncvUPr5730uLZ/t/La14Km5SYhZXuj43Iwo6XfSf9z0/vzFHtFv/UCdW+CEUaT/
	HYBkpuR7DlHH6cPJGzypZ/mXdkMsHZCTlj8Q5eiUy4Hv7Luwq0L+EXG8103NHtVKsSdXkWoQoT8
	zca/MeT8KOm6/2MO/1f6gj2BIXTwCFQ63FMCngFMifwHl4SjXVclE8d1fJAZXCv0VN70Hmb4sRH
	WGr6eBIZENHCAEkqf5YlpILzHVK2LoNIYbR9g==
X-Google-Smtp-Source: AGHT+IG9U1RkmAjCsaZkbHJvJ5nu4yp+BcYJp90LiOTeDBKduQ1hWfRCwdTnNEzAhSGitcQ4jLpnsQ==
X-Received: by 2002:a05:600c:138c:b0:434:9d76:5031 with SMTP id 5b1f17b1804b1-434d52a1a87mr1200475e9.1.1733329620387;
        Wed, 04 Dec 2024 08:27:00 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:4606:5fa1:8ade:6950])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dd99504csm16808066f8f.85.2024.12.04.08.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 08:26:59 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Wed, 04 Dec 2024 17:26:19 +0100
Subject: [PATCH v2 1/3] udmabuf: fix racy memfd sealing check
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-udmabuf-fixes-v2-1-23887289de1c@google.com>
References: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
In-Reply-To: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
To: Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, John Stultz <jstultz@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Jann Horn <jannh@google.com>, Julian Orth <ju.orth@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733329589; l=1788;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=Tb4zTg8gwUbDaogCnGrqjqwGKOpD1jahUvTB+lbqtzQ=;
 b=x0rM9Iqs4R9cqZm4OwMo3VWit21K6SeS2leyIeQreRfqXoZoMTJdgc0TRz3BeylxDekXItOM6
 v3yPm+oXfdYAGerYEcgb+A8uMYKhMtEJ8Hr0uOzDDVLWGCHtKOz9Wou
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
 drivers/dma-buf/udmabuf.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 8ce1f074c2d32a0a9f59ff7184359e37d56548c6..c1d8c2766d6d36fc5fe1b3d73057f6e01ec6678f 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -436,14 +436,19 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 		}
 
+		/*
+		 * Take the inode lock to protect against concurrent
+		 * memfd_add_seals(), which takes this lock in write mode.
+		 */
+		inode_lock_shared(file_inode(memfd));
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
+		inode_unlock_shared(file_inode(memfd));
 		fput(memfd);
 		if (ret)
 			goto err;

-- 
2.47.0.338.g60cca15819-goog


