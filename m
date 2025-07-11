Return-Path: <linux-media+bounces-37461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 095ACB0167A
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 10:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 516C45A6D46
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 08:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC3B223708;
	Fri, 11 Jul 2025 08:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SkJhf3Wo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CAF2236EE;
	Fri, 11 Jul 2025 08:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222931; cv=none; b=kXVHREDw6dhx0eYyz0DA0JswD/l9M5V5cXTvhj7H+kbhVlgTugpqrw4PLpI2rD9A20NCoxJssWokOoCXmJvUw6T9YfHa/r1fkkNveeaxdamgvi2mCuCGDeEUjR1c1/gbV1Sge4iEW2yFgkHcTCZMZH7mAZVlSl6gHC+WYOMMgwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222931; c=relaxed/simple;
	bh=CiWdSLMB0pykKtgdfG/uGy929icGP6FHRbKJYHqktc4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lg8sUVc9OB4nFdwWn29GHA58Z1DBMfG8JOlqJHHAyBcGJzPoGEtWoRanLJb2T9fftiqgOV0UzG1sDEqdkEe6UsKzwNNg71iwRaMyPCwAOIWA6psY1NQDYkgCdzMvniq6xK+oemJ23nxOPEf8NTo3ClRiAxBFrB+fSPgs58VMG7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SkJhf3Wo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752222930; x=1783758930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CiWdSLMB0pykKtgdfG/uGy929icGP6FHRbKJYHqktc4=;
  b=SkJhf3WoYqng4CqB2iIsaitV31FvaLpHbpOY1Ey/RszgwHqEF4Qs79B5
   9q4WqKcXdSbWHvzK7Ys8xhPR+CJcsal/hHhdo89LXT6gtGLLsBaZzjz6V
   GKxQ3Ag6bYGkKBxrwQQtg04IujnhB1uEBeui1qkbXua57dV6y/b+wJTxG
   4BG0CLDCjqA8temVaAT3V44B+qQipmOZW7ibJtfjZlSdGStVoy3CtJVwH
   EZm+4nRZAjivDxgxaN+60q3kieNOJUXr4UvhlKWt+va9YKLbPFXpm0Blu
   juYewEyVzBGnffbuLCacii2jVCfAVWouqMcYfQW7insL7ffpTKZ2Ner1a
   Q==;
X-CSE-ConnectionGUID: m5uqNhPFQXqBadgmgWbSow==
X-CSE-MsgGUID: J4Z1SQ+uSQCeMKFoZ668pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="71965148"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="71965148"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 01:34:20 -0700
X-CSE-ConnectionGUID: CbbR8Er6R4+umGU1uRosEw==
X-CSE-MsgGUID: xnrY3u0dQN2jhrY4pvWKFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="156097094"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.248])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 01:34:17 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DF66112090D;
	Fri, 11 Jul 2025 11:34:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1ua9Cv-006Vre-2F;
	Fri, 11 Jul 2025 11:34:13 +0300
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
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 4/4] media: uvcvideo: eUSB2 double isochronous bandwidth support
Date: Fri, 11 Jul 2025 11:34:13 +0300
Message-Id: <20250711083413.1552423-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250711083413.1552423-1-sakari.ailus@linux.intel.com>
References: <20250711083413.1552423-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tao Q Tao <tao.q.tao@intel.com>

Use usb_endpoint_max_isoc_bpi() from the USB framework to find the maximum
bytes per interval for the endpoint. Consequently this adds eUSB2
isochronous mode and SuperSpeedPlus Isochronous Endpoint Compaion support
where larger bpi values are possible.

Co-developed-by: Amardeep Rai <amardeep.rai@intel.com>
Signed-off-by: Amardeep Rai <amardeep.rai@intel.com>
Signed-off-by: Tao Q Tao <tao.q.tao@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/media/usb/uvc/uvc_driver.c |  4 ++--
 drivers/media/usb/uvc/uvc_video.c  | 24 +++---------------------
 drivers/media/usb/uvc/uvcvideo.h   |  4 +---
 3 files changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index da24a655ab68..fde0bc95622c 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -536,7 +536,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 	unsigned int nformats = 0, nframes = 0, nintervals = 0;
 	unsigned int size, i, n, p;
 	u32 *interval;
-	u16 psize;
+	u32 psize;
 	int ret = -EINVAL;
 
 	if (intf->cur_altsetting->desc.bInterfaceSubClass
@@ -772,7 +772,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 				streaming->header.bEndpointAddress);
 		if (ep == NULL)
 			continue;
-		psize = uvc_endpoint_max_bpi(dev->udev, ep);
+		psize = usb_endpoint_max_isoc_bpi(dev->udev, ep);
 		if (psize > streaming->maxpsize)
 			streaming->maxpsize = psize;
 	}
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007..9f65cdbc1a1c 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1895,24 +1895,6 @@ static void uvc_video_stop_transfer(struct uvc_streaming *stream,
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
@@ -1923,10 +1905,10 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
 	struct urb *urb;
 	struct uvc_urb *uvc_urb;
 	unsigned int npackets, i;
-	u16 psize;
+	u32 psize;
 	u32 size;
 
-	psize = uvc_endpoint_max_bpi(stream->dev->udev, ep);
+	psize = usb_endpoint_max_isoc_bpi(stream->dev->udev, ep);
 	size = stream->ctrl.dwMaxVideoFrameSize;
 
 	npackets = uvc_alloc_urb_buffers(stream, size, psize, gfp_flags);
@@ -2067,7 +2049,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
 				continue;
 
 			/* Check if the bandwidth is high enough. */
-			psize = uvc_endpoint_max_bpi(stream->dev->udev, ep);
+			psize = usb_endpoint_max_isoc_bpi(stream->dev->udev, ep);
 			if (psize >= bandwidth && psize < best_psize) {
 				altsetting = alts->desc.bAlternateSetting;
 				best_psize = psize;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b9f8eb62ba1d..a77ba76e033a 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -450,7 +450,7 @@ struct uvc_streaming {
 
 	struct usb_interface *intf;
 	int intfnum;
-	u16 maxpsize;
+	u32 maxpsize;
 
 	struct uvc_streaming_header header;
 	enum v4l2_buf_type type;
@@ -818,8 +818,6 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
 /* Utility functions */
 struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
 					    u8 epaddr);
-u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep);
-
 /* Quirks support */
 void uvc_video_decode_isight(struct uvc_urb *uvc_urb,
 			     struct uvc_buffer *buf,
-- 
2.39.5


