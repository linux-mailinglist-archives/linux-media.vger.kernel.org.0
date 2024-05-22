Return-Path: <linux-media+bounces-11746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 517388CC4CD
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 18:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4901281529
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 16:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D201411FE;
	Wed, 22 May 2024 16:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwB2mKvU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D61E13E04E;
	Wed, 22 May 2024 16:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716394742; cv=none; b=SX2ZN1JfNtQhlwKAYXnMRrVKEfWovxT9DpUNCbtce09cERZqV38zFNpE2V6aXlF56KKMlcdsk7Cx3PXeno/qdyMXP28Lk1qNHyNlRpjafGIyAhFyPUyvmYG+asvBOenaTaoLNe9CRIatqvIDNCGuRLT5nOuElsZyPrIpCnXHZIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716394742; c=relaxed/simple;
	bh=oxFKEohBMHZV6yUy6/LmAq6oKk+NBVtVEkNKhy9XKdw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JWP9kw2j8Dh4vDFF1AQo9rbWz3qSHxinfJZTMtrGeindaAFnbjH6ZMj7TYL4YCFxujEwdlStE6tYmLEaKCU+zQEF+7jW15h2ykgnvo/YseX9CDZpvTPqFzzMpA6+SQ1/NnGbXvcMRNc0ePNuC/ExCvXE+F8WBRW3Xekd/I3AkrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LwB2mKvU; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6f44dc475f4so2249876b3a.2;
        Wed, 22 May 2024 09:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716394740; x=1716999540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AxJFeH3HiDVDkh3oGTnmJjc83iwNoljE8xuAzbGV+Os=;
        b=LwB2mKvUuLOBgTsdanUlMEfIIQYDz4GxeXrkAaDf5kXv220nfEXqI7gv7mZzqdK7zW
         e5rZSSzwR1L9M58aH/1rWnJ7+ojuFitsLbPWT/CLK36RuD9utYNrCxU6yOk4I6W4Vrac
         2F6kmeqeoObLdOmxAEi+tM8YTHRquwikxohW1ZDECeFFXxc3Mb/RfthOrDrgauNL+vkL
         px0ws+DYM1AsRVF8kqLDbpe9pA6Tmvn8uFu1DLZAzzgywVVzHTHNmcssM9ebbZK57Pwx
         C65p4x/wAmYB7IdFF7o1Q5SYSiJgt2+TzvEgqYgj9hP3ZpdoeF/gcp529Ld4KlxulBO7
         0X1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716394740; x=1716999540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxJFeH3HiDVDkh3oGTnmJjc83iwNoljE8xuAzbGV+Os=;
        b=YxeWXi1IwQ1NID4kIyJAGfObuN6UGYBGFvs25CzskyB6dyjbpuhrhJeHQLekEHlVXy
         Rd6vS/UtS9mq53PMpwfY0rOXSoLJ0PSldrh6x5QGUGi3HDtPlp0Syd8WUmZOR+B7cbl1
         MPXU8aUPwPmg5LtD/BIu7xrNrsRtkwiAdpySKTV4tJv7jxFhM5abXghIqDCMMhveSG4F
         RfMMHQE2en2Cxo/uoa17eQJWLqsWi/Ck7asQFyhv/w6B9sTlf6G9zYlI1NsJGIqeUACs
         Va91kXKWQpAjHrTqZR/A1aTBNEMPnzKqtEQCQAaJDUy9cRb/o1x/0xufq4uj4Av5ur8T
         lUhw==
X-Forwarded-Encrypted: i=1; AJvYcCXIDjfO70nfvlO1GcyuiHxu8CHU0+C+S2hxZn8w+b3hjYOKy92I6tAKINIcWPAET6MiRtZhfez2RZVnD73GVA60mrUcUKvXNe5XYsImzNfQzMyUx3/5snAb9XzoF6q/228Xk4MxXjhOjv0=
X-Gm-Message-State: AOJu0Yzy4jsha30ycluMPVdAghyhdSvrG4oXEIW9KQIcksSaKP6Ja0LP
	Z9TmXoHn6wpFiXiB5R8MImpIM5m7wBfalb5me4RgYNEY5oOdnC0D
X-Google-Smtp-Source: AGHT+IFq8ysxXZEYoiEQCycaIHWjUas3IvhCA3MXSebOQ1xZkLZ3iAY7gzl1s8SJPwLz1d+Ssz6COQ==
X-Received: by 2002:a05:6a00:2da9:b0:6f4:d07a:e7f0 with SMTP id d2e1a72fcca58-6f6d61aea62mr2506918b3a.27.1716394740296;
        Wed, 22 May 2024 09:19:00 -0700 (PDT)
Received: from ubuntukernelserver.. ([49.236.212.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2969sm22531958b3a.152.2024.05.22.09.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 09:18:59 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	andy@kernel.org
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media/atomisp/include/linux: Fix spelling mistakes in atomisp.h
Date: Wed, 22 May 2024 22:03:30 +0545
Message-Id: <20240522161830.57434-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported misspelled coefficients and vector in atomisp.h. This
patch corrects the spellings to increase readability and searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 drivers/staging/media/atomisp/include/linux/atomisp.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index bbbd904b696a..1d11a9579587 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -201,7 +201,7 @@ struct atomisp_dis_vector {
 };
 
 /* DVS 2.0 Coefficient types. This structure contains 4 pointers to
- *  arrays that contain the coeffients for each type.
+ *  arrays that contain the coefficients for each type.
  */
 struct atomisp_dvs2_coef_types {
 	short __user *odd_real; /** real part of the odd coefficients*/
@@ -741,7 +741,7 @@ enum atomisp_burst_capture_options {
 /* Digital Image Stabilization:
  * 1. get dis statistics: reads DIS statistics from ISP (every frame)
  * 2. set dis coefficients: set DIS filter coefficients (one time)
- * 3. set dis motion vecotr: set motion vector (result of DIS, every frame)
+ * 3. set dis motion vector: set motion vector (result of DIS, every frame)
  */
 #define ATOMISP_IOC_G_DIS_STAT \
 	_IOWR('v', BASE_VIDIOC_PRIVATE + 6, struct atomisp_dis_statistics)
-- 
2.34.1


