Return-Path: <linux-media+bounces-27784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 422E5A5590B
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 22:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 649DD1758E5
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 21:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF39275601;
	Thu,  6 Mar 2025 21:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gv3JjUR7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CA0DDA8;
	Thu,  6 Mar 2025 21:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741297544; cv=none; b=HpHifOGEKXy/Im0xCVEL3Pp9s3GH86FaJTYwfClh6os7rmVCGmi8IaeiiSdqcf3VfVEiYrzI3fCzlUbSS/EShEIsowSYqbmO7ulJNBM+nYiQe1GFpX++zc/hEPtW6enkYD4ISOC2AIPmIZyUHGLGRvlcJbl0g2gnmguXVN0nQ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741297544; c=relaxed/simple;
	bh=FDBiD6CMyk9mBfJBcQ02immidYLn/vhBlRWWu5bCyfc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V4JTL/t8/rHuN8W5Zy2LmQmdGttr1YwtVe88uEJ7bfIbT+2PPp10j7MaipLAkx67661+fxjIwzK2EHruYt0Erg33UQGYwplGWu33oLDYzA/2uWpyrgpjTNgvKFJ9l4fNfPcUf01T8VbEWplEp8zeRQq95p80AvFXE9LiqXMVWro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gv3JjUR7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F00C4CEE0;
	Thu,  6 Mar 2025 21:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741297544;
	bh=FDBiD6CMyk9mBfJBcQ02immidYLn/vhBlRWWu5bCyfc=;
	h=From:Date:Subject:To:Cc:From;
	b=gv3JjUR7IXYxK5d/OHOCWf7Zi8jElLUpjqOwH5kfUknMCVLQ02ggZVe6CDnb9dxY5
	 VvapdGyph1vnoD+Z/j/1srxrinhxXE+EeYLeqOzWG/JaaVEMH551yvPL8IK1CEecvO
	 jZpOHSuDSAcCLnmju97MaWRwdJbk37/b05EddGeux5/dPbM57ZxCWVESYkdRUhRMjl
	 qcWZk6pToh4QezdjTGL79LuiOvQmPgnGA+enokT4sWDWiZUA0MqKKZsaoB+qTvL5gs
	 wL/es7tPxJ9A7B8HK3rZPGdIjAWYuI8xlRskQZ6E35nk+611wzUfZDcED8eFRyqKst
	 KuuHrR/+IvxfQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 06 Mar 2025 22:45:16 +0100
Subject: [PATCH] media: platform: synopsys: hdmirx: Fix 64-bit division for
 32-bit targets
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-synopsys-hdmirx-fix-64-div-v1-1-dd5ff38bba5e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGsXymcC/x3MMQqAMAxA0atIZgNprSJeRRy0jZrBKg2IIt7d4
 vj48B9QTsIKXfFA4lNU9phhygL8OsaFUUI2WLI1VdSg3nE/9FZcwybpwlkubBwGOdGTcd6QnWb
 XQh4ciXP95/3wvh9rjM0JbAAAAA==
X-Change-ID: 20250306-synopsys-hdmirx-fix-64-div-c014c102bf48
To: Shreeya Patel <shreeya.patel@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1730; i=nathan@kernel.org;
 h=from:subject:message-id; bh=FDBiD6CMyk9mBfJBcQ02immidYLn/vhBlRWWu5bCyfc=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOmnxFtZXGLWtsZw/ZeoOr/zwRnp498CuNtWJDCZr7dhZ
 tizftq3jlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjARrzkM/wyyszZEGE/ZkWgR
 wea1XvL2uuMKm+w2Nyd/UH5b/PPXolsM/6t4lX8x7CheU/l0ZsJeqyNLrR8VLl2U+uz1W19ZIc8
 Sbm4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

The build fails for 32-bit targets with:

  arm-linux-gnueabi-ld: drivers/media/platform/synopsys/hdmirx/snps_hdmirx.o: in function `hdmirx_get_timings':
  snps_hdmirx.c:(.text.hdmirx_get_timings+0x46c): undefined reference to `__aeabi_uldivmod'

bt->pixelclock is __u64, which causes the compiler to emit a libcall for
64-bit division. Use the optimized kernel helper, div_u64(), to resolve
this.

Fixes: 7b59b132ad43 ("media: platform: synopsys: Add support for HDMI input driver")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 4d42da7255f3..e4cdd8b5745d 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -17,6 +17,7 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/syscon.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -291,7 +292,7 @@ static void hdmirx_get_timings(struct snps_hdmirx_dev *hdmirx_dev,
 	hfp = htotal - hact - hs - hbp;
 	vfp = vtotal - vact - vs - vbp;
 
-	fps = (bt->pixelclock + (htotal * vtotal) / 2) / (htotal * vtotal);
+	fps = div_u64(bt->pixelclock + (htotal * vtotal) / 2, htotal * vtotal);
 	bt->width = hact;
 	bt->height = vact;
 	bt->hfrontporch = hfp;

---
base-commit: 143d75583f2427f3a97dba62413c4f0604867ebf
change-id: 20250306-synopsys-hdmirx-fix-64-div-c014c102bf48

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


