Return-Path: <linux-media+bounces-24570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5225BA0892E
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 08:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 761843A919D
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 07:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80603207A02;
	Fri, 10 Jan 2025 07:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUk+RsS0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A11B2054E7
	for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 07:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736494770; cv=none; b=a45djpQHbJLR+Og3jDKLOVyowXyep7zH+Wgud5ap0Em3lcqCgH5Jz9hwsWLyDXzkxW5W/cF08xV+E7MqQSwSthTfLfRt7Mr1COFTzJ4i5OJ+DQSarcILRcauijaZR4ruW9Flt5WcQj/8njEgDM3dLwy5vjpogfYuuIkeRTWgC84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736494770; c=relaxed/simple;
	bh=mCOmXE1ppCoRzYDm1EtUJgBtn9mLEPyvTvZQEycZrag=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rQ7KnshO85GHgqyk8Ck7Pys1CBfUgSJJi/Ge1UTJIARsFtHkn+tN3+akwObVLQ8VGuFxuqohmRXuAg8OcPq1BP1dAFOE4qotdOvd7wJ3HiNOw42GqBPJ3p6+E0z/u1yledoifzKlpOIk0C4e+3Xx/YE6OjKVFuvIA0kEa+okmZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUk+RsS0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736494769; x=1768030769;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mCOmXE1ppCoRzYDm1EtUJgBtn9mLEPyvTvZQEycZrag=;
  b=SUk+RsS0K6ZG2FE4X6BQxbunQ5Gxwx5Nu6PYrVvWZcKocAfa/MYTB6yO
   qlvsfbJXvxUDL9nxKVvHd7xZk9QZtQ1xkXixG1020cjiNlIku4601XvbR
   NI8oOsqK3MWl3sAVv7G4LHuhjKvILyIn0S1IOFYggK536DePn6T6RXjle
   E3mWn8J0NS3redk6pzRzPsbqEiNbxozJ5/qGCzVqSFmnh+w9+2FgLmyTL
   KiZzJoj+MSc69wRki+Hu5IpmyGqmDqEMXXQwVE6s2xEJbl1cAPu0OXRdo
   bdDHVPcznWMox6zEQuVA9+qa9KXk3y1d+3NTXYUDQlSNIKbMAV+Qq7vXl
   A==;
X-CSE-ConnectionGUID: WLjyeMUQR+CNXZwtKJMkmA==
X-CSE-MsgGUID: UX8wrUWzQfiPYcaHwGK3Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="37011879"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="37011879"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 23:39:25 -0800
X-CSE-ConnectionGUID: ZUpSwwNtS5ihCZJZyPzgog==
X-CSE-MsgGUID: FxJRtKbbR7miJ4Jq5T8mWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="103844104"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 23:39:25 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 271A411F89A;
	Fri, 10 Jan 2025 09:39:21 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hdegoede@redhat.com
Subject: [PATCH 1/2] media: i2c: ov2740: Free control handler on error path
Date: Fri, 10 Jan 2025 09:39:18 +0200
Message-Id: <20250110073919.1228953-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The control handler wasn't freed if v4l2_fwnode_device_parse() failed. Do
that now.

Co-developed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 9a5d118b87b0..04e93618f408 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -828,8 +828,10 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 				     0, 0, ov2740_test_pattern_menu);
 
 	ret = v4l2_fwnode_device_parse(&client->dev, &props);
-	if (ret)
+	if (ret) {
+		v4l2_ctrl_handler_free(ctrl_hdlr);
 		return ret;
+	}
 
 	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov2740_ctrl_ops, &props);
 

base-commit: a68c3dd30c009c51676f7c3197c3fb853f9e283a
-- 
2.39.5


