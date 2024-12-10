Return-Path: <linux-media+bounces-22979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6738A9EAA23
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 08:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D0D018861FF
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 07:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5972422CBED;
	Tue, 10 Dec 2024 07:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9wBDiKm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5153233123
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 07:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733817554; cv=none; b=B8c0bifVvz0yWorBvvDJevHc/K4gsLPYUzAkom4a0Fg8I8vy6jvlzZCZCIaoVd5czlSvQ/93fToA0oixIzt+OgPcvdrci643YI7guIP/1hOoHbaAplxATrF/neA1s3lZcOTcXzJOKRZQ8IUgxpnKKiPtDFIg63C0MEzFl4B/GV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733817554; c=relaxed/simple;
	bh=J92YmWoabMZKojHzK20G4k8P7Bcxahvd2OrPHfdyBVs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nJOCst6UMChMPgNk8JPs4js+N1sVSJwgfo1yUEQFEkTGMinVIuD2Tr9IdHGWiJO3HqC7ZtnX86VvTUgdtGWTncTPSkTVBBG8SWJFOTwP6fMudnB6i1piBNi1ynhstfKJjNMK/37sHPPyKcj60IrYauEyYme/Gv93OQpUYCMLbn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9wBDiKm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733817553; x=1765353553;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J92YmWoabMZKojHzK20G4k8P7Bcxahvd2OrPHfdyBVs=;
  b=O9wBDiKmLlDMROYOZ+11toWSt5cB4ciaRv4hON64xPEvB6rTJj+YWBpH
   9ODCzcYaYlA9EK8bwAdjySTw7oo9ZIANmR+jZ+W9Tw1FxrfHSqvO6idW5
   Jhe4bN35Yk8f3QjsJnSmp5a6HbP8C5Z+vrlv8eBpY9lk3jpjbSCTDKnGr
   b26udyPeR12zqVzI/bPwnMQNOC/F/mN6Em9uMNl1fLivt2SblbpdoUZ1f
   TU5mIYcuPYOkMEcO1ThcrDZ4LscWZPWjlb7UK8Uvis1+GmuAJoq4z2hG1
   uQonbW5MecO9+jlvfYGfrMhVryCm3vSmrDCXp2phtNo6Ts1LQCA0SDo7O
   w==;
X-CSE-ConnectionGUID: g8fV4omuQ/qbnvuTTNo2Cg==
X-CSE-MsgGUID: x7+lt4cORQaLvCZwVvUCWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="45544613"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="45544613"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 23:59:12 -0800
X-CSE-ConnectionGUID: GeRKqe2iTqaREPdCtZtsXA==
X-CSE-MsgGUID: GvDmcpYcT16cEmrOwVZu4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="99808194"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 23:59:10 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2DA6B11F71F;
	Tue, 10 Dec 2024 09:59:07 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v7 0/5] Use V4L2 mbus config for conveying MEI CSI link frequency
Date: Tue, 10 Dec 2024 09:59:01 +0200
Message-Id: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This set adds a few helpers for obtaining the link frequency from the V4L2
mbus config for devices that don't need to provide an UAPI to change it,
and finally add support for the Intel IVSC CSI device.

since v6:

- Remove comments on #else / #endif, it's trivial.

- Add a patch to convert the ipu6 driver.

since v5:

- Only support pad-based operation with CONFIG_MEDIA_CONTROLLER (1st and
  2nd patches).

since v4:

- Rework documentation a little.

- Remove wrong alignment change in 2nd patch.

- Move link_freq field after the type field in struct v4l2_mbus_config.

since v3:

- Add back missing ret I accidentally removed rather than moved to the 2nd
  patch.

since v2:

- Switch to V4L2 mbus config for conveying the link frequency.

since v1:

- Add a new 64-bit integer control V4L2_CID_CUR_LINK_FREQ instead of
  re-using V4L2_CID_LINK_FREQ.

Sakari Ailus (5):
  media: v4l: Support passing media pad argument to v4l2_get_link_freq()
  media: v4l: Support obtaining link frequency via get_mbus_config
  media: Documentation: Update link frequency driver documentation
  media: ivsc: csi: Obtain link frequency from the media pad
  media: intel/ipu6: Obtain link frequency from a sub-device

 Documentation/driver-api/media/tx-rx.rst      |  4 ++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 12 +---
 drivers/media/pci/intel/ivsc/mei_csi.c        | 72 +++++++------------
 drivers/media/v4l2-core/v4l2-common.c         | 26 ++++++-
 include/media/v4l2-common.h                   | 19 ++++-
 include/media/v4l2-mediabus.h                 |  2 +
 6 files changed, 73 insertions(+), 62 deletions(-)


base-commit: d1028b5748164e3ddd6d2bb0bbceee846ed2fc71
-- 
2.39.5


