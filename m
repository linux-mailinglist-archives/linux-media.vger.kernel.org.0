Return-Path: <linux-media+bounces-36641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7F5AF6C0E
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 09:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A67B47B6D5A
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 07:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4896429A9D2;
	Thu,  3 Jul 2025 07:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQiZ/zTt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B9A299A85
	for <linux-media@vger.kernel.org>; Thu,  3 Jul 2025 07:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529189; cv=none; b=JznTiFu37J8STxyRlHfzew8acing5uvCLaA2BM/bqR33B62TRJqk627aqIomLK5vgY7EfXmtOgmaFTRBntOKWvS6iy7Uu6OuyDnc/nxGB1ygHwuv2HJmHBf+PL91i6fUFFy5Mf0oUF5l648HytjRpXtLlPH2pHNcw0Aq0PgT1/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529189; c=relaxed/simple;
	bh=fVuEYukFa02sOKqRZTou1+zc+e2UQg7heSeHA3y2AmI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=dGZTISDFBypyMVS4vdj/SuULTSn11bgp7F8lnqyuk61IJi65kh4mFtYk6JE3dRykY0IyC6PSVPLG14TCR8+rXiRBTNnIEloae6LM4i21RC6al21McHw703z816JGt9BwIJ4FBrH6EUHq6pVCHJvcQB/dtDg3OePYFxjLXdwf8BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQiZ/zTt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751529187; x=1783065187;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fVuEYukFa02sOKqRZTou1+zc+e2UQg7heSeHA3y2AmI=;
  b=jQiZ/zTtQ/0QOpMx12zy3FRBg4slixhLKfXp0xSWR7YQhsNxMNtTCQSU
   TD0E0WeG050SyakFwtEzjVkJAuZc1GFGYJp2D3H5XRkjv8xeRfE68Jh8D
   qHoErjn/Tdv2nnXpE9773ejJwHZjw2RLSbTUK3IuER51aF+STbB2SFH71
   ONsa76pcZ2IKQQ2Dy1/pDdYt21wF90mM7Wq9kdTaLqEN7mv5jIR0FL3aC
   ARQ6o6VZeTWv5VxsHWzmfR4Vt5euN7ZwmBP2NsEaLZqd1QS2GnUEJIzt4
   LlEEgtR+HLdQf2KvAlk9UmzDQcMVB+uN2j1n470m1MZh9mILOGYIzArtL
   A==;
X-CSE-ConnectionGUID: rtr3FezQQYiqKcGU7WICKA==
X-CSE-MsgGUID: avYKaaEBRMmL1RmyUjSe2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="52963441"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="52963441"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 00:53:06 -0700
X-CSE-ConnectionGUID: H4bee9ImQjyzXiLrU5reyQ==
X-CSE-MsgGUID: HoT9JEhNQJqQ971cKL/0/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154653852"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.116])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 00:53:06 -0700
Received: from svinhufvud.lan (syyslaukka.retiisi.eu [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id D9A71443B7
	for <linux-media@vger.kernel.org>; Thu,  3 Jul 2025 10:53:02 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: ivsc: Add MAINTAINERS entry
Date: Thu,  3 Jul 2025 10:53:02 +0300
Message-Id: <20250703075302.960243-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IVSC drivers seem to have never had a MAINTAINERS entry so add one
now.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 276c5a0b2dc5..125b3d373ef7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12524,6 +12524,15 @@ W:	https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi.git
 F:	drivers/net/wireless/intel/iwlwifi/
 
+INTEL VISION SENSING CONTROLLER DRIVER
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Bingbu Cao <bingbu.cao@intel.com>
+R:	Lixu Zhang <lixu.zhang@intel.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	drivers/media/pci/intel/ivsc/
+
 INTEL WMI SLIM BOOTLOADER (SBL) FIRMWARE UPDATE DRIVER
 M:	Jithu Joseph <jithu.joseph@intel.com>
 S:	Maintained
-- 
2.39.5


