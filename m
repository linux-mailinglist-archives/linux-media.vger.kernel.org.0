Return-Path: <linux-media+bounces-36391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 194F1AEF1ED
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 10:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 467AE4A1467
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 08:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16142609F7;
	Tue,  1 Jul 2025 08:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nN+kiD6y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB4822259D;
	Tue,  1 Jul 2025 08:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751360132; cv=none; b=jaXs3mPgppBwZSV1BSrfmi++vDOH+1o9L1M/ApAPqU2PuTtUzFjou1y365pJ0B6hgGk//OO0IUIrdzc0n+qu8KzeLnNKqISXYKhp/9Q01h4YGo3mJ075rbKEUezKX+WI1TLQFV7lpLm4jxF4dOtlrE8uWWtB8YWpgEbDo+b+1Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751360132; c=relaxed/simple;
	bh=bpUYSyg7FQSqalfiLvbpqYi9zHballtSu0yKxalold4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tS9aY+qtNnW70DTVgQLRQTTrWp7dw62ix2s84m0Yl1o6jF+KZhj0yp8uz52SeLIZea2mfD7Y9Msp63UF/QUHBpxeL1/i9bWuVRC/PP2tyusNom5xUbMtgkn+5Aj+dpgo+AU6Zinf7QHi+Fhz9qMEu4NtM6tBuCnb2PuMzn/acfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nN+kiD6y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.60] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C497A7E0;
	Tue,  1 Jul 2025 10:55:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751360106;
	bh=bpUYSyg7FQSqalfiLvbpqYi9zHballtSu0yKxalold4=;
	h=From:Date:Subject:To:Cc:From;
	b=nN+kiD6yZxa3A5kEP9rRpCkA6c0lCYFnWJTbNQIpcgDa57LJTwlA/wMyEZQOB7iA2
	 U9ZcjqJ5lVe7XVUxsB6ihrNMIDSJU0LzSsddYwqbQ4gKiadF9b2ibNB9ywuR8VUMYl
	 Bfg8xiQi9P9tXzkJqxzEBEu8nEVOnx1Hc+/Ziyps=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 01 Jul 2025 10:55:05 +0200
Subject: [PATCH] media: pisp_be: Use clamp() and define max sizes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-pispbe-clamp-v1-1-31243db3439b@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAGiiY2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNj3YLM4oKkVN3knMTcAl2TJGNjA0PDFINUC1MloJaCotS0zAqwcdG
 xtbUAsSezGF4AAAA=
X-Change-ID: 20250623-pispbe-clamp-4b33011d0e85
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2889;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=bpUYSyg7FQSqalfiLvbpqYi9zHballtSu0yKxalold4=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoY6J/2GyckB7PTepmFR9Z8KBIt+ohmQEHr0vtF
 636rRe1tgeJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaGOifwAKCRByNAaPFqFW
 PNf+D/9Q7XpnGWqW2Z/2gS0FAMzczkz9mx1p7mIuhqfnDUHB7C48ri0voT/7XctuGnbkAsfLr+O
 G4Yx5tLfV9yxG3HhIMPf4Ph8X3OMxILQJJrO3FQun7KWgNZhGY3QJKEAm3I7XMfhOlgkPz8bC8M
 aecrDBchSO3KOlk5Hwk9SQ2JuVlLDPlpczbrA6uVgWwFyxjO0lDIWCFtm40cPhfwrphr/IRgs1V
 P91dSY3MCumILB82OYa6wkOBY2OJ8JTxP3dgP9zfkGx/r+LChaaDx9W52ZcuYK5BW04zK7E7rGI
 ydpiYZTmait1JJDkEe7BSZLM5bNs5mCfcpLkJjFrxavUxiTWPvdhPw7LXFX4c9kwCmF2DFhe+cf
 lC7W5er3qVxbQzYJblU4qqjzvh4dvEUHvE+cqNhj+mpE+dRIVYEwBJexxIbUyNG3fJl4Psj1/7I
 fBmvWBQx6HUKdKCJdhApWz9+4+Yj4Up8eqrtP0+9XHOZ+4s5izodm+giPJJ7RAfKp01+6Azx+qa
 JYr0phCnRge2L6U9o6nUPTHeb1CB/+uYnF6xUm3n7uAPwT9xX6XY+7jEqQAaqwPpnVHEYev/OPZ
 DwZndwwSi6c3Ttqs61EYrrUcsd9jD6cWCAb11o2j+SyxZPcCYegWFeVlkPsPnHTbPNHPgtW67JA
 aelnvDpRJt7sLag==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Use the clamp() from minmax.h and provide a define for the max size as
they will be used in sequent patches.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c  | 11 +++++++----
 include/uapi/linux/media/raspberrypi/pisp_be_config.h |  9 +++++----
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 7596ae1f7de6671484d4d351015b234829f642d4..ac5840b4be478ccdd7da9d6d0745649e0c1b2b6f 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/lockdep.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -1114,10 +1115,12 @@ static void pispbe_try_format(struct v4l2_format *f, struct pispbe_node *node)
 	f->fmt.pix_mp.pixelformat = fmt->fourcc;
 	f->fmt.pix_mp.num_planes = fmt->num_planes;
 	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
-	f->fmt.pix_mp.width = max(min(f->fmt.pix_mp.width, 65536u),
-				  PISP_BACK_END_MIN_TILE_WIDTH);
-	f->fmt.pix_mp.height = max(min(f->fmt.pix_mp.height, 65536u),
-				   PISP_BACK_END_MIN_TILE_HEIGHT);
+	f->fmt.pix_mp.width = clamp(f->fmt.pix_mp.width,
+				    PISP_BACK_END_MIN_TILE_WIDTH,
+				    PISP_BACK_END_MAX_TILE_WIDTH);
+	f->fmt.pix_mp.height = clamp(f->fmt.pix_mp.height,
+				     PISP_BACK_END_MIN_TILE_HEIGHT,
+				     PISP_BACK_END_MAX_TILE_HEIGHT);
 
 	/*
 	 * Fill in the actual colour space when the requested one was
diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
index cbeb714f4d61ad53162c0450f2303431a5958040..2ad3b90684d7be80776af75b5c5009f7b677f466 100644
--- a/include/uapi/linux/media/raspberrypi/pisp_be_config.h
+++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
@@ -21,10 +21,11 @@
 /* preferred byte alignment for outputs */
 #define PISP_BACK_END_OUTPUT_MAX_ALIGN 64u
 
-/* minimum allowed tile width anywhere in the pipeline */
-#define PISP_BACK_END_MIN_TILE_WIDTH 16u
-/* minimum allowed tile width anywhere in the pipeline */
-#define PISP_BACK_END_MIN_TILE_HEIGHT 16u
+/* minimum allowed tile sizes anywhere in the pipeline */
+#define PISP_BACK_END_MIN_TILE_WIDTH	16u
+#define PISP_BACK_END_MIN_TILE_HEIGHT	16u
+#define PISP_BACK_END_MAX_TILE_WIDTH	65536u
+#define PISP_BACK_END_MAX_TILE_HEIGHT	65536u
 
 #define PISP_BACK_END_NUM_OUTPUTS 2
 #define PISP_BACK_END_HOG_OUTPUT 1

---
base-commit: 35392e855abf7d02ad3b061cbc75c7c7c37f0577
change-id: 20250623-pispbe-clamp-4b33011d0e85

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


