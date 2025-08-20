Return-Path: <linux-media+bounces-40437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C0BB2DF96
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A45A518867F0
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E5E27814A;
	Wed, 20 Aug 2025 14:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QoR8pYxo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709972750E6;
	Wed, 20 Aug 2025 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755700715; cv=none; b=gYLwO7EQKIm7g5S5lRKZTM61sec4Yk8XnT+9e7g4ZwhJMg8iumqeZqNTqqYL0UmES14M93nl9fNlrPHwnM0Up0ASB7FFDHQNyHUrvelrMXWBu1FQTI6K1oIIZbJb7pEU7zKYGKjLgNAC7F4+2BJLN5QNtYHcqb0LLZ62D0WO7cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755700715; c=relaxed/simple;
	bh=c/gDBeHqhLS2B0MG5VePLJgchMYqWFdugigPjVUwqVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uqDmoSjBhGq+GeMyOXsYn+Fr1+joxmRnKeqnbg7E7oiUBKBu3Pvqx5QmoEnNiZgQVMkr4Vh52NnfdEKoEcwNlNlsT1FJftyEANjMIA0VUMNlaBiYt9VfxdYlI6EJMqzKh0LCAS03JMjG68RBZOk7XMu9hLulxGqwtYm/3c+OJxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QoR8pYxo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755700713; x=1787236713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c/gDBeHqhLS2B0MG5VePLJgchMYqWFdugigPjVUwqVM=;
  b=QoR8pYxoq8QwQqHgv2Mh7sowswl1PfafgIzc76+eJa51PJ6VF0YFg1of
   z9HmHLAf4gk/oeFsKrY8ayUxlDbgJX0pH+/McjiIm+Mbh9l/NVLCqb7oU
   pQILNYZSin2IDxkUol1DPQOu/LFi8g9pTg7sNCZeI/a/JAZySRNtLOW1h
   7WF2zvkjN0UW0QlJ6o/yF7x/U32LQj4QehyzPTSVxZoD5EvZUcAhEYcet
   7YVJLmVLohzn6UlzCZHDU0p77vK06VbRszlDgfGxr5VG2L9X2OVk80oU2
   1aZEIPqIq159tguQzr/1shALRzI925hLAl8wjYSSJR8pUdYshMBkiwnGj
   A==;
X-CSE-ConnectionGUID: MdGc6eVpRyC+v1bYVlN7og==
X-CSE-MsgGUID: iL/KQ1ceSiOx1It4WYCkxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57167736"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57167736"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:38:30 -0700
X-CSE-ConnectionGUID: uM+SNjF3S2m4xGbufGh4GA==
X-CSE-MsgGUID: OcuveW05TZ+3EL47VWMECw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167368808"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.19])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:38:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D184A121F9D;
	Wed, 20 Aug 2025 17:38:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uojxI-00000002JYA-3Lsr;
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
Subject: [PATCH v5 1/9] usb: core: Use le16_to_cpu() to read __le16 value in usb_parse_endpoint()
Date: Wed, 20 Aug 2025 17:38:16 +0300
Message-ID: <20250820143824.551777-2-sakari.ailus@linux.intel.com>
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

wMaxPacketSize field in struct usb_endpoint_descriptor is an __le16, use
le16_to_cpu() to read it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/usb/core/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 42468bbeffd2..cda595b4014f 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -507,7 +507,7 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
 	}
 
 	/* Parse a possible eUSB2 periodic endpoint companion descriptor */
-	if (bcdUSB == 0x0220 && d->wMaxPacketSize == 0 &&
+	if (bcdUSB == 0x0220 && !le16_to_cpu(d->wMaxPacketSize) &&
 	    (usb_endpoint_xfer_isoc(d) || usb_endpoint_xfer_int(d)))
 		usb_parse_eusb2_isoc_endpoint_companion(ddev, cfgno, inum, asnum,
 							endpoint, buffer, size);
-- 
2.47.2


