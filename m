Return-Path: <linux-media+bounces-15767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E00C94767B
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 10:00:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 405391C20F61
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 08:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8121514C5AF;
	Mon,  5 Aug 2024 07:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OxiFoluR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619DA14A633
	for <linux-media@vger.kernel.org>; Mon,  5 Aug 2024 07:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722844788; cv=none; b=eU5jrejeVwf2osFy+uKWMYkJwSmguGGiRl2XOsSWMv0LseGMH4vI0uzMByRcI93D1XZStdxc65Ja9KdrcPbauYQbdijwlo1PUaLH+6JAXzlbE+/Cug7Yt5A2bxUPyf5ZQK+bkAp1HH4TNi8cDIr1y16fUizgTteFZ77w8foSvLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722844788; c=relaxed/simple;
	bh=qyiV1GhC3m5TLdS5WwV8t8H3dtagEn1cvm+78buBvbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=od9KPlGjLtEZphDRRsWe5ot6RiRlElEZxUjfG5qlgvfzq6yLBaE1Egiip0d4O1I+InvA2etg8zuTTRgpfdUCC6IRebcYPV7mAGHLoSOJIohFwE15P5f8fmm2OSSo/Dan87nSNToZkRrD3FohT2ez2Uq35m6x87RYLCy9fZcQbTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OxiFoluR; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a1d42da3baso708607185a.1
        for <linux-media@vger.kernel.org>; Mon, 05 Aug 2024 00:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722844785; x=1723449585; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oM88vPFk4kzqi6cbaKo2eNFku1B95XjFdsasoS9AADs=;
        b=OxiFoluRmaL/XefevXE6t9bmXrQjwiUAMFRiwIOiHlA0kgjkFA5ybTk2o9K4d7cH7f
         se8AquqM5KGxf8Lt/qYVq+bGLVx6Xy9FcvawaXGoTzBSnqBTHKS8CvfyMiYUpfzdHqh7
         IgL9K9dmmCGuX64KyElBFH4/PV1BWXxopauqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722844785; x=1723449585;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oM88vPFk4kzqi6cbaKo2eNFku1B95XjFdsasoS9AADs=;
        b=eyMFfMjhwoycap4YuCz4utr4IKNfWvZEEwWa2fnXRwh/GcO1avOfy1l91IoHxkMSDC
         eFKXVMbN67YsYqrcoyTDrE+0TAGKXAk0FCabrHgqPuthZ1BORT6DqtCSfif0KZqqUbeq
         03Hy1vG8zVEqW+aqZJnFz9kX0O7w/RrUNJLUnXNP1IkEvJOfDvuDXzolvm14yO369D1G
         ktiprOr8Ys93+UbgaWlGBoJ+/gQNaTkbyvtF36Tlow7dcxOEp2bIeF0uTwL9cgS4Td+Y
         CX1f6Du6JePk0vovb3ZNIXvBklDBR0UWDc4tz6+iv4wtSvwI3J+W89ULiAh7YM11kri+
         u3zg==
X-Gm-Message-State: AOJu0YwMeqS/g+bh5ftUl1xHXriw3eGv88acU31htMBGhPBSs7xq5Unb
	b9Ebr4eP8qVDm+K+u5MVXZlp4eUOllHXyYtp4UjghOIt18f/+T7Y5aR7fXsPun1guMwUJchOv+0
	=
X-Google-Smtp-Source: AGHT+IHZKkjweL5Il9i8jMiTcEltDSXYA/goiQSYRqeNIyTtO6mrfpXmB90Pmm7AHwzA/I9EoO3gzQ==
X-Received: by 2002:a05:620a:4001:b0:7a1:d341:b35f with SMTP id af79cd13be357-7a34ef45810mr1376855085a.28.1722844785563;
        Mon, 05 Aug 2024 00:59:45 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a34f796911sm321806885a.131.2024.08.05.00.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 00:59:45 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 05 Aug 2024 07:59:43 +0000
Subject: [PATCH] media: siano: Simplify smscore_load_firmware_from_file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240805-siano-v1-1-6da2bc740267@chromium.org>
X-B4-Tracking: v=1; b=H4sIAG6GsGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCwNT3eLMxLx83WSTZLNEQ0MDs0RjSyWg2oKi1LTMCrA50bG1tQDAqBm
 LVwAAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The function is never called with a loadfirmware_handler, so we can
