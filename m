Return-Path: <linux-media+bounces-39595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E46A4B2287E
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 15:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AB1E4264FD
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 13:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992CD281357;
	Tue, 12 Aug 2025 13:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zb0nJZ7c"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9E027FB2D;
	Tue, 12 Aug 2025 13:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755005101; cv=none; b=Fpq6XfkrjkLjUb7OT0dUNtIBfGGgMRz3MVHtJJXcodnxqkOQ4isTNVfo+M9cK3eO34er5t6COOijgpIc83sIJbziaR5HJebEIvwpmfd7oOzzPTApvL5d6YRwftVLw8uuASz+1zSQt8xPAefPh+WwdTJHxecNsP1RdWNGTNYi1wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755005101; c=relaxed/simple;
	bh=xGAbYps5GPfkgb8ITBINxKpJM3S8sNZQ/8rXv2Y/pIk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BEgU5645t8hBf177GJm4cx9WfGpYbnqnG/I4Mx5vjYfAhWcJv8iY7yNVgLvGmFN8Iwxrl0yYsH6D133KMDimp+2R4vZmRgmUAiLdKWZ2k7nj0MTINqsmGwivb8CJRQYlA31fSYoEpxlNRHUx43forYxEZ7N9azImcJ5+haGDg5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zb0nJZ7c; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755005100; x=1786541100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xGAbYps5GPfkgb8ITBINxKpJM3S8sNZQ/8rXv2Y/pIk=;
  b=Zb0nJZ7c67MVuvWMSqmr8n3i5Khi4q6x78MYXpodcBX0j1QxmJKSeYCN
   ClqdStGL+j0uiPqeXOXa3bJD6bOvLilcBN9UNGUd8ntxnSItz3znM9nKx
   sC3aR8gKF+Qkme8/yKrFO/+J7oIPGKU97/HPxgIWPF1CJNvWAS+53CMjP
   CVzBLRYsI3IPDCoJhiwnq//SwmgJ5iJlIayGtJlinQnHY0aSajZSxoUEM
   TWRyMWlU7dxlP/qaFLDtwurzYDq+hoUQCJDWWy9OAage+yDax3MegqP+b
   O+/vovcIkCcsJ97QM582XRYxA49kW4IQRkUbBH9/+S1DoD6Jt9IdcrLwD
   Q==;
X-CSE-ConnectionGUID: MKPKNs1tRr2NXSVUh4eTRw==
X-CSE-MsgGUID: dc3PQb9NT8OE+/sK0gNsfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68349681"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="68349681"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:24:53 -0700
X-CSE-ConnectionGUID: U0qPYmJRS+a3mJJd+f1CAg==
X-CSE-MsgGUID: WfJhdVhxSouybC9VRdIvQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166987268"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.110])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:24:48 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2A80D11F91E;
	Tue, 12 Aug 2025 16:24:46 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uloze-00DMZp-00;
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
Subject: [PATCH v4 2/4] USB: core: support eUSB2 double bandwidth large isoc URB frames
Date: Tue, 12 Aug 2025 16:24:43 +0300
Message-Id: <20250812132445.3185026-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250812132445.3185026-1-sakari.ailus@linux.intel.com>
References: <20250812132445.3185026-1-sakari.ailus@linux.intel.com>
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
Acked-by: Alan Stern <stern@rowland.harvard.edu>
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


