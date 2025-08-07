Return-Path: <linux-media+bounces-38989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E8BB1D22A
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 07:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50C5F580173
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 05:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8675B215F4A;
	Thu,  7 Aug 2025 05:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIu1Vazf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BB533F3;
	Thu,  7 Aug 2025 05:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754546043; cv=none; b=d6W8s/2a4GDObbesZoGZpeaO3ehT5kuOGSsy1qyJVsjEO8onJHGWZmkCKv1R0U3VUJMWggJkpj+KmD8rxU1+hE0IpKkOHeqABF2o5ur9kVSENVPWG5C2lQ9TjkKoUykwFv/5WzpqbjVe8JDH98eFVC1XXeQjYxQIKpzpz/pXwaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754546043; c=relaxed/simple;
	bh=9vRDJpzi0FgQ87IUMfc7e15hXrGzZ1xK575lzX1D3eY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=K511euR05DXS1/mCNFrjHm29tr2gawbFAw5E022Nmut7Wp8ohrbt74AiplLPksYEgbAe/O29DW9gtdnqOA6eH9AcOmIzdELhIP5KHJfnRZA5DTEHfXK5bN4mqKPlTqK3o/1DzFa6h60yOEGt/V7SST6yhwN62pEMRBmNWLL37X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIu1Vazf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754546041; x=1786082041;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9vRDJpzi0FgQ87IUMfc7e15hXrGzZ1xK575lzX1D3eY=;
  b=IIu1VazfHJed1HSUdTwDJxZ9eQ+TMbS7Iumeqb5pb+FVYBeIug5DTz4X
   mz3U4nXU5XZv/MiWFLA42DehbHDhUD1viyovSrPkERlpDkpu2Ru6PmZbH
   tVODUhVoaRxDBieKm7BdhHkTWQQ9/4xnvZGmpVNZ/MabALhbpCee5jQR+
   WLtfV4IcXk4mhIrCGgHRCzr7K376+mU4NnBkCOAXMusP8fR/uWprg1KUl
   NMlneheu2MwOK+QSXyrr2LTj+t+QfOE0cKWXq9Sa4M8Z2xTGAsJaSdqs/
   bCu4wnNsWWS/GSvq+xJ3yJezNourOvJZ5/Dz5Z5KlxY5S81WPvela/JTn
   Q==;
X-CSE-ConnectionGUID: /BOySTyXRE6hz0htQndytg==
X-CSE-MsgGUID: BCwG2ru0ReuHCsTZ/UfgMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60501928"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60501928"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 22:54:00 -0700
X-CSE-ConnectionGUID: HVl1+M9QTcGIQlEzzjUbEQ==
X-CSE-MsgGUID: TIi/4F/cQGqAqUxfJW2uHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="202144604"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.255])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 22:53:58 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3484C11FC45;
	Thu,  7 Aug 2025 08:53:55 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1ujtZc-005H0z-0W;
	Thu, 07 Aug 2025 08:53:56 +0300
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
Subject: [PATCH v3 0/4] eUSB2 Double Isochronous IN Bandwidth support
Date: Thu,  7 Aug 2025 08:53:51 +0300
Message-Id: <20250807055355.1257029-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

This series enables support for eUSB2 Double Isochronous IN Bandwidth UVC
devices specified in 'USB 2.0 Double Isochronous IN Bandwidth' ECN. In
short, it adds support for new integrated USB2 webcams that can send twice
the data compared to conventional USB2 webcams.

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

v2 can be found here
<URL:https://lore.kernel.org/linux-usb/20250711083413.1552423-1-sakari.ailus@linux.intel.com/>.

since v2:

- Use ep->eusb2_isoc_ep_comp.bDescriptorType to determined whether the
  eUSB2 isochronous endpoint companion descriptor exists.

- Clean up eUSB2 double isoc bw maxp calculation.

- Drop le16_to_cpu(udev->descriptor.bcdUSB) == 0x220 check from
  xhci_eusb2_is_isoc_bw_double() -- it's redundant as
  ep->eusb2_isoc_ep_comp.dwBytesPerInterval will be zero otherwise.

- Add kernel-doc documentation for usb_endpoint_max_isoc_bpi().

- Check the endpoint has IN direction in usb_endpoint_max_isoc_bpi() and
  usb_submit_urb() as a condition for eUSB2 isoc double bw.

since v1:

- Introduce uvc_endpoint_max_isoc_bpi() to obtain maximum bytes per
  interval value for an endpoint, in a new patch (3rd). This code has been
  slightly reworked from the instance in the UVC driver, including support
  for SuperSpeedPlus Isochronous Endpoint Companion.

- Use usb_endpoint_max_isoc_bpi() in the UVC driver instead of open-coding
  eUSB2 support there, also drop now-redundant uvc_endpoint_max_bpi().

- Use u32 for maximum bpi and related information in the UVC driver -- the
  value could be larger than a 16-bit type can hold.

- Assume max in usb_submit_urb() is a natural number as
  usb_endpoint_maxp() returns only natural numbers (2nd patch).

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
 drivers/usb/core/urb.c             | 17 +++++++--
 drivers/usb/host/xhci-caps.h       |  2 +
 drivers/usb/host/xhci-mem.c        | 60 ++++++++++++++++++++++++------
 drivers/usb/host/xhci-ring.c       |  6 +--
 drivers/usb/host/xhci.c            | 16 +++++++-
 drivers/usb/host/xhci.h            | 19 ++++++++++
 include/linux/usb.h                | 31 +++++++++++++++
 10 files changed, 137 insertions(+), 46 deletions(-)

-- 
2.39.5


