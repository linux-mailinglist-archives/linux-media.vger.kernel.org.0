Return-Path: <linux-media+bounces-50880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2080D3125B
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18E16304355F
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 12:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890991DEFE7;
	Fri, 16 Jan 2026 12:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWfNJE1d"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6201C19C566
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 12:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768566918; cv=none; b=k38uFKRBk0Em+ZRcAn+36j8DZeOdSyzfZ9Y1xholKRRgvPBodLyRtkpg8IXvFNio+Q6a00dxFx0RNN9Ik9K4HalCRpSdR8GvCpSn3bfkMFAaKKEgvCUwc0dhDaeRhwaF9/kGUSWU0EshJj+YyBqKfaId5ZqzM6FWIxYZDgI9Lbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768566918; c=relaxed/simple;
	bh=Yjcr5D8I6cKZeK+OONkpoBLwuvXDS776Co4InzPYeKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qz31bq3u+k/P5rwiIxbJoExUzp7us8aQxI+vHY3PZcZuUI34UMS4or7suJ7tK0IWsD2Gyhspyk7s9T1q6u/3FM6IxM5GreIhGDMVeh9YxamMkamQ+bng0CRMm2HVAz7V3PmEdIjK6HB2wHpC55ZyPkdR9D+WAec5kWAGLeTqre4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWfNJE1d; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768566916; x=1800102916;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Yjcr5D8I6cKZeK+OONkpoBLwuvXDS776Co4InzPYeKM=;
  b=PWfNJE1dTLyYy3nWif2IsEUyXAGfjhT/joKl7W6cRBuDsgkiIE0ki/tG
   MrclDPovMobEBw6XmuJwUIUWN1A81kBKFsAn57b2aod7wlG7m9MwGVpp0
   LT7HoueugF3QQCCrwUmSLcl4slQDv7cc7SoJ/oAP+RWSKzI+TwpKrQF5h
   GrA8sohLDLfiVPxKims2WBNGgIhljkTtRN21VL9hT/8HQrhMNjwuXoYn+
   glnJLqJJUZ5ayzzF+bpRZ8zEUiN5kJGL5YNHbw57fd5R8Ap+TYDfjidds
   QGyLycFa0ztKCKRf2mebvMbk5Y5o604khkbQV1bG8d4ct3WOeQYUyZfx/
   A==;
X-CSE-ConnectionGUID: hq3szgQTQ+yruWst0mPrIQ==
X-CSE-MsgGUID: YyHMe8kiRTSSqijYOTGpjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="81327466"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="81327466"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:35:16 -0800
X-CSE-ConnectionGUID: ZmTrDwM9QACRS8BrFk12VA==
X-CSE-MsgGUID: uqu8bEaCRLW2gD73raWjjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="205511886"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:35:15 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1307B1201B9;
	Fri, 16 Jan 2026 14:35:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vgj2o-00000000vU9-3kRj;
	Fri, 16 Jan 2026 14:35:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	laurent.pinchart@ideasonboard.com,
	jai.luthra@ideasonboard.com
Subject: [PATCH v2 0/8] Patches split off the metadata series
Date: Fri, 16 Jan 2026 14:35:06 +0200
Message-ID: <20260116123514.220949-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This small set of cleanups could be split off from the metadata series.

The comments to the patches earlier on in streams set version 9 and 11
have been taken into account.

since v1:

- Fix a false positive warning (all of GCC, sparse and smatch!).

- Add a patch to switch to guard()/scoped_guard().

Laurent Pinchart (1):
  media: i2c: imx219: Inline imx219_update_pad_format() in its caller

Sakari Ailus (7):
  media: ccs: Remove ccs_get_crop_compose helper
  media: ccs: Rely on sub-device state locking
  media: ccs: Switch to guard and scoped_guard
  media: ccs: Compute binning configuration from sub-device state
  media: ccs: Compute scaling configuration from sub-device state
  media: ccs: Remove which parameter from ccs_propagate
  media: ccs: Make supported mbus code bitmask a u64

 drivers/media/i2c/ccs/ccs-core.c | 458 +++++++++++++++----------------
 drivers/media/i2c/ccs/ccs.h      |  11 +-
 drivers/media/i2c/imx219.c       |  29 +-
 3 files changed, 243 insertions(+), 255 deletions(-)

-- 
2.47.3


