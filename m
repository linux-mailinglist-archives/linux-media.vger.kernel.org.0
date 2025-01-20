Return-Path: <linux-media+bounces-24943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75279A16B23
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 12:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D659318878BB
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 11:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BA61B5EA4;
	Mon, 20 Jan 2025 11:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrhqrfNU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD9C481CD
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 11:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737370932; cv=none; b=lLlVBTCIyxqBc6Y90RaZ7FwY2NO6ucho26YRn4YE1Dz1csRc6YbxHgs6ivlXjZct2lvtXY9hdX9MPLJvqYWaO5gMrafTByqNheEvOSvEA3ynQKzpq48e2p7F/jq1V91G3V6e7GfUwSVI2jQ9yIkqVRNNlbjTGVtGG4uYmy2nnDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737370932; c=relaxed/simple;
	bh=3aGNLxfG7xN2o3n89u9A+wINUHeBZ3DK3sFBwo98CdI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J5Usv/6XL9Y2T8CyA8Pf9po1k0wpiwwl1xYjA3QBMy+Di4uI7/g7r9xVGKkOjCJpheH0IvYgY4b8VcKXEnlmMs4Altt73C3D/IBxWq/UqkolIFSF+W4NTBqqfgwRIp18EHrNWRC8YQBi3XNB+014S4coRz6JkAoQbkWEafFNIpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrhqrfNU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737370931; x=1768906931;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3aGNLxfG7xN2o3n89u9A+wINUHeBZ3DK3sFBwo98CdI=;
  b=WrhqrfNUBTaSgWjiI3/O1qDQUkLy/gwlW8vGV2nPkbpmIbNC4+qI0Lvl
   gQZ79YYH4S5iyUCiMOwv51C4xVBm0kxAmYHri6g8tAXAWJhVH4Svz63wq
   BN6at/CX/CT+9WFlay0z9G0q41ndnwXPYb78BmM3FrafYB6JZzKks7P7l
   QMezWygD1RV3Vnj7mIqAwaI26S3ZRSkEGBsH/fFodXXyzJBuit9fE4qOf
   mNjrO9LZhRhdUukc6e0NNV6SQrVhxOrVM0vYNxId6nAE6eokltk8Sv6+4
   OSqNkbZ1vpZkOPr8EGVg5AAd3ECQ3qpNB+dKajD3pdhcowWU8S1KD2vjL
   g==;
X-CSE-ConnectionGUID: LyIO7P3DQGS2dor+N0vftg==
X-CSE-MsgGUID: 4cCLP5F7Tf26wbvAHn8PIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37914482"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="37914482"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 03:02:10 -0800
X-CSE-ConnectionGUID: bWqBoGveR3i9G1/ed6rLMQ==
X-CSE-MsgGUID: tgNHsjPDT96ipSbB5HpxcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="106491050"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 03:02:04 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CECC011F94F;
	Mon, 20 Jan 2025 13:01:57 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Yong Zhi <yong.zhi@intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	bingbu.cao@intel.com,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Benoit Parrot <bparrot@ti.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	"Duc-Long, Le" <duclong.linux@gmail.com>
Subject: [PATCH v10 0/9] Use V4L2 mbus config for conveying link frequency
Date: Mon, 20 Jan 2025 13:01:48 +0200
Message-Id: <20250120110157.152732-1-sakari.ailus@linux.intel.com>
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
and finally move drivers to call v4l2_get_link_freq() on a pad.

since v9:

- Fix local variable naming in qcom camss.

since v8:

- Use memset() to zero mbus config in call_get_mbus_config() instead of
  documenting the caller is responsible for that.

- Call the function obtaining media pad in the external sub-device
  camss_find_sensor_pad() in the qcom camss driver. Correspondingly, call
  the related local variables "sensor_pad" instead of "sensor".

since v7:

- Drop ctrl_to_csi() as it's now unused.

- Add patches to document how CSI-2 receiver should obtain the link
  frequency, moving stopping streaming out of CSI-2 specific part and
  adding a note on setting all fields in get_mbus_config() op.

- Added a patch to convert existing users of v4l2_get_link_freq() to
  operate on a media pad (vs. the control handler). I'll postpone merging
  this however to test it a bit as it touches a number of drivers for
  which I have no hardware for.

- Revert the order or the ivsc and ipu6 patches.

- Improved documentation as discussed with Laurent in v7 review.

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

Sakari Ailus (9):
  media: v4l: Support passing media pad argument to v4l2_get_link_freq()
  media: v4l: Support obtaining link frequency via get_mbus_config
  media: Documentation: Update link frequency driver documentation
  media: Documentation: tx-rx: Move transmitter control out of CSI-2
    part
  media: Documentation: Receiver drivers should call
    v4l2_get_link_freq()
  media: v4l: Memset argument to 0 before calling get_mbus_config pad op
  media: intel/ipu6: Obtain link frequency from the remote subdev pad
  media: ivsc: csi: Obtain link frequency from the media pad
  media: v4l: Convert the users of v4l2_get_link_freq to call it on a
    pad

 Documentation/driver-api/media/tx-rx.rst      | 26 ++++---
 drivers/media/i2c/st-mipid02.c                |  5 +-
 drivers/media/i2c/tc358746.c                  |  4 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c      | 11 ++-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 12 +--
 drivers/media/pci/intel/ivsc/mei_csi.c        | 78 +++++++------------
 drivers/media/platform/cadence/cdns-csi2rx.c  |  4 +-
 drivers/media/platform/nxp/imx-mipi-csis.c    |  5 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 11 ++-
 .../media/platform/qcom/camss/camss-vfe-17x.c |  9 ++-
 .../platform/qcom/camss/camss-vfe-gen1.c      |  9 ++-
 drivers/media/platform/qcom/camss/camss.c     | 27 +++----
 drivers/media/platform/qcom/camss/camss.h     |  2 +-
 .../media/platform/raspberrypi/rp1-cfe/cfe.c  |  4 +-
 drivers/media/platform/st/stm32/stm32-csi.c   |  4 +-
 drivers/media/platform/ti/cal/cal-camerarx.c  |  3 +-
 drivers/media/platform/ti/cal/cal.c           |  4 +-
 drivers/media/platform/ti/cal/cal.h           |  1 +
 drivers/media/v4l2-core/v4l2-common.c         | 32 +++++++-
 drivers/media/v4l2-core/v4l2-subdev.c         |  2 +
 include/media/v4l2-common.h                   | 19 ++++-
 include/media/v4l2-mediabus.h                 |  2 +
 include/media/v4l2-subdev.h                   |  4 +-
 23 files changed, 161 insertions(+), 117 deletions(-)

-- 
2.39.5


