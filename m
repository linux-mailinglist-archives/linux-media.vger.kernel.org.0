Return-Path: <linux-media+bounces-37463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B164FB01682
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 10:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE1E51CA287F
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 08:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA36B230BDB;
	Fri, 11 Jul 2025 08:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6iHIM6u"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3358C223327;
	Fri, 11 Jul 2025 08:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222933; cv=none; b=Z6meMjQa7D62IQPf9sC01HudIetZR76gAxCHXeuWYFbX+XCFOy75CqICHN1NW7i/JHDhiw+GvaElt5ZKB/7LfCD1oPF4pq4/dJzWOo388iO/7jxWhi7ZIZXbnzoAbh7mZQt1S4NWtP+aOlgY/2fxToZ6pvLsoEE5fXYXsPjiIfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222933; c=relaxed/simple;
	bh=WaE/ZTHDihpD0c9D4ULY8cbsVlwcnXN7IiW87M82JSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=px5dYGqt42rpTznpVPUYsORv1SuWImfpzLFhq52aSLut0dHojWVAd1eThZSx5X+EPr/FNM7NfgTXSqQYIwAk7vAzA3BI3gWSFJV/3S3d8hjCUaptVAWdHovdSljdGXbHDcAciQIqpK8r3jR1bW3WJOZGoNs4YGFv5B367vATX78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6iHIM6u; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752222931; x=1783758931;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WaE/ZTHDihpD0c9D4ULY8cbsVlwcnXN7IiW87M82JSQ=;
  b=X6iHIM6uCwytG0iFbuqF69EYF4nbUJR72PbYu05G1fXQNZrUJym9tdGn
   QxvBsebDRzAjWkEJlIIUGdmMbGoocNHxprOQksH5Esj2876/AsuCzEavD
   WXc3nxDnjsdTzA7pKD7uL4HMn10T4gVLnmgpznd1uNjKBJ6Ym9XA2IUfQ
   uLieF40Vb1/u30PlVjPyEuEVA/F8d/RAvNlJFfJFjB55EF49ST1dxsCYc
   u+/n0k+1AAoLeQvQje7cjZkU8mvHKnvs+GF6YxqYLQMxtELVfSc9HzoXK
   VTbeoo5G3PfaqZQiVQ9SvLW83vNTQ1XCE6puAonkML6GdPph4rCcitKpX
   g==;
X-CSE-ConnectionGUID: FRVEfc+0Sf6GpPp42aUwDg==
X-CSE-MsgGUID: rCZ4qadLT6S76TgPQncdBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="71965159"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="71965159"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 01:34:20 -0700
X-CSE-ConnectionGUID: iPviVP/yTbWB2a1XwDFnLw==
X-CSE-MsgGUID: OGWLqq4TSN2rmo1qLAZLcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="156097093"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.248])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 01:34:17 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DA7DF1206CF;
	Fri, 11 Jul 2025 11:34:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1ua9Cv-006VrS-21;
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
Subject: [PATCH v2 1/4] xhci: Add host support for eUSB2 double isochronous bandwidth devices
Date: Fri, 11 Jul 2025 11:34:10 +0300
Message-Id: <20250711083413.1552423-2-sakari.ailus@linux.intel.com>
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

Detect eUSB2 double isoc bw capable hosts and devices, and set the proper
xhci endpoint context values such as 'Mult', 'Max Burst Size', and 'Max
ESIT Payload' to enable the double isochronous bandwidth endpoints.

Intel xHC uses the endpoint context 'Mult' field for eUSB2 isoc
endpoints even if hosts supporting Large ESIT Payload Capability should
normally ignore the mult field.

Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
Co-developed-by: Kannappan R <r.kannappan@intel.com>
Signed-off-by: Kannappan R <r.kannappan@intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Co-developed-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/usb/host/xhci-caps.h |  2 ++
 drivers/usb/host/xhci-mem.c  | 60 ++++++++++++++++++++++++++++--------
 drivers/usb/host/xhci-ring.c |  6 ++--
 drivers/usb/host/xhci.c      | 16 +++++++++-
 drivers/usb/host/xhci.h      | 20 ++++++++++++
 5 files changed, 88 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
index 4b8ff4815644..723a56052439 100644
--- a/drivers/usb/host/xhci-caps.h
+++ b/drivers/usb/host/xhci-caps.h
@@ -89,3 +89,5 @@
 #define HCC2_GSC(p)             ((p) & (1 << 8))
 /* true: HC support Virtualization Based Trusted I/O Capability */
 #define HCC2_VTC(p)             ((p) & (1 << 9))
+/* true: HC support Double BW on a eUSB2 HS ISOC EP */
+#define HCC2_EUSB2_DIC(p)	((p) & (1 << 11))
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 6680afa4f596..ea51434c80fa 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1328,18 +1328,36 @@ static unsigned int xhci_get_endpoint_interval(struct usb_device *udev,
 	return interval;
 }
 
