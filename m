Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 137447B04F5
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 15:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbjI0NIG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 09:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231829AbjI0NIF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 09:08:05 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD68C121
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 06:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695820081; x=1727356081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KDyLxeBir6Zkovo/hA3iXE1HGfrIPlwWH8IFTvMc9QU=;
  b=QFfGXaCzSVpujGVscVCPAYHE5EjjktFzNHbTHFj5x++H+uPM8eNCxTOz
   9bGI6nD7wxq1pPPz5YP/6X1F3VjNb3RgO9ewMNHMWC72+r5fagFgPNfVA
   gW67CqBn+TmXkXdjB/4bEZcGB1phjT+5qGyby4q6Onb2EJ0VTmCLl/IW6
   XIl2Na7vPCnEDuKBM30LjjpGcwthpVETLyHgfS6H5+oBBJIGsGpIVSn7p
   kHwwxpAFPpz4Ui4n6T7UDopEe+ZohY4iHoXWW2GMpDjIlRiyUmeoEEUcz
   0wDK6d/ThwcZ7wVqTRiNcqvct6Neqslq202Q2j/gwa0QJ7CPjHqe4WI6U
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="379098394"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="379098394"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 06:07:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="752576400"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="752576400"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 06:07:42 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id D302B1209F6;
        Wed, 27 Sep 2023 16:07:38 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v7 13/13] media: Add MIPI CSI-2 generic long packet type definition
Date:   Wed, 27 Sep 2023 16:07:38 +0300
Message-Id: <20230927130738.396185-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927064120.367561-14-sakari.ailus@linux.intel.com>
References: <20230927064120.367561-14-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a definition for MIPI CSI-2 generic long packet types. The generic
long packet types are numbered from 1 to 4.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/mipi-csi2.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
index c3d8f12234b1..40fc0264250d 100644
--- a/include/media/mipi-csi2.h
+++ b/include/media/mipi-csi2.h
@@ -19,6 +19,7 @@
 #define MIPI_CSI2_DT_NULL		0x10
 #define MIPI_CSI2_DT_BLANKING		0x11
 #define MIPI_CSI2_DT_EMBEDDED_8B	0x12
+#define MIPI_CSI2_DT_GENERIC_LONG(n)	(0x13 + (n) - 1)	/* 1..4 */
 #define MIPI_CSI2_DT_YUV420_8B		0x18
 #define MIPI_CSI2_DT_YUV420_10B		0x19
 #define MIPI_CSI2_DT_YUV420_8B_LEGACY	0x1a
-- 
2.39.2

