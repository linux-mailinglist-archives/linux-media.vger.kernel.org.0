Return-Path: <linux-media+bounces-37462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B577CB01681
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 10:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBC021CA1356
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 08:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF84322FAFD;
	Fri, 11 Jul 2025 08:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGrlsvI8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B821E223DFD;
	Fri, 11 Jul 2025 08:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222932; cv=none; b=KKxcBpQwfdBCZNlEOEbcfUzmaoPm4sbDBM6Vzm9jYm3xDv2LowYTtubept4H2lPE3CHQjtO0x7bwoz5H94KaVLgSv/6PXxSJNOndeJ56ffOegp9PCB+GZvUjV9p34NSPq05nT4nt+IKnBZVSDhMgtpHZ7WifXL4QJHP6cNJV4aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222932; c=relaxed/simple;
	bh=nEvczn7UjNXDQUhPhnoyTyZNiBxASikVZpChH7s2pl0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B1iKKRb8UCWi36aZucp5sNRLGXb/gHiMox0jxOs++rSs5H3qX/uHTHGTL5CE4kq2JbmwEVrWFTUA5/wV5iU8nAZcKEEGBakAz4bR/Oc61eEGGL31FEn0erGD0povaFMnkDcf2HqV/O9T+v5wZLAZFBma3n0vXAj/XWBZkesig30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGrlsvI8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752222931; x=1783758931;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nEvczn7UjNXDQUhPhnoyTyZNiBxASikVZpChH7s2pl0=;
  b=GGrlsvI8JjSkGubONhoPtPT+W8w8N6uPaw47tf5kCukeKDb4UDwA1UdO
   6Cu4mAsH2/RUPXxjWX01T7JghSLfq0VGB8D+oHocmVe3sMVAHx+j3ebGJ
   0Vn0LimjfEB8hRMBQNqA/2dx+2BQGezsoFSJv+kQwH4A/5fo2L7zWYCdY
   GwkD/FX/8sGJFwPUb8MF5tMczfvxNQ0h+94ycTXj4AcdR4ffGpv5mEQac
   QCO26iae1938j14AS/c9KFdWdEYZ+swmDEXWaP+M4zaNRFfwpmX+8QARh
   gFjZxkqlfTR+abOBDCjnMrP67DyPDm/zOj0aSR3veqYXDQQVn9U22Xbub
   w==;
X-CSE-ConnectionGUID: CIZUacc2Tb6WRQQ6gV2GNg==
X-CSE-MsgGUID: HfSIR731QQGKvDkmQMnDag==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="71965154"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="71965154"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 01:34:20 -0700
X-CSE-ConnectionGUID: O1LboNChTqeaSISyelGPmw==
X-CSE-MsgGUID: ogxMNsp7RJSxVOU+enn/VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="156097098"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.248])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 01:34:17 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DB1BF1206DC;
	Fri, 11 Jul 2025 11:34:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1ua9Cv-006VrW-26;
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
Subject: [PATCH v2 2/4] USB: core: support eUSB2 double bandwidth large isoc URB frames
Date: Fri, 11 Jul 2025 11:34:11 +0300
Message-Id: <20250711083413.1552423-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250711083413.1552423-1-sakari.ailus@linux.intel.com>
References: <20250711083413.1552423-1-sakari.ailus@linux.intel.com>
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
 drivers/usb/core/urb.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 7a76d5a62db1..2c8698cc452c 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -372,6 +372,7 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
 	struct usb_host_endpoint	*ep;
 	int				is_out;
 	unsigned int			allowed;
+	bool				is_eusb2_isoch_double;
 
 	if (!urb || !urb->complete)
 		return -EINVAL;
@@ -434,7 +435,12 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
 		return -ENODEV;
 
 	max = usb_endpoint_maxp(&ep->desc);
-	if (max <= 0) {
+	is_eusb2_isoch_double = dev->speed == USB_SPEED_HIGH &&
+				xfertype == USB_ENDPOINT_XFER_ISOC &&
+				usb_endpoint_dir_in(&ep->desc) &&
+				le16_to_cpu(dev->descriptor.bcdUSB) == 0x220 &&
+				le16_to_cpu(ep->desc.wMaxPacketSize) == 0;
+	if (!max && !is_eusb2_isoch_double) {
 		dev_dbg(&dev->dev,
 			"bogus endpoint ep%d%s in %s (bad maxpacket %d)\n",
 			usb_endpoint_num(&ep->desc), is_out ? "out" : "in",
@@ -467,9 +473,13 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
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


