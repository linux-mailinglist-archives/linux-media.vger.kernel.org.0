Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6BD54D300
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347813AbiFOUv1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347795AbiFOUv0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:51:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4975D54FBE
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326284;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wLEDgXyK7g2XPltXOqEMT4vvvBIc8zK3FcC2/zzaTUs=;
        b=CXVj1SOoy97EkO4G3h2chTklXAConmz+Rqr3+jfvTGKHVHVbRUx7KMtW9U80Qx7KN1fGur
        Y4kiQxsaRKAUYY/ZofwLM1gmK1nAighKfIFO70kDjsI3Xw8ihzLAi4OjkQ/5oGIfRBLWGN
        UhOlNexrvHOCEwVR51s6fmMyzEZeAj4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-qCR5UGBRMgahV6Jh0xL33Q-1; Wed, 15 Jun 2022 16:51:22 -0400
X-MC-Unique: qCR5UGBRMgahV6Jh0xL33Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D6DA85A587;
        Wed, 15 Jun 2022 20:51:22 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B2C79111F5;
        Wed, 15 Jun 2022 20:51:20 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 23/40] media: atomisp: remove atomisp_is_acc_enabled()
Date:   Wed, 15 Jun 2022 22:50:20 +0200
Message-Id: <20220615205037.16549-24-hdegoede@redhat.com>
In-Reply-To: <20220615205037.16549-1-hdegoede@redhat.com>
References: <20220615205037.16549-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

atomisp_is_acc_enabled() always returns false now, remove it.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c   | 4 ++--
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 5 -----
 drivers/staging/media/atomisp/pci/atomisp_ioctl.h | 1 -
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index d8b3896a267a..04643eb2dff0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -538,7 +538,7 @@ irqreturn_t atomisp_isr(int irq, void *dev)
 
 	clear_irq_reg(isp);
 
-	if (!atomisp_streaming_count(isp) && !atomisp_is_acc_enabled(isp))
+	if (!atomisp_streaming_count(isp))
 		goto out_nowake;
 
 	for (i = 0; i < isp->num_of_streams; i++) {
@@ -1837,7 +1837,7 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr)
 
 	spin_lock_irqsave(&isp->lock, flags);
 
-	if (!atomisp_streaming_count(isp) && !atomisp_is_acc_enabled(isp)) {
+	if (!atomisp_streaming_count(isp)) {
 		spin_unlock_irqrestore(&isp->lock, flags);
 		return IRQ_HANDLED;
 	}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 725b3b1562b1..73906902600c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -624,11 +624,6 @@ unsigned int atomisp_streaming_count(struct atomisp_device *isp)
 	return sum;
 }
 
-unsigned int atomisp_is_acc_enabled(struct atomisp_device *isp)
-{
-	return 0;
-}
-
 /*
  * get input are used to get current primary/secondary camera
  */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
index 412bfcf33c0f..d85e0d697a4e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
@@ -57,7 +57,6 @@ extern const struct v4l2_ioctl_ops atomisp_file_ioctl_ops;
 
 unsigned int atomisp_streaming_count(struct atomisp_device *isp);
 
-unsigned int atomisp_is_acc_enabled(struct atomisp_device *isp);
 /* compat_ioctl for 32bit userland app and 64bit kernel */
 long atomisp_compat_ioctl32(struct file *file,
 			    unsigned int cmd, unsigned long arg);
-- 
2.36.0

