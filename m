Return-Path: <linux-media+bounces-35303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEFBAE04EA
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF7A13A85DE
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42B5257435;
	Thu, 19 Jun 2025 11:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+0MDWi/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3FD22FF2D
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334357; cv=none; b=M17vszV6pN7Sp5Mc7ZXwQ2cPwpUpY6UTJET3H0MSVWJZDhrbEmWwKrj2yrtUGmmh1qqWA3RPYhEEFrHta9C09/BH6N4m5TWpKb2CFgczb7pg91JDGqTB1DqTcspG+tOIZFZInOPUVRj4T7cwSbIXgTfoYxwyOMYVsVVJX/16RMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334357; c=relaxed/simple;
	bh=lyo9EgD4GyOZe+Tp5Aq1jcfYUCrIvMn1RUKvjNLOWK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fOcFcYXYwCXXU3k4Rc8xlzgiee3rIjMBFJMJTjJljT6r8OHmnvtXRNkPh/BV4CTgARLAAC2/ejyYuy/Xxjdtqrfg+vTzdL45rV9Hes3Ak8NxYA9em6FcP7xktTrj7M5auV9hLdds23gnn0LgbvOw1GYYr/1s+YLNg7SJjRkIdrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+0MDWi/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334356; x=1781870356;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lyo9EgD4GyOZe+Tp5Aq1jcfYUCrIvMn1RUKvjNLOWK0=;
  b=R+0MDWi/duytw+t8X3ztiff+GF5KoGTxtjJcRW9oiQGbYcePJ6/RmFHI
   wiacqqD5FlmFoP6hE46yv65LPLFV2M1SsjvKjJyiJDIBUilfRNl4utBM8
   FOoOcvScYG0F36oJCSuW66zubnHPi9/7n+NN5eWu/d9moZVkHE2ZOs5mj
   +E5BzcFruRN6NC/Xf60rKxUzsmL4whHb8auRa+dj+8h+3y74+SN/Ed831
   HEdOEq/GQJb6wNjwq+2vaAzKX3BaUd7ZFliqIJrLA4b8w3thtJNp5KJPr
   quzEGNvJOMhGOWOGmBIVDIHdH0iXEzZ4o22Qm2oaKqKeXzwkFoYKCUCbo
   w==;
X-CSE-ConnectionGUID: 6IdG8IEsQKu1BqHxHXnuwg==
X-CSE-MsgGUID: cn9Lqa9VQ0K2x+xSWRTRwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386597"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386597"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:11 -0700
X-CSE-ConnectionGUID: dyBbF10GQXep/bSPt72NhQ==
X-CSE-MsgGUID: dUOXuREgRj6NZkeJNG5dXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908423"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2570D122E40;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AKT-0Q;
	Thu, 19 Jun 2025 14:58:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
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
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 36/64] media: Documentation: Reword split of sensor driver to two classes
Date: Thu, 19 Jun 2025 14:58:08 +0300
Message-Id: <20250619115836.1946016-37-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../userspace-api/media/drivers/camera-sensor.rst      | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 074b8ca11785..cbbfbb0d8273 100644
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


