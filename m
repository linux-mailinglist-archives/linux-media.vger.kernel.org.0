Return-Path: <linux-media+bounces-23574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 273CC9F4A4B
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 12:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42D257A52BB
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 11:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53811EE021;
	Tue, 17 Dec 2024 11:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ss5q3l/O"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697701B85C9
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 11:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734436173; cv=none; b=uveY7nrpT4Tyv65qMluhbPK00RuipOZXrGkgrpEZ4O9IJTHZOIgcuvsYOKlnhzSNL+EaabHFo1bABjkb/QzYMdwrH844EQYwSVhjh8vR1uEAFzF64aGfvS7cneWo1iJqwfK9zrZUrKLFmFr3mgcRLndJUCqpGVZPrPYD0jq/SXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734436173; c=relaxed/simple;
	bh=b2ST+a89W0uRyUDETQ7uC1hh/QupNNAufeZIFP7MWSs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=PzGSQYbKySUQI2kWjfurUXCr0W3uaYZrxUxEdR5LUK/0awYqgTzPm3o7fb0fjc97/QheKZPoBosrRBhT0vbf07hdf0xQ8hlqnF3lemaIgTtZmwSdZZKptGbxb9Irmc6cU6xUEeyn2cIDVQ5vJnqnSso8WNbPRsZTwX+Nj+qHZL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ss5q3l/O; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734436172; x=1765972172;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=b2ST+a89W0uRyUDETQ7uC1hh/QupNNAufeZIFP7MWSs=;
  b=Ss5q3l/O0nBuIpmJHFMpfRnwgZnOfHMdiDjjvAEh3obWCn7vWf/zbrsI
   z5R4U/9fashkRh6aEGMBri1YgDMKaOd1bEDTW2tc9RWE3gY930u9Y7opU
   iTTXWHlSWZmS8LSGklAyzbkDFMWOm8GwOJVRmnKIRKDM1LnluzX/dH9BL
   s7O339ZZaO0fSy3ek+my61zZ/U+3GAeI5Kn2EYEpx58QU5sFSPk6+ePqj
   VsC68Ntkq/oNfvq8sAOVRW/PjP4G+ZaWrKnynmwq2YT13JujVU/DDbWJg
   NyyC3yzGUVtObXQU4aj8BdeJcW5t7NONVkgP+AdS11jOZN3yBjb114g+U
   A==;
X-CSE-ConnectionGUID: hEniLdBFQWevSscEiuKjRA==
X-CSE-MsgGUID: yZ4RpadmQViw1n8iPAnvgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45864441"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45864441"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 03:49:32 -0800
X-CSE-ConnectionGUID: fRz9avKHRkmkzLHe3sL+6A==
X-CSE-MsgGUID: MNS7rcMzQdu4E9Epc7TeXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="102602553"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 03:49:30 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 703C211F775
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 13:49:27 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tNW4t-00A8lJ-1G
	for linux-media@vger.kernel.org;
	Tue, 17 Dec 2024 13:49:27 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH v2 1/1] media: Documentation: tx-rx: Fix formatting
Date: Tue, 17 Dec 2024 13:49:17 +0200
Message-Id: <20241217114917.2416953-1-sakari.ailus@linux.intel.com>
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

Fixes: 30fe661eb9d3 ("media: Documentation: Deprecate s_stream video op, update docs")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v1:

- Correct the Fixes: tag.

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
-- 
2.39.5


