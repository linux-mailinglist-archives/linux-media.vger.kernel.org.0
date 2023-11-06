Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 720307E2155
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:25:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbjKFMZ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:25:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbjKFMZx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:25:53 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7FFBB
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273550; x=1730809550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l/jZfXH2tVTgL8/Ie1NybefdQQ/2/AiCsyR4KUE/+0U=;
  b=J3+Lw7T/tpLWRTZQk1H4RFl6diLG+MEN3TF9qwGu3DXGLimLVj4wUTN7
   ION4fHBbDUKQSfRkW95xI5oqogM6KantJpKQSdQyY/k/u0Jmaz6QcExLq
   gUnScKNhfgwE9aBASpuVC3918zlk55/0BNhWFH1vgVi0fEecTzhKGeLzX
   GlDf8cCGaKzpc6KML4ajniJbKhloC/6vgtL3BdGmD+xeg6izQbkAPKDgY
   0um+qtVmUlVV8ia53a9NaSvNA2wP7XBms3zQ1AaowxW8TIN55jZYpQzrE
   1b0CefPqxWvWJZT40bb/iBKfTPsHxDkoo8sUY4k9EgSeA/gPWbyDr2aRI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="455747207"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="455747207"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:25:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="797291547"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="797291547"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:25:46 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 06F2C11FBBC;
        Mon,  6 Nov 2023 14:25:42 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v7 02/31] media: Documentation: Add "stream" into glossary
Date:   Mon,  6 Nov 2023 14:25:10 +0200
Message-Id: <20231106122539.1268265-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
References: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add term "stream" to the glossary of the Media subsystem documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/glossary.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
index 96a360edbf3b..ef0ab601b5bf 100644
--- a/Documentation/userspace-api/media/glossary.rst
+++ b/Documentation/userspace-api/media/glossary.rst
@@ -173,6 +173,12 @@ Glossary
 	An integrated circuit that integrates all components of a computer
 	or other electronic systems.
 
+_media-glossary-stream:
+    Stream
+	A distinct flow of data (image data or metadata) from an initial source
+	to a final sink. The initial source may be e.g. an image sensor and the
+	final sink e.g. a memory buffer.
+
     V4L2 API
 	**V4L2 userspace API**
 
-- 
2.39.2

