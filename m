Return-Path: <linux-media+bounces-11799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A788CD09B
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 12:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1695283EFB
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 10:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724ED811E0;
	Thu, 23 May 2024 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myP77/OM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4F27E578
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 10:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716461154; cv=none; b=UFFiUmaiUgXFah6elWoAWaHHmOnST6zMnBQEKZx4C7YpgOhWPHiuF5jMjRYqWWjAxe3JweGm+fuNszibgP05HACyfdC7XUEUO5nx4PhdnozZg5oVup7IN1D5qKH1prCLhKCVPNCg6z+CyQPT1VKd9pcQOdADgFNMbx4Oyzk0lAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716461154; c=relaxed/simple;
	bh=eKFAdbIsrkRVSoarJ9PxsNdTDACmlnjCUTy2jAAX0vw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fBw6CJp2EFqaCTK/Y9t4AMAp3R/whF0xAoJonoqT1RdqBgHrqRJqoEtarYdhD6m74tTe20YcQEnN2aMXaaoU5s6gTNNXKZhyvRgTENizZHACOGF4xzZtmsv5qhU9W2j3w+b+6rQEpuxLZqe55HvzCfjiiHS6esBaoZgqIuG0f3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myP77/OM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716461153; x=1747997153;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eKFAdbIsrkRVSoarJ9PxsNdTDACmlnjCUTy2jAAX0vw=;
  b=myP77/OMh/gtt+xJ2l7GdeBd/JRQed4i5lXFdpxsT4HmDRNQ1G08YJsa
   TG3oaRZ78vD30DZzT8ccZ6O5Csajhcu6xVWvJ+HsVs/SutlXxM6WkOgx8
   kY829fa1g8LW0qMJzYOF5A15HUoLw6dpcW9bqf/IcfB+qAA0kGKNMsU67
   PU65xUOvGCSore4P63B/ltOK09j+LOcOHhUCjOg7qgcpkQHekWqL64A+d
   2V8+pybuL2icNzcMc1q5t5TAy2aCWqZ8BNv4DGqOa806cNZ4gZBpz4mwi
   W9PMpsWtmlFVL0YnrHQXHDBcjcRZmeCWCwIHsajZcN6TWlbIsD+ipdUrR
   g==;
X-CSE-ConnectionGUID: zKM04vtJQiSUJ+BxlbF0Iw==
X-CSE-MsgGUID: CQf+NtD1TImzNX9wc6Dhsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12616615"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="12616615"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 03:45:53 -0700
X-CSE-ConnectionGUID: TkUCBBpMReeunNj7NIynPg==
X-CSE-MsgGUID: ezMu2niTQm+Nt9Q/VNDoCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="33640443"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 03:45:51 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3B93511F82A;
	Thu, 23 May 2024 13:45:49 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com
Subject: [RESEND PATCH 1/1] media: ipu6: Print CSR messages using debug level
Date: Thu, 23 May 2024 13:45:46 +0300
Message-Id: <20240523104546.153634-1-sakari.ailus@linux.intel.com>
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


