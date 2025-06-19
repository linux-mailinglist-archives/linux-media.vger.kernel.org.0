Return-Path: <linux-media+bounces-35234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C25CADFF88
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DAF617B4D4
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 08:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7162641F3;
	Thu, 19 Jun 2025 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTSadFCj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAEF2472AB
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 08:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320956; cv=none; b=k7+Rq2vsD0qqO58AT7Rr2zguL4vYhwozgxr9TFGqEZW85Z/Dq5g7Un7soMzhi3BJOWLQYMP1t5b6eec1HzBM/zpWMPkXMwzB+aocV1M2thMsszn53CBjqIH2XB3P8TTa+Nkr0WQLW4YhnynFKjpHlbBBd2yvv9Xe3JAVnRB+3R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320956; c=relaxed/simple;
	bh=Hm3wI+FYfUIpUieZY6WZkR6JAgcvIHge9IOCCT19v7g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AiOHob9R234PbqEfLP3f/46uOTCrNE6XRCYhUCx+A4nGBM0zXaHxGNMesR3zbyHoTBUMnKkdjt+gA9byiCPtHwhGq7YoRQTeuWf/xq88VB0fot4hYlppXKCzEnbAx+pUbPTKovSfbbFGnt9w3WSQFoy4RhcaliJ/GavxJfWoC/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTSadFCj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750320955; x=1781856955;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hm3wI+FYfUIpUieZY6WZkR6JAgcvIHge9IOCCT19v7g=;
  b=LTSadFCjPXCnsfsrU4Kj4co3MuURtl662J89f7qg0tEfJbPaAANgNPxK
   xI75ofSrNxWxgKqD3jZcumCC66/Cr/0kI6Vw/n5MmkSG4O+8zJyz3ojcb
   w3QHBMmHxytI6fkjVRLmNncLP7kzfTouc7T+RJxDxcQArixj9N3fvHtRq
   RcWeS5Qq1E93bhIRcqPaR1o2NwHLRTSAx08dxT2Xmr4uHYlZ+oyCviAko
   3fehwpa8rIPszW6Ydy6ebdOqluoCZkCyske1B+dS32RKU90lzapLhl7yn
   3eBG4Ue/YEu56igzehUW4v+a+w/avsYgjnPPBKl7DQ262bwa5ZpHM5iIt
   g==;
X-CSE-ConnectionGUID: Rh9EwRstRnapTHBN6X73VQ==
X-CSE-MsgGUID: vQs1Qcj9TXur/eG50qIzdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52716686"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52716686"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:54 -0700
X-CSE-ConnectionGUID: OF6mqRWJTUWccjMnJN3Uhw==
X-CSE-MsgGUID: OXKl75+SRLmWk5ep+JdV2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150640654"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:52 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8E8E61203D4;
	Thu, 19 Jun 2025 11:15:46 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSAR0-006doh-1n;
	Thu, 19 Jun 2025 11:15:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com,
	tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH 05/13] media: v4l: Make media_entity_to_video_device() NULL-safe
Date: Thu, 19 Jun 2025 11:15:38 +0300
Message-Id: <20250619081546.1582969-6-sakari.ailus@linux.intel.com>
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

Make media_entity_to_video_device(NULL) return NULL, instead of an invalid
pointer value.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-dev.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 1b6222fab24e..069c2f14b473 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -313,10 +313,16 @@ struct video_device {
  * media_entity_to_video_device - Returns a &struct video_device from
  *	the &struct media_entity embedded on it.
  *
- * @__entity: pointer to &struct media_entity
- */
-#define media_entity_to_video_device(__entity) \
-	container_of(__entity, struct video_device, entity)
+ * @__entity: pointer to &struct media_entity, may be NULL
+ */
+#define media_entity_to_video_device(__entity)				\
+	({								\
+		typeof (__entity) __me_to_vdev_ent = __entity;		\
+									\
+		__me_to_vdev_ent ? container_of(__me_to_vdev_ent,	\
+						struct video_device, entity) : \
+			NULL;						\
+	})
 
 /**
  * to_video_device - Returns a &struct video_device from the
-- 
2.39.5


