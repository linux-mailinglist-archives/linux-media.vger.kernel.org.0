Return-Path: <linux-media+bounces-11790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E84BE8CD00D
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 12:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24EBE1C2268A
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 10:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBE613CF82;
	Thu, 23 May 2024 10:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VO5F4YkE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0A813D517
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716459058; cv=none; b=pbzeLg8qdDHb2uJRRbchHNv2TThyM3YHcJPdAWYCqaOjtUHUY1B6k9DvSAIi9m6XZmuJVmwpmkKYqkOpNVwk9L3zE0HouKh0gVb7KGQT8X94eDfj7LHqENGNIj06bFrDnqF+iFqqaoZp0m3CacomJ+EXcfRi0IfJF0OzVzChMHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716459058; c=relaxed/simple;
	bh=eKFAdbIsrkRVSoarJ9PxsNdTDACmlnjCUTy2jAAX0vw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B9KUhd2KmBux8ZNe92iT+sQZa026VpEa6iAXVPkoLMcZsfGyqm6JBUrXtamfidF34+9ktoGC0tfKP5Y5PxvwQzTioyjcRnDhc1CRYvd+QVS1L52tLwdBbT8vQSlrm1Q4kFD568SQEtRLpeUlvy14kHRXHwPwg/PwpJg+OSi6rBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VO5F4YkE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716459056; x=1747995056;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eKFAdbIsrkRVSoarJ9PxsNdTDACmlnjCUTy2jAAX0vw=;
  b=VO5F4YkEyYIcd3MAKkf3QLEAuUh1zVtP3t6YRXPzGyYDXR1dtKc8hT50
   pWCRk5EcefKrgMUzSlXRc6V6F1OPsGx/vpxTY50nv66ZnpL8Q5kNbu8He
   bveCC3iCkXlIRHEjswaD81NgcTg6uf9NBTgRYCyCxtn6JgfuQJkz/TMxZ
   611inq2/47cO75QvUh7GMQv3EAS09RJUMHDPlzstRDrbVL5PQ6yrIZ5lS
   jzifAGgfuV+nZwvDBKw4DQ8IUSA5SMVGfi8rTAL08b9lXHOrCjdCAYxqD
   n4XEgMlBxdPUPLnGSoLnfSBdRSmZjfRyIP6pyFU4RhJLBQy2DMZNbku9H
   g==;
X-CSE-ConnectionGUID: OdIhPPaCTNqA1ymRfr2J3g==
X-CSE-MsgGUID: hToQjhaKSjadxXjYJDWI5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12640732"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="12640732"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 03:10:56 -0700
X-CSE-ConnectionGUID: IU34OUhESKGQi21H08t+Gw==
X-CSE-MsgGUID: 3AIRzLRZQxuHtIthKJK6gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="34084065"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 03:10:55 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0FD1E11F82A;
	Thu, 23 May 2024 13:10:51 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	gian.shu.qiu@intel.com
Subject: [PATCH 1/1] media: ipu6: Print CSR messages using debug level
Date: Thu, 23 May 2024 13:10:51 +0300
Message-Id: <20240523101051.152242-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's entirely normal CSR will return non-indicative values after its reset
(0). There's no need to warn the user about that.

Suggested-by: Bingbu Cao <bingbu.cao@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index 23c537e7ce1e..e47f84c30e10 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -163,8 +163,8 @@ int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
 			writel(ENTRY, isp->base + ipc->csr_out);
 			break;
 		default:
-			dev_warn_ratelimited(&isp->pdev->dev,
-					     "Unexpected CSR 0x%x\n", val);
+			dev_dbg_ratelimited(&isp->pdev->dev,
+					    "Unexpected CSR 0x%x\n", val);
 			break;
 		}
 	} while (retries--);

base-commit: 8771b7f31b7fff91a998e6afdb60650d4bac59a5
-- 
2.39.2


