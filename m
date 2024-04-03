Return-Path: <linux-media+bounces-8505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE7D896C33
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 12:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CF96B2FFB6
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 10:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2CDE13774B;
	Wed,  3 Apr 2024 10:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LiZLm0nz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A02134CEC
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 10:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712139366; cv=none; b=UTgK+/qxUmCYNXKpw0PxdyNJ3YccXeRrxpzMTGwSRs+2k13i1gS46vD5mZGAEKuYV+fQD6NwTBJmpwt/FLBE7vHe5ty2rAaGyQLcwzwKFsFDShHvhKd6Wtjol0ZmMb7GjC4+gEl/ux8fRBw9UxqAu+Z/Jk5P/fzSQaP2yDUqh5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712139366; c=relaxed/simple;
	bh=ir52GyRt8PzGCp/WvQKeCrjFaSRJOfwsrH95hZL9gJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DYzp2sLI71X8E4HNW8eEatTwSN+Fm7276wuRyIMvpxODdkBlaTey+cYAGGS4nC4p/HAyJjZ7pID+oMt/FMUW3gRC2yFAHz2Ez74fg9EoBGQDwhuE4vcSJQtlO6u+4QYW+UyTgpXTokiYJNqh0vMpWe7lNvFndcNHTTKEb2X4ufw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LiZLm0nz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04E50674;
	Wed,  3 Apr 2024 12:15:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712139323;
	bh=ir52GyRt8PzGCp/WvQKeCrjFaSRJOfwsrH95hZL9gJY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LiZLm0nzhcEY7vANxTWXICMGC+mb0667NNJ8GAFOa4AvTTQ2uQpFHwNOJm4IpA8dt
	 zFlsPvlnsYMBNdiz1CHnU8Zq2IeXxM9ScBkmONY7wzq8gmJ/RVYo5OoJwoUehT01ac
	 U8NRD9Kcn2ffWnsqaHFYmOiqlAB4q2dInuO3AGQw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 03 Apr 2024 13:15:44 +0300
Subject: [PATCH v4l-utils v2 1/2] v4l2-compliance: Fix use of routing on
 32-bit platforms
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-v4l2-compliance-streams-fixes-v2-1-be9b338dc204@ideasonboard.com>
References: <20240403-v4l2-compliance-streams-fixes-v2-0-be9b338dc204@ideasonboard.com>
In-Reply-To: <20240403-v4l2-compliance-streams-fixes-v2-0-be9b338dc204@ideasonboard.com>
To: linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2131;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ir52GyRt8PzGCp/WvQKeCrjFaSRJOfwsrH95hZL9gJY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBmDSxe3qlgklQ2KLFIu5csx9mREgDWN8Ui2HzND
 5cApdFNwcaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZg0sXgAKCRD6PaqMvJYe
 9ZpIEACPnqGbcMZkEUnsGNV5jtY43w06xLtzsQOvO7PvgEzrI6NBSbdv5KKZ/wOG2m3WSDfdluo
 9/GnVsSyDSCdjSfCuTgGi8ErVBUXgTwmKwBelzPHrK7cYSdKdlWVKnqUGEF1vsD1cMnZWsLpr2v
 vqzV4HcRKV3BJsznBFzm8OuKleY0Gb1inW9xkouN9koqXQnIry2uPzv4zIVxSzuDDafiwjYfzBL
 WrxTGaZNjWkgroKFRpyfZR4Z/7uFxbOR4nybkvmt0fQaggh4Zxoj0/lqcHnL13Lgju4OmJcXsC4
 1Ru04mGFXQzQdGN7cLebBxBey78ViLgq/KefURGEeBnR3JDaJNpXdW5WFn6wvNe7SuUkHhKSQju
 1Nfz/K+VpV1R24xBIGMOHDr1EUF0tP8eYGiE6M1/h8zNQn+LlSluBwftiLD2cfnbbtrYGv/B0kT
 oAVAi8GPXnMPwhNidLsiLTa2NYv4o4gYIXckyfwEWKgwtoA8l9WIKspKijyu0EKlUzDiFSTXFpy
 v1Qw6dG/D19ZWc9lVd/TMiFlwCQ0+LM4MeMyFnlgMDCScTRxxY35i4+HJrAQ3/lXh3grwYLSjwR
 2SA5NNIrkdB/+8uUz/wsrBNK45rJeTwqvQB/7Tm2nMb42vmIMldf3z903VSczv9bVp+XnglQgcR
 hGxnpBAbeYUbiMw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

At the moment we do:

routing.routes = (__u64)&routes;

On 32-bit platforms the 32-bit address will be sign-extended, possibly
resulting setting the address to, e.g., 0xff000000 -> 0xffffffffff000000.

Fix this by converting the address to uintptr_t.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 utils/v4l2-compliance/v4l2-compliance.cpp   | 4 ++--
 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 2cf97909..fd7e7d76 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1274,7 +1274,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
 
 				sd_routing[which].which = which;
-				sd_routing[which].routes = (__u64)sd_routes[which];
+				sd_routing[which].routes = (uintptr_t)sd_routes[which];
 				sd_routing[which].num_routes = NUM_ROUTES_MAX;
 
 				ret = doioctl(&node, VIDIOC_SUBDEV_G_ROUTING, &sd_routing[which]);
@@ -1305,7 +1305,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 					routes = sd_routes[which];
 				} else {
 					dummy_routing.num_routes = 1;
-					dummy_routing.routes = (__u64)&dummy_routes;
+					dummy_routing.routes = (uintptr_t)&dummy_routes;
 					dummy_routes[0].source_pad = pad;
 					dummy_routes[0].source_stream = 0;
 					dummy_routes[0].sink_pad = pad;
diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
index ebca1b94..560efb70 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -586,7 +586,7 @@ int testSubDevRouting(struct node *node, unsigned which)
 	int ret;
 
 	routing.which = which;
-	routing.routes = (__u64)&routes;
+	routing.routes = (uintptr_t)&routes;
 	routing.num_routes = 0;
 	memset(routing.reserved, 0xff, sizeof(routing.reserved));
 

-- 
2.34.1


