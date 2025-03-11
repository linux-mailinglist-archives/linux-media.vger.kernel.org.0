Return-Path: <linux-media+bounces-27999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A245A5BAF8
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 09:42:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B57BF1893C2A
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 08:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA7822576E;
	Tue, 11 Mar 2025 08:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXnbqxlH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55DF1E9B0C
	for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 08:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741682558; cv=none; b=KSmhSlU0ODs8Su8W/0Cnkin2SIPw6YPbwcY0GZmKV9xWtNIxX7KMo9WOzT8l78fLyOGKqEkf8Ubij0KpeyZtQxZnnApNj77CwG+PU0QUbMVxpXDMDmtKrtNsA1mSilAzhg1IEObwi3VdTaMnevrYMvn67MW8XyGbL0yFuw/WJTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741682558; c=relaxed/simple;
	bh=Z138WlCqyJzo5I//f5PBvWa2AsCqhP8M3LQAbRK14k0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DE0GvdjxBcLHyzsk7yuON0SQHUaYv5S3/fXF7hEaqAvZRteThq0k+rU23KwZzHjVjSR8j3W78oXJQuxlBeBwE8mKGRKhzd8ucO8KHZyNCSzlrygAPi/424IcXf2pPmN293PINEPpurG8yHYvCsFe+j+I77eWGBRzuXGgnAOmkVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXnbqxlH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741682556; x=1773218556;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z138WlCqyJzo5I//f5PBvWa2AsCqhP8M3LQAbRK14k0=;
  b=jXnbqxlHyAtqaHuKADvspqFelkYHjExTEo38psjowfT5LjlfvGnEvCBQ
   9GN6AyguxXZOpZGIKbWZPgA9+gQ/c0KLCUtBg5+K66K/+U+FLkpGEnVal
   rtwbjNmgjI3hcnc5mqQMtuVsh+n7tJeswZ4HAp32/vAOjSU39qYw91wTY
   22XD0aM7zDBC7JgsOCUFrN5pdBM5Gf8n7DzIzJsA3PgNgIY16SQ5jtiLC
   a+ZP9ACoMdMEdIZ7p972ZGNy6Mpb8kDCaQc8Rs6vzsrj4/n5nLZaI5jze
   xXl+RLed1il3UEdBtbldT1GuZ5kJ4d3l+EsqfCIaMJwE+sj819DrlUf27
   Q==;
X-CSE-ConnectionGUID: NbQrAPMMS9WdIFqxve8sdA==
X-CSE-MsgGUID: b3TiLv1wRcGxCrsOercoYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42582752"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="42582752"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 01:42:32 -0700
X-CSE-ConnectionGUID: ihPZXyOiSm24nq0bLqIQiA==
X-CSE-MsgGUID: aEXtjB4mRLSwdM5H7m6Udw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="120279390"
Received: from haoyao-desk.bj.intel.com ([10.238.232.12])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 01:42:30 -0700
From: Hao Yao <hao.yao@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Hao Yao <hao.yao@intel.com>
Subject: [PATCH] media: ipu6: Remove workaround for Meteor Lake ES2
Date: Tue, 11 Mar 2025 16:41:55 +0800
Message-ID: <20250311084203.516205-1-hao.yao@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There was a hardware bug which need IPU6 driver to disable the ATS.
This workaround is not needed anymore as the bug was fixed in
hardware level.

Signed-off-by: Hao Yao <hao.yao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 277af7cda8ee..b00d0705fefa 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -464,11 +464,6 @@ static int ipu6_pci_config_setup(struct pci_dev *dev, u8 hw_ver)
 {
 	int ret;
 
-	/* disable IPU6 PCI ATS on mtl ES2 */
-	if (is_ipu6ep_mtl(hw_ver) && boot_cpu_data.x86_stepping == 0x2 &&
-	    pci_ats_supported(dev))
-		pci_disable_ats(dev);
-
 	/* No PCI msi capability for IPU6EP */
 	if (is_ipu6ep(hw_ver) || is_ipu6ep_mtl(hw_ver)) {
 		/* likely do nothing as msi not enabled by default */
-- 
2.43.0


