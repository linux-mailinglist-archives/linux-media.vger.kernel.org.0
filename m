Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DEE97016A4
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238562AbjEMMdv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238330AbjEMMdq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:33:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5AF3A80
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981146;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D0PLS4inY5mViAHrFF7o3+U8upc5II0t6INbwc8vA2o=;
        b=XSvVM5asK31zm8QQ8jb2TB+GF5gtEJOD7cgUCkTkVMnuk6z7CdkLzV95xv/qaMdl7kH8U2
        jImi2YNHjA0xwuHV3xUSp00n1v7LCDSyo6U8hod2KrS0aXAT2ZPkDhqCh/kH/JxeuKjp0f
        mpykYTJuwf3YQ497L9GEnepsaSonVNQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-8e5ADxt2O6W7tucq9d9zUQ-1; Sat, 13 May 2023 08:32:24 -0400
X-MC-Unique: 8e5ADxt2O6W7tucq9d9zUQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8474E185A790;
        Sat, 13 May 2023 12:32:23 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F36F140C2076;
        Sat, 13 May 2023 12:32:21 +0000 (UTC)
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
Subject: [PATCH 12/30] media: atomisp: Remove a bunch of unused atomisp_css_*() functions
Date:   Sat, 13 May 2023 14:31:41 +0200
Message-Id: <20230513123159.33234-13-hdegoede@redhat.com>
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

Remove various unused atomisp_css_*() functions from
atomisp_compat_css20.c.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_compat.h        | 29 ------
 .../media/atomisp/pci/atomisp_compat_css20.c  | 99 -------------------
 2 files changed, 128 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index 168c42956c29..850b354cc160 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -150,10 +150,6 @@ int atomisp_css_set_default_isys_config(struct atomisp_sub_device *asd,
 					enum atomisp_input_stream_id stream_id,
 					struct v4l2_mbus_framefmt *ffmt);
 
