Return-Path: <linux-media+bounces-49723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E75CE9BE2
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BB75E300646D
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1807521D3CA;
	Tue, 30 Dec 2025 13:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngMJoKar"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF70321ABBB
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100215; cv=none; b=WKb+0SwSqR1EZx+bCDp4+zBcPzj/KSDzfTh5RwgOrLpbz8Z0E7qDeQXenucnvDBJUtkkPhXQQvNcum5gmGmgOT/zFcUKpw3l+re3sM34c4vSng+DgqxxKU0nooyGYxNbpM+gS9ORF0NBZTQqMTcV71Wjl5ZzSgeaoxLSSFkrWEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100215; c=relaxed/simple;
	bh=Qsf4FmhfrBqw7Ud54SATCTlC1Kip615karTi6tM3FcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rPg3mq9nnJfuSVlekOb3Ip1TZNmYA5vQfUjsUqGCMR1yZMGDpFc+2kHGbzP8Enknap8wYKUkK8NcMJ5OkHZeAsiiNFcvVGS7MAABIrMbhmrk22wZg1WzEgiO8azakDm6Mes7QKQnbTLnvQgS5UbbFnmZF6+LbgkVQ5JbpBc1yT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngMJoKar; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767100214; x=1798636214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qsf4FmhfrBqw7Ud54SATCTlC1Kip615karTi6tM3FcY=;
  b=ngMJoKar6VwXeCsYqEKFJUvE45U9Siv1uj+2QccBKjAStc7Rn1Mx+V6y
   OrWHq/mJLT0QItC02BoYng8sUgqSjqxqOPIBQokNp32Lz3pvgn9Wl9paW
   FOKtAiR/FaEVOVgxbvfwg3lnoV7Pn6R8MkG+fho2NIzQ3Ry2+rnTHmOb2
   tS3/EakSecqeGOUIgQ/23oA+nhM3AHKxrjFrP/nCd+vo1OH2EGb+hICjE
   POqeFhUUxoboQWEuHNrqzia7jGw5P1rCHWGKlrnXkYOK+CjSGEtUgpBiI
   nWn6gyedLlrtMDIBviZcAkPDvkJ0KL9CH20fOsjIdNDBfldgg1Z9ZAMr3
   g==;
X-CSE-ConnectionGUID: 20puu8MuRyiXEQ38UDDLlw==
X-CSE-MsgGUID: Ofq5UOEDSVWfFBb6TM4tkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="72309256"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="72309256"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:12 -0800
X-CSE-ConnectionGUID: oPi23M5UTwi/RLMx7FUQDA==
X-CSE-MsgGUID: M9Kv5LfoSROV5J2xGUqkQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="231882145"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:10 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 97C6C121DC0;
	Tue, 30 Dec 2025 15:10:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaZUL-00000000Jc3-1JOq;
	Tue, 30 Dec 2025 15:10:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 05/13] media: ipu6: Remove redundant streaming start via buffer queueing
Date: Tue, 30 Dec 2025 15:10:05 +0200
Message-ID: <20251230131013.75338-6-sakari.ailus@linux.intel.com>
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

The videobuf2 framework will ensure buffers are queued before streaming is
started. Remove support for starting starting streaming via the
buf_queue() callback.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 8f05987cdb4e..fdf41b3cf60e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -408,13 +408,6 @@ static void buf_queue(struct vb2_buffer *vb)
 	ipu6_isys_buf_to_fw_frame_buf(buf, stream, &bl);
 	ipu6_fw_isys_dump_frame_buff_set(dev, buf, stream->nr_output_pins);
 
-	if (!stream->streaming) {
-		ret = ipu6_isys_stream_start(av, &bl, true);
-		if (ret)
-			dev_err(dev, "stream start failed.\n");
-		goto out;
-	}
-
 	/*
 	 * We must queue the buffers in the buffer list to the
 	 * appropriate video buffer queues BEFORE passing them to the
-- 
2.47.3


