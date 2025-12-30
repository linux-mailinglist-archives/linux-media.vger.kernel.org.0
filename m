Return-Path: <linux-media+bounces-49718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A4FCE9BEE
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10B583018F56
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8387021579F;
	Tue, 30 Dec 2025 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bOY7VBvv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA11212548
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 13:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100212; cv=none; b=W57Ueqry44n+bBx4aFlm/8l2cTmJJMaKgJfKzoYt5Qy+u0DSegbYjZ9sodWJ290XajmPf6u5zTxleC6bIw9kue1UATTIGX0mtGMcBmoczNHIrsXaXuaz/HXWqq6nCS4vjbodfqtT56NiywNyDW9aVfaHlvzjXf6wWb/TKv4w6wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100212; c=relaxed/simple;
	bh=YyrQ9J4LjeofqoHP3fFj85iMOQ0kfHQXwl4e7T19MLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bGnN5WGECioCRQ/TT9tpslQ4yWrXRJFCjUSfYKGenXrzNftJeqHxXSptTmcZyDyLXnL8jjS2SGXCgk2FcOnR7KxXlfkfxqkXvRgwDyZ0J9bWiob0MXuo3H9nCtNfv+GyQenuK0b+ZNStTpG1M/ffrgPHOPFZPmO8vTQ2vmynedw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bOY7VBvv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767100210; x=1798636210;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YyrQ9J4LjeofqoHP3fFj85iMOQ0kfHQXwl4e7T19MLY=;
  b=bOY7VBvv7Z/gwMbROKvpPufIzHuxv/qNhUHXu4dDK7J5sOGoFTypJSNJ
   HPKs6YJse7b26Bm9Tf6SzqJFQebfa35ieW5W7lLXS+vQsu1MfuQYwCAWj
   XhT85j0JXqrsGq8qNKrdcSeGb2BkmAWro3TH4VoNKziQzaS7dyJiP4U1Z
   uAgvD/uujIFJV8HmqsNnbcOW7snQx8HA9G0NCOFrR+YGPRj3VePRlzZma
   nK/JagLgVQwX1za74km02oM+OoBVpCtzxwiN/NNgaERVOGRl/MupuGLOC
   joI7KTmaylJ/CeGoRHpHDDmrp2JpyjBYB5I3nLquRtlHcgr5Wfj9R0iXp
   Q==;
X-CSE-ConnectionGUID: zH6ws5X2TGuRkhOYwuD6WQ==
X-CSE-MsgGUID: f3+ep/RlSf2FPbNE/AHWyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="79808037"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="79808037"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:07 -0800
X-CSE-ConnectionGUID: QtpTsHubQDS6YsbXi96Cuw==
X-CSE-MsgGUID: O6kCPmEATY+N863Zy2VRCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="224710695"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:06 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 94FA8121D8D;
	Tue, 30 Dec 2025 15:10:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaZUL-00000000Jbk-0tzv;
	Tue, 30 Dec 2025 15:10:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 00/13] IPU6 driver cleanups and fixes
Date: Tue, 30 Dec 2025 15:10:00 +0200
Message-ID: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello all,

This small set contains cleanups and fixes for the IPU6 driver. I'm
preparing a larger set of improvements in the IPU6 driver on top of the
metadata series (I'll post an update soonish) so consider this to be
preparation for that.

since v2:

- Factor in Mehdi's comments:

  - Rework commit message of "media: ipu6: Remove redundant streaming
    start via buffer queueing" patch a little.

  - Also remove IPU6_ISYS_BUFFER_LIST_FL_SET_STATE flag (patch "media:
    ipu6: Drop error argument from ipu6_isys_stream_start()").

since v1:

- Fix some intra-set compilation breakage and remove a now-redundant
  variable.

- Fix missing assignment of ret in ipu6_isys_link_fmt_validate() (includes
  a cleanup, too).

Sakari Ailus (13):
  media: ipu6: Ensure stream_mutex is acquired when dealing with node
    list
  media: ipu6: Drop MMU hardware initialisation in probe()
  media: ipu6: Remove redundant driver data checks
  media: ipu6: Make symbols static
  media: ipu6: Remove redundant streaming start via buffer queueing
  media: ipu6: Don't check pipeline in stream_start
  media: ipu6: Close firmware streams on streaming enable failure
  media: ipu6: Drop error argument from ipu6_isys_stream_start()
  media: ipu6: Obtain remote pad using media_pad_remote_pad_unique()
  media: ipu6: Obtain unique source pad from remote sub-device
  media: ipu6: Remove source_entity from struct ipu6_isys_stream
  media: ipu6: Drop custom functions to obtain sd state information
  media: ipu6: Always call video_device_pipeline_alloc_start()

 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  2 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 73 ++++++++--------
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |  1 -
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 36 --------
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  4 -
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 83 ++++++-------------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  6 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 17 +---
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  2 -
 9 files changed, 71 insertions(+), 153 deletions(-)

-- 
2.47.3


