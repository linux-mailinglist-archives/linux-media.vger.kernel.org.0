Return-Path: <linux-media+bounces-22307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EB89DC1B1
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 10:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54EA9162E7D
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 09:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B91318871F;
	Fri, 29 Nov 2024 09:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d5CLhl9w"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8967E1865E5
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732873930; cv=none; b=lnLaCG9xX09afsAen1jeXXDQdNvQyyigt3YzhRyIdw82NMxrX2/kGtj6zJTJ8G+uTrPzYxsmvpAUUqKpsLQyuxUqZ3y9szCcW+ZBkUQ7gA4SYtve6Jkfkow43HlyZlEGj0CrwZqc34PMLFkotERUTp1G/FeeRvHeEAFdpL2+L5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732873930; c=relaxed/simple;
	bh=GOUmuNjlGwOIXgFKU8v6cjYwNnkXfejm0Glqg0u2qmw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G3uq16MPnFKNmbZ/aXIW5DR2IltyMt2l33CpeBsd6j6WKsFvQ2UzoPTr5OVph9hDZQafGJFnWFYZ8ocwD2lLAL+SjsZ1Buf1BxMchZngPc7ns+N2fFzwxiL879kGE+NbgeBVQlH7apEA8SrPpWX2QMa2mKz9Ldk8cK15FpvLdKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d5CLhl9w; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732873929; x=1764409929;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GOUmuNjlGwOIXgFKU8v6cjYwNnkXfejm0Glqg0u2qmw=;
  b=d5CLhl9wZsPurU/85zMtqW8xM9T6zjH7GbUd1ycQkr74f1TMS+XDcySF
   3aPJKbiQHJKM/AZylHXkbhaNk3rmwPLIKH/Iu304RAfzBjruxivq3niei
   mmNcgEsw1mpONzo/Urfu8YNV8KQjjgFd8Do94Qps1rdRHKl1EazOfEKb1
   SfK0P5Rb0GmtqaO2KBmoL0JT2Bwzues0Rf1eeY2LvfnB1CgJ3nYJTkTx3
   vSEHUdSXt60TZZxin2kZ2+CVFfAF+LxGgWLeuXEF9a88eU9ZU9GnFI4CM
   dFTk9X5lDUOIIra2sAWTMBWzfR0k+Ei0mvz9VTBD68gyRwq3+5vgOrlaK
   A==;
X-CSE-ConnectionGUID: ZGx5ezOhRD6d/DfMOkfvlQ==
X-CSE-MsgGUID: Krj7jZCeRnG0yhVRB+Qzrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36775983"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="36775983"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 01:52:09 -0800
X-CSE-ConnectionGUID: csiaIYGVT3ObHXtfII8mBA==
X-CSE-MsgGUID: s42RrSMzQD+d+fqFiOGsCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="92258546"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 01:52:03 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 84ABE11F775;
	Fri, 29 Nov 2024 11:51:56 +0200 (EET)
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
Subject: [RFC v3 3/9] media: Documentation: Reword split of sensor driver to two classes
Date: Fri, 29 Nov 2024 11:51:36 +0200
Message-Id: <20241129095142.87196-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
References: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sensor drivers do not configure the output size of the sensors but the
entire internal pipeline. Reflect this in the documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/drivers/camera-sensor.rst      | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 9a1e8aa9fc77..bc55c861fb69 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -10,11 +10,13 @@ used to control the camera sensor drivers.
 
 You may also find :ref:`media_writing_camera_sensor_drivers` useful.
 
-Frame size
-----------
+Sensor internal pipeline configuration
+--------------------------------------
 
-There are two distinct ways to configure the frame size produced by camera
-sensors.
+Camera sensors have an internal processing pipeline including cropping and
+binning functionality. The sensor drivers belong to two distinct classes, freely
+configurable and register list-based drivers, depending on how the driver
+configures this functionality.
 
 Freely configurable camera sensor drivers
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.39.5


