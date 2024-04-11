Return-Path: <linux-media+bounces-9075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1F78A08EE
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 08:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE43C1C20920
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 06:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660F513D8BB;
	Thu, 11 Apr 2024 06:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="laMJp300"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1456013D89C
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 06:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712818616; cv=none; b=uGcFOMKpTHFKzVZ6+B/umTyK4Tge154QNVG0zJKq1lBIgbe5vrVZgX3aSXKyz6SOBvLFw1ywfTxkqBNkwJB/OtTHdVWnNahd+gau6wxjcgPJBLDw3St3eZJ8ju8oV0Bcv5M3WoHWUfnsUBUAtxvqvCH7o3VGPUTpymOk7vCTzW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712818616; c=relaxed/simple;
	bh=5eKdi5kSwU1LfKZN6Ek9FRz1cnbWfefoSVKL8iIQMQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ndO2YHZbKPw0yS6merqx0lNNTr+kVTYM7OO2Tlj9zqi2beE1iZ9jocfKX7O5puB2Q34zQmZ44dFzQU9dfSLFRAulIInioAUySZQMEO3I8ginMSK2eeOXfYe5ZLJY/pRaJYb93rN2so4uANnPDaliY6YIMF1vHPyufKYbgOkTWak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=laMJp300; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712818616; x=1744354616;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5eKdi5kSwU1LfKZN6Ek9FRz1cnbWfefoSVKL8iIQMQQ=;
  b=laMJp300FrW4oPua/weA+zsi5SWpF5g8L4S6IQg0T3vic2mZ/1Y7DUU7
   1p4wqCtBPT4wN2mFSE3kGwDt1/UPU+qUav7Ba3HBzMYr/XSc1NjcyQx4w
   pZFoHshsBsOuBT1GgaaKP5LwMCZpcUBgXVXJkc8BuowJ6S0TMaVnAr0Pi
   Kisd394OvLm52PwQG7K5nMiMbuTaps7kx5s86PPEl0oHgpIoKKUgLXutg
   S+jjzLhnyTClJ7dfXEQDV9KvenUk0OdcAAIndTXVGY6zgdwTXNTrVilaE
   QxQ5rH8uySUg0AEmVC1qPB6eT6+un8a7KWTFtxW3h937sHYjd6MqrA39+
   A==;
X-CSE-ConnectionGUID: p2zGXzvWTqOk6z0KwuHkgA==
X-CSE-MsgGUID: 4PKxcBzzSmu2ueOUY87uHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="12002903"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="12002903"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 23:56:53 -0700
X-CSE-ConnectionGUID: NAByjibvSx6ZWdQCScMuTQ==
X-CSE-MsgGUID: pvL0ok6oRPW1MA1LEKnv8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="25575502"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 23:56:52 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 40E1C12035C;
	Thu, 11 Apr 2024 09:56:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1ruoMb-001kWA-0Z;
	Thu, 11 Apr 2024 09:56:49 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH 1/1] media: staging: ipu3-imgu: Update firmware path
Date: Thu, 11 Apr 2024 09:56:39 +0300
Message-Id: <20240411065639.417134-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the current firmware path in linux-firmware repository. Check the
older paths still in order to avoid causing issues to the users.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/ipu3/ipu3-css-fw.c | 4 +++-
 drivers/staging/media/ipu3/ipu3-css-fw.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.c b/drivers/staging/media/ipu3/ipu3-css-fw.c
index 2b659b0ccca1..37482b626c3c 100644
--- a/drivers/staging/media/ipu3/ipu3-css-fw.c
+++ b/drivers/staging/media/ipu3/ipu3-css-fw.c
@@ -117,7 +117,9 @@ int imgu_css_fw_init(struct imgu_css *css)
 	unsigned int i, j, binary_nr;
 	int r;
 
-	r = request_firmware(&css->fw, IMGU_FW_NAME_20161208, css->dev);
+	r = request_firmware(&css->fw, IMGU_FW_NAME_IPU_20161208, css->dev);
+	if (r == -ENOENT)
+		r = request_firmware(&css->fw, IMGU_FW_NAME_20161208, css->dev);
 	if (r == -ENOENT)
 		r = request_firmware(&css->fw, IMGU_FW_NAME, css->dev);
 	if (r)
diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.h b/drivers/staging/media/ipu3/ipu3-css-fw.h
index f9403da75785..c956aa21df25 100644
--- a/drivers/staging/media/ipu3/ipu3-css-fw.h
+++ b/drivers/staging/media/ipu3/ipu3-css-fw.h
@@ -9,6 +9,8 @@
 #define IMGU_FW_NAME		"intel/ipu3-fw.bin"
 #define IMGU_FW_NAME_20161208	\
 	"intel/irci_irci_ecr-master_20161208_0213_20170112_1500.bin"
+#define IMGU_FW_NAME_IPU_20161208	\
+	"intel/ipu/irci_irci_ecr-master_20161208_0213_20170112_1500.bin"
 
 typedef u32 imgu_fw_ptr;
 
-- 
2.39.2


