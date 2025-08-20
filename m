Return-Path: <linux-media+bounces-40439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BB8B2DFB6
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ABDE3B4F75
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E1E27A92A;
	Wed, 20 Aug 2025 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOCPIFZw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D7A277C88;
	Wed, 20 Aug 2025 14:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755700717; cv=none; b=OlhpAmIMVITUbC+7xW6hdrqcljs6IZeyOxvVnZq2CqNZyLd+HO+h8hrEmVoSEJlo4S0SVsETeyMdbZpVM75cCqp85M3VxwNE/nB5z7zlqt3Z4gk5GOuAAEFMeZlpW8Lw6UsutZeB0/cyIYT7iAJ2apKg3bZyTSNdmRT/dey8A/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755700717; c=relaxed/simple;
	bh=rayykEdii9uM7WLI5yVA1XJxx/BDevTRmrThQcnhAB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tF0OY/R6R2Y9nniW6uuqWOQCPfA/Ld0NXIJLeawxHxOL4OuPRnf+dukh39k34LzWVuJyx7UYHTLZCN6kLZBdVy6K4Rx0xApzI51u/IvI8a2UXW+oWjlUm0YYwlHvZGoIpgqneGUPQ9xXLwEQ4EBGy+sSDdm093pqDdrEr97CNhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GOCPIFZw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755700715; x=1787236715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rayykEdii9uM7WLI5yVA1XJxx/BDevTRmrThQcnhAB8=;
  b=GOCPIFZwTs1hJcU0oZPXUcFPf3RHkHJgkszPkyloidw0tl1Fi9Ax3jCk
   TkSsnfJro75koPRO1VVywrHxxnyQjP5uf/GOguEGchEFRpjqQlmXFSNt5
   DWXwFSMotH0vOTPqWk1Q0F7/Xif6v2zKpLtsDiebqvmDPYYNnOg+0WJ67
   YIZOTJUAVwTbJ0ISlyOW15fsm8q7e02rM38NI5QdGcRO2CUFIsUUmRLFQ
   E+0Np6gLf2LZ6ADGZLI2mv2qMnoSn3fRz8fhtcAqBVRBHjfmyxbkDzEla
   1E0nEV0Jm89aKD84hFfYmuer6yn62AjlPtZ67TkCfuREL0rAm0FRxk1k4
   A==;
X-CSE-ConnectionGUID: xrje3xjeTg+UyVSNY7p8UA==
X-CSE-MsgGUID: EdU9HnGlQJakoO9tAVjqTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57167754"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57167754"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:38:30 -0700
X-CSE-ConnectionGUID: V1i/iTWDSem7g2AAUIN+Ig==
X-CSE-MsgGUID: Sdc59zCpT5eykfS/4HXsSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167368811"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.19])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:38:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D6BE7121FA8;
	Wed, 20 Aug 2025 17:38:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uojxI-00000002JYM-3Y5s;
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
Subject: [PATCH v5 4/9] usb: core: Add a function to get USB version independent periodic payload
Date: Wed, 20 Aug 2025 17:38:19 +0300
Message-ID: <20250820143824.551777-5-sakari.ailus@linux.intel.com>
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

Add usb_endpoint_max_periodic_payload() to obtain maximum payload bytes in
a service interval for isochronous and interrupt endpoints in a USB
version independent way.

Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans de Goede <hansg@kernel.org>
---
 drivers/usb/core/usb.c | 29 +++++++++++++++++++++++++++++
 include/linux/usb.h    |  3 +++
 2 files changed, 32 insertions(+)

diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index fca7735fc660..ca9ff6ad8e73 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -1110,6 +1110,35 @@ void usb_free_noncoherent(struct usb_device *dev, size_t size,
 }
 EXPORT_SYMBOL_GPL(usb_free_noncoherent);
 
+/**
+ * usb_endpoint_max_periodic_payload - Get maximum payload bytes per service
+ *				       interval
+ * @udev: The USB device
+ * @ep: The endpoint
+ *
+ * Returns: the maximum number of bytes isochronous or interrupt endpoint @ep
+ * can transfer during a service interval, or 0 for other endpoints.
+ */
+u32 usb_endpoint_max_periodic_payload(struct usb_device *udev,
+				      const struct usb_host_endpoint *ep)
+{
+	if (!usb_endpoint_xfer_isoc(&ep->desc) &&
+	    !usb_endpoint_xfer_int(&ep->desc))
+		return 0;
+
+	switch (udev->speed) {
+	case USB_SPEED_SUPER_PLUS:
+		if (USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes))
+			return le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
+		fallthrough;
+	case USB_SPEED_SUPER:
+		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
+	default:
+		return usb_endpoint_maxp(&ep->desc) * usb_endpoint_maxp_mult(&ep->desc);
+	}
+}
+EXPORT_SYMBOL_GPL(usb_endpoint_max_periodic_payload);
+
 /*
  * Notifications of device and interface registration
  */
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 9d662c6abb4d..e9cf2786d8bd 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -2039,6 +2039,9 @@ static inline u16 usb_maxpacket(struct usb_device *udev, int pipe)
 	return usb_endpoint_maxp(&ep->desc);
 }
 
+u32 usb_endpoint_max_periodic_payload(struct usb_device *udev,
+				      const struct usb_host_endpoint *ep);
+
 /* translate USB error codes to codes user space understands */
 static inline int usb_translate_errors(int error_code)
 {
-- 
2.47.2


