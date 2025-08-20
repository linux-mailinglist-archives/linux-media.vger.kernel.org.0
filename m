Return-Path: <linux-media+bounces-40440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC33B2DFB9
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 391B23B6D81
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420A427EFE9;
	Wed, 20 Aug 2025 14:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AbEkMXHj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F284278E5D;
	Wed, 20 Aug 2025 14:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755700717; cv=none; b=aoonnY9VT73JiTswNjyW2E5y4grLhgpZjBGmq7RHr1E5dZOZdjk+IbTWtIwGmQulRiiVDKmmglTGlANdkMk0bVGtFpV4PcQb3K3eLzYcZnAcC8uKMfnyzw+gljVPsyVerzrpewsaNaFtihtIYx275easR9vGFcFkFg2MzHIqPGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755700717; c=relaxed/simple;
	bh=ix35BkXD6ts8fJLxvKeP9XJ+tGsi/pLXl1osSIABxC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WtD69mD7c9SzkYn5eDOsT7hz395LKfBpQZpjWxOyDreNQ6+TiRhrgheyjZi6hSE7YpBJqxvM9Apqdic85U2KuNJN6aNt7ivazYA9dh81IdqUX6Q0BeR/0A61I+TGxw2oFqAK5NafxZTou4zARMmdgSTOcc/Dli7MMU0qXgU9aw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AbEkMXHj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755700716; x=1787236716;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ix35BkXD6ts8fJLxvKeP9XJ+tGsi/pLXl1osSIABxC4=;
  b=AbEkMXHj9dfUA+SFJLM0q/2XxQkqKRa9AtmIDRNiQu3orRsynxuNkhkh
   5nYBnlutSj680ZPkmYtJO1M2/dLPXDpZZsX9flbVwDmulv0RgMz5O+L05
   L5P4r0NeLZmfu3Tflbn2yLF1GCRowza+2e37LHh2cdBxehcWfdaZdO0NA
   Qm7gND0KWVzNZq/v463iv1E1kKVLpSlxMmA2Qyd85gyEyx1Gf5V/FceHO
   BRGFgaVntySSbAKCo72eJODh97gBZfj5WRHCFcluG5Aa+7BdO1xCCzrHu
   0ZXkQ5ZhpQOxeuviG24wOtfgF/NSX/jfSN4gBr2vmjLqRD/xatgBATWqg
   w==;
X-CSE-ConnectionGUID: k2Tmc2psS7S1tCg6T8L9UA==
X-CSE-MsgGUID: xIgu6Oh3QX2lcxR65y7Xzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57167765"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57167765"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:38:31 -0700
X-CSE-ConnectionGUID: YFIcrtKUT0qP6PNpVkb3NQ==
X-CSE-MsgGUID: IK9JT3q5Tfmkskr5K4v7Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167368815"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.19])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:38:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CFE1F12024B;
	Wed, 20 Aug 2025 17:38:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uojxI-00000002JY7-3CWC;
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
Subject: [PATCH v5 0/9] eUSB2 Double Isochronous IN Bandwidth support
Date: Wed, 20 Aug 2025 17:38:15 +0300
Message-ID: <20250820143824.551777-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
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

v4 can be found here
<URL:https://lore.kernel.org/linux-usb/20250812132445.3185026-1-sakari.ailus@linux.intel.com/>.

since v4:

- New patch: use le16_to_cpu() to access endpoint descriptor's
  wMaxPacketSize field, which is an __le16. This isn't a bugfix as the
  value was compared to 0.

- New patch: add USB device speed check for eUSB2 isochronous endpoint
  companion parsing. The check is then removed from sites checking the
  existence of the companion (through companion's bDescriptorType field,
  which is non-zero for valid descriptors).

- New patch: do not parse eUSB2 isoc double BW companion descriptor on
  interrupt or OUT endpoints. It is not supposed to be found there,
  according to the ECN.

- Rename usb_endpoint_max_isoc_bpi() as
  usb_endpoint_max_periodic_payload() and move it right after
  usb_maxpacket().

- Fixed @ep reference in kernel-doc documentation for
  usb_endpoint_max_periodic_payload().

- In usb_endpoint_max_periodic_payload(), call struct usb_device pointer
  argument "udev" instead of "dev", to align with naming elsewhere.

- Add support for interrupt endpoints in
  usb_endpoint_max_periodic_payload(); eUSB2 double isoc BW is still
  limited to isochronous endpoints though.

- In usb_endpoint_max_periodic_payload(), remove the separate case for
  USB_SPEED_HIGH as the check is already done in parsing the eUSB isoc
  double BW companion, which is checked for.

- New patch: use usb_endpoint_max_periodic_payload() in xHCI driver,
  replacing xhci_get_max_esit_payload().

- Check non-zero bDescriptorType field of ep->eusb2_isoc_ep_comp instead
  of dwBytesPerInterval value exceeding 3072, where
  xhci_eusb2_is_isoc_bw_double() was used. This aligns the checks of eUSB2
  isochronous double bandwidth support for an endpoint.

- New patch: introduce usb_endpoint_is_hs_isoc_double() to figure out
  whether an endpoint uses isochronous double bandwidth and use the
  function in the xHCI driver and the usb core.
  xhci_eusb2_is_isoc_bw_double() is dropped, as well as the
  MAX_ISOC_XFER_SIZE_HS macro. usb_endpoint_is_hs_isoc_double() also
  includes check for bcdUSB == 0x220, to anticipate adding support for
  eUSB2V2.

- Merge condition for checking eUSB2 isoc double bw support for
  xHCI/endpoint in xhci_get_endpoint_mult().

- Improve comment regarding maximum packet size bits 12:11 in
  xhci_get_endpoint_max_burst().

- Aligned subject prefixes with the recent patches to the same files.

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
  usb: core: Add a function to get USB version independent periodic
    payload
  usb: xhci: Add host support for eUSB2 double isochronous bandwidth
    devices
  usb: core: support eUSB2 double bandwidth large isoc URB frames

Sakari Ailus (5):
  usb: core: Use le16_to_cpu() to read __le16 value in
    usb_parse_endpoint()
  usb: core: Parse eUSB2 companion descriptors for high speed devices
    only
  usb: core: eUSB2 companion descriptor is for isoc IN endpoints only
  usb: xhci: Use usb_endpoint_max_periodic_payload()
  usb: core: Introduce usb_endpoint_is_hs_isoc_double()

Tao Q Tao (1):
  media: uvcvideo: eUSB2 double isochronous bandwidth support

 drivers/media/usb/uvc/uvc_driver.c |  4 +-
 drivers/media/usb/uvc/uvc_video.c  | 24 ++-------
 drivers/media/usb/uvc/uvcvideo.h   |  4 +-
 drivers/usb/core/config.c          |  4 +-
 drivers/usb/core/urb.c             | 14 +++--
 drivers/usb/core/usb.c             | 50 ++++++++++++++++++
 drivers/usb/host/xhci-caps.h       |  2 +
 drivers/usb/host/xhci-mem.c        | 85 ++++++++++++++----------------
 drivers/usb/host/xhci-ring.c       |  6 +--
 drivers/usb/host/xhci.c            | 16 +++++-
 drivers/usb/host/xhci.h            |  2 +
 include/linux/usb.h                |  6 +++
 12 files changed, 137 insertions(+), 80 deletions(-)

-- 
2.47.2


