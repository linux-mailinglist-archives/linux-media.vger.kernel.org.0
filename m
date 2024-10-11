Return-Path: <linux-media+bounces-19401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 845DB999E96
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 09:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 134FFB22CAA
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 07:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A39820ADC0;
	Fri, 11 Oct 2024 07:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HO814w6e"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1CE20A5F4
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 07:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728633349; cv=none; b=eUSFEv4oPZlbE+53pGBRh191O+zUm8sHmglODUW9e8I/5AAwCPCV2i0PBm5hpeY199riVtXyy1Z8NNm81yOMKar6jWGvysWdc45Lo8DZeNTJr7xy4IzEa3XKOSl9sGDGOw0KWlcJzPUNt02lSGUT+yqdBpHtCPHQtpZni2m+CLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728633349; c=relaxed/simple;
	bh=dk6Nsb90lQagWOQfcKpxDbQ2aUfSv6xoZJNuHo3BDtY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uuMx/3eIptEHubpAhEo3UAo8zsV518Ya6vSnGPRqJnbFDYanjrynQjHiAM78typjDsyD5s/3D3ZxmlrS7OSG51ycA96JDIvbnyfMiV4yCWfE3DpKuVqBQ+l93VsPqmfzSLR2g1xL3IPvGHEo5Y36roSN9yqYd15xNBvt5rpOHQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HO814w6e; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728633348; x=1760169348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dk6Nsb90lQagWOQfcKpxDbQ2aUfSv6xoZJNuHo3BDtY=;
  b=HO814w6egcSOCgrLet+OLkLT5MKr9hgYhgjyv6Ch0ecUIyVUgEZrsD3J
   vb0xcQM/0L2g843u6SaMeaaEFt/8RiQYHPjVLLDQL5EhYifBW91ifcXyr
   0k0853rSxc6Q89ZAyUjjGvBCGAbSOUhL2fUP7qP/S7TqjvUmCp0HySuF7
   kHm/hBohSa6qJSXP7UnfdCgPTY5p36mq+LT3uymVuM/z0U3vgKTPOO3pT
   61dsjF+yXzNGY5sS2m0RLAXSriyc/z3qqbBAdZe/LOAt25dv0aDNqszIa
   xwjeKU5KWMtSHBzmi0b+Eg/93YFtklYYkP28tKyN54YNbcmTFYyQnh/6s
   Q==;
X-CSE-ConnectionGUID: TquawCNiSyOY/nw37RPbHg==
X-CSE-MsgGUID: wleGMBNbQNu/VUhSPmdnXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="30898382"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="30898382"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 00:55:47 -0700
X-CSE-ConnectionGUID: N126rubASpmF1BCYzp+YyQ==
X-CSE-MsgGUID: pR9zdzXeSUWhBtJvUh29Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="81826879"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 00:55:44 -0700
Received: from svinhufvud.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7AF2711F984;
	Fri, 11 Oct 2024 10:55:38 +0300 (EEST)
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
	Naushir Patuck <naush@raspberrypi.com>
Subject: [RFC 1/4] media: Documentation: Rework embedded data documentation
Date: Fri, 11 Oct 2024 10:55:32 +0300
Message-Id: <20241011075535.588140-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework embedded data documentation by removing the reference to the pixel
data stream. The specific documentation of the embedded data interface
will be elsewhere.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/drivers/camera-sensor.rst   | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index dc415b8f6c8e..d82cd803e337 100644
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
+Embedded data support is indicated by an internal sink pad (pad that has both
+the ``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
+<MEDIA-PAD-FL-INTERNAL>`` flags set) with a metadata format to model the
+embedded data stream. If the sub-device driver supports disabling embedded data,
+this can be done by disabling the embedded data route via the
+``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
 
 In general, changing the embedded data format from the driver-configured values
 is not supported. The height of the metadata is device-specific and the width
-- 
2.39.5


