Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A85EE573C12
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 19:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236216AbiGMRji (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 13:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231617AbiGMRjh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 13:39:37 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C7921E2A
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 10:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657733976; x=1689269976;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bl9iFsbMuXpBEDxOjomm2sg88xZWu0v2tjkoFp3G4yM=;
  b=MKY1vZVbsD2npfxGUJYYw2b1P3EE4HkD2HPdjatx4z3TwrWa16tj3QgT
   0E0MKWoBP2hMBLsGDbDOSTFt/lQ9W4VW7vKKfEmIsePvkLyUtEqKYaKnQ
   pwEmI9I47RwxkHOJEMmome77gXOwHXrry9OZVPF0nbx+1ndPkLPwGxR/y
   AVZYcSXKIlkaXAev0/NIRQnlAfyQsW1FXBF74hNIIWiSoo52DnmUx3WkH
   iWmUjNzosRmewHuVCY1prVJs7ziq6GMW9gTgTTvdO/PpAd5oY5LPTz08d
   hzLvfm4TVZbhF9ls7Af1+z6b0zjVCs9lVZeFZiVjcHMFPXfBfpLpd2MTx
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="268330113"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="268330113"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2022 10:39:19 -0700
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="595790032"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2022 10:39:18 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id E3FAB20343;
        Wed, 13 Jul 2022 20:39:15 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1oBgKW-000vrn-TM; Wed, 13 Jul 2022 20:39:20 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/1] v4l: Kconfig: Drop subdev API option help text
Date:   Wed, 13 Jul 2022 20:39:20 +0300
Message-Id: <20220713173920.222394-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The config option text was recently removed, also remove the help text.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/Kconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index 348559bc24689..60b0c6ee7343a 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -11,11 +11,6 @@ config VIDEO_V4L2_I2C
 config VIDEO_V4L2_SUBDEV_API
 	bool
 	depends on VIDEO_DEV && MEDIA_CONTROLLER
-	help
-	  Enables the V4L2 sub-device pad-level userspace API used to configure
-	  video format, size and frame rate between hardware blocks.
-
-	  This API is mostly used by camera interfaces in embedded platforms.
 
 config VIDEO_ADV_DEBUG
 	bool "Enable advanced debug functionality on V4L2 drivers"
-- 
2.30.2

