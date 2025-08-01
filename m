Return-Path: <linux-media+bounces-38729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5908B188A2
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 23:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8BC87ABD79
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 21:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1731428ECDF;
	Fri,  1 Aug 2025 21:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TP3LRCv7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C63C28DEE3
	for <linux-media@vger.kernel.org>; Fri,  1 Aug 2025 21:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754083196; cv=none; b=AwNs14KLjf+uHoK/nLK5OySYcCF8UIemAdydO0jg8Tsg9QmvOG/eZ2w3OCT7GrshV4t7A9IwYt+nir/yt5aJUNtqy9jYWrNTWwaZFvRCJI7TzYJTdNOXLnqS3jzehRmCI6oz+xUyJjyKE15lcBr7winQJMgn/TmBLJpTxaqxrzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754083196; c=relaxed/simple;
	bh=ceHiEqE0O5HMLyIcqLT2YbzASJwJnL4+mlFL0egXW7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lxG02/0wWRRJCjaQAEIb4tuoJPr46+1cL1CaYm45wykMl58jmkbxmKt7kBsvFVJORR4sRV4cL0pJDfyAQL+H16X1Unq8HM/QJUqT9fn2RKZ2HpLxjNXuG3ASuJ5MbBOf6aBm8Lp4AceDT02EoKoV0rS0dHJOHJQykZLap/kM2oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TP3LRCv7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A6BC7594;
	Fri,  1 Aug 2025 23:19:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754083141;
	bh=ceHiEqE0O5HMLyIcqLT2YbzASJwJnL4+mlFL0egXW7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TP3LRCv7NyPjySR7K6t8LRtmLFkApRVT7tkLR6mrJczx8pO0q9IXgVx9p6sKKP4VA
	 s3HIG/DfsRF3bye0iZrNzR93XwO3JNI3CQ8qPFEhV1DSr6cqUAQe5HXkko+2Afmo7S
	 GO2SpPM6uacJgadwLZuOPtNOk1d0Q8Mf+DGWW+ew=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev
Subject: [PATCH 1/3] media: omap3isp: Drop custom .unsubscribe_event() handler
Date: Sat,  2 Aug 2025 00:19:31 +0300
Message-ID: <20250801211933.22553-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250801211933.22553-1-laurent.pinchart@ideasonboard.com>
References: <20250801211933.22553-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ccdc_unsubscribe_event() and omap3isp_stat_unsubscribe_event()
functions simply call v4l2_event_unsubscribe(), forwarding their
arguments. Replace them with the v4l2_event_subdev_unsubscribe() helper
that performs exactly the same operation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti/omap3isp/ispccdc.c     | 8 +-------
 drivers/media/platform/ti/omap3isp/isph3a_aewb.c | 2 +-
 drivers/media/platform/ti/omap3isp/isph3a_af.c   | 2 +-
 drivers/media/platform/ti/omap3isp/isphist.c     | 2 +-
 drivers/media/platform/ti/omap3isp/ispstat.c     | 7 -------
 drivers/media/platform/ti/omap3isp/ispstat.h     | 3 ---
 6 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispccdc.c b/drivers/media/platform/ti/omap3isp/ispccdc.c
index 7d0c723dcd11..55ee14e8b449 100644
--- a/drivers/media/platform/ti/omap3isp/ispccdc.c
+++ b/drivers/media/platform/ti/omap3isp/ispccdc.c
@@ -1873,12 +1873,6 @@ static int ccdc_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
 	return v4l2_event_subscribe(fh, sub, OMAP3ISP_CCDC_NEVENTS, NULL);
 }
 
-static int ccdc_unsubscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
-				  struct v4l2_event_subscription *sub)
-{
-	return v4l2_event_unsubscribe(fh, sub);
-}
-
 /*
  * ccdc_set_stream - Enable/Disable streaming on the CCDC module
  * @sd: ISP CCDC V4L2 subdevice
@@ -2487,7 +2481,7 @@ static int ccdc_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 static const struct v4l2_subdev_core_ops ccdc_v4l2_core_ops = {
 	.ioctl = ccdc_ioctl,
 	.subscribe_event = ccdc_subscribe_event,
-	.unsubscribe_event = ccdc_unsubscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
 /* V4L2 subdev video operations */
