Return-Path: <linux-media+bounces-50484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F41D14D67
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 20:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D7E4302EA16
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 19:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D5131195D;
	Mon, 12 Jan 2026 19:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgX8BDCi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67199310630
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 19:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768244491; cv=none; b=sNiMf3l9zgyWUebHpRdEuvTKhWgrrgtLr7cULgWxOUlNgsajxKW6kaZzmnG0jehKLL6XncETCSiNeEJv2CmmSB/EHqb2MBOPIwk2C8dnkWH0h+h4uF/PryHAtYvqllv7eITsn+BTBZfipb+RMdVzeMD8w9X6mCtrxw3+b6OkxQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768244491; c=relaxed/simple;
	bh=bkm0dOJgL8gmuag24MqBvcBsLHUFgvEsv+0tyaqpwo8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ETIhsgdUYTP0MwUulXpTNW3fQyISYHAYdaCNNnXRbkdNqGHwFOcL7UujZQ0CXkHk67Jofrq6qQirGcnrNb2izk2640R9OV2LaOQgy7ALcKtPnjhSoLyLVzu5h98RNdDkufFe2dBdQsJClF1SheYQjvxhgQKHCQpmaRHV4kQ6r9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgX8BDCi; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-81f416c0473so1591786b3a.3
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768244490; x=1768849290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cUMaw/dph/dW4TTrdxBwQWjJ+AsPkB6Ge1GrbWURqKo=;
        b=HgX8BDCi4PiF3Q6u8gSOvHC22wcyTsHGF9MTH4MQRvctrWCU5FEepPGx32NA0f5QlK
         1u7UHklWYMtOjfIe9ygJUtBk3u3ZtOgeicHOdbx/g2rxvPVBAhtMvEYe5KzNiiQntbO3
         zkC+lxI5s4153QaKXYivoLbzwEVHEWGAsGQSxAF9K9g6VKQTKrnBOcrfRDinFSipf1uv
         yFbtZTFx3JS5DKEqrCP774gwt+S6oYVqLlozrCMeLx1uzTToamQYnZYiCbsvEYK9JdU7
         41TkxP1/m07t4Wa8DwKzTV+syxovp/8PHy1p7W8bIIZhCT5Lng5nAgD+vsIS35SPJZH3
         xSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768244490; x=1768849290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUMaw/dph/dW4TTrdxBwQWjJ+AsPkB6Ge1GrbWURqKo=;
        b=tf0iWO5iS3yFhBcHqryPSlqmTXypkh1JrJIAYz67FpauH5XdxfuN0mv+oWjUdSEIwY
         oo5J4NoHoSAwIRtH7eRvva7Z7VP43S4LGGDDaYGx0UwwUbUIFBaZPQT9ninF668Y9ROs
         GvB05QycWDiUuYUJgPK9TQ04/pdSFeVScZu0r42MQ2rwjmKHKdnLCmV9LmT44JbFrgas
         8WyJ4IJwhL9Hnm95JBKxvKqiy/WmUEJrIy51zUn3sbdE0IbLBSKDsNOXG4O+4nmYbDR1
         mIDcWFGk5dsNGa8RDW//WV51KmFtO0bgkMIACGCuhu9iEIGZ89zxekprXCsBlLT7QSpN
         x6OA==
X-Forwarded-Encrypted: i=1; AJvYcCWdazIDfmkQOSjUWg1ab9GoO251v8EE2pRKhxzXWMhbUIX5vhBanSP4+m2mJ0Jy8kOvds62ssyT9wY4ag==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk3tQyZveWCep5aEvuwn6uz9v+rSoPJX3hsZ68dmwpiJwvAuFh
	S8rEX7zattpH8week7Jl8qasAYVYcU7INuRnMiEJpS0Ue2NFqQq5++Ug
