Return-Path: <linux-media+bounces-35235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0700ADFF8A
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76AF41890366
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 08:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFA2264638;
	Thu, 19 Jun 2025 08:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6oMOG6i"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31F1233158
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 08:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320957; cv=none; b=EH0Iu7wOprWmbcIDXwEyhhhbzH0diAWagFj2uCjZ45OwQESMmnmGBHOnBG0JL8cKXnEk/48N8h1mjgs/qnDZiLFKt6G/emLDYY4v6SYykGe1ZEWmJX3qnDLcdknkS3VEd51jwXNH79esqLLYOGAJMtWFU3HtZMZrNeIXkPEl0yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320957; c=relaxed/simple;
	bh=toaP8hgbWqTBICaySJ2t1CNDffvE9e7y3k5r8FROdc0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t7EUHff7RRs4cEyJCSIHCeSPRubxiGkJubmY8w+eWJJlz52TWSwV4fHeyZDIIYI2tOuVP1KJzHFB50a5GG+uAkdXCF8QgjsZN+xPG8RpGTO/tvxJrd988TqLIhu9bJexOc5DNl9Ee2TwEXvLBfh3igVZyhyzrr/enipuRKj+7aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6oMOG6i; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750320955; x=1781856955;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=toaP8hgbWqTBICaySJ2t1CNDffvE9e7y3k5r8FROdc0=;
  b=X6oMOG6i5Njs5mURQyVrTZlANV14WlZW+Tjd5uRUmOpVJKYhuDxdCNvA
   4vz3NYzUn9mURGUC6GKz8dmbXUIMFcpLJVt1xqhHJwAC9JzlXwO0j0pex
   lWYUDDFJ88HHrJPWyiyVIU1l49RzzqS6yU5UJtLp0qwGXOkDP5/QTNBRN
   2fwALmptNR+NUOj5PDhmB/B01xnp/Sg4jAQrZCWPhFAgsAe9kBa9D9NG3
   s0rIe2bFN7md1/eKfin9GWL3hHHaQuaUOpBFEZAxhvIT3Tt01fOAcwvg3
   qQe+fPKsFjOYrW838NNZcwWlQ90OZz9IzAQCoNc0mt0BtV/nI6qaQA136
   A==;
X-CSE-ConnectionGUID: F1xgvFp9SXC5t+Da3GTJvw==
X-CSE-MsgGUID: IOwTTa6iSDqQz3VMfZdlUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52716676"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52716676"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:50 -0700
X-CSE-ConnectionGUID: 13rleAQMSMGr+C5NyzdW1w==
X-CSE-MsgGUID: lSmJF06eRreO0pQ/UmqXlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150640625"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8A3661203A5;
	Thu, 19 Jun 2025 11:15:46 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSAR0-006doY-1i;
	Thu, 19 Jun 2025 11:15:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com,
	tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH 03/13] media: ipu6: Enable and disable each stream at CSI-2 subdev source pad
Date: Thu, 19 Jun 2025 11:15:36 +0300
Message-Id: <20250619081546.1582969-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On UAPI, streaming is started a video device at a time. The IPU6 ISYS
driver only starts streaming on the source sub-device when all relevant
video devices have been set streaming. This also needs to be reflected in
the sub-device pads, hence set them all streaming, one at a time.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 43 ++++++++++++-------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 24a2ef93474c..54006b5e2ccd 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -990,6 +990,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	struct v4l2_subdev *sd;
 	struct media_pad *r_pad;
+	unsigned int i;
 	u32 sink_pad, sink_stream;
 	u64 r_stream;
 	u64 stream_mask = 0;
@@ -1018,14 +1019,15 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 		stop_streaming_firmware(av);
 
 		/* stop sub-device which connects with video */
-		dev_dbg(dev, "stream off entity %s pad:%d mask:0x%llx\n",
-			sd->name, r_pad->index, stream_mask);
-		ret = v4l2_subdev_disable_streams(sd, r_pad->index,
-						  stream_mask);
-		if (ret) {
-			dev_err(dev, "stream off %s failed with %d\n", sd->name,
-				ret);
-			return ret;
+		for (i = CSI2_PAD_SRC; i < NR_OF_CSI2_SRC_PADS; i++) {
+			if (!media_pad_pipeline(&sd->entity.pads[i]))
+				continue;
+			ret = v4l2_subdev_disable_streams(sd, i, 1U);
+			if (ret) {
+				dev_err(dev, "stream off %s failed with %d\n",
+					sd->name, ret);
+				return ret;
+			}
 		}
 		close_streaming_firmware(av);
 	} else {
@@ -1036,13 +1038,15 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 		}
 
 		/* start sub-device which connects with video */
-		dev_dbg(dev, "stream on %s pad %d mask 0x%llx\n", sd->name,
-			r_pad->index, stream_mask);
-		ret = v4l2_subdev_enable_streams(sd, r_pad->index, stream_mask);
-		if (ret) {
-			dev_err(dev, "stream on %s failed with %d\n", sd->name,
-				ret);
-			goto out_media_entity_stop_streaming_firmware;
+		for (i = CSI2_PAD_SRC; i < NR_OF_CSI2_SRC_PADS; i++) {
+			if (!media_pad_pipeline(&sd->entity.pads[i]))
+				continue;
+			ret = v4l2_subdev_enable_streams(sd, i, 1U);
+			if (ret) {
+				dev_err(dev, "stream on %s failed with %d\n",
+					sd->name, ret);
+				goto out_media_entity_stop_streaming_firmware;
+			}
 		}
 	}
 
@@ -1051,6 +1055,15 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 	return 0;
 
 out_media_entity_stop_streaming_firmware:
+	while (i-- > CSI2_PAD_SRC) {
+		int ret2;
+
+		if (!media_pad_pipeline(&sd->entity.pads[i]))
+			continue;
+		ret2 = v4l2_subdev_disable_streams(sd, i, 1U);
+		dev_err(dev, "stream off %s failed with %d\n", sd->name, ret2);
+	}
+
 	stop_streaming_firmware(av);
 
 	return ret;
-- 
2.39.5


