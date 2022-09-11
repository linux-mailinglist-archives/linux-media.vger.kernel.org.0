Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEF45B502C
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 19:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbiIKRRU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 13:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiIKRRR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 13:17:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 411AE27DC6
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 10:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662916635;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SVy9Se1Bcb6r7keuQDw/xThxa3FL+f5qS+tclVoGzNs=;
        b=QGG01mcxF1HVBAOTU+CwlFd0IKT43NocpJCPw/l9t5iQm2gmm/RxsvHDzdRDLaSDgWfQkF
        U+mTP8eNMNglmmcId0oxQL3734VUFjQiTV1extJWhr587imCpNVYBGrh6UFvJt23Q8U/7O
        9IeKma5YJv5WP4I01qR7Y1vKarUe0Do=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-ESVvlopfOB6AxKfk0Q2psw-1; Sun, 11 Sep 2022 13:17:13 -0400
X-MC-Unique: ESVvlopfOB6AxKfk0Q2psw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 442F9101A54E;
        Sun, 11 Sep 2022 17:17:13 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BFDEE492C3B;
        Sun, 11 Sep 2022 17:17:11 +0000 (UTC)
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
Subject: [PATCH 09/17] media: atomisp: Drop streamoff_mutex
Date:   Sun, 11 Sep 2022 19:16:45 +0200
Message-Id: <20220911171653.568932-10-hdegoede@redhat.com>
In-Reply-To: <20220911171653.568932-1-hdegoede@redhat.com>
References: <20220911171653.568932-1-hdegoede@redhat.com>
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

Now that __atomisp_streamoff() no longer drops isp->mutex to cancel
the watchdog timer, the streamoff_mutex is no longer necessary to
avoid multiple streamoffs racing with each other.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c     | 2 --
 drivers/staging/media/atomisp/pci/atomisp_internal.h | 6 ------
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c    | 3 ---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c     | 1 -
 4 files changed, 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index e1b213ba4686..531bbd6d7ee0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -822,7 +822,6 @@ static int atomisp_release(struct file *file)
 	if (!isp)
 		return -EBADF;
 
-	mutex_lock(&isp->streamoff_mutex);
 	mutex_lock(&isp->mutex);
 
 	dev_dbg(isp->dev, "release device %s\n", vdev->name);
@@ -909,7 +908,6 @@ static int atomisp_release(struct file *file)
 				     V4L2_SEL_TGT_COMPOSE, 0,
 				     &clear_compose);
 	mutex_unlock(&isp->mutex);
-	mutex_unlock(&isp->streamoff_mutex);
 
 	return v4l2_fh_release(file);
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 2279d45e7d7a..f3ef840c640a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -239,12 +239,6 @@ struct atomisp_device {
 	/* Purpose of mutex is to protect and serialize use of isp data
 	 * structures and css API calls. */
 	struct mutex mutex;
-	/*
-	 * Serialise streamoff: mutex is dropped during streamoff to
-	 * cancel the watchdog queue. MUST be acquired BEFORE
-	 * "mutex".
-	 */
-	struct mutex streamoff_mutex;
 
 	unsigned int input_cnt;
 	struct atomisp_input_subdev inputs[ATOM_ISP_MAX_INPUTS];
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 899157584951..6d84a7e9cb57 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1872,7 +1872,6 @@ int __atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 		atomisp_subdev_source_pad(vdev), asd->index);
 
 	lockdep_assert_held(&isp->mutex);
-	lockdep_assert_held(&isp->streamoff_mutex);
 
 	if (type != V4L2_BUF_TYPE_VIDEO_CAPTURE) {
 		dev_dbg(isp->dev, "unsupported v4l2 buf type\n");
@@ -2081,11 +2080,9 @@ static int atomisp_streamoff(struct file *file, void *fh,
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	int rval;
 
-	mutex_lock(&isp->streamoff_mutex);
 	mutex_lock(&isp->mutex);
 	rval = __atomisp_streamoff(file, fh, type);
 	mutex_unlock(&isp->mutex);
-	mutex_unlock(&isp->streamoff_mutex);
 
 	return rval;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index d55e8d32a286..4ab91858d308 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1482,7 +1482,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	dev_dbg(&pdev->dev, "atomisp mmio base: %p\n", isp->base);
 
 	mutex_init(&isp->mutex);
-	mutex_init(&isp->streamoff_mutex);
 	spin_lock_init(&isp->lock);
 
 	/* This is not a true PCI device on SoC, so the delay is not needed. */
-- 
2.37.3

