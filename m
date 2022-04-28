Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 494DB513ECD
	for <lists+linux-media@lfdr.de>; Fri, 29 Apr 2022 00:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353103AbiD1XAA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Apr 2022 19:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353087AbiD1W76 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Apr 2022 18:59:58 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C93B04C416
        for <linux-media@vger.kernel.org>; Thu, 28 Apr 2022 15:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651186602; x=1682722602;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bz3JURUv0/5KoRWZijoV6PiDzHE0xKAaSywDeUJdcz8=;
  b=T12NOFxfJg1FRtxIXSYPdSA0qkRoEjmXETCf+LD3XySNGw8147K8HPct
   aXKfxL10Y8FpAV2m2crQKa1WaCcdQtq+2NxA1RhEoQBqsKT7vpfzWPSfp
   DP+HstkAL21ob5+0QroSxftLYz0swQnh5buO8iJ13Cpna9O65ehg4SKEZ
   sS9G30dmis/RiG8PmCAtNqf5Fz2mhSowNXlU6x3PBOTOgr43SGx0ZLkAH
   PKeBlG87lifAFBpDSi2eWM9ydpIpGBnCoONijpr2LMY4EyVjIfM7fQoJQ
   tXYztinAeMyij9P6dwwDkaeGmjptmEtTJLJ8cWw/aSr6Ly6KKMye1OYLn
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="253834536"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="253834536"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 15:56:42 -0700
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="629778773"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 15:56:41 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 4562320423
        for <linux-media@vger.kernel.org>; Fri, 29 Apr 2022 01:56:39 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1nkD5W-0042Kw-GJ
        for linux-media@vger.kernel.org; Fri, 29 Apr 2022 01:58:18 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: Add MIPI CSI-2 28 bits per pixel raw data type
Date:   Fri, 29 Apr 2022 01:58:18 +0300
Message-Id: <20220428225818.962249-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add CSI-2 data type for 28 bits per pixel data.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/mipi-csi2.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
index 392794e5badd0..c3d8f12234b1f 100644
--- a/include/media/mipi-csi2.h
+++ b/include/media/mipi-csi2.h
@@ -31,6 +31,7 @@
 #define MIPI_CSI2_DT_RGB565		0x22
 #define MIPI_CSI2_DT_RGB666		0x23
 #define MIPI_CSI2_DT_RGB888		0x24
+#define MIPI_CSI2_DT_RAW28		0x26
 #define MIPI_CSI2_DT_RAW24		0x27
 #define MIPI_CSI2_DT_RAW6		0x28
 #define MIPI_CSI2_DT_RAW7		0x29
-- 
2.30.2

