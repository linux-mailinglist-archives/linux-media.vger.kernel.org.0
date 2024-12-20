Return-Path: <linux-media+bounces-23890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B109F9319
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D2BB169F34
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39713215F52;
	Fri, 20 Dec 2024 13:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNG5+icO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B24F215707
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 13:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734701084; cv=none; b=Mpwa5T8+xqrELtfZduk3504SM44aqNiCMmhNup6OUqyuNYiOEV/hcCIDCq5pDDLu316ouOv3VK2dFY+wYvrocsZjQ91nIZfgAT3qXyDEHHminW0UsA+QpleHM2PMRr2EbWeZoovv6D+3m0ZxN1GFdJ/CeWgXUyZiWrS77dTlijQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734701084; c=relaxed/simple;
	bh=iBppAmcg/4oeQmFNol3/v5Tdg5CR//+q6p+zX2mWQUI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EZjhv+gWD5W52S7p/ohf+WHKHRU1x2g+Fq3Jij98o71U7aOKLnycxdKMQiX8tRsMnU/CxzYRM4e5O0B56JtgzVWTP8Qapow3+xONQOCe6o0feuNy2bkEG/wMwVH2nvZ9sDHQEzvXG8Z0DHyMT3NB5wZ6gallhwUN+9K5GGd1UyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YNG5+icO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734701083; x=1766237083;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iBppAmcg/4oeQmFNol3/v5Tdg5CR//+q6p+zX2mWQUI=;
  b=YNG5+icO9IzUDa2R/Ba5oSE4/zrOzGd4wc0ke8XO2D0SiIJeGb2saoIC
   rrOjQ45F0wypKcL853muIzQbHy/22wAkm9wzs4GJUrOEEN/tni0KXybaP
   FMCkorv7UIoXLkAiA33ntRw8MMHLwQq8PQX4hWkp/O87yO1sFmzF54rYi
   0x+uBai5pHDYCARjeD8HlxucMXGFViUyne/lzGnnwawF0Ee2mdAqZscfO
   snJBRESy4KxX7wfnw9l9bXD2oVjklojKqlWBI1Y6T7ljrKly6w1h4kJe/
   EgpKMKFitScAHjG0hH0LU+sdEfCeXfLSqBfSXF5NWSfcHDXWZ4xzNPt4i
   Q==;
X-CSE-ConnectionGUID: O10yUD4ESeWyeY1txE9CcA==
X-CSE-MsgGUID: vJqxlqOcTm62NFIcIMoMMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45937583"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="45937583"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 05:24:43 -0800
X-CSE-ConnectionGUID: sRA5njW9Q8mot5Gut8EaSA==
X-CSE-MsgGUID: nvhYWyR9TgK6UwwF9N6mYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="98333251"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 05:24:37 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 28513120B3E;
	Fri, 20 Dec 2024 15:24:32 +0200 (EET)
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
Subject: [RFC v4 3/9] media: Documentation: Reword split of sensor driver to two classes
Date: Fri, 20 Dec 2024 15:24:13 +0200
Message-Id: <20241220132419.1027206-4-sakari.ailus@linux.intel.com>
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

The sensor drivers do not configure the output size of the sensors but the
entire internal pipeline. Reflect this in the documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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


