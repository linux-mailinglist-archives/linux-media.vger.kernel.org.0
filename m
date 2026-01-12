Return-Path: <linux-media+bounces-50411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E45ED11B41
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDBED309C3BC
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA11280309;
	Mon, 12 Jan 2026 10:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="akUPhICL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012CB27AC4D
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212002; cv=none; b=uD716iagjD4f4b7jgax58F5h5A8hmdLf6SVeP22c7ub/jdWCMAZ9FLMY/md5yLrhI+wFQ9tOYiZSsoijP9gSTW9wZTwl30RqycS9Tl++jH5wHwQ7QIl9H/3jZyjy8IWsV4ue+wOwAjF0nSRm10lRNbYRGfTUX2hD3oFke20CWUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212002; c=relaxed/simple;
	bh=TpKxImRdV7OLUG6HBa3ZuyNvfLobnLgYQyv8QpjevPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDjCZBxeZWRIKHxTNI9eD5emM2fY6O/QveCLlMttZRtlY0Bd6aQqooFyWQHf6g+JoOcbmJvLVF2g1ionLWWL0c0vRnC2Vpt+D5gfEA/xhOXiklZQZNnX1O/NRmEd3ilypp9vy9fc/O/akP0xwnAPwWkOUB1GuYX/rrGDrAMlxCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=akUPhICL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212001; x=1799748001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TpKxImRdV7OLUG6HBa3ZuyNvfLobnLgYQyv8QpjevPE=;
  b=akUPhICLuMaHx036eR8QRzLrB31XTLjNptxIQw1Y5oQoJ6ugNMIuk/N7
   vTZ/t2VkEpHOQ55UOzQaxrpd7fwTrbx31i7Jzy6UyJV/zTtxMUgcbL23c
   wk6pYJtA5uORocJSkYfDHSlH+eoASnq7qm473r/uwtEOqsQrBC77jq9jV
   bh6bv4xsQnTGXFD+BDUd8VuD8TwcwpWIJVVyZI2gjskXgwHRmX61FOKeU
   eU3PRMDfPI1pQatvCIjPyR8VDWGE/TBkwRa7f1NrhH3isAXba3Zs3gsVE
   +8anOk32GNRrY3jWLsmrUyu0lX/qmrFdcvCQ+g9H0xjo4+wrQojOdXVfA
   g==;
X-CSE-ConnectionGUID: L9e18eN+R8iTCwsm7Wfsiw==
X-CSE-MsgGUID: rFEdjo2DT+WBO3n9815i0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218787"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218787"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:57 -0800
X-CSE-ConnectionGUID: /dADp6qvQr6sBpDBFr9N9A==
X-CSE-MsgGUID: URYwvsk2QVyrvSDmjqbM5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743129"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:56 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 324AD121F80;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiE-0000000011W-0HXS;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 07/23] media: i2c: ov01a10: Change default vblank value to a vblank resulting in 30 fps
Date: Mon, 12 Jan 2026 11:59:33 +0200
Message-ID: <20260112095949.3851-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
References: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hansg@kernel.org>

The ov01a10 is quite a small sensor, which does not capture a lot of
light, increase the default vblank so that the sensor runs at 30 fps
by default, doubling the default exposure.

Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 3ad516e4d369..4f04bb8688b8 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -34,7 +34,7 @@
 
 /* vertical and horizontal timings */
 #define OV01A10_REG_VTS			0x380e
-#define OV01A10_VTS_DEF			0x0380
+#define OV01A10_VTS_DEF			0x0700
 #define OV01A10_VTS_MIN			0x0380
 #define OV01A10_VTS_MAX			0xffff
 #define OV01A10_HTS_DEF			1488
@@ -191,8 +191,8 @@ static const struct ov01a10_reg sensor_1280x800_setting[] = {
 	{0x380b, 0x20},
 	{0x380c, 0x02},
 	{0x380d, 0xe8},
-	{0x380e, 0x03},
-	{0x380f, 0x80},
+	{0x380e, 0x07},
+	{0x380f, 0x00},
 	{0x3810, 0x00},
 	{0x3811, 0x09},
 	{0x3812, 0x00},
-- 
2.47.3


