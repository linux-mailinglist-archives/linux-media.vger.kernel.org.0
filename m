Return-Path: <linux-media+bounces-40445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0C1B2DFBE
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 904444E5C49
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB148292910;
	Wed, 20 Aug 2025 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOecu5n4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9D0283C8E;
	Wed, 20 Aug 2025 14:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755700721; cv=none; b=IvDP3oQvXRlfikQEjXUTJCbKW3YfkIA7MjEQsZNJuUAZWK9aV1eraOf7UcWAt7kku5Nc0JJfd4p/v3uynMfYwwErdFuCNIHbMe1v/wr9hVmct1srSZVth+O0bjvJtg+gyjQ6+AuqPUb99V+0K8xPOFYmfD4+QB+F5OBYWaY8xA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755700721; c=relaxed/simple;
	bh=RDBHXbBxj3oNN9a4450+nCMtON2Q7u1t/TlA04G+nsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lh6/70h5iXLG2okF2PcS/Y+JGu6Vw9a+mFBDJIb3w6ePaaikwXQ6V6qf9WVK9+vFwsoDAkl3xVDmyMqaUeMeMmlH6BipgScsrHTgsUjfjU1ZqCjz8ekspsmlB2TqKKwN9Uz3IemI0b5Hm4BeYz73udpJozTn3VVTopiUNJuZmWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOecu5n4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755700719; x=1787236719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RDBHXbBxj3oNN9a4450+nCMtON2Q7u1t/TlA04G+nsU=;
  b=fOecu5n4eb/VNQrerLf3DKISBWI0rp39VYsLhDlqrvEyEsNgzaSvK63k
   JBmgVOT7pxY1pZ49MaR8iMDeCOxWVV/Q9QhCpkbK6T5eKVA+y8mtSVJP7
   o0AHEL2v5d4b9xwBY6w0BusdXYfwfBDkAihXvICMI8Mc2RPtm8DUO2iT8
   qF5X0u95bQlvEJEjYkR4yeBD0evxQGdjktWmkEGty80evR1XGs4MU6+UR
   ZKM01kAp4+QeSlJR5VOark+yP+zf+TC8cZPn4pp2HGtkXZTHAWpWqFMzP
   2xCaM/tLRmIY1bUkH6NDjCjssIKoVDAK+B3BL+qr8J7UyNVOebXilwWVi
   A==;
X-CSE-ConnectionGUID: gofO+b7XSqqdz/AbU6K/NQ==
X-CSE-MsgGUID: 8ijEQNnTTQqXH2WjqX2ikw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57167797"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57167797"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:38:35 -0700
X-CSE-ConnectionGUID: /6d7NcYgS7yT+fKL5JxdKw==
X-CSE-MsgGUID: gM73X+NXQ36ksJHArQmW7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167368836"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.19])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:38:33 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E0C56121FAB;
	Wed, 20 Aug 2025 17:38:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uojxI-00000002JYd-3kta;
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
Subject: [PATCH v5 7/9] usb: xhci: Add host support for eUSB2 double isochronous bandwidth devices
Date: Wed, 20 Aug 2025 17:38:22 +0300
Message-ID: <20250820143824.551777-8-sakari.ailus@linux.intel.com>
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
 drivers/usb/host/xhci-mem.c  | 53 +++++++++++++++++++++++++++---------
 drivers/usb/host/xhci-ring.c |  6 ++--
 drivers/usb/host/xhci.c      | 16 ++++++++++-
 drivers/usb/host/xhci.h      |  2 ++
 5 files changed, 62 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
index 4b8ff4815644..89bc83e4f1eb 100644
--- a/drivers/usb/host/xhci-caps.h
+++ b/drivers/usb/host/xhci-caps.h
@@ -89,3 +89,5 @@
 #define HCC2_GSC(p)             ((p) & (1 << 8))
 /* true: HC support Virtualization Based Trusted I/O Capability */
 #define HCC2_VTC(p)             ((p) & (1 << 9))
+/* true: HC support Double BW on a eUSB2 HS ISOC EP */
+#define HCC2_EUSB2_DIC(p)       ((p) & (1 << 11))
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index d2c04811191f..78ddcc6761ac 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1330,18 +1330,33 @@ static unsigned int xhci_get_endpoint_interval(struct usb_device *udev,
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
-		return 0;
-	return ep->ss_ep_comp.bmAttributes;
+	bool lec;
+
+	/* xHCI 1.1 with LEC set does not use mult field, except intel eUSB2 */
+	lec = xhci->hci_version > 0x100 && HCC2_LEC(xhci->hcc_params2);
+
+	/* eUSB2 double isoc bw devices are the only USB2 devices using mult */
+	if (usb_endpoint_is_hs_isoc_double(udev, ep) &&
+	    (!lec || xhci->quirks & XHCI_INTEL_HOST))
+		return 1;
+
+	/* SuperSpeed isoc transfers on hosts without LEC uses mult field */
+	if (udev->speed >= USB_SPEED_SUPER &&
+	    usb_endpoint_xfer_isoc(&ep->desc) && !lec)
+		return ep->ss_ep_comp.bmAttributes;
+
+	return 0;
 }
 
 static u32 xhci_get_endpoint_max_burst(struct usb_device *udev,
@@ -1353,8 +1368,16 @@ static u32 xhci_get_endpoint_max_burst(struct usb_device *udev,
 
 	if (udev->speed == USB_SPEED_HIGH &&
 	    (usb_endpoint_xfer_isoc(&ep->desc) ||
-	     usb_endpoint_xfer_int(&ep->desc)))
+	     usb_endpoint_xfer_int(&ep->desc))) {
+		/*
+		 * USB 2 Isochronous Double IN Bandwidth ECN uses fixed burst
+		 * size and max packets bits 12:11 are invalid.
+		 */
+		if (usb_endpoint_is_hs_isoc_double(udev, ep))
+			return 2;
+
 		return usb_endpoint_maxp_mult(&ep->desc) - 1;
+	}
 
 	return 0;
 }
