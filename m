Return-Path: <linux-media+bounces-25538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9343A2552E
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 10:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D1C5188828E
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81865205AC6;
	Mon,  3 Feb 2025 08:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mu0VG2iA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696C51FE47D
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573151; cv=none; b=RTl8O6ixzFDW+auXN0QD1lfR2RpLYAGDKqd4YLfYM0FSIGlFWraECUqQbQ2zHlGpfN0otkyFWT6yvDtWg0vJxCf0UPORia1eJtbkO5KrqOBTXRyKfVIQWFAzgILJbvg+Q2I/GM2IaDB0vaWIh/XgY9e/GibhmgBe9t+E6IbffXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573151; c=relaxed/simple;
	bh=wb6ckfnT3F2LaTpzZEkD0WrE05oukIrBrqVDH2YbYEY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IIqLzH1dzufmth6banwtDXgkraqIkC+WUWStCV12ylXeLCpa1y3VPLMDsoC9mbY9dWEnllF+zmLhznKvYehU2zrnn1OrV06i/QzVJMBdLFdiGKfjUjEjiFjy7wV+WVx9Ko7SkGfkttTukum+mMhaw8fr+uojzV5MX587LfhyfD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mu0VG2iA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738573151; x=1770109151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wb6ckfnT3F2LaTpzZEkD0WrE05oukIrBrqVDH2YbYEY=;
  b=Mu0VG2iA3TPXeE5TCf5LTD28ds09X33FIKlq27wm1s+Bj3k2ZwLFOGuh
   i/WPhiRx+YNPAog1NnvqaRNAQ+4J4Y5rFjyZanukdCXOOciMs19/Tqr8h
   29Bu9SBXrI32U1a68wNkw3FxE/qz5KzYbmCqlf12emcEOBKsBoC0/Qzy4
   8ztmips7nZtRyUiK133ASvFdzGbNQMkBa705CmSab1SMduB+tFvNg5xVm
   Tu9mpM3A+XA0pxWerybbEoWzxi4YqljlmBfhP68JvUOW59zMIzmnlirkJ
   td4pMmTukpNJhgOq92+Pn6ebeEUebsMv7GPn7R9zqeLFZC38OfMCGTQRp
   A==;
X-CSE-ConnectionGUID: evFESvFYTBi6MNVaLW3JdA==
X-CSE-MsgGUID: dF3TMHoMR8yAnEdYuhWS4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50472561"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50472561"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:10 -0800
X-CSE-ConnectionGUID: MePhPOhYQ266lyLAPhFFpA==
X-CSE-MsgGUID: GuHfCDjdQU2bMuxQvbQzMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110382922"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:04 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4B84711FAB1;
	Mon,  3 Feb 2025 10:58:58 +0200 (EET)
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
Subject: [RFC v5 01/15] media: Documentation: Rework embedded data documentation
Date: Mon,  3 Feb 2025 10:58:39 +0200
Message-Id: <20250203085853.1361401-2-sakari.ailus@linux.intel.com>
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

Rework embedded data documentation by removing the reference to the pixel
data stream. The specific documentation of the embedded data interface
will be elsewhere, in the near future either CCS or common raw camera
sensor model documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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


