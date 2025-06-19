Return-Path: <linux-media+bounces-35232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E10EADFF85
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA0C5188F091
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 08:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5049625B69F;
	Thu, 19 Jun 2025 08:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMEFt5hX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09E721770D
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 08:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320954; cv=none; b=AyQmwSimoNL/zuuuAg0rkAVEDwB7JNHjejUaviR8uCXe7u9ij9MuqlumdIIPz0q5MesXSavn4K2Qw3YSN/VVwNxoWg3Y9T08iT//cvOSb7Bpk9/rWE2KqLMZWS2F/8kK4A94udaa8bU/x4554gwB7/3ega6Ztxl5h/l9lgqXV0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320954; c=relaxed/simple;
	bh=dbFJNHCM+bHjSc4GZiilPDtP4zBggBeEloqVTysok0I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HZGrZM7tnPgfTXxbeZdII/0qcG/6xNszBA/1DBoIZ2EjtgyeozZV0WeLNP5DjJqL3mc5EUgsm2hmkqfg5Un/Z8I4UBAfOg9FWIJqoHgI48akl1kOcF1SODCsvYHeOyGxrg701tamwIKl7PTLApV5bVjGyNRFZ+lcaOLprBNH7Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMEFt5hX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750320953; x=1781856953;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dbFJNHCM+bHjSc4GZiilPDtP4zBggBeEloqVTysok0I=;
  b=KMEFt5hXGRJ/Lj+m+BbmAm2t8PywKQcX2uCaB0dHBHA7+Lc5ssZhKpUd
   /avjBbwqFaN1oJrJJ5oQNx3OUC4Cv6gYQHGQtJws0lSlugqfb32I5O6eN
   qxWFKFQTBEask3WZVpQdxbdbHTmtxuG1WCDYbthbH7v/p7fjFapCCRKNo
   V/qYywl3gSTSa/Q3NROz2d6z2qntHlAPGgZvcoJ2OoEHGJ/Yc/tAUrgp5
   q/Gfd2qnv+K94rBWqMnXkM5k9+MONPAl+ZQLsxRPtFTDXKW6WCdpAjLyW
   50i2XFmWY3vbfl8fyFWjMTNmaD75Ue7I7pC7UXzDN324s7DcGpvSLX+PS
   A==;
X-CSE-ConnectionGUID: kswOKmw3SFG9F+71YYVB8w==
X-CSE-MsgGUID: eusepll7R7eyVmEVzmbJYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52716671"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52716671"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:50 -0700
X-CSE-ConnectionGUID: w6o5nBceTnm3dNxv9UBajw==
X-CSE-MsgGUID: GFOS1PwJQmqjp8YL4Pnr1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150640618"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8735C11F91E;
	Thu, 19 Jun 2025 11:15:46 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSAR0-006doN-1U;
	Thu, 19 Jun 2025 11:15:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com,
	tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH 00/13] Streaming control for MC with metadata or streams otherwise
Date: Thu, 19 Jun 2025 11:15:33 +0300
Message-Id: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Starting and stopping streaming is a non-trivial problem in all but most
simple cases where there's only one stream. But when multiple streams come
into play, the problem quickly gets difficult to solve properly as it
generally spans multiple hardware deveices, not only including
transmitters (e.g. camera sensors) and receivers but also devices in
between, such as CSI-2 aggregators and serdes devices.

The following document summarises the known use cases:
<URL:https://pilvi.retiisi.eu/s/44RWYjKG92R6X49>, please let me know if
you have something to add that's not included here.

What this patchset implements is a partial solution, but it's also a
solution that can be extended to cover the above cases with relatively
small amendments.

The current functionality is best documented in patch "media: v4l2-mc:
Introduce v4l2_mc_pipeline_enabled()".

This set, in some form, is also effectively required by metadata support
patchset of which I'm about to post a new version. Starting per VC (for
CSI-2) is next on my to-do list when it comes to this set.

Getting these both in for 6.18 would be great.

Comments are very welcome.

Sakari Ailus (13):
  media: ipu6: Use correct pads for xlate_streams()
  media: ipu6: Set minimum height to 1
  media: ipu6: Enable and disable each stream at CSI-2 subdev source pad
  media: v4l2-subdev: Add a helper to figure out the pad streaming state
  media: v4l: Make media_entity_to_video_device() NULL-safe
  media: v4l2-subdev: Mark both streams of a route enabled
  media: ipu6: Set up CSI-2 receiver at correct moment
  media: v4l2-subdev: Print early in
    v4l2_subdev_{enable,disable}_streams()
  media: v4l2-subdev: Collect streams on source pads only
  media: v4l2-subdev: Add debug prints to v4l2_subdev_collect_streams()
  media: v4l2-subdev: Introduce v4l2_subdev_find_route()
  media: v4l2-mc: Introduce v4l2_mc_pipeline_enabled()
  media: ipu6: isys: Rework stream starting and stopping

 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  63 +++--
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  48 ++--
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |  96 ++++---
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |   9 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |   2 +-
 drivers/media/v4l2-core/v4l2-mc.c             | 243 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-subdev.c         | 107 +++++---
 include/media/v4l2-dev.h                      |  14 +-
 include/media/v4l2-mc.h                       |  44 ++++
 include/media/v4l2-subdev.h                   |  22 ++
 10 files changed, 539 insertions(+), 109 deletions(-)

-- 
2.39.5


