Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D15A86EDD2F
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 09:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbjDYHua (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 03:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233180AbjDYHuW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 03:50:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DDB69F
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 00:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682408977;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5SK1BiWn6pubDk+30Wb1jKHNKZzFMp3YyI/Avt7L1O4=;
        b=iO7IDHbBlhaYcUQrGCptkzaMC/H4tkKNu1Wu0hWfdgGZgQ53mxXKQTByA601A9IyGiFxk3
        w4crWhPi1vYqI90CMQ6HuVmzc2cY0p9lWxWhBXQZXlnyFSCX1bYgKpCCgVs5HHOMdeB02A
        W8PJzPtBdXpmIVUWAwiVTD1143Z381w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-vkH1kteIO7-0P51fB31BjA-1; Tue, 25 Apr 2023 03:49:34 -0400
X-MC-Unique: vkH1kteIO7-0P51fB31BjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B03488B7A0;
        Tue, 25 Apr 2023 07:49:34 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.153])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 299BB14171B8;
        Tue, 25 Apr 2023 07:49:30 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 5/5] staging: media: atomisp: sh_css_mipi: Remove #ifdef 2041
Date:   Tue, 25 Apr 2023 15:48:41 +0800
Message-Id: <20230425074841.29063-6-hpa@redhat.com>
In-Reply-To: <20230425074841.29063-1-hpa@redhat.com>
References: <20230425074841.29063-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
 .../staging/media/atomisp/pci/sh_css_mipi.c   | 101 +++++++++---------
 1 file changed, 49 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index bc6e8598a776..9c9d3b27ded4 100644
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
@@ -363,15 +360,15 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 		return -EINVAL;
 	}
 
-#ifdef ISP2401
-	if (pipe->stream->config.online) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-				    "allocate_mipi_frames(%p) exit: no buffers needed for 2401 pipe mode.\n",
-				    pipe);
-		return 0;
+	if (IS_ISP2401) {
+		if (pipe->stream->config.online) {
+			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
+					    "allocate_mipi_frames(%p) exit: no buffers needed for 2401 pipe mode.\n",
+					    pipe);
+			return 0;
+		}
 	}
 
-#endif
 	if (pipe->stream->config.mode != IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "allocate_mipi_frames(%p) exit: no buffers needed for pipe mode.\n",
@@ -386,30 +383,30 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
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
-	if (ref_count_mipi_allocation[port] != 0) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-				    "allocate_mipi_frames(%p) exit: already allocated for this port (port=%d).\n",
-				    pipe, port);
-		return 0;
+	if (IS_ISP2401) {
+		err = calculate_mipi_buff_size(&pipe->stream->config,
+					       &my_css.mipi_frame_size[port]);
+		/*
+		 * 2401 system allows multiple streams to use same physical port. This is not
+		 * true for 2400 system. Currently 2401 uses MIPI buffers as a temporary solution.
+		 * TODO AM: Once that is changed (removed) this code should be removed as well.
+		 * In that case only 2400 related code should remain.
+		 */
+		if (ref_count_mipi_allocation[port] != 0) {
+			ref_count_mipi_allocation[port]++;
+			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
+					    "allocate_mipi_frames(%p) leave: nothing to do, already allocated for this port (port=%d).\n",
+					    pipe, port);
+			return 0;
+		}
+	} else {
+		if (ref_count_mipi_allocation[port] != 0) {
+			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
+					    "allocate_mipi_frames(%p) exit: already allocated for this port (port=%d).\n",
+					    pipe, port);
+			return 0;
+		}
 	}
-#endif
 
 	ref_count_mipi_allocation[port]++;
 
@@ -503,14 +500,14 @@ free_mipi_frames(struct ia_css_pipe *pipe)
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
 
@@ -534,18 +531,18 @@ free_mipi_frames(struct ia_css_pipe *pipe)
 				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 						    "free_mipi_frames(%p) exit (deallocated).\n", pipe);
 			}
-#if defined(ISP2401)
 			else {
-				/* 2401 system allows multiple streams to use same physical port. This is not
-				 * true for 2400 system. Currently 2401 uses MIPI buffers as a temporary solution.
-				 * TODO AM: Once that is changed (removed) this code should be removed as well.
-				 * In that case only 2400 related code should remain.
-				 */
-				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-						    "free_mipi_frames(%p) leave: nothing to do, other streams still use this port (port=%d).\n",
-						    pipe, port);
+				if (IS_ISP2401) {
+					/* 2401 system allows multiple streams to use same physical port. This is not
+					 * true for 2400 system. Currently 2401 uses MIPI buffers as a temporary solution.
+					 * TODO AM: Once that is changed (removed) this code should be removed as well.
+					 * In that case only 2400 related code should remain.
+					 */
+					ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
+							    "free_mipi_frames(%p) leave: nothing to do, other streams still use this port (port=%d).\n",
+							    pipe, port);
+				}
 			}
-#endif
 		}
 	} else { /* pipe ==NULL */
 		/* AM TEMP: free-ing all mipi buffers just like a legacy code. */
-- 
2.39.2

