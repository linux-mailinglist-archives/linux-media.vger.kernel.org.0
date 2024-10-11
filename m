Return-Path: <linux-media+bounces-19400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCA9999E95
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 09:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 739B8B21E32
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 07:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A645320A5FA;
	Fri, 11 Oct 2024 07:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cOj5Ub6L"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09941207217
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 07:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728633347; cv=none; b=gTFxxPKBYBKdPxPYDTHyGa4BI2vX2RN2gcte9lB3f0s5BZeD1UDf+AxZhkm8VBXRvTsCNOf2DCgp9y2QFAzNXp8VSHNjPNA2/r27gSUZshOPEN/DgWZIiCDyBKmxHwm2JNj75CywuigPqXFsPtchT/XsP8yspjzrTLBGj0f1q/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728633347; c=relaxed/simple;
	bh=65+QkQAXt0+VnQdL4XI20igxUcqJH4Ka/R0oxqybTAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sfRc9wAs4L1N+jyEcjpGG4Gd2HACFLgsSRzBblHuzEFnICs/vQPw9YZfyuGqkJQKXqNJkhv5Ka/arbUI0fmgwMM3LlMlOZlMIwaCgWzNG93MgdbyqaLRmpq9hgWn/EXClmzNHoEv5SpinNBFtLcKD9KBd48XxoBk+suTTRZJQk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cOj5Ub6L; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728633345; x=1760169345;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=65+QkQAXt0+VnQdL4XI20igxUcqJH4Ka/R0oxqybTAQ=;
  b=cOj5Ub6Lzkt1O2biI9TtLtnRnZ8pjEwygrs1TB4+VdgAMbbNey27gY7c
   flsIYNCSrfcIE+f5DolHHRmS0y/CLkuxi7RLZzQJJVkpgqLmLLArU1HzD
   AZsVyoYceK3z7tkBzefPp/Hj/0P2LSO+ThS8VwMSVilBknAntaQW7qLeJ
   8qTzhCb9S1+zLhX3JevJCmwBybCPoVV4+JL0iUcoxxeuf+oY4bm5o3UZk
   AjFbhEdRruxGvSrrflTfLTK4r18KZavjqBuEq5PlH2at9SGRlJV35HEiN
   5C2QX2yzOYwdCBDP24h3caVvAzNExHJ7dhEltEGVuAqfXs7xSj6OUtSGv
   Q==;
X-CSE-ConnectionGUID: WndjXcoCRfOMfVE9POlfyg==
X-CSE-MsgGUID: wf2N+jaPQcWBobm3N5QKwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="30898375"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="30898375"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 00:55:44 -0700
X-CSE-ConnectionGUID: MHMJedvtRQChl1j7cM19nQ==
X-CSE-MsgGUID: 4QqPrd0QTVGXVKwFHDYJIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="81826875"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 00:55:41 -0700
Received: from svinhufvud.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1E13D11F855;
	Fri, 11 Oct 2024 10:55:35 +0300 (EEST)
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
	Naushir Patuck <naush@raspberrypi.com>
Subject: [RFC 0/4] Sub-device configuration models
Date: Fri, 11 Oct 2024 10:55:31 +0300
Message-Id: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
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

The compiled documentation can be found in
<URL:https://www.retiisi.eu/~sailus/v4l2/tmp/meta-format/output/userspace-api/media/v4l/dev-subdev.html#sub-device-configuration-models>
and the patches here
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>, i.e.
they're on top of the metadata set.

Sakari Ailus (4):
  media: Documentation: Rework embedded data documentation
  media: Documentation: Reword split of sensor driver to two classes
  media: Documentation: Add subdev configuration models, raw sensor
    model
  media: v4l: ctrl: Add V4L2_CID_CONFIG_MODEL control

 .../media/drivers/camera-sensor.rst           |  28 +-
 .../media/v4l/common-raw-sensor.dia           | 441 ++++++++++++++++++
 .../media/v4l/common-raw-sensor.svg           | 134 ++++++
 .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
 .../media/v4l/ext-ctrls-image-process.rst     |   4 +
 .../media/v4l/subdev-config-model.rst         | 182 ++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   5 +
 include/uapi/linux/v4l2-controls.h            |   3 +
 8 files changed, 788 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.dia
 create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.svg
 create mode 100644 Documentation/userspace-api/media/v4l/subdev-config-model.rst


base-commit: 8e1285c798e1c1838a1ba68497849b2f57969fbc
-- 
2.39.5


