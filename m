Return-Path: <linux-media+bounces-27711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D4FA54B7D
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 14:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBB1C174B94
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB6320B1F3;
	Thu,  6 Mar 2025 13:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LGxgCpcQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BBF209F44
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741266404; cv=none; b=D1xuf9SqfzuDHlBjjXaMvsF/D9ogI3eZ1qTz3oOiAnlIaLO7zDDRl0nCUF/ePKj5IxGUdbwYCQj/mkDOPoMt8MO8ZUzpFZBPeMVRAudSOoD4UBSIzoaHzzEG38YOO8+4HDhj/cV/URFryoCad4aJi2twSqO5qY7C54lf7Z5NGDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741266404; c=relaxed/simple;
	bh=Fhfaiuz9dP1I0PA/dQZF8d/RnS6B2OFfnadz+zPxPBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GhQPVd3PUKJK3vceUb1oAPHTX4me8M2Y8wKRCIp2DQ5W/cVPb5wcGs7pXybO3vnWbbjst+vSTyC6Pcgd57fXKl5wg5gn6j/fqL9JjuAnUDTSPa+m1LFPI80VZSZts8CWfhTrU7AK0+m68a8CptMq1wyOaW6Xx3PJFWxYf3lZWSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LGxgCpcQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741266404; x=1772802404;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fhfaiuz9dP1I0PA/dQZF8d/RnS6B2OFfnadz+zPxPBQ=;
  b=LGxgCpcQ/GEaw+KRW9Ot+9YuNm70A12WDmXr15wzpo8iT/U00F5XSvBW
   PZQxM2H2jez1JKjbJqQyadb9RRV7JIHI5nweki4/h71Qymc5cswmMLKPi
   kMjzVNcO0LpcYeqHMoRw21u1RsRq9jBz6MZHx82ACXSnnmSK0PBn+v8eZ
   OnNVziwOLAPdz2sCChGd1vcsbuZfrE3Fu50oTLQ/revxdqqmqzp9vLTpv
   lYHyQzyONHFbRLPc4s40W/yOErOU3CQNvMCFsqi7HO+T0yK/ZoWKn8TaO
   78Ewynv5FP9ykKeUfbutjOwtDYzQ8TKv8MJwKiY7iL5N/UIJXLg1J1ub6
   w==;
X-CSE-ConnectionGUID: FgH1YwZPROiPEjhzavt/xw==
X-CSE-MsgGUID: ppy2ilhsR42l42frutHmOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46042769"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="46042769"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 05:06:43 -0800
X-CSE-ConnectionGUID: Y0zK4+uKRnKL4ytrq7o+cw==
X-CSE-MsgGUID: pPX4g3mTSMyHogRUgZ3bVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="123974175"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.246.21.136])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 05:06:41 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: [PATCH v1 1/3] media: intel/ipu6: Remove unused IPU6_BUS_NAM
Date: Thu,  6 Mar 2025 14:06:27 +0100
Message-Id: <20250306130629.885163-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306130629.885163-1-stanislaw.gruszka@linux.intel.com>
References: <20250306130629.885163-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused define.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-bus.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-bus.h b/drivers/media/pci/intel/ipu6/ipu6-bus.h
index bb4926dfdf08..ebf470806a74 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-bus.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-bus.h
@@ -15,8 +15,6 @@
 struct firmware;
 struct pci_dev;
 
-#define IPU6_BUS_NAME	IPU6_NAME "-bus"
-
 struct ipu6_buttress_ctrl;
 
 struct ipu6_bus_device {
-- 
2.34.1


