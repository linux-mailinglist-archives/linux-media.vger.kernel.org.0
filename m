Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D58168670F
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 14:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbjBANiA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 08:38:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232146AbjBANh6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 08:37:58 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D206B4C30
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 05:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675258677; x=1706794677;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bFdAIaapF941UYw29GrlkPfvaL21wXGz1ySMam2CZG8=;
  b=KeY/EJW8oNWdG2/HIgwYo2tUQhcUXPxTBfigOpWuwOdqvI6/Tw/+xWfx
   /Cor/zoaSZJtf643la05OyPVzuCl9qSYk2GAl0zP4gbUIQxv1frzYnIZc
   59XpEdLC6GXbCapZyVVAiahcWumlKz7qwiqP0kf2/UJrAEI7spi9oS5+S
   vilfqQ4NRrXEaaO6JluN2HuWn/1+I+Klj00e/aJZ82R9fEaHvDTHfpgov
   qahpax+0VyvsP/hk4jQ5wGnA4FIxVvzSQ/1d/oV4qRovgD5JV97asP7OV
   oKtVJTWpis+AHCYiRzgeCzPsKTH1EGnGRkU/do5s5xNwezDYduwKZsJJC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="355476583"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="355476583"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 05:37:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="642416107"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="642416107"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 05:37:55 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 36F5D11FAD0;
        Wed,  1 Feb 2023 15:37:52 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     bingbu.cao@intel.com
Subject: [PATCH 1/1] media: ipu3-cio2: Fix PM runtime usage_count in driver unbind
Date:   Wed,  1 Feb 2023 15:37:51 +0200
Message-Id: <20230201133751.305474-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Get the PM runtime usage_count and forbid PM runtime at driver unbind. The
opposite is being done in probe() already.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 390bd5ea3472..3b76a9d0383a 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1843,6 +1843,9 @@ static void cio2_pci_remove(struct pci_dev *pci_dev)
 	v4l2_device_unregister(&cio2->v4l2_dev);
 	media_device_cleanup(&cio2->media_dev);
 	mutex_destroy(&cio2->lock);
+
+	pm_runtime_forbid(&pci_dev->dev);
+	pm_runtime_get_noresume(&pci_dev->dev);
 }
 
 static int __maybe_unused cio2_runtime_suspend(struct device *dev)
-- 
2.30.2

