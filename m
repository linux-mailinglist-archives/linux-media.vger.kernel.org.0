Return-Path: <linux-media+bounces-23887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB94F9F9316
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 397A7169BCC
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA58215710;
	Fri, 20 Dec 2024 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3SRAdRO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8630C2153EE
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 13:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734701075; cv=none; b=AXgHq8h7Bd52b4jVuYwl2UFMH3ker31RO2PswcngyzjGtgPaAkmvrMkgQ+heri+QPDR4dP20cu4daU8Ema2iHsibJ4PH1AhAfsBsjVULrmzhiXDdkg3xodyc+hvyV0ZY9A4Zy+itDToXfTgKqPMBzyOaAzb1r3KWTYv6o8Z0FKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734701075; c=relaxed/simple;
	bh=mdR+KhpA+y/KBBzacO9XS1bWXWpwO/6i9OZXqDQnl0A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bac/HTwH8V6IR9LCsl6/ERzIlWfg4TzXm7hR5uIO96fIM10rNRT5VqUSoG3m12GoB60cGpgCJmd4GtA4QseX3GxCGWDxmrh5TRKPdqMy6NQ4exq82nIHKzO+Rwnh/x9N9lWOCaTbTvNipKBIkK48JpfCQU2t0NcyhvwTiaPAFuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3SRAdRO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734701074; x=1766237074;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mdR+KhpA+y/KBBzacO9XS1bWXWpwO/6i9OZXqDQnl0A=;
  b=H3SRAdROHuww7rmlAaImwezjesCT58qhF+wTVYPtw6q3pyjLWJzmXmXl
   jFQ5W+YzQ8+Rjs4kP/IPRIeZDc+hgmcuTwEaK4832x3ixDBiVONzmwSeU
   tmyMILvVlmTuo8P7TZ9Q8z6YO9M6zIrDOOWj8cwDGRIpePMDvYhzKJu23
   CjvxZ/BPFGcO7YN4f+m5cJAgNBoJoAc8x3ypaOKNqx5N3xSRjxogxIeTC
   4yXrn6F067yzd9Oeecu0/hJzNMBkx6nAIGa6DWv6b7Dce9F0O5do9HWzl
   wX/lah65CliHUYl39lJGKL//n9noiEHvSsjaMzYWiyg4apme0uG9jLb3M
   Q==;
X-CSE-ConnectionGUID: IrfY55tzTjSAeM11nd0NUw==
X-CSE-MsgGUID: wCkExC9JQ0elTaFPesUsJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45937537"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="45937537"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 05:24:33 -0800
X-CSE-ConnectionGUID: qOD1sUEzSvWxB8nuhnCYuQ==
X-CSE-MsgGUID: J5LX9W+AR6Cje2xYyHL/7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="98333207"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 05:24:27 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C056B11F984;
	Fri, 20 Dec 2024 15:24:19 +0200 (EET)
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
	Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [RFC v4 0/9] Sub-device configuration models
Date: Fri, 20 Dec 2024 15:24:10 +0200
Message-Id: <20241220132419.1027206-1-sakari.ailus@linux.intel.com>
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

RFC v3 is <20241129095142.87196-1-sakari.ailus@linux.intel.com> on LMML.

RFC v2 (labelled as PATCH) is
<20241122100633.8971-1-sakari.ailus@linux.intel.com> on LMML.

RFC v1 is <20241011075535.588140-1-sakari.ailus@linux.intel.com> on LMML.

We may end up postponing merging three last patches (those adding
controls) until current control values are moved to sub-device (and video
device) state. Discussion is needed on the topic.

The compiled documentation can be found here
<URL:https://www.retiisi.eu/~sailus/v4l2/tmp/common-raw/output/userspace-api/media/v4l/dev-subdev.html#media-subdev-config-model-common-raw-sensor>.

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

Sakari Ailus (9):
  media: Documentation: Rework embedded data documentation
  media: Documentation: Add a hyphen to list-based
  media: Documentation: Reword split of sensor driver to two classes
  media: Documentation: Add subdev configuration models, raw sensor
    model
  media: Documentation: Add scaling and post-scaler crop for common raw
  media: uapi: Add V4L2_CID_CONFIG_MODEL control
  media: uapi: Add V4L2_CID_BINNING control for binning configuration
  media: uapi: Add controls for sub-sampling configuration
  media: Documentation: Add binning and sub-sampling controls

 .../media/drivers/camera-sensor.rst           |  53 ++-
 .../media/v4l/common-raw-sensor.dia           | 441 ++++++++++++++++++
 .../media/v4l/common-raw-sensor.svg           | 134 ++++++
 .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
 .../media/v4l/ext-ctrls-camera.rst            |  40 ++
 .../media/v4l/ext-ctrls-image-process.rst     |   4 +
 .../media/v4l/subdev-config-model.rst         | 233 +++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   9 +
 include/uapi/linux/v4l2-controls.h            |   6 +
 9 files changed, 908 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.dia
 create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.svg
 create mode 100644 Documentation/userspace-api/media/v4l/subdev-config-model.rst


base-commit: 251513d49483c066e43c0bacd5650ffe44728584
-- 
2.39.5


