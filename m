Return-Path: <linux-media+bounces-20653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 410AD9B7C91
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 15:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E00601F2255A
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 14:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224DE84A52;
	Thu, 31 Oct 2024 14:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMMAByum"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8957C156CF
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 14:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730384283; cv=none; b=d2FB4OdEO4KhScr4DICQp6tLaE5MhZB+8VFJLJ12CadwftmzEznPY08Xf6v7vB4kbDdSE6kCk/YD/Y+7QDzGCSrPp+1dChsXuaBxNuSoFO5X7bOFyRsihcGD/KZr+0HhtmbkkhIJsyyQL7e1IclSZLHOYr/N5h8mtXfTIno4OHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730384283; c=relaxed/simple;
	bh=+hVZHx6J82t7J+R+oehHh68WaGSqmwLOcUFUjWcGqpo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V8lnrgxKjuh1BOWKxxoZH9JXRp8Qxh3+kHuyifaYEd7KFu0cByJupEMUY1KEskrjVmDWLAOX3ivioyPuGcNtSVJYenO5yj5C0t69HGEKTUQHXfBYJAvJPFg60vvhi9seMyfQwL6W+Icb1L8uitML1KZTkcQncqWEinNZos05oGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMMAByum; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730384282; x=1761920282;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+hVZHx6J82t7J+R+oehHh68WaGSqmwLOcUFUjWcGqpo=;
  b=YMMAByumqQaJhmKyex0fYc7RPWGgADi/jo0WsqyGQmzXmWyDDAnPeEVb
   65hhPw0FClgnQXRSAIOiTog9vpQfj2Fsc/b1zkptkyqmL1XY8zRurGBog
   QAMIvectrKp/dIr2TJPW7PPG1Wba91rhreVmdstYUUKUoeZp4i5ouXS0s
   6SwMSQeSy2HBHoI5RnSgbV6bpUriTv26bh2up4M1Bez1fF7vUAwygqNFe
   qXk3AMt8LXHNn67ppQfW7aR3/rCh6n7Q+etQjUa+fY7+jRKfElmcmWQzq
   xXczQ9dToRzXE4tXv30doVkd9E4RqYA638F0UB3vzw6F2573+J+1/TrCC
   w==;
X-CSE-ConnectionGUID: ajX/MlMAS0SRCVpi76YZ7w==
X-CSE-MsgGUID: 2oVcoFo8Se+MX/sc6pVeVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52681199"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52681199"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 07:18:02 -0700
X-CSE-ConnectionGUID: MvWKsOzlQWGGgZanm8m7WA==
X-CSE-MsgGUID: Ta4vxgMtTzmK4NJuqpyZiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="86561492"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 07:18:00 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A017F11FA28;
	Thu, 31 Oct 2024 16:17:57 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1t6Vzp-0001Dx-1q;
	Thu, 31 Oct 2024 16:17:57 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/1] media: mc: Rename pad as origin in __media_pipeline_start()
Date: Thu, 31 Oct 2024 16:17:47 +0200
Message-Id: <20241031141747.4697-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the pad field in __media_pipeline_start() to both better describe
what it is and avoid masking it during the loop.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-entity.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 96dd0f6ccd0d..0df9fc90cf33 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -768,10 +768,10 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
 	return ret;
 }
 
-__must_check int __media_pipeline_start(struct media_pad *pad,
+__must_check int __media_pipeline_start(struct media_pad *origin,
 					struct media_pipeline *pipe)
 {
-	struct media_device *mdev = pad->graph_obj.mdev;
+	struct media_device *mdev = origin->graph_obj.mdev;
 	struct media_pipeline_pad *err_ppad;
 	struct media_pipeline_pad *ppad;
 	int ret;
@@ -782,7 +782,7 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
 	 * If the pad is already part of a pipeline, that pipeline must be the
 	 * same as the pipe given to media_pipeline_start().
 	 */
-	if (WARN_ON(pad->pipe && pad->pipe != pipe))
+	if (WARN_ON(origin->pipe && origin->pipe != pipe))
 		return -EINVAL;
 
 	/*
@@ -799,7 +799,7 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
 	 * with media_pipeline_pad instances for each pad found during graph
 	 * walk.
 	 */
-	ret = media_pipeline_populate(pipe, pad);
+	ret = media_pipeline_populate(pipe, origin);
 	if (ret)
 		return ret;
 
-- 
2.39.5


