Return-Path: <linux-media+bounces-3802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3904F8306A3
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 14:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C5141C23BBC
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 13:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68471EB57;
	Wed, 17 Jan 2024 13:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KhD+56zX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE971EA7A
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 13:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705496915; cv=none; b=D4SuKg8Zn0mdub5ztdf/oDfVAi2b+12IXCqbmaOOTVq6QdFaMog1ogxuiefa8lPGi/8Wc84eOEz6FSEfaAS+GEzjGv/nzoemyo56lejTcFVMEvSbM+CwuiHwvkAHRGrXVHgS1Uqmfc7zt7kmU5clZjcTm6Kuslcqzd4yZuF0Aj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705496915; c=relaxed/simple;
	bh=/p83iaZdiqKmAfE8XubGCRMyqdWZmwn4C+uvXc/xl8g=;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding; b=ib7e1lN39cmfAdTr8UN7lGkNfDbkiJUi/7jn8Sem/JmEBKqr1PlvwPWwxgaCjF8z6z6hyEzdUCS5++/dMu6myfCNIofDo2yY+JE9N7RtcjpigYrX1rzLEyEmcoelUJZZRCJUqtTYq5gqShvl3NoJsGYTWXqLF0uUAkwOmj2ES/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KhD+56zX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 865CC7E2;
	Wed, 17 Jan 2024 14:07:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705496841;
	bh=/p83iaZdiqKmAfE8XubGCRMyqdWZmwn4C+uvXc/xl8g=;
	h=From:To:Cc:Subject:Date:From;
	b=KhD+56zXPyPHZeJiAp41rfJnvClsUJatKq9h976LTpL9iv5EWNb+1sFEF85zsY87k
	 4YKU0HgvMXM2c4MGmmXex4pLTFV7DpHDXpf+xdRQW1WA81yHPojJrzcCr+Ht4Nun01
	 PgZBvgrBTWTUF8Er4P85+sJOcgC90Z0YzbTK88hg=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 1/2] v4l2-ctl: Add --try-routing option
Date: Wed, 17 Jan 2024 13:08:04 +0000
Message-Id: <20240117130805.939312-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2-ctl's --list-subdev-mbus-codes option sets the which flag to
V4L2_SUBDEV_FORMAT_TRY, which is an entirely reasonable choice, but
means it's currently impossible to list mbus codes for pads that are
only part of inactive routes as the --set-routing option sets ACTIVE
routing rather than TRY.

Add a --try-routing option that has identical functionality to the
existing --set-routing but which uses the TRY format instead.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp | 11 +++++++----
 utils/v4l2-ctl/v4l2-ctl.cpp        |  1 +
 utils/v4l2-ctl/v4l2-ctl.h          |  1 +
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
index 86e6c689..48b79288 100644
--- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
@@ -96,7 +96,8 @@ void subdev_usage()
 	       "  --set-subdev-fps pad=<pad>,stream=<stream>,fps=<fps> (for testing only, otherwise use media-ctl)\n"
 	       "                     set the frame rate [VIDIOC_SUBDEV_S_FRAME_INTERVAL]\n"
 	       "  --get-routing      Print the route topology\n"
-	       "  --set-routing <routes>\n"
+	       "  --set-routing      (for testing only, otherwise use media-ctl)\n"
+	       "  --try-routing <routes>\n"
 	       "                     Comma-separated list of route descriptors to setup\n"
 	       "\n"
 	       "Routes are defined as\n"
@@ -458,14 +459,16 @@ void subdev_cmd(int ch, char *optarg)
 			}
 		}
 		break;
-	case OptSetRouting: {
+	case OptSetRouting:
+	case OptTryRouting: {
 		struct v4l2_subdev_route *r;
 		char *end, *ref, *tok;
 		unsigned int flags;
 
 		memset(&routing, 0, sizeof(routing));
 		memset(routes, 0, sizeof(routes[0]) * NUM_ROUTES_MAX);
-		routing.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+		routing.which = ch == OptSetRouting ? V4L2_SUBDEV_FORMAT_ACTIVE :
+				      V4L2_SUBDEV_FORMAT_TRY;
 		routing.num_routes = 0;
 		routing.routes = (__u64)routes;
 
@@ -683,7 +686,7 @@ void subdev_set(cv4l_fd &_fd)
 					fival.interval.denominator, fival.interval.numerator);
 		}
 	}
-	if (options[OptSetRouting]) {
+	if (options[OptSetRouting] || options[OptTryRouting]) {
 		if (!_fd.has_streams()) {
 			printf("Streams API not supported.\n");
 			return;
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index e195ad8e..f9121284 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -65,6 +65,7 @@ static struct option long_options[] = {
 	{"set-fmt-video-out", required_argument, nullptr, OptSetVideoOutFormat},
 	{"try-fmt-video-out", required_argument, nullptr, OptTryVideoOutFormat},
 	{"get-routing", no_argument, 0, OptGetRouting},
+	{"try-routing", required_argument, 0, OptTryRouting},
 	{"set-routing", required_argument, 0, OptSetRouting},
 	{"help", no_argument, nullptr, OptHelp},
 	{"help-tuner", no_argument, nullptr, OptHelpTuner},
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index cc7f1184..6382619c 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -193,6 +193,7 @@ enum Option {
 	OptShowEdid,
 	OptFixEdidChecksums,
 	OptGetRouting,
+	OptTryRouting,
 	OptSetRouting,
 	OptFreqSeek,
 	OptEncoderCmd,
-- 
2.34.1