diff --git a/drivers/media/platform/ti/omap3isp/isph3a_aewb.c b/drivers/media/platform/ti/omap3isp/isph3a_aewb.c
index e6c54c4bbfca..ae93da9c4542 100644
--- a/drivers/media/platform/ti/omap3isp/isph3a_aewb.c
+++ b/drivers/media/platform/ti/omap3isp/isph3a_aewb.c
@@ -269,7 +269,7 @@ static const struct ispstat_ops h3a_aewb_ops = {
 static const struct v4l2_subdev_core_ops h3a_aewb_subdev_core_ops = {
 	.ioctl = h3a_aewb_ioctl,
 	.subscribe_event = omap3isp_stat_subscribe_event,
-	.unsubscribe_event = omap3isp_stat_unsubscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
 static const struct v4l2_subdev_video_ops h3a_aewb_subdev_video_ops = {
diff --git a/drivers/media/platform/ti/omap3isp/isph3a_af.c b/drivers/media/platform/ti/omap3isp/isph3a_af.c
index de7b116d0122..ca478da4ad34 100644
--- a/drivers/media/platform/ti/omap3isp/isph3a_af.c
+++ b/drivers/media/platform/ti/omap3isp/isph3a_af.c
@@ -334,7 +334,7 @@ static const struct ispstat_ops h3a_af_ops = {
 static const struct v4l2_subdev_core_ops h3a_af_subdev_core_ops = {
 	.ioctl = h3a_af_ioctl,
 	.subscribe_event = omap3isp_stat_subscribe_event,
-	.unsubscribe_event = omap3isp_stat_unsubscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
 static const struct v4l2_subdev_video_ops h3a_af_subdev_video_ops = {
diff --git a/drivers/media/platform/ti/omap3isp/isphist.c b/drivers/media/platform/ti/omap3isp/isphist.c
index 0ef78aace6da..7851ad13d84f 100644
--- a/drivers/media/platform/ti/omap3isp/isphist.c
+++ b/drivers/media/platform/ti/omap3isp/isphist.c
@@ -456,7 +456,7 @@ static const struct ispstat_ops hist_ops = {
 static const struct v4l2_subdev_core_ops hist_subdev_core_ops = {
 	.ioctl = hist_ioctl,
 	.subscribe_event = omap3isp_stat_subscribe_event,
-	.unsubscribe_event = omap3isp_stat_unsubscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
 static const struct v4l2_subdev_video_ops hist_subdev_video_ops = {
diff --git a/drivers/media/platform/ti/omap3isp/ispstat.c b/drivers/media/platform/ti/omap3isp/ispstat.c
index d3da68408ecb..07bd62a93d99 100644
--- a/drivers/media/platform/ti/omap3isp/ispstat.c
+++ b/drivers/media/platform/ti/omap3isp/ispstat.c
@@ -1010,13 +1010,6 @@ int omap3isp_stat_subscribe_event(struct v4l2_subdev *subdev,
 	return v4l2_event_subscribe(fh, sub, STAT_NEVENTS, NULL);
 }
 
-int omap3isp_stat_unsubscribe_event(struct v4l2_subdev *subdev,
-				    struct v4l2_fh *fh,
-				    struct v4l2_event_subscription *sub)
-{
-	return v4l2_event_unsubscribe(fh, sub);
-}
-
 void omap3isp_stat_unregister_entities(struct ispstat *stat)
 {
 	v4l2_device_unregister_subdev(&stat->subdev);
diff --git a/drivers/media/platform/ti/omap3isp/ispstat.h b/drivers/media/platform/ti/omap3isp/ispstat.h
index b548e617cf62..59842c4a9c33 100644
--- a/drivers/media/platform/ti/omap3isp/ispstat.h
+++ b/drivers/media/platform/ti/omap3isp/ispstat.h
@@ -135,9 +135,6 @@ void omap3isp_stat_cleanup(struct ispstat *stat);
 int omap3isp_stat_subscribe_event(struct v4l2_subdev *subdev,
 				  struct v4l2_fh *fh,
 				  struct v4l2_event_subscription *sub);
-int omap3isp_stat_unsubscribe_event(struct v4l2_subdev *subdev,
-				    struct v4l2_fh *fh,
-				    struct v4l2_event_subscription *sub);
 int omap3isp_stat_s_stream(struct v4l2_subdev *subdev, int enable);
 
 int omap3isp_stat_busy(struct ispstat *stat);
-- 
Regards,

Laurent Pinchart


