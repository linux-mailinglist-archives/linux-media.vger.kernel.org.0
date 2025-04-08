Return-Path: <linux-media+bounces-29609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F65A7FE08
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 13:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 381AF169E9D
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 11:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E685426B08A;
	Tue,  8 Apr 2025 11:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fgAvkt6L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E906269CF1
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 11:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744110096; cv=none; b=heKz0OVR7ScFiPtX4Tvk4JuPOhqiODvYxzByzuX2gRQvK9QzyXO0PMikm/0BcxZ5Ab+lZT713FZ7mxSUZdhAJPNAy0ClwegDUzXUC6rD1PeiraaDBvsc3XOIwMGbTmF+nUZrjzXys1jWWt9VhtwQ+LR5fYIBJ+gDZaexShnAunY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744110096; c=relaxed/simple;
	bh=9vZ07Fu9TFUznVzjN0MD5NdxVuzdwWr225mK7qPMJLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rz1SINUoWirJPrT7d9Vma/7sGfkMzUPiaIwesVAxyuOB3H30X/P2kGeLgRqLcAN7jhoSSRMzU8xFnrt5GJV/DmgSU2gdnI4Hu6hPYp022NN3jguBhEVWdp5hgI+EmvH41N4wSdF6zS4W3MFtSjbvvxLI0wTwq0ukMTg/hSzlICc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fgAvkt6L; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so58784905e9.3
        for <linux-media@vger.kernel.org>; Tue, 08 Apr 2025 04:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744110090; x=1744714890; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NirbuKEOTyR2moljejzdS649GYkI8qfTa3FOlPaWlDQ=;
        b=fgAvkt6L6AnUQ/sC4a0Tx5fQ3HeLZ/DrMb5BkPpSBuG6jpwqx6Ujfk/Ll9y/QlqN4+
         Ne331SGeeVPkDvHMMrA7WTDhp2SzGCWTYxUNguI+X3yflfrXFz+lTOHpBnZgsVdegzHO
         WV51bHHShySZ0SlT/Wfy6/JVWtiXsnRCbr0ElDIoITs2sCx9QcdY70s8infd8PnBiGZK
         SeGZ0RkyjV/Z4J1v1TV5XUuo0zlJP7E1mu8SlNt5MdOW0JiztWqJmJ3ChbaUkiyFmRqC
         8dRQ8ZwdCya14cbjpD7OUCO+GriIFmSSX0K7FfhHOeP2oKo7ZfhkoQ6gvaa70MwLPICN
         YCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744110090; x=1744714890;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NirbuKEOTyR2moljejzdS649GYkI8qfTa3FOlPaWlDQ=;
        b=Hl9Emkfs6SNn7yIbbuh2y064ZppP5dh/vTwhdq0GQkRuD26hUxGbyYCSajiqttr/W9
         tr/1xkHnGuu1GSD6m7LVmf+xU9KVVQlAo2ELWcohQZhMxSfUxbYwGF2uIl5SPk2JxdBy
         bV81l5g2a9syvDb58RrVRWoqjNYfWD4OkpYe/YCQ/XEz4JS0OlF5MCQFoaE+TPkM1jwD
         79ZDKG+4UT562VC/SZqRY80IicDqIiexMrSxQZqEd5T1TT38pvE/jOXHBCMrSoYmcynf
         c61mpbRIIWgB9zVqTUkmFAQt5cjQsMuk4odgD9tmPA7kzFsHcVCcsBLrQAn85NevEdr0
         tQVg==
X-Forwarded-Encrypted: i=1; AJvYcCWxrDhJksDtJ6kNQbyXDAoGkZIQ7lt1xxdKpMVH4SnX6CSKPhyktMKnPb2Uh1Cpa8LpVZhmvDKvyaCu5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+3ahgVsxHO3Nku2XL+rlC3UBLG8HGxvpLU35JZgfcpbtYA+LF
	BPczla98HUZpLSyTGBUIUcJ1NF44rjfT7FBDDsJD9AUgLkHw+C72MRcg0CW5ACI=
X-Gm-Gg: ASbGncsbqu6dgUB4kk0IkSy8USp05GsWu+W7li862FfaROKO9H+e696z5+1YWITAJT6
	7atWlyBlPzKpuwKcKTHMQBp/EUuBCWDfMbbH4NrUJHPIpP7YxexCv+wq4VTWLuJZvK0FI0nNWqC
	o0uuTxuH+9ezll63wZPbr7dRAs0qmh+ZEB/tgHu0k4mMDl6IhzAlRk7loPJ90kn5XqnZDH9fJZ8
	rM9YKsEdBETT5GT4gQDZLlSsqdKiSrwPY3CE9kRCAzNB1EliT+Ivdji2dJkRtH7Sd/Lwoa3TdQe
	WScIlL8iU1nkBr80ohS1+YdZIAH/cxi0hdp7SAxnJCaA9J8NnkJb7XXjJkNf
X-Google-Smtp-Source: AGHT+IG1HG474H6q6bPpOt7xbsbQ8wAky1uvAa0teAmjbL304Djm6yn2qTXg3DoixKQK6rupsAkAwQ==
X-Received: by 2002:a05:600c:524c:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-43f1890857emr4294885e9.19.1744110090538;
        Tue, 08 Apr 2025 04:01:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec169b8a3sm159770715e9.19.2025.04.08.04.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:01:30 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:01:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@chromium.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] dma-buf/sw_sync: Decrement refcount on error in
 sw_sync_ioctl_get_deadline()
Message-ID: <a010a1ac-107b-4fc0-a052-9fd3706ad690@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call dma_fence_put(fence) before returning an error if
dma_fence_to_sync_pt() fails.  Use an unwind ladder at the
end of the function to do the cleanup.

Fixes: 70e67aaec2f4 ("dma-buf/sw_sync: Add fence deadline support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: style changes.

 drivers/dma-buf/sw_sync.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index f5905d67dedb..22a808995f10 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -438,15 +438,17 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		return -EINVAL;
 
 	pt = dma_fence_to_sync_pt(fence);
-	if (!pt)
-		return -EINVAL;
+	if (!pt) {
+		ret = -EINVAL;
+		goto put_fence;
+	}
 
 	spin_lock_irqsave(fence->lock, flags);
-	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
-		data.deadline_ns = ktime_to_ns(pt->deadline);
-	} else {
+	if (!test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
 		ret = -ENOENT;
+		goto unlock;
 	}
+	data.deadline_ns = ktime_to_ns(pt->deadline);
 	spin_unlock_irqrestore(fence->lock, flags);
 
 	dma_fence_put(fence);
@@ -458,6 +460,13 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		return -EFAULT;
 
 	return 0;
+
+unlock:
+	spin_unlock_irqrestore(fence->lock, flags);
+put_fence:
+	dma_fence_put(fence);
+
+	return ret;
 }
 
 static long sw_sync_ioctl(struct file *file, unsigned int cmd,
-- 
2.47.2


