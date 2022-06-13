Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A733549FC3
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242073AbiFMUpe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242261AbiFMUob (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:44:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E020063D4
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149941;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nb84qxbT4JY4JWbv3qIvVrZCftuKj6Rr7upszowN2Hs=;
        b=jCmnyTIJ+TukW+6tSo8/OCzLycjp4HDMPI2X8Ft4Y7BdbJKbNMumeYiOeI33jbEJPUjV9L
        Nkp6wm+CPzLiC4/S8Wj2hS2KgR4lUnVvS4j+tzSGzE3Q6jpU8vxWCNNmE1mt7aSDfa/PZg
        ZO7iGvNiENFFK8aWSpcxWm6Q1qhscDY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-FP4D0FDoO7uD5UnInWl43g-1; Mon, 13 Jun 2022 15:52:16 -0400
X-MC-Unique: FP4D0FDoO7uD5UnInWl43g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 745AD185A7A4;
        Mon, 13 Jun 2022 19:52:15 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F11132166B26;
        Mon, 13 Jun 2022 19:52:13 +0000 (UTC)
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
Subject: [PATCH 20/40] media: atomisp: remove unused atomisp_*css_* functions
Date:   Mon, 13 Jun 2022 21:51:17 +0200
Message-Id: <20220613195137.8117-21-hdegoede@redhat.com>
In-Reply-To: <20220613195137.8117-1-hdegoede@redhat.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the removal of the ACC ioctls and atomisp_acc.c a whole bunch
of atomisp_*css_* functions is no longer used, remove them.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_compat.h        |  25 --
 .../media/atomisp/pci/atomisp_compat_css20.c  | 217 ------------------
 .../media/atomisp/pci/atomisp_subdev.h        |   1 -
 3 files changed, 243 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index 64c1bf0943e6..07569f47498d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -442,33 +442,8 @@ int atomisp_css_get_dis_stat(struct atomisp_sub_device *asd,
 
 int atomisp_css_update_stream(struct atomisp_sub_device *asd);
 
-int atomisp_css_create_acc_pipe(struct atomisp_sub_device *asd);
-
-int atomisp_css_start_acc_pipe(struct atomisp_sub_device *asd);
-
-int atomisp_css_stop_acc_pipe(struct atomisp_sub_device *asd);
-
-void atomisp_css_destroy_acc_pipe(struct atomisp_sub_device *asd);
-
-int atomisp_css_load_acc_extension(struct atomisp_sub_device *asd,
-				   struct ia_css_fw_info *fw,
-				   enum ia_css_pipe_id pipe_id,
-				   unsigned int type);
-
-void atomisp_css_unload_acc_extension(struct atomisp_sub_device *asd,
-				      struct ia_css_fw_info *fw,
-				      enum ia_css_pipe_id pipe_id);
-
-int atomisp_css_wait_acc_finish(struct atomisp_sub_device *asd);
-
 void atomisp_css_acc_done(struct atomisp_sub_device *asd);
 
-int atomisp_css_load_acc_binary(struct atomisp_sub_device *asd,
-				struct ia_css_fw_info *fw,
-				unsigned int index);
-
-void atomisp_css_unload_acc_binary(struct atomisp_sub_device *asd);
-
 struct atomisp_acc_fw;
 int atomisp_css_set_acc_parameters(struct atomisp_acc_fw *acc_fw);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 89002df530b3..51b31e6c4811 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -3828,25 +3828,6 @@ void atomisp_css_acc_done(struct atomisp_sub_device *asd)
 	complete(&asd->acc.acc_done);
 }
 
-int atomisp_css_wait_acc_finish(struct atomisp_sub_device *asd)
-{
-	int ret = 0;
-	struct atomisp_device *isp = asd->isp;
-
-	/* Unlock the isp mutex taken in IOCTL handler before sleeping! */
-	rt_mutex_unlock(&isp->mutex);
-	if (wait_for_completion_interruptible_timeout(&asd->acc.acc_done,
-		ATOMISP_ISP_TIMEOUT_DURATION) == 0) {
-		dev_err(isp->dev, "<%s: completion timeout\n", __func__);
-		ia_css_debug_dump_sp_sw_debug_info();
-		ia_css_debug_dump_debug_info(__func__);
-		ret = -EIO;
-	}
-	rt_mutex_lock(&isp->mutex);
-
-	return ret;
-}
-
 /* Set the ACC binary arguments */
 int atomisp_css_set_acc_parameters(struct atomisp_acc_fw *acc_fw)
 {
@@ -3865,204 +3846,6 @@ int atomisp_css_set_acc_parameters(struct atomisp_acc_fw *acc_fw)
 	return 0;
 }
 
-/* Load acc binary extension */
-int atomisp_css_load_acc_extension(struct atomisp_sub_device *asd,
-				   struct ia_css_fw_info *fw,
-				   enum ia_css_pipe_id pipe_id,
-				   unsigned int type)
-{
-	struct ia_css_fw_info **hd;
-
-	fw->next = NULL;
-	hd = &(asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
-	       .pipe_configs[pipe_id].acc_extension);
-	while (*hd)
-		hd = &(*hd)->next;
-	*hd = fw;
-
-	asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
-	.update_pipe[pipe_id] = true;
-	return 0;
-}
-
-/* Unload acc binary extension */
-void atomisp_css_unload_acc_extension(struct atomisp_sub_device *asd,
-				      struct ia_css_fw_info *fw,
-				      enum ia_css_pipe_id pipe_id)
-{
-	struct ia_css_fw_info **hd;
-
-	hd = &(asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
-	       .pipe_configs[pipe_id].acc_extension);
-	while (*hd && *hd != fw)
-		hd = &(*hd)->next;
-	if (!*hd) {
-		dev_err(asd->isp->dev, "did not find acc fw for removal\n");
-		return;
-	}
-	*hd = fw->next;
-	fw->next = NULL;
-
-	asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
-	.update_pipe[pipe_id] = true;
-}
-
-int atomisp_css_create_acc_pipe(struct atomisp_sub_device *asd)
-{
-	struct atomisp_device *isp = asd->isp;
-	struct ia_css_pipe_config *pipe_config;
-	struct atomisp_stream_env *stream_env =
-		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL];
-
-	if (stream_env->acc_stream) {
-		if (stream_env->acc_stream_state == CSS_STREAM_STARTED) {
-			if (ia_css_stream_stop(stream_env->acc_stream)
-			    != 0) {
-				dev_err(isp->dev, "stop acc_stream failed.\n");
-				return -EBUSY;
-			}
-		}
-
-		if (ia_css_stream_destroy(stream_env->acc_stream)
-		    != 0) {
-			dev_err(isp->dev, "destroy acc_stream failed.\n");
-			return -EBUSY;
-		}
-		stream_env->acc_stream = NULL;
-	}
-
-	pipe_config = &stream_env->pipe_configs[IA_CSS_PIPE_ID_ACC];
-	ia_css_pipe_config_defaults(pipe_config);
-	asd->acc.acc_stages = kzalloc(MAX_ACC_STAGES *
-				      sizeof(void *), GFP_KERNEL);
-	if (!asd->acc.acc_stages)
-		return -ENOMEM;
-	pipe_config->acc_stages = asd->acc.acc_stages;
-	pipe_config->mode = IA_CSS_PIPE_MODE_ACC;
-	pipe_config->num_acc_stages = 0;
-
-	/*
-	 * We delay the ACC pipeline creation to atomisp_css_start_acc_pipe,
-	 * because pipe configuration will soon be changed by
-	 * atomisp_css_load_acc_binary()
-	 */
-	return 0;
-}
-
-int atomisp_css_start_acc_pipe(struct atomisp_sub_device *asd)
-{
-	struct atomisp_device *isp = asd->isp;
-	struct atomisp_stream_env *stream_env =
-		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL];
-	struct ia_css_pipe_config *pipe_config =
-		    &stream_env->pipe_configs[IA_CSS_PIPE_ID_ACC];
-
-	if (ia_css_pipe_create(pipe_config,
-			       &stream_env->pipes[IA_CSS_PIPE_ID_ACC]) != 0) {
-		dev_err(isp->dev, "%s: ia_css_pipe_create failed\n",
-			__func__);
-		return -EBADE;
-	}
-
-	memset(&stream_env->acc_stream_config, 0,
-	       sizeof(struct ia_css_stream_config));
-	if (ia_css_stream_create(&stream_env->acc_stream_config, 1,
-				 &stream_env->pipes[IA_CSS_PIPE_ID_ACC],
-				 &stream_env->acc_stream) != 0) {
-		dev_err(isp->dev, "%s: create acc_stream error.\n", __func__);
-		return -EINVAL;
-	}
-	stream_env->acc_stream_state = CSS_STREAM_CREATED;
-
-	init_completion(&asd->acc.acc_done);
-	asd->acc.pipeline = stream_env->pipes[IA_CSS_PIPE_ID_ACC];
-
-	atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_MAX, false);
-
-	if (ia_css_start_sp()) {
-		dev_err(isp->dev, "start sp error.\n");
-		return -EIO;
-	}
-
-	if (ia_css_stream_start(stream_env->acc_stream)
-	    != 0) {
-		dev_err(isp->dev, "acc_stream start error.\n");
-		return -EIO;
-	}
-
-	stream_env->acc_stream_state = CSS_STREAM_STARTED;
-	return 0;
-}
-
-int atomisp_css_stop_acc_pipe(struct atomisp_sub_device *asd)
-{
-	struct atomisp_stream_env *stream_env =
-		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL];
-	if (stream_env->acc_stream_state == CSS_STREAM_STARTED) {
-		ia_css_stream_stop(stream_env->acc_stream);
-		stream_env->acc_stream_state = CSS_STREAM_STOPPED;
-	}
-	return 0;
-}
-
-void atomisp_css_destroy_acc_pipe(struct atomisp_sub_device *asd)
-{
-	struct atomisp_stream_env *stream_env =
-		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL];
-	if (stream_env->acc_stream) {
-		if (ia_css_stream_destroy(stream_env->acc_stream)
-		    != 0)
-			dev_warn(asd->isp->dev,
-				 "destroy acc_stream failed.\n");
-		stream_env->acc_stream = NULL;
-	}
-
-	if (stream_env->pipes[IA_CSS_PIPE_ID_ACC]) {
-		if (ia_css_pipe_destroy(stream_env->pipes[IA_CSS_PIPE_ID_ACC])
-		    != 0)
-			dev_warn(asd->isp->dev,
-				 "destroy ACC pipe failed.\n");
-		stream_env->pipes[IA_CSS_PIPE_ID_ACC] = NULL;
-		stream_env->update_pipe[IA_CSS_PIPE_ID_ACC] = false;
-		ia_css_pipe_config_defaults(
-		    &stream_env->pipe_configs[IA_CSS_PIPE_ID_ACC]);
-		ia_css_pipe_extra_config_defaults(
-		    &stream_env->pipe_extra_configs[IA_CSS_PIPE_ID_ACC]);
-	}
-	asd->acc.pipeline = NULL;
-
-	/* css 2.0 API limitation: ia_css_stop_sp() could be only called after
-	 * destroy all pipes
-	 */
-	ia_css_stop_sp();
-
-	kfree(asd->acc.acc_stages);
-	asd->acc.acc_stages = NULL;
-
-	atomisp_freq_scaling(asd->isp, ATOMISP_DFS_MODE_LOW, false);
-}
-
-int atomisp_css_load_acc_binary(struct atomisp_sub_device *asd,
-				struct ia_css_fw_info *fw,
-				unsigned int index)
-{
-	struct ia_css_pipe_config *pipe_config =
-		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
-		    .pipe_configs[IA_CSS_PIPE_ID_ACC];
-
-	if (index >= MAX_ACC_STAGES) {
-		dev_dbg(asd->isp->dev, "%s: index(%d) out of range\n",
-			__func__, index);
-		return -ENOMEM;
-	}
-
-	pipe_config->acc_stages[index] = fw;
-	pipe_config->num_acc_stages = index + 1;
-	pipe_config->acc_num_execs = 1;
-
-	return 0;
-}
-
 static struct atomisp_sub_device *__get_atomisp_subdev(
     struct ia_css_pipe *css_pipe,
     struct atomisp_device *isp,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index c2f3ea2c5076..f1e87c3a9dfa 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -325,7 +325,6 @@ struct atomisp_sub_device {
 	struct {
 		struct ia_css_pipe *pipeline;
 		struct completion acc_done;
-		void *acc_stages;
 	} acc;
 
 	struct atomisp_subdev_params params;
-- 
2.36.0

