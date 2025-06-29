Return-Path: <linux-media+bounces-36212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 199D6AED119
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 22:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 893A53B021A
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 20:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AFE23D2A8;
	Sun, 29 Jun 2025 20:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bB7FW0n9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2288222F74A
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 20:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230602; cv=none; b=gHgsYGgVKZtnzKNj6Sd8pzliA4+O9yUPReEd7VdWml9q35BWFFnpqnu58aTq4064icUo5ml0JWvpvuX/2P03ISC2ut34fApZwZXhCb1JwXflfmZmGmQ6amV+XY/gVP3O1SipZfbqQQTeopDq/a1ESlZKjbe+PamRoCQUqvrcQRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230602; c=relaxed/simple;
	bh=aW45ROropEMRzs5tzfEBWR7Tek2M3oa6+es4v2MZ1d8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rCNBIdOAlsjYxE9CWhBmbejzEIF7V2YNH+tETIxoiFdCSch3EjIQ1auxn6TZILEkmOAD6ceTY0IybswYJ7PXoNX4WgtTvvJ6On328aqBHSoxUdkCHCVWACWOITHMftdgkeDx9P+yS63N8AUiZGv5+51ZtaFHvJJ8fmXYoTHic8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bB7FW0n9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70716C4CEEF;
	Sun, 29 Jun 2025 20:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751230601;
	bh=aW45ROropEMRzs5tzfEBWR7Tek2M3oa6+es4v2MZ1d8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bB7FW0n9ogJ6z9luMJfLiTIoNii9ZUNVigU9AVkKS6nNzCZ0I3ydJ9sIoxFgGv/uc
	 DPZ3Iimn3rKiixz10URjZvSHRjkfN90VHKF9zyO0s18dqpUB6NXuEQgEKilheALigu
	 oVBLD7OagaNYX03DXI3jX1xT3zkaNh1KkLXq0+c5otMmX6Edupe+/HW0CYEq+X4ZkV
	 LoTa6gCIwnaH5dK21dv9wWWI+KtD229i794kC6wo3CzyHAcAVf7C/6dueRuztZm/y+
	 jB2+gbw8+XhkfBmGCsPlpfqOY9BximRKMCOXZ8ohIGJ6sA3XULfg3YdakJ062P+ogb
	 X/8/dZuj/9hLQ==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 04/15] media: mt9m114: Lower minimum vblank value
Date: Sun, 29 Jun 2025 22:56:14 +0200
Message-ID: <20250629205626.68341-5-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250629205626.68341-1-hansg@kernel.org>
References: <20250629205626.68341-1-hansg@kernel.org>
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
index 9e703012cb0e..25d2b3fd4293 100644
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


