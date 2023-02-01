Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 680056870A1
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbjBAVqK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:46:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbjBAVqJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:46:09 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB7C366FAE
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287966; x=1706823966;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2tB1U4gSG7i6iUdvuFpxNjdylTQOIc7zBUgl8qwpxoQ=;
  b=UMKjoEffaxgcBqPWL1JUJHZL2Zmy9MIgR0qGBnAwo4LwkV5Bh/URuwat
   8A1GxyII2iDF/dX6upjIFAlo2Wa7PZuW54Rq/3r+INaMOJtJueZtnx2Qp
   v1UFw7n8S1kJUQTnsNh3AoxpWajQOHEMqPIatKpItukVLh1cwOQ2+6Xap
   xyCD/rA+901o8LwfuityvCu9ZAcqZEfJPVdjJp+nhFnKmX1Xi6mf4Nv9u
   UDzleAGYwapMy9lQviEimZkDVbt63H0RZuumUsBJJHOZeyq813Iowzl5n
   w9FJR+byoGiz6YwmihNXmXOKfooAqVfj43HZixLENcYskrgeaP1Z0aKAZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415683"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415683"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527325"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527325"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:54 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 0D7AA1227F2;
        Wed,  1 Feb 2023 23:45:51 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 21/26] media: ipu3-cio2: Don't use devm_request_irq()
Date:   Wed,  1 Feb 2023 23:45:30 +0200
Message-Id: <20230201214535.347075-22-sakari.ailus@linux.intel.com>
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

Use request_irq() instead of devm_request_irq(), as a handler set using
devm_request_irq() may still be called once the driver's remove() callback
has been called.

Also register the IRQ earlier on.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index d1bfcfba112f..9fdfb2a794db 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1773,6 +1773,12 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 	if (r)
 		return r;
 
+	r = request_irq(pci_dev->irq, cio2_irq, IRQF_SHARED, CIO2_NAME, cio2);
+	if (r) {
+		dev_err(dev, "failed to request IRQ (%d)\n", r);
+		goto fail_mutex_destroy;
+	}
+
 	mutex_init(&cio2->lock);
 
 	cio2->media_dev.dev = dev;
@@ -1783,7 +1789,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 	media_device_init(&cio2->media_dev);
 	r = media_device_register(&cio2->media_dev);
 	if (r < 0)
-		goto fail_mutex_destroy;
+		goto fail_free_irq;
 
 	cio2->v4l2_dev.mdev = &cio2->media_dev;
 	r = v4l2_device_register(dev, &cio2->v4l2_dev);
@@ -1803,13 +1809,6 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 	if (r)
 		goto fail_clean_notifier;
 
-	r = devm_request_irq(dev, pci_dev->irq, cio2_irq, IRQF_SHARED,
-			     CIO2_NAME, cio2);
-	if (r) {
-		dev_err(dev, "failed to request IRQ (%d)\n", r);
-		goto fail_clean_notifier;
-	}
-
 	pm_runtime_put_noidle(dev);
 	pm_runtime_allow(dev);
 
@@ -1824,6 +1823,8 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 fail_media_device_unregister:
 	media_device_unregister(&cio2->media_dev);
 	media_device_cleanup(&cio2->media_dev);
+fail_free_irq:
+	free_irq(pci_dev->irq, cio2);
 fail_mutex_destroy:
 	mutex_destroy(&cio2->lock);
 	cio2_fbpt_exit_dummy(cio2);
@@ -1837,6 +1838,7 @@ static void cio2_pci_remove(struct pci_dev *pci_dev)
 
 	media_device_unregister(&cio2->media_dev);
 	v4l2_device_unregister(&cio2->v4l2_dev);
+	free_irq(pci_dev->irq, cio2);
 	v4l2_async_nf_unregister(&cio2->notifier);
 	v4l2_async_nf_cleanup(&cio2->notifier);
 	cio2_queues_exit(cio2);
-- 
2.30.2

