Return-Path: <linux-media+bounces-35572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4015CAE3673
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 09:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDFD516779F
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 07:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329DE1F09A3;
	Mon, 23 Jun 2025 07:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gxe8sfyv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229722628D
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 07:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750662071; cv=none; b=H4igxFbYkQpB8Y7Iqm9z6RIli1aq0cv4tM/grddviE60tyVxo+VT+UCN4NQ+0aDom8c+em1V4Pez1H75NZXbwT/GYyXTSL+tjkeHb6RI98ecKBxjeLtlq/GnQ2DNsk4kXdVhX4Uh2Y7XU5WAtDnHa+j1PkQ51Kvcn1DRlvJSe2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750662071; c=relaxed/simple;
	bh=JZ418OxZOTXbyIcC8oWnj32SFcQvdEPlHT560XeDGX0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=blwHB/X5o4xP1j08bSeW/4rchbNj3XMqADi3lafutCusnEjzA5Cv7TdSERML2R+LK7blEILj+htIANNFjIhCXu7GalX9MfOyp0WeetpHR00iUPI1OhbtzY5+OYdKoNTVy3YmHgsPIyR96iiXD5VbdJoDtYOiukLzhP+4uk5f1IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gxe8sfyv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750662067; x=1782198067;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JZ418OxZOTXbyIcC8oWnj32SFcQvdEPlHT560XeDGX0=;
  b=Gxe8sfyvGLpb+Tr2/7HPLBn1nHmnjitiIA0/u/UWMoJMrX3uvksGf/I7
   hqeDuy01dQN8b115inQm8YOF+6C4SxLMRuLwpA5K76E1BRTA9/xKW6XV0
   hpEAWf69laGGWTjXg0X/vXVlVCiX8UudJ1tAVAM4Xb3LQ+jf5xylMIFpS
   /HT+Obm1xbwwb8Cm8lXvrjNeoe11nG7S4ahhgwAPXMur9vFfRx1C0YnYD
   WcgLDk2r7pzbAYd+pRNzU5CEfkpDX2t6Ni0OhgS7RbX4qJr3NTDF88/HS
   MxGHceprwSAHJdNFYCJ7Ixgey7XfCdV4flbDdAMqWWuFd0D0MD/9QuY9j
   w==;
X-CSE-ConnectionGUID: JzvlmV+lQcmUYLQFSm93Qw==
X-CSE-MsgGUID: 7oQQ8VGpSbC732Gk+N9BKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="63911941"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="63911941"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 00:01:07 -0700
X-CSE-ConnectionGUID: 1tWuzNHKS5+C8VLCw/cloA==
X-CSE-MsgGUID: ZB8RyCDsQJ25YS1eAAwDgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="152027505"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 00:01:01 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7D2F71201F7
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 10:00:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uTbAp-009ZyX-1J
	for linux-media@vger.kernel.org;
	Mon, 23 Jun 2025 10:00:59 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: ivsc: Remove Wentong's e-mail address
Date: Mon, 23 Jun 2025 10:00:59 +0300
Message-Id: <20250623070059.2283233-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove Wentong's e-mail address from MODULE_AUTHOR() macro as the current
e-mail address is no longer valid.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ivsc/mei_ace.c | 2 +-
 drivers/media/pci/intel/ivsc/mei_csi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_ace.c b/drivers/media/pci/intel/ivsc/mei_ace.c
index 50d18b627e15..98310b8511b1 100644
--- a/drivers/media/pci/intel/ivsc/mei_ace.c
+++ b/drivers/media/pci/intel/ivsc/mei_ace.c
@@ -576,7 +576,7 @@ static struct mei_cl_driver mei_ace_driver = {
 
 module_mei_cl_driver(mei_ace_driver);
 
-MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
+MODULE_AUTHOR("Wentong Wu");
 MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
 MODULE_DESCRIPTION("Device driver for IVSC ACE");
 MODULE_LICENSE("GPL");
diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 955f687e5d59..c2917e156345 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -785,7 +785,7 @@ static struct mei_cl_driver mei_csi_driver = {
 module_mei_cl_driver(mei_csi_driver);
 
 MODULE_IMPORT_NS("INTEL_IPU_BRIDGE");
-MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
+MODULE_AUTHOR("Wentong Wu");
 MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
 MODULE_DESCRIPTION("Device driver for IVSC CSI");
 MODULE_LICENSE("GPL");
-- 
2.39.5


