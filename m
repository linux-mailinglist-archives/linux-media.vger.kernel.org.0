Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18D726870A2
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:46:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbjBAVqL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:46:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbjBAVqJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:46:09 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 418A36952D
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287966; x=1706823966;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/gm4sb/4TkW1CYbLuQm1axWyl1O/DR1Djwowv5ZsKq8=;
  b=YFl55f35tDN2UwARIQFpB1I7jNQVgKe05/hokZ0gzS+gbr8kAb8Zl9x2
   58RjqekRnTi5YcINtOf1CtYqcphgJT/Q/XTzvwzLCtX+ryn98QZQY3fxF
   t+SIIT+eB5Dknukyzcr2CeLGVj/nZipXVYvZ6qusZhjXti2URJ6Wzrff6
   Svj4T2nqmFDSRXzPd9vLE/hsrPARhz9xj7aM45/+B9u27h5/WSqJsQ4rs
   Gph+RSaaOKDizveZPaTulg3qNCXxm5G6jEwmek8X2N0ZtENb/K168dDlp
   xtYY9o+ncFecmLHBg8M79SNi0GFqOR635tT3pt+pYI0RZi21F0JVEo/Aq
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415679"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415679"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527323"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527323"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:54 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7008212276E;
        Wed,  1 Feb 2023 23:45:51 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 20/26] media: ipu3-cio2: Call v4l2_device_unregister() earlier
Date:   Wed,  1 Feb 2023 23:45:29 +0200
Message-Id: <20230201214535.347075-21-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
References: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
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

v4l2_device_unregister() unregisters V4L2 sub-device nodes among other
things. Call it before releasing memory and other resources.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 3b76a9d0383a..d1bfcfba112f 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1836,11 +1836,11 @@ static void cio2_pci_remove(struct pci_dev *pci_dev)
 	struct cio2_device *cio2 = pci_get_drvdata(pci_dev);
 
 	media_device_unregister(&cio2->media_dev);
+	v4l2_device_unregister(&cio2->v4l2_dev);
 	v4l2_async_nf_unregister(&cio2->notifier);
 	v4l2_async_nf_cleanup(&cio2->notifier);
 	cio2_queues_exit(cio2);
 	cio2_fbpt_exit_dummy(cio2);
-	v4l2_device_unregister(&cio2->v4l2_dev);
 	media_device_cleanup(&cio2->media_dev);
 	mutex_destroy(&cio2->lock);
 
-- 
2.30.2

