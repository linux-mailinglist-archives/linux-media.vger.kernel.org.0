Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 561CF7016B7
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238960AbjEMMee (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:34:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238375AbjEMMec (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:34:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF7E3C04
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981167;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SThSvCJh2rAK3p94zjaOcZSOufwhnlQlx3PiD3xmtf4=;
        b=U+lW30oT2rtjpztrIrCpBYArKd2GCeuYhzXDPx+14jafeKQy/GBhS6+DhWqsGeGwQ2ymC3
        iUWkAHE94yWwUAV3ImYH5QK7aol9LDIlotwEVzakb+kSg6Eds0kRt0KcYXmHuDq3TcV1to
        Og6ENwEQozBP5Wd679cn+f5XaEGZg1I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-uA-eH7vUOYavmhP88F86Hw-1; Sat, 13 May 2023 08:32:41 -0400
X-MC-Unique: uA-eH7vUOYavmhP88F86Hw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EC343C025CC;
        Sat, 13 May 2023 12:32:41 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9EA3E40C2076;
        Sat, 13 May 2023 12:32:39 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 22/30] media: atomisp: Remove atomisp_streaming_count()
Date:   Sat, 13 May 2023 14:31:51 +0200
Message-Id: <20230513123159.33234-23-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
References: <20230513123159.33234-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

atomisp_streaming_count() is just an alias for isp->asd.streaming now,
replace it with directly checking that and remove the helper.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c   | 6 +++---
 drivers/staging/media/atomisp/pci/atomisp_drvfs.c | 2 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 5 -----
 drivers/staging/media/atomisp/pci/atomisp_ioctl.h | 2 --
 4 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 1482184a9ea5..b2bc9bc050ba 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -472,7 +472,7 @@ irqreturn_t atomisp_isr(int irq, void *dev)
 
 	clear_irq_reg(isp);
 
-	if (!atomisp_streaming_count(isp))
+	if (!isp->asd.streaming)
 		goto out_nowake;
 
 	if (isp->asd.streaming) {
@@ -947,7 +947,7 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 
 	mutex_lock(&isp->mutex);
 
-	if (!atomisp_streaming_count(isp))
+	if (!isp->asd.streaming)
 		goto out_unlock;
 
 	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
@@ -1074,7 +1074,7 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr)
 
 	spin_lock_irqsave(&isp->lock, flags);
 
-	if (!atomisp_streaming_count(isp)) {
+	if (!isp->asd.streaming) {
 		spin_unlock_irqrestore(&isp->lock, flags);
 		return IRQ_HANDLED;
 	}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
index 3ddc935ec01d..1df534bf54d3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
@@ -69,7 +69,7 @@ static inline int iunit_dump_dbgopt(struct atomisp_device *isp,
 		}
 
 		if (opt & OPTION_BIN_RUN) {
-			if (atomisp_streaming_count(isp)) {
+			if (isp->asd.streaming) {
 				atomisp_css_dump_sp_raw_copy_linecount(true);
 				atomisp_css_debug_dump_isp_binary();
 			} else {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 020d4184375f..6a062b86d18a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -599,11 +599,6 @@ static int atomisp_enum_input(struct file *file, void *fh,
 	return 0;
 }
 
-unsigned int atomisp_streaming_count(struct atomisp_device *isp)
-{
-	return isp->asd.streaming;
-}
-
 /*
  * get input are used to get current primary/secondary camera
  */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
index db6da77df06b..997fa61589ab 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
@@ -47,8 +47,6 @@ enum ia_css_pipe_id atomisp_get_css_pipe_id(struct atomisp_sub_device
 
 extern const struct v4l2_ioctl_ops atomisp_ioctl_ops;
 
-unsigned int atomisp_streaming_count(struct atomisp_device *isp);
-
 /* compat_ioctl for 32bit userland app and 64bit kernel */
 long atomisp_compat_ioctl32(struct file *file,
 			    unsigned int cmd, unsigned long arg);
-- 
2.40.1

