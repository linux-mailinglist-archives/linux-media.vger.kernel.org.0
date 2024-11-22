Return-Path: <linux-media+bounces-21813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B229D5CE9
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 217161F22C2F
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734A11DED4A;
	Fri, 22 Nov 2024 10:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUKCCGvn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A31F1CB511
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 10:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732270013; cv=none; b=Oz1YVLCyzuGGzv7Gn/BuVEM/uyqOY0x5UzUlIQ8rAHNLyZtz0tcoQl6/3ZH6DcsO43w5ReibE7cfdE5fejJDC70OnE5K3RGeVjPlWWMMqaIf3GK0I8bvFbTKCuvv6zj1P5Y6wnOdDdIiJWicqaOFZiWMhsuydUQ2ZrGMIzwj2tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732270013; c=relaxed/simple;
	bh=YHHRXc1Nk7+uk0tqKGKzJ7qLUYSa7KX1dRjkg+mL3Dc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RyyCFAJ4PD3nJbtBUmu5XtN55ypsotysuRLV5ydsXTOT3ESwievSss33hM4KR4fttL1dHuissHeKRbZax6KQXZ+M/ZGjhBfZ7PK522NwJCw6ZEpa6Qou4OQC9qLuw1y9el76E5bO2Wj2jjPogKzhBsmDDQFCbtuZRgTlAX6At6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUKCCGvn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732270013; x=1763806013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YHHRXc1Nk7+uk0tqKGKzJ7qLUYSa7KX1dRjkg+mL3Dc=;
  b=UUKCCGvnErThJknRUdYqmt/J2yxiS58NQmbRbAgqaxNgNKfrnkvqUf79
   F02ojfVlINCeUqvvJU75VEN/pXj2awDNCxX8252vAftg+k5E5so4gZR2b
   JQN0yGpajKVamVmTWi0Vq4hg4gUzyslc412T6BuoWmKuqYzDxj2DpTqur
   ovMaj5Oii3dr7hnHA46h2lBcBz3b05zgwK4qP4VNTPRx5489BkfqxVFu3
   DbIcununzdjoFcD2Idh59l7WfGXutoxbhU/csxLUG/l8TZoEMEKkRWLch
   MHCHMopp+SYJoa9ThpWeiDn2terJKGr4TBXhpIGsAC2c08u1XeGtUjaDB
   Q==;
X-CSE-ConnectionGUID: CJhaJsPIRHq/LUibYjUmbQ==
X-CSE-MsgGUID: ANBsle+3TNSw+2slLBM/UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54927551"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="54927551"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 02:06:52 -0800
X-CSE-ConnectionGUID: CbbhwVh5SpaIEZuU6JTgAw==
X-CSE-MsgGUID: 9QR5/WfQTSywBAXqqZTsdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="121403056"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 02:06:47 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 864AA11F996;
	Fri, 22 Nov 2024 12:06:43 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tEQYl-0002LG-1h;
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
Subject: [PATCH 2/8] media: Documentation: Add a hyphen to list-based
Date: Fri, 22 Nov 2024 12:06:27 +0200
Message-Id: <20241122100633.8971-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241122100633.8971-1-sakari.ailus@linux.intel.com>
References: <20241122100633.8971-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a hyphen to list-based for uniform spelling in camera-sensor.rst.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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


