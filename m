Return-Path: <linux-media+bounces-9561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 706DF8A74DE
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27B092840A2
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DF413A249;
	Tue, 16 Apr 2024 19:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GvCg9ShJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CB91386BB
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296021; cv=none; b=UtS6e7OiatPJPK0CCRNhpd0/8vlOtXGh7I4KRxCowS2BEuKortsi14feA3mO4STPtVydd7R6G11r5VYkGX6kGC4t5q3JLMZZpnuOH7Anw3A/Q7yX454kfmI7rMz+hmFrqM3jBYkK5OeaVcxeJg6rXYh0OI54weKqJ/C4jqBndJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296021; c=relaxed/simple;
	bh=LBqmbjO/9hPG6LNnIeJ8RVR1w+IqUKrEamvqKi204HQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c6hEeXId4Ba/hoW4cQ8lEpnex0e6h0PBIQwNJdvHwkYbNtCjzV7CorqFCosy4/A4e3yu/MBZZpe+74OsxV5S0wsRLPRszVNZMLaWHMNkPVgn0kI+8hl389GVuE2QJ29RvdKBZBbCBozkMXgp9Fxn4m+UnMM4h/r79fe1pIxjfII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GvCg9ShJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296020; x=1744832020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LBqmbjO/9hPG6LNnIeJ8RVR1w+IqUKrEamvqKi204HQ=;
  b=GvCg9ShJwMG4X03djYyW9b0quhfPAQK4c/zG8HH+JYXW4AbIPRYwoGRb
   Kk8CbXptNe4qKmVxJebg3p8MrMzKS/8V6OnGuD0TexmqQKUFhsyLiL9gS
   aphUkawrJ1kOkJC/Ve2OeNUSnXuO6D5vRq2Br0wGkV3J1Ett6VUFDioBx
   okhHS+8OMLT/0zsyVbDl0TzR+FX8G+tW3jcSvzL2g8Js9VXVVehYxXPCZ
   3UeagZQDZXdhRMPqjz+/6M4tMVhGNf0co0djSQG2zBMcswXlI9u78SINx
   JPI6ni6VXdRTP+PeqhbV41VU59Gwk7kFeIW2UhkZgT6ohoXbM4QEmLq0C
   Q==;
X-CSE-ConnectionGUID: 1ds7cvEPQIelVZeZoI6tOA==
X-CSE-MsgGUID: Pqyx+epURe2FgND2DC6DBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19906054"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="19906054"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:40 -0700
X-CSE-ConnectionGUID: rpVAknd9SmWBqlVven154Q==
X-CSE-MsgGUID: 3+fi41R2T4uCK8hD3pkRqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="27155276"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:37 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DA88E11F879;
	Tue, 16 Apr 2024 22:33:33 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v9 09/46] media: Documentation: Document embedded data guidelines for camera sensors
Date: Tue, 16 Apr 2024 22:32:42 +0300
Message-Id: <20240416193319.778192-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document how embedded data support should be implemented for camera
sensors, and when and how CCS embedded data format should be referenced.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
---
 .../media/drivers/camera-sensor.rst           | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 919a50e8b9d9..9f3b0da3ad0d 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -102,3 +102,24 @@ register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
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
+In general, changing the embedded data format from the driver-configured values
+is not supported. The height of the metadata is device-specific and the width
+is that (or less of that) of the image width, as configured on the pixel data
+stream.
-- 
2.39.2


