Return-Path: <linux-media+bounces-38990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA82B1D22D
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 07:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 229C81AA1257
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 05:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663E821B8E7;
	Thu,  7 Aug 2025 05:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i96Krcl7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193C11F4198;
	Thu,  7 Aug 2025 05:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754546044; cv=none; b=vDWzFxhlD7gTVePJHfRKyOAXxcD7WRwpdf2hU1Do54/5A0WAdDGI4BsWctNKwzk4kYgUOsifgzIsQWJ3jIu9iAiCUhIMueS/aYB4m/2WbOv5gE4IHHnheFw0vBhL4Jz1ncpSwGbWHUVK5dqQpolcWzwAAKmBeC6pOIEESgCN8Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754546044; c=relaxed/simple;
	bh=FL5DqnaO0xOUE9P4j3oHAsC+6ikszQX2+VltpNvpLlc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LZMuCUGXAxCsJJT10UCl+EcBcGB7JCeROK2ED9BqGNRwVGoaxx+yD1nzJ25fOrFIhOYChbZ6y+cFDfi9O96oBQ0CzpvNForWN5jrEgFQQPIa1/vYKqPCCITQfK5FH70X/x2kHbPPSp46MOt9abtU75FwGvEMO91JfZIbNJJ7zU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i96Krcl7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754546043; x=1786082043;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FL5DqnaO0xOUE9P4j3oHAsC+6ikszQX2+VltpNvpLlc=;
  b=i96Krcl7GvpVRC0/k7xNAslfBVARqzP9mRWBmIvvyiFVHqrwlr4Q/QET
   WPzLinCWym8278abscEOPq7T0S2ixTH7rgpW0rkXlN2jTLatCLIdMrxhO
   dXMEiQc06wOsc8gSN1CSuFJcdaFXwTQOUFFhk9hkEj13/ESUsciIYw3GC
   nQH8y7JYjiPqKcJG6sPfHXIZQo/5CK/SNNNn1noWOhu4J7pWA3JV5jnMA
   iUBvDwoavhxFaWXiAGZpyrbcWSqvRUnTmMG0JCRcci1dxU6GpAiIB5Ej3
   AKUgzP8lE3GRoGmCR7FDaFyNjhoRCRp6cDDgLCH8MHM7Lepi9uJkiSwQf
   Q==;
X-CSE-ConnectionGUID: sYequSbCRJa2A2X+1zyNLA==
X-CSE-MsgGUID: pydsYRXhSNGMowQtEruafA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60501934"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60501934"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 22:54:00 -0700
X-CSE-ConnectionGUID: k4kRE8j3S2KQ69swEFIo/Q==
X-CSE-MsgGUID: hZDrl46nSUCqBj2DazL8/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="202144607"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.255])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 22:53:58 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3571D11FC4D;
	Thu,  7 Aug 2025 08:53:55 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1ujtZc-005H16-0j;
	Thu, 07 Aug 2025 08:53:56 +0300
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
Subject: [PATCH v3 2/4] USB: core: support eUSB2 double bandwidth large isoc URB frames
Date: Thu,  7 Aug 2025 08:53:53 +0300
Message-Id: <20250807055355.1257029-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250807055355.1257029-1-sakari.ailus@linux.intel.com>
References: <20250807055355.1257029-1-sakari.ailus@linux.intel.com>
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
---
 drivers/usb/core/urb.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 7a76d5a62db1..6f8f3d751854 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -372,6 +372,7 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
 	struct usb_host_endpoint	*ep;
 	int				is_out;
 	unsigned int			allowed;
+	bool				is_eusb2_isoch_double;
 
 	if (!urb || !urb->complete)
 		return -EINVAL;
@@ -434,7 +435,11 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
 		return -ENODEV;
 
 	max = usb_endpoint_maxp(&ep->desc);
-	if (max <= 0) {
+	is_eusb2_isoch_double = dev->speed == USB_SPEED_HIGH &&
+				usb_endpoint_is_isoc_in(&ep->desc) &&
+				ep->eusb2_isoc_ep_comp.bDescriptorType &&
+				le16_to_cpu(ep->desc.wMaxPacketSize) == 0;
+	if (!max && !is_eusb2_isoch_double) {
 		dev_dbg(&dev->dev,
 			"bogus endpoint ep%d%s in %s (bad maxpacket %d)\n",
 			usb_endpoint_num(&ep->desc), is_out ? "out" : "in",
@@ -467,9 +472,13 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
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
-- 
2.39.5


