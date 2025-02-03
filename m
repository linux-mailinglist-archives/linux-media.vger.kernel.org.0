Return-Path: <linux-media+bounces-25539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A5DA2552D
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 10:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53A081666F6
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915CE205E35;
	Mon,  3 Feb 2025 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzQKsFpM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5A51FE47D
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573157; cv=none; b=HX+Bv7PsD3kPFQ8najh5wOZ5JtgeupIR7PPgt53MspCgr+tf6MGGusp/ez53XGs5HwjANuoVj3OcuYxurVhRTpMVeRyNYv8deQQ36HeuQ4zoAefQuKqCPZ5qx4MsLWqt0XYTwImwiyscAB/HQHek5FebsHPSvz/9EMox3Re4A4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573157; c=relaxed/simple;
	bh=K6qqTvaiF1u+v0Khv428uEMt2HzkXUBHV5NlRdmkX70=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XBp4rtmuLYcdz0LgMuTGnEzGBvcBcBNGkcFhJksXZWReiyANI19tKAqVFdNabaOCq5/4hawVbIQj3FKj79XPjxeZMGEmFJJ6QpiWoJw23JbSUIplsJW1jPiqbWA8tAduiJiM3ZIShsUmS3If6Wgy+59SpHAL2JlWtC1NDDwVENc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzQKsFpM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738573156; x=1770109156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K6qqTvaiF1u+v0Khv428uEMt2HzkXUBHV5NlRdmkX70=;
  b=RzQKsFpMHok8fBasaft9I2/RJWP7SVXuRNZqyBLKwim2fXt9phAgYyW2
   kEKHxYyS/VdcfnzNkW4UntvTMIFGQXschxoUjUVY3D7uH5roh1SALIAGr
   IBYLd0XRbig8wYd4kq0qzhONMNCMCdvGxI0v4lDvjJkosvpbT6QWt5zMI
   EJRB6jeXKQXx4enPeG9tsuRdt3V9XwQyzd11Plbpga9pJTBV4TMwtRhoc
   rx8Ol3DcIH6nCs81TXqRL5txIESLRS65TmIjeIu9Qr4O46abkDCc3sDcR
   8tIskeS5rTBbAhffkQzA4QgTBJvD9rcngFP/ufis1pBLbn0J/7IvRryzf
   A==;
X-CSE-ConnectionGUID: ERDu2oDCSR63+qWrUE/cqA==
X-CSE-MsgGUID: Esh4wBWIR9qc2y+wtUJGAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50472583"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50472583"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:16 -0800
X-CSE-ConnectionGUID: 15Z3YKfySv+QP/KScmsV4w==
X-CSE-MsgGUID: /hEe+T5nSvKJUqB+mwgD3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110382936"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:09 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 848FB11FC22;
	Mon,  3 Feb 2025 10:59:02 +0200 (EET)
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
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [RFC v5 02/15] media: Documentation: Add a hyphen to list-based
Date: Mon,  3 Feb 2025 10:58:40 +0200
Message-Id: <20250203085853.1361401-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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


