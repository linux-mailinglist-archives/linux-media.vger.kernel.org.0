Return-Path: <linux-media+bounces-34885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58748ADAC0C
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 11:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54F1F7A9D86
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 09:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCA5273D78;
	Mon, 16 Jun 2025 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6zlz1lL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8CB1DB92A;
	Mon, 16 Jun 2025 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750066679; cv=none; b=rkgAOAqjQDZTydP04A5edhl8xu2crinErgHAwdt9ZX41N9LMJDHOIMPXLCn86poHYpmHfzu0SqcnQAE4VfuF3nmk+yjzpJ5gLwj4p5hwLrZn1Quh7/qm6cd2LaxUNoeA+gKJoThWsvzrzPyFhQg+gMY28aTmnM8uR/1jHWmfIx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750066679; c=relaxed/simple;
	bh=iAURlYojp0DctiNHK2XGHect2j9tnMRTjupyQx5PAwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RRMQgAlQg8JaT6VgwXiDml7Hc7ymdCdctGSrQNviz+x8WX/eGTrN9vjG52M3g/LT0VNOIPbHYTCS5l6mQwPSGuVndNzWqPSzIIjtJAgNkvaFbo3//lUhj33T1ALkU6F67BhqPgDCBoyqjMf+2Yw6surbTh8TR/7bm43lacajxVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6zlz1lL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750066677; x=1781602677;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iAURlYojp0DctiNHK2XGHect2j9tnMRTjupyQx5PAwY=;
  b=n6zlz1lLURAlpbrF9kOoxTtSx47h/L0lxwT+pP+a9Ua0vhtlZoMoAN8Q
   4yj9j4707MGB920qXKCXtkmR6buh15fD1MbeoaYkP284EJohMoYJaQlGL
   44TL0HfwbsmTFL6f7klDJHIXKV/lT7bCdX7R8UoPGttEV7oV8akElphSe
   nYUswIP8F3ImpsW5XiSJsUoE/xaMV4hzUpFD8CR3qPCh63fBMBdK57ywT
   W7vLHuB0krvoEVgs0uekbBqtdGp9Nse8ZsfeEbap1rmS/s+xlxgvw0eLP
   98wOasY5qZfl3903j5SzKa3pfxH3Tm+DV+KEANWNva47QR9ilPJpw98dU
   g==;
X-CSE-ConnectionGUID: 7YAs/e+9RyeZ/zWqHN93tQ==
X-CSE-MsgGUID: H4tj4VQ9Tu2m8w4BZnucZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62855901"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="62855901"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 02:37:56 -0700
X-CSE-ConnectionGUID: 9eTWe/VLRpeEHQVLOIFZzw==
X-CSE-MsgGUID: z3kEKN7dRWKjedlBFGylSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="153718102"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by orviesa005.jf.intel.com with ESMTP; 16 Jun 2025 02:37:54 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com,
	Thinh.Nguyen@synopsys.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/3] USB: Enable eUSB2 double isochronous bandwidth 
Date: Mon, 16 Jun 2025 12:37:27 +0300
Message-ID: <20250616093730.2569328-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables support for eUSB2 Double Isochronous IN Bandwidth
uvc devices specified in 'USB 2.0 Double Isochronous IN Bandwidth' ECN.

In short it adds support for new integrated USB2 webcams that can send
twice the data compared to conventional USB2 webcams.

These devices are identified by the device descriptor bcdUSB 0x0220
value. They have an additional eUSB2 Isochronous Endpoint Companion
Descriptor, and a zero max packet size in regular isoc endpoint
descriptor. Support for parsing that new descriptor was added in commit

c749f058b437 ("USB: core: Add eUSB2 descriptor and parsing in USB core")

This series adds support to uvc, usb core, and xhci to identify eUSB2
double isoc devices, and allow and set proper max packet, iso frame
desc sizes, bytes per interval, and other values in URBs and xHCI
endpoint contexts needed to support the double data rates for eUSB2
double isoc devices.

Patch 1/3 containing the xhci changes was previously sent as part of
other xhci features, but was dropped.
It now contains the USB_SPEED_HIGH check disussed with Thinh Nguyen.

Thanks
Mathias

Amardeep Rai (2):
  xhci: Add host support for eUSB2 double isochronous bandwidth devices
  USB: core: support eUSB2 double bandwidth large isoc URB frames

Tao Q Tao (1):
  media: uvcvideo: eUSB2 double isochronous bandwidth support

 drivers/media/usb/uvc/uvc_video.c |  5 +++
 drivers/usb/core/urb.c            | 18 +++++++--
 drivers/usb/host/xhci-caps.h      |  2 +
 drivers/usb/host/xhci-mem.c       | 62 ++++++++++++++++++++++++-------
 drivers/usb/host/xhci-ring.c      |  6 +--
 drivers/usb/host/xhci.c           | 16 +++++++-
 drivers/usb/host/xhci.h           | 20 ++++++++++
 7 files changed, 108 insertions(+), 21 deletions(-)

-- 
2.43.0


