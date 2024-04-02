Return-Path: <linux-media+bounces-8323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9FD894817
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 02:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55198282C5D
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 00:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D786810F7;
	Tue,  2 Apr 2024 00:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HMoh+a9s"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A528C13
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 00:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712016058; cv=none; b=sYpOu9PyWpMO5wAl7d/wfxujLHj5l3PzgJbMuA0Ws5p6neFsHNIJ9es7jqJVviHzNciv7pNNFi6PHzk1jKrJRbDneQfFvApL9Hh5SyjH91twEUg6JMdzHjpBZ/pe6UotBHaG0bjKYcGXTlk2T/YJyZ5kObqxRpBJUWi+Kyw19hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712016058; c=relaxed/simple;
	bh=qtaZFXKdqXDpmPebKflqhuPylK9zLqfLRVp2LCEkaKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jRsMhEtq+XEUaOy4HLI5OKBq1MVHENSX+qswt+TU4CTELpJbwE9IFS31XiXCl2bRpLPPIVlX4hX8TA1mH/LEtTHXLjfWCwXJdXz3JzoLXpY18sQh9wJ9huoJ1+v57ltd5EdUqhGIfhBOlA+LXEZns4pL7raC/6MzAMZXnp3GnRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HMoh+a9s; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABFAED4D;
	Tue,  2 Apr 2024 02:00:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712016015;
	bh=qtaZFXKdqXDpmPebKflqhuPylK9zLqfLRVp2LCEkaKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HMoh+a9sOeXEl/XaiZ6OBh1ER+j2mZmqKaf1hSNWSsQIhOgeQ2NQIk2PdVLlIB4pM
	 pA7a0inCWvQCmfGQQgzKpSVI8D5uhkM1x11x+XSwBBc1fgCNrOj8a1SF1gtZt4zoJi
	 cnFDhs259OejedyXkRli11f0Z2TJ+4AZn5UTpv34=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>
Subject: [v4l-utils] [PATCH 6/8] v4l2-compliance: Support the changed routing API
Date: Tue,  2 Apr 2024 03:00:31 +0300
Message-ID: <20240402000033.4007-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240402000033.4007-1-laurent.pinchart@ideasonboard.com>
References: <20240402000033.4007-1-laurent.pinchart@ideasonboard.com>
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
index 2cf979096bd0..72fe0bd778ab 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1272,15 +1272,17 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 
 			for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
 				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
+				struct v4l2_subdev_routing &routing = sd_routing[which];
 
-				sd_routing[which].which = which;
-				sd_routing[which].routes = (__u64)sd_routes[which];
-				sd_routing[which].num_routes = NUM_ROUTES_MAX;
+				routing.which = which;
+				routing.routes = (__u64)sd_routes[which];
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
index ebca1b94f5c0..714857021fc6 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -587,17 +587,15 @@ int testSubDevRouting(struct node *node, unsigned which)
 
 	routing.which = which;
 	routing.routes = (__u64)&routes;
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


