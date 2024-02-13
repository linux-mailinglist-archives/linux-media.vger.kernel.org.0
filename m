Return-Path: <linux-media+bounces-5070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3335853160
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 14:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 810531F247A2
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 13:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6CA51C42;
	Tue, 13 Feb 2024 13:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2zu4E5A"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9A251020
	for <linux-media@vger.kernel.org>; Tue, 13 Feb 2024 13:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707829716; cv=none; b=t8hTwdCjSqlk2yb/5vya/jTT1DyUejyL/vnUYGqFWFOXbPVFZ6t4e/M9bZnCu7tE5AzoM1rSSv559d6AlcgjhiB391onIl8HHr6BnztKCKqvG2gFKdfGTVdZqVdns6JhfRgxVkuDUUDjXz2J2OR+unZ9f42yDUKP+KYIBXjimKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707829716; c=relaxed/simple;
	bh=Uhh3mxWZGmejQJ96IaMaKBX24BqSqQCwgOvIMSvGj3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WOgkxq2EzhV9CsZplbUVmGpLEFGF54vXr2+Gber5md4+zBJeEe4vLyNcaEjvvkTFYidHU97mldYDAOrgpB/AHfj3kAGZpzoPLZIgBcgGIRqTyrK+D2v40Icq+bhVeRth4tmmFs+gS++9mP/2XlepmN6n/BVQ4oRh/ZRusGAEhKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i2zu4E5A; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707829715; x=1739365715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uhh3mxWZGmejQJ96IaMaKBX24BqSqQCwgOvIMSvGj3Y=;
  b=i2zu4E5ABZ7bB58M55MXtbI1J4bS3KTr9tCuHeCHL0g4RVWXvomq4hWL
   yDFLdEyrnSM3iBblnHe8cbjjRtm6S/2/QLygZFkDxpLf38nI32k7VLQ3l
   l39pNeqJB/Lt99tdP+VapsUIBHF3E8oG5j7Kydi/KTJT+e8iBEkfXk+ha
   tryhP+LmWeugkKnwAQgPziJ3cLdkTXc3PxEDsSikj58jeNDJJ3xVzhaU0
   +OY7YGN1D7obNLaZR0tswyPC45ql0J663qg/l30hXJHDqQH1rSa+LaXZa
   +x9/oz3GYuLW5lWz+Q55ptMtpI5WjEUuWa3HzcoI+0do/6hUIQdKPDrJd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1739950"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1739950"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 05:08:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="26061694"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 05:08:21 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 73A0C11FA58;
	Tue, 13 Feb 2024 15:08:18 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 3/4] media: ipu-bridge: Serialise calls to IPU bridge init
Date: Tue, 13 Feb 2024 15:08:14 +0200
Message-Id: <20240213130815.382792-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240213130815.382792-1-sakari.ailus@linux.intel.com>
References: <20240213130815.382792-1-sakari.ailus@linux.intel.com>
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


