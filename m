Return-Path: <linux-media+bounces-9182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9246E8A2EE7
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 15:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 155F1B22BE3
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 13:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACDD5FEE6;
	Fri, 12 Apr 2024 13:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bWjOx//D"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E56F5D91E
	for <linux-media@vger.kernel.org>; Fri, 12 Apr 2024 13:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712927357; cv=none; b=opEMnYaiIk+/IYhNW/gv6rH8YhjQJ/OzFd/S/qB4Y+BO8qXLT9A2rkWWwenxqIwrmsl3oN+iYHTHFf7Hj5pd38p3ogPK9/TSFo9m+uUvo9ZvV3Gptcacz1bsp+i3frUuLSEaNJv8vTlrdGUzR38KlCXhzqPMumJdlEQbr4DyVkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712927357; c=relaxed/simple;
	bh=TNo9tD2cdfJ8eCm6e/bnKFSdF0RLTn31oiUw1c5zpmA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DXN5ic95hqjsTpbsHhbeWEhBfgqN16LXyzuPmdlMjgsikMFt1zu+lIsA3x2S46l7nm+hjABN3ApC2sYS6QkYY/dddAvjlxv3P6eea+J6De73rfHZKOTj3Cy/YcyYpeKjHd3PWopxqOmQnuNP4y26L/I+GQhnduCViI9YWd1b7OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bWjOx//D; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712927356; x=1744463356;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TNo9tD2cdfJ8eCm6e/bnKFSdF0RLTn31oiUw1c5zpmA=;
  b=bWjOx//D+YWGHGIUTEzIHkXF+9A4vabPlWhZyC+iJLN+jQ2b0GM5+3YI
   yl1ejoWR1OscP/9pVkPf5rLnyq8p9JGsEwrFQrqYHhrD01f7G6tpTkozy
   AsUY3+NNVdJiWQMpHPC7YxB2lni6QrYvmLb1J9RAeHmPFFpPQ0U63lqA6
   bm7SmaZKkLisfjdeBVzq7o2wKtLlasHu/BBM2vYPdYZcGgFRWRXBcV9ar
   e/ex9/mRWscFzojn3iMk1uaKBdUx53Zc7IFDjQctOIk7yHX41Ppe1PY2i
   MhPh8ELLG/QgvOP+ckinK2JIkurTXv0XEP0k6W3MfgzFp4k81OrJHYt1S
   g==;
X-CSE-ConnectionGUID: QMOqzYCMQ+mhxFOZJOsy0A==
X-CSE-MsgGUID: uAlXrQO1SOOHEcB7+Pml/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="11341359"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="11341359"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 06:09:15 -0700
X-CSE-ConnectionGUID: duoGL+PLQdegOCOoMB0mzQ==
X-CSE-MsgGUID: xU1z0b33TQWtDERdutNDFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="25668946"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 06:09:14 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 06263120359;
	Fri, 12 Apr 2024 16:09:12 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1rvGeV-003Z5l-2r;
	Fri, 12 Apr 2024 16:09:11 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 1/1] media: v4l2-ctrls: Return handler error in creating new fwnode properties
Date: Fri, 12 Apr 2024 16:09:01 +0300
Message-Id: <20240412130901.849869-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the control handler is in an error state, return that error immediately
in v4l2_ctrl_new_fwnode_properties(). Effectively the change here is that
the same error code (handler's error) is returned in all cases instead of
possibly returning -EINVAL.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index c4d995f32191..670325ca995e 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -2564,6 +2564,9 @@ int v4l2_ctrl_new_fwnode_properties(struct v4l2_ctrl_handler *hdl,
 				    const struct v4l2_ctrl_ops *ctrl_ops,
 				    const struct v4l2_fwnode_device_properties *p)
 {
+	if (hdl->error)
+		return hdl->error;
+
 	if (p->orientation != V4L2_FWNODE_PROPERTY_UNSET) {
 		u32 orientation_ctrl;
 
-- 
2.39.2


