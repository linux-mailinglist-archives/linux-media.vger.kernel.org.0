Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96D9B7016BE
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239131AbjEMMen (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239040AbjEMMeg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:34:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D8D2D55
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981178;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q8KvfRknR9TGrBLueLHE4gq0CnKGPcnYKVSreJbXi78=;
        b=Rwyvfa5EtfTps8jLgxeaEtO2rWE/FeorLMaby6Xc0g/mw1iLSDF41V1+gRe4oJGyV+2BCV
        0V96xiEFZpIvToEdtfaTT32gvj35zR0ahtgOB0HipTh1/Vh9ac0j8ZapYO3DKMRyKjoDj3
        3PDD3wM6FVetdnFB4Uhk4QCE3xVH9Wk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-XmAR5rcqMNCMcUrPWJDB_g-1; Sat, 13 May 2023 08:32:54 -0400
X-MC-Unique: XmAR5rcqMNCMcUrPWJDB_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8231429AA3B0;
        Sat, 13 May 2023 12:32:53 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EE91840C2076;
        Sat, 13 May 2023 12:32:51 +0000 (UTC)
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
Subject: [PATCH 29/30] media: atomisp: Remove in_reset argument from atomisp_css_start()
Date:   Sat, 13 May 2023 14:31:58 +0200
Message-Id: <20230513123159.33234-30-hdegoede@redhat.com>
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

The in_reset argument to atomisp_css_start() is only ever true
in atomisp_assert_recovery_work(), drop the argument and move
the special reset handlig to atomisp_assert_recovery_work().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c       |  8 +++++++-
 drivers/staging/media/atomisp/pci/atomisp_compat.h    |  2 +-
 .../staging/media/atomisp/pci/atomisp_compat_css20.c  | 11 +----------
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c     |  2 +-
 4 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index d9139e67c94f..9c44ffba2828 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -974,7 +974,13 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 
 	atomisp_css_input_set_mode(&isp->asd, IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
 
-	if (atomisp_css_start(&isp->asd, true)) {
+	/* Recreate streams destroyed by atomisp_css_stop() */
+	atomisp_create_pipes_stream(&isp->asd);
+
+	/* Invalidate caches. FIXME: should flush only necessary buffers */
+	wbinvd();
+
+	if (atomisp_css_start(&isp->asd)) {
 		dev_warn(isp->dev, "start SP failed, so do not set streaming to be enable!\n");
 	} else {
 		spin_lock_irqsave(&isp->lock, flags);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index 7e99c9853532..e9e4bfb0f5f9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -78,7 +78,7 @@ int atomisp_q_dis_buffer_to_css(struct atomisp_sub_device *asd,
 
 void ia_css_mmu_invalidate_cache(void);
 
-int atomisp_css_start(struct atomisp_sub_device *asd, bool in_reset);
+int atomisp_css_start(struct atomisp_sub_device *asd);
 
 void atomisp_css_update_isp_params(struct atomisp_sub_device *asd);
 void atomisp_css_update_isp_params_on_pipe(struct atomisp_sub_device *asd,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 4e004464ac4c..b13d1cb4668d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -985,21 +985,12 @@ int atomisp_q_dis_buffer_to_css(struct atomisp_sub_device *asd,
 	return 0;
 }
 
-int atomisp_css_start(struct atomisp_sub_device *asd, bool in_reset)
+int atomisp_css_start(struct atomisp_sub_device *asd)
 {
 	struct atomisp_device *isp = asd->isp;
 	bool sp_is_started = false;
 	int ret = 0, i = 0;
 
-	if (in_reset) {
-		ret = atomisp_css_update_stream(asd);
-		if (ret)
-			return ret;
-
-		/* Invalidate caches. FIXME: should flush only necessary buffers */
-		wbinvd();
-	}
-
 	if (!sh_css_hrt_system_is_idle())
 		dev_err(isp->dev, "CSS HW not idle before starting SP\n");
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 1deeb7c28379..900e4c79cd78 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1120,7 +1120,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	}
 	asd->params.dvs_6axis = NULL;
 
-	ret = atomisp_css_start(asd, false);
+	ret = atomisp_css_start(asd);
 	if (ret) {
 		atomisp_flush_video_pipe(pipe, VB2_BUF_STATE_QUEUED, true);
 		goto out_unlock;
-- 
2.40.1

