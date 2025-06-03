Return-Path: <linux-media+bounces-33975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB786ACC16C
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 09:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 676ED16F148
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 07:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7060F1FAC54;
	Tue,  3 Jun 2025 07:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CiqRoBnF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170CC27EC78
	for <linux-media@vger.kernel.org>; Tue,  3 Jun 2025 07:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748936961; cv=none; b=BVbA3CTxufRLuqey/vFOLWsxYkPYN7y6iDmHWVXTYAG5RDLgS2pf5ZNX8iE4u+yLD5f/3egzY7l/PeuR4PooUb5sp8Rl5c2mmhKpsGwULVAnbNxjScvicQ4Ko2EOnQQVww/vdRImy+h+yU/+V88iB7DzOSFU/6rF6tSdSw2oNYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748936961; c=relaxed/simple;
	bh=+PEO5KFo/eJTd1MZNSFxTJ+PFJyzmsMGZWTcIB7dOEY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cXWyBrjw2VE5svV4UHj1PNVpAzhxj+fN6jezIrQvIGxrsmHdz6hyKcFzASe/JGHY1gni8euWs014/Dp7MWCxnfMhNv7NuogvikhQmGAOgQnFitr16TOcFXHee8WjP3ED624n39LR6qEaEbHfkCBoWFgxAuoWui6o7xtjMxzFZSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CiqRoBnF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748936961; x=1780472961;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+PEO5KFo/eJTd1MZNSFxTJ+PFJyzmsMGZWTcIB7dOEY=;
  b=CiqRoBnFcs7PtJi9kLOsI6G6gWLZ/SzmWM8cCOObbcOmjZjv6sl9b5N2
   vNue8kXlO1EmXU9n6dffcDeU01Z7iw3LZOjuUhBddWRCrWGF3dGTPn8AK
   RBXLdWq5q43vo9PAIKJdBoJhpWDCXtifyl7F7OqzyjUEJibYucklgSysd
   tvv7Vv+9qZiwiAnaYHVTQ0Z1qCJt0z/mdbTX10bFzfLi/VUR5AnevBxAO
   M7nXpOWe6e1Szy7QscxAeX2ABqVFSGC5FenljXAWBxfF/CefrHB9KlTVO
   Nd2HSxyOWTU+OrXPT2prfGgRyvdlbwino7fPg8sqAGDW7KtdL4FbS1IGG
   w==;
X-CSE-ConnectionGUID: c4z+LdQeQb+QN4SRU+D3hA==
X-CSE-MsgGUID: TxfU9HsoStSyRgCO6ArenQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50659790"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="50659790"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 00:49:21 -0700
X-CSE-ConnectionGUID: 86V1gtU1RDyCKUvHK8Fodw==
X-CSE-MsgGUID: V5SC6ElhRvmXc8bUi0s/2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="144671289"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa006.jf.intel.com with ESMTP; 03 Jun 2025 00:49:19 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	stanislaw.gruszka@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH 3/3] media: staging/ipu7: Take 0xff as the invalid dt value
Date: Tue,  3 Jun 2025 15:49:14 +0800
Message-Id: <20250603074914.2494111-3-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603074914.2494111-1-bingbu.cao@intel.com>
References: <20250603074914.2494111-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

The CSI-2 data type value is a 8-bit data, using 0xff instead
of 0xffff as the invalid value.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu7/ipu7-isys-subdev.c | 2 +-
 drivers/staging/media/ipu7/ipu7-isys-video.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-subdev.c b/drivers/staging/media/ipu7/ipu7-isys-subdev.c
index 2ef8b20574da..98b6ef6a2f21 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-subdev.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-subdev.c
@@ -49,7 +49,7 @@ unsigned int ipu7_isys_mbus_code_to_mipi(u32 code)
 		return MIPI_CSI2_DT_RAW8;
 	default:
 		WARN_ON(1);
-		return 0xffff;
+		return 0xff;
 	}
 }
 
diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.c b/drivers/staging/media/ipu7/ipu7-isys-video.c
index 63b90c42d59b..8756da3a8fb0 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-video.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-video.c
@@ -1004,7 +1004,7 @@ int ipu7_isys_setup_video(struct ipu7_isys_video *av,
 	if (ret == -ENOIOCTLCMD) {
 		av->vc = 0;
 		av->dt = ipu7_isys_mbus_code_to_mipi(pfmt->code);
-		if (av->dt == 0xffff)
+		if (av->dt == 0xff)
 			return -EINVAL;
 		*nr_queues = 1;
 	} else if (*nr_queues && !ret) {
-- 
2.34.1