X-Gm-Gg: AY/fxX73QEjsYm9Idnqx9z1ogwvrM4R+M8uRcx/o0B1wPK7C0SytmxxzADCPT9Q4+kO
	1ueLgOafsDtOHTs6qTHgZ+R82N/HKCrC8JC0v6wyvzP9Xgn+gFSy0qxuX2oGedfefyM3kvqmR4v
	zE2dTee7baj6Bv6eYKwL7Avfe9aTR2EyxbwKkCXHmQn5kLqNe+shEguAQ/rnt5cXLiI8Ooj/cBi
	JI6xdxID79DQfHbHSBEsaBsUbahtERjI+1hEIm3o/7nNP6+I5H0wR0hx9nR3jvVHs/LioksWYPV
	q2cPbHoY+8/g6qHobPtPlcv3vNYLpWNA27eQmpXtB+tmQU05FXRihmaxhzaQMlBHPHx/Nd4zYm9
	GPoJWzEaw93UtCgJJMzJwJuwvIFzXBZzsbe9SdOriF3aSjvj5CgnrMwDti8QdH9Ogyr9c2pX7Bn
	ZBHrrOvwlnEsQ226GuAqsJeoH+LsRRu5N2MPjmWU+A8A==
X-Google-Smtp-Source: AGHT+IEymeO6/t7nAwwrBWvbeV1YQ13aBa9Q+VA8QAC0uiGshEP7LT2ithDNR03j+4ovta5dv0rq9Q==
X-Received: by 2002:a05:6a20:2452:b0:366:14b0:1a30 with SMTP id adf61e73a8af0-3898f9c74b0mr18366795637.62.1768244489567;
        Mon, 12 Jan 2026 11:01:29 -0800 (PST)
Received: from LAPTOP-PJU7MKF4.lan.iiitm.ac.in ([117.250.157.213])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c54972a5e67sm11164366a12.35.2026.01.12.11.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 11:01:29 -0800 (PST)
From: Anubhav Kokane <dev.anubhavk@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anubhav Kokane <dev.anubhavk@gmail.com>
Subject: [PATCH] staging: media: atomisp: refactor sizeof(struct type) to sizeof(*ptr)
Date: Mon, 12 Jan 2026 19:00:53 +0000
Message-ID: <20260112190054.9828-1-dev.anubhavk@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the variable name in sizeof() operator instead of the struct type.
This prevents errors if the type of the variable is changed in future.

This fixes checkpatch checks:
"CHECK: Prefer kzalloc(sizeof(*ptr)...) over
kzalloc(sizeof(struct type)...)"

Signed-off-by: Anubhav Kokane <dev.anubhavk@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index bb8b2f2213b0..60f705fac3c7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -696,7 +696,7 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 			ATOMISP_S3A_BUF_QUEUE_DEPTH_FOR_HAL;
 		dev_dbg(isp->dev, "allocating %d 3a buffers\n", count);
 		while (count--) {
-			s3a_buf = kzalloc(sizeof(struct atomisp_s3a_buf), GFP_KERNEL);
+			s3a_buf = kzalloc(sizeof(*s3a_buf), GFP_KERNEL);
 			if (!s3a_buf)
 				goto error;
 
@@ -715,7 +715,7 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 		count = ATOMISP_CSS_Q_DEPTH + 1;
 		dev_dbg(isp->dev, "allocating %d dis buffers\n", count);
 		while (count--) {
-			dis_buf = kzalloc(sizeof(struct atomisp_dis_buf), GFP_KERNEL);
+			dis_buf = kzalloc(sizeof(*dis_buf), GFP_KERNEL);
 			if (!dis_buf)
 				goto error;
 			if (atomisp_css_allocate_stat_buffers(
@@ -737,7 +737,7 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 			dev_dbg(isp->dev, "allocating %d metadata buffers for type %d\n",
 				count, i);
 			while (count--) {
-				md_buf = kzalloc(sizeof(struct atomisp_metadata_buf),
+				md_buf = kzalloc(sizeof(*md_buf),
 						 GFP_KERNEL);
 				if (!md_buf)
 					goto error;
-- 
2.43.0


