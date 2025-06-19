Return-Path: <linux-media+bounces-35282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A72FCAE04D5
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E5725A47D5
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0249C22E403;
	Thu, 19 Jun 2025 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="enp4kwrz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E23253F1A
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334345; cv=none; b=W4biMyHH0ez32VSBJe4L5fhQ/3IphvgxQRcHYVoBM/T4zgFJXIaSyc3t2UajaFsSZkHiVBIwYpvfatWIg8Jbk3r6fTLEFBDm+8PgkwxwB6yVVA9BxZ97Y9ePkCnIyPIga+s6sWJjCWHZp08E9j+pAMVrs0+sd0NctBlQHVCTMSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334345; c=relaxed/simple;
	bh=hREbc8iM8UbRLKsTfBg5/GDydBwc0j2g6sxpfLcdhXw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nztdjn7oqbl+L+v3NeNhoupHs9rwpd+ggR7lwkJNvY/JgOuKShDhTRewlv3VZGXpXkIYlCslizb9JP2ck5cfA0BYEBP0QZg0oIvoICo9+5eIaHxv7ff7VdUmUCPFvud60QsGLNy7g/5yoCS4fHor/zfyqPif/ZXSozi5inso+/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=enp4kwrz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334344; x=1781870344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hREbc8iM8UbRLKsTfBg5/GDydBwc0j2g6sxpfLcdhXw=;
  b=enp4kwrzCCZ7U+0f3kIHYf8abJdjTbC0SU3xpgrW577lRfv24OO+u3ex
   ZUKZ8x/lc2az+ZJMRPMUWkE+RtsAZ7B4TfuBQ5LtpF1RSNVuGvr9/wu/M
   Izb99+q5+YNo7e/rH1Ntm12EStlCck8Eg+CkFhG9xDPShSVXkfCf5ltgs
   JSW9DU/B3o8Jm+5qX3TUp9qinEa4eTITiBkVEp6sxRgP/d492tFJIg8fV
   t/jw7LBOXPRgRtzlKMRgKOchUK5UbwpK/okPSNld94xhP/Ngvk5q7/NSX
   4wXemlZe8m9fYXUunv1gymcL7lD14Ilp4GsxRFB41KwrAhbfXsR8/e72S
   w==;
X-CSE-ConnectionGUID: BcA/cPe8QFe5yBkSkI9iwA==
X-CSE-MsgGUID: qxzC0G4EQ3ybwrJ2/t0k/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386356"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386356"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:03 -0700
X-CSE-ConnectionGUID: 4lSkuxj2Qceey4gi6voB1A==
X-CSE-MsgGUID: bd7mMBnjSzqGFdh4HZionQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908274"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:57 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EED87121576;
	Thu, 19 Jun 2025 14:58:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDue-008AJQ-34;
	Thu, 19 Jun 2025 14:58:36 +0300
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
Subject: [PATCH v10 23/64] media: Documentation: Document embedded data guidelines for camera sensors
Date: Thu, 19 Jun 2025 14:57:55 +0300
Message-Id: <20250619115836.1946016-24-sakari.ailus@linux.intel.com>
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

Document how embedded data support should be implemented for camera
sensors, and when and how CCS embedded data layout should be referenced.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
---
 .../media/drivers/camera-sensor.rst           | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 9f68d24dfe0b..450e5940c6e7 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -115,3 +115,24 @@ register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
 values programmed by the register sequences. The default values of these
 controls shall be 0 (disabled). Especially these controls shall not be inverted,
 independently of the sensor's mounting rotation.
+
+Embedded data
+-------------
+
+Many sensors, mostly raw sensors, support embedded data which is used to convey
+the sensor configuration for the captured frame back to the host. While CSI-2 is
+the most common data interface used by such sensors, embedded data can be
+available on other interfaces as well.
+
+Such sensors expose two internal sink pads (pads that have both the
+``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
+<MEDIA-PAD-FL-INTERNAL>`` flags set) to model the source of the image and
+embedded data streams. Both of these pads produces a single stream, and the
+sub-device routes those streams to the external (source) pad. If the sub-device
+driver supports disabling embedded data, this can be done by disabling the
+embedded data route via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
+
+In general, changing the embedded data layout from the driver-configured values
+is not supported. The height of the metadata is device-specific and the width
+is that (or less of that) of the image width, as configured on the pixel data
+stream.
-- 
2.39.5


