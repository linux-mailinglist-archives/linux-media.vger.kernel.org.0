Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD487AB37F
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 16:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234286AbjIVOXU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 10:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234279AbjIVOXT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 10:23:19 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA8D8197
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 07:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695392593; x=1726928593;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B7CGOXcmzXMCSrQFQN9qX0MwRGJpWxjTVvMfZvbuT2c=;
  b=l34pqnG5lUdAE6pGa2mxFu2fo9pPds1PjMIRzfUmd78RLXHob1gqe9GO
   U/HuXLJ69mA3V1G1zfsDPFxzdtPgSIW9s0a/z/ArC6iYaoE1kjpp+Ncus
   2IrQP8e3nUUJHFpNSFNHZcZ3BULCiet5LFZYPMHbgcpskjvvvcWZzOZe2
   68R4rvuhebAptBrV6Id/hCrEUDPA1oIckRNe6Uz3h/ZaBIMvj2eaMxzI8
   CMcWnONdSCkHzYhi1CoY05DjWTtoZMBiSO3PNryH9zOKyDhZxNsYwDn5j
   wy62JogmKHyr1tGKzAcU8nrYwAeT0vYEyJWhOR/P6rGyc4oaqlxI/6/yP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360218973"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="360218973"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="741112507"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="741112507"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:23:10 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 665261208F8;
        Fri, 22 Sep 2023 17:23:06 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v4 16/23] media: Add MIPI CSI-2 generic long packet type definition
Date:   Fri, 22 Sep 2023 17:22:32 +0300
Message-Id: <20230922142239.259425-17-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
References: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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

