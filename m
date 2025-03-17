Return-Path: <linux-media+bounces-28337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 769D7A643E3
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 08:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 759763B1E33
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 07:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFD621ADB5;
	Mon, 17 Mar 2025 07:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AlXO6SeV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF7821A444
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 07:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742197148; cv=none; b=oNVz44I2PuKVZP1ERQEz5rXmLo6tDO7t7OJe8pAmIabKFJaYBmXMXWaWOaVjQPTfYptdDwQpvlJTtGIXsLw/ciSfpDpOICqOaB4fGj1qJoLXNjVoLTRs29Co7u+O/qV8RBkKtCNrNf3ZEhZ+1USCXeM7kubFQ2vHej6WteigzPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742197148; c=relaxed/simple;
	bh=0vXG5PcwK6wLjd/bO5wEM/HfjVYRShDjqxRBVA9RB88=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L39VUUuhtkg1KA6JCn6YR4T7TsauNjTFJwKl15SOMzpeViRHSTYohxnqHFSBMRayqTdLhpbnP3eqGzG16WlaSMJpBY4rJ/6QPL8MMX9PvAftOqyZXHohPs1O5NXF6PQlT8w73KJ/eiDwPOoR684q0qqELCGKE9SFvUc6+QydTBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AlXO6SeV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742197147; x=1773733147;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0vXG5PcwK6wLjd/bO5wEM/HfjVYRShDjqxRBVA9RB88=;
  b=AlXO6SeVRlzdnMD4AEY2UwA5J8r2oPXo80B0LLb4STz5RMjKtx2fB6hN
   zQsiAxM0VgfFrtSioyK8h7QaLKS3QpSI07ZH1vroqg7es1ZtWjb28XlAe
   MharYZVxLzRdPxkzj9zgVPZtXdrPXwg1wAQ3LmsVrNOoeBXtAOuK5m0pZ
   9qoNGu+vcnStukwo4RtJbPHvrqJ0LAwv6kA7Hu26zK1w8pwNkJxujG+R0
   FCGVmhbWW+Z24bbU/70lq2yoPobSBp+Aag+sNZWLYD0ea1H0LfVRDdKf9
   AGe5OF36eWAKNBFH99J+IKccdeeahtypm0KbXOoeio8JRap2KVnDm0kJD
   g==;
X-CSE-ConnectionGUID: yaSoL33KRNSoLdWBi9bx7Q==
X-CSE-MsgGUID: aaiAHhBgTA+8dZsD/VPAWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="54275747"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="54275747"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 00:39:06 -0700
X-CSE-ConnectionGUID: CcMGhS3iSyWxOS11edD6LA==
X-CSE-MsgGUID: 53Fxm8gcTQeoPv5R7yXmSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="127047663"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.81.114])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 00:39:05 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH] media: intel/ipu6: Remove unused ipu6_isys_csi2_pdata
Date: Mon, 17 Mar 2025 08:38:56 +0100
Message-Id: <20250317073856.162147-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pointer to ipu6_isys_csi2_pdata is not used.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
index bc8594c94f99..ce8eed91065c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -14,7 +14,6 @@ struct v4l2_mbus_frame_desc_entry;
 
 struct ipu6_isys_video;
 struct ipu6_isys;
-struct ipu6_isys_csi2_pdata;
 struct ipu6_isys_stream;
 
 #define NR_OF_CSI2_VC		16
@@ -37,7 +36,6 @@ struct ipu6_isys_stream;
 
 struct ipu6_isys_csi2 {
 	struct ipu6_isys_subdev asd;
-	struct ipu6_isys_csi2_pdata *pdata;
 	struct ipu6_isys *isys;
 	struct ipu6_isys_video av[NR_OF_CSI2_SRC_PADS];
 
-- 
2.34.1


