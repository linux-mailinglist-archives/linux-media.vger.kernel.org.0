Return-Path: <linux-media+bounces-49725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DADACE9C00
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C5D830388A7
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C213121C160;
	Tue, 30 Dec 2025 13:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VxW6GiI2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F412B217F2E
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 13:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100218; cv=none; b=M8+PMFmZEytlIqXtUv50vUZ1AHRKseewT44OqpXDfEmA0LW/TPsjiiSJI0CgzDxSU22oJkWEtemV1oTPM7fYxBVFf1XEjdW9/5YXoXaF7WTwsaugtl8cf1XqAftrOrY6g2iCmiC8yAplXXQ1ILhZNSz3SYW9aX+H3KL9yNazw/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100218; c=relaxed/simple;
	bh=FqMRHSfQenk6hO30f5hru5DkeFH+mbarcv3hMgYjNNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tlghz04KHhn9bk4OQy3USDvaQHa0jU52n73tCARR1YkOKGG9guA2cWrV0JVHGco1ncAVfqaxsG8JYRAIoOUbVHRbpiIQuocdIZJZPTQPDk1Bs5BbZrXPaul1zsMZ1KfhnHMNZ7lD/xj2qWE5ld1pQDvL/StQIUmdg8lN4F0Yvoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VxW6GiI2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767100216; x=1798636216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FqMRHSfQenk6hO30f5hru5DkeFH+mbarcv3hMgYjNNQ=;
  b=VxW6GiI2KQ1JYtvWugC/C6orHt6+1LzBjKf3zVmjwwIPGfsL1TZrkOjk
   R8gHiJSfQVuqSGVMWjgYy/kpcrtCYWCpm5O1p0jg9q6OZ5wdZODGMyzwI
   mrHRrYOMkjXFPPZ/C0gxd0xcx8FD0gP6w54r7DIXIABplDyYCWillijpG
   5SGg9IJ0Bq5E/TrW72poxtcj0WXubEHGhfLq4ZFb9Xt7WX5w8SCHv6+k1
   B/aPKmBVrsSzgV4MoqMClivrRyanqK3V8iTOuJ0ZOJOXAcTKf6SpXq2OK
   A9ZqVqYchHljuKUttSZ7wx8mKhItkwBAAy/AIlkNza6MidrGPgteggs/9
   Q==;
X-CSE-ConnectionGUID: /JzvnKaqRvu9IFGU6TbZ2Q==
X-CSE-MsgGUID: hvfJ449tR5ycMc+8s5fd1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="72309258"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="72309258"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:12 -0800
X-CSE-ConnectionGUID: vweNgcAuRxu3P410sDnF2w==
X-CSE-MsgGUID: xMQSJKPIRUqhp5EHw1P6Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="231882151"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:10 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B5219121E72;
	Tue, 30 Dec 2025 15:10:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaZUL-00000000Jcj-1l97;
	Tue, 30 Dec 2025 15:10:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 13/13] media: ipu6: Always call video_device_pipeline_alloc_start()
Date: Tue, 30 Dec 2025 15:10:13 +0200
Message-ID: <20251230131013.75338-14-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
References: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
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
index c7f9f888c46d..9da7ac85e02e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -1177,7 +1177,6 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 	struct v4l2_subdev *remote_sd =
 		media_entity_to_v4l2_subdev(remote_pad->entity);
 	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(remote_sd);
-	struct media_pipeline *pipeline;
 	int ret = -EINVAL;
 
 	*nr_queues = 0;
@@ -1217,11 +1216,7 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
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


