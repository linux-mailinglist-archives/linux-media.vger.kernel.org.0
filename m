Return-Path: <linux-media+bounces-11927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1C08CFE57
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 12:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91E34280E3C
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 10:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F63F13B597;
	Mon, 27 May 2024 10:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lK9EzY9q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E818026AFA
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 10:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716806943; cv=none; b=nXEg9xcyaxG5PLQJ9AdbGrf1J5nXKqrWQOndF6eEvBH1q4+2hLx9a/Az58Myr9z/P7VUm4/vQOYX9ObecZRF1CUBQbKDEM1d8vWMypMvvpS56/RjOBWiNqKj28vcHASJ1eHxmsRXrrJBNrNOK55e9g6VKqMqfoz6Kmt/90eEUSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716806943; c=relaxed/simple;
	bh=5s3gYpv2eKyW/HRWJfc6zDf1QfBvLiym5hB7s0s0/Wk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pXmuKcFy099UtE0Ot5iJpgSEFc1T7ZYXPTGVzQ1IZZ2cSN//lDGEHKFJBY01Q0veOVewM42fVjGm6GFdkCmyl9iZGBooaHeD7RWdP5OaoSQYOlNItUwU/pJANqMqVqpMXfsFfLOdIuYwxShy3i861N9NHTB4xzAg0Mkd3sBP/SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lK9EzY9q; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716806941; x=1748342941;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5s3gYpv2eKyW/HRWJfc6zDf1QfBvLiym5hB7s0s0/Wk=;
  b=lK9EzY9qKy2+cuP6gymwABtV0ZEDUUX3KWP2l2SOIUR1XJyV3re4Sqfy
   NfYupVpaxM2XL7pFBQcNxx9SGvE15M/oHVbWHjwtEfJPke4qK/ykmSpzX
   b2OcpqSKVQt5gyfPPhIWFuhJNCxJS8zEDtW21hilRparbU4VUhf96GMYH
   TrgEpZ7WI4twVkEiA2sePVpVinZeKkEpUqkoiDD1O5PQ3VwaSI2IvFap3
   dObYwJIfG6Exb6psAKysLiAbRk1GumrN2qa1m9vWy3nHr6EfDoAxLDvJz
   OwhQR9IE5bjeK85Ter45hr8Bb1DMdWj3KCYkJwNeb6N29a5bR7ue44Z+4
   w==;
X-CSE-ConnectionGUID: 4pbeBFRLQNSq9UYGEadIgQ==
X-CSE-MsgGUID: tRr6/8wZTWy69rA1SlaH+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="35638338"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="35638338"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 03:49:00 -0700
X-CSE-ConnectionGUID: IzHsLghwR+Oz82/TLA+Trg==
X-CSE-MsgGUID: k3QJfx1rR7+q30HfMPS/fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="34701104"
Received: from icg-hal3.bj.intel.com ([172.16.127.200])
  by fmviesa008.fm.intel.com with ESMTP; 27 May 2024 03:48:59 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: tian.shu.qiu@intel.com
Subject: [PATCH] media: intel/ipu6: fix the buffer flags caused by wrong parentheses
Date: Mon, 27 May 2024 18:48:57 +0800
Message-Id: <20240527104857.3853688-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

The buffer flags is set by wrong due to wrong parentheses, the
FL_INCOMING flag is never taken an account.
Fix it by wrapping the ternary conditional operation with parentheses.

Fixes: 3c1dfb5a69cf ("media: intel/ipu6: input system video nodes and buffer queues")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 40a8ebfcfce2..4bd4e324abc9 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -301,10 +301,10 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 out_requeue:
 	if (bl && bl->nbufs)
 		ipu6_isys_buffer_list_queue(bl,
-					    (IPU6_ISYS_BUFFER_LIST_FL_INCOMING |
-					     error) ?
+					    IPU6_ISYS_BUFFER_LIST_FL_INCOMING |
+					    (error ?
 					    IPU6_ISYS_BUFFER_LIST_FL_SET_STATE :
-					    0, error ? VB2_BUF_STATE_ERROR :
+					     0), error ? VB2_BUF_STATE_ERROR :
 					    VB2_BUF_STATE_QUEUED);
 	flush_firmware_streamon_fail(stream);
 
-- 
2.34.1


