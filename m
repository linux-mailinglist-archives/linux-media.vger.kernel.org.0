Return-Path: <linux-media+bounces-10006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6E08B0932
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 14:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D849286022
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 12:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5BA15ADB3;
	Wed, 24 Apr 2024 12:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YO+q6anp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DB815959E
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 12:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961366; cv=none; b=EkSfIfjZJabUjvJM+GRvb3SuIfrtSqkKL64wZT9TOPPWHn+upD4kjz8qF4clF6gdnWlN7rOWFUtsEHMyoHOLLj2O/QdYgp1SXfnd7dihAEta93VY2EGKUCw+QwShabNDA5b6xWIkfxC4EsfQNTb56m7oNk2zHeDnq1r7sCpnlyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961366; c=relaxed/simple;
	bh=d8/Vh+hc+vRWu3jECz3FuvtE8Bz6omN8hWTdTt7bDlM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iranw7USOa4RMDKuUPJ1iKCMb1dvSg6V6MtXXrlgQFgFWKa7dodh/0yrR1fTOXUG2pti4bNyxdN2MAySXVFjpSv+9cKIqhEurfqgs0o2f8gG4Su8qvLJtxkLfoxUEd0XxtoGPStO5w8Wyf51HYwH7jaEIu44iM7J9BKkKwFCZCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YO+q6anp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713961364; x=1745497364;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=d8/Vh+hc+vRWu3jECz3FuvtE8Bz6omN8hWTdTt7bDlM=;
  b=YO+q6anpFr7yRsbiDFflrCBewoYQnpoBRMN3V15OUryZAu+egjwsLl3s
   3FTwJlN2r1hf12tbbv5L06oCPI7zXakmsN32fz+LMGrFa6KQdXI9b6BF+
   meMO/02IxwGBgQh2VpzAVUeNWUW1GjwVITf9Cfzr74jtSARuBj5ZCH5Ug
   dd9u2Oqvo8bCgZ55rfQ6yGjBd2xspjz77Ua0IKe4FMDf5u7VKxD3xcGxN
   5v7fEdH+T2wV+qfFZXWJmAgie7IH6y/wr0n4ryJ+fJFfsDurOmgwqhGqD
   TAMY5eWjq+L7qREKnRgIa0FgexhOi/3s8DeXSUvAIqtlN8i3QP7/rG6xz
   Q==;
X-CSE-ConnectionGUID: XdLwhDCnQo6EqtQvv+7Adw==
X-CSE-MsgGUID: 2xvLRWrSQRism9BN9C4h+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="12522883"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="12522883"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 05:22:43 -0700
X-CSE-ConnectionGUID: ZFq3Loq/Qw6qb0XbeliiuQ==
X-CSE-MsgGUID: n1HVNVm+RiSmSd5ty60IMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="29348877"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 05:22:41 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9614011F855;
	Wed, 24 Apr 2024 15:22:37 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 00/14] Generic line based metadata, without sensor API changes
Date: Wed, 24 Apr 2024 15:22:23 +0300
Message-Id: <20240424122237.875000-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello everyone,

I've split these patches off the metadata set [1], it'll still take more
time to merge the internal pad support as it is evident we need to
properly define the recommended sensor APIs to merge the drivers that are
using them.

In the meantime, these should be good to be merged for 6.10.

The patches include changes to the routing API before the internal pads.

[1] <URL:https://lore.kernel.org/linux-media/20240420100518.GA5618@pendragon.ideasonboard.com/T/#t>

changes since v9 metadata set:

- Fix metadata format documentation.

- Improve language of struct v4l2_subdev_format field documentation when
  it comes to metadata.

- Improved documentation for routing API.

- Set (and unset) the V4L2_FMT_FLAG_META_LINE_BASED flag in the framework
  based on the format, don't rely on the driver to do it. Added a comment
  to the format list to remind developers to update v4l_fill_fmtdesc when
  adding new metadata formats.

- Drop the patch that moved G_ROUTING below S_ROUTING handling in
  v4l2-subdev.c. It's no longer needed.

Laurent Pinchart (1):
  media: v4l2-subdev: Clearly document that the crop API won't be
    extended

Sakari Ailus (13):
  media: Documentation: Add "stream" into glossary
  media: uapi: Add generic serial metadata mbus formats
  media: uapi: Document which mbus format fields are valid for metadata
  media: uapi: v4l: Add generic 8-bit metadata format definitions
  media: v4l: Support line-based metadata capture
  media: v4l: Set line based metadata flag in V4L2 core
  media: Documentation: Additional streams generally don't harm capture
  media: Documentation: Document S_ROUTING behaviour
  media: v4l: subdev: Add a function to lock two sub-device states, use
    it
  media: v4l: subdev: Copy argument back to user also for S_ROUTING
  media: v4l: subdev: Add len_routes field to struct v4l2_subdev_routing
  media: v4l: subdev: Return routes set using S_ROUTING
  media: v4l: subdev: Add trivial set_routing support

 .../userspace-api/media/glossary.rst          |  15 +
 .../userspace-api/media/v4l/dev-meta.rst      |  21 ++
 .../userspace-api/media/v4l/dev-subdev.rst    |  31 +-
 .../userspace-api/media/v4l/meta-formats.rst  |   3 +-
 .../media/v4l/metafmt-generic.rst             | 343 ++++++++++++++++++
 .../media/v4l/subdev-formats.rst              | 270 +++++++++++++-
 .../media/v4l/vidioc-enum-fmt.rst             |   7 +
 .../media/v4l/vidioc-subdev-g-crop.rst        |   6 +-
 .../media/v4l/vidioc-subdev-g-routing.rst     |  51 ++-
 .../media/videodev2.h.rst.exceptions          |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  41 ++-
 drivers/media/v4l2-core/v4l2-subdev.c         |  50 ++-
 include/media/v4l2-subdev.h                   |  42 +++
 include/uapi/linux/media-bus-format.h         |   9 +
 include/uapi/linux/v4l2-mediabus.h            |  18 +-
 include/uapi/linux/v4l2-subdev.h              |  13 +-
 include/uapi/linux/videodev2.h                |  22 ++
 17 files changed, 880 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst

-- 
2.39.2