-/* The "Mult" field in the endpoint context is only set for SuperSpeed isoc eps.
+/*
+ * xHCs without LEC use the "Mult" field in the endpoint context for SuperSpeed
+ * isoc eps, and High speed isoc eps that support bandwidth doubling. Standard
  * High speed endpoint descriptors can define "the number of additional
  * transaction opportunities per microframe", but that goes in the Max Burst
  * endpoint context field.
  */
-static u32 xhci_get_endpoint_mult(struct usb_device *udev,
-		struct usb_host_endpoint *ep)
+static u32 xhci_get_endpoint_mult(struct xhci_hcd *xhci,
+				  struct usb_device *udev,
+				  struct usb_host_endpoint *ep)
 {
-	if (udev->speed < USB_SPEED_SUPER ||
-			!usb_endpoint_xfer_isoc(&ep->desc))
+	bool lec;
+
+	/* xHCI 1.1 with LEC set does not use mult field, except intel eUSB2 */
+	lec = xhci->hci_version > 0x100 && HCC2_LEC(xhci->hcc_params2);
+
+	/* eUSB2 double isoc bw devices are the only USB2 devices using mult */
+	if (xhci_eusb2_is_isoc_bw_double(udev, ep)) {
+		if (!lec || xhci->quirks & XHCI_INTEL_HOST)
+			return 1;
+	}
+
+	/* Oherwise only isoc transfers on hosts without LEC uses mult field */
+	if (!usb_endpoint_xfer_isoc(&ep->desc) || lec)
 		return 0;
-	return ep->ss_ep_comp.bmAttributes;
+
+	if (udev->speed >= USB_SPEED_SUPER)
+		return ep->ss_ep_comp.bmAttributes;
+
+	return 0;
 }
 
 static u32 xhci_get_endpoint_max_burst(struct usb_device *udev,
@@ -1351,8 +1369,18 @@ static u32 xhci_get_endpoint_max_burst(struct usb_device *udev,
 
 	if (udev->speed == USB_SPEED_HIGH &&
 	    (usb_endpoint_xfer_isoc(&ep->desc) ||
-	     usb_endpoint_xfer_int(&ep->desc)))
+	     usb_endpoint_xfer_int(&ep->desc))) {
+		/*
+		 * eUSB2 double isoc bw endpoints max packet field service
+		 * opportunity bits 12:11 are not valid, so set the ctx burst to
+		 * max service opportunity "2" as these eps support transferring
+		 * over 3072 bytes per interval
+		 */
+		if (xhci_eusb2_is_isoc_bw_double(udev, ep))
+			return 2;
+
 		return usb_endpoint_maxp_mult(&ep->desc) - 1;
+	}
 
 	return 0;
 }
