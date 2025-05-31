Return-Path: <linux-media+bounces-33723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BE7AC9BBD
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 18:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6E413B3F32
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 16:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677DA189BAC;
	Sat, 31 May 2025 16:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3mO9XH2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DF413CA97
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 16:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748709125; cv=none; b=DaJeK8UYAaPgOxaPHkibMqgruIkFfUs6LTqRqvRoqp5ZjFB1sZSAqZjVB0VLmCOOl/PYnujxxm7cxIxJCkV31B7EyuK6oxHwJT8Kifl/cv2oicHnQ6oD2I8htFoPOtdHtg9SnjF9jGEWPthBO6yigcqaPsg/Kqr6oF08BXoyOUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748709125; c=relaxed/simple;
	bh=RVKpnL//EuaqDce6HTso8AIfpegSD2km4o+g5EC/7EE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=re25MvFIgh0uzmrRHzl4boU3uDtF7OA7XG7u6UYVfhuyHPAmPmBLfRatYdA21OGP1QDbfFhkHVmAu9TGRF1dwi1Uq9lnvtwGBIyWduFgMVvakarog4WS6AyWO3+2c4MAZSgggq2wbH2HBZCvDPZXztvE4OEa/rJTWyCm5TWqHK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3mO9XH2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3546C4CEE3;
	Sat, 31 May 2025 16:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748709125;
	bh=RVKpnL//EuaqDce6HTso8AIfpegSD2km4o+g5EC/7EE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n3mO9XH20uHQrTJLg8VYZEHLNZxIZO3tvNLHBWPVXhKvjhfuh8awSjpbRpwKcKYjm
	 DqupQiMbju+mWulBEd+YXzVuVZwo0QUP+s20BZWpBx0fI96Jv4Oy0/XCQjCr4JmEi/
	 WAoPZQTt0nnPJRBurbrGDxctNBuozUsVXAPKiHjYp0N0TIJVVblH4hmBNHrMiBv+z/
	 C3ylkowH2daTtQBhVkSTtwdBTTBTTkCMYJpFvSzdstFIlo57q1lImVBEqQMPvGqzPp
	 AY+ZjEMeRPs5EsMe7WTO4BDLUgVovdveG38XHa1Niu3UwUHqngpO7ZndsQWW/JTRqv
	 RnsYePD7uxolw==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v2 04/12] media: mt9m114: Lower minimum vblank value
Date: Sat, 31 May 2025 18:31:39 +0200
Message-ID: <20250531163148.83497-5-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250531163148.83497-1-hansg@kernel.org>
References: <20250531163148.83497-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the comment above the defines says, the minimum values are undocumented
so the lowest values seen in register lists are used.

The version of the mt9m114 driver shipped together with the atomisp code
uses 21 for vblank in its register lists, lower MT9M114_MIN_VBLANK
accordingly.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/mt9m114.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index e12c69dc9df0..5f59bfd83402 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -325,13 +325,13 @@
 
 /*
  * The minimum amount of horizontal and vertical blanking is undocumented. The
- * minimum values that have been seen in register lists are 303 and 38, use
+ * minimum values that have been seen in register lists are 303 and 21, use
  * them.
  *
  * Set the default to achieve 1280x960 at 30fps with a 48 MHz pixclock.
  */
 #define MT9M114_MIN_HBLANK				303
-#define MT9M114_MIN_VBLANK				38
+#define MT9M114_MIN_VBLANK				21
 #define MT9M114_DEF_HBLANK				323
 #define MT9M114_DEF_VBLANK				39
 
-- 
2.49.0


