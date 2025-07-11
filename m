Return-Path: <linux-media+bounces-37460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9611BB01678
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 10:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5ED85C24C9
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 08:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520F8224B10;
	Fri, 11 Jul 2025 08:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBm1HIo4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFD5217666;
	Fri, 11 Jul 2025 08:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222930; cv=none; b=i4ABLhuxNH97z+RAmWNZGEqaDxynUFisJRIaqycmMp6DCOAXU4vb16r4Q0MhO+cCgrlou/GCAfBsDY/Auz41wUNG4dXKl9AhYQni8lb2ZSuGHg1FAhvpEwPTf2s0KtgFpQyDq2/HU8Qvpe2Kym2RB+8stE9jcnO0WieEEc//5P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222930; c=relaxed/simple;
	bh=7RpGLnNVm3S5xqCmvY9JYfO7lJVdnU431C/IzafVPTM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HS6ih7Sc//JghDznIetxlovCwonGbZXsdqxlmk+LjaVjuTjkxmjMKrJf1OXn7iWJZsGCh/qK95186EX4mUxGILe3mPxmyHHNlLcMqNiHHIYr2xlAaRbIylGFiRWGdD4V3B+MT9SwyUrXHpHJvg70FAm8jD7p5+5F5A5rAjKPL+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBm1HIo4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752222929; x=1783758929;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7RpGLnNVm3S5xqCmvY9JYfO7lJVdnU431C/IzafVPTM=;
  b=mBm1HIo44OeQhGSPDHYFddjCvpOBGI7VrliaNfnQvEYqeHWjsllQVfsG
   q0zeO3AjUhaHbrwMkeKmHGC08qTQPOSn8Vjvc0GYXy1e6Z7uL22iIuzbG
   svaXSy14da5eejREc1Cikg5YLjpmLyO2tgS6iXT8KTlri0sn5/ZNfT68k
   ONy3UryBPpa82JxxQYTvVJe6eVJALrYukRl50FxHMforxwHz09WCjCoHN
   ZAyrO7NBe33mKwzaqP9dxno+YCy1dXS2BgbueZRMqXkJgp6wi8gw6VaZp
   a429aQ11MmEL6YwJOIm5bW8rvk1qJQsuigCLHEa+AFiiTxKSEKg/akb5U
   A==;
X-CSE-ConnectionGUID: CZuW4xEdRM+2ooSvo34ejw==
X-CSE-MsgGUID: WSIho0LWQyWdKqiTFwTi5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="71965140"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="71965140"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 01:34:20 -0700
X-CSE-ConnectionGUID: 7ypfUzS4T7GOz2EpQ1B23g==
X-CSE-MsgGUID: IEJl/VM5Roun6+4YdwDKcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="156097096"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.248])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 01:34:17 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D9A71120665;
	Fri, 11 Jul 2025 11:34:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1ua9Cv-006VrP-1u;
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
Subject: [PATCH v2 0/4] eUSB2 support
Date: Fri, 11 Jul 2025 11:34:09 +0300
Message-Id: <20250711083413.1552423-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for eUSB2 Double Isochronous IN Bandwidth to the
UVC and xHCI drivers specified in 'USB 2.0 Double Isochronous IN
Bandwidth' ECN. In short, it adds support for new integrated USB2 webcams
that can send twice the data compared to conventional USB2 webcams.

These devices are identified by the device descriptor bcdUSB 0x0220 value.
They have an additional eUSB2 Isochronous Endpoint Companion Descriptor,
and a zero max packet size in regular isoc endpoint descriptor. Support
for parsing that new descriptor was added in commit

c749f058b437 ("USB: core: Add eUSB2 descriptor and parsing in USB core")

This series adds support to UVC, USB core, and xHCI to identify eUSB2
double isoc devices, and allow and set proper max packet, iso frame desc
sizes, bytes per interval, and other values in URBs and xHCI endpoint
contexts needed to support the double data rates for eUSB2 double isoc
devices.

v1 can be found here
<URL:https://lore.kernel.org/linux-usb/20250616093730.2569328-2-mathias.nyman@linux.intel.com/>.

since v1:

- Introduce uvc_endpoint_max_isoc_bpi() to obtain maximum bytes per interval
  value for an endpoint, in a new patch (3rd). This code has been slightly
  reworked from the instance in the UVC driver, adding support for
  SuperSpeedPlus Isochronous Endpoint Companion besides the USB 2.0 Double
  Isochronous In Bandwidth ECN.

- Use uvc_endpoint_max_isoc_bpi() in the UVC driver instead of open-coding
  eUSB2 Double Isochronous In Bandwidth ECNsupport there.

- Use u32 for maximum bpi and related information in the UVC driver -- the
  value could be larger than a 16-bit type can hold.

- Assume max in usb_submit_urb() is a natural number as
  usb_endpoint_maxp() returns only natural numbers (2nd patch).

- Fixed endianness issues in usb_submit_urb() (2nd patch).

- Move the comment on eUSB2 double isoc bw endpoints in
  xhci_get_endpoint_max_burst() to a better location and remove an
  unneeded else clause in the same function (1st patch).

Rai, Amardeep (3):
  xhci: Add host support for eUSB2 double isochronous bandwidth devices
  USB: core: support eUSB2 double bandwidth large isoc URB frames
  USB: Add a function to obtain USB version independent maximum bpi
    value

Tao Q Tao (1):
  media: uvcvideo: eUSB2 double isochronous bandwidth support

 drivers/media/usb/uvc/uvc_driver.c |  4 +-
 drivers/media/usb/uvc/uvc_video.c  | 24 ++----------
 drivers/media/usb/uvc/uvcvideo.h   |  4 +-
 drivers/usb/core/urb.c             | 18 +++++++--
 drivers/usb/host/xhci-caps.h       |  2 +
 drivers/usb/host/xhci-mem.c        | 60 ++++++++++++++++++++++++------
 drivers/usb/host/xhci-ring.c       |  6 +--
 drivers/usb/host/xhci.c            | 16 +++++++-
 drivers/usb/host/xhci.h            | 20 ++++++++++
 include/linux/usb.h                | 22 +++++++++++
 10 files changed, 130 insertions(+), 46 deletions(-)

-- 
2.39.5


