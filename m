Return-Path: <linux-media+bounces-40441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B43DB2DFBA
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 622FF3BB820
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7986A283FD3;
	Wed, 20 Aug 2025 14:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRY5HAs0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C81927A92B;
	Wed, 20 Aug 2025 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755700718; cv=none; b=A4gKPwAgkSK4fpXDBO45JgLtnMLJdcJpYgox4lkfzCZ99BfxJPUxM9/yKkvCEkNTg5cPVmTfnOveH7/Y1WlLzzjx2KVVV+2kyrQY4GL9oEozJpoGg1808xNga3LbaIsVPCn6MDjYWAPpWMuzikAe1sndwBrsT5kdO+EkCZKOJqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755700718; c=relaxed/simple;
	bh=C+o3YjOTbmhlBjQbakMAQhXFMWRNCHKOXQ7EpWSF5qg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WWtr9e55/HaCc7jbvLQN3LiW0R4QbXk/yE82wsgBYjJwOKvybatpQlo3oFaKA9KGYKkAkelJU+rWYC5CmMK8hXNooYr4iOr3BpX8Ii2nF0dCn/zHdExzCgUlg2iT2PYb8T0aRMmAL34VC88CKmcdqDTFhMYIf4TuZppbbPrgutg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TRY5HAs0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755700717; x=1787236717;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C+o3YjOTbmhlBjQbakMAQhXFMWRNCHKOXQ7EpWSF5qg=;
  b=TRY5HAs0SCX7d2gIdB4aIa+6QZMkflJ0eXpB2IYR3VUh98xyrpn2Gc3c
   c8dM6jOu4Lrv6/CR/sB6HXNReRbYPzNhdz7P+HeRbAYMh5uWQ04EbDBs2
   CcaydW4pGybEOOVGHa6zyijU6T/kFYUo0qEOh5K9AVQQWa4D56asFv9pf
   EP1Q7vxWaZNBA1pZw+vR4jYXn/b/bouxMajlWN+HHMZyAjpz6zczxhDHQ
   53jk4lCsUP9OVwP43K0zILjNNfZmwUXHezD6AwdMXnGp8OHowNPVUKqjg
   ROPfblfZba0YLbuHfeRjADEKVsGIKZby4/qKJ20v0AZjS5xZ/dQw2q5F2
   w==;
X-CSE-ConnectionGUID: 261SqqC2TtO4miPYTKYXLA==
X-CSE-MsgGUID: feLIQ24VTyKkYgFTHeCWcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57167786"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57167786"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:38:35 -0700
X-CSE-ConnectionGUID: maZuz23URrOYUi1uLSP1jA==
X-CSE-MsgGUID: aO9WQP9aTVCR2cjhI//jrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167368834"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.19])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:38:33 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D9F3B121FA9;
	Wed, 20 Aug 2025 17:38:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uojxI-00000002JYQ-3bwG;
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
Subject: [PATCH v5 5/9] usb: xhci: Use usb_endpoint_max_periodic_payload()
Date: Wed, 20 Aug 2025 17:38:20 +0300
Message-ID: <20250820143824.551777-6-sakari.ailus@linux.intel.com>
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

Use the newly added usb_endpoint_max_periodic_payload() to obtain the
maximum number of bytes to transfer during a service interval for
isochronous and interrupt endpoints. This will replace the xhci-specific
xhci_get_max_esit_payload() which is removed as redundant.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 32 +-------------------------------
 1 file changed, 1 insertion(+), 31 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 07289333a1e8..d2c04811191f 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1378,36 +1378,6 @@ static u32 xhci_get_endpoint_type(struct usb_host_endpoint *ep)
 	return 0;
 }
 
-/* Return the maximum endpoint service interval time (ESIT) payload.
- * Basically, this is the maxpacket size, multiplied by the burst size
- * and mult size.
- */
-static u32 xhci_get_max_esit_payload(struct usb_device *udev,
-		struct usb_host_endpoint *ep)
-{
-	int max_burst;
-	int max_packet;
-
-	/* Only applies for interrupt or isochronous endpoints */
-	if (usb_endpoint_xfer_control(&ep->desc) ||
-			usb_endpoint_xfer_bulk(&ep->desc))
-		return 0;
-
-	/* SuperSpeedPlus Isoc ep sending over 48k per esit */
-	if ((udev->speed >= USB_SPEED_SUPER_PLUS) &&
-	    USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes))
-		return le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
-
-	/* SuperSpeed or SuperSpeedPlus Isoc ep with less than 48k per esit */
-	if (udev->speed >= USB_SPEED_SUPER)
-		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
-
-	max_packet = usb_endpoint_maxp(&ep->desc);
-	max_burst = usb_endpoint_maxp_mult(&ep->desc);
-	/* A 0 in max burst means 1 transfer per ESIT */
-	return max_packet * max_burst;
-}
-
 /* Set up an endpoint with one ring segment.  Do not allocate stream rings.
  * Drivers will have to call usb_alloc_streams() to do that.
  */
@@ -1445,7 +1415,7 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 	 * have no clue on scatter gather list entry size. For Isoc and Int,
 	 * set it to max available. See xHCI 1.1 spec 4.14.1.1 for details.
 	 */
-	max_esit_payload = xhci_get_max_esit_payload(udev, ep);
+	max_esit_payload = usb_endpoint_max_periodic_payload(udev, ep);
 	interval = xhci_get_endpoint_interval(udev, ep);
 
 	/* Periodic endpoint bInterval limit quirk */
-- 
2.47.2


