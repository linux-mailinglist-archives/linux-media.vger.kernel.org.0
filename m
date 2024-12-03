Return-Path: <linux-media+bounces-22555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6019E2934
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 18:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A620716978A
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 17:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9281FC7E7;
	Tue,  3 Dec 2024 17:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qygmHYjK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4A81FAC3B
	for <linux-media@vger.kernel.org>; Tue,  3 Dec 2024 17:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733246812; cv=none; b=d5m3N0ZqFlWacCK/aSo0VndNMCqZSSKUUec9opV1bsBA1NB8N9qFv17UH/AfRZ3TWZRmdgMkIAA7ejBZHOlXvm9xEEblo2UmX1Adtnfpev19pvab4CFUQurdeke4fGxPcOIL8on2pmgHHmx0EaEdLIkLuW6iZ+x75aWMm78Kv6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733246812; c=relaxed/simple;
	bh=3m/LMLlH/7jMESx6X9fIIIIib4hfJn5luoPUIkkkDds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGeDuRYbj0u2KUyzyeGPmTjt7w8qcaJnFWy+OoBmPHUeXitj8C9ei09RTQ4NA4lPue3SkW3IbmSjyEK8V8phIcObu3H/zED3AlaeptABgcGS5mlkFDhSguedNNulqMOso5acdDOAUF8owRrmwQtSGXdvIpenXTJKg3o2QGco9Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qygmHYjK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4349ea54db7so56585e9.0
        for <linux-media@vger.kernel.org>; Tue, 03 Dec 2024 09:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733246809; x=1733851609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uM3+RQXTMnOQ47ZFii0e33qP4d5w9EjJgy5PSo8ovks=;
        b=qygmHYjKQarvwNSRKLUHpG64+r89RJ9syZWWveMgWVAAr3lExgEHLY8Zdbj5etLAMI
         NjRZK/MfCjZFZvRVxm4ruMI0VMGFsgp6REnI/lQSrzIZKxH3fYlJdX4wQlY5pD9eDvzY
         /bX4sO2JofKUVjmO2z0Z/doBzyGn+0flHjImQbq/tueHYe8qqu0FkfSdMs84/ogb+hC8
         /JMFFdD593bzZVSb7k852U4ikdcjLDQdEjRF99MNHVBRKmnIg9mQ5mfvcBfN0Bit0Itn
         vZBEGmOB2H7E1ZuIs4Tvv78gjrYabb0b2OSSn5xFKQ4/c4qzDLtZ5/dyIrhMj11wtFUh
         fY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733246809; x=1733851609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uM3+RQXTMnOQ47ZFii0e33qP4d5w9EjJgy5PSo8ovks=;
        b=mE0uLynikc2pnQQqEottAB1YvsyXNZ631xBbNwHspXU4hb/pJgGVnjDRqwUJN2rE1e
         QmVTjJz+PkVHtKSBJtN1yrCAsKh0KdGnaVXLHRtytbrRKo5BpS3Vz34kRRd7836J7mZy
         p9slZVDvXIlCaNAM0VNKl4ePooNVgzDJkKAsW3FjUw6H5j/YGwjhrHK7l6PBYRdMY+9E
         Z1faPCOXY0Did4ccG8r+qVTraQ5VLMRrYAvfdbOhkm8GrOnqf1OekQTBKhpt/KrT7OAb
         kJEnoPLsdWI0L7xgLXmHSsp2AERq/rwMpSrnh7KzVM2CO7WCj1Lf2tkPQsJYGnTlZ/PI
         q9zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKziArhMJ43fk7091+dNPuxT3b5yHwhi1tRWvgQ/SwB0nPY/c0A3pRPsg6VNJs/UYxJR7eARuUdlTKgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycwDKOaJsWp+4vNu9WHSGFwGAVHLArYk4t0gwemk1zg4rBvFXK
	4GGiI+Jol7rMPm7CiUsqzebpzCcGzN6/G67mRO2LjQnsBtR4/C8EOYUUjPbd+w==
X-Gm-Gg: ASbGncs0gJ93o4b8ekYk1UCy+OSiRauFrXTmnyy2e2n9qSJv1gl7/gBN1aRRNdsILTY
	XpZQf1pqGwN8eq2NaSsgpQJ+919FfGHjWqn8nvvLw3YwI8xz+OUpKdUYGcs1m6hrIf6aLx3Pl64
	q6seWHiDysB65+MO3tfODeYTzPMH0dkP17Nj+xcl5/CNdxMYjX9MnbSW9YXgy17/stSPWhA3npt
	JsIspwSiXYTdASaEA64zFTr/idsT8DYuZtftw==
X-Google-Smtp-Source: AGHT+IHah3tfnWDLN3UKIDFtEX6OxzBKzVPQiPV9mkH1uPluyyoiP9zAGpDGGtbXeYMGH6VNL1bEUg==
X-Received: by 2002:a7b:cc83:0:b0:434:9d76:5031 with SMTP id 5b1f17b1804b1-434d12b8d88mr1204455e9.1.1733246808530;
        Tue, 03 Dec 2024 09:26:48 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:92ba:3294:39ee:2d61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd3a522sm15986910f8f.52.2024.12.03.09.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 09:26:48 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Tue, 03 Dec 2024 18:25:36 +0100
Subject: [PATCH 2/3] udmabuf: also check for F_SEAL_FUTURE_WRITE
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-udmabuf-fixes-v1-2-f99281c345aa@google.com>
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
 Jann Horn <jannh@google.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733246802; l=976;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=3m/LMLlH/7jMESx6X9fIIIIib4hfJn5luoPUIkkkDds=;
 b=C68RSNAz5tSn7/At1pT+/cqpyr2/1yVHxrn2ThIXppaycwhw+jpyJIrVQd0vwYT6uWunp7bMu
 gPYbSI141ikD1YI6YQFzt61WVCUN7ejJNigEshkNyhdAZUVB/Jcx0OG
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

When F_SEAL_FUTURE_WRITE was introduced, it was overlooked that udmabuf
must reject memfds with this flag, just like ones with F_SEAL_WRITE.
Fix it by adding F_SEAL_FUTURE_WRITE to SEALS_DENIED.

Fixes: ab3948f58ff8 ("mm/memfd: add an F_SEAL_FUTURE_WRITE seal to memfd")
Cc: stable@vger.kernel.org
Signed-off-by: Jann Horn <jannh@google.com>
---
 drivers/dma-buf/udmabuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 662b9a26e06668bf59ab36d07c0648c7b02ee5ae..8ce77f5837d71a73be677cad014e05f29706057d 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -297,7 +297,7 @@ static const struct dma_buf_ops udmabuf_ops = {
 };
 
 #define SEALS_WANTED (F_SEAL_SHRINK)
-#define SEALS_DENIED (F_SEAL_WRITE)
+#define SEALS_DENIED (F_SEAL_WRITE|F_SEAL_FUTURE_WRITE)
 
 static int check_memfd_seals(struct file *memfd)
 {

-- 
2.47.0.338.g60cca15819-goog


