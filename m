Return-Path: <linux-media+bounces-274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9E67EA0E0
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 17:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 845321C209A7
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 16:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D76C22315;
	Mon, 13 Nov 2023 16:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WRLQBnlm"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5C2208AE
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 16:06:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7BE419E
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 08:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699891568; x=1731427568;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cmVJ+UbAOe16svc00+rin358rFGDTrkdkKaEtYoodFA=;
  b=WRLQBnlmbsUOfgetZJxmhJ6uvERuAp0rA3YLTnxgk2AxbaLZ0K9MQSuK
   xZqIyGO7noeW24q2D2thzNJlWymKTyUklcrnAulHR2lC0C258DLjZl3Wf
   Afg9Ehk9no692ra0dnnWOcKMKJ7V1GMg1EAQOZQosdU66jj6pYPeqLefW
   6hlvksn8JKX5jsZrLETAHpqTjjSsBBCraUnl9YNMj17engTE01CLsXMAM
   We4LdaA7pz4tQ0GIqtUIHb+epRca6ay30DEDePIlvj1Y3x0TTT5rlVQ//
   zzgCgpfqZyoP7J7vc+z9SJyVZ8DyivHT82v7LgkpEbrGEN3RjH5HNIFkN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3542962"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3542962"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 08:06:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="887956365"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="887956365"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 08:06:05 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6231B120BDC;
	Mon, 13 Nov 2023 18:06:02 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH v3 1/6] media: v4l: cci: Include linux/bits.h
Date: Mon, 13 Nov 2023 18:05:56 +0200
Message-Id: <20231113160601.1427972-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231113160601.1427972-1-sakari.ailus@linux.intel.com>
References: <20231113160601.1427972-1-sakari.ailus@linux.intel.com>
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


