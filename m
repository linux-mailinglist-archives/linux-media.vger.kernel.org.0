Return-Path: <linux-media+bounces-8325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7B7894819
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 02:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8EE5282CAD
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 00:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F55833D1;
	Tue,  2 Apr 2024 00:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aNi8Eg5E"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897B6F9DA
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 00:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712016061; cv=none; b=FSt0I3qbOFqh9pOiT/X4Z/OtYbkXR20qrsxsZQDCBd7TQTikBTUd2dR7CgRE2Vk24NMG2AvZnsUeu+VCHt9JKgIm4fiUHFbacEY9D0TEqqAaLahBbIOVzaTbx8AMfoLmFZMgldo7KfrYRkyvkvLkH5IkaZWwfgvnO8krGB280/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712016061; c=relaxed/simple;
	bh=ps31HrSk/pRKEcYG/9jVsoAtEHI0qbH16p7XL+X/6mQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=odLdcuWTeWtZCRlH98ufI4acgnYsA61IazSsiuqqkkxO6HSqv2YoNTx9egd6R4GdkQR4hcuIs0g5irS3QkMDygpUDy3HGkr6M/QByVSnA4gjs6jnSIPKhrzMEugJNzawlYAAm9EZ0Xc/N0aRbhHYtqnZrNnfMh64YN7B2LSVJzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aNi8Eg5E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53315C55;
	Tue,  2 Apr 2024 02:00:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712016018;
	bh=ps31HrSk/pRKEcYG/9jVsoAtEHI0qbH16p7XL+X/6mQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aNi8Eg5E+EIqLlZBeiFyFh/u8ACFdTXRR75cPwIyV3klS8tZTg/SdjYPjyqPaNaCP
	 65I24XPFTXFvGfO60zQNn+v8RDTyF+7zrIL1hkPi0d2eMPxXz+h0VeIudnaoHDcM6t
	 2MOSy1D3fyLjQ3/DOexZLDttRN+WmHSXptHK6NqA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>
Subject: [v4l-utils] [PATCH 8/8] v4l2-compliance: Test IMMUTABLE route flag
Date: Tue,  2 Apr 2024 03:00:33 +0300
Message-ID: <20240402000033.4007-9-laurent.pinchart@ideasonboard.com>
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

Accept the new V4L2_SUBDEV_ROUTE_FL_IMMUTABLE route flag when testing
routing, and verify that immutable routes are active as mandated by the
routing API specification.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
index 714857021fc6..e26d09ed8586 100644
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


