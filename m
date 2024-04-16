Return-Path: <linux-media+bounces-9594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2100E8A74FF
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 527B51C2260C
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182A913BC2B;
	Tue, 16 Apr 2024 19:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkBiu0IS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B591139D19
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296068; cv=none; b=rAS/EwxyniLl8ZFI/mGd5BfCB9KoLS3yWaoltzkG3k2sASgX4Hh8DTc05zu8PA7OeS4UeFGY8tFAuP+ZdA7XdN54z8Z/HPd21zL6Rl1qjUXWfAUg3yEhGsZn0x1OwdLfJlI4RM1U4fV3zYL0S5rX+Yqo97XvEWsMIDkERqB4D0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296068; c=relaxed/simple;
	bh=AlD2csMLI217TCppbDyg023f1jQwntjFBxAMr4Nxm5k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eJ7dbvFptN7x7MuV/hhRQgzGwwJwwk8UfrAa4BXD+RuB7YxxmHAfYqzxOMa5sH9aBtr13drr87rR3I/yvbVWOpq7QsQhTsdEALCmhHQT3pzgoW75ISmPghCq69OKxAwIg2JWAybKIRt+kAEdxkakK5K6vXMyMFM/hpN2ROAz8oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkBiu0IS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296067; x=1744832067;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AlD2csMLI217TCppbDyg023f1jQwntjFBxAMr4Nxm5k=;
  b=CkBiu0ISXEG+J11X7ZauQWSx1KQlDqQnTV22BtRyh1R1gUHdOKnLPf6A
   JeVNksXsIf1S1F5Lj7vOr3ghqkmI7YFRB9DlmN0/VkKoe6LJ2Lz9eSHeb
   itsTcSS1L3ypFO6yDe4X/JatgTWP+GwrM39nvLIKkS61WyhFPWQ7cHgbf
   gk/Ss4UttYNenlg2Txy0x3oosgK4Pc6Utm55woVFLdw5h8JTrHDI7aCg1
   QuKz3qFuMgAM2giE09h6wUYeyrCQCcIeyvJkInPXW98pc/HjFQFjwcdeZ
   VsFLLvVg09ZHsbbcSQJQHRhnV/+4Bw+no7eF/c59vcEJ61crMJ7l4VGy1
   A==;
X-CSE-ConnectionGUID: cRGhaVzeSdSXB5d1eHJO2w==
X-CSE-MsgGUID: ZG1n5nn1Qo2qQOoaVfrz5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929917"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929917"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:27 -0700
X-CSE-ConnectionGUID: elgiOPVHQEOjP4iUZBioVA==
X-CSE-MsgGUID: uIGFwab6TNW/ZfGwichXvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22244785"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:24 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A795B11F879;
	Tue, 16 Apr 2024 22:34:20 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v9 42/46] media: ov2740: Add generic sensor fwnode properties as controls
Date: Tue, 16 Apr 2024 22:33:15 +0300
Message-Id: <20240416193319.778192-43-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add generic sensor property information as controĺs by using
v4l2_fwnode_device_parse() and v4l2_ctrl_new_fwnode_properties().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index dc0931308053..e37d824291fe 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -779,6 +779,8 @@ static const struct v4l2_ctrl_ops ov2740_ctrl_ops = {
 
 static int ov2740_init_controls(struct ov2740 *ov2740)
 {
+	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
+	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	s64 exposure_max, h_blank, pixel_rate;
 	u32 vblank_min, vblank_max, vblank_default;
@@ -789,6 +791,10 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	if (ret)
 		return ret;
 
+	if (!v4l2_fwnode_device_parse(&client->dev, &props))
+		v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov2740_ctrl_ops,
+						&props);
+
 	ov2740->link_freq =
 		v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2740_ctrl_ops,
 				       V4L2_CID_LINK_FREQ,
-- 
2.39.2


