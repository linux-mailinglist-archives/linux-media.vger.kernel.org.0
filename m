Return-Path: <linux-media+bounces-5120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A00858544DF
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 10:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CAAD2852B0
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 09:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299BB12B88;
	Wed, 14 Feb 2024 09:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePH8HDEE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13668125C3
	for <linux-media@vger.kernel.org>; Wed, 14 Feb 2024 09:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707902294; cv=none; b=sAtLm41SGebVNo3CvztX4sBJfO4g0TuhmFBhBEjm76u1leePfpmALGEyx56oIifi+LhMTldi0qKXPxf9pJ3hYF3ub6Qq5Tj/lkitjiqufmKJMfZDQQ5b/FJlV2v2JPmC0EFoyX1GtL9Jbo9qj/HMNaLMFouRKZtb0d7+bLZVWXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707902294; c=relaxed/simple;
	bh=Uhh3mxWZGmejQJ96IaMaKBX24BqSqQCwgOvIMSvGj3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nLjfSFkBK0FP4zS60K9LnVQ3+scEOME/cVvgyUAIxPDmp84bk5qehnU2I3i2YwziV2NcIX649A0grI08EXCEI/fzfL2uC1u/Ej62xgMJzUPUyesOXhlbuIMxo5RVSiHwD5ZgvaA1Owuycn4rrN9Xzo3RNvO/Y+ol35bOqFChxaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePH8HDEE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707902292; x=1739438292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uhh3mxWZGmejQJ96IaMaKBX24BqSqQCwgOvIMSvGj3Y=;
  b=ePH8HDEE7TxQgsXpdunp+IjUD+sRbxN9a8LJYqvYLKNVeNLmR9TAJbwF
   PPDf9PKbo1KUaf2fsbRkBbuH/sT7JkUP+TjqMJbLjgygKU/zzhVO/GDBY
   9KtjX7/G9pt5UDa3rW6YQyVFSrs2PpNtEkjf31JrVtfI3tu1a2H/5Mtk/
   vyUGndyBQyXF/aJkwWIIL4oD9MTDtQ3si0YmnFdWL+UGGjIWr/f6ni2TU
   yR5LmgxqMwRmuCEbDA0g+RHKxgHxPIbTNfY/NlKK78WhhXzXqnsrcf8LT
   VAh7Gdw/q46NbZyvZpoh9Bq5q04mI5qmz8kh8iKFklxE81VVXl/GmAtIm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2301717"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2301717"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 01:18:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="935605013"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="935605013"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 01:18:04 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 926EC1204F8;
	Wed, 14 Feb 2024 11:17:56 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v3 3/5] media: ipu-bridge: Serialise calls to IPU bridge init
Date: Wed, 14 Feb 2024 11:17:52 +0200
Message-Id: <20240214091754.399340-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240214091754.399340-1-sakari.ailus@linux.intel.com>
References: <20240214091754.399340-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IPU bridge initialisation will be called from multiple locations in
the future. Serialise the access to devices' fwnodes in this context.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 735c62c37c22..e994db4f4d91 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -766,6 +766,8 @@ static int ipu_bridge_check_fwnode_graph(struct fwnode_handle *fwnode)
 	return ipu_bridge_check_fwnode_graph(fwnode->secondary);
 }
 
+static DEFINE_MUTEX(ipu_bridge_mutex);
+
 int ipu_bridge_init(struct device *dev,
 		    ipu_parse_sensor_fwnode_t parse_sensor_fwnode)
 {
@@ -774,6 +776,8 @@ int ipu_bridge_init(struct device *dev,
 	unsigned int i;
 	int ret;
 
+	guard(mutex)(&ipu_bridge_mutex);
+
 	if (!ipu_bridge_check_fwnode_graph(dev_fwnode(dev)))
 		return 0;
 
-- 
2.39.2


