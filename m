Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8D85A938B
	for <lists+linux-media@lfdr.de>; Thu,  1 Sep 2022 11:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233920AbiIAJrW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Sep 2022 05:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233890AbiIAJrP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Sep 2022 05:47:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21EDE12487F
        for <linux-media@vger.kernel.org>; Thu,  1 Sep 2022 02:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662025633;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9IeIVj0ZRvOGY13ehZ1CcqV/X/o88Ugt6tp3CRjoJKU=;
        b=Cgdqd00Dds/1WkYNiMpbMs8eS6xOpm/7a04JxhuAG39oKvA1p2HeBxCh9KnQ/iC2zCTgdZ
        S4RbVF84jrYLIq5MEr7RYGXZ2KqxTE8yNO4cMo1rZ6qXEofd1l8jmhzzxz7Y0fpNugKAjq
        ULpgrWG63ubOSBXRjNmwk9eo++7lXt4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-UvCkuL4IMz-cu88ql-n8ow-1; Thu, 01 Sep 2022 05:47:08 -0400
X-MC-Unique: UvCkuL4IMz-cu88ql-n8ow-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFAED949AB3;
        Thu,  1 Sep 2022 09:46:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.90])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6AA1E40334C;
        Thu,  1 Sep 2022 09:46:55 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 11/14] media: atomisp: Remove loading mutex
Date:   Thu,  1 Sep 2022 11:46:23 +0200
Message-Id: <20220901094626.11513-12-hdegoede@redhat.com>
In-Reply-To: <20220901094626.11513-1-hdegoede@redhat.com>
References: <20220901094626.11513-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that the registering of the /dev/* video / subdev nodes has been
moved to the end of atomisp_pci_probe() the workaround with the loading
mutex to delay opens until init is done is no longer necessary.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 16 ----------------
 .../staging/media/atomisp/pci/atomisp_internal.h |  7 -------
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c |  7 -------
 3 files changed, 30 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 3fa3c28b1a80..6518e6d5c7b5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -707,29 +707,13 @@ static int atomisp_open(struct file *file)
 
 	dev_dbg(isp->dev, "open device %s\n", vdev->name);
 
-	/*
-	 * Ensure that if we are still loading we block. Once the loading
-	 * is over we can proceed. We can't blindly hold the lock until
-	 * that occurs as if the load fails we'll deadlock the unload
-	 */
-	rt_mutex_lock(&isp->loading);
-	/*
-	 * FIXME: revisit this with a better check once the code structure
-	 * is cleaned up a bit more
-	 */
 	ret = v4l2_fh_open(file);
 	if (ret) {
 		dev_err(isp->dev,
 			"%s: v4l2_fh_open() returned error %d\n",
 		       __func__, ret);
-		rt_mutex_unlock(&isp->loading);
 		return ret;
 	}
-	if (!isp->ready) {
-		rt_mutex_unlock(&isp->loading);
-		return -ENXIO;
-	}
-	rt_mutex_unlock(&isp->loading);
 
 	rt_mutex_lock(&isp->mutex);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index e299304c356b..fc7bd877dae8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -239,13 +239,6 @@ struct atomisp_device {
 	/* Purpose of mutex is to protect and serialize use of isp data
 	 * structures and css API calls. */
 	struct rt_mutex mutex;
-	/*
-	 * This mutex ensures that we don't allow an open to succeed while
-	 * the initialization process is incomplete
-	 */
-	struct rt_mutex loading;
-	/* Set once the ISP is ready to allow opens */
-	bool ready;
 	/*
 	 * Serialise streamoff: mutex is dropped during streamoff to
 	 * cancel the watchdog queue. MUST be acquired BEFORE
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index f819a6993e45..4d73bf3d6421 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1515,7 +1515,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	dev_dbg(&pdev->dev, "atomisp mmio base: %p\n", isp->base);
 
 	rt_mutex_init(&isp->mutex);
-	rt_mutex_init(&isp->loading);
 	mutex_init(&isp->streamoff_mutex);
 	spin_lock_init(&isp->lock);
 
@@ -1688,8 +1687,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 		pci_write_config_dword(pdev, MRFLD_PCI_CSI_AFE_TRIM_CONTROL, csi_afe_trim);
 	}
 
-	rt_mutex_lock(&isp->loading);
-
 	err = atomisp_initialize_modules(isp);
 	if (err < 0) {
 		dev_err(&pdev->dev, "atomisp_initialize_modules (%d)\n", err);
@@ -1737,9 +1734,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	release_firmware(isp->firmware);
 	isp->firmware = NULL;
 	isp->css_env.isp_css_fw.data = NULL;
-	isp->ready = true;
-
-	rt_mutex_unlock(&isp->loading);
 
 	err = atomisp_register_device_nodes(isp);
 	if (err)
@@ -1760,7 +1754,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 register_entities_fail:
 	atomisp_uninitialize_modules(isp);
 initialize_modules_fail:
-	rt_mutex_unlock(&isp->loading);
 	cpu_latency_qos_remove_request(&isp->pm_qos);
 	atomisp_msi_irq_uninit(isp);
 	pci_free_irq_vectors(pdev);
-- 
2.37.2

