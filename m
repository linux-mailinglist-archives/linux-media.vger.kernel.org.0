Return-Path: <linux-media+bounces-10175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCB08B3344
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0A291C20A09
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B18613C9D1;
	Fri, 26 Apr 2024 08:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kY+U1lfS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3846314293
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714121446; cv=none; b=s+rLEvuTBJNk3zCwEYAJigFg5Dxb/+BCOMYb4o3WVmGy/jB3pbINE1q0R17+iLrGnmn9uaODJtk/KYzZ5FC5kVd4pOc8HF51Er69EEvWkXyD5RYCYJ3oa7u/T3SBqXKvNma794wWNUUum5kbF/uA8S55JeMvTbP7C1mrksD/yKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714121446; c=relaxed/simple;
	bh=bIjiFiqfKbG5y7oGSDemwr8QeYbNzi6a9Ek/hWaD7dQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j4UYP6lRFfQ6TDvKGPCgZiHliwanNABe2DeaVepM8RmKeNf/dWpl6EnDyD0MDnceL70eHD76yxizmeSdPdgeRNh3moDRSwjZqPmRKN2x9wUqKWfoC7B/KOkn/zwJ7y1lsBGgZBDbngDhv3CY80FZQMjYqIzd4wO2V4l4nTb3l7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kY+U1lfS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714121445; x=1745657445;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bIjiFiqfKbG5y7oGSDemwr8QeYbNzi6a9Ek/hWaD7dQ=;
  b=kY+U1lfSQfEze5ALlGQ1qmLOXhDQWWPj76A++9MpWfqcU7wuwM55KFmd
   2OzolPI+nn88uXm1fCSmbkJM1CuV0ekmB9tZCpbT74wiK7ZRhldwrzG9g
   /xU5p+whhpx3nRW0Ix5oimGtt8RZzJpM56SjMs1sHjFvlpo39R4wqfwFJ
   7InLkbDqZMkYN6MShOEcpWA7s//AKImQ4QiFMpZ0SwLxKsDOdk6K8IYlh
   yCJZBsMSRg14OePF2rgZevtzrb4ULGoYEfsvRLMfo62d8LE6GLIGh3wDz
   ie29heK0/5oU0bmn3KI2H7x41wSHFKxEDnTSolWFPbAXE7gAo/2EPPs3e
   Q==;
X-CSE-ConnectionGUID: SJ2hbYJLS2yN44g5Ia9zYw==
X-CSE-MsgGUID: lNN7T/yyRCWIh+P/UZ1/0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9683778"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9683778"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:45 -0700
X-CSE-ConnectionGUID: 8FgUnotcSxq9hO80Ms/bSQ==
X-CSE-MsgGUID: JqDOhoZCT8qQG3dCes7ntA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="48598495"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:42 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D493D11F855;
	Fri, 26 Apr 2024 11:50:38 +0300 (EEST)
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
Subject: [PATCH v3 00/14] Generic line based metadata, without sensor API changes
Date: Fri, 26 Apr 2024 11:50:24 +0300
Message-Id: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
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

In the meantime, these patches are seen as what can be merged for 6.10.

The patches include changes to the routing API before the internal pads.

[1] <URL:https://lore.kernel.org/linux-media/20240420100518.GA5618@pendragon.ideasonboard.com/T/#t>

changes since v2:

- Fix glossary term referencing (thanks to Hans!).

changes since v1:

- Improve len_routes field documentation in struct v4l2_subdev_routing.

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

 .../userspace-api/media/glossary.rst          |  12 +
 .../userspace-api/media/v4l/dev-meta.rst      |  21 ++
 .../userspace-api/media/v4l/dev-subdev.rst    |  31 +-
 .../userspace-api/media/v4l/meta-formats.rst  |   3 +-
 .../media/v4l/metafmt-generic.rst             | 340 ++++++++++++++++++
 .../media/v4l/subdev-formats.rst              | 269 +++++++++++++-
 .../media/v4l/vidioc-enum-fmt.rst             |   7 +
 .../media/v4l/vidioc-subdev-g-crop.rst        |   6 +-
 .../media/v4l/vidioc-subdev-g-routing.rst     |  51 ++-
 .../media/videodev2.h.rst.exceptions          |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  41 ++-
 drivers/media/v4l2-core/v4l2-subdev.c         |  50 ++-
 include/media/v4l2-subdev.h                   |  42 +++
 include/uapi/linux/media-bus-format.h         |   9 +
 include/uapi/linux/v4l2-mediabus.h            |  18 +-
 include/uapi/linux/v4l2-subdev.h              |  14 +-
 include/uapi/linux/videodev2.h                |  22 ++
 17 files changed, 874 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst


base-commit: faa4364bef2ec0060de381ff028d1d836600a381
-- 
2.39.2


