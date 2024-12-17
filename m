Return-Path: <linux-media+bounces-23546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4DA9F4507
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 08:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5854C188E41E
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 07:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C71189B83;
	Tue, 17 Dec 2024 07:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pv3nppsl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6E21E529
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 07:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734420292; cv=none; b=Ei2/5LjhoYH1RU6MRb1N9VtGYWaEoJkRh0QsxKoXl2PCT38dlhbfZtOt0uJLuhvi2IQDjokeMHhRKzLLWqxrzbmzXO9K6rjRyrC3uKPk40iheOOEdqP9X/jfBAdFILIaSCrbgBi9TD68wfcvwMRM8ibGrWM5l+uEcFMSNfXF/NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734420292; c=relaxed/simple;
	bh=aJ0rUkexgK26wNoc2VshVtHKI6k++3C/mIhm9u65mGo=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=ks9vN/ZOmDTSC92y2KLwvRs1WKV54nwuPLKMn25XcrFcEy2Yu7ijz54DgQa+7xrBsfYXCSeL2yFpQP6faOz72fTicFJPfE0lBmLTGIon0opIrYlFzpXzDCz80DctTBBfmiI1O4swVtP5HtmO4OyQaIaFhVZutPJBNi83wn4PGqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pv3nppsl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734420291; x=1765956291;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aJ0rUkexgK26wNoc2VshVtHKI6k++3C/mIhm9u65mGo=;
  b=Pv3nppsl5ktxpoTr+5VBS7C7iETBi/yNonbEaxz1w1X2ZBcrAWeaSHM3
   v0lcbNgeHURzWvk/zkGWL1Kzdgc7Pl+aMt3HByERi5nhwkXkyAguUL0LU
   LPZBeVWHD2sKmFZw59SnhMZ7vgAiewgp7W3tf5tzF9HHK0oeD8hwZv6+j
   fzm8fIKpwDpjFh1HLks4oeUUXVBvaiGK0APE6a9em95/ebeR1m36Wk/61
   8Scw69mh9wk+s7riLpZkap3o8RgiSZoXyyh8LhASeSyVa6wvdL9mtbwO7
   xsae9nrY3UarrmTDYakP2Vr5Wc1yXws7Hk8Y5eehDI/rLXU+13+GWcx62
   Q==;
X-CSE-ConnectionGUID: DgCB3TklTJG/G4fIIW5r+A==
X-CSE-MsgGUID: gjdwfc5gTfmEOU8SIOD8SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="57311034"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="57311034"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 23:24:49 -0800
X-CSE-ConnectionGUID: YAIvonPDSemN/0/26Kaf0A==
X-CSE-MsgGUID: Vca4vvueSS6yptc9ObAYAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="97688680"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 23:24:47 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D815C11F775
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 09:24:44 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: Documentation: tx-rx: Fix formatting
Date: Tue, 17 Dec 2024 09:24:44 +0200
Message-Id: <20241217072444.826388-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix formatting under "``.enable_streams()`` and ``.disable_streams()``
callbacks" in tx-rx.rst.

Fixes: 09fc4e3144c7 ("media: camif-core: Add check for clk_enable()")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/tx-rx.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index dd09484df1d3..b936065dd640 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -50,7 +50,7 @@ The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
 receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
 
 ``.enable_streams()`` and ``.disable_streams()`` callbacks
-^^^^^^^^^^^^^^^^^^^^^^^^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 The struct v4l2_subdev_pad_ops->enable_streams() and struct
 v4l2_subdev_pad_ops->disable_streams() callbacks are used by the receiver driver

base-commit: 1d7851618ef21b6152f041feb175204f5200a42c
-- 
2.39.5


