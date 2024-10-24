Return-Path: <linux-media+bounces-20203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5245E9AE540
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 14:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B1A1B24A50
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 12:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573FA1D9A42;
	Thu, 24 Oct 2024 12:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7s3A6lx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BAC1D514A
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 12:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729773731; cv=none; b=YRxMWDMbEOKa7jhq/vUdEA+T9KbMsXz0oiAvA1SQXlpdel4oM01LAwOxHCIpvZhUTgAmRlReP/ES9ma0Vs9/XZp4Poky2w5Xl8kh492Ezb3CSVgVGdLv5k+yEoRf3n0aa2qVfBx8c95ATeCxTVej6rdi+A/6C09ymBe723SVy0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729773731; c=relaxed/simple;
	bh=kA1Is1tzvMMt5XF5yOp6RSEO+0aIBAH68Rx0bo4ACYw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uE3OEPQYIK90AwqfNV3Udk2azpgaSb38GxMNlNytTTeNDzB9ZmL3zXaCcZT6w5uqhECCYaIyqDVTBWMaWhfcA3b8ahyOtLP3M/IkhvipnMW3vojSD1BSgzFE9vhxM2xDuC8ALI/CItnHCnjefE2jv3OqVE5xtKkGrjPXxZ3ld64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7s3A6lx; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9a5f555cfbso53257866b.1
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 05:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729773728; x=1730378528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sj6gTNhuF8KQ+mC8FcVavaAooc7DkgFZVC/sO2AOejw=;
        b=L7s3A6lxleKcJBKtpIw6KKV001Bj0pzvT0I8ph+VNAzUodw241CejsTCNi+3Hk5n34
         ZNY+jqkL/iXRf8TFfaQDpbA6SReUSyrL2G+E0NdS+V/gdlpHxX23jzNCFN8AGd38mJxF
         NxwrBV1IBk8NDScfE34TaKwOojQ2Int8XtwYq2xW7ltKWpPdAdE8+FiqQnXLy5tVcIls
         WOXSrRS4o5ANjJBULQqpRXM8aNFV45ZDhAW5tVI9/QxVSqlTlLoJ5esL/+TaGqdqIYK8
         9Kti9TiqW1Ir8zDDFZFO4QAM0CYofHCizZ0x8AxJiMRuF14NrRTldAqr6wctYzIf8wpU
         nFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729773728; x=1730378528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sj6gTNhuF8KQ+mC8FcVavaAooc7DkgFZVC/sO2AOejw=;
        b=FPNsegtNZRAjxfNYhQecGQxiSPkO/M0rJYV5VdbvqhF+w5QHJD+5i/7mkeuWDNC+kS
         uBB0OZ9qzHLcEjUcwsta0ty6k0By9XnbqndJAk9wgOLpOUoL0pYk3t1bEYOdV263MCTi
         OFwyI3XxK8FlFlHYYHZAPHz0MW0Ceaz2J4ylo/b2L8X1SymAtAxGj34v7CEAxLqecYm5
         ovq4DiacoZ0vw0gHe69xbjV/z063O/hNuuIQciX4CSiDtCssPzc/9lZwV3xzNff8uD5O
         T9utbGTe991L4SCtKjjpn0tAqalyhxNS4qb0WNYF2+8L2sDGz67/7VZHCU5yf93Xchwv
         hPlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCeqXvav7K5NcJs+5+esHyT+4lifC7ruVkbFrY1zWGhqnw2bLRlgayeOgGA2yf8/aeZcG22BhRKEKCDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz6ckcCSV/5SuTj4/+jIyMwRKdvLIq7LBMvQHxrn6wFYNin4HL
	YzEzT3VX4pO8pFPpIKaAGBo2NSt7JBsXHjrRXazlegYIvhRMxr0L
X-Google-Smtp-Source: AGHT+IEEuTA8PMmVuhARSpT0IT9Dw6qAIi5njqx7dcLq/evV3H2wVxDBE4GcYae26HsdPCERft1Agg==
X-Received: by 2002:a05:6402:5d3:b0:5c8:9529:1b59 with SMTP id 4fb4d7f45d1cf-5cb8b1e9c71mr5459788a12.20.1729773727785;
        Thu, 24 Oct 2024 05:42:07 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1550:4200:da3c:7fbc:c60c:ca4b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a65419sm5623026a12.25.2024.10.24.05.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 05:42:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: friedrich.vock@gmx.de,
	Richardqi.Liang@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/3] dma-buf: sort fences in dma_fence_unwrap_merge
Date: Thu, 24 Oct 2024 14:41:58 +0200
Message-Id: <20241024124159.4519-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024124159.4519-1-christian.koenig@amd.com>
References: <20241024124159.4519-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The merge function initially handled only individual fences and
arrays which in turn were created by the merge function. This allowed
to create the new array by a simple merge sort based on the fence
context number.

The problem is now that since the addition of timeline sync objects
userspace can create chain containers in basically any fence context
order.

If those are merged together it can happen that we create really
large arrays since the merge sort algorithm doesn't work any more.

So put an insert sort behind the merge sort which kicks in when the
input fences are not in the expected order. This isn't as efficient
as a heap sort, but has better properties for the most common use
case.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-unwrap.c | 39 ++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index 628af51c81af..d9aa280d9ff6 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -106,7 +106,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 		fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);
 
 	count = 0;
-	do {
+	while (true) {
 		unsigned int sel;
 
 restart:
@@ -144,11 +144,40 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 			}
 		}
 
-		if (tmp) {
-			array[count++] = dma_fence_get(tmp);
-			fences[sel] = dma_fence_unwrap_next(&iter[sel]);
+		if (!tmp)
+			break;
+
+		/*
+		 * We could use a binary search here, but since the assumption
+		 * is that the main input are already sorted dma_fence_arrays
+		 * just looking from end has a higher chance of finding the
+		 * right location on the first try
+		 */
+
+		for (i = count; i--;) {
+			if (likely(array[i]->context < tmp->context))
+				break;
+
+			if (array[i]->context == tmp->context) {
+				if (dma_fence_is_later(tmp, array[i])) {
+					dma_fence_put(array[i]);
+					array[i] = dma_fence_get(tmp);
+				}
+				fences[sel] = dma_fence_unwrap_next(&iter[sel]);
+				goto restart;
+			}
 		}
-	} while (tmp);
+
+		++i;
+		/*
+		 * Make room for the fence, this should be a nop most of the
+		 * time.
+		 */
+		memcpy(&array[i + 1], &array[i], (count - i) * sizeof(*array));
+		array[i] = dma_fence_get(tmp);
+		fences[sel] = dma_fence_unwrap_next(&iter[sel]);
+		count++;
+	};
 
 	if (count == 0) {
 		tmp = dma_fence_allocate_private_stub(ktime_get());
-- 
2.34.1


