Return-Path: <linux-media+bounces-23469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E129F3085
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 13:29:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2504A164773
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 12:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77ECC2046BA;
	Mon, 16 Dec 2024 12:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PM92hYvY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8E8204585
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 12:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734352166; cv=none; b=MCVOfRNjo/G4pfHqYqYcHg8TxyyoVyG2XmkFE2VGhaJcgoNScbyByCG8v7/BNgG9UsAa5dzdMkKOcS2fb5zftLvKjlkAQF0JoTgXyHQnr7L5jOR+tTJg74KnTt+w8PH+dp7fkgqZ+4J1WrsuRJLEl+1F6srp9RR3zU3raSvsmZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734352166; c=relaxed/simple;
	bh=AkjvANT9Piu1zq6DIdCSQF1YB4tUI7IbpoLmMkIrHMM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=imVgz7CtW+1tBbFx+kA6cPtyNtDBXcQ48mWGEiQ8H+hsGGNMyAjybr/Yi7h/hFcbRhabNp7ULjGNegODCsmsWhWwEEs2JroSbzsha0gTtVL9S9g5cMZZK1v8/67RwjRIQdgRKIephnx14StFZowoH9xhI9ejcwF0QVZD8gQJgLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PM92hYvY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734352165; x=1765888165;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AkjvANT9Piu1zq6DIdCSQF1YB4tUI7IbpoLmMkIrHMM=;
  b=PM92hYvYQR5D5wephy0gP9gZKFMBME1g+srgn+fgbp2pIXC8nz42LRMJ
   eL8O5ncib7nfL0aCwNqP0FFv3f+21BJGH390yGhr0rsOaqN2yX0EJoPLc
   rrKFzZIEKEd028aEG0RoObdEUUZ5FKjhdL4GltcuQ/gCg7RxTUfszv0hB
   jsKOGeMpU8iKV0jcH2Zlj9bxASNL2zWgVdecb9OkOyCOkomrfBfscEgSs
   kyFf99j+5lFcaJ6IgQ9nbabcHJetH+ILDnJTUMPI0YscMCRqapRzLVh8V
   7ajyDMiwiE+y11+kTiL1Pr8gWknYktqcKz1qxjyzV4VNq4w0WNjWuoEKm
   g==;
X-CSE-ConnectionGUID: k+Tp3SQLR5qyB1kOicyPdg==
X-CSE-MsgGUID: NH0xNWOEQw6RtDLHZT5WvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34963393"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="34963393"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 04:29:24 -0800
X-CSE-ConnectionGUID: L9q/aNv1THOPemuT1QCd1w==
X-CSE-MsgGUID: X6YTolfMTTaxgbdFKK5Q2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="128172750"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 04:29:24 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0A2E311F9F7
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 14:29:20 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: Documentation: ipu3: Remove an unused reference
Date: Mon, 16 Dec 2024 14:29:20 +0200
Message-Id: <20241216122920.793506-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused reference #f5.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/admin-guide/media/ipu3.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/media/ipu3.rst b/Documentation/admin-guide/media/ipu3.rst
index 83b3cd03b35c..43036e15235a 100644
--- a/Documentation/admin-guide/media/ipu3.rst
+++ b/Documentation/admin-guide/media/ipu3.rst
@@ -589,8 +589,6 @@ preserved.
 References
 ==========
 
-.. [#f5] drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
-
 .. [#f1] https://github.com/intel/nvt
 
 .. [#f2] http://git.ideasonboard.org/yavta.git

base-commit: d216d9cb4dd854ef0a2ec1701f403facb298af51
prerequisite-patch-id: 540fb1ae00bb87ba1377ffcab52a1d24913ce5a3
prerequisite-patch-id: effe06fe4555f851089c32d2ab899d76b3246cae
prerequisite-patch-id: 06064c33f3988b80d53ded5cfd305b962ff4f59d
prerequisite-patch-id: 4fa1b2fbc5b8517b65bda8173c01f35b58139fa2
prerequisite-patch-id: 7b19add58328b20a9c783ae9a0baef0dad3596c7
prerequisite-patch-id: 2f7aaad69c86b708b6a693f7551578fa1d7a502e
prerequisite-patch-id: 691f7aa0ac92902fb586dd7a1eb0578a687f780a
prerequisite-patch-id: 7d76c0c2d41033d46f5ea45aae7799c900fcb8ca
prerequisite-patch-id: 4dd16365646b5d2ee71755026811def2299c0549
-- 
2.39.5


