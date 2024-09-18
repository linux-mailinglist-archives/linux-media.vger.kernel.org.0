Return-Path: <linux-media+bounces-18379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 667E397B94C
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 10:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CEA728301D
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 08:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFDC6170A0E;
	Wed, 18 Sep 2024 08:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="jZqo8LkY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997E28175B
	for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 08:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726647820; cv=none; b=IOfwcUi++ZlgkbvmssPNVaVsYw4wHI5od882+QKsTGff8jhlz652hsDzf2//p4Zd0OUkLo5BXS0ATxWH0AR94tH0M1pq56bat4zOW3gyrncubuBvqQw12d9eU6l0Ml5Jzi72uSO0rIkw6Fbj2gESnBzm//A3J1PmXLWzuuHv6nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726647820; c=relaxed/simple;
	bh=/5IEvTBleS798AvFcvG7Ej9WDr2fyFzyFv8KBzmwEGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UsgSICspSXWIIOAoTkjz2QZmDMt/BuB7+pzjxws5kA8gWCJi1LHz5gq+TxCY6+zUGdQTEN4X24t4PsoWMiK7eXqMNZKIsF1dhnp8cN7XmWFEKp9FakyhHSwG5QK3/KQXgdkgsga7XEEpYJ1D/yv2b3Z6X6c2/q0crBhIbaS4xok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np; spf=none smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=jZqo8LkY; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=everestkc.com.np
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-206bd1c6ccdso49958125ad.3
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 01:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1726647818; x=1727252618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cj7vh/y2frqTNpX+KgUh7EaoShQEplhQ97z3yW6WbXM=;
        b=jZqo8LkYBpO6aNJdwLxiFvR/5bhL+fYQEG1/DB9HTnOcUXscP+D0ZZ+Aio259LVw2p
         l8j8Ypi85FTJ6VG18+xND+z+in+omzrCxHchBsSWJKOU76+rHct331jfx6RrLkwuGOqu
         vhBL5rGCqVcWDKvNxnBBsxbzuCzOCzW/Yy9C40Sz7iMGydRYQZ7kGuh+1wyCVeKuZW41
         nXHOPW91JbKCi5sManJUtOgfGBK/KJzjt4OOAjP2DxGX7HPmWXe0PKWLqH0Ne8ZBn6YE
         oe6zyEnHH0xWqDFOe5eG2FBoIuVX/a8+Kjm0SDIzjfia1R+o5wwpgg6kbv3NUedS3/Sr
         rkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726647818; x=1727252618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cj7vh/y2frqTNpX+KgUh7EaoShQEplhQ97z3yW6WbXM=;
        b=IFiFZXVOKn8Uj0mcqbn/LPf+vZ2y28HnoG4rN9shVSM5DhvbLoQG8OhSjUzVrWEY2q
         UhaBu8znJ1+soi7cUMWzMLcMipCC9k+5RdvZIw4y0dGIWohf95HIwGV4X1b8KiZn8Fg8
         9Vi0lXPPNLGRSStMy4h1Qzb5EmF/4nbLShUlL2ixCiAJeqFJmKlTm0Y4T3dR3s0Bb1rB
         ATgNbK/unouS5GZXDvWtGYiLoTDp8ZDpHGpS+zgEN6+kMAImhxlUNmeNzvq7I7g3nGgH
         NVsg1rO3kn4BOHI2a/YkcKJxBi1X1rCNI0K7JJULxp9vuOOT1vV9dYf10WwXJYxX7q3x
         ga2A==
X-Forwarded-Encrypted: i=1; AJvYcCW1HYFLCA1AJpbp7sA9ZbiChLta95MlUxDCz+WK24E7acE/vk33yM0tlP/xagpfubyFjKhFkWFKsi1Tlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjXSZs8uT9dd8e0NotNxvfVop4jBjFT3vWihFQh4uyFVKPMuRE
	cZYkubpSDafMiY92M8iTsSXKuuqQ2UD8AmyEQ/Hi4bFebGylOawIE0czVw+FS1oVPbnZd3kjUvQ
	/KGY=
X-Google-Smtp-Source: AGHT+IFaAkemKhufsn5sv7mN7nbCZYrjjcBHtJybEdesp7vxkC4JwTzE7RKsrSsGTBsVs3JkFcM0mQ==
X-Received: by 2002:a17:902:e852:b0:203:a14d:ed0 with SMTP id d9443c01a7336-20781b42d61mr325351095ad.11.1726647817574;
        Wed, 18 Sep 2024 01:23:37 -0700 (PDT)
Received: from localhost.localdomain ([132.178.238.28])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-207946d2a86sm60680715ad.171.2024.09.18.01.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 01:23:37 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: hmm_bo: Fix spelling errors in hmm_bo.h
Date: Wed, 18 Sep 2024 02:21:11 -0600
Message-ID: <20240918082203.4941-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed spelling errors reported by codespell in
drivers/staging/media/atomisp/include/hmm/hmm_bo.h
as follows:
        increse --> increase
	decrese --> decrease

Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index b4c03e0ca9c0..6d3c74156345 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -159,12 +159,12 @@ void hmm_bo_device_exit(struct hmm_bo_device *bdev);
 int hmm_bo_device_inited(struct hmm_bo_device *bdev);
 
 /*
- * increse buffer object reference.
+ * increase buffer object reference.
  */
 void hmm_bo_ref(struct hmm_buffer_object *bo);
 
 /*
- * decrese buffer object reference. if reference reaches 0,
+ * decrease buffer object reference. if reference reaches 0,
  * release function of the buffer object will be called.
  *
  * this call is also used to release hmm_buffer_object or its
-- 
2.43.0


