Return-Path: <linux-media+bounces-39593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 646F1B22896
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 15:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B39F561002
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 13:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AECE280339;
	Tue, 12 Aug 2025 13:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UB0VZK8X"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C901527FD46;
	Tue, 12 Aug 2025 13:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755005099; cv=none; b=YkdxD09az0rUTUW68A1COnVB2rcGNQYnM9z2ISTOqAmOSRLgdvPsJCRcf9sUtccolYFfiAfmPSNROe/lc0oRFebxBbp/9IwEc1+tr9A6y7W9qPMaMq9aYktprhKsqlRjJIlc2LD3uHFRS0liPtyZvCprb5YGSEkjW1T9ey/AufA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755005099; c=relaxed/simple;
	bh=mTuIX/LJJ66fnhlHiVPxMpengPtS8Rmim9PTaSfsWuI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pqMILj6KFs1pzwDdKCW6zF3fCBDZ9HHSCNIvBAhTicpg2tC9NU5mjMsH1BtcBFnUByyOprlfLszZeoC45uehFSpoJB3q5YtnMp6nnV6X7+Uze+m2lxtGXvu+zmMXk82kCM3EXPpA2yYVB3VEtfvegwwpXzMYQqo6oqFr03agLyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UB0VZK8X; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755005098; x=1786541098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mTuIX/LJJ66fnhlHiVPxMpengPtS8Rmim9PTaSfsWuI=;
  b=UB0VZK8XN9AP8VHheu8Cq0MW7O48ihxMqebCQHNA8zaZ3l4O7Sz9FSlU
   0C2bSQMj1VKzRsRQfmP9nAPbHejoIu5ebZC7ubtYyuIe4tldwviuJiJTc
   z5TL2lF8YHlus7PTn7yB1vXgTDRU0J7g2iQcpHRKHHDWXAMl+dp8ibWEY
   gI2a+MjH7IRIQuVJexQgsgNIR0P3ECh8fG5QXCpfM/XvvCWU0DvaDn89u
   uljiSKYee2yL6UNx8hCokWTO4LkDTUtZb2axwsAW8AolE4FXtlLW+vHlj
   1JBdINRacFeVzkF3Ed3tooTaDiUmWngFLTTMUNmJmYSHoW6bBtgtmiu6P
   w==;
X-CSE-ConnectionGUID: FPErh3VVRTeULr2G1QR+ZA==
X-CSE-MsgGUID: 737TjNOYS6mpbXNGMC5XBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68349674"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="68349674"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:24:52 -0700
X-CSE-ConnectionGUID: COSzvyiCQ+a48nFDoXpINw==
X-CSE-MsgGUID: k1nzq91UThCyfj0NohBCrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166987269"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.110])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:24:48 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2F65511FC4F;
	Tue, 12 Aug 2025 16:24:46 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uloze-00DMZt-03;
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
Subject: [PATCH v4 3/4] USB: Add a function to obtain USB version independent maximum bpi value
Date: Tue, 12 Aug 2025 16:24:44 +0300
Message-Id: <20250812132445.3185026-4-sakari.ailus@linux.intel.com>
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

Add usb_endpoint_max_isoc_bpi() to obtain maximum bytes per interval for
isochronous endpoints in a USB version independent way.

Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans de Goede <hansg@kernel.org>
---
 drivers/usb/core/usb.c | 32 ++++++++++++++++++++++++++++++++
 include/linux/usb.h    |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index fca7735fc660..3e80a5b3e41b 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -1110,6 +1110,38 @@ void usb_free_noncoherent(struct usb_device *dev, size_t size,
 }
 EXPORT_SYMBOL_GPL(usb_free_noncoherent);
 
+/**
+ * usb_endpoint_max_isoc_bpi - Get maximum isochronous transfer bytes per interval
+ * @dev: The USB device
+ * @ep: The endpoint
+ *
+ * Returns: the maximum number of bytes isochronous endpoint @endpoint can
+ * transfer in during a service interval, or 0 for non-isochronous endpoints.
+ */
+u32 usb_endpoint_max_isoc_bpi(struct usb_device *dev,
+			      const struct usb_host_endpoint *ep)
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
+EXPORT_SYMBOL_GPL(usb_endpoint_max_isoc_bpi);
+
 /*
  * Notifications of device and interface registration
  */
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 535ac37198a1..b38978abc3d6 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -2049,6 +2049,9 @@ static inline int usb_translate_errors(int error_code)
 	}
 }
 
+u32 usb_endpoint_max_isoc_bpi(struct usb_device *dev,
+			      const struct usb_host_endpoint *ep);
+
 /* Events from the usb core */
 #define USB_DEVICE_ADD		0x0001
 #define USB_DEVICE_REMOVE	0x0002
-- 
2.39.5


