Return-Path: <linux-media+bounces-21816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 037EA9D5CEF
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C7F41F22AED
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DDF11DED7F;
	Fri, 22 Nov 2024 10:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ebz4/jNV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2A61DED40
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 10:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732270016; cv=none; b=cgNPKPQwrdtb22SZi5Q7VfHmQp3HqUdQ8RivSRjYej0a+oXq0DAyxZncVjRVCjjC9TBgPGXglnPSS2FJBoAZ6QaoUcBaFHL1hRtFEd/GPtCnXVSzELqIaU+ZxeVXUtT0YhPr7dVs9E+HrubwbHzVqPRoLOpsf51ipQYXemdj0BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732270016; c=relaxed/simple;
	bh=rVnOq5gl8vm4qwKDW+jqyd/qDHgceKWgivdetFjUAIs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u19BslE0BgEN+EkjZBcf3ykLO9ZChqdM5GE5RWKOV6M/xbGS6YaDMq9/zc6MXau9V7DWXoz2mDSSku95jTIlQ8dD2WchLQapUxxZx4dyS9XWdrLOSoeVmrFLlH+Nw/h0smPUak2nqk6hsXgXZowbbFKBBqMdRuR8/z6Tx7YGW5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ebz4/jNV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732270014; x=1763806014;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rVnOq5gl8vm4qwKDW+jqyd/qDHgceKWgivdetFjUAIs=;
  b=Ebz4/jNVlvUudFnZIcHWHj7HvTBHHALdFttLfuHqac12PiQn++S3yvMs
   udBLc1KO9jKpvceNSQrLoJhNGqG86eYj0+0T7lJTzJiDHesja45Ty+1SO
   v0VQwdtKwTq9in3oI7Cq/NnhgIU4ierA9ZfBS6C7KfS7PnnZS2g3g3o0s
   jfxLPhAQCbDwgmKAkHS60n2PrMjb5X1R9Ih4+MlTGWgukQ49utgQvIbuZ
   0aZyCUZMVjESE2hdiIy9aNZ4KvooR55Yx45YA2maZWdyt2a0MpndsAWQ5
   PDEvxlMz04Uwv8l592ErZ+F1kJ0eU6SDMut9ahZ+aKTp8DuhzkD61DPLf
   Q==;
X-CSE-ConnectionGUID: 3XwE2YKMSoCYT6YujKYp6Q==
X-CSE-MsgGUID: eu1QN4uTQBmszMYLHCD9iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54927576"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="54927576"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 02:06:52 -0800
X-CSE-ConnectionGUID: ovSzgAyYTKyhLlYGQprL9Q==
X-CSE-MsgGUID: DXbMkWE0QNCJWbylvhgHdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="121403060"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 02:06:47 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 82EEF11F7E7;
	Fri, 22 Nov 2024 12:06:43 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tEQYl-0002L9-1Q;
	Fri, 22 Nov 2024 12:06:43 +0200
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
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 0/8] Sub-device configuration models
Date: Fri, 22 Nov 2024 12:06:25 +0200
Message-Id: <20241122100633.8971-1-sakari.ailus@linux.intel.com>
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

RFC v1 is <20241011075535.588140-1-sakari.ailus@linux.intel.com> on LMML.

We may end up postponing merging three last patches (those adding
controls) until current control values are moved to sub-device (and video
device) state. Discussion is needed on the topic.

The compiled documentation can be found here
<URL:https://www.retiisi.eu/~sailus/v4l2/tmp/common-raw/output/userspace-api/media/v4l/dev-subdev.html#media-subdev-config-model-common-raw-sensor>.

since v1:

- Rework the documentation according to the comments (spelling fixes,
  alignment mostly).
  
- Include separate patches for binning and sub-sampling controls.

- Allow binning, scaling and scaling to be configured using the compose
  rectangle. This will change to just scaling in the three last patches.

Sakari Ailus (8):
  media: Documentation: Rework embedded data documentation
  media: Documentation: Add a hyphen to list-based
  media: Documentation: Reword split of sensor driver to two classes
  media: Documentation: Add subdev configuration models, raw sensor
    model
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
 .../media/v4l/subdev-config-model.rst         | 208 +++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   9 +
 include/uapi/linux/v4l2-controls.h            |   6 +
 9 files changed, 883 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.dia
 create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.svg
 create mode 100644 Documentation/userspace-api/media/v4l/subdev-config-model.rst


base-commit: f188c7293d34f9ac50c1005da2613d519d97db83
-- 
2.39.5


