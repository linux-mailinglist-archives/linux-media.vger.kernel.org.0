Return-Path: <linux-media+bounces-40979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 839B2B33BE4
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E02E4817E3
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E7B2E03F1;
	Mon, 25 Aug 2025 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9HQtrz/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5515B2DF71F
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115516; cv=none; b=BASxip/szzoTQRjAPeYKHv87Timvg0OPUe9rkBWvrsqg1t54ePUcL+Ymze6Vi2kz9T7hYDzsUl9aVx98CEjU4DChFjAl5uG8ighJ1+QRbBjNIR7eZxHMRnRvN6dmh8nH7n6dt8ZouwOaa2Iv6ClkJjyHFDAegAhU26xuCQ0a4VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115516; c=relaxed/simple;
	bh=Eaus8bI2b93z8V6NqpCoQoHVvIXHMkPKyYb36XrIGik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o4nh82St45PRM9jzrKae99nouSauuUsBuqRHhk6hEubnD+HX+EVdQyZAkmHaJq5Nnn6oISkrW4NeozjljijND4i0Ld2tsz3rH0WmymmAAqxpfCuThQS8CiUUCE6C+ehu/DcupBL/pm7Ekbpi2KwU7aU0OLn2aAfjmjarQcZbftw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z9HQtrz/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115516; x=1787651516;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Eaus8bI2b93z8V6NqpCoQoHVvIXHMkPKyYb36XrIGik=;
  b=Z9HQtrz/DkHDsbizm3JGo8D8KHzZaCGOjXJT/+kHdwvK0GXesgSQ4ObE
   FbX2IBuf/GqtSAO05tmLfGf7AXyTnVuZjmux2om9Nz89oC0Y4MfydHaKC
   PMx8Jpmc9GGH1HSLE2LImjXtPTBnvVh44TnJo/BorcBz2yTMBnfEcu8DM
   YDksQACig2wjpp76ctx828K2ROo30ze/+DSUV6iLxtQFQak24uVdqhnlz
   LUGHUtdKKyx7N0JICq0igPiD2myPdWlC2HhM4LpQMaTPy8/j71DbNw/8o
   M6UrjHvtNuCcteMK+DQbF3pUJZMn8/PnkjNQjStY51WI+t26AHz7ZGT02
   w==;
X-CSE-ConnectionGUID: rPfCfXHmQByopazsnuYfIg==
X-CSE-MsgGUID: w14IqTGnR+i04hT9OupG6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032331"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032331"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:46 -0700
X-CSE-ConnectionGUID: 4UW+y4GyQFe6rQY8V9KUEA==
X-CSE-MsgGUID: pjOW91K8SMGrXh4ukwe2UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431102"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:39 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DE56D122007;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005ahY-3ft9;
	Mon, 25 Aug 2025 12:51:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 54/66] media: uapi: v4l: subdev: Enable streams API
Date: Mon, 25 Aug 2025 12:50:55 +0300
Message-ID: <20250825095107.1332313-55-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove v4l2_subdev_enable_streams_api variable that was used to easily
enable streams API for development, and conditions that use the variable.

This patch enables the streams API for V4L2 sub-device interface which
allows transporting multiple streams on a single MC link.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 30 ---------------------------
 1 file changed, 30 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 8d4c484109fb..8100a812c766 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -50,15 +50,6 @@ struct v4l2_subdev_stream_config {
 	struct v4l2_fract interval;
 };
 
-#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
-/*
- * The Streams API is an experimental feature. To use the Streams API, set
- * 'v4l2_subdev_enable_streams_api' to 1 below.
- */
-
-static bool v4l2_subdev_enable_streams_api;
-#endif
-
 /*
  * Maximum stream ID is 63 for now, as we use u64 bitmask to represent a set
  * of streams.
@@ -642,13 +633,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
 	int rval;
 
-	/*
-	 * If the streams API is not enabled, remove V4L2_SUBDEV_CAP_STREAMS.
-	 * Remove this when the API is no longer experimental.
-	 */
-	if (!v4l2_subdev_enable_streams_api)
-		streams_subdev = false;
-
 	switch (cmd) {
 	case VIDIOC_SUBDEV_QUERYCAP: {
 		struct v4l2_subdev_capability *cap = arg;
@@ -1002,9 +986,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		struct v4l2_subdev_routing *routing = arg;
 		struct v4l2_subdev_krouting *krouting;
 
-		if (!v4l2_subdev_enable_streams_api)
-			return -ENOIOCTLCMD;
-
 		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
 			return -ENOIOCTLCMD;
 
@@ -1029,9 +1010,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		unsigned int num_active_routes = 0;
 		unsigned int i;
 
-		if (!v4l2_subdev_enable_streams_api)
-			return -ENOIOCTLCMD;
-
 		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
 			return -ENOIOCTLCMD;
 
@@ -1122,14 +1100,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	case VIDIOC_SUBDEV_S_CLIENT_CAP: {
 		struct v4l2_subdev_client_capability *client_cap = arg;
 
-		/*
-		 * Clear V4L2_SUBDEV_CLIENT_CAP_STREAMS if streams API is not
-		 * enabled. Remove this when streams API is no longer
-		 * experimental.
-		 */
-		if (!v4l2_subdev_enable_streams_api)
-			client_cap->capabilities &= ~V4L2_SUBDEV_CLIENT_CAP_STREAMS;
-
 		/* Filter out unsupported capabilities */
 		client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
 					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);
-- 
2.47.2


