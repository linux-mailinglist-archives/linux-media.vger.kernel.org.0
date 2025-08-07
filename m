Return-Path: <linux-media+bounces-38991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F0FB1D22E
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 07:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E448F58098A
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 05:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851FB21C9E4;
	Thu,  7 Aug 2025 05:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="keZeezJU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CD1214A6A;
	Thu,  7 Aug 2025 05:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754546044; cv=none; b=oHIQS2jQgbzpt+VoQKbh8Gfqft7ENoapmc80vod8UASdPHhVlSCqGNKJyYacEAowpoYOJ62EHsin9kPssVOd9qNZpl2s8Mz7lkIq2ITy/CNY2PbSQBXd7TNO8blvUpwRnuM10k2KLjdA2z5yK6MZ7WhVBzlUDiOhOB683PRpkeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754546044; c=relaxed/simple;
	bh=oi7o9HiifSyEnpugZvUbXcbZQUeOPIb3s/qYcSGQzds=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ec3apMhoZKTg4j4u1lxeA+Uaf47XRI6v1UoaWo41v/v+vCad+kYnjdfiZDDa36rpHXffJUK5mzApJHq7dYE/w5sRee9bFPF7QKFbDmCT/6cXjfRaaYCUmC5qHSjbqW3DCgx1H7j2C77YOj63/GiVeUdPAbi6N1v0HBJ7aUo5ecY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=keZeezJU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754546043; x=1786082043;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oi7o9HiifSyEnpugZvUbXcbZQUeOPIb3s/qYcSGQzds=;
  b=keZeezJUTSreqjtBPLGYBYgad8/fF4n4EQeP31QC8oIvDwkauLy8wGXq
   ykoS+FUV91CMlbGIKmMxU+DC4eCE2y7igk/ZtBxSmELK4xhgOQExdFLFQ
   2qsoLfKj0gVzupzI6rDyv8UEU0yxjkYUFQ/CeAIhMsmk08H1igvrIIUt9
   tcP6wtHplfspt8S40oERJvXuyZqlMv/gelquTX2yBggRxqAK1FmY1EEiT
   1QRE+AsekCPGXxe+9q+2LQ0cXcs/ZF3Jk7dVe+wrNsoFAEDIK56vVA+Qt
   LqKTsF2X+DhSS9oWgPyvo+gvGJARX55dq8SF9Hm7bTZ6qjbhTJoC0RwxI
   A==;
X-CSE-ConnectionGUID: l73Yy5x8TPCCIvyur5Ln/A==
X-CSE-MsgGUID: DkpCKOb9TqCJPkRRj8fJVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60501945"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60501945"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 22:54:00 -0700
X-CSE-ConnectionGUID: RMGVNd8BTAiqGS00ZRjDzA==
X-CSE-MsgGUID: 3b7YNV5SQhCHuJNKIODRgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="202144609"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.255])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 22:53:58 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 38AC411FC4F;
	Thu,  7 Aug 2025 08:53:55 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1ujtZc-005H1A-0n;
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
Subject: [PATCH v3 3/4] USB: Add a function to obtain USB version independent maximum bpi value
Date: Thu,  7 Aug 2025 08:53:54 +0300
Message-Id: <20250807055355.1257029-4-sakari.ailus@linux.intel.com>
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

Add usb_endpoint_max_isoc_bpi() to obtain maximum bytes per interval for
isochronous endpoints in a USB version independent way.

Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans de Goede <hansg@kernel.org>
---
 include/linux/usb.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/linux/usb.h b/include/linux/usb.h
index 535ac37198a1..da0f51dfe15f 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -2049,6 +2049,37 @@ static inline int usb_translate_errors(int error_code)
 	}
 }
 
+/**
+ * usb_endpoint_max_isoc_bpi - Get maximum isochronous transfer bytes per interval
+ * @dev: The USB device
+ * @ep: The endpoint
+ *
+ * Returns: the maximum number of bytes isochronous endpoint @endpoint can
+ * transfer in during a service interval, or 0 for non-isochronous endpoints.
+ */
+static inline u32 usb_endpoint_max_isoc_bpi(struct usb_device *dev,
+					    const struct usb_host_endpoint *ep)
+{
+	if (usb_endpoint_type(&ep->desc) != USB_ENDPOINT_XFER_ISOC)
+		return 0;
+
+	switch (dev->speed) {
+	case USB_SPEED_SUPER_PLUS:
+		if (USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes))
+			return le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
+		fallthrough;
+	case USB_SPEED_SUPER:
+		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
+	case USB_SPEED_HIGH:
+		if (ep->eusb2_isoc_ep_comp.bDescriptorType &&
+		    !usb_endpoint_maxp(&ep->desc) && usb_endpoint_dir_in(&ep->desc))
+			return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
+		fallthrough;
+	default:
+		return usb_endpoint_maxp(&ep->desc) * usb_endpoint_maxp_mult(&ep->desc);
+	}
+}
+
 /* Events from the usb core */
 #define USB_DEVICE_ADD		0x0001
 #define USB_DEVICE_REMOVE	0x0002
-- 
2.39.5


