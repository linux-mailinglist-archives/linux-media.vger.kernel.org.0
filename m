Return-Path: <linux-media+bounces-7940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 561C688E6C5
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 15:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06E532E171F
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 14:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B65013BAF4;
	Wed, 27 Mar 2024 13:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQjnCC50"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A4C12FB2D
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 13:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711546140; cv=none; b=AwCYKAnRjTqYaEXDe+jIqQzLWk1KTRUOazlBC4r5U1IeLk2600+I1A5EGAFORP7UiFMQxLu6CYemzsqQVHZa0apYUPTCnCPXr4m9c6lryulwuWPJQoJUSYk5l5dnNyh2Jl7co4f/nkH18RBuxqnPkAI9scSIz8/v76KG/sQxOHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711546140; c=relaxed/simple;
	bh=4VxhYFM+IW/7q861Ak5yQv+JBl5nHqKZfRl/vrD3Qbs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XNG0iRBYsR+1VsILyqe9QfG+fXW+zQC+vmopvNZpDor3S/hswNgv8Y4OGSqJpivca3mFtuXxYSxUaMG2Zssz9H7CUf20AzKML+ecyFKp2Es7GOnjY05GMacXxeohI6VD7b6W4IMb16+++QY01n5a8hAaqcb154NcopOt4HS+HWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQjnCC50; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711546138; x=1743082138;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4VxhYFM+IW/7q861Ak5yQv+JBl5nHqKZfRl/vrD3Qbs=;
  b=nQjnCC50446IcI3GvZHzxJBLp8lFL8tBfHMCFAwh9jDyHj+iMw+xW4IC
   hEFA65xBR1Ue0vst3eKnwbOrxfNP/P+O6IdRbaSH2YFc3ir/ibH/sbzoO
   /OB7hmnBCYrc5yhaRXObymZjL4SpnAYF/E15A/ZS/TPlJ83pdAviJQ8fp
   T4wY2ipfVyfC4hfyygsKN+7yUjlW4JgPxDtEb/0RZHv8nzT4vZM+miy4u
   6108FUmnbIdip6kd6JtyF8QDl9JbinFKp5q5qa6hkDA3o9jhhk8hVQ6ih
   gv25U+4MO3GdIZf4/Sk3X2JL3kcNZpt5fqvrGbYEhpR8s6jrbys6+m/g8
   A==;
X-CSE-ConnectionGUID: PrU7s+DaTfKbhVJ29frVSg==
X-CSE-MsgGUID: GWyNWoUYQTezGX79gGO+Nw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6833510"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6833510"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 06:28:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="20949785"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 06:28:56 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8D9F111F8EA;
	Wed, 27 Mar 2024 15:28:53 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/1] media: ov2740: Fix LINK_FREQ and PIXEL_RATE control value reporting
Date: Wed, 27 Mar 2024 15:28:53 +0200
Message-Id: <20240327132853.521461-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver dug the supported link frequency up from the V4L2 fwnode
endpoint and used it internally, but failed to report this in the
LINK_FREQ and PIXEL_RATE controls. Fix this.

Fixes: 0677a2d9b735 ("media: ov2740: Add support for 180 MHz link frequency")
Cc: stable@vger.kernel.org # for v6.8 and later
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 552935ccb4a9..57906df7be4e 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -768,14 +768,15 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	cur_mode = ov2740->cur_mode;
 	size = ARRAY_SIZE(link_freq_menu_items);
 
-	ov2740->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2740_ctrl_ops,
-						   V4L2_CID_LINK_FREQ,
-						   size - 1, 0,
-						   link_freq_menu_items);
+	ov2740->link_freq =
+		v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2740_ctrl_ops,
+				       V4L2_CID_LINK_FREQ, size - 1,
+				       ov2740->supported_modes->link_freq_index,
+				       link_freq_menu_items);
 	if (ov2740->link_freq)
 		ov2740->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	pixel_rate = to_pixel_rate(OV2740_LINK_FREQ_360MHZ_INDEX);
+	pixel_rate = to_pixel_rate(ov2740->supported_modes->link_freq_index);
 	ov2740->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					       V4L2_CID_PIXEL_RATE, 0,
 					       pixel_rate, 1, pixel_rate);
-- 
2.39.2


