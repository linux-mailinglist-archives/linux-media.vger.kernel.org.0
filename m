Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 397516EE13A
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 13:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbjDYLrO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 07:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232881AbjDYLrN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 07:47:13 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F121D59D1
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 04:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682423225; x=1713959225;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sKyYFhBjGX0uckkU/nNAC7kYF8D32RV7iTuDsmROve8=;
  b=XuMrhu1L30w9zHDj7O0GwEwNAVFOHN6ptwl0pgL8OvQVBQENRyf61p8y
   MkJ62WN9oZecbFD1VTRd2vU5M+J99pZY+0P4hXalgFdJZny0CX+xzuc3S
   R6dyMMaA1UeF37/D2coTSCh0Y0Sn5a9g5lU2gDYiP88gOGv65jWmE74XE
   /bLcRo9R1uB2oRrTzIy5QNWO8bPvCxngi8gHAHBNkj/nO0wpZPOrPhrEF
   eV3EUMXKdl6fXaPAZeZW6nsW36EuEMIOwN2VTt/ob/okwcrlVuDkOf5ne
   BHkB2+l2tEUfwSjlCbFoOeKGZQD0uQRbA5Se2qOzv11oODVa8xlRFdIRK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="345493910"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="345493910"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 04:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="723992681"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="723992681"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 04:47:04 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id F134D11FAD0;
        Tue, 25 Apr 2023 14:47:00 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1prH6Y-000SUd-FC; Tue, 25 Apr 2023 14:45:06 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     jacopo.mondi@ideasonboard.com
Subject: [PATCH 1/1] media: uapi: Fix [GS]_ROUTING ACTIVE flag value
Date:   Tue, 25 Apr 2023 14:44:56 +0300
Message-Id: <20230425114456.109482-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The value of the V4L2_SUBDEV_ROUTE_FL_ACTIVE is 1, not 0. Use hexadecimal
numbers as is done elsewhere in the documentation.

Fixes: ea73eda50813 ("media: Documentation: Add GS_ROUTING documentation")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 68ca343c3b44a..2d6e3bbdd0404 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -122,7 +122,7 @@ for all the route entries and call ``VIDIOC_SUBDEV_G_ROUTING`` again.
     :widths:       3 1 4
 
     * - V4L2_SUBDEV_ROUTE_FL_ACTIVE
-      - 0
+      - 0x0001
       - The route is enabled. Set by applications.
 
 Return Value
-- 
2.30.2

