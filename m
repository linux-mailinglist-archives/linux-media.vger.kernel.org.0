Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 591E9756CB2
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 21:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbjGQTEW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jul 2023 15:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbjGQTEV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jul 2023 15:04:21 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D631AF
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 12:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689620661; x=1721156661;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ut8u7YDAT8buYkJ/qz9sVIiaDZSBisnZnuiPnc4O5us=;
  b=EK9fHcMaeHAUHxC1Ttwmb3ZMYTo20g34fTJkurYoynBkNxbmA+3FF4ta
   uTbt6teor0TvuqUC57g22LS+jDEHH7ZC+ALPJniRYUU9HyPMTVVDfnTFO
   Mq/4nI3HDaWYn2ZnhIT+HcCVMwgvgDS+Hkw7jElydKjc2EDpUvU9dKQBB
   O8PgZ2ycCG4uGq3C/Qt4XsJAluS0Un6+uDU2WP5jKLLRfy+SueqrKKUTD
   z38U7rphkiZrz+xZoO2YDnFtAIL27i9xY7ZoWOzSKI3/7kMG02WbCpsvS
   AmXcEqR2kZsQ8TDqUklRD/4nCoOxJ+vgit4We4DKySm3bNfpDcOObZed+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="369567820"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="369567820"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 12:04:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="673641216"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="673641216"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 12:04:17 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 0532E11FAA7;
        Mon, 17 Jul 2023 22:04:15 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qLTV8-004sCp-2I;
        Mon, 17 Jul 2023 22:03:18 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH v2 1/2] media: MAINTAINERS: Add entry for V4L2 async and fwnode frameworks
Date:   Mon, 17 Jul 2023 22:03:07 +0300
Message-Id: <20230717190308.1161664-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230717190308.1161664-1-sakari.ailus@linux.intel.com>
References: <20230717190308.1161664-1-sakari.ailus@linux.intel.com>
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

Add an entry for V4L2 async and fwnode frameworks, with myself as the
maintainer.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b955943e26975..5d00c879ea5ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22279,6 +22279,16 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/clk/ux500/
 
+V4L2 ASYNC AND FWNODE FRAMEWORKS
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	drivers/media/v4l2-core/v4l2-async.c
+F:	drivers/media/v4l2-core/v4l2-fwnode.c
+F:	include/media/v4l2-async.h
+F:	include/media/v4l2-fwnode.h
+
 V4L2 SENSOR AND LENS DRIVERS
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
-- 
2.39.2

