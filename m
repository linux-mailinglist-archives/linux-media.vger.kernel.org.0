Return-Path: <linux-media+bounces-3221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 950F9825015
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 09:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34D3B286E87
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 08:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A6B21A03;
	Fri,  5 Jan 2024 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+AE0w5L"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA84B21359
	for <linux-media@vger.kernel.org>; Fri,  5 Jan 2024 08:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704443892; x=1735979892;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WTV4/eiM8uKmxZGca/L6NKGPg8b/PYfQvtJS80qRMs0=;
  b=n+AE0w5LjQiCTHZtFQwKkWGtPe+kWpANZf/E/i0FqEpjX4hI2MBOLrtJ
   nD2OsawSs2SEcR8YFvKpk0pI3b72TVfZhi2jDQRcfjPLDl0FWN2cNqhrT
   EeQpq/vu3mFuJYND5wbLZnH2NWnE3vk0p87QemO3CFHe77HTlfS0r5in3
   5O9DRXur0AsvrcCuU/EOKewXVVDshhYVsZ4PwP7AWXF85idV0L9TTq1pf
   7QzEou+OujakXfP/efEL+6QwhrzYE3z+ate+1RSuPUY18rvvD3sW6/Htv
   X5CDYXLHvAV/lFhhBA0qIa6hlbZNFSaCw4hpGav1Xz7GWNnxWMAOU5PWh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4834096"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4834096"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 00:38:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="953888653"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="953888653"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 00:38:02 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 22E3A11F7E4;
	Fri,  5 Jan 2024 10:37:59 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v2 0/3] Miscellaneous small things
Date: Fri,  5 Jan 2024 10:37:54 +0200
Message-Id: <20240105083757.197846-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This set does three things: refactor link creation in ipu3-cio2 driver by
using v4l2_fwnode_create_links_for_pad(), add debug prints in
v4l2_fwnode_create_links_for_pad() and drop an unneeded debug print in
media_relase().

since v1:

- Drop mistakenly added Prabhakar's Tested-by:.

- Print entity names and pad numbers for links that already exist in
  v4l2_create_fwnode_links_to_pad().

- Use "was" instead of "is" when comparing pad indices.

Sakari Ailus (3):
  media: ipu3-cio2: Further clean up async subdev link creation
  media: v4l2-mc: Add debug prints for
    v4l2_fwnode_create_links_for_pad()
  media: mc: Drop useless debug print on file handle release

 drivers/media/mc/mc-devnode.c            |  1 -
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 22 +++++-----------------
 drivers/media/v4l2-core/v4l2-mc.c        | 23 +++++++++++++++++++----
 3 files changed, 24 insertions(+), 22 deletions(-)

-- 
2.39.2


