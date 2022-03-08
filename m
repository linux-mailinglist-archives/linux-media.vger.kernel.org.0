Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A61C44D0DF3
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 03:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244844AbiCHCXC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 21:23:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236987AbiCHCXB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 21:23:01 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACDC3205C
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 18:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646706126; x=1678242126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BP/dvF4ZWDFHeivaxs9+jEcGT80/HvrcLnMInC68fzc=;
  b=kWja9DjEBgK4Z7nivSsKr6KChg7Ik8s+KiP5PaZJae8kfaU/Bx54SHRh
   RCGlcB9e4XvPJhsPaK2pQ7I4NFV5yWwbCRQF58jnqm0Mf5hJwgpkyPiiE
   ATAp9tAtYdH9UdvDnDgyAWQY+rdOapHWJ5SoaF5hvIQ1UYIvY9/mmMdtZ
   9pf9peNqG9XzeGNlZ/JNiHK+t0USWx9sNLTV9DY0CwyF6cbAI5GnJVzur
   cu2hfhRQXUEdfgfREQ82nrPeZ3m37Mbu39BxUL1busby9DBiLYb+xydz9
   q/1MJS/qv/jL+jxMFTMIdqsEdmSqnxDvx3RQwnIupqhnqE7HJzGlL9g7o
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254507612"
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; 
   d="scan'208";a="254507612"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2022 18:22:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; 
   d="scan'208";a="711356447"
Received: from arec-bm6650.itwn.intel.com ([10.5.253.20])
  by orsmga005.jf.intel.com with ESMTP; 07 Mar 2022 18:22:04 -0800
From:   Arec Kao <arec.kao@intel.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andy.yeh@intel.com, tfiga@google.com,
        arec.kao@intel.com
Subject: [PATCH 2/2] Re-run BLC when gain change
Date:   Tue,  8 Mar 2022 11:38:39 +0800
Message-Id: <20220308033839.3773-2-arec.kao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308033839.3773-1-arec.kao@intel.com>
References: <20220308033839.3773-1-arec.kao@intel.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changing the gain affects the black-level through the device;
the gain should therefore not be changed during a BLC procedure.
If the gain changes, then the BLC routine should be re-run
in some scenarios.

Signed-off-by: Arec Kao <arec.kao@intel.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-source.rst       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 71f23f131f97..5ee53ba76d46 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -59,6 +59,11 @@ Image Source Control IDs
     non-sensitive.
     This control is required for automatic calibration of sensors/cameras.
 
+``V4L2_CID_BLC (integer)``
+    Changing the gain affects the black-level through the device; the gain
+    should therefore not be changed during a BLC procedure. If the gain
+    changes, the BLC routine should be re-run in some scenarios.
+
 .. c:type:: v4l2_area
 
 .. flat-table:: struct v4l2_area
-- 
2.17.1

