Return-Path: <linux-media+bounces-49709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 532CCCE979D
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 11:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58186303C9BB
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 10:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD83A2E1747;
	Tue, 30 Dec 2025 10:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pp2PzGIe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A772C08BA
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091947; cv=none; b=Zyapp/SgF1ZNy4/7Z9rAgQoSz8R0lpPOafWf8EHutFb7d2K55vrktZgX1l3G6xUYyaiGe4twTJ2yT+efOL7eCaTRau7Q4IdHfNvPBIHFqejAWwa2nHV+YXSyN74t2s2+wz9Y6VBoTFN4Tf/oJIkvb6uIEr9HMKTncdEq+uLMoLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091947; c=relaxed/simple;
	bh=FMHNrWrg3F5Ips6tVMIByUCyiBpY6ccs+0SLRtD4dBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQVCS6Um8xqGcQ4zJHmT/ND42jNmro93VxZjNoV7XcOaAsD8MIFww9ccKi3TpWLU0UooGh3EUZqTBNDIOeU7wI099lacq65sVPr17RNbedSS04p4BIfZcP8Pbg6RKtNlxak4TD2WLqI02DzFVoGVHrHt11aGZYhwqoVn7G/LFkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pp2PzGIe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767091945; x=1798627945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FMHNrWrg3F5Ips6tVMIByUCyiBpY6ccs+0SLRtD4dBs=;
  b=Pp2PzGIeZzfPSXV+eL4o4BQO55jPNW6c/p4udX4L8t7IWQHLrFHZIrZx
   V1CuiCm7uXOhydJ23PwJMzWJyFwqx40LFX9eOuTStiuHJTHUO7fG/1+H1
   W840M3nG3mzpZSQuC6JiW/B0EUC9zDiKhmQf7r4VNRLdODoXZLu5ux2GE
   /DXRFSHfg2pSsCzH58HW6/0hn92q/tguP9KwYg7fcReIQ/erb/mmJ8nn1
   RMZliZ7r1vZMkduboVJr8/59FN+nICnAnxipOdT/TAxM04YJvbCNAsc4M
   UZPfl4DrtlajWw8GXCHErjNipssae4YQRnSnjh1Ibq0lZ69ptCp5z62PW
   w==;
X-CSE-ConnectionGUID: cMvZbKoyRkexlUSc2iXBRA==
X-CSE-MsgGUID: udxfFtUXTKywKcZDssvG7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="94148730"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="94148730"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:21 -0800
X-CSE-ConnectionGUID: ydGkDifET3Wll7EU3UNdJw==
X-CSE-MsgGUID: 8Bu7s139RqC0qDZdyq5TRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="201186923"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:19 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9E3D6121E72;
	Tue, 30 Dec 2025 12:52:23 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaXKw-0000000FQYt-1RQT;
	Tue, 30 Dec 2025 12:52:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v2 13/13] media: ipu6: Always call video_device_pipeline_alloc_start()
Date: Tue, 30 Dec 2025 12:52:22 +0200
Message-ID: <20251230105222.3676928-14-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230105222.3676928-1-sakari.ailus@linux.intel.com>
References: <20251230105222.3676928-1-sakari.ailus@linux.intel.com>
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
index 622cd28f5cf8..72b92e7b2ae8 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -430,7 +430,6 @@ static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
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