remove some dead code.

We can also use this as a excuse to remove some unused type definitions.

This fixes the following smatch warning:
drivers/media/common/siano/smscoreapi.c:1172 smscore_load_firmware_from_file() error: we previously assumed 'loadfirmware_handler' could be null (see line 1150)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Originally reported by Hans.
---
 drivers/media/common/siano/smscoreapi.c | 15 +++++----------
 drivers/media/common/siano/smscoreapi.h |  4 ----
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/media/common/siano/smscoreapi.c b/drivers/media/common/siano/smscoreapi.c
index b6f1eb5dbbdf..3732367e0c62 100644
--- a/drivers/media/common/siano/smscoreapi.c
+++ b/drivers/media/common/siano/smscoreapi.c
@@ -1132,8 +1132,7 @@ static char *smscore_get_fw_filename(struct smscore_device_t *coredev,
  * return: 0 on success, <0 on error.
  */
 static int smscore_load_firmware_from_file(struct smscore_device_t *coredev,
-					   int mode,
-					   loadfirmware_t loadfirmware_handler)
+					   int mode)
 {
 	int rc = -ENOENT;
 	u8 *fw_buf;
@@ -1147,8 +1146,7 @@ static int smscore_load_firmware_from_file(struct smscore_device_t *coredev,
 	}
 	pr_debug("Firmware name: %s\n", fw_filename);
 
-	if (!loadfirmware_handler &&
-	    !(coredev->device_flags & SMS_DEVICE_FAMILY2))
+	if (!(coredev->device_flags & SMS_DEVICE_FAMILY2))
 		return -EINVAL;
 
 	rc = request_firmware(&fw, fw_filename, coredev->device);
@@ -1166,10 +1164,8 @@ static int smscore_load_firmware_from_file(struct smscore_device_t *coredev,
 		memcpy(fw_buf, fw->data, fw->size);
 		fw_buf_size = fw->size;
 
-		rc = (coredev->device_flags & SMS_DEVICE_FAMILY2) ?
-			smscore_load_firmware_family2(coredev, fw_buf, fw_buf_size)
-			: loadfirmware_handler(coredev->context, fw_buf,
-			fw_buf_size);
+		rc = smscore_load_firmware_family2(coredev, fw_buf,
+						   fw_buf_size);
 	}
 
 	kfree(fw_buf);
@@ -1353,8 +1349,7 @@ int smscore_set_device_mode(struct smscore_device_t *coredev, int mode)
 		}
 
 		if (!(coredev->modes_supported & (1 << mode))) {
-			rc = smscore_load_firmware_from_file(coredev,
-							     mode, NULL);
+			rc = smscore_load_firmware_from_file(coredev, mode);
 			if (rc >= 0)
 				pr_debug("firmware download success\n");
 		} else {
diff --git a/drivers/media/common/siano/smscoreapi.h b/drivers/media/common/siano/smscoreapi.h
index 82d9f8a64d99..3c15082ce0e3 100644
--- a/drivers/media/common/siano/smscoreapi.h
+++ b/drivers/media/common/siano/smscoreapi.h
@@ -97,7 +97,6 @@ typedef int (*hotplug_t)(struct smscore_device_t *coredev,
 typedef int (*setmode_t)(void *context, int mode);
 typedef void (*detectmode_t)(void *context, int *mode);
 typedef int (*sendrequest_t)(void *context, void *buffer, size_t size);
-typedef int (*loadfirmware_t)(void *context, void *buffer, size_t size);
 typedef int (*preload_t)(void *context);
 typedef int (*postload_t)(void *context);
 
@@ -1102,9 +1101,6 @@ extern int smscore_register_device(struct smsdevice_params_t *params,
 extern void smscore_unregister_device(struct smscore_device_t *coredev);
 
 extern int smscore_start_device(struct smscore_device_t *coredev);
-extern int smscore_load_firmware(struct smscore_device_t *coredev,
-				 char *filename,
-				 loadfirmware_t loadfirmware_handler);
 
 extern int smscore_set_device_mode(struct smscore_device_t *coredev, int mode);
 extern int smscore_get_device_mode(struct smscore_device_t *coredev);

---
base-commit: 2c25dcc2361949bc7da730d22de36c019c6bf1e3
change-id: 20240805-siano-c4c6a1106a39

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


