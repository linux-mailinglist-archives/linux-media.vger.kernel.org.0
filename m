Return-Path: <linux-media+bounces-49150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 306D5CCF3F8
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 11:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFE2F303BE32
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 09:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEFD2F6596;
	Fri, 19 Dec 2025 09:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9p3+CMB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258102F6598
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138324; cv=none; b=L1rTxjUAoQTYWMls35YCr8hCAgMYCv4J8vXkAOqUpqPX99Cg2Mrtmw7gRtPkpla9LQtqd+eQe2aCXAyLS1KrPpvtBMkTcMjfTdvCCatizOVi9MInHd/O061jOCiGWjcdzhPDs/8kvjnaLjbYnzg0iAiBdI5VJrY1AXB4UVCmBAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138324; c=relaxed/simple;
	bh=5TRWKWnhnJMUSvXil3T1pG4Lut16CV1p6a06TfODImo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UNTGANCKKu5Ox7vAI/DqHkYZ7i+5i+9bdj70fBJiOPuNHau6dr4lFL+HMcHpqqqPUvTntjz9dJUtrkYomtalbpVpPP7H7xys1olUxKKMKi+8bTtsACVn6HLGVxwz+CrMpGF/+UhGk+cNDloy6w7cWFtnnveRTfBntQt0P3sNccw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9p3+CMB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766138323; x=1797674323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5TRWKWnhnJMUSvXil3T1pG4Lut16CV1p6a06TfODImo=;
  b=m9p3+CMB47+MBsWYFKp/UQycAU7oDwxhsXZ8oX8qLVT9XmPo68AF9wdQ
   mxvlkav0w9NKoNESMoqxjpPNllRAN7t4d8kIjefIA/uzIsQPLPMMH1txQ
   RQYrFmlHSQPZBR/0y0PEQ16kjsEvBbq/Czd//epPnmB3iKM/8NLofU7vo
   TlPBB6MsMjP49qerRW7ZyEXU2U5chdgPrTwvA1a5e8r7TUiQZv3NPvCwH
   maIiSJoDqmevwdWT7IFKKR/eBty59goSpK369w+pEKPBOk6MEfWpfqiPA
   rplG7sJXX0rfOKPSqzOHVWv5E+JIbWu5zHv0rAe3U3tww2SpOT4XDmsa2
   A==;
X-CSE-ConnectionGUID: YyKfSgmTSzGtRAfudJowZg==
X-CSE-MsgGUID: btZCGjvYTT2p20Nv1VUU3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71945165"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="71945165"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:37 -0800
X-CSE-ConnectionGUID: MG/6iW4kT5SblJ2A3bhZuQ==
X-CSE-MsgGUID: Ya59eDjrRZaVIHCjJ/pL/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="197973396"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.226])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:36 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1D06D121DBD;
	Fri, 19 Dec 2025 11:58:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vWXFl-0000000BsSL-3Q9G;
	Fri, 19 Dec 2025 11:58:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH 13/13] media: ipu6: Always call video_device_pipeline_alloc_start()
Date: Fri, 19 Dec 2025 11:58:29 +0200
Message-ID: <20251219095829.2830843-14-sakari.ailus@linux.intel.com>
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

Even if a video device is part of a pipeline already,
video_device_pipeline_alloc_start() handles that case gracefully. Don't
explicitly differentiate between video_device_pipeline_start() and
video_device_pipeline_alloc_start() based on the existence of a pipeline.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index c7f9f888c46d..5312dc97906c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -1217,11 +1217,7 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
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


