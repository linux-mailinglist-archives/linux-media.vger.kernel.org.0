Return-Path: <linux-media+bounces-50414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE5AD11AA8
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 589C3303987E
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130AB281525;
	Mon, 12 Jan 2026 10:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7iLO0yL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FB3280336
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212009; cv=none; b=MNp97XaqB/yqQwvCVZPH2tD4971fHmO4r6BV7t+TN9cS6i9W5pTLkD0xf6lHGH1yFPWRwDvKGe3YhIfq0N18+deDaz6k3ALe6ieg9OafM7zZsySto9+8jxNoDu42tm4kuS/LpmCJSXAqSVf103vjpQixResSb0Z6WBVpGmrhGQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212009; c=relaxed/simple;
	bh=XWS9bCJZzM2EqapOAJqSgfvxxPjMO9RW85BMLzumv4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQBJOCSxCvYZKIOTxiF5q/0vwpjfydbA5wTKd/k+lQYhZYtMVcy1KLxKgVrjZDnYZy5vmklVOopNekTvaUz2tR3laYDISeQKeL0SA6/LcSH0xhLhatVGnQ0lhShmgu3KIdZwmECZqJkZHjkPpeL5Dn1hxrYgygxJqqsGqwUA74g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7iLO0yL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212003; x=1799748003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XWS9bCJZzM2EqapOAJqSgfvxxPjMO9RW85BMLzumv4k=;
  b=H7iLO0yL1nWFbMHOOTO1BxC0n395BDhfRRPFWsEMQKoBbtT8bHiCHV/e
   3gu494Ztlbx+L3A3cs4q6JBBZq51Z+YHh5BNtul74oSYaXVdPX7RzQIOz
   h3lGGuBuCQQpK6x3xLBUsiLviso+z86nx47vNl0eVZaVs5jc3LH/pkeBx
   HJ0MDRDDRlZP5oOJYqpxWireHkd/3fRKuNdXN/XnNQuaXcCKvhytcceQI
   OctE7pVm6vWrqun7qGV9gj38xshKN0If5nozzrOFwvR9yzybkHbVn5HBY
   u/UP+Crwmy/M8sTE/2THxVN/ARIXGP15JNKCMlvC8tFkOb2jNSIeePeAP
   A==;
X-CSE-ConnectionGUID: DYAZzGXhQQuxXXU4lDWnGg==
X-CSE-MsgGUID: FeyGhhd4Q3C4GwvWnaAjQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218799"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218799"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:58 -0800
X-CSE-ConnectionGUID: 12newEW1TMa502P5PcSw/Q==
X-CSE-MsgGUID: dXlDnjT2Q3ergvi/iRIvpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743140"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:56 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 46514121F9A;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiE-00000000126-0div;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 14/23] media: i2c: ov01a10: Move setting of ctrl->flags to after checking ctrl_hdlr->error
Date: Mon, 12 Jan 2026 11:59:40 +0200
Message-ID: <20260112095949.3851-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
References: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hansg@kernel.org>

Instead of checking successful creation of the link_freq and vblank
controls, set their flags after checking ctrl_hdlr->error where it
is guaranteed that the controls will exist.

Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 747e91cd8828..6dcd982cf8eb 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -460,8 +460,6 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 						    V4L2_CID_LINK_FREQ,
 						    ov01a10->link_freq_index, 0,
 						    link_freq_menu_items);
-	if (ov01a10->link_freq)
-		ov01a10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	ov01a10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops,
 						V4L2_CID_PIXEL_RATE, 0,
@@ -478,8 +476,6 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 	ov01a10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops,
 					    V4L2_CID_HBLANK, h_blank, h_blank,
 					    1, h_blank);
-	if (ov01a10->hblank)
-		ov01a10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
 			  OV01A10_ANAL_GAIN_MIN, OV01A10_ANAL_GAIN_MAX,
@@ -516,6 +512,9 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 		goto fail;
 	}
 
+	ov01a10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	ov01a10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	ov01a10->sd.ctrl_handler = ctrl_hdlr;
 
 	return 0;
-- 
2.47.3


