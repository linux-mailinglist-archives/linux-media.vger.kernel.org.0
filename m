Return-Path: <linux-media+bounces-21814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D009D5CEA
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:08:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A69B4B2324C
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89EE91DED58;
	Fri, 22 Nov 2024 10:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jTlHTv4Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDA61DE8AE
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 10:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732270015; cv=none; b=K8851jJOk8ra/v2QImVPr+VUzIprFfNp3Rsw1Vy6WUSVPnNAkQwOSfKGQGBdPDKYmLZQNJPvxavK67VTOUNp/sX/pKtOHw5w9+EWJ06Ivt2x99aZhqbSDPnHD+2cGs59Iv6lMi67eRwUUJxr1rzob3rvnMey2Fz0h9//IYfH2ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732270015; c=relaxed/simple;
	bh=GOUmuNjlGwOIXgFKU8v6cjYwNnkXfejm0Glqg0u2qmw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GOBUsaTM6hocaG8q7mQulZWoMyXzgpx9sl+pLiSVVeT312A5+6Y0OZbd/Mg/VGEcatmBHLMdX1JE5xFpEXQ147Wr+OLKndZhM27GciwAwLMnZqvZQOYUIvCwYX3na9cWtIbMmd+VFtCiA3P9l5jTWhas1yETBoEWPMmXUl5WbGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jTlHTv4Q; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732270014; x=1763806014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GOUmuNjlGwOIXgFKU8v6cjYwNnkXfejm0Glqg0u2qmw=;
  b=jTlHTv4QfDuiq59MpZDD7DjXvE9HVX2fbutT6gfxNGdqIg2oplEKV5AK
   L+0m8cGgmrYqsqnG2CrUNVjEhgr+uY3GeeFKclDVlIepz7zYDGahWMRzI
   IX4zhKvpzpYvX6UohgIHbDDZ5hi3GcnbQQhf8yHuoosA0f70q6pjgpA5w
   UXZLjfGpSXZyvXHBjR6Ku/eIqLXQ5RHypXlm226uZg4K0l3PqRGaoTnPq
   kzQc0r1SyHqhlYEA0kNuyrGs6ZKUnTPXgKGjcm0z76fZp7d7/gGnxplJE
   Sn7we/9jLGHwCz0UGXFwobmQuljeUliEqBWWBTx+RTcxYf2/BUVah/JKm
   w==;
X-CSE-ConnectionGUID: JFH5du02QPeHAW/WCvWS4g==
X-CSE-MsgGUID: yNfqxS3IRlW+7rm+z+15vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54927564"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="54927564"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 02:06:52 -0800
X-CSE-ConnectionGUID: 2E17zx9RQQGDP4682t/jHg==
X-CSE-MsgGUID: cqjxoUJJQ6C45WuojbYJmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="121403058"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 02:06:47 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8B66511FBC5;
	Fri, 22 Nov 2024 12:06:43 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tEQYl-0002LK-1m;
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
Subject: [PATCH 3/8] media: Documentation: Reword split of sensor driver to two classes
Date: Fri, 22 Nov 2024 12:06:28 +0200
Message-Id: <20241122100633.8971-4-sakari.ailus@linux.intel.com>
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


