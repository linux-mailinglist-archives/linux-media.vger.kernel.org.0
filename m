Return-Path: <linux-media+bounces-40442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2A4B2DF9E
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE8477AF523
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA725285C99;
	Wed, 20 Aug 2025 14:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EYueAfMB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B8C27B51C;
	Wed, 20 Aug 2025 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755700719; cv=none; b=p7mlF7/rJBt0Id3cgrlG6Fz936+MUhiJTeRbufikdyYUUFt7j7yN/eQOn2mvMEoe+Y9ht8wI9tFu8bFLxOQQf1mVz4Bfl2tb/WtkaUOPeT9wjajt8IQZ7A8MrnnuLh97UPQ4bxSI+9vOos6hgyaXT/X2+bH9aSIwXGsnr9NcOHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755700719; c=relaxed/simple;
	bh=Dpfb5BeZnldpc5kdT4kXjMU6BLV+PCYeH5/pVAgQIfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=adLVcpknHz+fU5YtwlPHAfVy2tB25NaAQO14gFuH3HsNNYiLEsV5uC1tKA2o2e8GIvpgkckiRJ8BKmmkPQ4lWWUHMZsNXQFNzBvpFgKHKw5hNlGd1j3pOcfY6T2yGQE30vG2JhyQ/P+wRtNgNnQBrxdQWRYCAXzuqH2sJi0cT4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EYueAfMB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755700718; x=1787236718;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dpfb5BeZnldpc5kdT4kXjMU6BLV+PCYeH5/pVAgQIfE=;
  b=EYueAfMBzXGp1hsoujezJ+4NipxVidJnXyM18+fOhap78IgjNuerbQfh
   ue99C0DFXEaYlpq1Q3vg5dUfU3p/6OgFuR4xyl6fld//Har+KgsD0gE8p
   HwXNrr+uoPZrUtHOV7uB7xiuRQUFkm3vdxjsTRdFaCDh7HsdN0zRoIVRn
   w6CRIU8ya6bhyzFAmVRVn6h4qddGGa7uWIU0A+3ooG4760b3c8rsrJbPR
   ocTq8VUrOoS35RlZgjau1okWJKA4k4Ps0jFBGX7DVpqXdakOxFPlbe/I1
   73ue01Cd0PFy9BllT9aEE4qPM7187ZT6mheotDu3IzEG4aeSzJe19vgO2
   w==;
X-CSE-ConnectionGUID: ING9ey63QjWDnI3o28eikA==
X-CSE-MsgGUID: p+VSDIQGSyGMqXXMDFSsgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57167782"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57167782"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:38:35 -0700
X-CSE-ConnectionGUID: vGwWLn3dQ2iIlxhMrM1y5A==
X-CSE-MsgGUID: Zo7aepVyTe+HTgoFsseLxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167368832"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.19])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:38:33 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E52B3121FAC;
	Wed, 20 Aug 2025 17:38:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uojxI-00000002JYi-3omR;
	Wed, 20 Aug 2025 17:38:24 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org,
	laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com,
	Thinh.Nguyen@synopsys.com,
	Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	=?UTF-8?q?Micha=C5=82=20Pecio?= <michal.pecio@gmail.com>
Subject: [PATCH v5 8/9] usb: core: support eUSB2 double bandwidth large isoc URB frames
Date: Wed, 20 Aug 2025 17:38:23 +0300
Message-ID: <20250820143824.551777-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250820143824.551777-1-sakari.ailus@linux.intel.com>
References: <20250820143824.551777-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Rai, Amardeep" <amardeep.rai@intel.com>

eUSB2 double isochronous in bandwidth devices support up to 6 transactions
per microframe, and thus doubles the total bytes possible to receive per
microframe.

Support larger URB isoc frame sizes for eUSB2 double isoc in endpoints.

Also usb_endpoint_maxp() returns a natural number so there's no need to
assume it could be < 0.

Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
 drivers/usb/core/urb.c | 14 ++++++++++----
 drivers/usb/core/usb.c |  2 ++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 7a76d5a62db1..ff8df16cca35 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -372,6 +372,7 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
 	struct usb_host_endpoint	*ep;
 	int				is_out;
 	unsigned int			allowed;
+	bool				is_eusb2_isoch_double;
 
 	if (!urb || !urb->complete)
 		return -EINVAL;
@@ -434,7 +435,8 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
 		return -ENODEV;
 
 	max = usb_endpoint_maxp(&ep->desc);
-	if (max <= 0) {
+	is_eusb2_isoch_double = usb_endpoint_is_hs_isoc_double(dev, ep);
+	if (!max && !is_eusb2_isoch_double) {
 		dev_dbg(&dev->dev,
 			"bogus endpoint ep%d%s in %s (bad maxpacket %d)\n",
 			usb_endpoint_num(&ep->desc), is_out ? "out" : "in",
@@ -467,9 +469,13 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
 			max = le32_to_cpu(isoc_ep_comp->dwBytesPerInterval);
 		}
 
-		/* "high bandwidth" mode, 1-3 packets/uframe? */
-		if (dev->speed == USB_SPEED_HIGH)
-			max *= usb_endpoint_maxp_mult(&ep->desc);
+		/* High speed, 1-3 packets/uframe, max 6 for eUSB2 double bw */
+		if (dev->speed == USB_SPEED_HIGH) {
+			if (is_eusb2_isoch_double)
+				max = le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
+			else
+				max *= usb_endpoint_maxp_mult(&ep->desc);
+		}
 
 		if (urb->number_of_packets <= 0)
 			return -EINVAL;
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 939dc4aafb89..b88b6271cb30 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -1134,6 +1134,8 @@ u32 usb_endpoint_max_periodic_payload(struct usb_device *udev,
 	case USB_SPEED_SUPER:
 		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
 	default:
+		if (usb_endpoint_is_hs_isoc_double(udev, ep))
+			return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
 		return usb_endpoint_maxp(&ep->desc) * usb_endpoint_maxp_mult(&ep->desc);
 	}
 }
-- 
2.47.2


