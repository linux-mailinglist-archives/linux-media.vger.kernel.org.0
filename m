Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9C00727E97
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 13:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234051AbjFHLT2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 07:19:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbjFHLT1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 07:19:27 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771781BDF
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 04:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686223166; x=1717759166;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3Razfl+yrmYNQMStzCVzk3pyKmyT8Ar8TIR75kTfGcY=;
  b=IexAoYhqDa/i73NePB49UWN4Zp/M+ZZbrNDCKxZQfmLelPwv4FYMHJAB
   2dw6OCoC8c612XjH9UmJS3YyBzwn5yvIgJi3UqW8g3pyAgV8c1q90Nb1o
   G3+l+Mhq3coHWQOqTub+PmYiNN30rqVU6Lg+rqlxqhelMv0e74XllbHVy
   nuWqebl4TgM1jrmYXKhG44bEDgNalYm1SlfL/rCgFsPrpnhVKrdmBQ/Up
   5UYITgJjMDJwTAqZTewEoPT+DbU/Vk2y0Y4mLSSZ9CdcPcM8ZwacSGQki
   SA8im7cDyH5PuO+53vraG9NZFe64e220a4tOofP+LNFaY1eo0gzvTLdZd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="337636335"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="337636335"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 04:19:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="713080506"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="713080506"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 04:19:25 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 92FAB120BE1
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 14:19:23 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q7Df2-00H1Md-Mp
        for linux-media@vger.kernel.org; Thu, 08 Jun 2023 14:18:36 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: MAINTAINERS: Orphan dw9768 and ov02a10 drivers
Date:   Thu,  8 Jun 2023 14:18:26 +0300
Message-Id: <20230608111826.4056774-1-sakari.ailus@linux.intel.com>
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

Dongchun's e-mail is no longer active and he hasn't given a new one:

	The following message to <dongchun.zhu@mediatek.com> was
	undeliverable.
	The reason for the problem:
	5.1.0 - Unknown address error 550-'Relaying mail to
	dongchun.zhu@mediatek.com is not allowed'

Mark the drivers as orphaned.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f51f6ea39dc1c..9d5074d7461bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6252,9 +6252,8 @@ F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
 F:	drivers/media/i2c/dw9714.c
 
 DONGWOON DW9768 LENS VOICE COIL DRIVER
-M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
 L:	linux-media@vger.kernel.org
-S:	Maintained
+S:	Orphan
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
 F:	drivers/media/i2c/dw9768.c
@@ -15453,9 +15452,8 @@ T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/ov01a10.c
 
 OMNIVISION OV02A10 SENSOR DRIVER
-M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
 L:	linux-media@vger.kernel.org
-S:	Maintained
+S:	Orphan
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
 F:	drivers/media/i2c/ov02a10.c
-- 
2.30.2

