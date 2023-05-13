Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6F207016B8
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239014AbjEMMeg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238926AbjEMMec (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:34:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E315C3C1B
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981174;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hE/D9Ri/Sdn5QjuhXGb10tRXQl/yD6v1hsFtko1ZtoA=;
        b=Y998miv8imcs6YkzlLm5c0MK7wbzfrAf0AqebzG74C3QbZLFAatBcN30tXV+CMJtjBrY32
        bjfHtYODMe9T/3NGHaZcH130ZwcO8ovQ5YCA9AV6Fgb3IEiItfzB8PDg7nr8Yra0xMFxLt
        ZU0GAQn3dAoRM2DPyoU4pZxQ9rDowiU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-otJrY8h8M5WvOooLmhcfjA-1; Sat, 13 May 2023 08:32:50 -0400
X-MC-Unique: otJrY8h8M5WvOooLmhcfjA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 026B7857E61;
        Sat, 13 May 2023 12:32:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6E53440C2076;
        Sat, 13 May 2023 12:32:48 +0000 (UTC)
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
Subject: [PATCH 27/30] media: atomisp: Remove unused css_pipe_id argument from atomisp_css_[start|stop]()
Date:   Sat, 13 May 2023 14:31:56 +0200
Message-Id: <20230513123159.33234-28-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
References: <20230513123159.33234-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The css_pipe_id argument pass to atomisp_css_[start|stop]() is
not used, drop it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c          | 7 ++-----
 drivers/staging/media/atomisp/pci/atomisp_compat.h       | 6 ++----
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 6 ++----
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c        | 9 ++-------
 4 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index c0c2247f02a4..d9139e67c94f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -932,7 +932,6 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 	struct atomisp_device *isp = container_of(work, struct atomisp_device,
 						  assert_recovery_work);
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
-	enum ia_css_pipe_id css_pipe_id;
 	unsigned long flags;
 	int ret;
 
@@ -954,8 +953,7 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 
 	atomisp_clear_css_buffer_counters(&isp->asd);
 
-	css_pipe_id = atomisp_get_css_pipe_id(&isp->asd);
-	atomisp_css_stop(&isp->asd, css_pipe_id, true);
+	atomisp_css_stop(&isp->asd, true);
 
 	isp->asd.preview_exp_id = 1;
 	isp->asd.postview_exp_id = 1;
@@ -976,8 +974,7 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 
 	atomisp_css_input_set_mode(&isp->asd, IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
 
-	css_pipe_id = atomisp_get_css_pipe_id(&isp->asd);
-	if (atomisp_css_start(&isp->asd, css_pipe_id, true)) {
+	if (atomisp_css_start(&isp->asd, true)) {
 		dev_warn(isp->dev, "start SP failed, so do not set streaming to be enable!\n");
 	} else {
 		spin_lock_irqsave(&isp->lock, flags);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index 89ed1f7209f0..7e99c9853532 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -78,8 +78,7 @@ int atomisp_q_dis_buffer_to_css(struct atomisp_sub_device *asd,
 
 void ia_css_mmu_invalidate_cache(void);
 
-int atomisp_css_start(struct atomisp_sub_device *asd,
-		      enum ia_css_pipe_id pipe_id, bool in_reset);
+int atomisp_css_start(struct atomisp_sub_device *asd, bool in_reset);
 
 void atomisp_css_update_isp_params(struct atomisp_sub_device *asd);
 void atomisp_css_update_isp_params_on_pipe(struct atomisp_sub_device *asd,
@@ -217,8 +216,7 @@ int atomisp_css_input_configure_port(struct atomisp_sub_device *asd,
 int atomisp_create_pipes_stream(struct atomisp_sub_device *asd);
 void atomisp_destroy_pipes_stream(struct atomisp_sub_device *asd);
 
-void atomisp_css_stop(struct atomisp_sub_device *asd,
-		      enum ia_css_pipe_id pipe_id, bool in_reset);
+void atomisp_css_stop(struct atomisp_sub_device *asd, bool in_reset);
 
 void atomisp_css_continuous_set_num_raw_frames(
      struct atomisp_sub_device *asd,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index a04c16502cac..4e004464ac4c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -985,8 +985,7 @@ int atomisp_q_dis_buffer_to_css(struct atomisp_sub_device *asd,
 	return 0;
 }
 
-int atomisp_css_start(struct atomisp_sub_device *asd,
-		      enum ia_css_pipe_id pipe_id, bool in_reset)
+int atomisp_css_start(struct atomisp_sub_device *asd, bool in_reset)
 {
 	struct atomisp_device *isp = asd->isp;
 	bool sp_is_started = false;
@@ -1814,8 +1813,7 @@ int atomisp_css_input_configure_port(
 	return 0;
 }
 
-void atomisp_css_stop(struct atomisp_sub_device *asd,
-		      enum ia_css_pipe_id pipe_id, bool in_reset)
+void atomisp_css_stop(struct atomisp_sub_device *asd, bool in_reset)
 {
 	unsigned long irqflags;
 	unsigned int i;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 6a062b86d18a..6bae107682c1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1120,7 +1120,6 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct atomisp_sub_device *asd = pipe->asd;
 	struct atomisp_device *isp = asd->isp;
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
-	enum ia_css_pipe_id css_pipe_id;
 	unsigned long irqflags;
 	int ret;
 
@@ -1135,8 +1134,6 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	/* Input system HW workaround */
 	atomisp_dma_burst_len_cfg(asd);
 
-	css_pipe_id = atomisp_get_css_pipe_id(asd);
-
 	/* Invalidate caches. FIXME: should flush only necessary buffers */
 	wbinvd();
 
@@ -1151,7 +1148,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	}
 	asd->params.dvs_6axis = NULL;
 
-	ret = atomisp_css_start(asd, css_pipe_id, false);
+	ret = atomisp_css_start(asd, false);
 	if (ret) {
 		atomisp_flush_video_pipe(pipe, VB2_BUF_STATE_QUEUED, true);
 		goto out_unlock;
@@ -1217,7 +1214,6 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 	struct atomisp_sub_device *asd = pipe->asd;
 	struct atomisp_device *isp = asd->isp;
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
-	enum ia_css_pipe_id css_pipe_id;
 	unsigned long flags;
 	int ret;
 
@@ -1247,8 +1243,7 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 	atomisp_clear_css_buffer_counters(asd);
 	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
 
-	css_pipe_id = atomisp_get_css_pipe_id(asd);
-	atomisp_css_stop(asd, css_pipe_id, false);
+	atomisp_css_stop(asd, false);
 
 	atomisp_flush_video_pipe(pipe, VB2_BUF_STATE_ERROR, true);
 
-- 
2.40.1

