Return-Path: <linux-media+bounces-50205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 792AFD019C0
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 09:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B6983002D32
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 08:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA9A3816EA;
	Thu,  8 Jan 2026 08:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZGAE0Atm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1895325711
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860263; cv=none; b=Sv5aCWpGwlpq9Ldwb01o/s3O1cOuCkc5HKFYGKp63rEkobeXSF6BFyhuGKukqNAGuGTTeaRfFJJOp3lOKZxYWZ7kXRyBj+P462GONoGLhjwZJ4nsCGglbepEWVN+j4SuZPaURtSGGRSdr28JA4GyDAWUKi3a8fiJzMbsFxYoDv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860263; c=relaxed/simple;
	bh=G66QwJkfoMtzH3/nJ/rijFtgJ/RNkpoKBdFfUTJSXP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g9GApYshpZKZpCoHCKpt0HkbUdzGD5IoSfttYbpMTXtyBnsdsdsVgrl5YWiZwiHnxG/wA0vLFJxL+O0oa3N5v80eN4yTLdUDABVENUNnSy06gg924hirbUkpBiZ5NTOXDvdi7BfoMr3TNpeb49yZR34lPKAf7JuJN0Eo9zcT2oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZGAE0Atm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860256; x=1799396256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G66QwJkfoMtzH3/nJ/rijFtgJ/RNkpoKBdFfUTJSXP8=;
  b=ZGAE0AtmGIhoSfjTG97TDg+nMJxkfqVUnYFc/TTxDUfTU8qxvPk3YYvJ
   UKx0HHbNWvCQEas8NVUf2uyeE/GNPEYbpLGHojfuUP9F0MINcQ35JJSTO
   EsO0vQJ5UtroWd9MS77KvBTZg6vOtj9PFYo2ixGjiQr5/SRHvWsjfIIC8
   lDil4JfNVJeJK5KaUgRFvTBKw4nA2PezudsjwcGiITo4ZjoF2Twmkhr5/
   vlPEIc4BC6nFi7InigMywO6FpJI12hYl9YFsr104TZoxCRWhg96g2rzOw
   YVDyEgk/mqo3PaARjeje1KrFSadJ6NKF0hyt53VFz/vdPHNx5w8iWEicU
   Q==;
X-CSE-ConnectionGUID: zBJhS7I9SCu0D998vNPKtg==
X-CSE-MsgGUID: 5vDN2N9uSYOW9wPImIf99Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72869937"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="72869937"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:06 -0800
X-CSE-ConnectionGUID: BZ7i/AxFRImhH1nHdz5M9A==
X-CSE-MsgGUID: scn+2JPSSk2QNh3sZfORCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="233842984"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.211])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:05 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8CF29121EA8;
	Thu, 08 Jan 2026 10:17:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vdlCi-00000002HT8-18am;
	Thu, 08 Jan 2026 10:17:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 14/14] media: ipu6: Always call video_device_pipeline_alloc_start()
Date: Thu,  8 Jan 2026 10:17:11 +0200
Message-ID: <20260108081712.543704-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
References: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even if a video device is part of a pipeline already,
video_device_pipeline_alloc_start() handles that case gracefully. Don't
explicitly differentiate between video_device_pipeline_start() and
video_device_pipeline_alloc_start() based on the existence of a pipeline.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 1 -
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 7 +------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index c862de31af9c..fabaed63df0c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -427,7 +427,6 @@ static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
 		media_pad_remote_pad_first(av->vdev.entity.pads);
 	struct v4l2_subdev *sd;
 	u32 r_stream, code;
-	int ret;
 
 	if (!remote_pad)
 		return -ENOTCONN;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index e9dab8a709ef..3ac48d2076da 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -1176,7 +1176,6 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 	struct v4l2_subdev *remote_sd =
 		media_entity_to_v4l2_subdev(remote_pad->entity);
 	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(remote_sd);
-	struct media_pipeline *pipeline;
 	int ret = -EINVAL;
 
 	*nr_queues = 0;
@@ -1216,11 +1215,7 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 		return ret;
 	}
 
-	pipeline = media_entity_pipeline(&av->vdev.entity);
-	if (!pipeline)
-		ret = video_device_pipeline_alloc_start(&av->vdev);
-	else
-		ret = video_device_pipeline_start(&av->vdev, pipeline);
+	ret = video_device_pipeline_alloc_start(&av->vdev);
 	if (ret < 0) {
 		dev_dbg(dev, "media pipeline start failed\n");
 		return ret;
-- 
2.47.3


