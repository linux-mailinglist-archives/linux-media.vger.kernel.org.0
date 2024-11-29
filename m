Return-Path: <linux-media+bounces-22306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 054519DC1AF
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 10:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA078162DC8
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 09:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4217C1865E0;
	Fri, 29 Nov 2024 09:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/xZk1RG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124B4183CB8
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732873925; cv=none; b=SPzpD5UgFqPYdjgBAgTM2j2HS1OBd2e3CPjD3/Kmo8XpCz19DI4YgmVMyMfz+ddGSiqYO1OE9hRk0P/xjM2lKymStxzPAYXmkuazJ7jNRg274FqjbXKxjBQ5gXqMIW9fwbc/dzm0wr3vHmHCVI49AeDWTBkjRFsvd3ktRLldAtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732873925; c=relaxed/simple;
	bh=YHHRXc1Nk7+uk0tqKGKzJ7qLUYSa7KX1dRjkg+mL3Dc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gYy7gGj7ygl33G7UveWH4UO+L4cdOV028qjt00mGWfs3Jusv2dkG9xenaQiF99G5pTr/KIENKrGlS2P3DnOYngKZ/zAArzTEeZzcHCYZwfNZx/IyTbOxQoDOLfYo0VRj0Z4n7tfNxd3gxm3Z2vuIpl1cZxhHPNKg1Kyw5xpa/fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U/xZk1RG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732873925; x=1764409925;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YHHRXc1Nk7+uk0tqKGKzJ7qLUYSa7KX1dRjkg+mL3Dc=;
  b=U/xZk1RGY8TEbQMJCjlTtyIr78/i1PEGwxkuI+NmvLVkG0U+Cs/mAMbB
   d0TUOlpZm9Y6tURJ/BZqDnZLA9fwzk6WS3jHWI77Wj2QFTI3fLz8fpZNk
   WVlBXGbuFD8WiKWqNhEdWf0x12EIwWp8pIuU6dVkEAq4IOzwyJQFUAIqi
   a3nB6Hamj6MGk8ePigjzRL2J5nOMmKYdntB0VBoBNYC2Z1JnpdV+c1npv
   tpRRRrxlQw4Uo92fOFCjwL0wIWcqOajkc3715cO2pg2bTnL3tLq3jGDHW
   R8x/OyP3DWcYHZ4X9h/Q6why577n8xpWies2LeP3ns+KceGCjW19KiyRx
   g==;
X-CSE-ConnectionGUID: O2WLMlQQSI2LtCoGAqixiQ==
X-CSE-MsgGUID: bfU4P31BSM+M8uvUy8AJ+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36775967"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="36775967"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 01:52:04 -0800
X-CSE-ConnectionGUID: SGTYj1bJTHGs6weioY4MVg==
X-CSE-MsgGUID: pf4hT2AFRB6oicfcDPOjaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="92258536"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 01:51:58 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B7F9211FADB;
	Fri, 29 Nov 2024 11:51:52 +0200 (EET)
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
Subject: [RFC v3 2/9] media: Documentation: Add a hyphen to list-based
Date: Fri, 29 Nov 2024 11:51:35 +0200
Message-Id: <20241129095142.87196-3-sakari.ailus@linux.intel.com>
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


