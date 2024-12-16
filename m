Return-Path: <linux-media+bounces-23479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F08709F34D5
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 16:43:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B7C7188953C
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 15:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC4314D444;
	Mon, 16 Dec 2024 15:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZLu6yLF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ECB14600F
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 15:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734363751; cv=none; b=Ab7q7SAivvJRygifpqVBLo+HMsOBss2LKU0oqOuj9u3IfuXpJrBcn7U/IZH9D17VZwxl3F7fqUdjUaQ9K+VezNDbawXIn/whH60rWg1djc3zSpDBlnKnABqtNXg8flQJXjwOPmwui7O7PnDwz2Zw93u/s28EwV07wdvBbd/nCk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734363751; c=relaxed/simple;
	bh=is0PtstSWMC74xR2Tjxb62bhQUC85ljeeP90/iy5Vxw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=kRwQQuR8B8LwjERHvmJGf5dWvPQZIQfUls0D8/2bmmMyRCBiw6yuos4aki+cxWfmeybkjsOYf3Z1otJICZv/OTBZsgShiet1otlR7xgmIPyE4mw7Z2RJhLtAZe0IKbWu/Uz6XUCqFdD9k+0d8Ew6If6P2+WKYO8bnY0gajPZ8Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZLu6yLF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734363750; x=1765899750;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=is0PtstSWMC74xR2Tjxb62bhQUC85ljeeP90/iy5Vxw=;
  b=lZLu6yLFQQzG3mQEqC+7qC0bm6XJ5AedzkeBi6bxRLlgoQ1C8IKvVNVE
   jRTvD3n4q+kG16+Jj7O3PcU4vmu7sgoDWbdHyedO1mk1x6zL8cOF04sh1
   vTQ+9NcTClGpimfq2UMFciWszl6Bjg9qNVW0pZ/xsdyfGYI4+kRSbBiTP
   5NGcOTKJcrPG/2t+O+mhmCSwiyDnzfvAtcdwyiJCQmYnPYgE5qAgOgv41
   qAuZKmZwRoJuZ8+QazCHq5gx6ReHh5jyR0bx38NhgNZdC0CPhatFKVOBN
   /QJUGZ0Ai/hqLxky+Q3qD2A8UFotQXzsQBEaFBiWstlecrAPV5pEAcNbj
   w==;
X-CSE-ConnectionGUID: dqCrVkqPT1OZfr9a3ltOlw==
X-CSE-MsgGUID: ozXPXSsCQNq3G63xctNvLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34911057"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="34911057"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 07:42:29 -0800
X-CSE-ConnectionGUID: WkxYq6G/SSKswVq+s/svDA==
X-CSE-MsgGUID: R5BEd9sjQTi3I4XzPwWQCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101829579"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 07:42:28 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 44BB411FA2A
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 17:42:26 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tNDEo-009rtd-0g
	for linux-media@vger.kernel.org;
	Mon, 16 Dec 2024 17:42:26 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH v2 1/1] media: Documentation: ipu3: Remove unused and obsolete references
Date: Mon, 16 Dec 2024 17:42:16 +0200
Message-Id: <20241216154216.2352121-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused reference #f5 and obsolete reference f3.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/admin-guide/media/ipu3.rst | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/media/ipu3.rst b/Documentation/admin-guide/media/ipu3.rst
index 83b3cd03b35c..9c190942932e 100644
--- a/Documentation/admin-guide/media/ipu3.rst
+++ b/Documentation/admin-guide/media/ipu3.rst
@@ -98,7 +98,7 @@ frames in packed raw Bayer format to IPU3 CSI2 receiver.
     # and that ov5670 sensor is connected to i2c bus 10 with address 0x36
     export SDEV=$(media-ctl -d $MDEV -e "ov5670 10-0036")
 
-    # Establish the link for the media devices using media-ctl [#f3]_
+    # Establish the link for the media devices using media-ctl
     media-ctl -d $MDEV -l "ov5670:0 -> ipu3-csi2 0:0[1]"
 
     # Set the format for the media devices
@@ -589,12 +589,8 @@ preserved.
 References
 ==========
 
-.. [#f5] drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
-
 .. [#f1] https://github.com/intel/nvt
 
 .. [#f2] http://git.ideasonboard.org/yavta.git
 
-.. [#f3] http://git.ideasonboard.org/?p=media-ctl.git;a=summary
-
 .. [#f4] ImgU limitation requires an additional 16x16 for all input resolutions
-- 
2.39.5


