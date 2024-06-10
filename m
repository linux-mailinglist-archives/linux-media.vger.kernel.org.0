Return-Path: <linux-media+bounces-12828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D98901ED2
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22F0A280CDC
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33846762D0;
	Mon, 10 Jun 2024 10:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ly0/hbwp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A8577106
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013952; cv=none; b=KoXMIK/e/PDao0o4qTQlEaPcHiJGDwvRSaLZKD0hoPRyJ0hcBjl545WB0r5Ftsy1CHir6l/AlqkgaYZb5ueTJmcSaWD2WZsgeskNJMCj3aXcVlRNtqhRlj24lNq1xxbpfDN3rYmz4mILZugsAnmat2bkEQxpYyC8y+wIo/rzUS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013952; c=relaxed/simple;
	bh=aisjRDb80J5bcIXYdQsrc4+wgv1xP+p04lQ8AAnNQzM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=moo+s186RRXcjaT+qKVvm7d+jFnkIjUa7M2TrosktTkXY9/iE9+p4+VVtb6uZezXkM+yUb3tnmZzQrAlpE8DumuQ/1K4F9EhylVyZafC5HX1h019fz5K85skB8bPLpZzoTh2Y6E9/PPi6tzGBKbz1vLy2F+crZoecMrfb06Ez8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ly0/hbwp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013952; x=1749549952;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aisjRDb80J5bcIXYdQsrc4+wgv1xP+p04lQ8AAnNQzM=;
  b=ly0/hbwpBNT8OYwjW/fPzd+Vv8VNDPupsu5RCGJibAISjFESRbYBizK5
   5soCO0zDG5FO0mLaTFZZ/ofjFnuPFoAHxzFIJEsf+JmzJI47RxVsRNd9c
   cusNoDoph+ZYWAp3Bat1Reu/9UVjIMZftorUdUZltZ4bjLL5jHSXHCpxF
   ERmJSZJMy1OUqRrHYLG0yGHJeszn+5m6WrJxaArL3mU540pS2zogB9GJN
   pzMe194490HQQuQOjAdG9cTmm9wWWhrSCbpMcyEmNdX9Y991KBfrlSrGI
   DbEktZbB9CuqoOWhfID9YxOQvlTtcvFErpRx1SDB5DZaR8S7e81BUrDYk
   w==;
X-CSE-ConnectionGUID: nt2a1gRjSXKXL1DXBXI8Dg==
X-CSE-MsgGUID: 73bBsGFbQPeMXx0JlfawuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819899"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819899"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:49 -0700
X-CSE-ConnectionGUID: 5KQpNOGQTaWzwLELCmegdA==
X-CSE-MsgGUID: zXHJPTbDTs6kTS2ysVHb1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137343"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:47 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F2F24120A66;
	Mon, 10 Jun 2024 13:05:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuG-004eCx-37;
	Mon, 10 Jun 2024 13:05:40 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 08/26] media: mc: Do not call cdev_device_del() if cdev_device_add() fails
Date: Mon, 10 Jun 2024 13:05:12 +0300
Message-Id: <20240610100530.1107771-9-sakari.ailus@linux.intel.com>
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

cdev_device_del() is the right function to remove a device when
cdev_device_add() succeeds. If it does not, however, put_device() needs to
be used instead. Fix this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-devnode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 2e33c2007f08..707593d127a7 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -252,9 +252,9 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
 
 cdev_add_error:
 	mutex_lock(&media_devnode_lock);
-	cdev_device_del(&devnode->cdev, &devnode->dev);
 	clear_bit(devnode->minor, media_devnode_nums);
 	mutex_unlock(&media_devnode_lock);
+	put_device(&devnode->dev);
 
 	return ret;
 }
-- 
2.39.2


