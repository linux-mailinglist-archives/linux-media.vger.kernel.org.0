Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 234CD6F9FDE
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 08:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbjEHG2g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 02:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232761AbjEHG2e (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 02:28:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E6019932
        for <linux-media@vger.kernel.org>; Sun,  7 May 2023 23:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683527242;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0RLwYDbrwRWpe99eomy19bkqFJRSugDJBBANf0hGU6A=;
        b=d2d+H2EjOEBmFKEkdG3grFf/aNbTisxIIukEMHDq3uiN+fCIJIkIyIV6jodfoZcLMqKkID
        9b9j5wgfNsjIowdiHmYnwoQr0KgMzWTGcuJxQu3eaYjuGsLvux++kFiasJc/XtyOr8ss4+
        uALvQazwXNK+1xhIREvaEYcayZH/wnI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-7R1uH66CPkKL4VzX-f7xXg-1; Mon, 08 May 2023 02:27:19 -0400
X-MC-Unique: 7R1uH66CPkKL4VzX-f7xXg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D850101A531;
        Mon,  8 May 2023 06:27:19 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.158])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5F692492C13;
        Mon,  8 May 2023 06:27:16 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2 5/5] staging: media: atomisp: sh_css_mipi: Remove #ifdef 2041
Date:   Mon,  8 May 2023 14:26:32 +0800
Message-Id: <20230508062632.34537-5-hpa@redhat.com>
In-Reply-To: <20230508062632.34537-1-hpa@redhat.com>
References: <20230508062632.34537-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The actions of ISP2401 and 2400 are determined at the runtime.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../staging/media/atomisp/pci/sh_css_mipi.c   | 65 ++++++-------------
 1 file changed, 20 insertions(+), 45 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index bc6e8598a776..52a1ed63e9a5 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -67,13 +67,12 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 	unsigned int mem_words = 0;
 	unsigned int width_padded = width;
 
-#if defined(ISP2401)
 	/* The changes will be reverted as soon as RAW
 	 * Buffers are deployed by the 2401 Input System
 	 * in the non-continuous use scenario.
 	 */
-	width_padded += (2 * ISP_VEC_NELEMS);
-#endif
+	if (IS_ISP2401)
+		width_padded += (2 * ISP_VEC_NELEMS);
 
 	IA_CSS_ENTER("padded_width=%d, height=%d, format=%d, hasSOLandEOL=%d, embedded_data_size_words=%d\n",
 		     width_padded, height, format, hasSOLandEOL, embedded_data_size_words);
@@ -235,7 +234,6 @@ bool mipi_is_free(void)
 	return true;
 }
 
-#if defined(ISP2401)
 /*
  * @brief Calculate the required MIPI buffer sizes.
  * Based on the stream configuration, calculate the
@@ -342,7 +340,6 @@ static int calculate_mipi_buff_size(struct ia_css_stream_config *stream_cfg,
 	IA_CSS_LEAVE_ERR(err);
 	return err;
 }
-#endif
 
 int
 allocate_mipi_frames(struct ia_css_pipe *pipe,
@@ -363,15 +360,13 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 		return -EINVAL;
 	}
 
-#ifdef ISP2401
-	if (pipe->stream->config.online) {
+	if (IS_ISP2401 && pipe->stream->config.online) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "allocate_mipi_frames(%p) exit: no buffers needed for 2401 pipe mode.\n",
 				    pipe);
 		return 0;
 	}
 
-#endif
 	if (pipe->stream->config.mode != IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "allocate_mipi_frames(%p) exit: no buffers needed for pipe mode.\n",
@@ -386,30 +381,22 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 		return -EINVAL;
 	}
 
-#ifdef ISP2401
-	err = calculate_mipi_buff_size(&pipe->stream->config,
-				       &my_css.mipi_frame_size[port]);
-	/*
-	 * 2401 system allows multiple streams to use same physical port. This is not
-	 * true for 2400 system. Currently 2401 uses MIPI buffers as a temporary solution.
-	 * TODO AM: Once that is changed (removed) this code should be removed as well.
-	 * In that case only 2400 related code should remain.
-	 */
-	if (ref_count_mipi_allocation[port] != 0) {
-		ref_count_mipi_allocation[port]++;
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-				    "allocate_mipi_frames(%p) leave: nothing to do, already allocated for this port (port=%d).\n",
-				    pipe, port);
-		return 0;
-	}
-#else
 	if (ref_count_mipi_allocation[port] != 0) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "allocate_mipi_frames(%p) exit: already allocated for this port (port=%d).\n",
 				    pipe, port);
 		return 0;
+	} else {
+		/*
+		 * 2401 system allows multiple streams to use same physical port. This is not
+		 * true for 2400 system. Currently 2401 uses MIPI buffers as a temporary solution.
+		 * TODO AM: Once that is changed (removed) this code should be removed as well.
+		 * In that case only 2400 related code should remain.
+		 */
+		if (IS_ISP2401)
+			err = calculate_mipi_buff_size(&pipe->stream->config,
+						       &my_css.mipi_frame_size[port]);
 	}
-#endif
 
 	ref_count_mipi_allocation[port]++;
 
@@ -503,14 +490,14 @@ free_mipi_frames(struct ia_css_pipe *pipe)
 		}
 
 		if (ref_count_mipi_allocation[port] > 0) {
-#if !defined(ISP2401)
-			assert(ref_count_mipi_allocation[port] == 1);
-			if (ref_count_mipi_allocation[port] != 1) {
-				IA_CSS_ERROR("free_mipi_frames(%p) exit: wrong ref_count (ref_count=%d).",
-					     pipe, ref_count_mipi_allocation[port]);
-				return err;
+			if (!IS_ISP2401) {
+				assert(ref_count_mipi_allocation[port] == 1);
+				if (ref_count_mipi_allocation[port] != 1) {
+					IA_CSS_ERROR("free_mipi_frames(%p) exit: wrong ref_count (ref_count=%d).",
+						     pipe, ref_count_mipi_allocation[port]);
+					return err;
+				}
 			}
-#endif
 
 			ref_count_mipi_allocation[port]--;
 
@@ -534,18 +521,6 @@ free_mipi_frames(struct ia_css_pipe *pipe)
 				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 						    "free_mipi_frames(%p) exit (deallocated).\n", pipe);
 			}
-#if defined(ISP2401)
-			else {
-				/* 2401 system allows multiple streams to use same physical port. This is not
-				 * true for 2400 system. Currently 2401 uses MIPI buffers as a temporary solution.
-				 * TODO AM: Once that is changed (removed) this code should be removed as well.
-				 * In that case only 2400 related code should remain.
-				 */
-				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-						    "free_mipi_frames(%p) leave: nothing to do, other streams still use this port (port=%d).\n",
-						    pipe, port);
-			}
-#endif
 		}
 	} else { /* pipe ==NULL */
 		/* AM TEMP: free-ing all mipi buffers just like a legacy code. */
-- 
2.40.1

