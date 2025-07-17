Return-Path: <linux-media+bounces-37924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72380B0826E
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 03:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D43B5A41C55
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 01:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DB92116E9;
	Thu, 17 Jul 2025 01:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxhDSEf/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033951D7995;
	Thu, 17 Jul 2025 01:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752715847; cv=none; b=JXSSRqNmtfiJ4UzmFDMMF4nl9AUi2hrKcbpw9YiBcCyDWgXWwUoC9hMhSbWq8MQVP70n0dp9qWP8IHBeBfKobgD9GWiezTOhIkv0PRWoQnIqZAbe0U9h01mRhl7m6daApn97dggVeg4HSIxf3a/r1Y/RTUXIpc7QZLsKVSKTs6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752715847; c=relaxed/simple;
	bh=t51vLpvwGCji3WfHfop/1c3FGfyG9mabn/HIMUh4ovQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dIDG3eB3F+7m6h5yIspOSWG01pS9wKoifQEbK1fvPaa4q9ZAj9cRqZ9SjM4mFT+VJDOksfpAaHQBuI72scX5ndhQO5Wm9XL1FjFYHYvvMHrRwlTp/cavt9ntKz2MUc1UdJh9NQxYf9MOXxLYhya0teR0a/Kz/l9K7jcA7DQND1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxhDSEf/; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so67719f8f.0;
        Wed, 16 Jul 2025 18:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752715844; x=1753320644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H+kklIjjiVUrQ0AXButuBYND4S6p/85t9mFfj0+LcY4=;
        b=WxhDSEf/8QtWC+VTFqiGykBn/XwlKQszYzFcx8spZob4uw2fHLlOYhhikT8OzqwYS2
         QZNANG9hZUJCJZMS4X7VXD1n1jbe8aivkjn93LYDJvIV1Oq/CY43Xm+kvS58ytFz7hR5
         kqvD2/b3g0tq1LXIUR1reC/TLCSGCzGrSUSfIK3pfXBuZZIdrwHbt0SqxAcxrUPyoZWN
         U+IB1xzMLGAREyz0eEFFLRUHX8ZceGsgqd1YDbQfDE8tq/i5imyteYfr4Navg8Qf6YqR
         us9JEhCCpHkk367IhlBpPCOX+nhkrUZ+c4cTBZCKh13bI4LwwNTRMJFfJpG6Lxt+LNlK
         zQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752715844; x=1753320644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+kklIjjiVUrQ0AXButuBYND4S6p/85t9mFfj0+LcY4=;
        b=N1XL5irKXgYpn2PZ4p8DdEjPmHU4SP5GQCmJQNLMgojYfweKuLkjP62mxnJV6Zt5SZ
         roP3f8FIRFAoeTbURsWaRf0+JrOF7AH1BwHvgBMr83sz1m82ihRqgl3VtFShA6kkJXn4
         R191JO5Tekqj/+nOyoG7KtweFFxTrKFc6PLnX9OPfKA8kbGMqPBpymaL9L+cXjm0Kse8
         bm/60004sskO2xfR5lfl/l9VqRk1MR+CyYLdDm6iblOMyNp/aYO6VxW8Ba6wJIaydNaX
         59Q5DY+Prt0hEZljEeZRdb0C0nFSahJZx/YtUssj/7+FkYXsPtjmzjAg9d/v6RXGEgMP
         cfVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUV6CgUVeSbAxx7kX4odexZ04+ghGdMy8Mdq4pkYYWufehh5kPy/tO7J+Ga8OPLXgFMch5qm4vLxla2Ug=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRGiUkAOZleuSoim7tyB/SxYiM38EYlIbHlQq/pusylspqGSR5
	CNWtt6cl+LW5+oaRtp3XoGCumYmCkjF4AzdjEz/oe1VBMMDSiSQuhVQr
X-Gm-Gg: ASbGncsPepXUeNrLtLYMzVEV6D+l7mGlDPn+NH7uYv1QYqrZL2Lf/AHhczd0YKEV3sP
	hX63kJo33I3Gr8FA67tDsDs+tJ9IBKNR/iuMw8wZ3ILjdUZjI2NtoYGJ25ZonL2drQeUhG1EFCc
	w0ENqMc+uxmrvqpoU7rkw1yF3+fyVfNgDJ8+NwYh86IWjaan+CRMRMUKFNyJu+UGlT+r1YaSkS3
	DxrUOjivp+goaf7cmLMUWFGC4fRCB3Xz+2kY7gLEf6ZwyU4MtAsZL5ElzaU0nwTlVmjp0oTnUjE
	fPo+z6EpeNZ8967QDDB7Vh3DdtulUGwWeHzynvmtyhTgLckXGj6eBCqWxsUaqwW3pFV8jTXY72c
	xHbYmiNSJC+7rYSyOGnPEJwRjVtLZ7H1q4v5t560qUXI7D6ODX2+fv3ESDVzL
X-Google-Smtp-Source: AGHT+IGuAQHAVt+Ejfc6IMxLjZrv3iHwTroSL4krgJeFWI/p8To0LpPVCPV4Mn1dJ4YTjmmAm1Gn9A==
X-Received: by 2002:a05:600c:530f:b0:456:2137:5662 with SMTP id 5b1f17b1804b1-456338a25f4mr8234185e9.7.1752715844013;
        Wed, 16 Jul 2025 18:30:44 -0700 (PDT)
Received: from localhost.localdomain ([154.182.204.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45634f6bc51sm7204555e9.17.2025.07.16.18.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 18:30:43 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: add missing mutex lock in atomisp_s_fmt_cap
Date: Thu, 17 Jul 2025 04:30:03 +0300
Message-Id: <20250717013003.20936-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function atomisp_set_fmt() modifies shared device state and expects
callers to hold the isp->mutex for synchronization. While most internal
callers correctly lock the mutex before invoking atomisp_set_fmt(), the
V4L2 ioctl handler atomisp_s_fmt_cap() does not.

This results in an unsafe execution path for VIDIOC_S_FMT ioctls
(e.g. via v4l2-ctl), where shared structures such as pipe->pix and
pipe->frame_info may be modified concurrently without proper protection.

- Fix this by explicitly locking isp->mutex in atomisp_s_fmt_cap().

Fixes: 4bdab80981ca ("media: atomisp: Make it possible to call atomisp_set_fmt() without a file handle")
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
v2:
- Add Fixes tag
- use cleanup.h micros instead of explicitly calling mutex_lock/unlock

v1: https://lore.kernel.org/all/20250716014225.15279-1-abdelrahmanfekry375@gmail.com/
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index bb8b2f2213b0..d3b8e480065e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -9,6 +9,7 @@
 
 #include <linux/delay.h>
 #include <linux/pci.h>
+#include <linux/cleanup.h>
 
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-event.h>
@@ -416,8 +417,15 @@ static int atomisp_s_fmt_cap(struct file *file, void *fh,
 			     struct v4l2_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct atomisp_device *isp = video_get_drvdata(vdev);
+
+	int ret;
 
-	return atomisp_set_fmt(vdev, f);
+	scoped_guard(mutex, &isp->mutex)
+	{
+		ret = atomisp_set_fmt(vdev, f);
+	}
+	return ret;
 }
 
 /*
-- 
2.25.1


