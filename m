Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96D0D6316E6
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbiKTWmS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:42:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbiKTWmM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:42:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F97F23BC6
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668984079;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J/KcFS2JbPubPMvE4f3vZjcFQCvYQ3vNSxCBEiaKzug=;
        b=a4Ar488iEdPQIPhdznQr6sNKzK6ObOj6ouq4A55pjj6sh7F0CLH8tRoWVKFP6H7EiRBJh7
        y0i4uZM1IgdJY7S+ARGAr0IJuD/ZWcSidxWTps1U0Yt6VaJjPs+7nDsnuWUeRxKo3CI+qG
        Vgji9lICgTazY8FfNr8uuia/qXSw4/U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-MPbdTbr2OWOcf-cxXhyZng-1; Sun, 20 Nov 2022 17:41:16 -0500
X-MC-Unique: MPbdTbr2OWOcf-cxXhyZng-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB5BB800186;
        Sun, 20 Nov 2022 22:41:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3D70747505E;
        Sun, 20 Nov 2022 22:41:14 +0000 (UTC)
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
Subject: [PATCH 03/20] media: atomisp: Remove unused QOS defines / structure member
Date:   Sun, 20 Nov 2022 23:40:44 +0100
Message-Id: <20221120224101.746199-4-hdegoede@redhat.com>
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

Withe the accel code gone this is unused, remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../pci/runtime/pipeline/interface/ia_css_pipeline.h     | 2 --
 drivers/staging/media/atomisp/pci/sh_css_internal.h      | 9 ---------
 drivers/staging/media/atomisp/pci/sh_css_sp.c            | 2 +-
 3 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h b/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
index de2c526a58ae..222c381ff3b9 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
@@ -54,7 +54,6 @@ struct ia_css_pipeline {
 	unsigned int inout_port_config;
 	int num_execs;
 	bool acquire_isp_each_stage;
-	u32 pipe_qos_config;
 };
 
 #define DEFAULT_PIPELINE { \
@@ -65,7 +64,6 @@ struct ia_css_pipeline {
 	.dvs_frame_delay	= IA_CSS_FRAME_DELAY_1, \
 	.num_execs		= -1, \
 	.acquire_isp_each_stage	= true, \
-	.pipe_qos_config	= QOS_INVALID \
 }
 
 /* Stage descriptor used to create a new stage in the pipeline */
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index 98267707a5fc..0441d4fec551 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -488,15 +488,6 @@ ia_css_metadata_free_multiple(unsigned int num_bufs,
 
 /* Macro for handling pipe_qos_config */
 #define QOS_INVALID                  (~0U)
-#define QOS_ALL_STAGES_DISABLED      (0U)
-#define QOS_STAGE_MASK(num)          (0x00000001 << num)
-#define SH_CSS_IS_QOS_PIPE(pipe)               ((pipe)->pipe_qos_config != QOS_INVALID)
-#define SH_CSS_QOS_STAGE_ENABLE(pipe, num)     ((pipe)->pipe_qos_config |= QOS_STAGE_MASK(num))
-#define SH_CSS_QOS_STAGE_DISABLE(pipe, num)    ((pipe)->pipe_qos_config &= ~QOS_STAGE_MASK(num))
-#define SH_CSS_QOS_STAGE_IS_ENABLED(pipe, num) ((pipe)->pipe_qos_config & QOS_STAGE_MASK(num))
-#define SH_CSS_QOS_STAGE_IS_ALL_DISABLED(pipe) ((pipe)->pipe_qos_config == QOS_ALL_STAGES_DISABLED)
-#define SH_CSS_QOS_MODE_PIPE_ADD(mode, pipe)    ((mode) |= (0x1 << (pipe)->pipe_id))
-#define SH_CSS_QOS_MODE_PIPE_REMOVE(mode, pipe) ((mode) &= ~(0x1 << (pipe)->pipe_id))
 
 /* Information for a pipeline */
 struct sh_css_sp_pipeline {
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index c301298b8ee4..0dd58a7fe2cc 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -1266,7 +1266,7 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 	sh_css_sp_group.pipe[thread_id].thread_id = thread_id;
 	sh_css_sp_group.pipe[thread_id].pipe_num = pipe_num;
 	sh_css_sp_group.pipe[thread_id].num_execs = me->num_execs;
-	sh_css_sp_group.pipe[thread_id].pipe_qos_config = me->pipe_qos_config;
+	sh_css_sp_group.pipe[thread_id].pipe_qos_config = QOS_INVALID;
 	sh_css_sp_group.pipe[thread_id].required_bds_factor = required_bds_factor;
 	sh_css_sp_group.pipe[thread_id].input_system_mode
 	= (uint32_t)input_mode;
-- 
2.38.1

