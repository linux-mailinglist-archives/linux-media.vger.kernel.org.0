Return-Path: <linux-media+bounces-11555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CAA8C7653
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 14:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE828285AC1
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 12:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC541465B8;
	Thu, 16 May 2024 12:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjcXRBNO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFE31465AF
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715862350; cv=none; b=j0C8MXJtUi7AVJKcTy+xJQHctHDG+VeZr2XKCG1+ToW1fHrRGjTIyfLrtH7EOdj3Y60eFisgANM/a4O7QOIE/t9knKVFfbIILhQ2EAT/GHm6IovkWNVqNIdBaNOLhi/6ccQxvmd4mpatejTTGzVTjAYmZTtH+hprhg34gn5MJYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715862350; c=relaxed/simple;
	bh=Ju6xGaKV78HqFmzw9VxE/wG8MX2cO5OMSEQGa+MWeh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T+M9s7bY9vH5ICZwAtH/SP7eNdl5RnZ46gMxpqv5igxUdtcsaW/fKuiN3C0FpXF1a5RyMYTXeS1Se8Rfa5w+ahE4x7DMdqZNGeqhX8iMDWrssPA1UwPyFaP0UToECCRr/K68RAuBb/rgLVplR+oHm1w1B0XrFnr7N59SscwhHFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjcXRBNO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715862349; x=1747398349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ju6xGaKV78HqFmzw9VxE/wG8MX2cO5OMSEQGa+MWeh8=;
  b=MjcXRBNOEaE9Q5YrER1N1lKYsXFbD1r0RKbuqE2U9nFwa9o/pHDLKF/I
   oh6XEd32e1TfbC1Kbab4gll+Y2r5Fd66DqtGa/t2J8P2KrllWbwAeb111
   cKuyHXFGjSmXlT0Mzvro61BN2xhoD/OE4SAbc43wz01z9DIXM5Y+Q7urq
   ZeTQ+N6A9nSPuwQ1cwT5sHh3fZRXFN/zofgK2jmIGS3OJ+Huw5i5z50Ka
   +i7OpO+lq1O0aVZsOkZFbrbJ9llyunBndAIcbyisy66mO2CnSfAcG+8zM
   Nmjx0qzWG/vvLklA1PziINdqHKUIpFINTFjy/bn4+aexE2R10YF9Hw1Ib
   Q==;
X-CSE-ConnectionGUID: HjShEs5RSZyAPQ3WiS4ElA==
X-CSE-MsgGUID: UQBZCx2oTq2yHyWe2YrpXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="37345825"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="37345825"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 05:25:47 -0700
X-CSE-ConnectionGUID: 7m9VI2JXTlKeqm3DFFRLEg==
X-CSE-MsgGUID: PySK9fDvRLyEmIBqTCaaMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="36290272"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 05:25:46 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BDCCA120D2E;
	Thu, 16 May 2024 15:25:42 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v6 3/4] media: Documentation: Update link frequency driver documentation
Date: Thu, 16 May 2024 15:25:38 +0300
Message-Id: <20240516122539.30787-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516122539.30787-1-sakari.ailus@linux.intel.com>
References: <20240516122539.30787-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the get_mbus_config() as the means for conveying the link frequency
towards the receiver drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/tx-rx.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index 29d66a47b56e..eaf3d597fa1d 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -49,6 +49,10 @@ Link frequency
 The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
 receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
 
+On devices where the link frequency isn't configurable, the link_freq field of
+struct v4l2_mbus_config is recommended over controls for conveying the link
+frequency to the downstream driver in the pipeline.
+
 ``.s_stream()`` callback
 ^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.39.2


