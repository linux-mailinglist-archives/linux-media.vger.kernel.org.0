Return-Path: <linux-media+bounces-3285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F9C8268E9
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 08:52:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 955331C21A93
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 07:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB368F44;
	Mon,  8 Jan 2024 07:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i58zFMex"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FC78BF9
	for <linux-media@vger.kernel.org>; Mon,  8 Jan 2024 07:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704700348; x=1736236348;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SoKUmG7TcZdV5fJHml1NSYqHnUDUjxEUQETPJTJbtl0=;
  b=i58zFMexREPkwQiCfylPNxChK0BEEfMPsVWfii/LG0jI+PgYnN+VAHvi
   nOZNclgR6pm+dffNcNezOSbVBKAoAcsN2p2RAZX4zXjT9CRjeKmnFWXBT
   u8XFty3b34o0DyZKeiUdDzv0468swMC48sPL73M0clNrBtdW1TEdgUW6L
   SoGWWHrpGrQRFPG+DqGfTd2iT1JtnZiUAqD5ymGqLex/fHywUDmO0f343
   k4/MgImr07CnM4gQvD4JJTzEr3290U52xCXxudDbMGNdzU5gm6dwG4Iby
   8YpkiH61dYMX+yCnpr8rhHhXTijBPt/e+YWwKNWAakyEjtbnvtJNKphlM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="11163898"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="11163898"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 23:52:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="1028325403"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="1028325403"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 23:52:25 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E059311FACB;
	Mon,  8 Jan 2024 09:52:21 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 0/4] Add link frequency to bitmap helper
Date: Mon,  8 Jan 2024 09:52:17 +0200
Message-Id: <20240108075221.15757-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This set adds a little helper for sensor drivers to match link frequencies
from system firmware with those supported the driver and generate a bitmap
suitable for passing to the control framework.

Imx319, imx334 and imx355 drivers are converted to use the helper, too.

I've tested imx319 and imx355 drivers.

since v1:

- Call the helper v4l2_link_freq_to_bitmap, it's nicer to use that way and
  aligns with v4l2_get_link_freq, too.

- Fix kerneldoc issues and compiler warnings.

Sakari Ailus (4):
  media: v4l: Add a helper for setting up link-frequencies control
  media: imx334: Use v4l2_link_freq_to_bitmap helper
  media: imx319: Use v4l2_link_freq_to_bitmap helper
  media: imx355: Use v4l2_link_freq_to_bitmap helper

 drivers/media/i2c/imx319.c            | 53 +++++++--------------------
 drivers/media/i2c/imx334.c            | 41 ++++++---------------
 drivers/media/i2c/imx355.c            | 53 +++++++--------------------
 drivers/media/v4l2-core/v4l2-common.c | 47 ++++++++++++++++++++++++
 include/media/v4l2-common.h           | 25 +++++++++++++
 5 files changed, 112 insertions(+), 107 deletions(-)

-- 
2.39.2


