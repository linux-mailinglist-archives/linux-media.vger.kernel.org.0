Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 952D67AFB8A
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 08:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbjI0G6A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 02:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbjI0G5z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 02:57:55 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D37DFC
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 23:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695797874; x=1727333874;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B7CGOXcmzXMCSrQFQN9qX0MwRGJpWxjTVvMfZvbuT2c=;
  b=TGZnbgQ83Rbp+k3a0ICn5JDppvBeGph4Y3sxHcD6SCj8eIzIhGE0v6Wi
   4zoh1GKAuXtVKiOqJUF5syhxikm/ZH8Q8AYF0SPfh8YYhovNDCkK/lfng
   YRcxxU4M+lXwDz7Qx1K2IAMd4+xfFPiH0RSmKEmkK4JlrkFFKZ4Llkr1i
   2FknqzJnaYlT377FB+vjlN0w4bOMpKd0QOlUAp/Vspf/LWDd3CKQwlmlS
   s+TUi0j0vvW4tgrXNxA6/5dwDBtnP0cxzzX1p3XH+pF8zPl+PmY1i1wTu
   sa5sYvkcTZ/eIk72ncBdhWQcyEZd125rYob2j2fLA7GjysGddeZeCTgaI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="372083346"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="372083346"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 23:57:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="892489902"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="892489902"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 23:56:41 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 51A97120F2C;
        Wed, 27 Sep 2023 09:41:42 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v6 13/13] media: Add MIPI CSI-2 generic long packet type definition
Date:   Wed, 27 Sep 2023 09:41:20 +0300
Message-Id: <20230927064120.367561-14-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927064120.367561-1-sakari.ailus@linux.intel.com>
References: <20230927064120.367561-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a definition for MIPI CSI-2 generic long packet types. The generic
long packet types are numbered from 1 to 4.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/mipi-csi2.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
index c3d8f12234b1..1503c3fab1fe 100644
--- a/include/media/mipi-csi2.h
+++ b/include/media/mipi-csi2.h
@@ -19,6 +19,7 @@
 #define MIPI_CSI2_DT_NULL		0x10
 #define MIPI_CSI2_DT_BLANKING		0x11
 #define MIPI_CSI2_DT_EMBEDDED_8B	0x12
+#define MIPI_CSI2_DT_GENERIC_LONG(n)	(0x12 + (n))	/* 1..4 */
 #define MIPI_CSI2_DT_YUV420_8B		0x18
 #define MIPI_CSI2_DT_YUV420_10B		0x19
 #define MIPI_CSI2_DT_YUV420_8B_LEGACY	0x1a
-- 
2.39.2

