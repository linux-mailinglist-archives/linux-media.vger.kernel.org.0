Return-Path: <linux-media+bounces-40444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE93AB2DF9F
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43A73188965E
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECCB288C22;
	Wed, 20 Aug 2025 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZRz/974x"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D607F27F198;
	Wed, 20 Aug 2025 14:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755700720; cv=none; b=V4D6zjl4j2LM1mDEaHM8/bXoNSMN7asE11gqKia3aHzbphJ9BVZZIRRvAtinyZJk27sReyxZKAJx+tZMfYmEs1LYGDCiHK+DUCLB4ShBuJzLmNCPjDblaiwEdl10h2Ka25eVTIM2jC17O+3ThGs9OLXKbj9mHe7Lf0q99JpQtKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755700720; c=relaxed/simple;
	bh=8mNuVyZZ6/04CjbW2f1Qcv3mBrbieKJFOwuK6BResis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dvt8gvtT8YeJUhxpr/EjOWCszgjQFYb28zSz6HJWYk3Aauo2x4ilMEl+i/QEOAVrgBEQZOCjByceSQfQ3wymouZkztUYDOveW4D/QnCr1k6Py1a0VzNgWGa6486DPtQi8shGtVL7vZBQ27NkIoCzO+3aHwdEhOcdhxlLUJ3Z0ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZRz/974x; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755700719; x=1787236719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8mNuVyZZ6/04CjbW2f1Qcv3mBrbieKJFOwuK6BResis=;
  b=ZRz/974xa4MjPFMOUJT6V80+jqbhZCr4uCGLFk9N/tnjFq4eiDLcJ3g2
   eSdY58kEiNEQS5EnlzbzbpA1ZITR3QHT8KB4yrWl4iEMwwTlEB4Pq16V4
   cthad18hBdfI50+iFf9Rxb2F0FRFjjKl0PjKjwKGKYnIiT6PBgKchMB5m
   V9W+dqB5QUClQ5YeAmmC5fN+GMXTjrXJv5RRNTSYy4UDTzTQCb6dHEKI+
   klFFs6WnKUtWMGiuYOlCpZCQnwfy6QI0RNnzLBGZ3k0s4klZA1BufIJMm
   lUlKk0a1CQ95WwsC0hrPHzn+H34aOh19Kqb+6vCSp1x9KzhIfSZueV2oM
   A==;
X-CSE-ConnectionGUID: WrmVbLg4S2yPXgOM1Ubldw==
X-CSE-MsgGUID: c+H2VRRcSVOXmU6a0zGKIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57167799"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57167799"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:38:35 -0700
X-CSE-ConnectionGUID: bznL2+JcQgeXRjCSHKHaoQ==
X-CSE-MsgGUID: d3BaKXGxSMWoSqEoYHc56A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167368838"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.19])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:38:33 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E80B5121FAD;
	Wed, 20 Aug 2025 17:38:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uojxI-00000002JYn-3sdM;
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
Subject: [PATCH v5 9/9] media: uvcvideo: eUSB2 double isochronous bandwidth support
Date: Wed, 20 Aug 2025 17:38:24 +0300
Message-ID: <20250820143824.551777-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250820143824.551777-1-sakari.ailus@linux.intel.com>
References: <20250820143824.551777-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tao Q Tao <tao.q.tao@intel.com>

Use usb_endpoint_max_esit_payload() from the USB framework to find the
maximum bytes per interval for the endpoint. Consequently this adds eUSB2
isochronous mode and SuperSpeedPlus Isochronous Endpoint Companion support
where larger payloads within a service interval are possible.

Co-developed-by: Amardeep Rai <amardeep.rai@intel.com>
Signed-off-by: Amardeep Rai <amardeep.rai@intel.com>
Signed-off-by: Tao Q Tao <tao.q.tao@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c |  4 ++--
 drivers/media/usb/uvc/uvc_video.c  | 24 +++---------------------
 drivers/media/usb/uvc/uvcvideo.h   |  4 +---
 3 files changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 775bede0d93d..d06ca79ae2d9 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -539,7 +539,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 	unsigned int nformats = 0, nframes = 0, nintervals = 0;
 	unsigned int size, i, n, p;
 	u32 *interval;
-	u16 psize;
+	u32 psize;
 	int ret = -EINVAL;
 
 	if (intf->cur_altsetting->desc.bInterfaceSubClass
@@ -775,7 +775,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 				streaming->header.bEndpointAddress);
 		if (ep == NULL)
 			continue;
-		psize = uvc_endpoint_max_bpi(dev->udev, ep);
+		psize = usb_endpoint_max_periodic_payload(dev->udev, ep);
 		if (psize > streaming->maxpsize)
 			streaming->maxpsize = psize;
 	}
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a5013a7fbca4..1a0cc937de9b 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1869,24 +1869,6 @@ static void uvc_video_stop_transfer(struct uvc_streaming *stream,
 		uvc_free_urb_buffers(stream);
 }
 
-/*
- * Compute the maximum number of bytes per interval for an endpoint.
- */
-u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep)
-{
-	u16 psize;
-
-	switch (dev->speed) {
-	case USB_SPEED_SUPER:
-	case USB_SPEED_SUPER_PLUS:
-		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
-	default:
-		psize = usb_endpoint_maxp(&ep->desc);
-		psize *= usb_endpoint_maxp_mult(&ep->desc);
-		return psize;
-	}
-}
-
 /*
  * Initialize isochronous URBs and allocate transfer buffers. The packet size
  * is given by the endpoint.
@@ -1897,10 +1879,10 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
 	struct urb *urb;
 	struct uvc_urb *uvc_urb;
 	unsigned int npackets, i;
-	u16 psize;
+	u32 psize;
 	u32 size;
 
-	psize = uvc_endpoint_max_bpi(stream->dev->udev, ep);
+	psize = usb_endpoint_max_periodic_payload(stream->dev->udev, ep);
 	size = stream->ctrl.dwMaxVideoFrameSize;
 
 	npackets = uvc_alloc_urb_buffers(stream, size, psize, gfp_flags);
@@ -2043,7 +2025,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
 				continue;
 
 			/* Check if the bandwidth is high enough. */
-			psize = uvc_endpoint_max_bpi(stream->dev->udev, ep);
+			psize = usb_endpoint_max_periodic_payload(stream->dev->udev, ep);
 			if (psize >= bandwidth && psize < best_psize) {
 				altsetting = alts->desc.bAlternateSetting;
 				best_psize = psize;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 757254fc4fe9..ac19ca721f29 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -456,7 +456,7 @@ struct uvc_streaming {
 
 	struct usb_interface *intf;
 	int intfnum;
-	u16 maxpsize;
+	u32 maxpsize;
 
 	struct uvc_streaming_header header;
 	enum v4l2_buf_type type;
@@ -798,8 +798,6 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
 /* Utility functions */
 struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
 					    u8 epaddr);
-u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep);
-
 /* Quirks support */
 void uvc_video_decode_isight(struct uvc_urb *uvc_urb,
 			     struct uvc_buffer *buf,
-- 
2.47.2


