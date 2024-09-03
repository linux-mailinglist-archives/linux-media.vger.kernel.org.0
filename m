Return-Path: <linux-media+bounces-17484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B9896A14F
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 16:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C1DB2875C0
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 14:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C11186E3D;
	Tue,  3 Sep 2024 14:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gv4mM7ic"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BFA15AADA;
	Tue,  3 Sep 2024 14:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725375280; cv=none; b=t5ET/5/WjskU4bbPYl6aV/HsvoL/dCuDHRbf/vy9RBf5zlZELpWiwKPxJb2H/T6bsmP+lYdD1hF59VnrSoH1COJEkvOWwbd/zb4Ag3YU1h4jaS8DK8KWNfakLU2C16wZ7BNwjNZ8c+uIPafJKnUkw3VdflTbyA9XKTvOdiDWm2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725375280; c=relaxed/simple;
	bh=3AQpCg+AS9nzmfVKYNKNCZOKNz45JZdPVmUJXv+saBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zx0EmSV84qQEclE/ZL1TJoOUSKg2QA02ta25HkEWLHuVm7zzj13rL45O/i60XDb5hpMsS/57yDFJZOOAbC3qTau8/5A8Ov3pbBo6rHObd3ccGwz48qCI/0Tte7Eb9oTHtYRd0lfxj9UP1o2dNQ+khO0m8ftuhEECN0ssWNqYYxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gv4mM7ic; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c26852aff1so1805308a12.3;
        Tue, 03 Sep 2024 07:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725375277; x=1725980077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Gk6d2DdSHrdOw4Qh4rLc/5X4GJyobC1zef4qYTrCjE=;
        b=Gv4mM7icip9mPG58wXJ/+B97HihXjvKJdCpJ+J2Tfat2gzCbobUmO8cnTzFWpi6yux
         Zdh5MfLVLHXWxgnN+IS5FIvwc+V8F0GvBqBNvgtylqmkfAs94XLMmRAgY9UdyyVs5eCR
         oYNFVFiZP1rfIUTta9+ZkYQhnVJ4EmOcc08U+Bt3ceMQnmVRXY0qAZmQ+KNYyw7a1OHy
         jktNiEWGGCOzZ9IBwrXL2CDeAcZXRjuvyhXnzrOSXQ2bb2zikrgOCODD5P/ys1MhBxg9
         jvMjwTTt3GZc4PEA2+qB1btdIGz94J2dfs0vwr6D2DNNHaa7f/llBwmUIE8SuxLTKCpV
         dEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725375277; x=1725980077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Gk6d2DdSHrdOw4Qh4rLc/5X4GJyobC1zef4qYTrCjE=;
        b=FMCeV94J8f++tIKZqcULBw06mF+V/6W91eiUL1un+dX5vFho2ms6JE5qqU2f86teg9
         FPP39ZY4l6A3eGEpZHVUdtrsDFuFt84Wms/zf01e7w9CKRq7a4c0Tn8W2N3mOF9Cv9MT
         Y4DsLeLjGCYOI3+5TDENWRzHG4V3pxuYIYyrrPaKGu11uDkXxvxGSWEwW3jHwtya2B3o
         soSWUeVzokXjcO746UzGot2ac5rVU1WsZv3tjiIspEtwPJ7azTx4ZfQOw7yJwMP4g0i8
         /bUVhl0NyfuSe44I4BVrpXa7gnLgz7XGwY7AkqFKfEHHUTuDcNmEhKq7tWHU/tL5xKna
         zrFg==
X-Forwarded-Encrypted: i=1; AJvYcCWSDjD0rNGKOGWu8lzStgEVE8b1uedyQ1b33XCYDHmO0Ri0XhrWcZ4b1SmYo3FzS1GeJWUXefwCiwGcPvA=@vger.kernel.org, AJvYcCXYtRFpm00iC5BymBbFuj3qm6vuNI+uFOThABLt8GT+OB6WESaYImlLi5jbVDcuLLgGw14wO1Ja3tntmRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEd1p76Pjfz3UALIZ9Y/1bd6g/QbR9GmAvsptIJKaNe8o4vWIS
	YQu7n1HqBVenpE+p9hTX90bl9hnTOai2PnJqB7qQa6SUO5P9APB6TTs9K45a
X-Google-Smtp-Source: AGHT+IHuCk+3o0It9ADHLcqZuIA81jlk495bi8Ay1WdRTzVC1jZWpXxtrVBAm8D2gTM7ADPFBnYMZg==
X-Received: by 2002:a17:907:d24:b0:a86:700f:93c0 with SMTP id a640c23a62f3a-a89d879c339mr695316166b.35.1725375276831;
        Tue, 03 Sep 2024 07:54:36 -0700 (PDT)
Received: from [127.0.1.1] ([2001:67c:2330:2002:af84:a410:1c4f:f793])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d86cesm704677166b.171.2024.09.03.07.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 07:54:36 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
Date: Tue, 03 Sep 2024 16:54:34 +0200
Subject: [PATCH v4 3/3] media: i2c: imx290: Check for availability in
 probe()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-imx290-avail-v4-3-e4a6c0837f0b@skidata.com>
References: <20240903-imx290-avail-v4-0-e4a6c0837f0b@skidata.com>
In-Reply-To: <20240903-imx290-avail-v4-0-e4a6c0837f0b@skidata.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.14.1

From: Benjamin Bara <benjamin.bara@skidata.com>

Currently, the V4L2 subdevice is also created when the device is not
available/connected. From userspace perspective, there is no visible
difference between a working and not-working subdevice (except when
trying it out).

This commit adds a simple preparation step, which includes an
availability check, before the subdev is initialized.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
Changes since v3:
- thanks to the feedback of Dave, I decided to switch to a write instead
  of a read for the availability check.
- instead of only writing the STANDBY register, re-use stop_streaming() to
  ensure a proper state.
- reword commit message.
---
 drivers/media/i2c/imx290.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 47cfb6a9e9b5..49a5bf9c17da 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1589,6 +1589,16 @@ static int imx290_probe(struct i2c_client *client)
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
 
+	/*
+	 * Make sure the sensor is available, in STANDBY and not streaming
+	 * before the V4L2 subdev is initialized.
+	 */
+	ret = imx290_stop_streaming(imx290);
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "Could not initialize device\n");
+		goto err_pm;
+	}
+
 	/* Initialize the V4L2 subdev. */
 	ret = imx290_subdev_init(imx290);
 	if (ret)

-- 
2.46.0


