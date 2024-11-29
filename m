Return-Path: <linux-media+bounces-22305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0AE9DC1AE
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 10:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E0B02825C5
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 09:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F9717DFFA;
	Fri, 29 Nov 2024 09:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbJyGtKq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFCA189BAD
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 09:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732873922; cv=none; b=KF8VfCS3dhjT2//av1OT/1twsThdpJaRAxiT8VFYA5Zjt0BFVXp/svA9wLmhO50eE6HMoESI43uBh+PCIkkSjIY7Tg/NAryzYOpnBDyWF2FTlhp+Ej3U/CQvubhAX2Ukk4lziiCtsoHYMSc/GMvv+udnmyRn9SGgH48nIotxFMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732873922; c=relaxed/simple;
	bh=WBfBUTc7foxaXJtaX15rqZrWhtCGrvhQTyIm9yDq+Io=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aaLn/A7w0R4p1879+kyJAADbA+PERbLM8PCubNwzxu1g43ADSGjQIcNbcNeCS7a/r+27cipDkcnDkEo4mc00WWnUY5K8GDDp4i8skH3815w+c/GpRgszIXnoyotEcZa+CJJDSOS9AJAhF3GsbqGU8nk+sXZqixo7x9nNtIucnKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbJyGtKq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732873921; x=1764409921;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WBfBUTc7foxaXJtaX15rqZrWhtCGrvhQTyIm9yDq+Io=;
  b=HbJyGtKqGm+QHBO5k52sMwVMLv+JSntO8c4fVvnILtdEu/WsXC+UbBF5
   mcvIpgTmQ+KAIAjzuT4xnVXMidSxFKE76XqdkgVrBqUNkWB+Hkg2i1Msv
   /uVfnVOlK8CklkZPoCRHs+n4fdx5VENEEDvdCG9OV/GE1p2/0qVx6eoP7
   t7tGtfTr09Yb0hj6otkrIbtRCsrSalaCv4al+o/F1LigP1DTvrysHKR30
   sP2ToLqt8waz51JX3S/kupqbaPB/p+MryaQtBxFikNw+NygGOAAI0WxfO
   yBK0yZXoYb6dKEq2BMr+x66JXzSmoyAY9q+jeARAPiHPmBaQYf52TQOWZ
   A==;
X-CSE-ConnectionGUID: VMDCBIG8T2CKbg6TMu4dEQ==
X-CSE-MsgGUID: XTfc0dsbTj6lJZ0gAi2UWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36775961"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="36775961"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 01:52:01 -0800
X-CSE-ConnectionGUID: XKXzNP4RSG2UBhT9I041og==
X-CSE-MsgGUID: VPBuyoxCRg+RuaJgddUU7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="92258523"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 01:51:55 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CCA8011F9C2;
	Fri, 29 Nov 2024 11:51:46 +0200 (EET)
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
Subject: [RFC v3 1/9] media: Documentation: Rework embedded data documentation
Date: Fri, 29 Nov 2024 11:51:34 +0200
Message-Id: <20241129095142.87196-2-sakari.ailus@linux.intel.com>
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

Rework embedded data documentation by removing the reference to the pixel
data stream. The specific documentation of the embedded data interface
will be elsewhere, in the near future either CCS or common raw camera
sensor model documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/drivers/camera-sensor.rst   | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index dc415b8f6c8e..8e1083417ae1 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -111,13 +111,12 @@ the sensor configuration for the captured frame back to the host. While CSI-2 is
 the most common data interface used by such sensors, embedded data can be
 available on other interfaces as well.
 
-Such sensors expose two internal sink pads (pads that have both the
-``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
-<MEDIA-PAD-FL-INTERNAL>`` flags set) to model the source of the image and
-embedded data streams. Both of these pads produces a single stream, and the
-sub-device routes those streams to the external (source) pad. If the sub-device
-driver supports disabling embedded data, this can be done by disabling the
-embedded data route via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
+Embedded data support is indicated by the precence of an internal sink pad (pad
+that has both the ``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and
+``MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`` flags set) with a metadata
+format to model the embedded data stream. If the sub-device driver supports
+disabling embedded data, this can be done by disabling the embedded data route
+via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
 
 In general, changing the embedded data format from the driver-configured values
 is not supported. The height of the metadata is device-specific and the width
-- 
2.39.5


