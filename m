Return-Path: <linux-media+bounces-8595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFBB897BFC
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 01:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61EB428A465
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 23:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62913156C4D;
	Wed,  3 Apr 2024 23:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ofJhpJWm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CECC15666F
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 23:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712186683; cv=none; b=bU5LRs2CSsUG2jYRu2jgR82GSJbBlypoVSIAi9JoDJriVZaAcRf2B+4U1vgbINbmouZplsuElc7EiQg2e2Z8xkCEhRV7iSrN4T0YvdKr65PEvdFC6R6J+NtE7IxCW8PUeR2OBy5W9iJRJ7/Y2dVGoMchg2N9c0Tsr563UkCsMPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712186683; c=relaxed/simple;
	bh=ih92BWjYpW41wlrYl8ysX5EsSHM9+ungCN8oXJjPWgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ciuIh+KWYB3+V2/Whq5k/82OXdt2Qj8+cNDbdm/6EvJ+sA9NeCENl+vJoH/lHF6vcxYcjLV3fROk5iRpmtZItiC/q8fveUHso+Ln5A1RbE3g12WgDRCZefjIv7NxtznbR5J3QfAlewQIpU/m9bh2T+FYzp9AFdM4MK1kadriFjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ofJhpJWm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E5CAACB;
	Thu,  4 Apr 2024 01:24:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712186641;
	bh=ih92BWjYpW41wlrYl8ysX5EsSHM9+ungCN8oXJjPWgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ofJhpJWmFtiV4kR60wm2JOtLAYo/1vw14Ar8grnfRTVlhB0Yz3oP1+Jztv527mqwE
	 r+XnLo4Xc1+2jrULVwPtqIQv/wSS229x2ojSif1ST5sJc/WJeTPBZ7ucpsYqQIjeOy
	 pBIzZPTsUdJ/Wo8WSlKcZLoDSr9QF+dPKr1azsas=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>
Subject: [v4l-utils] [PATCH 2/2] v4l2-compliance: Drop stream support for the subdev crop API
Date: Thu,  4 Apr 2024 02:24:25 +0300
Message-ID: <20240403232425.22304-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403232425.22304-1-laurent.pinchart@ideasonboard.com>
References: <20240403232425.22304-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The subdev crop API has never had working streams support in the kernel.
The stream field of the v4l2_subdev_crop structure will be removed,
prepare for that by not setting it.

As the selection API tests checks that the crop and selection APIs
return the same results, we also need to skip all those checks when
testing selection support on streams.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
index da304a8caa8a..2e4d20f657f8 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -484,7 +484,6 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad, unsigne
 	targets[V4L2_SEL_TGT_NATIVE_SIZE].readonly = is_sink;
 	memset(&crop, 0, sizeof(crop));
 	crop.pad = pad;
-	crop.stream = stream;
 	crop.which = which;
 	memset(&sel, 0, sizeof(sel));
 	sel.which = which;
@@ -493,17 +492,20 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad, unsigne
 	sel.target = V4L2_SEL_TGT_CROP;
 	ret = doioctl(node, VIDIOC_SUBDEV_G_SELECTION, &sel);
 	node->has_subdev_selection |= (ret != ENOTTY) << which;
-	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_CROP, &crop) != ret);
+	if (!stream)
+		fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_CROP, &crop) != ret);
 	if (ret == ENOTTY) {
 		fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_SELECTION, &sel) != ENOTTY);
-		fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_CROP, &crop) != ENOTTY);
+		if (!stream)
+			fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_CROP, &crop) != ENOTTY);
 		return ret;
 	}
-	fail_on_test(check_0(crop.reserved, sizeof(crop.reserved)));
-	fail_on_test(crop.which != which);
-	fail_on_test(crop.pad != pad);
-	fail_on_test(crop.stream != stream);
-	fail_on_test(memcmp(&crop.rect, &sel.r, sizeof(sel.r)));
+	if (!stream) {
+		fail_on_test(check_0(crop.reserved, sizeof(crop.reserved)));
+		fail_on_test(crop.which != which);
+		fail_on_test(crop.pad != pad);
+		fail_on_test(memcmp(&crop.rect, &sel.r, sizeof(sel.r)));
+	}
 
 	for (unsigned tgt = 0; targets[tgt].target != ~0U; tgt++) {
 		targets[tgt].found = false;
@@ -544,7 +546,7 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad, unsigne
 		ret = doioctl(node, VIDIOC_SUBDEV_S_SELECTION, &s_sel);
 		if (node->is_ro_subdev && which == V4L2_SUBDEV_FORMAT_ACTIVE)
 			fail_on_test(ret != EPERM);
-		if (tgt == V4L2_SEL_TGT_CROP) {
+		if (tgt == V4L2_SEL_TGT_CROP && !stream) {
 			crop.rect = sel.r;
 			memset(crop.reserved, 0xff, sizeof(crop.reserved));
 			fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_CROP, &crop) != ret);
@@ -552,7 +554,6 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad, unsigne
 				fail_on_test(check_0(crop.reserved, sizeof(crop.reserved)));
 				fail_on_test(crop.which != which);
 				fail_on_test(crop.pad != pad);
-				fail_on_test(crop.stream != stream);
 				fail_on_test(memcmp(&crop.rect, &sel.r, sizeof(sel.r)));
 			}
 		}
-- 
Regards,

Laurent Pinchart


