Return-Path: <linux-media+bounces-10038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE258B0E0C
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 17:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14E4328743B
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 15:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979BE160880;
	Wed, 24 Apr 2024 15:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PPRW5j9p"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F23016078F
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 15:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713972165; cv=none; b=SZTWPchuaZjcwEkMcBle0L2zummgvKs4KbBenaTFg/lkXymZaP6Yt/gWtMSFpAPjVnDszAJps5mwcLH9tMyjucrubn0VMuSoq1k1IFQL40xUImCAwZRR+FSF+g6sH0hZnXyIlYfGyo1X982a1LmXu3mSwxZT76sCqCRnnNWwT/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713972165; c=relaxed/simple;
	bh=AaCNvpYDtkKRXfQqDZxRKaGAy+RWTu2/wC1yzxHsrsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sgVY5dVvfirEeLh/vUSWxhDllVpM6chYtdnXs69OHEvqXBN+YKdWXPl2L0K+qUYGlVjaNx0gdtjWst8dwcVCnxCOjlk9d6kTYVXFfZ+/sWLf+Tt44T2PxJViOWHamtsq+GunEI9okYTuOGLSgo2/qQcbaYu0y65Bk2pCZIvnxgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PPRW5j9p; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A798EBB;
	Wed, 24 Apr 2024 17:21:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713972108;
	bh=AaCNvpYDtkKRXfQqDZxRKaGAy+RWTu2/wC1yzxHsrsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PPRW5j9pEGm5A6bPDnzszSyBMxNAlMtTLtqcPPT0nQ5AoTLpDIw96R/B15kBbfECS
	 fZE9kAsFUXoF1yL6Xvdg8GPztW4HjGfDcEBS5CdqFnOpGhntbV06yOVCmdOMh9fPLY
	 iYJOi3cxTv2sLCjBTRl5lAANoaaAoU52pxLBO8PA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>
Subject: [v4l-utils] [PATCH v2 3/7] v4l2-compliance: Support the changed routing API
Date: Wed, 24 Apr 2024 18:22:26 +0300
Message-ID: <20240424152230.31923-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240424152230.31923-1-laurent.pinchart@ideasonboard.com>
References: <20240424152230.31923-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set len_routes of struct v4l2_subdev_routing. ENOSPC error code is no
longer used, i.e. having room for fewer routes than exist in the
configuration is not considered an error anymore.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 utils/v4l2-compliance/v4l2-compliance.cpp   | 12 +++++++-----
 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 19 +++++++++++--------
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index fd7e7d76e214..144f961842c6 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1272,15 +1272,17 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 
 			for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
 				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
+				struct v4l2_subdev_routing &routing = sd_routing[which];
 
-				sd_routing[which].which = which;
-				sd_routing[which].routes = (uintptr_t)sd_routes[which];
-				sd_routing[which].num_routes = NUM_ROUTES_MAX;
+				routing.which = which;
+				routing.routes = (uintptr_t)sd_routes[which];
+				routing.len_routes = NUM_ROUTES_MAX;
+				routing.num_routes = 0;
 
-				ret = doioctl(&node, VIDIOC_SUBDEV_G_ROUTING, &sd_routing[which]);
+				ret = doioctl(&node, VIDIOC_SUBDEV_G_ROUTING, &routing);
 				if (ret) {
 					fail("VIDIOC_SUBDEV_G_ROUTING: failed to get routing\n");
-					sd_routing[which].num_routes = 0;
+					routing.num_routes = 0;
 				}
 			}
 		}
diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
index da304a8caa8a..41eaf77112f0 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -587,17 +587,15 @@ int testSubDevRouting(struct node *node, unsigned which)
 
 	routing.which = which;
 	routing.routes = (uintptr_t)&routes;
+	routing.len_routes = 0;
 	routing.num_routes = 0;
 	memset(routing.reserved, 0xff, sizeof(routing.reserved));
 
-	/*
-	 * First test that G_ROUTING either returns success, or ENOSPC and
-	 * updates num_routes.
-	 */
+	/* First test that G_ROUTING returns success even when len_routes is 0. */
 
 	ret = doioctl(node, VIDIOC_SUBDEV_G_ROUTING, &routing);
-	fail_on_test(ret && ret != ENOSPC);
-	fail_on_test(ret == ENOSPC && routing.num_routes == 0);
+	fail_on_test(ret);
+	fail_on_test(routing.num_routes > NUM_ROUTES_MAX);
 	fail_on_test(check_0(routing.reserved, sizeof(routing.reserved)));
 
 	if (!routing.num_routes)
@@ -609,7 +607,8 @@ int testSubDevRouting(struct node *node, unsigned which)
 	 */
 
 	uint32_t num_routes = routing.num_routes;
-	routing.num_routes = num_routes + 1;
+	routing.len_routes = NUM_ROUTES_MAX;
+	routing.num_routes = 0;
 	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_ROUTING, &routing));
 	fail_on_test(routing.num_routes != num_routes);
 
@@ -633,10 +632,14 @@ int testSubDevRouting(struct node *node, unsigned which)
 		}
 	}
 
-	/* Set the same routes back, which should always succeed. */
+	/*
+	 * Set the same routes back, which should always succeed and report the
+	 * same number of routes.
+	 */
 
 	memset(routing.reserved, 0xff, sizeof(routing.reserved));
 	fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_ROUTING, &routing));
+	fail_on_test(routing.num_routes != num_routes);
 	fail_on_test(check_0(routing.reserved, sizeof(routing.reserved)));
 
 	/* Test setting invalid pads */
-- 
Regards,

Laurent Pinchart


