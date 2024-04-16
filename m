Return-Path: <linux-media+bounces-9563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6688A74E0
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C2811C22202
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDFF13A3F3;
	Tue, 16 Apr 2024 19:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GLMgjU1U"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A1F1386A8
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296024; cv=none; b=NLBpMSiaP+UTbTPpso2Nup92WWd0ZkgeSh+IU1v5R7+iP2FjAziOe+bGrDv0T5OXN4ulM4yhRe8KnWnI95WhwtZ94rC6/LuJeGE6jb7yFTFwAdj/Q3KOXCAqplGB7IhMFnmb1ypajkds5F/DBU0iGJ5MXNtsCCxsDMR5z+/6vXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296024; c=relaxed/simple;
	bh=Ehe4Gr9wnpRsTUDR+jTfTlVe8y7v5euP0UN3jL7wUXU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qmLO3kODNH69Svs+stFfPeXbDwbvlsguTG2WQ13z+cPnKjkPVptDiB1ZxJ3IfVMyiyhCrhx9KlUiy4rt21eCW0CCEkq8aldmby9S0DxatWmqQmGxXly/4wQcIRF8hei2bT8pOEfM3IGaNMYuSZ7bO5n5cFZG4RMqaslgbGdKknI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GLMgjU1U; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296023; x=1744832023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ehe4Gr9wnpRsTUDR+jTfTlVe8y7v5euP0UN3jL7wUXU=;
  b=GLMgjU1UeL6ZlCl5JvVChkAsxkRv7C988SltRRPNz4eEarwmCAJqf+nF
   B+BhWtodC0C6dDNO8ltyXHwtNymNnxF3LVR4FVZfkUz5Lee5oWjtHvfhH
   xMLkn4Wo0PMMna3MTE35upRm3NY5fdB5PsQW2Rrw91Dwd2XVzP97xgL1q
   uGjeIbnGR5nDX0ZOh4pKrMPnHhkPYtrpn+acWbwXHt5tEB4WjFvEGIv88
   s05rFhB8x5uVcKQl42WUNI0KBoCdeyYhf1YHvZO4azb/5lC4XhVfiWQEG
   wo9tDIVevMtXrevBT4GwKGIggFiD8Arpz+wFCjWjUBty+HsyJrmLLFg1U
   A==;
X-CSE-ConnectionGUID: 2R27OBvoRPGz6Crq5y8Xfw==
X-CSE-MsgGUID: Xg6HcfqbQ7C55xehsSd/Pw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19906069"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="19906069"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:43 -0700
X-CSE-ConnectionGUID: 9fSWSzNNQ1qe6OiDAGPPXQ==
X-CSE-MsgGUID: 8tNXU/OtR3KnDtPwkZW83A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="27155287"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:40 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 897C71205CF;
	Tue, 16 Apr 2024 22:33:36 +0300 (EEST)
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
Subject: [PATCH v9 11/46] media: Documentation: Document S_ROUTING behaviour
Date: Tue, 16 Apr 2024 22:32:44 +0300
Message-Id: <20240416193319.778192-12-sakari.ailus@linux.intel.com>
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

Document S_ROUTING behaviour for different devices.

Generally in devices that produce streams the streams are static and some
can be enabled and disabled, whereas in devices that just transport them
or write them to memory, more configurability is allowed. Document this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index d30dcb9e2537..de8dfd4f11a5 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -593,6 +593,30 @@ Any configurations of a stream within a pad, such as format or selections,
 are independent of similar configurations on other streams. This is
 subject to change in the future.
 
+Device types and routing setup
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Different kinds of sub-devices have differing behaviour for route activation,
+depending on the hardware. In all cases, however, only routes that have the
+``V4L2_SUBDEV_STREAM_FL_ACTIVE`` flag set are active.
+
+Devices generating the streams may allow enabling and disabling some of the
+routes or the configuration is fixed. If the routes can be disabled, not
+declaring the routes (or declaring them without
+``VIDIOC_SUBDEV_STREAM_FL_ACTIVE`` flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will
+disable the routes while the sub-device driver retains the streams and their
+format and selection configuration. The ``VIDIOC_SUBDEV_S_ROUTING`` will still
+return such routes back to the user in the routes array, with the
+``V4L2_SUBDEV_STREAM_FL_ACTIVE`` flag unset.
+
+Devices transporting the streams almost always have more configurability with
+respect to routing. Typically any route between the sub-device's sink and source
+pads is possible, and multiple routes (usually up to certain limited number) may
+be active simultaneously. For such devices, no routes are created by the driver
+and user-created routes are fully replaced when ``VIDIOC_SUBDEV_S_ROUTING`` is
+called on the sub-device. Such newly created routes have the device's default
+configuration for format and selection rectangles.
+
 Configuring streams
 ^^^^^^^^^^^^^^^^^^^
 
-- 
2.39.2


