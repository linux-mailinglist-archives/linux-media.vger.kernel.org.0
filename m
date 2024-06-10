Return-Path: <linux-media+bounces-12844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C23901EE2
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC2EA2818BA
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8FE67E591;
	Mon, 10 Jun 2024 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMDM/9Oe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F037D40D
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013960; cv=none; b=lK2IAKVl5aiDYhTKrFkBTdaNwvaUDQG9N2TSo+QId4WSes/hVGmGuujaETAdNQ+NzdwENhIjnMOYE4S2uXJpbCYUClS27dZc1qjA4v/J4K5165ZDMkKh5M3n/po/gZ/482XfQNoxlYKsI3Bh2XOWxEuAdjekFrkaLxqjygziS+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013960; c=relaxed/simple;
	bh=SlIoz3AvotjmzsQHayTbOfFxAq/faet1GdpeYxXtrn4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fpyp8ntGAdanNdRPzz8vrPRRl3bxAPCS12o+DKjKiktcklojx4IB3gURcLhILycxXJC1+3Qbfjnq24FRKPVVELyRG3imj3y3qzUgEVJPbBzp7cqJjNeQAIp3gqNvnT6pbJ4UeKOTOBmaTkqzo2Gsr6DT4PDcNtedVcHWYvyr6Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMDM/9Oe; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013960; x=1749549960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SlIoz3AvotjmzsQHayTbOfFxAq/faet1GdpeYxXtrn4=;
  b=OMDM/9Oez0PbZO7dK3KuQ0xP7iCC24YcxR3loVSzFdk/fbHnYpkVuVG2
   Ls/wE1sackyXin5FjTtVaVF5KN40UtDCB3f2RNpWvpM6v00wYz8us1XsS
   c2Yn0XhehAZxmC6hs/85EkylCcraI3lw8BwOWdJNpwDi32IEUK1YspCfk
   eeop+btjN5xbt4wf/wZo7pFvxHHjCGDmlQt3s3DENilkc/vJteQWifyVO
   ybO+nzLKDp7hm7eKT0BNTUcU5Vk7YoJjrxmlDmXntlTjmf75QLThQvEdY
   CfZAObQe/EQj4kxdF+Rg1fMKRCDRiRUcfIDd7BXmEbkLOwuzlCiMegRRE
   g==;
X-CSE-ConnectionGUID: 1rl2BnhqSDu6nPDcLC2qCQ==
X-CSE-MsgGUID: i947GNszRTaxFFERQJ9p4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819962"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819962"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:53 -0700
X-CSE-ConnectionGUID: oNug0NUkSLqr9AURQvb9cA==
X-CSE-MsgGUID: MjduhD2gQ+ulX6qH4Y3hZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137368"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:50 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5F26D120CA3;
	Mon, 10 Jun 2024 13:05:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuH-004eEF-1B;
	Mon, 10 Jun 2024 13:05:41 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 24/26] media: mc: Warn about drivers not releasing media device safely
Date: Mon, 10 Jun 2024 13:05:28 +0300
Message-Id: <20240610100530.1107771-25-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The media device and associated resources may be released only when its
memory is no longer used. Warn about drivers not doing this, but instead
releasing the resources at driver unbind time.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-device.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 8cdd0d46e865..51836faa6d1a 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -822,6 +822,9 @@ int __must_check __media_device_register(struct media_device *mdev,
 		ref = kzalloc(sizeof(*mdev->devnode.ref), GFP_KERNEL);
 		if (!ref)
 			return -ENOMEM;
+
+		dev_warn(mdev->dev,
+			 "Set mdev release op to safely release resources!\n");
 	}
 
 	/* Register the device node. */
-- 
2.39.2


