Return-Path: <linux-media+bounces-36214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F39AED11A
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 22:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A387016EA30
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 20:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276C923E25A;
	Sun, 29 Jun 2025 20:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JcIHJC8G"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8879123C50B
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 20:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230605; cv=none; b=ayc5dw9/nsptP6Wkc+v96iKrnyQCU5MZDPbsSt6YEXZZGSKIZWanECzJaCVoKTKpUcyJ55YYPS7kSwYUnW70X1xVgvoWTWK05qyL8DtGvpq+zaBfyeu7/fvlyveHxSamTVTS+WzTklYCVqd03Y9Hk4xhf2t5X15Zf3lb6iIj7Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230605; c=relaxed/simple;
	bh=/FiBxAudRskwO8lmbACU9mW0XPy2vKlUFQsxthZ37Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bEeq+mBCZuF+pOezD9qlkbAx8L+jCb0vA97l2dhBLjcipqhhKLEE+tut9g+Y9J4qdQccJYXrgaFJItxij4qWkqYfGW1w93SlB8nWYJUJWem2IqqVxWzumFmripjF2c060cIYF3Y/Im2ib48PDKlSjABp/7Nf8rOozx0Te4EqDbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JcIHJC8G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 262EEC4CEEB;
	Sun, 29 Jun 2025 20:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751230603;
	bh=/FiBxAudRskwO8lmbACU9mW0XPy2vKlUFQsxthZ37Jk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JcIHJC8GD2LkJSNo57HMw/XTcwLWt5LjJ9/jZ5N5U+/7NqtYFVKqd8BlTtHs7KmpW
	 OxB9jw3/cVqGSOtu61pUGB3/T2vYW1cxk75Z7QbzglHXKr6+Y+57C17nFPatkAed5G
	 Y0H6F9PSmNkLZln0CTAG3zkP/3gK+VoohVmCrAY0+n4C39X6b9GA2KLJrQS3eNiEte
	 /2DBIogF86VHKnZStNJZKDVnGHBhICY2cfBJDzK0e+AWOeit6bh18tzev4zj5AUnHq
	 m58J8AlBsYCj3wMmGvTyP0NXTsQa9lx3ff+1XfdKpyfN4jYnvPzB2KPgkaur4c4Eh7
	 +owi4TXrDMUrw==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 05/15] media: mt9m114: Fix default hblank and vblank values
Date: Sun, 29 Jun 2025 22:56:15 +0200
Message-ID: <20250629205626.68341-6-hansg@kernel.org>
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

The current default hblank and vblank values are based on reaching 30 fps
with the pixel-array outputting 1280x960, but the default format for
the pixel-array source pad and the isp sink pad is 1296x976, correct
the default hblank and vblank values to take this into account.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Changes in v2:
- Update comment about resolution / pixrate / FPS to:
 * Set the default to achieve full resolution (1296x976 analog crop
 * rectangle, 1280x960 output size) at 30fps with a 48 MHz pixclock.
---
 drivers/media/i2c/mt9m114.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 25d2b3fd4293..10ddcc102b8a 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -328,12 +328,13 @@
  * minimum values that have been seen in register lists are 303 and 21, use
  * them.
  *
- * Set the default to achieve 1280x960 at 30fps with a 48 MHz pixclock.
+ * Set the default to achieve full resolution (1296x976 analog crop
+ * rectangle, 1280x960 output size) at 30fps with a 48 MHz pixclock.
  */
 #define MT9M114_MIN_HBLANK				303
 #define MT9M114_MIN_VBLANK				21
-#define MT9M114_DEF_HBLANK				323
-#define MT9M114_DEF_VBLANK				39
+#define MT9M114_DEF_HBLANK				307
+#define MT9M114_DEF_VBLANK				23
 
 #define MT9M114_DEF_FRAME_RATE				30
 #define MT9M114_MAX_FRAME_RATE				120
-- 
2.49.0


