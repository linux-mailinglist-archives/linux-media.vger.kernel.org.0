Return-Path: <linux-media+bounces-25537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CAFA2552C
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 10:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E1101886710
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77867204C3F;
	Mon,  3 Feb 2025 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YiXBZnni"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA5E1FE475
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573149; cv=none; b=Ke1p8E37sww/fqED+PTaZJ+nGY9p7QDPyiSiAiW0chpxSxeMyKZ0hat+9ZE53pw2CO/PopfveIvOs+7WqTA3dlXXq70xTAqsGPXvZxbajf6nhqEqINSiYgyzD+WRyM/Lfw5pZcvk22TnuUhS58+0SxxUYOyQPrgZCe9pIBDlNbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573149; c=relaxed/simple;
	bh=i0hRXVt85QW4pA93sUg830HG+dZksF1jxm4T0QPciWI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iM1PzXN7puJz2VacuikzfUdcH/mPl/Vf1fH9eKsPBCKVLohHfiRABoF5O7yj3Vif3bCp68VAwcWkyVCU2F96gJiGxHuiY4WWQh31SK78VBVZSkYuGsybjW1b8tlCsg2V5nrjzEjAD7aerwBqEkDcK43Gv+OWTL6O2Dnoqb5Gzg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YiXBZnni; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738573148; x=1770109148;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i0hRXVt85QW4pA93sUg830HG+dZksF1jxm4T0QPciWI=;
  b=YiXBZnniqu+D6S/JFv8T34MZhZcYCVp6GNcWKxDcu6WDZnIIOBYxsfNG
   Rq4/SNlR3bzJjSekbUa5gfz2FxBpu7QINHbLAyFIPudh7m+t7yvoEPK5C
   8WNeJl8ry8Qv5JwcwGtkfKw/l1FUWhlU0pKGwhjRI3KZyz0DUIBq506GQ
   nSh454wpdO2y16dAXd2kWDPVyab/1DvwVLrE0N8RS2t4oPpMJhiMkrXZC
   ko6AZhQcP0ACg5fDiqBhqqt5QlcsWijA/bzL8mXx9FMz2ElhQQMtJFRzi
   I+0hj4FVG5M/qtg4v+m/aXLZ9+ioREekt5UVKtrW0KB0QjDgq/kIUp24o
   w==;
X-CSE-ConnectionGUID: RAJwy0TzTFaRMOcsaY7EpA==
X-CSE-MsgGUID: xh1V+T+2RVC7qFAdjekXMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50472542"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50472542"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:07 -0800
X-CSE-ConnectionGUID: snKsdh/MSmiYnAYhpvOOCA==
X-CSE-MsgGUID: 0DbaUsGwQBSqKCzsbC8VYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110382904"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:00 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5673C11F9C3;
	Mon,  3 Feb 2025 10:58:54 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [RFC v5 00/15] Sub-device configuration models
Date: Mon,  3 Feb 2025 10:58:38 +0200
Message-Id: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello everyone,

I've been recently working (with others) on sub-device streams support as
well as on internal pads. The two can be used to make sub-device
configuration more versatile.

At the same time, the added interfaces are much more useful if we require
specific semantics of those interfaces, so that the user space knows
exactly what e.g. a given selection target signifies. However, as the same
selection rectangle could be used for a different purpose on a non-raw
sensor device, we need a way to tell how should the user space determine
how to use a given interface.

I'm proposing to solve this problem by introducing sub-device
configuration models, and by the common raw sensor model, also present in
this patchset, in particular.

This has been (and will, for some time, continue to be) the reason why I
have reviewed few sensor driver related patches lately. As we're
introducing a new interface, it's beneficial to be able to use that
interface right from the start, rather than trying to later on offer
compatibility support, which is almost always a fair amount of work with
less than desirable results in the driver.

With this solved, I believe we can enable the use of the streams UAPI.

Comments are welcome.

RFC v4 is <20241220132419.1027206-1-sakari.ailus@linux.intel.com> on LMML.

RFC v3 is <20241129095142.87196-1-sakari.ailus@linux.intel.com> on LMML.

