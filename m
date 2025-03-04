Return-Path: <linux-media+bounces-27465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CA6A4DC1F
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 12:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7141188DE3E
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53007202F7B;
	Tue,  4 Mar 2025 11:11:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9E8202C26
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 11:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741086690; cv=none; b=Lvltc90pZa27vLT0uBs3Z6rDhJFDcBRbnIb93Bsy8CnSkFnyo9PvDCOLqgkOXl/pdtY1b4f8nLNGZrscCYy5MTi2bfIvIiRsHiEHpHVN29Wu0lVyxDX3+Nb/i8ZLcxpSYNk4kwDYlGZLItDMVBxeEQLC7Ucw1EVc7lALeXqDfek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741086690; c=relaxed/simple;
	bh=GlJAgQzEnlwCkFD+2ojFeFNoD0EbyHj9BeL9iiuqS74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jHpkGQ62fWdmT9Nuf7DunrISJ0hLtL7JwxcyWoLCAdQwEHsHohabtekuzDHbCEiO+kR6aceF65cXr8OFzri5n0IRlrAMWCaDzOPmgGFFhGkbTGkjT3J44EAe9tHlbhdNia1+pUr79rk5l3NQqQ7H/+vhr+wBYvnJehUVpUD+26I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B255C4CEEC;
	Tue,  4 Mar 2025 11:11:29 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 5/8] media: vivid: use (t,l)/wxh format for rectangle
Date: Tue,  4 Mar 2025 12:08:11 +0100
Message-ID: <7fa37aa5b9135945075b7692fbe892e0a48003ab.1741086494.git.hverkuil@xs4all.nl>
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
 .../test-drivers/vivid/vivid-kthread-cap.c    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
index 273e8ed8c2a9..d845e1644649 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
@@ -165,13 +165,13 @@ static void vivid_precalc_copy_rects(struct vivid_dev *dev, struct vivid_dev *ou
 	v4l2_rect_scale(&dev->loop_vid_cap, &dev->crop_cap, &dev->compose_cap);
 
 	dprintk(dev, 1,
-		"loop_vid_copy: %dx%d@%dx%d loop_vid_out: %dx%d@%dx%d loop_vid_cap: %dx%d@%dx%d\n",
-		dev->loop_vid_copy.width, dev->loop_vid_copy.height,
+		"loop_vid_copy: (%d,%d)/%ux%u loop_vid_out: (%d,%d)/%ux%u loop_vid_cap: (%d,%d)/%ux%u\n",
 		dev->loop_vid_copy.left, dev->loop_vid_copy.top,
-		dev->loop_vid_out.width, dev->loop_vid_out.height,
+		dev->loop_vid_copy.width, dev->loop_vid_copy.height,
 		dev->loop_vid_out.left, dev->loop_vid_out.top,
-		dev->loop_vid_cap.width, dev->loop_vid_cap.height,
-		dev->loop_vid_cap.left, dev->loop_vid_cap.top);
+		dev->loop_vid_out.width, dev->loop_vid_out.height,
+		dev->loop_vid_cap.left, dev->loop_vid_cap.top,
+		dev->loop_vid_cap.width, dev->loop_vid_cap.height);
 
 	v4l2_rect_intersect(&r_overlay, &r_fb, &r_overlay);
 
@@ -190,13 +190,13 @@ static void vivid_precalc_copy_rects(struct vivid_dev *dev, struct vivid_dev *ou
 	v4l2_rect_scale(&dev->loop_vid_overlay_cap, &dev->crop_cap, &dev->compose_cap);
 
 	dprintk(dev, 1,
-		"loop_fb_copy: %dx%d@%dx%d loop_vid_overlay: %dx%d@%dx%d loop_vid_overlay_cap: %dx%d@%dx%d\n",
-		dev->loop_fb_copy.width, dev->loop_fb_copy.height,
+		"loop_fb_copy: (%d,%d)/%ux%u loop_vid_overlay: (%d,%d)/%ux%u loop_vid_overlay_cap: (%d,%d)/%ux%u\n",
 		dev->loop_fb_copy.left, dev->loop_fb_copy.top,
-		dev->loop_vid_overlay.width, dev->loop_vid_overlay.height,
+		dev->loop_fb_copy.width, dev->loop_fb_copy.height,
 		dev->loop_vid_overlay.left, dev->loop_vid_overlay.top,
-		dev->loop_vid_overlay_cap.width, dev->loop_vid_overlay_cap.height,
-		dev->loop_vid_overlay_cap.left, dev->loop_vid_overlay_cap.top);
+		dev->loop_vid_overlay.width, dev->loop_vid_overlay.height,
+		dev->loop_vid_overlay_cap.left, dev->loop_vid_overlay_cap.top,
+		dev->loop_vid_overlay_cap.width, dev->loop_vid_overlay_cap.height);
 }
 
 static void *plane_vaddr(struct tpg_data *tpg, struct vivid_buffer *buf,
-- 
2.47.2


