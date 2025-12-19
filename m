Return-Path: <linux-media+bounces-49153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A3FCCF3FE
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 11:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D71CF3077E60
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 09:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B08A2F5A25;
	Fri, 19 Dec 2025 09:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFQMDPiL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162642F5A34
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 09:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138326; cv=none; b=V+J/V9sa8g/040wqgHNCR8pz8GGAEInrh4RztcvxCPVcMZxaRdfFWr7khnqlUpAfPwoGfP+2y4jW8GCw+RWzne0Gb1viULyK0T6UY3X0Olz+Sl9vX5p4gV1wXe8ppubDzAxZPINBTW4Ut39ohardiZO6XAx4KR8Lh/vWjQRLQY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138326; c=relaxed/simple;
	bh=pD1g9JInowwJf/6NrkvPezo4SgC1xn46O+yQKgqfBuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AHGHmwMZknfq3boDek8k4398WauQX8qpJx+SsehRhwHyGKZaYokU3neD812a7DGlZ2sVYV7rS0K5J27l+CdsdKbOq7Gsa5AOxzIBg9JX5aRDN53N8x6Nwvy9lfeO/S9b9Er8I2JED65lYHdFnA8AkqGXYnj02LuWQxwY0V88Pwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFQMDPiL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766138325; x=1797674325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pD1g9JInowwJf/6NrkvPezo4SgC1xn46O+yQKgqfBuo=;
  b=NFQMDPiLiGC22QYgQ49PmpuqUg2oH+XlQg/NutX0QsgrmfH+K+rXL1sp
   DctmlKqkk01+KweveuZukpRhqJwVJB9PKyh7690ldiBjfhEZCFX9K9ts1
   quH/EY69Ii2QYfbDrVN8B3rxExI1MCVMUeU2VTu97SjvtpSNGL0EM5eSC
   k+IGua4dIhmj0AiAyLiv00olbDMFc+uAsYx/xSScDVYCBZwgGfxnsWVcy
   jyadJstMjseekRb+MJWfIs0zwZIOHrBkoFBY+Mdkn5VLb9f320Wiy8oGU
   LDu+WDqA22AQ4mDBtHwtcQ+def8hJXSEVgwHr3md3sj/qAqgqmtKwdF6L
   w==;
X-CSE-ConnectionGUID: 6u6gS3ICSAeJaMNLxmHtnw==
X-CSE-MsgGUID: SvPSIjmzSqmOYwF7N0+SyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71945168"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="71945168"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:38 -0800
X-CSE-ConnectionGUID: kO4PmeSdTfmNocULJsSzeg==
X-CSE-MsgGUID: rBMI0gCdT5O5m/zfkTO1dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="197973402"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.226])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:37 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0F38C121DAF;
	Fri, 19 Dec 2025 11:58:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vWXFl-0000000BsRv-39pY;
	Fri, 19 Dec 2025 11:58:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH 08/13] media: ipu6: Drop error argument from ipu6_isys_stream_start()
Date: Fri, 19 Dec 2025 11:58:24 +0200
Message-ID: <20251219095829.2830843-9-sakari.ailus@linux.intel.com>
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

error argument for ipu6_isys_stream_start() is always false, remove the
argument.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index dcad6aafee29..db533d45d994 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -290,7 +290,7 @@ ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
 
 /* Start streaming for real. The buffer list must be available. */
 static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
-				  struct ipu6_isys_buffer_list *bl, bool error)
+				  struct ipu6_isys_buffer_list *bl)
 {
 	struct ipu6_isys_stream *stream = av->stream;
 	struct device *dev = &stream->isys->adev->auxdev.dev;
@@ -336,10 +336,7 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 out_requeue:
 	if (bl && bl->nbufs)
 		ipu6_isys_buffer_list_queue(bl,
-					    IPU6_ISYS_BUFFER_LIST_FL_INCOMING |
-					    (error ?
-					    IPU6_ISYS_BUFFER_LIST_FL_SET_STATE :
-					     0), error ? VB2_BUF_STATE_ERROR :
+					    IPU6_ISYS_BUFFER_LIST_FL_INCOMING,
 					    VB2_BUF_STATE_QUEUED);
 	flush_firmware_streamon_fail(stream);
 
@@ -590,7 +587,7 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 		goto out;
 	}
 
-	ret = ipu6_isys_stream_start(av, bl, false);
+	ret = ipu6_isys_stream_start(av, bl);
 	if (ret)
 		goto out_stream_start;
 
-- 
2.47.3


