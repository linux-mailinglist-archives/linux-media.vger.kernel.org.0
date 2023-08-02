Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C492C76CA24
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 11:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234303AbjHBJ6t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 05:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234238AbjHBJ6e (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 05:58:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF70E61
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 02:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690970265;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xyIPIUrDzDot8WwmM04YOR78jSG4kekrYxWwX2cybXQ=;
        b=cXZJzNQnmR7UOZQywpn5g3KkwETqvIfvXlwhXhGnLLg1OQKwYeSSPTy9LquRueffIdlkXo
        CfqG10PNdDk4Bp+g5IaugG11zrQMPE2QoRN5mXtuBsvm+1eqtYUkiCkmaWtct/HdhbKzXa
        k1TWJFnGTRKkrNKDhfmaGV/e1zWjQh0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-_9bQZxNSNi-UIvnG_-n-EQ-1; Wed, 02 Aug 2023 05:57:43 -0400
X-MC-Unique: _9bQZxNSNi-UIvnG_-n-EQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BF3A8007CE;
        Wed,  2 Aug 2023 09:57:43 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4EE68401061;
        Wed,  2 Aug 2023 09:57:28 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 11/12] media: atomisp: sh_css: Removed #ifdef ISP2401 to make the driver generic
Date:   Wed,  2 Aug 2023 17:56:05 +0800
Message-ID: <20230802095606.1298152-12-hpa@redhat.com>
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

Removed #ifdef ISP2401 to make the driver generic.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 42 +++++++++-------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 4048584a056e..91d29ff318f6 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1298,9 +1298,7 @@ sh_css_invalidate_shading_tables(struct ia_css_stream *stream)
 static void
 enable_interrupts(enum ia_css_irq_type irq_type)
 {
-#ifndef ISP2401
 	enum mipi_port_id port;
-#endif
 	bool enable_pulse = irq_type != IA_CSS_IRQ_TYPE_EDGE;
 
 	IA_CSS_ENTER_PRIVATE("");
@@ -1321,10 +1319,10 @@ enable_interrupts(enum ia_css_irq_type irq_type)
 	    (enum virq_id)(IRQ_SW_CHANNEL1_ID + IRQ_SW_CHANNEL_OFFSET),
 	    true);
 
-#ifndef ISP2401
-	for (port = 0; port < N_MIPI_PORT_ID; port++)
-		ia_css_isys_rx_enable_all_interrupts(port);
-#endif
+	if (!IS_ISP2401) {
+		for (port = 0; port < N_MIPI_PORT_ID; port++)
+			ia_css_isys_rx_enable_all_interrupts(port);
+	}
 
 	IA_CSS_LEAVE_PRIVATE("");
 }
@@ -2160,10 +2158,10 @@ ia_css_uninit(void)
 
 	ia_css_rmgr_uninit();
 
-#if !defined(ISP2401)
-	/* needed for reprogramming the inputformatter after power cycle of css */
-	ifmtr_set_if_blocking_mode_reset = true;
-#endif
+	if (!IS_ISP2401) {
+		/* needed for reprogramming the inputformatter after power cycle of css */
+		ifmtr_set_if_blocking_mode_reset = true;
+	}
 
 	if (!fw_explicitly_loaded)
 		ia_css_unload_firmware();
@@ -3117,9 +3115,10 @@ init_in_frameinfo_memory_defaults(struct ia_css_pipe *pipe,
 	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_INPUT_FRAME, thread_id, &queue_id);
 	in_frame->dynamic_queue_id = queue_id;
 	in_frame->buf_type = IA_CSS_BUFFER_TYPE_INPUT_FRAME;
-#ifdef ISP2401
-	ia_css_get_crop_offsets(pipe, &in_frame->frame_info);
-#endif
+
+	if (IS_ISP2401)
+		ia_css_get_crop_offsets(pipe, &in_frame->frame_info);
+
 	err = ia_css_frame_init_planes(in_frame);
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s() bayer_order = %d\n",
@@ -7365,19 +7364,18 @@ static int capture_start(struct ia_css_pipe *pipe)
 
 	start_pipe(pipe, copy_ovrd, pipe->stream->config.mode);
 
-#if !defined(ISP2401)
 	/*
 	 * old isys: for IA_CSS_PIPE_MODE_COPY pipe, isys rx has to be configured,
 	 * which is currently done in start_binary(); but COPY pipe contains no binary,
 	 * and does not call start_binary(); so we need to configure the rx here.
 	 */
-	if (pipe->config.mode == IA_CSS_PIPE_MODE_COPY &&
+	if (!IS_ISP2401 &&
+	    pipe->config.mode == IA_CSS_PIPE_MODE_COPY &&
 	    pipe->stream->reconfigure_css_rx) {
 		ia_css_isys_rx_configure(&pipe->stream->csi_rx_config,
 					 pipe->stream->config.mode);
 		pipe->stream->reconfigure_css_rx = false;
 	}
-#endif
 
 	IA_CSS_LEAVE_ERR_PRIVATE(err);
 	return err;
@@ -7599,11 +7597,8 @@ void ia_css_stream_request_flash(struct ia_css_stream *stream)
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
 			    "ia_css_stream_request_flash() enter: void\n");
 
-#ifndef ISP2401
-	sh_css_write_host2sp_command(host2sp_cmd_start_flash);
-#else
-	if (sh_css_sp_is_running()) {
-		if (!sh_css_write_host2sp_command(host2sp_cmd_start_flash)) {
+	if (!IS_ISP2401 || sh_css_sp_is_running()) {
+		if (!sh_css_write_host2sp_command(host2sp_cmd_start_flash) && IS_ISP2401) {
 			IA_CSS_ERROR("Call to 'sh-css_write_host2sp_command()' failed");
 			ia_css_debug_dump_sp_sw_debug_info();
 		}
@@ -7611,7 +7606,6 @@ void ia_css_stream_request_flash(struct ia_css_stream *stream)
 		IA_CSS_LOG("SP is not running!");
 	}
 
-#endif
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
 			    "ia_css_stream_request_flash() leave: return_void\n");
 }
@@ -8623,16 +8617,14 @@ ia_css_stream_stop(struct ia_css_stream *stream)
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_stop: stopping %d\n",
 			    stream->last_pipe->mode);
 
-#if !defined(ISP2401)
 	/* De-initialize mipi size checks */
-	if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
+	if (!IS_ISP2401 && stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
 		unsigned int idx;
 		unsigned int port = (unsigned int)(stream->config.source.port.port);
 
 		for (idx = 0; idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT; idx++)
 			sh_css_sp_group.config.mipi_sizes_for_check[port][idx] = 0;
 	}
-#endif
 
 	err = ia_css_pipeline_request_stop(&stream->last_pipe->pipeline);
 	if (err)
-- 
2.41.0

