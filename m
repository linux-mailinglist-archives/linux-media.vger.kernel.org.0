Return-Path: <linux-media+bounces-35239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 034CDADFF8E
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9D827A545C
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 08:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6DF7217F36;
	Thu, 19 Jun 2025 08:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDAE0Zqb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEC726463E
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 08:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320959; cv=none; b=qmfGdOnmmJB6L8xlBjmdi8cIlJM6ciVVjOOCyZWCaE3f0VecYkrruM/9uUc9e3UK/AZH5MY/P/Sq/iu6DrTgPIyPGN4EseOnXDOrDQcKY874kUKKCBvMEWPPa987dVt5Ifi7QvVeDTjtI2PbZHdT9gFpRC35mWetRDWoriJ1rQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320959; c=relaxed/simple;
	bh=pUBNwUfQrSoHffNZr14XQK2rDs1c6cY6S1yjL8kYxVA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=frCeI/jkgxknTcVzzVRtteUVpKbqEj9eekanIXWig1SobRnazQFRcymcgbMHxpZBL2J9Wyk+oZYIHvNqXMUn2wGqzkzjtJzO2i6Sjg5zaWBE9dXJooooVkFlnx7aVIs3BO60D7pre+imORjwYTxuEgyMuA8+CK0fslg5YtzY8p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IDAE0Zqb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750320958; x=1781856958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pUBNwUfQrSoHffNZr14XQK2rDs1c6cY6S1yjL8kYxVA=;
  b=IDAE0Zqb+Mt8XVJAX0bLdDrJ3XuUMvxxSwRQ0RjbqXcVcdTewnpdgT8C
   A50SjNqZ+wp8B3nMeDXABy97cv8Xy2tE2ohKCpJ8nQprjQeEFirgZTRoj
   dqAWEIqmig5y4GSAsx36o6ZAC3QY/Lu56bdmKgDaw2NeuEiFVOXM9zgJH
   X6IuxZy6rocbr6maDq6DXK2GdtEG7eZFTQvWcwa9tqe+tm3U8dSvp6AWd
   VtrB22+SE327zmPrB8udRGLLbOQwBniulpkJ6sBjUJcJa5+4Z0HLL1PNp
   sEhkmOm3tst7ooqOjq576zjEIyTc+sQ+y4lErxAQ9Ka2cmxErZyuvvUbS
   g==;
X-CSE-ConnectionGUID: PPyEYM6NQiKKwC1Fb39obg==
X-CSE-MsgGUID: Cy7uvAXoRIewWCvOqmxcFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52716696"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52716696"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:54 -0700
X-CSE-ConnectionGUID: cgBgISUdRRuJa9qjHR5rNg==
X-CSE-MsgGUID: HvzCHAByRuKlV5gYZCcUFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150640662"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:52 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9101F1203E9;
	Thu, 19 Jun 2025 11:15:46 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSAR0-006doo-1p;
	Thu, 19 Jun 2025 11:15:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com,
	tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH 06/13] media: v4l2-subdev: Mark both streams of a route enabled
Date: Thu, 19 Jun 2025 11:15:39 +0300
Message-Id: <20250619081546.1582969-7-sakari.ailus@linux.intel.com>
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

Streams are stored in sink-source pairs in sub-device state. When a stream
was marked enabled (or disabled), only the state of one end of the stream
was modified, leaving the stream in an incoherent state. Mark both ends of
the stream enabled (or disabled).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 60b8febd3339..5afdd9d548b5 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2254,9 +2254,11 @@ static void v4l2_subdev_set_streams_enabled(struct v4l2_subdev *sd,
 	for (unsigned int i = 0; i < state->stream_configs.num_configs; ++i) {
 		struct v4l2_subdev_stream_config *cfg =
 			&state->stream_configs.configs[i];
+		struct v4l2_subdev_stream_config *cfg2 =
+			&state->stream_configs.configs[i ^ 1U];
 
 		if (cfg->pad == pad && (streams_mask & BIT_ULL(cfg->stream)))
-			cfg->enabled = enabled;
+			cfg->enabled = cfg2->enabled = enabled;
 	}
 }
 
-- 
2.39.5


