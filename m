Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 795A276CA18
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 11:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234041AbjHBJ6h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 05:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234173AbjHBJ6Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 05:58:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9898D2127
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 02:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690970247;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LvIYfQcFSsBKI5kKXAGvpYymI7R+Qbmf7FupPfL4LJ0=;
        b=PeytiOc4wjjHEYLP6K2SzB+r4Gdf5RLDNBr+hdpmIe1kooAlqSAsb32nmztMGLhO+iSZhH
        881kT5MJQVMUasMyuFGEIVtTFGpdDBI2hRujKqEa5LSL9VQQ/85L4k+yJ4xR3AlMFRn1jz
        MduW7BsqJWtwfDK+c5aNsMfTOSmgs3c=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-A-dxBofpMsu7H-K6-z-d1Q-1; Wed, 02 Aug 2023 05:57:23 -0400
X-MC-Unique: A-dxBofpMsu7H-K6-z-d1Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED631381AE43;
        Wed,  2 Aug 2023 09:57:22 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 27F22401061;
        Wed,  2 Aug 2023 09:57:19 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 09/12] media: atomisp: sh_css: Renamed sh_css_config_input_network()
Date:   Wed,  2 Aug 2023 17:56:03 +0800
Message-ID: <20230802095606.1298152-10-hpa@redhat.com>
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

sh_css_config_input_network() is renamed to
sh_css_config_input_network_2400() and sh_css_config_input_network_2401()
since a generic driver should cover the implementation for both types.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 52 +++++++++-------------
 1 file changed, 21 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index e2e608d4c8a5..94cb48fa59a2 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -467,9 +467,8 @@ ia_css_stream_input_format_bits_per_pixel(struct ia_css_stream *stream)
 /* TODO: move define to proper file in tools */
 #define GP_ISEL_TPG_MODE 0x90058
 
-#if !defined(ISP2401)
 static int
-sh_css_config_input_network(struct ia_css_stream *stream)
+sh_css_config_input_network_2400(struct ia_css_stream *stream)
 {
 	unsigned int fmt_type;
 	struct ia_css_pipe *pipe = stream->last_pipe;
@@ -523,7 +522,7 @@ sh_css_config_input_network(struct ia_css_stream *stream)
 			    "sh_css_config_input_network() leave:\n");
 	return 0;
 }
-#elif defined(ISP2401)
+
 static unsigned int csi2_protocol_calculate_max_subpixels_per_line(
     enum atomisp_input_format	format,
     unsigned int			pixels_per_line)