-int atomisp_css_isys_two_stream_cfg(struct atomisp_sub_device *asd,
-				    enum atomisp_input_stream_id stream_id,
-				    enum atomisp_input_format input_format);
-
 void atomisp_css_isys_two_stream_cfg_update_stream1(
     struct atomisp_sub_device *asd,
     enum atomisp_input_stream_id stream_id,
@@ -209,15 +205,6 @@ void atomisp_css_capture_enable_online(struct atomisp_sub_device *asd,
 void atomisp_css_preview_enable_online(struct atomisp_sub_device *asd,
 				       unsigned short stream_index, bool enable);
 
-void atomisp_css_video_enable_online(struct atomisp_sub_device *asd,
-				     bool enable);
-
-void atomisp_css_enable_continuous(struct atomisp_sub_device *asd,
-				   bool enable);
-
-void atomisp_css_enable_cvf(struct atomisp_sub_device *asd,
-			    bool enable);
-
 int atomisp_css_input_configure_port(struct atomisp_sub_device *asd,
 				     enum mipi_port_id port,
 				     unsigned int num_lanes,
@@ -243,22 +230,6 @@ int atomisp_css_copy_configure_output(struct atomisp_sub_device *asd,
 				      unsigned int padded_width,
 				      enum ia_css_frame_format format);
 
-int atomisp_css_yuvpp_configure_output(struct atomisp_sub_device *asd,
-				       unsigned int stream_index,
-				       unsigned int width, unsigned int height,
-				       unsigned int padded_width,
-				       enum ia_css_frame_format format);
-
-int atomisp_css_yuvpp_get_output_frame_info(
-    struct atomisp_sub_device *asd,
-    unsigned int stream_index,
-    struct ia_css_frame_info *info);
-
-int atomisp_css_yuvpp_get_viewfinder_frame_info(
-    struct atomisp_sub_device *asd,
-    unsigned int stream_index,
-    struct ia_css_frame_info *info);
-
 int atomisp_css_preview_configure_output(struct atomisp_sub_device *asd,
 	unsigned int width, unsigned int height,
 	unsigned int min_width,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 416cc45bd472..43760fcc0d43 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1611,29 +1611,6 @@ int atomisp_css_set_default_isys_config(struct atomisp_sub_device *asd,
 	return 0;
 }
 
-int atomisp_css_isys_two_stream_cfg(struct atomisp_sub_device *asd,
-				    enum atomisp_input_stream_id stream_id,
-				    enum atomisp_input_format input_format)
-{
-	struct ia_css_stream_config *s_config =
-		    &asd->stream_env[stream_id].stream_config;
-
-	s_config->isys_config[IA_CSS_STREAM_ISYS_STREAM_1].input_res.width =
-	    s_config->isys_config[IA_CSS_STREAM_ISYS_STREAM_0].input_res.width;
-
-	s_config->isys_config[IA_CSS_STREAM_ISYS_STREAM_1].input_res.height =
-	    s_config->isys_config[IA_CSS_STREAM_ISYS_STREAM_0].input_res.height / 2;
-
-	s_config->isys_config[IA_CSS_STREAM_ISYS_STREAM_1].linked_isys_stream_id
-	    = IA_CSS_STREAM_ISYS_STREAM_0;
-	s_config->isys_config[IA_CSS_STREAM_ISYS_STREAM_0].format =
-	    ATOMISP_INPUT_FORMAT_USER_DEF1;
-	s_config->isys_config[IA_CSS_STREAM_ISYS_STREAM_1].format =
-	    ATOMISP_INPUT_FORMAT_USER_DEF2;
-	s_config->isys_config[IA_CSS_STREAM_ISYS_STREAM_1].valid = true;
-	return 0;
-}
-
 void atomisp_css_isys_two_stream_cfg_update_stream1(
     struct atomisp_sub_device *asd,
     enum atomisp_input_stream_id stream_id,
@@ -1819,49 +1796,6 @@ void atomisp_css_preview_enable_online(struct atomisp_sub_device *asd,
 	}
 }
 
-void atomisp_css_video_enable_online(struct atomisp_sub_device *asd,
-				     bool enable)
-{
-	struct atomisp_stream_env *stream_env =
-		    &asd->stream_env[ATOMISP_INPUT_STREAM_VIDEO];
-	int i;
-
-	if (stream_env->stream_config.online != enable) {
-		stream_env->stream_config.online = enable;
-		for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++)
-			stream_env->update_pipe[i] = true;
-	}
-}
-
-void atomisp_css_enable_continuous(struct atomisp_sub_device *asd,
-				   bool enable)
-{
-	struct atomisp_stream_env *stream_env =
-		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL];
-	int i;
-
-	if (stream_env->stream_config.continuous != !!enable) {
-		stream_env->stream_config.continuous = !!enable;
-		stream_env->stream_config.pack_raw_pixels = true;
-		for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++)
-			stream_env->update_pipe[i] = true;
-	}
-}
-
-void atomisp_css_enable_cvf(struct atomisp_sub_device *asd,
-			    bool enable)
-{
-	struct atomisp_stream_env *stream_env =
-		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL];
-	int i;
-
-	if (stream_env->stream_config.disable_cont_viewfinder != !enable) {
-		stream_env->stream_config.disable_cont_viewfinder = !enable;
-		for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++)
-			stream_env->update_pipe[i] = true;
-	}
-}
-
 int atomisp_css_input_configure_port(
     struct atomisp_sub_device *asd,
     enum mipi_port_id port,
@@ -2467,39 +2401,6 @@ int atomisp_css_copy_configure_output(struct atomisp_sub_device *asd,
 	return 0;
 }
 
-int atomisp_css_yuvpp_configure_output(struct atomisp_sub_device *asd,
-				       unsigned int stream_index,
-				       unsigned int width, unsigned int height,
-				       unsigned int padded_width,
-				       enum ia_css_frame_format format)
-{
-	asd->stream_env[stream_index].pipe_configs[IA_CSS_PIPE_ID_YUVPP].
-	default_capture_config.mode =
-	    IA_CSS_CAPTURE_MODE_RAW;
-
-	__configure_output(asd, stream_index, width, height, padded_width,
-			   format, IA_CSS_PIPE_ID_YUVPP);
-	return 0;
-}
-
-int atomisp_css_yuvpp_get_output_frame_info(
-    struct atomisp_sub_device *asd,
-    unsigned int stream_index,
-    struct ia_css_frame_info *info)
-{
-	return __get_frame_info(asd, stream_index, info,
-				ATOMISP_CSS_OUTPUT_FRAME, IA_CSS_PIPE_ID_YUVPP);
-}
-
-int atomisp_css_yuvpp_get_viewfinder_frame_info(
-    struct atomisp_sub_device *asd,
-    unsigned int stream_index,
-    struct ia_css_frame_info *info)
-{
-	return __get_frame_info(asd, stream_index, info,
-				ATOMISP_CSS_VF_FRAME, IA_CSS_PIPE_ID_YUVPP);
-}
-
 int atomisp_css_preview_configure_output(struct atomisp_sub_device *asd,
 	unsigned int width, unsigned int height,
 	unsigned int min_width,
-- 
2.40.1

