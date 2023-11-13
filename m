Return-Path: <linux-media+bounces-240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F76C7E9D8A
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 14:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 603AD1C20403
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 13:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540CF208B6;
	Mon, 13 Nov 2023 13:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLXjMOBc"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B17F208D4
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 13:45:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62FE9D51
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 05:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699883105; x=1731419105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cmVJ+UbAOe16svc00+rin358rFGDTrkdkKaEtYoodFA=;
  b=kLXjMOBcY35c89pwfyOiDpHvDp/Wbni9zQ0U71OVWo6yoEnHqSYkFJ0h
   vum0zH5/BSg0lQwpds35GghCEoOViNtgsX2/mx4PJqBKrP/B4Sdl7NDn4
   nlP3Gf/V6cl1BcrcHCj/tM+slC2xX2B2XLwyLzb1qJq3oM3s6EPoYQZ2K
   viiwI+uOmq1qs+1JBb31jXr9ZaaA1qfV183ljxfCtBlUJ+Lfk66ZqUzud
   IXBiaG4SPJYU1LB7KTTkqi4nEZm8j68whZInuW4teND7nVlEWESw5AmYY
   ZJEJT3oRXfinztBJilOT4EQ98N/l2ySMvh4E8q57XyhhXg1oT8PwFGmZm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="421531259"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="421531259"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:45:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="793440931"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="793440931"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:45:02 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B2C3E120B89;
	Mon, 13 Nov 2023 15:44:59 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH v2 1/6] media: v4l: cci: Include linux/bits.h
Date: Mon, 13 Nov 2023 15:44:53 +0200
Message-Id: <20231113134458.1423754-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231113134458.1423754-1-sakari.ailus@linux.intel.com>
References: <20231113134458.1423754-1-sakari.ailus@linux.intel.com>
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


