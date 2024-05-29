Return-Path: <linux-media+bounces-12138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4548D2D78
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 08:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B6281C238D6
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 06:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F085A15FD19;
	Wed, 29 May 2024 06:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T5BJ07A3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE8415F417
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 06:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716965006; cv=none; b=mz/TCOdgGPvmcxJPAhtkWiBByjHpHBT6V6hpQIyCMbAPa9i9LWlU3wIoq4OhD9UycacNfNFmc5Hw/IjN3mslB3gX00MDRNw7whoXyqlYo+icBVc4H+166m8FM6x920XRLc6+V8E6cmT8d5zxi7DuLzHsWY+j4rllNTtaoX9kJiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716965006; c=relaxed/simple;
	bh=gSQcAxm+/nDxJTqHD6wmUYP7tYVDfYNJ9z2NGHrJyLg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dgzx+AtRedsZziiIiW4UMnnxfwUsyqn3JxOOjT6hiphIjZxEy26qATK7XAseHaF325QIJFIiE5Uia3t8c91K+wdzBl32iKB8VyOXy7xzzjXbrW6M2BYCkcoFAgsLDuFwNBJuUIjAOHHeAoq44kZy5y+0VD89aYuN1H2LoTCR8ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T5BJ07A3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716965005; x=1748501005;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gSQcAxm+/nDxJTqHD6wmUYP7tYVDfYNJ9z2NGHrJyLg=;
  b=T5BJ07A3HM493E0PtEa0+S0exY/y1NVZBs5dZYpZszvJGWH9iO990B7u
   NFXQiGxqIMODHqaQCyyKS5xX+6B07D0RpIMWuEYW6qbQw1LEW8qgPcuT/
   xJXQ8x+M1xJfiytysbLPSQpRXg7lA9yE5CgiKvv5dcxFjwN86XVR9TILJ
   fBUlVUinhPlSP2llH0uGeY0jQNND3gqSQ6vCRlnTM5TaIVeKddS97oV9v
   Wa1uVcJk2gbCV76Tgk3s67Yu75DF/MklF2J692sZmX3S1HenEF6TEskWj
   da84YSG3gxuouDW5mNI3+ypc5v0N/k5sqfrbklzbq7pn784sTKb/MZ8Nz
   A==;
X-CSE-ConnectionGUID: F1leHQknSgyhwX6T8/Bc4A==
X-CSE-MsgGUID: Q4BjjSLkSoS93oW980JtAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24764590"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="24764590"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 23:43:24 -0700
X-CSE-ConnectionGUID: efhqoT37QcKNs5LemxO8kw==
X-CSE-MsgGUID: iMj7htuRTEGkJzh8s3GGHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="40317466"
Received: from icg-hal3.bj.intel.com ([172.16.127.200])
  by orviesa004.jf.intel.com with ESMTP; 28 May 2024 23:43:22 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: tian.shu.qiu@intel.com
Subject: [PATCH v2] media: intel/ipu6: add csi2 port sanity check in notifier bound
Date: Wed, 29 May 2024 14:43:21 +0800
Message-Id: <20240529064321.687415-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Invalid csi2 port will break the isys notifier bound ops as it is
trying to access an invalid csi2 sub-device instance based on the
port. It will trigger a mc warning, and it will cause the sensor
driver to unbound an inexistent isys csi2 and crash. Adding a
csi2 port sanity check, return error to avoid such case.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 5992138c7290..19b7272283ba 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -678,6 +678,12 @@ static int isys_notifier_bound(struct v4l2_async_notifier *notifier,
 		container_of(asc, struct sensor_async_sd, asc);
 	int ret;
 
+	if (s_asd->csi2.port >= isys->pdata->ipdata->csi2.nport) {
+		dev_err(&isys->adev->auxdev.dev, "invalid csi2 port %u\n",
+			s_asd->csi2.port);
+		return -EINVAL;
+	}
+
 	ret = ipu_bridge_instantiate_vcm(sd->dev);
 	if (ret) {
 		dev_err(&isys->adev->auxdev.dev, "instantiate vcm failed\n");
-- 
2.34.1


