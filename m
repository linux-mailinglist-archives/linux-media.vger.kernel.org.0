Return-Path: <linux-media+bounces-50198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBA9D01ED9
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 10:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E110B31A6FF0
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 08:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8375537F73B;
	Thu,  8 Jan 2026 08:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SwaZjk/R"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEB127442
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860246; cv=none; b=IT01/x2mJTkmEoKSnDtsx4OROYhlTvNo6M/CA2wRW9RFT2OH7/y+4Taq54HERgGnxowGQuwKxsz0IDaGkA6tdaqrF7LWlx/rTbwUWENaD+NCRJoZvCHAtk3X+XjuHsjReRgH251CSWO/zCBOiHs/mrETw9q/Q7QmWY/ItCQzLoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860246; c=relaxed/simple;
	bh=L7U7Nk3Gh4CxcRojzGty29DI8GXdza/qqhW45ScWoA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eMy4vybTLQjDtQBksM79qc8j/ar2oc76aJjb877Y+9RoI2U3WLMKdsKyua26GOfxF3uudzZrh8KFwpggiq6e1cVsruLabLuVvAgYvyc/3zJNpWJ78lHN+Vc8Nxg0DLP8mS010juCeLF5SMT7vsqMkXZITcD4W2NHMNvMZKJkyiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SwaZjk/R; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860240; x=1799396240;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L7U7Nk3Gh4CxcRojzGty29DI8GXdza/qqhW45ScWoA4=;
  b=SwaZjk/RFL+tSVT+fyPeUiwJlbtclcythklRAQEGj5DRtovhWtBbB+6P
   XO4YDJmhwMtzLK++X5sQz3p+JD1/77288rxigOSV/OafB0bXzfNSyiNmJ
   l+aM92RUF9r9BIlGqBHDwhzqF+plqS79dzeDe5Ku9NBvHBZsxuPhk/Mx+
   tbX01X8YsWl4TuQmmPpsc6KhpQqbfk7ssEPuoyvMSbYlSolhqiWgMymWk
   xkldMcawhuHeH/O/gk0oRHPJqcNspxDlJo6d/jcNVOSJulLFdvjt1hlUg
   a3mRiOpo3GihT7pdF1J9koi20IQ+dJrc6MzPU8c/VVKTTO9xyNfNlXGnk
   g==;
X-CSE-ConnectionGUID: 3UDkAb+7RJu6+KFIT0/xbg==
X-CSE-MsgGUID: Zya+HygbTo+a0nHaUy9pyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72869921"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="72869921"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:03 -0800
X-CSE-ConnectionGUID: CE5T2NQpS8a4+ht+v8pMbQ==
X-CSE-MsgGUID: rW0LI8kHS/i+B8IKN6vbEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="233842952"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.211])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:01 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 60E3911F72C;
	Thu, 08 Jan 2026 10:17:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vdlCi-00000002HS4-0CBZ;
	Thu, 08 Jan 2026 10:17:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 00/14] IPU6 driver cleanups and fixes
Date: Thu,  8 Jan 2026 10:16:57 +0200
Message-ID: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
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

since v3:

- Also drop redundant calls of ipu6_mmu_hw_cleanup() in MMU hardware init
  cleanup patch.

- Improved description of removing redundant streaming start mechanism.

- Always call close_streaming_firmware(), even if disabling streaming on
  upstream sub-device fails.

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

Sakari Ailus (14):
  media: ipu6: Ensure stream_mutex is acquired when dealing with node
    list
  media: ipu6: Drop MMU hardware initialisation in probe()
  media: ipu6: Remove redundant driver data checks
  media: ipu6: Make symbols static
  media: ipu6: Remove redundant streaming start via buffer queueing
  media: ipu6: Don't check pipeline in stream_start
  media: ipu6: Close firmware streams on streaming enable failure
  media: ipu6: Always close firmware stream
  media: ipu6: Drop error argument from ipu6_isys_stream_start()
  media: ipu6: Obtain remote pad using media_pad_remote_pad_unique()
  media: ipu6: Obtain unique source pad from remote sub-device
  media: ipu6: Remove source_entity from struct ipu6_isys_stream
  media: ipu6: Drop custom functions to obtain sd state information
  media: ipu6: Always call video_device_pipeline_alloc_start()

 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  2 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 73 ++++++++-------
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |  1 -
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 36 --------
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  4 -
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 88 ++++++-------------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  6 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 21 +----
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  2 -
 9 files changed, 73 insertions(+), 160 deletions(-)

-- 
2.47.3


