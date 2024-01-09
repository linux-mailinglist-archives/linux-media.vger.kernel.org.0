Return-Path: <linux-media+bounces-3401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C89EF828610
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 13:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D35961C23813
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 12:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A723E364AE;
	Tue,  9 Jan 2024 12:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApZ2v3Ss"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FAF38DCC
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704803517; x=1736339517;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PG8HP7vv9t26sN8HB1eFuqSpRoolGm8ooXHj26BIqpA=;
  b=ApZ2v3SsFzQZQE3i5UUvUtIpKLbLLdyT9RcDS4QISGgsHMyhfAEfv+TT
   5Q56lO9bg7bkAtFGxwyHBl7c1Xh5E4Q2gbWrL2PFwVGo5dpm/4T9ClXBi
   iWkKOHoQz9iM7UcLUMEdGFTKIiSUgPilNMJfsQkKJNKJiaeg1dK++r4HA
   OJ9Lysug2ndt4ungsSvj0AaXeHtczJZD72KncAH8muV6Aj9eDBcaSJ7/b
   Yk6VfSJQBV1yZSurQixUcZ2X2m8wUOYhdV5mazIMMAUwj9OQVPBdUUelJ
   u+WB69DHrsupgvy/LK+5Wnd3IpC0t5Hj276ikCi4MQ4jyELRTPc/p0iXm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="397884325"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="397884325"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 04:31:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="785227089"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="785227089"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 04:31:55 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6855411F913;
	Tue,  9 Jan 2024 14:31:52 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Bingbu Cao <bingbu.cao@intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v3 0/3] Miscellaneous small things
Date: Tue,  9 Jan 2024 14:31:48 +0200
Message-Id: <20240109123151.106054-1-sakari.ailus@linux.intel.com>
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
media_release().

since v2:

- Specify that the pad not found in v4l2_create_fwnode_links_to_pad() was
  a source pad.

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