@@ -1400,6 +1428,10 @@ static u32 xhci_get_max_esit_payload(struct usb_device *udev,
 	if (udev->speed >= USB_SPEED_SUPER)
 		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
 
+	/* High speed eUSB2 double isoc bw with over 3072 bytes per esit */
+	if (xhci_eusb2_is_isoc_bw_double(udev, ep))
+		return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
+
 	max_packet = usb_endpoint_maxp(&ep->desc);
 	max_burst = usb_endpoint_maxp_mult(&ep->desc);
 	/* A 0 in max burst means 1 transfer per ESIT */
@@ -1437,6 +1469,13 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 
 	ring_type = usb_endpoint_type(&ep->desc);
 
+	/* Ensure host supports double isoc bandwidth for eUSB2 devices */
+	if (xhci_eusb2_is_isoc_bw_double(udev, ep) &&
+	    !HCC2_EUSB2_DIC(xhci->hcc_params2))	{
+		dev_dbg(&udev->dev, "Double Isoc Bandwidth not supported by xhci\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * Get values to fill the endpoint context, mostly from ep descriptor.
 	 * The average TRB buffer lengt for bulk endpoints is unclear as we
@@ -1460,8 +1499,8 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 		}
 	}
 
-	mult = xhci_get_endpoint_mult(udev, ep);
-	max_packet = usb_endpoint_maxp(&ep->desc);
+	mult = xhci_get_endpoint_mult(xhci, udev, ep);
+	max_packet = xhci_usb_endpoint_maxp(udev, ep);
 	max_burst = xhci_get_endpoint_max_burst(udev, ep);
 	avg_trb_len = max_esit_payload;
 
@@ -1482,9 +1521,6 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 	/* xHCI 1.0 and 1.1 indicates that ctrl ep avg TRB Length should be 8 */
 	if (usb_endpoint_xfer_control(&ep->desc) && xhci->hci_version >= 0x100)
 		avg_trb_len = 8;
-	/* xhci 1.1 with LEC support doesn't use mult field, use RsvdZ */
-	if ((xhci->hci_version > 0x100) && HCC2_LEC(xhci->hcc_params2))
-		mult = 0;
 
 	/* Set up the endpoint ring */
 	virt_dev->eps[ep_index].new_ring =
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 94c9c9271658..9abc5bc4e1c0 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3542,7 +3542,7 @@ static u32 xhci_td_remainder(struct xhci_hcd *xhci, int transferred,
 	if ((xhci->quirks & XHCI_MTK_HOST) && (xhci->hci_version < 0x100))
 		trb_buff_len = 0;
 
-	maxp = usb_endpoint_maxp(&urb->ep->desc);
+	maxp = xhci_usb_endpoint_maxp(urb->dev, urb->ep);
 	total_packet_count = DIV_ROUND_UP(td_total_len, maxp);
 
 	/* Queueing functions don't count the current TRB into transferred */
@@ -3559,7 +3559,7 @@ static int xhci_align_td(struct xhci_hcd *xhci, struct urb *urb, u32 enqd_len,
 	u32 new_buff_len;
 	size_t len;
 
-	max_pkt = usb_endpoint_maxp(&urb->ep->desc);
+	max_pkt = xhci_usb_endpoint_maxp(urb->dev, urb->ep);
 	unalign = (enqd_len + *trb_buff_len) % max_pkt;
 
 	/* we got lucky, last normal TRB data on segment is packet aligned */
@@ -4130,7 +4130,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		addr = start_addr + urb->iso_frame_desc[i].offset;
 		td_len = urb->iso_frame_desc[i].length;
 		td_remain_len = td_len;
-		max_pkt = usb_endpoint_maxp(&urb->ep->desc);
+		max_pkt = xhci_usb_endpoint_maxp(urb->dev, urb->ep);
 		total_pkt_count = DIV_ROUND_UP(td_len, max_pkt);
 
 		/* A zero-length transfer still involves at least one packet. */
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 8a819e853288..1ea7d2fb5876 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1332,7 +1332,7 @@ static bool xhci_urb_temp_buffer_required(struct usb_hcd *hcd,
 	struct scatterlist *tail_sg;
 
 	tail_sg = urb->sg;
-	max_pkt = usb_endpoint_maxp(&urb->ep->desc);
+	max_pkt = xhci_usb_endpoint_maxp(urb->dev, urb->ep);
 
 	if (!urb->num_sgs)
 		return ret;
@@ -2920,6 +2920,20 @@ int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep, int
 }
 EXPORT_SYMBOL_GPL(xhci_stop_endpoint_sync);
 
+/*
+ * xhci_usb_endpoint_maxp - get endpoint max packet size
+ * @host_ep: USB host endpoint to be checked
+ *
+ * Returns max packet from the correct descriptor
+ */
+int xhci_usb_endpoint_maxp(struct usb_device *udev,
+			   struct usb_host_endpoint *host_ep)
+{
+	if (xhci_eusb2_is_isoc_bw_double(udev, host_ep))
+		return le16_to_cpu(host_ep->eusb2_isoc_ep_comp.wMaxPacketSize);
+	return usb_endpoint_maxp(&host_ep->desc);
+}
+
 /* Issue a configure endpoint command or evaluate context command
  * and wait for it to finish.
  */
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index a20f4e7cd43a..498b6f6cb7fb 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1736,6 +1736,24 @@ static inline bool xhci_has_one_roothub(struct xhci_hcd *xhci)
 	       (!xhci->usb2_rhub.num_ports || !xhci->usb3_rhub.num_ports);
 }
 
+/*
+ * USB 2.0 specification, chapter 5.6.4 Isochronous Transfer Bus Access
+ * Constraint. A high speed endpoint can move up to 3072 bytes per microframe
+ * (or 192Mb/s).
+ */
+#define MAX_ISOC_XFER_SIZE_HS  3072
+
+static inline bool xhci_eusb2_is_isoc_bw_double(struct usb_device *udev,
+						struct usb_host_endpoint *ep)
+{
+	return le16_to_cpu(udev->descriptor.bcdUSB) == 0x220 &&
+		udev->speed == USB_SPEED_HIGH &&
+		usb_endpoint_xfer_isoc(&ep->desc) &&
+		le16_to_cpu(ep->desc.wMaxPacketSize) == 0 &&
+		le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval) >
+		MAX_ISOC_XFER_SIZE_HS;
+}
+
 #define xhci_dbg(xhci, fmt, args...) \
 	dev_dbg(xhci_to_hcd(xhci)->self.controller , fmt , ## args)
 #define xhci_err(xhci, fmt, args...) \
@@ -1957,6 +1975,8 @@ void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 			      struct xhci_interrupter *ir,
 			      bool clear_ehb);
 void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num);
+int xhci_usb_endpoint_maxp(struct usb_device *udev,
+			   struct usb_host_endpoint *host_ep);
 
 /* xHCI roothub code */
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
-- 
2.39.5


