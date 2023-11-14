Return-Path: <linux-media+bounces-321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D01767EACF6
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 10:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89D65281129
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 09:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD6E1798B;
	Tue, 14 Nov 2023 09:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1iVLVLC"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C1B168A5
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 09:25:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F6E4131
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 01:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699953917; x=1731489917;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cmVJ+UbAOe16svc00+rin358rFGDTrkdkKaEtYoodFA=;
  b=S1iVLVLCwGN+ZKV6Hc1IEkJOcQgF8lwTx4U9/vMyoZZS0DLXHfB/CmBa
   whybPFUiLuzvbM7WNXxjMdywC34O+3ncNu1UYVxK0Ol0iMuapqkxEZ84x
   8WUSJpwmd9hX7LRaT1/Z0MY8a4ToL6HiSEQ2i+zFJB5iEt+W/V6ynsnaK
   7O9jdFt9aB9BMXyy5ZiR+/onjAdYihrO6eCjJo2eCD0L5JHZs5BpA/AUB
   txR2jDuiZf+/poPaP49dUCOI7iQwzRcdZnpFmmqDni+X/uvq7p1JeFe4J
   SoNLRVbhGuRKjy1liYxwAU+fRQLzAuX/M3V1z9r4VdvjnQdANzW/9ULLs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="387781658"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="387781658"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 01:25:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="938015855"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="938015855"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 01:25:15 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0B60311F894;
	Tue, 14 Nov 2023 11:25:11 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH v4 1/6] media: v4l: cci: Include linux/bits.h
Date: Tue, 14 Nov 2023 11:25:05 +0200
Message-Id: <20231114092510.1443545-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231114092510.1443545-1-sakari.ailus@linux.intel.com>
References: <20231114092510.1443545-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

linux/bits.h is needed for GENMASK(). Include it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/v4l2-cci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
index 0f6803e4b17e..f2c2962e936b 100644
--- a/include/media/v4l2-cci.h
+++ b/include/media/v4l2-cci.h
@@ -7,6 +7,7 @@
 #ifndef _V4L2_CCI_H
 #define _V4L2_CCI_H
 
+#include <linux/bits.h>
 #include <linux/types.h>
 
 struct i2c_client;
-- 
2.39.2


