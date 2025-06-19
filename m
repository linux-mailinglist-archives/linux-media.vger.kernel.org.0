Return-Path: <linux-media+bounces-35240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DF5ADFF8F
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C289B3A3E11
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 08:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA93265630;
	Thu, 19 Jun 2025 08:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aASOWSur"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAB2264A95
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 08:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320959; cv=none; b=Qq1yU9fhvuuhSE7DAdAMF+COxoyxr4dgsa6ZGBZbIMvwgMbWQnyW2wu+rDRN3Jas9jNFdCyE4C6ZfxDuCTJMlQCx051/IJHVOOqF5bhL2qIbWVZm4EFzjVGaK0toE9X6ac/EucaYb6XMrUq1qTrwOsiuHHH5ZN8oSKI00IHowIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320959; c=relaxed/simple;
	bh=6+RupELWKu5g5ySp0yxM4MLpP+waDyHGWSeUdB9VWXo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lNj7pTo9i/hSgiDroyvSRquJgYszP4XRGbjg4QEnOq5EFSAtaiIRcGtXMZaMBXTyzqnQoNRbFAw4CdciiN6UxT0gJ/vNeMsGlUosxjyWvi+uxk3lFv+o69lu20R/tG+12vsUR+oBgqi462UxocZZqL9m/myK3OjngHX11p9+gG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aASOWSur; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750320958; x=1781856958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6+RupELWKu5g5ySp0yxM4MLpP+waDyHGWSeUdB9VWXo=;
  b=aASOWSur6da4O0mbVVKNB5l49dIGznHKqu4+o4M3pxdHbiyN6Xp4kk2y
   Pr4w4IqvjscRWoXLfMkJuwsa/lb9iz4ixqVzhmIgSbpQALyF2HVBWAyxJ
   JsMqe8q6rHlbBXDxmrImyO2OrS2Cb6zaPQA4l1i3Xu8adv6gDaW/0vcQx
   UuWmLdaQt9Cioqn5o4hoXWls+4mObUkOpfYmxFB11czi8QBGotLPkcW5f
   uRIJpAjc62k6BxlMRAi+b6HVNC9Jc6BtPYSqEkKkWHxxwgkmDIpXaDF3R
   ogvUquvk8Vs6yBe2gpmd34vnvF4APqeQ55XTiv7K7NKlIjCe+mek9WkJ3
   Q==;
X-CSE-ConnectionGUID: o7Wes49DQ2KAKKaBTx+Igw==
X-CSE-MsgGUID: OAfp0GXJQS6+NrSbtyQVuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52716697"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52716697"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:54 -0700
X-CSE-ConnectionGUID: /fRFkhaeS0C4HgbrD3x3Yw==
X-CSE-MsgGUID: Jo/S+KscQJSEh/NHAyipEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150640664"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:52 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9D23E1207E8;
	Thu, 19 Jun 2025 11:15:46 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSAR0-006dp9-1y;
	Thu, 19 Jun 2025 11:15:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com,
	tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH 10/13] media: v4l2-subdev: Add debug prints to v4l2_subdev_collect_streams()
Date: Thu, 19 Jun 2025 11:15:43 +0300
Message-Id: <20250619081546.1582969-11-sakari.ailus@linux.intel.com>
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

Print streams found by v4l2_subdev_collect_streams() at debug level.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 932fca795d4a..c549a462dac7 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2219,6 +2219,8 @@ static void v4l2_subdev_collect_streams(struct v4l2_subdev *sd,
 		*found_streams = BIT_ULL(0);
 		*enabled_streams =
 			(sd->enabled_pads & BIT_ULL(pad)) ? BIT_ULL(0) : 0;
+		dev_dbg(sd->dev,
+			"collect_streams: sub-device does not support streams\n");
 		return;
 	}
 
@@ -2237,6 +2239,9 @@ static void v4l2_subdev_collect_streams(struct v4l2_subdev *sd,
 		if (src_cfg->enabled)
 			*enabled_streams |= BIT_ULL(src_cfg->stream);
 	}
+	dev_dbg(sd->dev,
+		"collect_streams: %s:%u found %#llx enabled %#llx\n",
+		sd->entity.name, pad, *found_streams, *enabled_streams);
 }
 
 static void v4l2_subdev_set_streams_enabled(struct v4l2_subdev *sd,
-- 
2.39.5


