Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D86ED7B50BC
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 12:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236598AbjJBK4k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 06:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236612AbjJBK43 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 06:56:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B7BB3
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 03:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696244187; x=1727780187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KDyLxeBir6Zkovo/hA3iXE1HGfrIPlwWH8IFTvMc9QU=;
  b=A/Q6vShnku1ulWnfTQTpAiWLBWLxbuDeCiQcCqR9qgSVI11abFC7zqNg
   hq3vsfQEdpozH6Gf66oDschucSLC2Ku6S5JhYH29FSAGWksaF2eYvh1bj
   d1M/SyKl/Hlv5UZkcGnoAiWoGG16OyzblA1btaQ1HgcXdRN2lG9V7QdWe
   UA3QIlhZIYMempyR/ro/8iV5m2XGuZSXHOBVkXO+PUiJdNyGUPR04h2cs
   D9HTYY+vu9p7H+ZgoxsT+FMSkZXi1zNJNjFVNJ2wsOOXrT6xukVJW4STB
   sRvlF/q/u59OrwCzPcql+JKo0s7XjPSmPwfcWEBRTsbGqDDLqPl5U2hOU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="379896428"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="379896428"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 03:56:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="816251228"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="816251228"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 03:56:24 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 0185A1206C3;
        Mon,  2 Oct 2023 13:56:20 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v7 18/19] media: Add MIPI CSI-2 generic long packet type definition
Date:   Mon,  2 Oct 2023 13:55:56 +0300
Message-Id: <20231002105557.28972-19-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002105557.28972-1-sakari.ailus@linux.intel.com>
References: <20231002105557.28972-1-sakari.ailus@linux.intel.com>
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

