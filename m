Return-Path: <linux-media+bounces-34887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF3FADAC11
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 11:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1DE93B42F5
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 09:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F36E2741DA;
	Mon, 16 Jun 2025 09:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJ3/kgHt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BF62741AF;
	Mon, 16 Jun 2025 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750066683; cv=none; b=GfEbLkBVUZzHNnItpsCP7is1/5gdmD387W5Ex4EXxTEjxWqc4ZL43u98GJTLT4ou884HhBA12m+3QFRpcbMWKBC0GDlAg1R103Pdk6zz7Kh2i2F4cKxTeQNg6gpQVGvAk/MXbxKCGgDBXA5Fvtno+uWxx8TX3F5yXHINQjPTdcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750066683; c=relaxed/simple;
	bh=VwFUsD3qLYJJeONiwUunvlZjzrvT/Q6L0nhVqU5pB6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zvdxivt4BIS07qlaWrq+DgJazlaDxy9AKSXI7W0LThfEhkI++WkbxwsneZtSSQ4qchPn+AF/bCCZM7Km6BvYez7rGx0BKhDbavP7cOVoF72DGOcF0SzAOvL0wHTttfXQUvNeWehxIUvef5Pz9RPG3IqxSp5vI3QrbS8sk7HVpf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJ3/kgHt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750066682; x=1781602682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VwFUsD3qLYJJeONiwUunvlZjzrvT/Q6L0nhVqU5pB6U=;
  b=ZJ3/kgHtfzw6rp65TF8bgnmVE2KA+1Ue2SVo0pniYZzK0Alq5ho7Ri28
   Q48ch+5dIXbliZfxyJz+J3azUfiJWWgCP4r5biSX6c30gAPbB7noJsdrC
   AYJl/vxyV1jJwINr5nDCqORrsPO1DQ6MalXlAltqmsPcU0figmV9wvrTC
   3hzUBQFLk7tosSNC2j8ZmgaPweD0wJjHDfGuWiikXks1TkvUchHyg8Zb7
   fzGDUKHJKOchKHEj4cWzVRbwRZm+RMIJXytBEju9PSObv70Sd77hwlvhD
   /R4guQ4uNRJ3YOFKwchEIfrhvZVMkZGWWgLRxTWqhBoTOLE3+ygbUSyQk
   Q==;
X-CSE-ConnectionGUID: OIPlwOxxTE69XF52RAVhhA==
X-CSE-MsgGUID: eWILk5l6SsmrsoWinnsRkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62855916"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="62855916"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 02:38:02 -0700
X-CSE-ConnectionGUID: ftQeeSyiRVGf1m/MSqezgA==
X-CSE-MsgGUID: hU+SAjeXRxmjrvNVXlhL5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="153718110"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by orviesa005.jf.intel.com with ESMTP; 16 Jun 2025 02:37:59 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com,
	Thinh.Nguyen@synopsys.com,
	Amardeep Rai <amardeep.rai@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/3] USB: core: support eUSB2 double bandwidth large isoc URB frames
Date: Mon, 16 Jun 2025 12:37:29 +0300
Message-ID: <20250616093730.2569328-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616093730.2569328-1-mathias.nyman@linux.intel.com>
References: <20250616093730.2569328-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Amardeep Rai <amardeep.rai@intel.com>

eUSB2 double isochronous in bandwidth devices support up to 6 transactions
per microframe, and thus doubles the total bytes possible to receive per
microframe.

Support larger URB isoc frame sizes for eUSB2 double isoc in endpoints.

Signed-off-by: Amardeep Rai <amardeep.rai@intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/core/urb.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 5e52a35486af..911091b92fd7 100644
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
+				le16_to_cpu(dev->descriptor.bcdUSB == 0x220) &&
+				le16_to_cpu(ep->desc.wMaxPacketSize == 0);
+	if (max < 0 || (max == 0 && !is_eusb2_isoch_double)) {
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
2.43.0


