Return-Path: <linux-media+bounces-49145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BB5CCF3E3
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 10:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B45423038694
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 09:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C710F2F5A29;
	Fri, 19 Dec 2025 09:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4UbCddB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D67F2F49EC
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 09:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138321; cv=none; b=uIAzgrh9igui2q8lGo88ENlRUaYbYp85vRPMhubIp7GUKFyiILea9epLWtLrMwJX5X5LWtN/pWhPwzNztczOnpaXNETI9IPGC/7djmqMn7OhXup6MDZS8q6u83gbevApEG3yl2bzHG9KPl4RC2FB1vViCfxcs+iYYHmkX1hUjm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138321; c=relaxed/simple;
	bh=hiXOv+a298U6PB4qaWZUNE+2c2NsLnFUImG695+hPJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b5QDc3E8hy5uhBrdB+dfm9w0sYmOnJIQVr5s6abxbdKJ3P3ZWQtx+DEOxZ1ZbI3HEPwcgeybdQgKcwj7v4TDtmHaa6mJ+7/LygfoBHsI0ZpN9mqEatmEw8nXn3lfKjnNzF4fGecHQFx3aXch0UnQxRSu2vV/XuNUUkqevRK7sz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4UbCddB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766138319; x=1797674319;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hiXOv+a298U6PB4qaWZUNE+2c2NsLnFUImG695+hPJU=;
  b=M4UbCddBZHxWD8r8yytdB2IZMeNxjX1n1GFF5+s+HTq5o3tRH1mtw5Rx
   sHxnCxdXTVRGI0PRcTKZHjls7TKporNskdOb9DkwM51/pcC8poRDgQO1T
   YLMk87gcF7FlhtsxPPSP6GPzyhmpbpgYphWDSPooe4Iy4En0wQ3zPVevh
   dMBvqYoqfXhZGiIiheRbOonoHjDO6reMC9udzLsnCoNBd5/0rZHt6YmV4
   og1U+CAst6DxODdTC9J84NE8CNf/Nx+mU810MiWSqsV1h7Cnfm7i1umg3
   XFqwAdUtWm+8uuEvGXR129Bj5e1GuHfY2VZYXoJcM8NMws1ndGbFAOIB1
   A==;
X-CSE-ConnectionGUID: VJFY/81ATGaXSooj+gstVQ==
X-CSE-MsgGUID: LYZcoFWzT3CVX1uck1QeMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71945161"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="71945161"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:37 -0800
X-CSE-ConnectionGUID: sXzcB6gaQHSTL2VApU3NAA==
X-CSE-MsgGUID: A5mMc+WbSX60Yh6Ss9VAcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="197973388"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.226])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:36 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 094EC121DAA;
	Fri, 19 Dec 2025 11:58:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vWXFl-0000000BsRk-2zWL;
	Fri, 19 Dec 2025 11:58:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH 06/13] media: ipu6: Don't check pipeline in stream_start
Date: Fri, 19 Dec 2025 11:58:22 +0200
Message-ID: <20251219095829.2830843-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
References: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A pipeline exists when start_streaming has returned so the check for
start_streaming_called is equivalent to having media_pipeline. Use
vb2_start_streaming_called() to perform the check.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index fdf41b3cf60e..dcad6aafee29 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -355,8 +355,6 @@ static void buf_queue(struct vb2_buffer *vb)
 		vb2_buffer_to_ipu6_isys_video_buffer(vvb);
 	struct ipu6_isys_buffer *ib = &ivb->ib;
 	struct device *dev = &av->isys->adev->auxdev.dev;
-	struct media_pipeline *media_pipe =
-		media_entity_pipeline(&av->vdev.entity);
 	struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
 	struct ipu6_isys_stream *stream = av->stream;
 	struct ipu6_isys_buffer_list bl;
@@ -374,8 +372,8 @@ static void buf_queue(struct vb2_buffer *vb)
 	list_add(&ib->head, &aq->incoming);
 	spin_unlock_irqrestore(&aq->lock, flags);
 
-	if (!media_pipe || !vb->vb2_queue->start_streaming_called) {
-		dev_dbg(dev, "media pipeline is not ready for %s\n",
+	if (!vb2_start_streaming_called(vb->vb2_queue)) {
+		dev_dbg(dev, "start_streaming hasn't been called yet on %s\n",
 			av->vdev.name);
 		return;
 	}
-- 
2.47.3


