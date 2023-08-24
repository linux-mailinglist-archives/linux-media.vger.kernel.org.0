Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69B0C786B7D
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 11:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235158AbjHXJVu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 05:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236386AbjHXJVS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 05:21:18 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D520CE67
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 02:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692868876; x=1724404876;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kVrCTSwcWBPMYc4oC7NTJ0T36dkQTx7zqf6Vxvo26Uc=;
  b=lkkcaKW+rQz1FLtZqPLGLE5mKKrGpBkZa7oaB+vvUAbrMsJTriVBbo5I
   bttWUPqmREIB5BaRbkI22zY+j2Kvwc9qJlZog6SR638guVkOXWs9pbL4D
   tcwXbW+0Q3GGqk1MrYHxJaE89M9OW2AIho66CiRyZdGHmzsXAgpkwYExZ
   xjFKlh1+RTY2sfVi2RgkX7eyDjD3QDBzkaHGx3mdPDTnAvF6POkAoHNLj
   Qw20oIql7ZPfJOwYLmeg/5VeGPRESfmi4P+ynYgR3GG65cIOfiuUBgPyq
   oj3q0sNloe/CVcAFkkowtAI4djXuywuZ/IHs1SovG+5hkhpxJPaseiPbU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="438325591"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="438325591"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 02:21:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="910837460"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="910837460"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 02:21:14 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E99781204CF;
        Thu, 24 Aug 2023 12:14:57 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qZ6Px-00GIGs-0O;
        Thu, 24 Aug 2023 12:14:17 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        jacopo.mondi@ideasonboard.com, hongju.wang@intel.com
Subject: [yavta RFC 2/2] Add support for generic metadata formats
Date:   Thu, 24 Aug 2023 12:14:07 +0300
Message-Id: <20230824091407.3883461-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824091407.3883461-1-sakari.ailus@linux.intel.com>
References: <20230824091407.3883461-1-sakari.ailus@linux.intel.com>
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

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 yavta.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/yavta.c b/yavta.c
index d5628632c1f8..fb91b146a6c7 100644
--- a/yavta.c
+++ b/yavta.c
@@ -278,6 +278,7 @@ static struct v4l2_format_info {
 	unsigned int fourcc;
 	unsigned char n_planes;
 } pixel_formats[] = {
+	/* Pixel data formats */
 	{ "RGB332", V4L2_PIX_FMT_RGB332, 1 },
 	{ "RGB444", V4L2_PIX_FMT_RGB444, 1 },
 	{ "ARGB444", V4L2_PIX_FMT_ARGB444, 1 },
@@ -359,6 +360,15 @@ static struct v4l2_format_info {
 	{ "DV", V4L2_PIX_FMT_DV, 1 },
 	{ "MJPEG", V4L2_PIX_FMT_MJPEG, 1 },
 	{ "MPEG", V4L2_PIX_FMT_MPEG, 1 },
+	/* Metadata formats */
+	{ "GENERIC_8", V4L2_META_FMT_GENERIC_8, 1 },
+	{ "GENERIC_CSI2_10", V4L2_META_FMT_GENERIC_CSI2_10, 1 },
+	{ "GENERIC_CSI2_12", V4L2_META_FMT_GENERIC_CSI2_12, 1 },
+	{ "GENERIC_CSI2_14", V4L2_META_FMT_GENERIC_CSI2_14, 1 },
+	{ "GENERIC_CSI2_16", V4L2_META_FMT_GENERIC_CSI2_16, 1 },
+	{ "GENERIC_CSI2_20", V4L2_META_FMT_GENERIC_CSI2_20, 1 },
+	{ "GENERIC_CSI2_24", V4L2_META_FMT_GENERIC_CSI2_24, 1 },
+	{ "GENERIC_CSI2_2_24", V4L2_META_FMT_GENERIC_CSI2_2_24, 1 },
 };
 
 static void list_formats(void)
-- 
2.39.2