@@ -819,9 +818,10 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_attr(
 		    stream_cfg->source.port.num_lanes;
 		isys_stream_descr->csi_port_attr.fmt_type = fmt_type;
 		isys_stream_descr->csi_port_attr.ch_id = stream_cfg->channel_id;
-#ifdef ISP2401
-		isys_stream_descr->online = stream_cfg->online;
-#endif
+
+		if (IS_ISP2401)
+			isys_stream_descr->online = stream_cfg->online;
+
 		err |= ia_css_isys_convert_compressed_format(
 			   &stream_cfg->source.port.compression,
 			   isys_stream_descr);
@@ -844,15 +844,15 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_attr(
 			    stream_cfg->metadata_config.resolution.width;
 			isys_stream_descr->metadata.lines_per_frame =
 			    stream_cfg->metadata_config.resolution.height;
-#ifdef ISP2401
+
 			/*
 			 * For new input system, number of str2mmio requests must be even.
 			 * So we round up number of metadata lines to be even.
 			 */
-			if (isys_stream_descr->metadata.lines_per_frame > 0)
+			if (IS_ISP2401 && isys_stream_descr->metadata.lines_per_frame > 0)
 				isys_stream_descr->metadata.lines_per_frame +=
 				    (isys_stream_descr->metadata.lines_per_frame & 1);
-#endif
+
 			isys_stream_descr->metadata.align_req_in_bytes =
 			    ia_css_csi2_calculate_input_system_alignment(
 				stream_cfg->metadata_config.data_type);
@@ -967,7 +967,7 @@ static bool sh_css_translate_binary_info_to_input_system_output_port_attr(
 }
 
 static int
-sh_css_config_input_network(struct ia_css_stream *stream)
+sh_css_config_input_network_2401(struct ia_css_stream *stream)
 {
 	bool					rc;
 	ia_css_isys_descr_t			isys_stream_descr;
@@ -1176,7 +1176,6 @@ static inline int stream_unregister_with_csi_rx(
 {
 	return stream_csi_rx_helper(stream, ia_css_isys_csi_rx_unregister_stream);
 }
-#endif
 
 
 static void
@@ -1189,14 +1188,11 @@ start_binary(struct ia_css_pipe *pipe,
 	if (binary)
 		sh_css_metrics_start_binary(&binary->metrics);
 
-
-#if !defined(ISP2401)
-	if (pipe->stream->reconfigure_css_rx) {
+	if (!IS_ISP2401 && pipe->stream->reconfigure_css_rx) {
 		ia_css_isys_rx_configure(&pipe->stream->csi_rx_config,
 					 pipe->stream->config.mode);
 		pipe->stream->reconfigure_css_rx = false;
 	}
-#endif
 }
 
 /* start the copy function on the SP */
@@ -1209,22 +1205,18 @@ start_copy_on_sp(struct ia_css_pipe *pipe,
 	if ((!pipe) || (!pipe->stream))
 		return -EINVAL;
 
-#if !defined(ISP2401)
-	if (pipe->stream->reconfigure_css_rx)
+	if (!IS_ISP2401 && pipe->stream->reconfigure_css_rx)
 		ia_css_isys_rx_disable();
-#endif
 
 	if (pipe->stream->config.input_config.format != ATOMISP_INPUT_FORMAT_BINARY_8)
 		return -EINVAL;
 	sh_css_sp_start_binary_copy(ia_css_pipe_get_pipe_num(pipe), out_frame, pipe->stream->config.pixels_per_clock == 2);
 
-#if !defined(ISP2401)
-	if (pipe->stream->reconfigure_css_rx) {
+	if (!IS_ISP2401 && pipe->stream->reconfigure_css_rx) {
 		ia_css_isys_rx_configure(&pipe->stream->csi_rx_config,
 					 pipe->stream->config.mode);
 		pipe->stream->reconfigure_css_rx = false;
 	}
-#endif
 
 	return 0;
 }
@@ -4466,7 +4458,6 @@ ia_css_stream_get_buffer_depth(struct ia_css_stream *stream,
 	return 0;
 }
 
-#if !defined(ISP2401)
 unsigned int
 sh_css_get_mipi_sizes_for_check(const unsigned int port, const unsigned int idx)
 {
@@ -4477,7 +4468,6 @@ sh_css_get_mipi_sizes_for_check(const unsigned int port, const unsigned int idx)
 			    port, idx, my_css.mipi_sizes_for_check[port][idx]);
 	return my_css.mipi_sizes_for_check[port][idx];
 }
-#endif
 
 static int sh_css_pipe_configure_output(
     struct ia_css_pipe *pipe,
@@ -8592,15 +8582,13 @@ ia_css_stream_start(struct ia_css_stream *stream)
 		return err;
 	}
 
-#if defined(ISP2401)
-	if ((stream->config.mode == IA_CSS_INPUT_MODE_SENSOR) ||
-	    (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR))
+	if (IS_ISP2401 &&
+	    ((stream->config.mode == IA_CSS_INPUT_MODE_SENSOR) ||
+	     (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)))
 		stream_register_with_csi_rx(stream);
-#endif
 
-#if !defined(ISP2401)
 	/* Initialize mipi size checks */
-	if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
+	if (!IS_ISP2401 && stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
 		unsigned int idx;
 		unsigned int port = (unsigned int)(stream->config.source.port.port);
 
@@ -8609,10 +8597,12 @@ ia_css_stream_start(struct ia_css_stream *stream)
 			sh_css_get_mipi_sizes_for_check(port, idx);
 		}
 	}
-#endif
 
 	if (stream->config.mode != IA_CSS_INPUT_MODE_MEMORY) {
-		err = sh_css_config_input_network(stream);
+		if (IS_ISP2401)
+			err = sh_css_config_input_network_2401(stream);
+		else
+			err = sh_css_config_input_network_2400(stream);
 		if (err)
 			return err;
 	}
-- 
2.41.0

