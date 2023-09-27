Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B39547AFAF5
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 08:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbjI0GTi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 02:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbjI0GTJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 02:19:09 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEBFDF5
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 23:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695795548; x=1727331548;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B7CGOXcmzXMCSrQFQN9qX0MwRGJpWxjTVvMfZvbuT2c=;
  b=ZbqhVvuya2xfMOXq6ugCArVrWMNsdUzR+LabCAxh0wdWzFtCppKyvQi2
   C12b/6b1i0n4v1jSPhDoH1D933KIWphySdkBRulzYxhS336w+pgoM8vmq
   5Vti6K+WaOlGhP1y0ms/yEghxQG7UD8WLjZACYeogwmAE7NOLxVR0ee5R
   y6QuZ2D0lGe0jXwHZQ7AgO17aH45pMMADhOdTCc3E92MMpSVrltMLjrm6
   Ko8w87c8hriT0VkjeRxkygzZLETssA5n+KNZL6Q4h6M7AWmIrnISkbp/H
   My4D6j8AHDES7EuS/d4w2j9kakeMDG4gI1kZQH1DutfHUYzcsBldzVeJM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="381641188"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="381641188"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 23:18:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="742598624"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="742598624"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 23:18:51 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 35ECE1209F6;
        Wed, 27 Sep 2023 09:18:48 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v5 13/13] media: Add MIPI CSI-2 generic long packet type definition
Date:   Wed, 27 Sep 2023 09:18:29 +0300
Message-Id: <20230927061829.366107-14-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927061829.366107-1-sakari.ailus@linux.intel.com>
References: <20230927061829.366107-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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

