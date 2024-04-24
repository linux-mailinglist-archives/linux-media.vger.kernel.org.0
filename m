Return-Path: <linux-media+bounces-10042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7C68B0E10
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 17:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46023B28095
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 15:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73756161321;
	Wed, 24 Apr 2024 15:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bKVS7RP8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EED315FA7D
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 15:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713972170; cv=none; b=Qz4Ekm9ha86b5ss1Z3HSppI9QEkzqSdFRhsIam0uMVHw24dr3Zlr1xZ7Wi2QXdghfnbZ+vd0NJ/usMWGvvwEbOcZ7ecAZClV7UF9UXgkKHYjQQ3Y4pVCmavU/ulqUZqPaIpOLcdGPV1RVl6pjeoVQohds5ywDmWT1jvwaebp6As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713972170; c=relaxed/simple;
	bh=Qjm5GViy46c+dXK/HLSygH+ymC2VafUHsnqBL808heg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DRasWx+PmsvdVhBbR1LRcZUZpnn7r7fp7epRnW2kexZGvyR36I12ht3Zm5xwyh3UHFX9lJLolAF3eoU/9DG+ktEl0tinCnWtGkXbubgdIVrhoG8Q+94IxeV351vDJ8JzB4vnQW38AEOW7FjvGGH65D/QI4nhpMruJJuajtgNRHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bKVS7RP8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 820BE11D6;
	Wed, 24 Apr 2024 17:21:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713972111;
	bh=Qjm5GViy46c+dXK/HLSygH+ymC2VafUHsnqBL808heg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bKVS7RP8KffuIv0Laa0YaTrWGVgMAM07xXTzuJD66oI1E7L+cAGGjRw+GAPX0FKW+
	 hIxCNp+gQVmJtSchCKmGAMPGvxITG7AhaDDc5tz2zET1vmJHMqOfMI/JetYIb04gkh
	 HhVOIHbWNfhtmPO+8sXNP2wr1WcrfatfBlwOQApo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>
Subject: [v4l-utils] [PATCH v2 7/7] v4l2-compliance: Test IMMUTABLE route flag
Date: Wed, 24 Apr 2024 18:22:30 +0300
Message-ID: <20240424152230.31923-8-laurent.pinchart@ideasonboard.com>
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

Accept the new V4L2_SUBDEV_ROUTE_FL_IMMUTABLE route flag when testing
routing, and verify that immutable routes are active as mandated by the
routing API specification.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
index 41eaf77112f0..409e82dae480 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -579,7 +579,8 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad, unsigne
 
 int testSubDevRouting(struct node *node, unsigned which)
 {
-	const uint32_t all_route_flags_mask = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
+	const uint32_t all_route_flags_mask = V4L2_SUBDEV_ROUTE_FL_ACTIVE
+					    | V4L2_SUBDEV_ROUTE_FL_IMMUTABLE;
 	struct v4l2_subdev_routing routing = {};
 	struct v4l2_subdev_route routes[NUM_ROUTES_MAX] = {};
 	unsigned int i;
@@ -629,6 +630,8 @@ int testSubDevRouting(struct node *node, unsigned which)
 			fail_on_test(!(sink->flags & MEDIA_PAD_FL_SINK));
 			fail_on_test(!(source->flags & MEDIA_PAD_FL_SOURCE));
 			fail_on_test(route->flags & ~all_route_flags_mask);
+			fail_on_test((route->flags & V4L2_SUBDEV_ROUTE_FL_IMMUTABLE) &&
+				     !(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE));
 		}
 	}
 
-- 
Regards,

Laurent Pinchart


