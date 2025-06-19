Return-Path: <linux-media+bounces-35237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4600ADFF8C
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 435F37AE546
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 08:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FFD264F9C;
	Thu, 19 Jun 2025 08:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzmHZFkK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861C6261584
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320958; cv=none; b=sWn6pufbdICquTvcTdKiyPw0E2hciVB49ZgD2SKZjDdlp2QyMM+pMkbEKuP+UUtHOvanI3wItURFhttZqMnMPpTpiSjqnnTGOPQWh7+lOxnV/kYNf9cX/Z7LarFEyLWCU+5W3nsxYk6b2MVXzQASlKD3FhL6UyPlf/FG+aIYEYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320958; c=relaxed/simple;
	bh=47WCPAGZdwJ5HGp4ja4GnEckR+7XBvQwDkUELmR9wzE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HKXYmyH11yBoWTndRr17RKpmIriVSpaxIi8E/uFMbiMiOlHURnYRE8m5Kxn2EVShOGUz84enalkI2MemNGpEwt9ioazBgpJk3TZE7Syerjm01sg3k8sFQCDGHvetQlW2aWiAWe3KESDs6LHTBYtqyjz3qqZsPagDmmG1KAfvNrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzmHZFkK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750320957; x=1781856957;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=47WCPAGZdwJ5HGp4ja4GnEckR+7XBvQwDkUELmR9wzE=;
  b=gzmHZFkK/ZCRZ1Z8KcinBG2LnPMOVZwSCbsLbd321ITxkDLmnk2OoRde
   nN8gkeisrPYix4U3nnmN81smt0yzFme1O6qQjBIIM3/4aOCLPui9Zn0Af
   IBrpjPlMLz2kyHMSyd1lb6aGVjd/KUtMTPuCfhpFGcHD1CX0scfJuTFzo
   Z82id+2XxIHeTve0szENCv7/HRvbFhHqfSjRA2XTLwagjcmjK0utVP869
   DCbgspWS/z1NuLH3S9RvwPtFHbOZN9jsNHhWjFoKKwP/ymv6ZH3TWYHs3
   FTv8xv5mf+NIP4tBrfCDVFXuWDtdarekX6A6ix3kAqIPxkIY+KU1FrNGm
   A==;
X-CSE-ConnectionGUID: Kt7St0upT7a1kg8ovZwm+w==
X-CSE-MsgGUID: sTRpFyHaQES8a4Xfqv48Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52716691"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52716691"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:54 -0700
X-CSE-ConnectionGUID: RYkKA4lXQ2iQ+O+qkkfoGA==
X-CSE-MsgGUID: w+J1EdwkT1WeTv4OlAbMBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150640658"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:52 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 940531204C3;
	Thu, 19 Jun 2025 11:15:46 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSAR0-006dot-1r;
	Thu, 19 Jun 2025 11:15:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com,
	tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH 07/13] media: ipu6: Set up CSI-2 receiver at correct moment
Date: Thu, 19 Jun 2025 11:15:40 +0300
Message-Id: <20250619081546.1582969-8-sakari.ailus@linux.intel.com>
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

Enable the CSI-2 receiver before the first stream is started and disable
it when the last stream is stopped. Before this patch, every time a stream
was started, the CSI-2 receiver was enabled and similarly, it was disabled
when any stream was stopped.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 25 ++++++++++++-------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 6030bd23b4b9..3b837e9ccffe 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -348,7 +348,7 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	struct ipu6_isys_csi2_timing timing = { };
 	struct v4l2_subdev *remote_sd;
 	struct media_pad *remote_pad;
-	u64 sink_streams;
+	u64 sink_streams, already_enabled;
 	int ret;
 
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
@@ -358,13 +358,17 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
 						&streams_mask);
 
-	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
-	if (ret)
-		return ret;
+	already_enabled = v4l2_subdev_state_streams_enabled(sd, state,
+							    CSI2_PAD_SINK);
+	if (!already_enabled) {
+		ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
+		if (ret)
+			return ret;
 
-	ret = ipu6_isys_csi2_set_stream(sd, &timing, csi2->nlanes, true);
-	if (ret)
-		return ret;
+		ret = ipu6_isys_csi2_set_stream(sd, &timing, csi2->nlanes, true);
+		if (ret)
+			return ret;
+	}
 
 	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index,
 					 sink_streams);
@@ -382,7 +386,7 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 {
 	struct v4l2_subdev *remote_sd;
 	struct media_pad *remote_pad;
-	u64 sink_streams;
+	u64 sink_streams, still_enabled;
 
 	sink_streams =
 		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
@@ -391,7 +395,10 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
-	ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
+	still_enabled = v4l2_subdev_state_streams_enabled(sd, state,
+							  CSI2_PAD_SINK);
+	if (still_enabled == sink_streams)
+		ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
 
 	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, sink_streams);
 
-- 
2.39.5


