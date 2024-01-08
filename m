Return-Path: <linux-media+bounces-3336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 192E18272DA
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 16:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 675EC282F6D
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 15:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D244C634;
	Mon,  8 Jan 2024 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jhgoxf44"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC8453E27
	for <linux-media@vger.kernel.org>; Mon,  8 Jan 2024 15:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704727125; x=1736263125;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=x9Zh6ChXPy7nv2FrseCk21jZQNlkkPcwlDZDIn7KlP0=;
  b=Jhgoxf441PTkCJO+mJxFg86fgR9nBWEWV5hmNE+PbPR5FVExPeaOxv00
   wVsv8JBLKW0tQ/gauLpH3XvlFxsorSDNH5Tg9mudWMuQngc/PqPgGbRcE
   2J5AwabfRSYsyJcs9wJK2N+oui89NLzpu7ILihitDgWSdEC12jnQqgTWX
   6bffVtyhzn6AMdlB0LIZlQypGqHeTWKAoKGDajIaGTxuI5uuBXoEgRM3j
   EVbWVFU9+CgIvnPycWZO7+ePYVsSEALqa4WNotOkzyIlB0t9p7C0IN5tI
   cQKvp2QLVhii/zVlceuUMzgcHDox4yoQhErYvVE973JNJLPYgxWWpf7+2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="396793581"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="396793581"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 07:18:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="954660709"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="954660709"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 07:18:10 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 944D611F913;
	Mon,  8 Jan 2024 17:18:06 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v3 0/4] Add link frequency to bitmap helper
Date: Mon,  8 Jan 2024 17:18:01 +0200
Message-Id: <20240108151805.55584-1-sakari.ailus@linux.intel.com>
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

since v2:

- Also fix EXPORT_SYMBOL_GPL() macro argument.

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


