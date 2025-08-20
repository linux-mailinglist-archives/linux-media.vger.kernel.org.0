Return-Path: <linux-media+bounces-40438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F02B2DFB1
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 360F73B2691
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0353327A127;
	Wed, 20 Aug 2025 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1DgnoMx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6CC276054;
	Wed, 20 Aug 2025 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755700715; cv=none; b=UuaeOU0XL1QEYZkvQGygSlXsEAdAKHuw0wXsr+/BWkixCzl0VS5wfU1Y7VSZFdlmP8yXR2YABF9k26Ra3OmegFP7Yrjk00B7/5V0L7iuo6aMOvIy60jnu+n7/OazEJRWhoOEXB1H6MU//HUDPZQHXtaucs/+uHRQuw/pegPUm5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755700715; c=relaxed/simple;
	bh=X+NuqJBsSCTn+L+t3z3QitFlJkLZlczZTrLwvgCVAxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVT4Vd+3KC5Cr3S3AmSkY7aREDOjGYE9yd4IHnjDYiUH0sA3ZNeyxIgPO5ERhdzQbor1+cqM7mofpMvwOhVMoMghvUkJ1dJoxCGGUvDZwHWzNaYJom2cA49wRfG9frLCEvjKt+ums6G5rQbUNHHpqUPEWoyitl86BMTTikQHBmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1DgnoMx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755700714; x=1787236714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X+NuqJBsSCTn+L+t3z3QitFlJkLZlczZTrLwvgCVAxE=;
  b=F1DgnoMxDruj93zDUaRMdhbe6EkASwY+CdT4dIWOq9MnRG4LolMsipty
   648lF5fXkeYnVbqqtgPaq9io4c/jBuxkZoV4e7lrq34cEPgGzkvafYx5U
   wCQzl7RjX2NvzOfaSRm5CIzQmp7LXoVnVo+3dk0WY47WvxS5YAub7pF5h
   QBAvXIYhnpOSeCADFDgdc4TJlz8DodG9JjbYoQzzDmjWqiVAo/a0elKwD
   sWlQT6/Am7McMG+zmEryA+4XQTujcYCuidtoKGVs5Kanyu4lJWVPoUwF7
   UHu7CliXqu+PmIP8y3WQyyibM5evwp5zLEyNkwvXHTz9eUs0mPJmskd0J
   A==;
X-CSE-ConnectionGUID: C7bO7Y0KRUSk/lpQW7L5yw==
X-CSE-MsgGUID: NeT/3KQ0TpqYrjfyO4lK1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57167763"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57167763"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:38:31 -0700
X-CSE-ConnectionGUID: uoNuN2IuRGOZ9WEM6Y/Q4w==
X-CSE-MsgGUID: N0ysDREtSKWxM4Afj6RuDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167368813"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.19])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:38:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D3796121FA7;
	Wed, 20 Aug 2025 17:38:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uojxI-00000002JYI-3UPM;
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
Subject: [PATCH v5 3/9] usb: core: eUSB2 companion descriptor is for isoc IN endpoints only
Date: Wed, 20 Aug 2025 17:38:18 +0300
Message-ID: <20250820143824.551777-4-sakari.ailus@linux.intel.com>
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

The eUSB2 isochronous double bandwidth endpoint descriptor is allowed for
the isochronous IN endpoints, according to the ECN. Do not parse these
descriptors if they are found in interrupt or OUT endpoints.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/usb/core/config.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 29fcbd6de482..baf5bc844b6f 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -508,8 +508,7 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
 
 	/* Parse a possible eUSB2 periodic endpoint companion descriptor */
 	if (udev->speed == USB_SPEED_HIGH && bcdUSB == 0x0220 &&
-	    !le16_to_cpu(d->wMaxPacketSize) &&
-	    (usb_endpoint_xfer_isoc(d) || usb_endpoint_xfer_int(d)))
+	    !le16_to_cpu(d->wMaxPacketSize) && usb_endpoint_is_isoc_in(d))
 		usb_parse_eusb2_isoc_endpoint_companion(ddev, cfgno, inum, asnum,
 							endpoint, buffer, size);
 
-- 
2.47.2


