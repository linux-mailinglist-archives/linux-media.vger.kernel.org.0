Return-Path: <linux-media+bounces-49704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F46CCE9779
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 11:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA5BE3018100
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 10:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F332C3256;
	Tue, 30 Dec 2025 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4AwhNKl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61182DD60E
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 10:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091944; cv=none; b=MviYPClz78dDRyVWsoPmDRjc4ZmVw1bEJDgbksMj/MtY3H5PrJinJclUu4kApIRy4vxGb8ggKZQOVuNFF1NkuLJXW1DsqQ/eqNGxK/cMyNhQ/u7JeVTfvP1ISGLn7kAKdConDyPGTHrA5PAdZPCWnPCWjycUEwIjJ2dFAG+I3k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091944; c=relaxed/simple;
	bh=+mMESgzzb6acfquzrDCuEr93M/7sArxV+C+fQ2QUuog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IcJh9t8STdZ19HtnRfAMN7VnsXpiVa6oqbcbpg3tHePAmFdNR6U71LtUciogriTGOYgIe4OqxVJNfvL0vKySyZXrcgBCukjFcX0YYksI5F6eq/j6lC7NAVA8VQLazm37Vfl2B4wvMIF6uykOdxBj1OgGolHkfU8iZ+UOHFr3ipg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4AwhNKl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767091943; x=1798627943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+mMESgzzb6acfquzrDCuEr93M/7sArxV+C+fQ2QUuog=;
  b=c4AwhNKliC3uAlfauXljKikWh0DtEV5HSyX5nSJJE4n46XM9Qra6MFIp
   6xxCaDJBg3bYCguX5mLUKhjuSgNq1nlXQUuh/MSyua813g4nRzCsWgFi0
   J7apXtQSxaV+FWHowhxUorHw/Rjb4ZAu3iO0krLswoi0SAQUBP+dO/qGV
   xxI+Ra2Md6Gfr2OZm8oTEPLUF3uCbJWWz6uA3KPkVXGdk7/5LbiY63WHM
   Ziy3xz50qeS6EBnh17G/EYFYEPxtvNqdGqBmzruAMgRuF2mxgBvqvFzid
   w6lR89WqOEZhYv/G+QUUDcd/TBpGClIydt10/enhPEhAGnJFMyGTIwf9p
   A==;
X-CSE-ConnectionGUID: G2zNtFLUTte/WnAHYOCHmg==
X-CSE-MsgGUID: DwhbEeCqTeC/OfCmtXRNyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="94148726"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="94148726"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:20 -0800
X-CSE-ConnectionGUID: DBX81yX0TYCvG4upHYE2aA==
X-CSE-MsgGUID: grjnns+QReOEZJaMChTRqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="201186915"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:19 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 83D04121DC0;
	Tue, 30 Dec 2025 12:52:23 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaXKw-0000000FQYD-0yY5;
	Tue, 30 Dec 2025 12:52:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v2 05/13] media: ipu6: Remove redundant streaming start via buffer queueing
Date: Tue, 30 Dec 2025 12:52:14 +0200
Message-ID: <20251230105222.3676928-6-sakari.ailus@linux.intel.com>
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

The videobuf2 framework will ensure buffers are queued before streaming is
started. Remove the support for starting streaming based on queued
buffers.

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


