Return-Path: <linux-media+bounces-39592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B2383B2284F
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 15:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 35AD74E3FBD
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 13:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B2227E1B1;
	Tue, 12 Aug 2025 13:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0x/W0fc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169A127CCF2;
	Tue, 12 Aug 2025 13:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755005097; cv=none; b=tsthCgnMbETgsIpg5Aew8Na7eDoYZ09QrGItoMvz5O5mUqsmenq357Ex6clK+XK6Au1o/d/+c0S79IP/HmoIXaYEEeJZEShZZezXOFSAsoMpJv8GluYJMn6i5o0JbXvSCGxGwC07SWqWHLIOu7/UYiq6uqxiB+KJCM/CuYmuIQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755005097; c=relaxed/simple;
	bh=kjz+NIvqeefkaPF7vPeZmEqg4n6mM3fJnzRmgDcnC8o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XDJRyqyrbG6MUxNxETBfcwJCn3wA6vUMBrL7i7AQ7NeByeNx1y0G47h2UNr84eSRA8y+IblLZwp0SeQJQhoEvrAWlFAFvraIvpTjtDL16LQ/2BCqqvOZwor4bU3nuri1r+kzvVpD/hU7iocuBeok8kjwM0xod2pC9MSZlpqpCUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0x/W0fc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755005097; x=1786541097;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kjz+NIvqeefkaPF7vPeZmEqg4n6mM3fJnzRmgDcnC8o=;
  b=c0x/W0fc4P7qG7XHGeWkYl9cCV3aEnaTe5RLopuhBiNgmeh4Xxi2FiK1
   vCAyOolWDDKIJH374LiT4zE38AIv/qGQnF3/bHJ/xd/0bFLZHhxhlLWav
   kCLm8sN2L1U2MLba48IzgiKq8LcesMWsL4MJ9ivmKe7k+lNLXelumUAIM
   6cvXFEMz87ma5AgWQFCz5JjJPx4sh3oAwbgt41Uu3DFlpRID0xQiJy0XJ
   bt1CAVuC0DYPdK1Xtp9YaySY2mp9wcmzWvnozsX1JhSxMO9/0uasXNfpU
   wFc/NreUhYq7Ujl8/iLAWzc8qF9fCz/unI4qJ5zqFoxUHoCtspTB+tNJP
   g==;
X-CSE-ConnectionGUID: HuFGX1CbTuWeDaSrYdkh3w==
X-CSE-MsgGUID: 3SyLZ2iYSPCviGSTarEGeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68349664"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="68349664"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:24:52 -0700
X-CSE-ConnectionGUID: IyRH0Jo7QRyTK7bvoBSEQg==
X-CSE-MsgGUID: cu1ryYDdSuaZsXcZedMjfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166987270"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.110])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:24:48 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2970D11F832;
	Tue, 12 Aug 2025 16:24:46 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1ulozd-00DMZi-31;
	Tue, 12 Aug 2025 16:24:45 +0300
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
Subject: [PATCH v4 0/4] eUSB2 Double Isochronous IN Bandwidth support
Date: Tue, 12 Aug 2025 16:24:41 +0300
Message-Id: <20250812132445.3185026-1-sakari.ailus@linux.intel.com>
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

v3 can be found here
<URL:https://lore.kernel.org/linux-usb/20250807055355.1257029-1-sakari.ailus@linux.intel.com/>.

since v3:

- Use spaces in aligning macro body for HCC2_EUSB2_DIC() (1st patch).

- Move usb_endpoint_max_isoc_bpi() to drivers/usb/core/usb.c (3rd patch).

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
 drivers/usb/core/usb.c             | 32 ++++++++++++++++
 drivers/usb/host/xhci-caps.h       |  2 +
 drivers/usb/host/xhci-mem.c        | 60 ++++++++++++++++++++++++------
 drivers/usb/host/xhci-ring.c       |  6 +--
 drivers/usb/host/xhci.c            | 16 +++++++-
 drivers/usb/host/xhci.h            | 19 ++++++++++
 include/linux/usb.h                |  3 ++
 11 files changed, 141 insertions(+), 46 deletions(-)

-- 
2.39.5


