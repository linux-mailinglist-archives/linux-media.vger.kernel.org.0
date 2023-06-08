Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE89727E8F
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 13:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234055AbjFHLPu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 07:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231634AbjFHLPt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 07:15:49 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A3519AA
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 04:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686222948; x=1717758948;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yXVELA8Mi6qyDV0GXZx7dmQ5y5t1TZNr8CAz/JhwUA8=;
  b=T1ifJzwvLtv2SX9xKooZWGPpEfKWS54nw3lpji9Dsdz+6thdgPyacz4k
   FcRahfh5M0ATqg6Au8joRk2xRVmyUfbAxlq2eGBCD7x8s7wOrLTht/1wu
   I6x7Er1FF6JaYc2xVxpsVcY6ZiRnG02+zcmZi0e9lGXYZD3m5UHYgkoyC
   NBxKC5838wPgbY1P2J+Y3k8NktsazUucfFSPBIUhCyce6pmyov/fbAt0w
   M3LHzWGu/KPWJyDISg6m0hnT7zYOdePcy8hAB2FYp9FLHcAkyazpIzRF5
   uQlC0me1M6Smj1Hxcn9rgYOJ+n7RU3ENAVA2mdiIg8Y7sXC+kI6CG9gl4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="337635754"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="337635754"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 04:15:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="713079616"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="713079616"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 04:15:47 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id DE2BA120BE1
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 14:15:44 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q7DbW-00H1CG-0K
        for linux-media@vger.kernel.org; Thu, 08 Jun 2023 14:14:58 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: MAINTAINERS: Pick ov5670 maintenance
Date:   Thu,  8 Jun 2023 14:14:47 +0300
Message-Id: <20230608111447.4056131-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Chiranjeevi's e-mail is bouncing:

   chiranjeevi.rapolu@intel.com
   DM3NAM02FT041.mail.protection.outlook.com
   Remote Server returned '550 5.4.1 Recipient address rejected: Access
   denied. AS(201806281)'

Assign the driver to myself.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 04274d975d72f..20d89582d801a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15536,7 +15536,7 @@ F:	Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
 F:	drivers/media/i2c/ov5647.c
 
 OMNIVISION OV5670 SENSOR DRIVER
-M:	Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-- 
2.30.2

