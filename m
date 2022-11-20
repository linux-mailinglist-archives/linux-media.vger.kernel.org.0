Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FFF66316F2
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbiKTWn2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:43:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbiKTWnM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:43:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32EE023E96
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668984087;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ERDyOvoRsyTW4Tfa3Ne/ZFnzikTXaDOCzSi+s3lnJv8=;
        b=N16W31UMPaIip9CHrYn95xMXIjxFGJ8bsA/+HgqBQJ0TzF32o9NXVoSTd/OJADxHS4CUq3
        s157JTNT6Pkv32RSdBHj/Fg+kHJVXygzNZOIXH2C4ycHWIreWYY61G0Npk9wjVczFqIkOV
        SBLxDeUkaLrrT+m227PrvS3YCpKrmsk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-jSr__k3MOJqx3DSHTTQJFQ-1; Sun, 20 Nov 2022 17:41:24 -0500
X-MC-Unique: jSr__k3MOJqx3DSHTTQJFQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 661F7811E67;
        Sun, 20 Nov 2022 22:41:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E8A4547505E;
        Sun, 20 Nov 2022 22:41:20 +0000 (UTC)
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
Subject: [PATCH 07/20] media: atomisp: Remove 2 unused accelerator mode related functions
Date:   Sun, 20 Nov 2022 23:40:48 +0100
Message-Id: <20221120224101.746199-8-hdegoede@redhat.com>
In-Reply-To: <20221120224101.746199-1-hdegoede@redhat.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove ia_css_pipe_get_acc_stage_desc() and sh_css_flush(),
after removing the accelerator /dev/video# node and related ioctls
these are no longer used.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../pipe/interface/ia_css_pipe_stagedesc.h    |  5 -----
 .../pci/camera/pipe/src/pipe_stagedesc.c      | 21 -------------------
 drivers/staging/media/atomisp/pci/sh_css.c    |  9 --------
 .../media/atomisp/pci/sh_css_internal.h       |  3 ---
 4 files changed, 38 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_stagedesc.h b/drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_stagedesc.h
index 40c8145a0797..7a0c988d89ee 100644
--- a/drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_stagedesc.h
+++ b/drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_stagedesc.h
@@ -38,11 +38,6 @@ void ia_css_pipe_get_firmwares_stage_desc(
     const struct ia_css_fw_info *fw,
     unsigned int mode);
 
-void ia_css_pipe_get_acc_stage_desc(
-    struct ia_css_pipeline_stage_desc *stage_desc,
-    struct ia_css_binary *binary,
-    struct ia_css_fw_info *fw);
-
 void ia_css_pipe_get_sp_func_stage_desc(
     struct ia_css_pipeline_stage_desc *stage_desc,
     struct ia_css_frame *out_frame,
diff --git a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c
index 82a24aabe8ce..6c93fa1c683b 100644
--- a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c
+++ b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c
@@ -74,27 +74,6 @@ void ia_css_pipe_get_firmwares_stage_desc(
 	stage_desc->vf_frame = vf_frame;
 }
 
-void ia_css_pipe_get_acc_stage_desc(
-    struct ia_css_pipeline_stage_desc *stage_desc,
-    struct ia_css_binary *binary,
-    struct ia_css_fw_info *fw)
-{
-	unsigned int i;
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_pipe_get_acc_stage_desc() enter:\n");
-	stage_desc->binary = binary;
-	stage_desc->firmware = fw;
-	stage_desc->sp_func = IA_CSS_PIPELINE_NO_FUNC;
-	stage_desc->max_input_width = 0;
-	stage_desc->mode = IA_CSS_BINARY_MODE_VF_PP;
-	stage_desc->in_frame = NULL;
-	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
-		stage_desc->out_frame[i] = NULL;
-	}
-	stage_desc->vf_frame = NULL;
-}
-
 void ia_css_pipe_get_sp_func_stage_desc(
     struct ia_css_pipeline_stage_desc *stage_desc,
     struct ia_css_frame *out_frame,
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 33348a43c1de..726cb7aa4ecd 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1629,15 +1629,6 @@ ia_css_enable_isys_event_queue(bool enable)
 	return 0;
 }
 
-/* For Acceleration API: Flush FW (shared buffer pointer) arguments */
-void
-sh_css_flush(struct ia_css_acc_fw *fw)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "sh_css_flush() enter:\n");
-	if ((fw) && (my_css.flush))
-		my_css.flush(fw);
-}
-
 /*
  * Mapping sp threads. Currently, this is done when a stream is created and
  * pipelines are ready to be converted to sp pipelines. Be careful if you are
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index 0441d4fec551..d98f1323441e 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -897,9 +897,6 @@ sh_css_params_init(void);
 void
 sh_css_params_uninit(void);
 
-/* For Acceleration API: Flush FW (shared buffer pointer) arguments */
-void sh_css_flush(struct ia_css_acc_fw *fw);
-
 void
 sh_css_binary_args_reset(struct sh_css_binary_args *args);
 
-- 
2.38.1

