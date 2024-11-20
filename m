Return-Path: <linux-media+bounces-21696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D972A9D4369
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 22:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E788282BDD
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 21:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F501BD4F8;
	Wed, 20 Nov 2024 21:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CUVtsHNv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBC62F2A
	for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 21:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732137125; cv=none; b=eLSZVfMmUbbuAncEPbi4QMLV8DQ1wE6YE7vNIjOlpk68bkPGIxRkqpK23HL6DET5orDeljoyUHMr4Uhi96X6yBdlDyvYygLEBw3bFA+kBbvOmJPxp06+Ub714+rtHu7k4l6sJa0FmA2SwY15GsLVj1Co3nzFqNI3XSPlZLyAm3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732137125; c=relaxed/simple;
	bh=pyVjLSpMiTw485VDnQidq/L0CQUL3e54qW5+Z0vCYy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n/y+YbgrXzXGH2C4W81keKFoQyQDxSNprdsOj1let5x1QZxNfitj6Q4jaS2A8A1pDgg8G3BSOJ/Flag0fQLRfdkfqjRvlpu1s8ygTb2xUbXRlJ9wGoXIbcXp6jzamXI0fbFDty6D40rf1kbSho+2K26PKGDpXFavjAfPPuttulc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CUVtsHNv; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-460b16d4534so1296801cf.3
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 13:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732137123; x=1732741923; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BITnpHhIfot5ndtg1iP6iCWureRGb4fAjjtDi13srVw=;
        b=CUVtsHNvmxQ0fpq3R6iO4jaBzA5TWldAEN1Ql9T2QeO1ixIu9NcXj7Q2Scg9EY8/qO
         xpyLHKwQP8cMSBsQ075AIYNNl2JoLLP3CQWYtH2ZB17q6ZAsJ8tfjbr29wjarr0qwi52
         7yw6z28s7tvZ+pJxGYgKytml4iQnKMWRNOwDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732137123; x=1732741923;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BITnpHhIfot5ndtg1iP6iCWureRGb4fAjjtDi13srVw=;
        b=pGBv1FDvZw5mNw1bflLNkOT3tnFGYHPhQAzjtr2EqUBDetHwXlL0lHoR5qf4Zlvj0l
         aU+M69XN+JZ8HbayV/n+jc3RAqWuW9g37O07xSwy96gwTA9oyktBoYK/JYVFYZCQPABf
         YW7UzOreyGoHEZEhQh6N7mqNUVH9l76Imv59hlFqmLLYOXtp6HtVQMonn/nYcHVgu1wX
         4NQ7/kGAWTeZha1mkBBUsgsj18MqjSHdUrkxDUHCUHwh+Ue32c9D3M7ztGmPgJHWL5cX
         2wMjUHnmIyq4rHoSiCgHh8Nwf1uybS24l5KoAdqLPw0p88ReOHAURr6e+Qn4+sKRHNqr
         lsbw==
X-Forwarded-Encrypted: i=1; AJvYcCU/xNuj7Eywe9rUVYZryPuF6M8VgqKcbqd14C6qsexLpL6R+QzmY59JImOMz6/crsE6GZ0YDfDlS8Xkgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxawDSxVUhUv7LTPKmJeejAWeoQkt3SbRB+CPBB0phSx8fsxmUx
	xRGauVP1yrcWAnimvMhqKKVvs8cWjELqNbiQitqFwqejUBws4RGpFnu+cwSIgEuxMk0uhlnomho
	=
X-Gm-Gg: ASbGncvoz7Z0p7uWPkbAXCpKeKcw+fNBBum93h8zg1MWPq2VDAurEwguHeOIGTBy59+
	KCJ0olXnG3OcuL9r1q2pVy7D/o5Q2GEYsl7CESbVFikGJG3n8abpMeSgwwktuX208HbQDvuHNcR
	IONSv2uVnaGKjC4b7KZyed3I0ojOACXRA9zrX2OOlbJeiewzcdsvadUWVeoF/PF1/Le8JA59WDr
	XRlAafUuRtNESUcTH0LxWJ7FyqZ7/uXa1mKTOlhhMJTS0Pt+WJgVbmYcM950AyVv7tFXSd+e7Mv
	B3Oqzu7ArQT3CXepzriyjS6d
X-Google-Smtp-Source: AGHT+IEzRr0fxTT8Y7iBChrQfwyE2Y7yFgDs+Hdb/Zbs4hHa/LUIngckWbeU8KV3TKzmlYWuOkENGQ==
X-Received: by 2002:a05:622a:13cf:b0:463:17d2:4b7b with SMTP id d75a77b69052e-46479b3f4d9mr47456881cf.48.1732137123210;
        Wed, 20 Nov 2024 13:12:03 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46468bad92fsm14235331cf.36.2024.11.20.13.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 13:12:02 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 20 Nov 2024 21:11:59 +0000
Subject: [PATCH] v4l2-compliance: Do not run test requiring pthread_cancel
 in Android
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241120-sigkill-v1-1-50c667e08cce@chromium.org>
X-B4-Tracking: v=1; b=H4sIAJ5QPmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQyMD3eLM9OzMnBzdxDSTJCPjlJTk5GQLJaDqgqLUtMwKsEnRsbW1ANh
 e4hlZAAAA
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

pthread_cancel() is not available in the Android NDK. Disable the test
that depends on it.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index e9171648..71390ba6 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -2950,6 +2950,8 @@ int testRequests(struct node *node, bool test_streaming)
 	return 0;
 }
 
+/* Android does not have support for pthread_cancel */
+#ifndef ANDROID
 
 /*
  * This class wraps a pthread in such a way that it simplifies passing
@@ -3110,6 +3112,8 @@ static int testBlockingDQBuf(struct node *node, cv4l_queue &q)
 	return 0;
 }
 
+#endif //ANDROID
+
 int testBlockingWait(struct node *node)
 {
 	bool can_stream = node->g_caps() & V4L2_CAP_STREAMING;
@@ -3131,9 +3135,11 @@ int testBlockingWait(struct node *node)
 		if (testSetupVbi(node, type))
 			continue;
 
+#ifndef ANDROID
 		fail_on_test(testBlockingDQBuf(node, q));
 		if (node->is_m2m)
 			fail_on_test(testBlockingDQBuf(node, m2m_q));
+#endif
 	}
 	return 0;
 }

---
base-commit: 625e604c48fa3c4e9737fa1ec8e1d473a378ca9c
change-id: 20241120-sigkill-af4b23ddccc8

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


