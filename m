Return-Path: <linux-media+bounces-50782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E827D24975
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 13:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9576A301E219
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 12:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD83399A6F;
	Thu, 15 Jan 2026 12:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dt6H/bTL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70C8399014
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 12:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768481179; cv=none; b=LQHNGAGE3N4EJ/j9v4e4JGv3t/XJNiKNJs5YKlipO5Ynd7HySg/ki1omP6M5CPMusq9K8E2MXwYoP6BiBpeG4rVtSCcRNuBHjPG8KW4tuVmla+3kcOX/Rwv4Y6IzVAun+WePbNo0Q+ZgNH4SqLAqq0JyZrX2iLwuMbW6PDButC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768481179; c=relaxed/simple;
	bh=MZAMQfr41TAsoxnEAwhGSo+MJHUtV7WjLCsxz0aHc8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ekdWIEPrW7mKvgjcNxhDAFZadG9dbGeWKvVKIp4dZ5yJlUsXTsl/z0skZxT+/p+N12ajkrtGfN4XQ3WFaBKgQPx20Ldzg9M53oHgzKVqPjkMG5K2+CYylSFhnArAgE89Z+kgQiy11kPkMJPLLmgb3UEj24/n63n7RHK3ghpeyaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dt6H/bTL; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768481178; x=1800017178;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MZAMQfr41TAsoxnEAwhGSo+MJHUtV7WjLCsxz0aHc8w=;
  b=dt6H/bTLKrpQO5fholU1pnccR5h02J4RlKZU1xd1idqYgXKYQgwcMYxc
   A2+EKxGAyKZlbcKtSmmAftiF5KHcHQ126zflErbm5am+3gp1UJWbbExy9
   DRZpBmUFffKBZorNG1S6WMGSb1HE3VVbHu5jDF4ud6rpHoLRl8VYf+Z12
   j+yMvcFq12LTl4eY9ZXxcY0q6E2QMigDsgBhZyHGaY+MqQXFUezAllmwU
   F08Qy7US8cS0NXZ3HOJ7CtiygM/qiSnO1x4Hz0m3wUrdSolPx9p1IaDZ/
   Jrmku546Qh6NZzGymkUqOnpq0ZaG91jP5y6mwS5vTqgcffytiQPwC+PLF
   w==;
X-CSE-ConnectionGUID: zScQc8Z1SRmpJruPVwMrnQ==
X-CSE-MsgGUID: Sr/S3n1ERriyr8doo13ukQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80428296"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80428296"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:46:17 -0800
X-CSE-ConnectionGUID: RF57On+NTzCuaDJ4Slf38g==
X-CSE-MsgGUID: fuc7ZNqIQXekfjR3J8vz4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="204980447"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.213])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:46:15 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EA59C12020E;
	Thu, 15 Jan 2026 14:46:12 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vgMjs-00000000UM5-3FDe;
	Thu, 15 Jan 2026 14:46:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	laurent.pinchart@ideasonboard.com,
	jai.luthra@ideasonboard.com
Subject: [PATCH 0/7] Patches split off the metadata series
Date: Thu, 15 Jan 2026 14:46:05 +0200
Message-ID: <20260115124612.116663-1-sakari.ailus@linux.intel.com>
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

Laurent Pinchart (1):
  media: i2c: imx219: Inline imx219_update_pad_format() in its caller

Sakari Ailus (6):
  media: ccs: Remove ccs_get_crop_compose helper
  media: ccs: Rely on sub-device state locking
  media: ccs: Compute binning configuration from sub-device state
  media: ccs: Compute scaling configuration from sub-device state
  media: ccs: Remove which parameter from ccs_propagate
  media: ccs: Make supported mbus code bitmask a u64

 drivers/media/i2c/ccs/ccs-core.c | 444 ++++++++++++++++---------------
 drivers/media/i2c/ccs/ccs.h      |  11 +-
 drivers/media/i2c/imx219.c       |  29 +-
 3 files changed, 238 insertions(+), 246 deletions(-)

-- 
2.47.3


