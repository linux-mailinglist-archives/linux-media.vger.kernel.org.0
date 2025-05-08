Return-Path: <linux-media+bounces-32048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCD3AAFFF0
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 18:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6838E7A73ED
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 16:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7AF27B4E2;
	Thu,  8 May 2025 16:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bGLakc/N"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E24F1FE468
	for <linux-media@vger.kernel.org>; Thu,  8 May 2025 16:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746720538; cv=none; b=jb++xrmkommDENlfKfpRnmVNxn0x9oBLJ83fIWxaxjSVMHGQXCmabTaQdZ9eT2VSdmy5JTJ6h4EJfIGSGFRNfrJauLrs79aRlGYCYKmIuYTUhOKuQeT1SgOsy0eLZQ+wuLz3fwPVsLez+s67rNUMtbXzAYOoheYiahVlYFa/4fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746720538; c=relaxed/simple;
	bh=MgNhCc/J/z0H5SnHAUfAsyuEp8HEllwzvPNTtNdq1Io=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RjlwoBlmXVqMT2gqCODvdUjEY7XujWOvcYep6hmtB9I9Z/ka5g+PqEO1ImG0kx96LUsT3YaOArLbZ1X0rAfD1FgO7vmfbbO2gtNIzuc9mgWj/UMQjnc3op0X6Ngm51Q1j+RmceIQDWOyg9N5iuZlOtXG+5+E3iOzTe9/f7qHAd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bGLakc/N; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746720537; x=1778256537;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MgNhCc/J/z0H5SnHAUfAsyuEp8HEllwzvPNTtNdq1Io=;
  b=bGLakc/NkYSdv8f1sM1+HpEwfK0AyM0g7LpX1qTtgWFdx0uhR1jmTirx
   GhqYDgtGZucnRR4hCvuOrKa0l3cpE/fkOM2od/q/zAqyk62a0MNK7pmBk
   v8MFVKk3l2Oa9aWM0GDeg0vZyp6PPl83OBFa6yVAm/qv868u2bbWb96Q/
   q3IuUYZb5ubYQLQsSfXo6f1+/+yw3hfdcJEQul4+BhODp/AsBkB0sZDG/
   RpILmc8vfapWnHxe8JzztKBkypel7pig56Be11vQFvKWKxv4HXUx+RKaY
   IhBDhqUKGeRXkMQ8rUcHYYRDN9wsII3EPsRinAioGVJhsSkyAqQ1mByp/
   Q==;
X-CSE-ConnectionGUID: 1dAXz8FEQp2+7S+x6K8o2w==
X-CSE-MsgGUID: PvppYsJRQAGH2z1Xm9InYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48679080"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="48679080"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 09:08:56 -0700
X-CSE-ConnectionGUID: v9wvA83aSce4SP5RKdc8aw==
X-CSE-MsgGUID: FQYjgcrWS+Odxg0wiZOmHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="141461830"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.168])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 09:08:55 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B156611F90E;
	Thu,  8 May 2025 19:08:52 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uD3no-004Zhh-1o;
	Thu, 08 May 2025 19:08:52 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/1] media: v4l2-ctrls: Don't reset handler's error in v4l2_ctrl_handler_free()
Date: Thu,  8 May 2025 19:08:52 +0300
Message-Id: <20250508160852.1090549-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's a common pattern in drivers to free the control handler's resources
and then return the handler's error code on drivers' error handling paths.
Alas, the v4l2_ctrl_handler_free() function also zeroes the error field,
effectively indicating successful return to the caller.

There's no apparent need to touch the error field while releasing the
control handler's resources and cleaning up stale pointers. Not touching
the handler's error field is a more certain way to address this problem
than changing all the users, in which case the pattern would be likely to
re-emerge in new drivers.

Do just that, don't touch the control handler's error field in
v4l2_ctrl_handler_free().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi all,

This is currently affecting the following drivers:

	drivers/media/i2c/imx334.c
	drivers/media/i2c/imx335.c
	drivers/media/i2c/imx412.c
	drivers/media/i2c/ov2740.c
	drivers/media/i2c/ov5675.c
	drivers/media/i2c/ov9282.c
	drivers/media/pci/tw68/tw68-core.c
	drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
	drivers/media/platform/samsung/s3c-camif/camif-capture.c
	drivers/media/platform/verisilicon/hantro_drv.c
	drivers/media/test-drivers/visl/visl-core.c

The fact that one of them is a test driver tells a lot. :-)

The patch is untested. If we agree to do this, the patch should probably
be cc'd to stable, too.

- Sakari

 drivers/media/v4l2-core/v4l2-ctrls-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 90d25329661e..932aedc26049 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1661,7 +1661,6 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
 	kvfree(hdl->buckets);
 	hdl->buckets = NULL;
 	hdl->cached = NULL;
-	hdl->error = 0;
 	mutex_unlock(hdl->lock);
 	mutex_destroy(&hdl->_lock);
 }
-- 
2.39.5


