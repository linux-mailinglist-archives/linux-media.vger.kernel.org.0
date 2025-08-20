Return-Path: <linux-media+bounces-40443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA99B2DF9D
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6411E1888FEB
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC9928641E;
	Wed, 20 Aug 2025 14:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VT9zGo78"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E842C27D771;
	Wed, 20 Aug 2025 14:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755700719; cv=none; b=pezbi4cA8lKZ9OCpWB9725OFtOXNPhxf4hd04/kjdPnqa3eEKdHOWMdi9Hwg4dRy3JeoiKy5Er00EWxaEdlNUS2Wt7AX+oOraV16sjfUAGKbYISbFc5Hjnta764DSe7nbc0CnHbMsHO7iA9HK+CFSERCxpfdU2t5lDYZ/htE2gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755700719; c=relaxed/simple;
	bh=BWLA8NyQymYqgp4W4q1/N6dJ7i3U2k10OE+hF7iKINY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iq/O83+0rud3qB2yWzLA6UkNe9vNjxU4qxGOAixC7DhVHBCn4IKIJlBKmPIt6ZZHYCrUSpZf9L2IIsXPVYGD5bi8w5Yg/gvdDF8xE2RuB6Yy1PeXSt3v81Nbb4sdhEn6Mlp2WGhR6DWmlJPk+eCO02JOR71pmhvZW2ciP5hrYHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VT9zGo78; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755700718; x=1787236718;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BWLA8NyQymYqgp4W4q1/N6dJ7i3U2k10OE+hF7iKINY=;
  b=VT9zGo78bblLMLeTmNihfXw7Ho7IOkAmxw/mp9f2hhksK6zo6o6EaeiL
   jdPVATWMMWVqdG2iRETYs7Vxy4Q7d44Wgp+wtPD0teF6FjGP8Cs+6QKrS
   uxCuZxh9qjxgSoZU6QSyVlZlvjLtfjqm86rb81x/9x69+7TYb2aVZi+ad
   xJlSFsmT2WjYlGw3weo/J2RvbxJzYbwx6WzQ5xs3/KSK4GDRLvmg8WwsH
   3GFWvKRRmk4gdlFwj9KNDfhZX/8p4Ldgf6btKVfgQSOPAilxPEH18zEi8
   RRBwcIuEyiHfX74HiXAhkofXia+KCFHb33J+jjS+17xRrTU7cuN1GFcoB
   A==;
X-CSE-ConnectionGUID: jczU4iNJQvizAV9R3AQtbw==
X-CSE-MsgGUID: OlHM+gnYROW8g9gUldeRHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57167774"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57167774"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:38:35 -0700
X-CSE-ConnectionGUID: 0QYJhf53S7GQygS/QccVSw==
X-CSE-MsgGUID: wScCQPMVT5+iFPw9QjPzCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167368830"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.19])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:38:33 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DE3F1121FAA;
	Wed, 20 Aug 2025 17:38:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uojxI-00000002JYY-3gNl;
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
Subject: [PATCH v5 6/9] usb: core: Introduce usb_endpoint_is_hs_isoc_double()
Date: Wed, 20 Aug 2025 17:38:21 +0300
Message-ID: <20250820143824.551777-7-sakari.ailus@linux.intel.com>
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

Introduce usb_endpoint_is_hs_isoc_double() tell whether an endpoint
conforms to USB 2.0 Isochronous Double IN Bandwidth ECN.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/usb/core/usb.c | 19 +++++++++++++++++++
 include/linux/usb.h    |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index ca9ff6ad8e73..939dc4aafb89 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -1139,6 +1139,25 @@ u32 usb_endpoint_max_periodic_payload(struct usb_device *udev,
 }
 EXPORT_SYMBOL_GPL(usb_endpoint_max_periodic_payload);
 
+/**
+ * usb_endpoint_is_hs_isoc_double - Tell whether an endpoint uses USB 2
+ *                                  Isochronous Double IN Bandwidth
+ * @udev: The USB device
+ * @ep: The endpoint
+ *
+ * Returns: true if an endpoint @ep conforms to USB 2 Isochronous Double IN
+ * Bandwidth ECN, false otherwise.
+ */
+bool usb_endpoint_is_hs_isoc_double(struct usb_device *udev,
+				    const struct usb_host_endpoint *ep)
+{
+	return ep->eusb2_isoc_ep_comp.bDescriptorType &&
+		le16_to_cpu(udev->descriptor.bcdUSB) == 0x220 &&
+		usb_endpoint_is_isoc_in(&ep->desc) &&
+		!le16_to_cpu(ep->desc.wMaxPacketSize);
+}
+EXPORT_SYMBOL_GPL(usb_endpoint_is_hs_isoc_double);
+
 /*
  * Notifications of device and interface registration
  */
diff --git a/include/linux/usb.h b/include/linux/usb.h
index e9cf2786d8bd..70ef00c42d22 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -2042,6 +2042,9 @@ static inline u16 usb_maxpacket(struct usb_device *udev, int pipe)
 u32 usb_endpoint_max_periodic_payload(struct usb_device *udev,
 				      const struct usb_host_endpoint *ep);
 
+bool usb_endpoint_is_hs_isoc_double(struct usb_device *udev,
+				    const struct usb_host_endpoint *ep);
+
 /* translate USB error codes to codes user space understands */
 static inline int usb_translate_errors(int error_code)
 {
-- 
2.47.2


