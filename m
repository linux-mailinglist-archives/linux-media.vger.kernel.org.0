Return-Path: <linux-media+bounces-31345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3577CAA3C27
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 01:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC46F188B6BB
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 23:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FAB2DAF8F;
	Tue, 29 Apr 2025 23:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N3yGx8E2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9929913AC1;
	Tue, 29 Apr 2025 23:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745969355; cv=none; b=HXC5cFhFLn9TB9ih3E9alkQtO/DkkCtfr5x7h+ULjHLO7BjJe5AtSijOyAP3q9ReW4XqilSAaRWQ5eWMgH4Hchwj4kLdVCzJtcdxC18b/VV5jU+RJkyLqj3a6yVMlvtyzAR3O3ecjCVNYsQYa0Rb+llUjJ7SFXV8VxA5OLeyxyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745969355; c=relaxed/simple;
	bh=tmRhTFXHrQmrX/dM5zphfOFbw54VlTM57upwCbDJDfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DxHo5RpHPbHmOYkEmJux6HrwG5vS7LO//zEwDsPS5qLuRP9OuQOaiZhSDDSiqeEK7sZvUZnRENiIcVEDSxIMdi4rgHdgr+QXIAMmZa3nJU9cn6XqDygW5Ops366xvn/4FE8N/l1/n889iN6t7L8XqQIKp+k/Xej+kDELHht4JT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N3yGx8E2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FBC9667;
	Wed, 30 Apr 2025 01:29:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745969345;
	bh=tmRhTFXHrQmrX/dM5zphfOFbw54VlTM57upwCbDJDfM=;
	h=From:To:Cc:Subject:Date:From;
	b=N3yGx8E2GGyjseSc3tkyyEstjVnMTefG/RtV7gWSsrdK4QgFxJmFAcK93GVw9Vkmw
	 WDaRzHQYBXW0zVpDaW0C4j2fDlVdVjl3Hx4STImKu31Wl8XJIW+avqHCQ5tjBZUsGc
	 sHLjZkN6ItThRUYQrA+IAFj2ZO6eiWZ/+p4f5uvM=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 0/9] media: renesas: vsp1: Add colorspace support
Date: Wed, 30 Apr 2025 02:28:55 +0300
Message-ID: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series extends the VSP1 driver with colorspace support. It
turns out that the VSP RPF and WPF entities can convert between RGB and
YUV, a feature that we have failed to test so far. The hardware support
BT.601 and BT.709, in both limited and full range. Proper configuration
of colorspace is crucial for accurate image rendering.

Patch 1/9 starts by implementing pixel format enumeration in the driver,
a feature that was surprisingly missing. Patch 2/9 then continues with
another fix, restricting the creation of the HSI and HST entities to VSP
instances that include them. Following with another fix, patch 4/9
addresses format setting on the RPF and WPF source pad to disable HSV
<-> { RGB, YUV } conversion, a feature *not* supported by the hardware.

After those initial fixes, patch 5/9 starts implementing colorspace
support by reporting the related information to userspace. The driver
currently hardcodes limited range BT.601 when programming the hardware,
so that is the value that the patch reports to userspace for YUV
formats. Patch 6/9 makes the YCbCr encoding and quantization
configurable, finalizing colorspace support in the VSP driver.

The next three patches are new in this version. They proceed with
exposing colorspace configurability in the API exposed to the DU DRM
driver in patch 8/9 (with 7/9 performing a small refactoring first).
Patch 9/9 then updates the DU driver accordingly, to create plane
colorspace properties and wire them up to the VSP.

The series has been tested with the vsp-tests suite and the kms-tests
suite. Patches that add CSC support to the vsp-tests suite have been
posted in [1], and can be found in the vsp-tests git tree in [2].
Updates to media-ctl and yavta to support setting colorspace on video
capture devices and on subdev source pads have been merged in the
respective projects, make sure to use the latest master branch if you
want to run the tests.

The series has also been tested with the latest v4l2-compliance. The bad
news is that the test flags 56 errors when run on a Renesas Salvator-X
2nd version board based on r8a77965:

Grand Total for vsp1 device /dev/media1: 757, Succeeded: 701, Failed: 56, Warnings: 0

The good news is that none of those are regressions, quite the contrary:
without this series applied, the total number of failures is 95, and the
diff shows no new error. I will therefore address those issues
separately.

I would like to get patch 1/9 to 8/9 merged in v6.16, to then merge 9/9
in v6.17.

[1] https://lore.kernel.org/linux-renesas-soc/20250409004758.11014-1-laurent.pinchart@ideasonboard.com
[2] https://git.ideasonboard.com/renesas/vsp-tests.git/log/?h=csc

Laurent Pinchart (9):
  media: renesas: vsp1: Implement pixel format enumeration
  media: renesas: vsp1: Make HSI and HST modules optional
  media: renesas: vsp1: Fix HSV format enumeration
  media: renesas: vsp1: Fix media bus code setup on RWPF source pad
  media: renesas: vsp1: Report colour space information to userspace
  media: renesas: vsp1: Allow setting encoding and quantization
  media: renesas: vsp1: Name nested structure in vsp1_drm
  media: renesas: vsp1: Expose color space through the DRM API
  drm: rcar-du: Create plane color properties

 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c |  15 ++
 drivers/media/platform/renesas/vsp1/vsp1.h    |   1 +
 .../media/platform/renesas/vsp1/vsp1_brx.c    |   9 +-
 .../media/platform/renesas/vsp1/vsp1_drm.c    |  22 +-
 .../media/platform/renesas/vsp1/vsp1_drm.h    |   8 +-
 .../media/platform/renesas/vsp1/vsp1_drv.c    |  59 +++---
 .../media/platform/renesas/vsp1/vsp1_entity.c |  22 +-
 .../media/platform/renesas/vsp1/vsp1_entity.h |   2 +
 .../media/platform/renesas/vsp1/vsp1_hsit.c   |  11 +-
 .../media/platform/renesas/vsp1/vsp1_pipe.c   | 188 ++++++++++++++++--
 .../media/platform/renesas/vsp1/vsp1_pipe.h   |   5 +
 .../media/platform/renesas/vsp1/vsp1_rpf.c    |  29 ++-
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   |  51 ++++-
 .../media/platform/renesas/vsp1/vsp1_sru.c    |   9 +-
 .../media/platform/renesas/vsp1/vsp1_uds.c    |   9 +-
 .../media/platform/renesas/vsp1/vsp1_video.c  |  50 ++++-
 .../media/platform/renesas/vsp1/vsp1_wpf.c    |  29 ++-
 include/media/vsp1.h                          |   4 +
 18 files changed, 442 insertions(+), 81 deletions(-)


base-commit: 398a1b33f1479af35ca915c5efc9b00d6204f8fa
prerequisite-patch-id: e3d9847d1da4398f1bf0b57f5ef4a612392c7255
-- 
Regards,

Laurent Pinchart


