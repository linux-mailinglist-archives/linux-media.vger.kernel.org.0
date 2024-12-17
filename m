Return-Path: <linux-media+bounces-23665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 667499F592C
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 23:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36DE21619DE
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 21:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818C71F9EC0;
	Tue, 17 Dec 2024 21:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HPgWWdP5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9659A1D5CCC
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 21:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734472494; cv=none; b=gqTt31v4wm+g0VQUPYWv+yPfqDePapfIC9yeN8/GfbyUTnkL4LTsHmwVuUoDVbNwHG8UxJDKRJZupu3AXjl+6yIdyEFRYQIqu9MnLgPX0JyOaOvKeF3Sx01KVRtaQZkQJr7DG9dckTxQUzCZG4/UlMBYOKzHrtpk8le4w2XSLsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734472494; c=relaxed/simple;
	bh=dnY8dLwDbk5sGBosmOMA2ynX9UiRbBbfu0WIiNQh5Rw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UiLeylAVhgqT78tmCnkeAZBVWEUA8HH5e4N4U0XCuBRuXivqhDxh2mnjkBynb/p83ygi0N47T6tpajRkLQkfEnDtJrXrsa0Be+aO+nzXC3+Sx+nJ+mzqG/EeyaeLWhPe0gn2WbIH4Hoxod60+9+xJPushtzSv1NjOPivjc4OtO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HPgWWdP5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734472492; x=1766008492;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dnY8dLwDbk5sGBosmOMA2ynX9UiRbBbfu0WIiNQh5Rw=;
  b=HPgWWdP5d8hST6rho2ZnGIv0omoUYqNmVIkU9sWbgcjaDRXJAOqpVYtk
   BgFJzo4DIuX07tFkRpIPIqEO7KWeNqqHXWgykJiMTI9G9qkqBIYB5wafD
   WptB3MHZGFTmOAuyvTe9va6Aun8cXzQdk4t6fyE0DiVFHjseFRvCyf0Cr
   fHgyFmQQDo9n7OnEC+R1Atya9/Evajx8sjJd5NgxAPRXr4bsKHsF8Bluu
   q7zHHpepakzOxgRcjQz7h1Xva50AZ7Nkcb/QFOW8MSRUgZJ6KM56yHHvG
   g8DdoxIPbnXQYPTvNVLT7CKkqi8rYx+fh2+e6cL/c2buk+msFQm5Cgszr
   Q==;
X-CSE-ConnectionGUID: mpIPwJHsQBWwaLUuIOSxKQ==
X-CSE-MsgGUID: I7As/LkoSM+h9kNvOhgwCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38861578"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38861578"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 13:54:51 -0800
X-CSE-ConnectionGUID: Tym3DPSETja5KG/ZBJNCeQ==
X-CSE-MsgGUID: fpev4zQ4T/agNQmNof3G2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97511231"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 13:54:51 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8851011F89A;
	Tue, 17 Dec 2024 23:54:46 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	bingbu.cao@intel.com
Subject: [PATCH v8 0/9] Use V4L2 mbus config for conveying link frequency
Date: Tue, 17 Dec 2024 23:54:36 +0200
Message-Id: <20241217215445.901459-1-sakari.ailus@linux.intel.com>
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
  media: Documentation: Add a note to set all fields in get_mbus_config
    op
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
 .../media/platform/qcom/camss/camss-vfe-17x.c |  8 +-
 .../platform/qcom/camss/camss-vfe-gen1.c      |  8 +-
 drivers/media/platform/qcom/camss/camss.c     | 17 ++--
 drivers/media/platform/qcom/camss/camss.h     |  2 +-
 .../media/platform/raspberrypi/rp1-cfe/cfe.c  |  4 +-
 drivers/media/platform/st/stm32/stm32-csi.c   |  4 +-
 drivers/media/platform/ti/cal/cal-camerarx.c  |  3 +-
 drivers/media/platform/ti/cal/cal.c           |  4 +-
 drivers/media/platform/ti/cal/cal.h           |  1 +
 drivers/media/v4l2-core/v4l2-common.c         | 32 +++++++-
 include/media/v4l2-common.h                   | 19 ++++-
 include/media/v4l2-mediabus.h                 |  2 +
 include/media/v4l2-subdev.h                   |  5 +-
 22 files changed, 155 insertions(+), 110 deletions(-)


base-commit: c2bb0ff95c29040483ac93b4c10fdf1bd8071b9d
-- 
2.39.5


