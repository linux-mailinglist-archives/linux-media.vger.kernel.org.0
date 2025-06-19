Return-Path: <linux-media+bounces-35238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1E1ADFF8D
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C7EF178BA5
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 08:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B514265609;
	Thu, 19 Jun 2025 08:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DKQl8g2D"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69738264618
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 08:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320958; cv=none; b=ZGu/v8nJSEoGWNvIDJvc72J7yDZWHNsW2IUsPPt21uB0lm3V59K59hHJeZw3tJ6h1J6KN3Y+EI+5bOqyf5Ot/1oNDHj3l2ZIAr0bCaHHLH3QAYdQ+4JUJhLHEomwmkQT4YrxSPrsU4z5rDKLB2LHPFpvHO+/V2ahATCMmwDMsRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320958; c=relaxed/simple;
	bh=uWy+apnVRZeD/NyXiKUrfKywxOQEliOpjGx9W4EMtag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UGthY3lkmTq9Ri2/VO1K24rbPdhsgBBwtsiQjsB+avi5ZMJsUjKhEdCfc83+kVN6cJb20U5E4O6lkcI+/E23DoTQ/vmaXIAOYKgo7WaIx3IwPWEH7YuvNLaRzbptkgdSJcGusKA7PjCw4EYTJpxxkX+KltPewDhUBFahCc6gVoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DKQl8g2D; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750320957; x=1781856957;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uWy+apnVRZeD/NyXiKUrfKywxOQEliOpjGx9W4EMtag=;
  b=DKQl8g2DCQClZ7Wa4DEqA/8qGhbtaWM91jtdxgz0QQMmes4KMxk9Ev7A
   9TUdttJslehcYdqNdpaFhJYqQdvoI8g+41XmUUGRq1+uHnmLoDfcokPDy
   iiYWFea7DUnqwlWxc5ZW1Q1vyElV4Zx7384Bu6oINn+eYCnR41s86sYh9
   wUcKTK5kxjb2+h5mlX+iEP4Eki3f61x3ml93NSZlN+BW4mub7I/eJCW9C
   DzH7AXGrusV5Q3wTdezcixqpCwi3vfbMgd6aYi0uysFGDs9JtxfRtxcXi
   8X5n8TYz49f4VGKXsqMdsTpobxF270OLYP3VUCvpb2TN+/q+sZqHSYN/6
   g==;
X-CSE-ConnectionGUID: fEQG5LOoSMe5GvpqbEjFMQ==
X-CSE-MsgGUID: UYmzss+ySjCYvDAAIvIsGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52716695"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52716695"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:54 -0700
X-CSE-ConnectionGUID: ldGNTMuPTX2h0Zvti3vjeQ==
X-CSE-MsgGUID: QtcVjuq2TTa2OIDYNmQSlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150640660"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:52 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 965E912072A;
	Thu, 19 Jun 2025 11:15:46 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSAR0-006doz-1t;
	Thu, 19 Jun 2025 11:15:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com,
	tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH 08/13] media: v4l2-subdev: Print early in v4l2_subdev_{enable,disable}_streams()
Date: Thu, 19 Jun 2025 11:15:41 +0300
Message-Id: <20250619081546.1582969-9-sakari.ailus@linux.intel.com>
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

Print debug messages early in v4l2_subdev_enable_streams() and
v4l2_subdev_disable_streams(), before sanity checks take place. This can
help figuring out why something goes wrong, in driver development or
otherwise.

Also print the name of the sub-device where streaming is to be enabled or
disabled.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 5afdd9d548b5..6bc855058ca6 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2273,6 +2273,9 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
 	bool use_s_stream;
 	int ret;
 
+	dev_dbg(dev, "enable streams %s:%u/%#llx\n", sd->entity.name, pad,
+		streams_mask);
+
 	/* A few basic sanity checks first. */
 	if (pad >= sd->entity.num_pads)
 		return -EINVAL;
@@ -2320,8 +2323,6 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
 		goto done;
 	}
 
-	dev_dbg(dev, "enable streams %u:%#llx\n", pad, streams_mask);
-
 	already_streaming = v4l2_subdev_is_streaming(sd);
 
 	if (!use_s_stream) {
@@ -2373,6 +2374,9 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
 	bool use_s_stream;
 	int ret;
 
+	dev_dbg(dev, "disable streams %s:%u/%#llx\n", sd->entity.name, pad,
+		streams_mask);
+
 	/* A few basic sanity checks first. */
 	if (pad >= sd->entity.num_pads)
 		return -EINVAL;
@@ -2420,8 +2424,6 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
 		goto done;
 	}
 
-	dev_dbg(dev, "disable streams %u:%#llx\n", pad, streams_mask);
-
 	if (!use_s_stream) {
 		/* Call the .disable_streams() operation. */
 		ret = v4l2_subdev_call(sd, pad, disable_streams, state, pad,
-- 
2.39.5


