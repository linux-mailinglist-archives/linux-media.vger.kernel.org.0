Return-Path: <linux-media+bounces-23889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B2C9F9329
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2044188C9C0
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7855215F47;
	Fri, 20 Dec 2024 13:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIt5yBXG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A457F215707
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 13:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734701081; cv=none; b=X9sCAsNitufJBsXn+dAAbJi6ma29pSGmBTabpvsErPMpVn1ReYFvtYH6J9YAp/jzG1m0AXjzUvrVlzuI/C3N/dZjjH2H02PQCcb0i2YgiWXiYqMoYQhG9FNQmdRruQErTuJ4ppcui02WgecsUY1xDpnxAZKHOq5sd4OVEyelv3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734701081; c=relaxed/simple;
	bh=SKwaAoUmQHNMztRdyl8MMQYFhpacjG9ZHGa8rQn9uwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lWTWl9IJJynrnobgC4DJbxXJP8SBZBOEpdsPAoZ7dWm3gO7sJSXkY+L4WjL5Hl0P6Xz/VcpcUi8dvomLY+xxI6rProtLzaJqzrqJNMBG74/Bd96QYjWabkHH2g+m0K6AjDblsxLbgyVYRtJu7A8bqPBfdxdY0ULPH0Kb+aey3iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIt5yBXG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734701080; x=1766237080;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SKwaAoUmQHNMztRdyl8MMQYFhpacjG9ZHGa8rQn9uwQ=;
  b=GIt5yBXGkmPrIqGOO+IY5x/x+2EG+MdMx8WMqVEnk/QZFnSC+UBcnVJ7
   kh/hgdy4FgNBY6D0uUbpkJRbk3n8+4Hw5ZnDqlNw+3eFA40VOw9u8Bnhi
   uHiN/OnCWAWxJ2TLg5MhshJheUCxavpsSfWLoFGvBiBJA2TK7TJMXHzrg
   00MRK+mp4OroABruf5NSFqV2ZZDl9hwSPdwP3SOiXHK4nwbsUY4kMB37E
   6KDBMaWhCUphMZakHRpROgKW/QYaK+kXKnXqIjQajhBURhVXOx4EOjamO
   0VH85YX2/qkhrIAxF5ZSEzjR7WkjSoDuhWR5OgneWSqNpxtj+4rMUz9Ev
   A==;
X-CSE-ConnectionGUID: x3HfkSIuR8ePXAYlPaTtpg==
X-CSE-MsgGUID: W0bZtyriS1mQ+N9zUCgaVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45937568"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="45937568"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 05:24:39 -0800
X-CSE-ConnectionGUID: 3V9TP5DeRCWw4vnSclKkhQ==
X-CSE-MsgGUID: proboxxMShSuR6oOIPMZRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="98333242"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 05:24:34 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6D365120867;
	Fri, 20 Dec 2024 15:24:28 +0200 (EET)
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
Subject: [RFC v4 2/9] media: Documentation: Add a hyphen to list-based
Date: Fri, 20 Dec 2024 15:24:12 +0200
Message-Id: <20241220132419.1027206-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220132419.1027206-1-sakari.ailus@linux.intel.com>
References: <20241220132419.1027206-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a hyphen to list-based for uniform spelling in camera-sensor.rst.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 Documentation/userspace-api/media/drivers/camera-sensor.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 8e1083417ae1..9a1e8aa9fc77 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -26,10 +26,10 @@ of cropping and scaling operations from the device's pixel array's size.
 
 An example of such a driver is the CCS driver.
 
-Register list based drivers
+Register list-based drivers
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-Register list based drivers generally, instead of able to configure the device
+Register list-based drivers generally, instead of able to configure the device
 they control based on user requests, are limited to a number of preset
 configurations that combine a number of different parameters that on hardware
 level are independent. How a driver picks such configuration is based on the
@@ -67,7 +67,7 @@ is pixels and the unit of the ``V4L2_CID_VBLANK`` is lines. The pixel rate in
 the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` in the same
 sub-device. The unit of that control is pixels per second.
 
-Register list based drivers need to implement read-only sub-device nodes for the
+Register list-based drivers need to implement read-only sub-device nodes for the
 purpose. Devices that are not register list based need these to configure the
 device's internal processing pipeline.
 
-- 
2.39.5


