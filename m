Return-Path: <linux-media+bounces-35236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DD8ADFF8B
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19E643A36D3
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 08:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54841264F87;
	Thu, 19 Jun 2025 08:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7Lr+SCD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495CA2609D0
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320957; cv=none; b=ibqc8HwFBTtlU74xVZlTO/+ghIbrIRdm3S8JYf1geICItn7I1HTcDYRcWsMt6uwWj5ISxfvDOX2EgOnIS1Pd1q1QIsh9quJK8jKgZtoOHcESISElJbTIq3T2Cy2FR2mLvXp6k/AHg2ax6pJ93EL/UfGvQ6ChRkkFB9b+8wSTIZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320957; c=relaxed/simple;
	bh=GWV1VXoI/NCYmwOqr/YEPI+v1K1j2zxmrQ/kzZT3Ty8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=js4tJok9napqH9szdSY4UwSgeRAsPV2uh7cuP8GGYZmCLACMvltGhKZqbHh706H7NcRTAkLWHuJTMS/U3DYp0obBPLv4viCueS+4z2/IpM88bxna1/EdbKkRl6Em9c/arI+gLhtwrHZA3dmJG95Usmwmk7E12zPPvOx97RTURyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7Lr+SCD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750320956; x=1781856956;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GWV1VXoI/NCYmwOqr/YEPI+v1K1j2zxmrQ/kzZT3Ty8=;
  b=B7Lr+SCDu6kE+RAbLm9f4YcK5H5Iv0K5tVNOPVJKdbdzisZW47JbtDyp
   m/IUpvfXHNmqcfIc6wv6H8Y0AF7OijL6YErYJzWLFcIWb2n/r1u0ma30u
   lNU+VNnQTuD7nT837p65mTH1Sfx63qSKVKMW0T63elNLXoeuI4pzvpk/n
   hXcbr9MmQpTy8aCnpjyO4zGJBsKCKkj/IkKo7M3uCo4O7WBily3wwLnEK
   pSPHQ4JTCpyvMT30VYBUnBds3UHe0db4eCMQ4/uc7nM718mg9BNUHeGV3
   tsO9pNpcO5+I6YDieE9ReGLeJe7X2A/Nck6jPG4b5KBpsbU2HoKDAh7R7
   A==;
X-CSE-ConnectionGUID: b9YqYq1aROqbzMgNfBaqDQ==
X-CSE-MsgGUID: wQofZiWJSH6lhUxiwEGfYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52716690"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52716690"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:54 -0700
X-CSE-ConnectionGUID: +eG74scuTGSPG0Q6nED27Q==
X-CSE-MsgGUID: 9C4dFN/0TayXA0wRcmxhkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150640657"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:52 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9972B12074F;
	Thu, 19 Jun 2025 11:15:46 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSAR0-006dp4-1w;
	Thu, 19 Jun 2025 11:15:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com,
	tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH 09/13] media: v4l2-subdev: Collect streams on source pads only
Date: Thu, 19 Jun 2025 11:15:42 +0300
Message-Id: <20250619081546.1582969-10-sakari.ailus@linux.intel.com>
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

v4l2_subdev_collect_streams() is used to find the streams present on
source pads only. Only iterate through the streams on source pads, i.e. on
odd array indices.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 6bc855058ca6..932fca795d4a 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2225,16 +2225,17 @@ static void v4l2_subdev_collect_streams(struct v4l2_subdev *sd,
 	*found_streams = 0;
 	*enabled_streams = 0;
 
-	for (unsigned int i = 0; i < state->stream_configs.num_configs; ++i) {
-		const struct v4l2_subdev_stream_config *cfg =
-			&state->stream_configs.configs[i];
+	for (unsigned int i = 0; i < state->stream_configs.num_configs; i += 2) {
+		const struct v4l2_subdev_stream_config *src_cfg =
+			&state->stream_configs.configs[i + 1];
 
-		if (cfg->pad != pad || !(streams_mask & BIT_ULL(cfg->stream)))
+		if (src_cfg->pad != pad ||
+		    !(streams_mask & BIT_ULL(src_cfg->stream)))
 			continue;
 
-		*found_streams |= BIT_ULL(cfg->stream);
-		if (cfg->enabled)
-			*enabled_streams |= BIT_ULL(cfg->stream);
+		*found_streams |= BIT_ULL(src_cfg->stream);
+		if (src_cfg->enabled)
+			*enabled_streams |= BIT_ULL(src_cfg->stream);
 	}
 }
 
-- 
2.39.5


