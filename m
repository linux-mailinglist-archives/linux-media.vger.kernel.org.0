Return-Path: <linux-media+bounces-32830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D8DABC314
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 17:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 964B7189E75E
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 15:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B186E287506;
	Mon, 19 May 2025 15:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jv6Rkaog"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4EC28540A;
	Mon, 19 May 2025 15:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747669836; cv=none; b=S5XEMvFUSIcwKfEBapth2OO2au3o7Yp9gk5sxu5Z4FDlpkoWSL8B+ClExWBsV4ui///tpcDGVk/lMgrxmskQJUYXHUaRSMFVb08sbLQsvoQ+z8Q01cp7dZJDh3ZOh5KVcMswhI9VwjniVEcu9gza4aujq57JmAZQ+XjfdhpqqoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747669836; c=relaxed/simple;
	bh=OM71tk5T/64aulbLzWRQGCll0oMkJLT1iUSb8tfUYoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gBQWYLo70dhxeG144WMeR6Klf5JccSHVqrCgzEaZwzNhwE+bLLXRDKsP9nvVI1DvgfdGC6mYKUqn+zCOF3AQPzCH4WKjvpSq0+c82SKFOdGmsR0F9CNXcrN/gJ6UC55C0aWzTcKvJWtoPZqxeOl/tozdr6Fsz7FOWNym2TNOGSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jv6Rkaog; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747669834; x=1779205834;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OM71tk5T/64aulbLzWRQGCll0oMkJLT1iUSb8tfUYoo=;
  b=Jv6RkaogU87vEiyO8MLP4dzPpi0LLt8MBayzSzBbt/pUNbBndXorLDfy
   5z1QVYKOET0T6y36YBiDFxV/BgtX3QoTElH5SBoyDNbHcjA3zG0QGInxW
   +HdmonGofogUwsoDKxXYNbfyL/TEs5pjWV/FpZTnDVRO/WAddpvMCSXRK
   +yWn5F97Pc/bDXwC7zziDUXt0kTr+0wT+dK7yf+YvzBFgIcx6mhmU8XP1
   EZmyeKJ15sGlMO5/S+74Kq6kXpn/5DIjDvmQEkU44O0llHi2aCWlVL8w0
   xugydh1yBwaVeAeK7Nl6bq1qqHS0Qb/rYqC01hg+dkga2g10yYBta20DU
   g==;
X-CSE-ConnectionGUID: h7iabiRpR5m1YI30RjQllQ==
X-CSE-MsgGUID: 9VpRwlE8Qnm6GUe3v3ZW1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49480090"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49480090"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:50:34 -0700
X-CSE-ConnectionGUID: mzS3TaYtQ7OxenzVYaoisg==
X-CSE-MsgGUID: E7V5tQ3xRSa+U9EUxnGAdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="144405904"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 19 May 2025 08:50:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 55A171EC; Mon, 19 May 2025 18:50:30 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [rft, PATCH v2 0/3] media: atomisp: replace math macros
Date: Mon, 19 May 2025 18:46:46 +0300
Message-ID: <20250519155028.526453-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kill unused definitions that may use custom macros from math_support.h
and reduce usage of the latter and even kill some of them at the end
of the series.

Please, apply only after tests that confirm everything is working
as expected.

Changelog v2:
- added a cleanup patch 1
- removed potential div-by-0 conversions

v1:
https://lore.kernel.org/linux-media/20240923085652.3457117-1-andriy.shevchenko@linux.intel.com/

Andy Shevchenko (3):
  media: atomisp: Remove unused header
  media: atomisp: Replace macros from math_support.h
  media: atomisp: Remove no more used macros from math_support.h

 .../pci/hive_isp_css_include/math_support.h   |   5 -
 .../kernels/anr/anr_1.0/ia_css_anr_types.h    |   4 +-
 .../pci/isp/kernels/dpc2/ia_css_dpc2_param.h  |   6 +-
 .../isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c |   4 +-
 .../isp/kernels/eed1_8/ia_css_eed1_8_param.h  |  22 +--
 .../isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c |   6 +-
 .../isp/kernels/sc/sc_1.0/ia_css_sc_param.h   |   2 +-
 .../pci/isp/modes/interface/input_buf.isp.h   |   6 +-
 .../pci/isp/modes/interface/isp_const.h       | 157 ------------------
 .../pci/runtime/debug/src/ia_css_debug.c      |   1 -
 .../atomisp/pci/runtime/frame/src/frame.c     |  29 ++--
 .../atomisp/pci/runtime/ifmtr/src/ifmtr.c     |  11 +-
 .../pci/runtime/isys/src/virtual_isys.c       |   2 +-
 .../staging/media/atomisp/pci/sh_css_defs.h   |  12 +-
 .../media/atomisp/pci/sh_css_internal.h       |   8 +-
 .../media/atomisp/pci/sh_css_param_dvs.h      |  22 +--
 .../staging/media/atomisp/pci/sh_css_params.c |  12 +-
 17 files changed, 77 insertions(+), 232 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h

-- 
2.47.2


