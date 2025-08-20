Return-Path: <linux-media+bounces-40436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7DBB2DF94
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32B181885C3C
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E6F276050;
	Wed, 20 Aug 2025 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndUepv82"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FC41DFF7;
	Wed, 20 Aug 2025 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755700713; cv=none; b=g3V/7u6+BIuooBDqHkGUIaT/0Y6kjN4OKyjyCkwt2uotQRwf4/f1AZsmQuWs2LDiTUDtjrkb3Pg7QRCYkILXP16cFhxxGmR3vG1jHdfvwnjS8hCpAx5EENKkI5MlCv3ZgdMYIdQFlkFt+KmI/7Em3fguJD/SSZ9zuVXZO4sZSCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755700713; c=relaxed/simple;
	bh=jdQKvzyXX6v4AIYBv0Jq2iWSFbl827i9QpWTzR+a4bY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bbsPD3w2YmIRetjo8aZ5vRO2Ql853HHw9VWw/2bOID9+MJQCYe9AgtGK63gr6nBWcFODFpVOt95RMRhYRWqC2m+0ZlCWmypl2KcEaFuhAHoDfHCWZegxHysnhendd6/so7S4mB7pN/EOqSTqMNv2WXTCIah8JZmsi+QnzDLLPQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndUepv82; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755700711; x=1787236711;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jdQKvzyXX6v4AIYBv0Jq2iWSFbl827i9QpWTzR+a4bY=;
  b=ndUepv82r/Sh0wjUmJzV/BkAlxT6JXoKXNbT8jD+2e7lwvswb8j/Qdhl
   bIhZPDcDgznXzApGIKRQmil/HOEetKAjB0ZlB0KuiVH5RcsHC/hfzgAtc
   xSaBK3Oyptr5/HYNLstfv2vPYmLM0HGPlq0CAO9C4eTZVNekkQu0cpb45
   /3C57B6FbyENYREO0OIc2JZQS6MQe524XS/YQvZMY1J+mhZMbDwd10p8i
   fZjTzdlX6yY1a2nZqEsR9sztdni/XrwQxmLa8L5xcKRd8tYTlPQSd05Yl
   TVSs5cyxLd0V041QIVVZSD/448NSEUGEp57ChMgaVTcrA29SVoLGb7U9N
   Q==;
X-CSE-ConnectionGUID: qc6c80qYTEWkS/woxOOIpQ==
X-CSE-MsgGUID: SLuu/gm3SL+SsVO3cT309A==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57167744"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57167744"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:38:30 -0700
X-CSE-ConnectionGUID: psQ+mxnAQIqNTcp9ZKpwIA==
X-CSE-MsgGUID: AtdBLjIaSPKCXv2ttHNBVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167368809"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.19])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:38:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D1038121F96;
	Wed, 20 Aug 2025 17:38:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uojxI-00000002JYE-3Qf1;
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
Subject: [PATCH v5 2/9] usb: core: Parse eUSB2 companion descriptors for high speed devices only
Date: Wed, 20 Aug 2025 17:38:17 +0300
Message-ID: <20250820143824.551777-3-sakari.ailus@linux.intel.com>
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

Check that a device is a high-speed one before proceeding to parse the
eUSB2 isochronous endpoint companion descriptors.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/usb/core/config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index cda595b4014f..29fcbd6de482 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -507,7 +507,8 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
 	}
 
 	/* Parse a possible eUSB2 periodic endpoint companion descriptor */
-	if (bcdUSB == 0x0220 && !le16_to_cpu(d->wMaxPacketSize) &&
+	if (udev->speed == USB_SPEED_HIGH && bcdUSB == 0x0220 &&
+	    !le16_to_cpu(d->wMaxPacketSize) &&
 	    (usb_endpoint_xfer_isoc(d) || usb_endpoint_xfer_int(d)))
 		usb_parse_eusb2_isoc_endpoint_companion(ddev, cfgno, inum, asnum,
 							endpoint, buffer, size);
-- 
2.47.2


