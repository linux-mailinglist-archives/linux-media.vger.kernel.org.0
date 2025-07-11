Return-Path: <linux-media+bounces-37459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8BFB01666
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 10:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5457B40E53
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 08:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A37D2236F3;
	Fri, 11 Jul 2025 08:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ksDp6Nru"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7BD20C009;
	Fri, 11 Jul 2025 08:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222928; cv=none; b=skDJI+gpIb9+7BS6fQ31ujKAQNZbKQK1S7nV3UQKYP2dsEkGTSqZW6hCsy9UqzXf4jswhbeklqeQFrgbdajJUlZSYdkO+uN+c8COJiTRf0JnaFhbXnQ/Fh4qR88XnyvnkgftPGxeT0fKCdipaO1KweKh2GKgkbm92SUurJ/tgZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222928; c=relaxed/simple;
	bh=/61z1vRuVF9vGtozMon/4vHnhn12LmdN4a7nQlDa3Ug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YUlT7hNwTgwgwpxJQWAGFOmYJdagAZ6IXoGlzJWukKLdgpNXukQQyy9+aLREkv0fnGeIVYrSKuX43AL81r5gSHaC0BNVWnH+/qV2wiqekWtJsyh4Ej0vJwU+61Xr+gZjRG6DGuFQa971ebJgSJelqKcLeoiLzAlc4zR+NHAlkzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ksDp6Nru; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752222928; x=1783758928;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/61z1vRuVF9vGtozMon/4vHnhn12LmdN4a7nQlDa3Ug=;
  b=ksDp6Nru3oasuOKNT98iAYFDm7UrnhHaChENdyuHF3Mke6gtFCTP3kap
   Ic4zKYFZkUudjRDPcSU9bLyDhEgnHW4wHrRA9P6N3G6NRB23Fei8qkYNi
   SYk04+ISiVWwRDEdiuFGQT2hNvLGiAosrrAzXODzJeIif5N+wxFRRcrD/
   lieD93B1azlLLrLJAczxqvRHSVPy7ZUMTKpfpAqh6iChS5/L5kEKjPkbS
   OXmlNIKHl+UN6Ijb/dkiliLtINWS6ZpydJxYT6Tp6TO1eheoG099Bo90l
   VOaLNCAcxtSNU7J8F424OZegN3feMfQ4wUYvfoiwuQ/B9Co4HUMQ9r9Vy
   w==;
X-CSE-ConnectionGUID: UwWgBEjOR9+M62c5YnR7lg==
X-CSE-MsgGUID: O+dTx3XYSoaaZWg7TomKtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="71965135"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="71965135"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 01:34:19 -0700
X-CSE-ConnectionGUID: vB3UySmZT6iGPVFat9Kauw==
X-CSE-MsgGUID: 5SkhypF7T8urC2pWMNlufQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="156097087"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.248])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 01:34:17 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DC53B1206EB;
	Fri, 11 Jul 2025 11:34:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1ua9Cv-006Vra-2C;
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
Subject: [PATCH v2 3/4] USB: Add a function to obtain USB version independent maximum bpi value
Date: Fri, 11 Jul 2025 11:34:12 +0300
Message-Id: <20250711083413.1552423-4-sakari.ailus@linux.intel.com>
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

Add usb_endpoint_max_isoc_bpi() to obtain maximum bytes per interval for
isochronous endpoints in a USB version independent way.

Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/linux/usb.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/usb.h b/include/linux/usb.h
index 68166718ab30..bd70bd5ca82d 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -2038,6 +2038,28 @@ static inline int usb_translate_errors(int error_code)
 	}
 }
 
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
+		if (!usb_endpoint_maxp(&ep->desc) && le16_to_cpu(dev->descriptor.bcdUSB) == 0x220)
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


