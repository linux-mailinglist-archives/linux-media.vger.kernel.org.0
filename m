Return-Path: <linux-media+bounces-33724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C794AC9BBA
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 18:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C54BE17C6CB
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 16:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5613770B;
	Sat, 31 May 2025 16:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFrI+JI1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C45513CA97
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 16:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748709127; cv=none; b=kayBM+B+TbO1+Yavy/ywCJok1oXZpaHpZ/ixLQh34QU2xZ204i6BoISfWf6C+m61xs+ofr1YE5D/onkS+YJLW6TLze/+wQ9WyAhZrnCszjkwdVAbo6TnT+Y5fC7Xww/hjhR/faOBgj1rMxA6awW/80a1fn9sii3Y0+l9jrvGDA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748709127; c=relaxed/simple;
	bh=zY37WmJMAHAfQBTGFECzVjlgaM7j1inXoMeQuWzx7+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BTKB1unZ1J9bzojwRFlqvbvL2FW//9eQPbw7ZNRxYxnV760EQVgBMTAcZDYBQgc7vTu59KYDiWea+jpVMBuhvvJKgmFug+kZ+x1ee1ijHt3pIRXyNz9bCIs80Kut9BzVYo0W4YYd9cfHPzk/t0QVfGITNN373G8E7214YOKF4y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFrI+JI1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEBC7C4CEEE;
	Sat, 31 May 2025 16:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748709127;
	bh=zY37WmJMAHAfQBTGFECzVjlgaM7j1inXoMeQuWzx7+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TFrI+JI1NcQHkfPLiMwU5Iv5mgPBPSMde/MSSXouKbPYs++8bmfhOuoUHuSJh71Fn
	 lPf4aetgBNE8vZXCVhjHvsHF6lqt2bZdXUyj2XOPD60RS9COKoHctlTHMtDK93T8Rk
	 ClnlB+c3QCDu8RHmUH6HRoJ1x0HQS47rh7rOLhMXwL9mOdnQZBxr0KCOUR5ow+nfno
	 0Zo7Nk9FKzkkiEHwmUP7CBa6vTaJgt48Z2oHD2busw+CQokYSwqI/cPjLEdFE9vpyk
	 LjmCvcj6zg38gvN4xPMWCrFXvFyDdDvX3Jh9x1m8QMcg2/nRYz2DNEWHqk43+CDMgf
	 ZlaMdPkcBMkHw==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v2 05/12] media: mt9m114: Fix default hblank and vblank values
Date: Sat, 31 May 2025 18:31:40 +0200
Message-ID: <20250531163148.83497-6-hansg@kernel.org>
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
index 5f59bfd83402..aa401b3fb4a7 100644
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