@@ -1409,6 +1432,13 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 
 	ring_type = usb_endpoint_type(&ep->desc);
 
+	/* Ensure host supports double isoc bandwidth for eUSB2 devices */
+	if (usb_endpoint_is_hs_isoc_double(udev, ep) &&
+	    !HCC2_EUSB2_DIC(xhci->hcc_params2))	{
+		dev_dbg(&udev->dev, "Double Isoc Bandwidth not supported by xhci\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * Get values to fill the endpoint context, mostly from ep descriptor.
 	 * The average TRB buffer lengt for bulk endpoints is unclear as we
@@ -1432,8 +1462,8 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 		}
 	}
 
-	mult = xhci_get_endpoint_mult(udev, ep);
-	max_packet = usb_endpoint_maxp(&ep->desc);
+	mult = xhci_get_endpoint_mult(xhci, udev, ep);
+	max_packet = xhci_usb_endpoint_maxp(udev, ep);
 	max_burst = xhci_get_endpoint_max_burst(udev, ep);
 	avg_trb_len = max_esit_payload;
 
@@ -1454,9 +1484,6 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 	/* xHCI 1.0 and 1.1 indicates that ctrl ep avg TRB Length should be 8 */
 	if (usb_endpoint_xfer_control(&ep->desc) && xhci->hci_version >= 0x100)
 		avg_trb_len = 8;
-	/* xhci 1.1 with LEC support doesn't use mult field, use RsvdZ */
-	if ((xhci->hci_version > 0x100) && HCC2_LEC(xhci->hcc_params2))
-		mult = 0;
 
 	/* Set up the endpoint ring */
 	virt_dev->eps[ep_index].new_ring =
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ecd757d482c5..ed2fa2c15535 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3545,7 +3545,7 @@ static u32 xhci_td_remainder(struct xhci_hcd *xhci, int transferred,
 	if ((xhci->quirks & XHCI_MTK_HOST) && (xhci->hci_version < 0x100))
 		trb_buff_len = 0;
 
-	maxp = usb_endpoint_maxp(&urb->ep->desc);
+	maxp = xhci_usb_endpoint_maxp(urb->dev, urb->ep);
 	total_packet_count = DIV_ROUND_UP(td_total_len, maxp);
 
 	/* Queueing functions don't count the current TRB into transferred */
@@ -3562,7 +3562,7 @@ static int xhci_align_td(struct xhci_hcd *xhci, struct urb *urb, u32 enqd_len,
 	u32 new_buff_len;
 	size_t len;
 
-	max_pkt = usb_endpoint_maxp(&urb->ep->desc);
+	max_pkt = xhci_usb_endpoint_maxp(urb->dev, urb->ep);
 	unalign = (enqd_len + *trb_buff_len) % max_pkt;
 
 	/* we got lucky, last normal TRB data on segment is packet aligned */
@@ -4133,7 +4133,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		addr = start_addr + urb->iso_frame_desc[i].offset;
 		td_len = urb->iso_frame_desc[i].length;
 		td_remain_len = td_len;
-		max_pkt = usb_endpoint_maxp(&urb->ep->desc);
+		max_pkt = xhci_usb_endpoint_maxp(urb->dev, urb->ep);
 		total_pkt_count = DIV_ROUND_UP(td_len, max_pkt);
 
 		/* A zero-length transfer still involves at least one packet. */
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 47151ca527bf..e193d4dc414c 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1334,7 +1334,7 @@ static bool xhci_urb_temp_buffer_required(struct usb_hcd *hcd,
 	struct scatterlist *tail_sg;
 
 	tail_sg = urb->sg;
-	max_pkt = usb_endpoint_maxp(&urb->ep->desc);
+	max_pkt = xhci_usb_endpoint_maxp(urb->dev, urb->ep);
 
 	if (!urb->num_sgs)
 		return ret;
@@ -2922,6 +2922,20 @@ int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep, int
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
+	if (usb_endpoint_is_hs_isoc_double(udev, host_ep))
+		return le16_to_cpu(host_ep->eusb2_isoc_ep_comp.wMaxPacketSize);
+	return usb_endpoint_maxp(&host_ep->desc);
+}
+
 /* Issue a configure endpoint command or evaluate context command
  * and wait for it to finish.
  */
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index a20f4e7cd43a..2721f700c022 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1957,6 +1957,8 @@ void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 			      struct xhci_interrupter *ir,
 			      bool clear_ehb);
 void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num);
+int xhci_usb_endpoint_maxp(struct usb_device *udev,
+			   struct usb_host_endpoint *host_ep);
 
 /* xHCI roothub code */
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
-- 
2.47.2


