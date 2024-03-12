Return-Path: <linux-media+bounces-6892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C75F0879231
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66BBE1F220A5
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DDCC7A130;
	Tue, 12 Mar 2024 10:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VkbUeAzm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3500C79DCD
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239684; cv=none; b=IScTCdG/FLlkYsBFWXGnSGyDPiUL7R8q14BS7eXUVvABaFYuwGegfZzXk9T9ALaUQxvKO4ZSslbZHyaDnUN6QCeWPs1awTAm4cy9k0xe1xNH2J5WAkw4kRktc//xDtBwq7em5lC36Fny+rNilBv6BGysivrZat1bJhiF9/RyBIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239684; c=relaxed/simple;
	bh=55b8zBsGXYerQP0lfnydR27J6d7lXdm2jtthzLGldBI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qoyzsSfJidehEKPfo3CTTonIc/5qDSgEpzcxisDVjaIwVXebNLFp+oHCJrZ8LptmNYRDghaJYRetGi8ka4GuSfDKBSI2SkasT5mBPEqWUBga+G1/XNPgYRX9STPMmJIXE416w0hvxYb+Yfemqp3FM9TUqTTO69xvi5PFrAoTE+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VkbUeAzm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239683; x=1741775683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=55b8zBsGXYerQP0lfnydR27J6d7lXdm2jtthzLGldBI=;
  b=VkbUeAzmLJFyLLcWhvYXKYQukJFQKniCCX1TNQkgi34d6s9Auib1hiSl
   OGchl+2dj3S3FFdC+jkGKio3bJYER+RZpcnWlNG/9mGITIlIMVwlLQt91
   BwynNyJQ+MkmQoyoBFH0Kt8Ihtwgs8/f8LFeWJ9EeWvnt2ugh8WEJAuN3
   DXq5WG/xpr0U3nUECv3UkDdApwlqIXaI2AQabphqVqs1p1MfXQFJsL2Fa
   2Metgz5uXZ6AvBrH9HZMT04gb8KNTI0aNhDB6Y0PH27kVN3eiaOJAL4QL
   gl85PXAA8uVwaeYlxWcQSfCjIUWGjnR9GzJ907sQCJ4EQ52b+bNdLQ9Be
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794343"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794343"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194117"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:42 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3B4881201F7;
	Tue, 12 Mar 2024 12:34:39 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 24/26] media: mc: Warn about drivers not releasing media device safely
Date: Tue, 12 Mar 2024 12:34:20 +0200
Message-Id: <20240312103422.216484-25-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312103422.216484-1-sakari.ailus@linux.intel.com>
References: <20240312103422.216484-1-sakari.ailus@linux.intel.com>
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
index dcd40fdab29d..15411682466f 100644
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