RFC v2 (labelled as PATCH) is
<20241122100633.8971-1-sakari.ailus@linux.intel.com> on LMML.

RFC v1 is <20241011075535.588140-1-sakari.ailus@linux.intel.com> on LMML.

We may end up postponing merging three last patches (those adding
controls) until current control values are moved to sub-device (and video
device) state. Discussion is needed on the topic.

The compiled documentation can be found here
<URL:https://www.retiisi.eu/~sailus/v4l2/tmp/common-raw/output/userspace-api/media/v4l/dev-subdev.html#media-subdev-config-model-common-raw-sensor>.

since RFC v4:

- Document the use of luma formats for generic raw data on both mbus codes
  and V4L2 pixelformats, with new controls V4L2_CID_COLOUR_PATTERN and
  V4L2_CID_COLOUR_PATTERN_FLIP determine the pattern in different flipping
  configurations. This enables the use of generic pattern-agnostic formats
  whereas controls are used to express colour components and their order.

- Add a patch that reworks the metadata format 4ccs. These haven't been in
  use in any case so far.

- Improve documentation column widths.

since RFC v3:

- Fix binning control name in documentation.

- Note V4L2_CID_CONFIG_MODEL is read-only.

- Clarify wording in config model documentation based on Jacopo's
  comments.

- Clarify post-scaler digital crop behaviour.

since RFC v2:

- Remove the CROP_BOUNDS rectangle on the image data sink pad. It's
  redundant.

- Remove scaling from the sink compose rectangle, leaving binning and
  sub-sampling.

- Introduce scaling as well as post-scaler digital crop on source pad
  (image stream). This is a new patch, preceding control changes.

- Use monospace font for selection targets.

- Improvements in referring to previous configuration steps in text
  description.

since RFC v1:

- Rework the documentation according to the comments (spelling fixes,
  alignment mostly).
  
- Include separate patches for binning and sub-sampling controls.

- Allow binning, scaling and scaling to be configured using the compose
  rectangle. This will change to just scaling in the three last patches.

Sakari Ailus (15):
  media: Documentation: Rework embedded data documentation
  media: Documentation: Add a hyphen to list-based
  media: Documentation: Reword split of sensor driver to two classes
  media: Documentation: Add subdev configuration models, raw sensor
    model
  media: Documentation: Add scaling and post-scaler crop for common raw
  media: uapi: Add V4L2_CID_CONFIG_MODEL control
  media: uapi: Add V4L2_CID_COLOUR_PATTERN for describing colour
    patterns
  media: uapi: Correct generic CSI-2 metadata format 4cc
  media: uapi: Documentation: Improve column width hints for examples
  media: v4l: uapi: Add a control for colour pattern flipping effect
  media: Documentation: Document luma-only mbus codes and CFA for
    cameras
  media: uapi: Documentation: Use luma formats with CFA pattern control
  media: uapi: Add V4L2_CID_BINNING control for binning configuration
  media: uapi: Add controls for sub-sampling configuration
  media: Documentation: Add binning and sub-sampling controls

 .../media/drivers/camera-sensor.rst           |  66 ++-
 .../media/v4l/common-raw-sensor.dia           | 441 ++++++++++++++++++
 .../media/v4l/common-raw-sensor.svg           | 134 ++++++
 .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
 .../media/v4l/ext-ctrls-camera.rst            |  40 ++
 .../media/v4l/ext-ctrls-image-process.rst     |   4 +
 .../media/v4l/ext-ctrls-image-source.rst      |  22 +
 .../media/v4l/metafmt-generic.rst             |  10 +-
 .../media/v4l/pixfmt-yuv-luma.rst             |   5 +
 .../media/v4l/subdev-config-model.rst         | 233 +++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  12 +
 include/uapi/linux/v4l2-controls.h            |  27 ++
 include/uapi/linux/videodev2.h                |  12 +-
 13 files changed, 983 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.dia
 create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.svg
 create mode 100644 Documentation/userspace-api/media/v4l/subdev-config-model.rst

-- 
2.39.5


