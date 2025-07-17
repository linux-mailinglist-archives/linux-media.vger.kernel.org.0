Return-Path: <linux-media+bounces-38011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D077B08D3E
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 14:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD8E318965F6
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B765E2D322A;
	Thu, 17 Jul 2025 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FouS25H9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821261F92A;
	Thu, 17 Jul 2025 12:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752756189; cv=none; b=J8WZ41FWW4YN7JP6z+t3EOUNaaW6tYZMY4H8hOc8JBcScGuIfYgoKhWBGGVFkJRD1WBFTPzd7HzWddtgxVdbyKP8+Ej9s963MghboGzDzuhiWn1f7Me8c1cUUsafkZVo17AlYm3h0GaHfaydb20pVNXW/BIYTDSZFsdj9BfaPIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752756189; c=relaxed/simple;
	bh=COcQw/nm6DgVQsv6NohuIht1Jtb3N9YHU6/YJbBS1ck=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eiIystI/nhu2A9KZd2LxxOZW3q70dxorc1/CoN3EUUVxQU6rBeArcxc9t06tuiPT+Om8YsEfaKt3Wqw3b0Q3MzJrZwFcJAx4RyV7xpcMrt6GqCcjRq5+KWbUJe5Br2sRjmp50eLwST9BDBpwcG/KUgER7RIQfpYylsnrICc7A2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FouS25H9; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b60565d5f4so109306f8f.0;
        Thu, 17 Jul 2025 05:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752756185; x=1753360985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d40bmhYnCHJ8YDHvaQ0Txhm8cZhbp1/LzycBNKupukg=;
        b=FouS25H9x1SFkvLpj3i+AkbZt6LYkzI1HVCqm0POQWSD8LFDRYEPc9ZikoYVJU4Ef4
         8zZsmBEAIP1rjObymfADV6CH9Vvps4sC0g/wENQhCOO10Le79xxeK1dTSLprYMDKUprk
         /nxSSJJmzR0O16Q2NmpO4I6ZTQ1DpFtwniXJToq6pkNvjICBbhUtA5wcw0aVOODLhdV0
         vn9Az5iYhbvQpqqNzvp+nKB/ry5PyAl/DfKP/gYX2nJoyaxMkUxPigPzJ29HBXMtLUN+
         q1mEtxckWnQNqf6B5NrxjcH/l0xkP6IsHOYX0m+DMy0/a9fm9COYoCymndzfZE3FE2IY
         hWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756185; x=1753360985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d40bmhYnCHJ8YDHvaQ0Txhm8cZhbp1/LzycBNKupukg=;
        b=fDyHxS65l6lhifVaMw7O+qIQ93GjKsdamKIU+J0XKLUIOAg224jxKDZSQ+Fu+pSk1F
         CUzfCiGk5b6NYGJUKj3sv7cyDP3Ysir5touiZ8I+myWmmQUykgUmLuuK5JHHB2nuh7Eb
         +OoDGUXjl2Fu+xX0Kat3z9wfrHXPDzG3n80nGOTJb/gs1S5LvMdrXFKfU4PIDpZHpGQn
         O36lunBTtYMh2Ds/ri0sV3m60lc/xMaOUc8sYUpFwBmWvOU/rV06TbcbKlgt+TNMw8Nn
         e2r6eVJ+y1rff/NbbeHxNyfrfsV62YRPXRSthulZDvGS5ej5nMx7UkShtFOEDHr8syMY
         0TEA==
X-Forwarded-Encrypted: i=1; AJvYcCWVb4SFPurIaCMDAPYtGVtV9JcBobRN4g1xMUa/j56z2UV9xr7RCQ9yVnqjgdkILpTPQvbJsy6CcWGuJ3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgfHM64eS6E5V1fE0ppf+5APVbRk/rXM2H0inuzZ62bNa0VhXX
	kb/HTYuZvfEjn/9qMLC54U+MuSP0lFRfr6QR2STqpsLvJMbZa/dYBaD3
X-Gm-Gg: ASbGnctr3vK31ziAtWh/WdVK3m02d5W/uVx3103f3hCxxn0kKZDzqeBAAaQEGsQmR8B
	iKv5/9rPNJPhk9zrPznAlo4kDi/9BtQKf0LqeufkC2n1L3RVT8jtRK2Cro/A+OisFehqgHt0IY1
	CUgKKwKzMpNdxQCDDsILwzrrq85ZcdhzrLgO1r6g/cgZ8BLy6Zb1GABNmVdWTP5/nhZcGzpvLKk
	EA5D5J4o5h4b2fp7tRx8glf3DSpk8Tchx7RMyZrakBnGx7A6mcp3sf3KdBUxa8TzAlFItqJ3VUr
	q8xH88nJntCq6wTaa/slBe17jEnTCUk/HvuBxyo5QhHlzJTh+YZSqpSu0jUzeYowcO7inKA2oWd
	7Id3YeyZcZTpgXrdT+T+vC/Ui7NbAgVWRBCFiJAIG8+VUACKwqAox6VCi6H4V
X-Google-Smtp-Source: AGHT+IFRlywe4tl9dYYqcWEYvjS6es1ezgBsDewHP6wfjpW6IO7HrqdyJCKLgzPhHOHXTcX8BEw3wA==
X-Received: by 2002:a05:6000:18ab:b0:3a5:7875:576 with SMTP id ffacd0b85a97d-3b60dd4a802mr2670732f8f.1.1752756184266;
        Thu, 17 Jul 2025 05:43:04 -0700 (PDT)
Received: from localhost.localdomain ([154.182.204.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc3a62sm20506454f8f.40.2025.07.17.05.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:43:03 -0700 (PDT)
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
Subject: [PATCH v3] staging: media: atomisp: add missing mutex lock in atomisp_s_fmt_cap
Date: Thu, 17 Jul 2025 15:42:34 +0300
Message-Id: <20250717124234.24572-1-abdelrahmanfekry375@gmail.com>
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
v3:
- Use guard(mutex) as suggested by Dan Carpenter and Andy Shevchenko
- Remove extra blank line after variable declaration
- Fix include order as requested by Andy Shevchenko

v2: https://lore.kernel.org/all/20250717013003.20936-1-abdelrahmanfekry375@gmail.com/
- Add Fixes tag
- use cleanup.h micros instead of explicitly calling mutex_lock/unlock

v1: https://lore.kernel.org/all/20250716014225.15279-1-abdelrahmanfekry375@gmail.com/
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index bb8b2f2213b0..2690c05afff3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -7,6 +7,7 @@
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/pci.h>
 
@@ -416,7 +417,9 @@ static int atomisp_s_fmt_cap(struct file *file, void *fh,
 			     struct v4l2_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct atomisp_device *isp = video_get_drvdata(vdev);
 
+	guard(mutex)(&isp->mutex);
 	return atomisp_set_fmt(vdev, f);
 }
 
-- 
2.25.1


