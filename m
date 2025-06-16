Return-Path: <linux-media+bounces-34888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B02ADAC13
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 11:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6770D189151C
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 09:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DB7273811;
	Mon, 16 Jun 2025 09:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZN1JUoi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF66E2741AF;
	Mon, 16 Jun 2025 09:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750066686; cv=none; b=vBu4TVMrRPMK0jST6of6VnVpal22D+vbqCPVYr+6nl7zLMBjQfvqWFJdzXR44LDOFHzp20lavhfhC70eSZHtr0yrVoS21EGGtSO0h/UgJKvh9ze/BvY/83q6PJNVjckbgnsmjUWv/SGild/2LLrAFKeMBnwfxdX9gf2q7E8FBtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750066686; c=relaxed/simple;
	bh=ifw/NEt59vpZXMgcSDuL8lqa2zLzW5q7hWhMqY+qACI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SyJtguAVpG4OKEL2Y5I2IWPgraK1ZsRdtwc/kC2t08hIroD/47cobI1W6x8YwKFFjX4Jb0uH+vgWcWCTJPa0q9l2MLUXqaMTmswXwqXQY+l4OzSbf+uIHkP/MuInZpEvoTcbcaEz3Gu+BFegr3kU7vxccSh4svNksB2MXdY1JMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZN1JUoi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750066685; x=1781602685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ifw/NEt59vpZXMgcSDuL8lqa2zLzW5q7hWhMqY+qACI=;
  b=JZN1JUoiE8pD1R7SBPh4MooiQtqfFnmiaBPl7YcvoEWAF3iBHFiVfQn1
   K3t0OoWN1RrH9lPnw4B0TqJB5TUGtMwycVV0LnPlKRC6/7IMOBZ7m6eG7
   47+JIr3PcZAF9LGXfVy5Oh5jL7WVUCKnhjU5l64W18d6R9QKfFqdjtzrj
   dIH+/lXUoOHjXzreXmLE9daNJD8J3wGEuTdAWkRWOp2KJNyseyMjGjLCD
   xaxDSXWhL4AqJDYT8CYAa7hgL5u2ntY1J8XKSaV70wtkKw9brg3LIUOqP
   TDwElKzF7NpDsb238y1tctccsbgSXWH48jydwoBLESszg+ccKP61eNilj
   g==;
X-CSE-ConnectionGUID: /Mxp/xZPRb6RWYmZmaCc3Q==
X-CSE-MsgGUID: 2rjr4i9lTjyhdrNsMW0G7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62855924"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="62855924"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 02:38:04 -0700
X-CSE-ConnectionGUID: UnFUBHQCTGScp7Vnwey5ow==
X-CSE-MsgGUID: 6Lx46dBpT9OZurncPnU8ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="153718117"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by orviesa005.jf.intel.com with ESMTP; 16 Jun 2025 02:38:02 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com,
	Thinh.Nguyen@synopsys.com,
	Tao Q Tao <tao.q.tao@intel.com>,
	Amardeep Rai <amardeep.rai@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 3/3] media: uvcvideo: eUSB2 double isochronous bandwidth support
Date: Mon, 16 Jun 2025 12:37:30 +0300
Message-ID: <20250616093730.2569328-4-mathias.nyman@linux.intel.com>
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

From: Tao Q Tao <tao.q.tao@intel.com>

Add eUSB2 support to check total number of bytes, isochronous endpoint
will transfer every service interval(SI).

Co-developed-by: Amardeep Rai <amardeep.rai@intel.com>
Signed-off-by: Amardeep Rai <amardeep.rai@intel.com>
Signed-off-by: Tao Q Tao <tao.q.tao@intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/media/usb/uvc/uvc_video.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007..a888f84208c6 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1906,6 +1906,11 @@ u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep)
 	case USB_SPEED_SUPER:
 	case USB_SPEED_SUPER_PLUS:
 		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
+	case USB_SPEED_HIGH:
+		psize = usb_endpoint_maxp(&ep->desc);
+		if (psize == 0 && le16_to_cpu(dev->descriptor.bcdUSB) == 0x220)
+			return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
+		fallthrough;
 	default:
 		psize = usb_endpoint_maxp(&ep->desc);
 		psize *= usb_endpoint_maxp_mult(&ep->desc);
-- 
2.43.0


