Return-Path: <linux-media+bounces-21815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DC39D5CEC
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47710B235E8
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503421DED6B;
	Fri, 22 Nov 2024 10:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBBTK53f"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540821DE2AB
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 10:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732270015; cv=none; b=YHVZYhtwr/SpwEyLO7oDiaGNLrYOgK/66IKheax2D6iOtRbWBlO7jx/02A0sZTOkKG2zdOv1imY9V3ucEnAidfphySg254gImIiZ55y6XXbhsG+l/Mt1Zegvz6ps6jiPAiKhpo1m14kHLdstBQKEisyuyUD81+OHDgrGK459Ht4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732270015; c=relaxed/simple;
	bh=WBfBUTc7foxaXJtaX15rqZrWhtCGrvhQTyIm9yDq+Io=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qZ8B3V7rNL4+t3HUqsAYPDwXBrxnARcNakMipCCB5VAuG6v2C3Wc7a1aXpoWMt1H97QpDFJWWIf/rVY4ZruAQDXS3qbHPfEphA3GqRzBbsFOR/43BYP1dWV5HBUlTjmycVVq+8iBlaSgUautl9zY7YWBE2AvCa5FeQV4ZiRoM60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBBTK53f; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732270015; x=1763806015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WBfBUTc7foxaXJtaX15rqZrWhtCGrvhQTyIm9yDq+Io=;
  b=aBBTK53frEr94wNsVycsY1nVm8kA0UuEsEIYTBXEjKArz2HdQexNZDzB
   YoWPy86zEuGOG/s8p+yx3bxtsrBel/rSBi8l6WcDAVnms+n/MPmRUpGlZ
   uGMOi6Agqo/eyugBSDKaU/xkxsLI08sscFWBCduB6RtrLv/EbDJoj/PLG
   jIOZKvHF/g35cRGv3mMZoiLd44pDl61quVaGzhoNdZox0nSuXwQ9rayPr
   zQt+qccwCnIyz1YL7SXHbDPe9zQyZZoACpeM77Bn8awwHj62fGeEsj3ty
   fpeRvGr72jj5OhFgGdXyZu+I9qc+VUl+RQS8jVGT+4vdgyGXCGATUPNJn
   A==;
X-CSE-ConnectionGUID: 6cplwV6SR3iwm3y1NhEpBA==
X-CSE-MsgGUID: gU+UJ59fTyGgG0aKkh1JKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54927587"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="54927587"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 02:06:53 -0800
X-CSE-ConnectionGUID: YUSP/h3/Rpq+FiukMwdAKA==
X-CSE-MsgGUID: bFrO0mUISKum/zp6Xl8zqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="121403062"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 02:06:47 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 848D811F8D9;
	Fri, 22 Nov 2024 12:06:43 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tEQYl-0002LC-1a;
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
Subject: [PATCH 1/8] media: Documentation: Rework embedded data documentation
Date: Fri, 22 Nov 2024 12:06:26 +0200
Message-Id: <20241122100633.8971-2-sakari.ailus@linux.intel.com>
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


