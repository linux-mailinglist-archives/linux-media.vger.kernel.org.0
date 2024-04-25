Return-Path: <linux-media+bounces-10126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F24C18B2AAD
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 23:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2630CB218D7
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 21:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E1315573B;
	Thu, 25 Apr 2024 21:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDMJfev6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B710154BFC
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 21:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714080447; cv=none; b=Yq6JiMacsqVGNJYY4/zvDt2rxxSACpTuI3KFEA+KqqMjsqmnds6N35vGkWub/iPEM8PAIuDbNHihyz5F4jwg3bVtco5Jr2xSU8DHYPnNc5Z9fFgacxWV7yfGgHeWwir/vkqMw0LjozGKe3XenaSeNZPzoncT8/08FWJNf8fiaRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714080447; c=relaxed/simple;
	bh=21sY7bFjQExwnyr7QLW09qZRKrZV2D2t3KcGVrFNa2U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Yekvxsidy59TBJWjZ/lTsxgtcBroM9Wtm8wYAK60qNsayyIQ3clCxkqHJUMIzS8IsC/izH9WNzvhgB5QBpnojSbQ0vvLbznVhnTHAqVfeIjWHcsCQ2aZbGFscuN5CoDZAOKaCzF2IWpujyz0m3+x4bpPDYCIWDcwgy4ZHyW8ASE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDMJfev6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714080446; x=1745616446;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=21sY7bFjQExwnyr7QLW09qZRKrZV2D2t3KcGVrFNa2U=;
  b=dDMJfev6KNz10+tDCLJqJZM/CQK8/uvRv7M+DUOHRa7f0VQ6tSmjVtQc
   /oyEk3vM4t5sK3pkyEeSYPBOtWCkncAvc9Ip3xjkqI4rqHGsvGGZ4fopo
   GAKcpsvVyj1gNrD77AVCYZy+mWWNSbqbMnkYHy6sRU6M1v+ujWXcPotUy
   zybl7PrEzNaMUS8EfXqOgGTpp/xp2TUozvmSeKk3tACMCxsa+1u/YxeQR
   iM1jD70BCDipl6FWps9OucXsEXT2SaL+JGUM4erDO6arZUBnta+sadtA1
   kwVlZkGHoHpZ9+4gnOR4IsCpNHNHIJ6lC0h1G0n7I7WcuRCE4RIYyZTV1
   Q==;
X-CSE-ConnectionGUID: a8xgR47dQdyp+tMBInwXoQ==
X-CSE-MsgGUID: dOJ4zwmKQDuaa6WdRMNNqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20487661"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="20487661"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:19 -0700
X-CSE-ConnectionGUID: 8IgD1AwBT0SO/qBN4gfYBg==
X-CSE-MsgGUID: fUH6FN4WSLywey24EtO7IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25305724"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:16 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5D6CB11FC19;
	Fri, 26 Apr 2024 00:27:12 +0300 (EEST)
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
Subject: [PATCH v2 00/14] Generic line based metadata, without sensor API changes
Date: Fri, 26 Apr 2024 00:26:57 +0300
Message-Id: <20240425212711.928300-1-sakari.ailus@linux.intel.com>
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
 include/uapi/linux/v4l2-subdev.h              |  14 +-
 include/uapi/linux/videodev2.h                |  22 ++
 17 files changed, 881 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst


base-commit: e42a204f0519a2540f1507ac2798be2aeaa76bee
-- 
2.39.2


