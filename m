Return-Path: <linux-media+bounces-39594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E19F4B2287D
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 15:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0C403AD3B7
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 13:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78BED280CD0;
	Tue, 12 Aug 2025 13:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ydbc8y+k"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6A327F170;
	Tue, 12 Aug 2025 13:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755005099; cv=none; b=gT7zWgf6QUhhAAODpwNTsdvc+1H2liClevn2JjDVOfxp++3rZRketvY0tNxPqbSzBZh5LtA5ANX+nQih/jV1p129XrTJvuE7Jjy17b6h+Vw12rEgFYHYGeTGbwuZhbpH4Tw/pexxGRZHeS+T/1lQIP4BP9IJwkV1VAqogihliqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755005099; c=relaxed/simple;
	bh=20r1HH5+BbHJNXfZpWKRdoLlv5HahszQqOdnjhOM0gA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AGXvgq2aWesBiTzrM8jhoe9hx4Vk1crHWCRirB2g4uHgw8xIruN1u6gzL4RbVZtxtMnsVf5J1KgWx5zbUZmmpCyS0nA2ouKVEn5W2qcnUWqv1uGbXVZ0EgjJPg+wFn6d0sqPGhVT8JWn2LefjsWyeoi9TDzOhpU2ms5l+juzM/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ydbc8y+k; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755005099; x=1786541099;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=20r1HH5+BbHJNXfZpWKRdoLlv5HahszQqOdnjhOM0gA=;
  b=Ydbc8y+kkoCtkp9LcTOHVTY651H16/77SiC7sNJ1sN8jq+20+ntIWuAD
   ewuqOYAX8+oIbHUvNiatntA0GwhIrq+71OcmCLGJ75T0UaE3IbPr/ztH7
   CRiG2w/I5VzfWpw//I0jlqDMZul+n2GuXWSyYV+rSRRKTEu2mXc9/a5s0
   h3Wq8eIu/qDHpNMHauaKqjrFjBQcW6QoKzEHceGApCS+nwl2bdJSkXgzG
   cOmd4yoyFEexJmbkz7HrqRDWA08+ed8ypkPxh6l5t00vUk1Y+7nxC40zJ
   gzCOu5H7FKM1EeT1IkD+maMiLkHyNsg1IOS43PCcGXt7QGsejEUCRlt8k
   w==;
X-CSE-ConnectionGUID: RcWFgwobR/GinwhwBH6FQg==
X-CSE-MsgGUID: YkBjQhVXQLu1S0sGLm+3Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68349688"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="68349688"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:24:53 -0700
X-CSE-ConnectionGUID: Sdy3DjNKSgmwJ8Gh5fJ1Xw==
X-CSE-MsgGUID: ZuiUlvc1TcCGQmSdhRSxMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166987275"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.110])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:24:48 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2FD3A11FC97;
	Tue, 12 Aug 2025 16:24:46 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uloze-00DMZx-06;
	Tue, 12 Aug 2025 16:24:46 +0300
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
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v4 4/4] media: uvcvideo: eUSB2 double isochronous bandwidth support
Date: Tue, 12 Aug 2025 16:24:45 +0300
Message-Id: <20250812132445.3185026-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250812132445.3185026-1-sakari.ailus@linux.intel.com>
References: <20250812132445.3185026-1-sakari.ailus@linux.intel.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
index a75af314e46b..335b1c4eff9b 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1860,24 +1860,6 @@ static void uvc_video_stop_transfer(struct uvc_streaming *stream,
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
@@ -1888,10 +1870,10 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
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
@@ -2034,7 +2016,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
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


