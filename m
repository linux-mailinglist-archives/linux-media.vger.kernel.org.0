Return-Path: <linux-media+bounces-27464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADA9A4DC1C
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 12:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44EC27A8130
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C072202C5D;
	Tue,  4 Mar 2025 11:11:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5EA202C36
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 11:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741086689; cv=none; b=WYc4tykmN5lQzre0NjLLIr0QvJAVMZihWXBLIOgQodPVu8T5IMk0fsch3uS5W02wkljh1SBpTchQSxlXyAYciVrVU1VvBspzcw4Bh4ynqL80J8M9qdfEvbTiEqxfcLNC7ez/fGXh6ljVwo8TK0/NS8uLdfmbQ3i8IkNLPVaU6Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741086689; c=relaxed/simple;
	bh=RbX3xA5qedsexrOikJECTocYWjsOteUMwAw3J8BYALY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qU2dAAvEjlO7drXB9G+t6krTE7wfH2MK1zCcfKn6GIY7vi/eupZM2Blgo8B9xxlzsklmdR2XSTZr3RxViEfeeAPPVdVBL3E13+d8pgcMZxym0rHuxa6BGXLUuNYEZg2+ODaf7svF9p90TizVkLZvv3sr0rF/7f82vdrDLr/6r5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D40AC4CEEB;
	Tue,  4 Mar 2025 11:11:28 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 4/8] media: usb: em28xx: use (t,l)/wxh format for rectangle
Date: Tue,  4 Mar 2025 12:08:10 +0100
Message-ID: <19c841cfcec3261d84d2ab6e79596c4b546a00ca.1741086494.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1741086494.git.hverkuil@xs4all.nl>
References: <cover.1741086494.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Standardize reporting of rectangles to (t,l)/wxh.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/usb/em28xx/em28xx-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 66c09bc6d59e..2dfa3242a7ab 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -264,7 +264,7 @@ static void em28xx_capture_area_set(struct em28xx *dev, u8 hstart, u8 vstart,
 	u8 overflow = (height >> 9 & 0x02) | (width >> 10 & 0x01);
 	/* NOTE: size limit: 2047x1023 = 2MPix */
 
-	em28xx_videodbg("capture area set to (%d,%d): %dx%d\n",
+	em28xx_videodbg("capture area set to (%u,%u)/%ux%u\n",
 			hstart, vstart,
 		       ((overflow & 2) << 9 | cwidth << 2),
 		       ((overflow & 1) << 10 | cheight << 2));
-- 
2.47.2


