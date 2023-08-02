Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31BF876CA16
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 11:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234241AbjHBJ6g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 05:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234142AbjHBJ6Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 05:58:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACCF8213D
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 02:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690970250;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7PxnOzz2KyyWFGq53+eAMhmsuxxPKAl2qfLG8WF2mEU=;
        b=NyTDMfuXIqwC/4XClCMxoe5upzgjfOLKMtiarMG2uxtK8ArGA9HTg7rdKu0gv1MBtc3SnK
        WSJJde9AQRgPw1hXRfRwOcLlkxohHYx0OKd6QFpr7eKzYp1MeM6/vJSk1FSQkICqikcFKw
        iV0OdQCfjTDv17SYsVaRWX3ISPPKTTY=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-687-1x_5qabnNdiJf7J4ykRZSg-1; Wed, 02 Aug 2023 05:57:27 -0400
X-MC-Unique: 1x_5qabnNdiJf7J4ykRZSg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F67D3C13928;
        Wed,  2 Aug 2023 09:57:27 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9D6A9401E63;
        Wed,  2 Aug 2023 09:57:24 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 10/12] media: atomisp: sh_css: Removed #ifdef ISP2401 to make code generic
Date:   Wed,  2 Aug 2023 17:56:04 +0800
Message-ID: <20230802095606.1298152-11-hpa@redhat.com>
In-Reply-To: <20230802095606.1298152-1-hpa@redhat.com>
References: <20230802095606.1298152-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removed #ifdef ISP2401 to allow the destroy function can destroy the
data of both types of ISP.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 72 +++++++++++-----------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 94cb48fa59a2..4048584a056e 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -8450,46 +8450,46 @@ ia_css_stream_destroy(struct ia_css_stream *stream)
 
 	if ((stream->last_pipe) &&
 	    ia_css_pipeline_is_mapped(stream->last_pipe->pipe_num)) {
-#if defined(ISP2401)
-		for (i = 0; i < stream->num_pipes; i++) {
-			struct ia_css_pipe *entry = stream->pipes[i];
-			unsigned int sp_thread_id;
-			struct sh_css_sp_pipeline_terminal *sp_pipeline_input_terminal;
-
-			assert(entry);
-			if (entry) {
-				/* get the SP thread id */
-				if (!ia_css_pipeline_get_sp_thread_id(
-					ia_css_pipe_get_pipe_num(entry), &sp_thread_id))
-					return -EINVAL;
-				/* get the target input terminal */
-				sp_pipeline_input_terminal =
-				&sh_css_sp_group.pipe_io[sp_thread_id].input;
-
-				for (i = 0; i < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; i++) {
-					ia_css_isys_stream_h isys_stream =
-					&sp_pipeline_input_terminal->context.virtual_input_system_stream[i];
-					if (stream->config.isys_config[i].valid && isys_stream->valid)
-						ia_css_isys_stream_destroy(isys_stream);
-				}
-			}
-		}
-		if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
+		if (IS_ISP2401) {
 			for (i = 0; i < stream->num_pipes; i++) {
 				struct ia_css_pipe *entry = stream->pipes[i];
-				/*
-				 * free any mipi frames that are remaining:
-				 * some test stream create-destroy cycles do
-				 * not generate output frames
-				 * and the mipi buffer is not freed in the
-				 * deque function
-				 */
-				if (entry)
-					free_mipi_frames(entry);
+				unsigned int sp_thread_id;
+				struct sh_css_sp_pipeline_terminal *sp_pipeline_input_terminal;
+
+				assert(entry);
+				if (entry) {
+					/* get the SP thread id */
+					if (!ia_css_pipeline_get_sp_thread_id(
+						ia_css_pipe_get_pipe_num(entry), &sp_thread_id))
+						return -EINVAL;
+					/* get the target input terminal */
+					sp_pipeline_input_terminal =
+					&sh_css_sp_group.pipe_io[sp_thread_id].input;
+
+					for (i = 0; i < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; i++) {
+						ia_css_isys_stream_h isys_stream =
+						&sp_pipeline_input_terminal->context.virtual_input_system_stream[i];
+						if (stream->config.isys_config[i].valid && isys_stream->valid)
+							ia_css_isys_stream_destroy(isys_stream);
+					}
+				}
 			}
+			if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
+				for (i = 0; i < stream->num_pipes; i++) {
+					struct ia_css_pipe *entry = stream->pipes[i];
+					/*
+					 * free any mipi frames that are remaining:
+					 * some test stream create-destroy cycles do
+					 * not generate output frames
+					 * and the mipi buffer is not freed in the
+					 * deque function
+					 */
+					if (entry)
+						free_mipi_frames(entry);
+				}
+			}
+			stream_unregister_with_csi_rx(stream);
 		}
-		stream_unregister_with_csi_rx(stream);
-#endif
 
 		for (i = 0; i < stream->num_pipes; i++) {
 			struct ia_css_pipe *curr_pipe = stream->pipes[i];
-- 
2.41.0

