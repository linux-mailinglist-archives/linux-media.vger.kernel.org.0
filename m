Return-Path: <linux-media+bounces-6943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B65287A371
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26F852834F6
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CC0182CF;
	Wed, 13 Mar 2024 07:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgWvoWp+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CAB168BA
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314755; cv=none; b=oawlAyjfRb3dkGhLjLR/WjHSinOs2Nkw7SShanTl7p0z0C2CNHoRzWJQVl79vwZoyDg/29vCyH+oHwbzgUsVWzQL/P5J0mWPOq40/mQN8ihMGxc4wDaNKrfMHTOtWRcE1FIYtYGbqZ4t/vVjkdnvJm2YdwpqNfBNHikdCDOID8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314755; c=relaxed/simple;
	bh=e5xHgCz203dWzQ6k/QXmaPwbpI3wWpeOsKmtVPvTpNs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZatZc1has/C06azxKDvMV6mmnz6GDp+QrRVDGbP4x5jpnb3W4yB8gUqz+bwBaKziRZtT8zEtGjKnFlcRruxVmzUEa2WoVdVU1x1D1QH8ZNx0gBG5Syf/D9Chy8AmKZNhtkjBNHXOuy/iKfWMivrGIzJEkc4Opj0yR9RNoNFlAw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgWvoWp+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314753; x=1741850753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e5xHgCz203dWzQ6k/QXmaPwbpI3wWpeOsKmtVPvTpNs=;
  b=cgWvoWp+r/4OOHZ85MIKb/+8Q+5kLRXoG+/kctAOcumWGgXKQvPUF4ka
   7uDHz0foCssYMxYhcTq376F/egQGKULiVfwqpi1AmzEu7NsXDSyxyYekn
   vunxwlweG6RjGKv5cna0ztKsT5CadoNq96z8BL8w2qvTMukhXn5aKwiFC
   Ra/fUiRf4jJhSkxEIFJ54sqAz+txrfNvA+2AFEeuIjO/ASvKPSKABL1Ch
   a3VSdIRO9XP5NmKfF+c0r8x90y9Hvd5n9LEaP0nHOgDTiDYcK/GMPXjkn
   pxq3aZ3CGpnhVoAXOr2OT+qa8uUqgmBsZA/wZgXm4TJ+Kk2yfrD776bgi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22575556"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="22575556"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="42816370"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:33 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2F0CE1203B3;
	Wed, 13 Mar 2024 09:25:30 +0200 (EET)
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
Subject: [PATCH v8 08/38] media: Documentation: Document embedded data guidelines for camera sensors
Date: Wed, 13 Mar 2024 09:24:46 +0200
Message-Id: <20240313072516.241106-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
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
---
 .../media/drivers/camera-sensor.rst           | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 919a50e8b9d9..92545538b855 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -102,3 +102,32 @@ register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
 values programmed by the register sequences. The default values of these
 controls shall be 0 (disabled). Especially these controls shall not be inverted,
 independently of the sensor's mounting rotation.
+
+Embedded data
+-------------
+
+Many sensors, mostly raw sensors, support embedded data which is used to convey
+the sensor configuration for the captured frame back to the host. While CSI-2 is
+the most common bus used by such sensors, embedded data can be available on
+other bus types as well.
+
+Embedded data support shall use an internal source pad (a pad that has
+``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
+<MEDIA-PAD-FL-INTERNAL>`` flags set) and route to the external pad. If embedded
+data output can be disabled in hardware, it should be possible to disable the
+embedded data route via ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
+
+In general, changing the embedded data format from the driver-configured values
+is not supported. The height of the metadata is hardware specific and the width
+is that (or less of that) of the image width, as configured on the pixel data
+stream.
+
+CCS and non-CCS embedded data
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Embedded data which is compliant with CCS definitions shall use ``CCS embedded
+data format <MEDIA-BUS-FMT-CCS-EMBEDDED>``. Device specific embedded data which
+is compliant up to MIPI CCS embedded data levels 1 or 2 only shall refer to CCS
+embedded data formats and document the level of conformance. The rest of the
+device specific embedded data format shall be documented in the context of the
+data format itself.
-- 
2.39.2


