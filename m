Return-Path: <linux-media+bounces-8317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9528E894811
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 02:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E07B8B211CA
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 00:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92606646;
	Tue,  2 Apr 2024 00:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uRE0soJw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3586D19E
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 00:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712016048; cv=none; b=KJbaK12nSQsqV9zOwKthdq7bQGKRy40tTihIWm/2PyQkgpHSadDIwjRQ1QNXew7WIf7KTExAchrk8GUqhAWcUp+jXxJdVou9yMPVikO/sTRmQCZ0wivJ9zVMeOEqfzE2ic986rYNfpwMkT1c1C1uaUxSyQY35cf4pI9rZpO1+UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712016048; c=relaxed/simple;
	bh=Z2pS7YguZAshImDxiBdMyns53lmI++lYdr7g80aiRlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E2XztzY2img4wtaU2vQpkzDdqDnYP7dxPnv/ttsN1xYBfirRIQbEQcESFab/wrA11q8/EWoyLArguuknv1LQ7/pv4r88nF1zJmueJpI+q0LFE8Ng7yVTtIjwtDt/M0yotmuNfMmfhfQFKVptgbYMO5M6otyUpzZGrJyTvr0+XXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uRE0soJw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 348BBB53;
	Tue,  2 Apr 2024 02:00:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712016007;
	bh=Z2pS7YguZAshImDxiBdMyns53lmI++lYdr7g80aiRlU=;
	h=From:To:Cc:Subject:Date:From;
	b=uRE0soJwSlSVyXHrUNHVoH5O7Knws2bPBCShLOqT6Hpm/Y4GRRysBddfeA6aUNgx+
	 DFYLqJiCnbrhB3cF3SiikLijXD+DH9OzJBvu04ooxE2Di0pHnW4H411IfsSDUC2TrE
	 hqqbKB1nYOFO6flR5YhLzCT9GnhBmzDa+MVNij8w=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>
Subject: [v4l-utils] [PATCH 0/8] Support for the generic line-based metadata support
Date: Tue,  2 Apr 2024 03:00:25 +0300
Message-ID: <20240402000033.4007-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series adds support for the generic line-based metadata
support API. The API is currently under development, with the latest
version v8 posted to the linux-media mailing list in [1].

The series starts with two improvements to media-ctl (1/8) and
v4l2-compliance (2/8). They do not depend on the new API, and can be
merged already. The next 6 patches then implement support for the new
API, and should not be merged until the API is ready to be merged in the
kernel.

This has been tested on a Raspberry Pi 4 with an IMX219 sensor, and the
in-progress work to upstream the Raspberry Pi Unicam driver. The kernel
code can be found in [2], and will be posted shortly to the linux-media
mailing list.

[1] https://lore.kernel.org/linux-media/20240313072516.241106-1-sakari.ailus@linux.intel.com
[2] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=rpi/v6.9/unicam/next

Laurent Pinchart (5):
  v4l2-compliance: Constify pointers and references in formats tests
  v4l-utils: sync-with-kernel
  v4l2-compliance: Support the changed routing API
  v4l2-compliance: Add tests for V4L2_FMT_FLAG_META_LINE_BASED flag
  v4l2-compliance: Test IMMUTABLE route flag

Sakari Ailus (3):
  utils: media-ctl: Print MUST_CONNECT pad flags
  utils: media-ctl: Support changed routing API
  utils: media-ctl: Also print INTERNAL pad flag

 contrib/freebsd/include/linux/videodev2.h   | 20 ++++++++
 contrib/test/ioctl_32.h                     |  4 +-
 contrib/test/ioctl_64.h                     |  4 +-
 include/linux/media-bus-format.h            | 13 +++++
 include/linux/media.h                       |  1 +
 include/linux/v4l2-mediabus.h               | 18 ++++---
 include/linux/v4l2-subdev.h                 | 14 ++++--
 include/linux/videodev2.h                   | 20 ++++++++
 utils/common/v4l2-pix-formats.h             |  9 ++++
 utils/media-ctl/libv4l2subdev.c             |  4 +-
 utils/media-ctl/media-ctl.c                 | 54 ++++++++++++---------
 utils/v4l2-compliance/v4l2-compliance.cpp   | 12 +++--
 utils/v4l2-compliance/v4l2-test-formats.cpp | 47 ++++++++++++------
 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 24 +++++----
 utils/v4l2-tracer/retrace-gen.cpp           | 12 +++++
 utils/v4l2-tracer/trace-gen.cpp             |  3 ++
 utils/v4l2-tracer/v4l2-tracer-info-gen.h    |  4 ++
 17 files changed, 197 insertions(+), 66 deletions(-)


base-commit: a04dfa5b72df01c6dbdf68fd9365e2d913fe5a0f
-- 
Regards,

Laurent Pinchart


