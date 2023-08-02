Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C94D276C9FF
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 11:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233665AbjHBJ6N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 05:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbjHBJ6L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 05:58:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C8C9212B
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 02:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690970241;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k9qSic862Nk3tMDWqLsyed75V+JXQ5nY3jYute7snIk=;
        b=Iae+4dPhybJCUwPtJBlejyoW/j6CMfnzEnN86pEwzv7CrEi9Ug79vKCXJrkLaJ1m+XjOi+
        KvxkZXFUwcgTjFVSX+cxSSFXzyaocTCGrstQSPfYHXeR+t3pkkMGA5yJ0LfsD3bCNPOYGG
        gjb1GuhhzfwxHMCFdmb5vg+ecPxpAhU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-688-JLrzmYuaPsqgmWNpYMlM6w-1; Wed, 02 Aug 2023 05:57:18 -0400
X-MC-Unique: JLrzmYuaPsqgmWNpYMlM6w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40CDA830DB4;
        Wed,  2 Aug 2023 09:57:18 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 44F57401DA9;
        Wed,  2 Aug 2023 09:57:14 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 08/12] media: atomisp: sh_css: Removed #ifdef ISP2401 to make driver generic
Date:   Wed,  2 Aug 2023 17:56:02 +0800
Message-ID: <20230802095606.1298152-9-hpa@redhat.com>
In-Reply-To: <20230802095606.1298152-1-hpa@redhat.com>
References: <20230802095606.1298152-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removed #ifdef ISP2401 to expose ia_css_stream_configure_rx() for ISP2400.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 54 +++++++++-------------
 1 file changed, 22 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 8b5fb3703d59..e2e608d4c8a5 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -56,9 +56,7 @@
 #include "assert_support.h"
 #include "math_support.h"
 #include "sw_event_global.h"			/* Event IDs.*/
-#if !defined(ISP2401)
 #include "ia_css_ifmtr.h"
-#endif
 #include "input_system.h"
 #include "mmu_device.h"		/* mmu_set_page_table_base_index(), ... */
 #include "ia_css_mmu_private.h" /* sh_css_mmu_set_page_table_base_index() */
@@ -345,7 +343,6 @@ static struct sh_css_hmm_buffer_record
 *sh_css_hmm_buffer_record_validate(ia_css_ptr ddr_buffer_addr,
 				   enum ia_css_buffer_type type);
 
-#ifdef ISP2401
 static unsigned int get_crop_lines_for_bayer_order(const struct
 	ia_css_stream_config *config);
 static unsigned int get_crop_columns_for_bayer_order(const struct
@@ -353,8 +350,6 @@ static unsigned int get_crop_columns_for_bayer_order(const struct
 static void get_pipe_extra_pixel(struct ia_css_pipe *pipe,
 				 unsigned int *extra_row, unsigned int *extra_column);
 
-#endif
-
 static void
 sh_css_pipe_free_shading_table(struct ia_css_pipe *pipe)
 {
@@ -7971,7 +7966,6 @@ ia_css_pipe_override_frame_format(struct ia_css_pipe *pipe,
 	return err;
 }
 
-#if !defined(ISP2401)
 /* Configuration of INPUT_SYSTEM_VERSION_2401 is done on SP */
 static int
 ia_css_stream_configure_rx(struct ia_css_stream *stream)
@@ -8014,7 +8008,6 @@ ia_css_stream_configure_rx(struct ia_css_stream *stream)
 	stream->reconfigure_css_rx = true;
 	return 0;
 }
-#endif
 
 static struct ia_css_pipe *
 find_pipe(struct ia_css_pipe *pipes[], unsigned int num_pipes,
@@ -8100,9 +8093,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 
 	/* check if mipi size specified */
 	if (stream_config->mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
-#ifdef ISP2401
-		if (!stream_config->online)
-#endif
+		if (!IS_ISP2401 || (IS_ISP2401 && !stream_config->online))
 		{
 			unsigned int port = (unsigned int)stream_config->source.port.port;
 
@@ -8203,32 +8194,31 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	switch (curr_stream->config.mode) {
 	case IA_CSS_INPUT_MODE_SENSOR:
 	case IA_CSS_INPUT_MODE_BUFFERED_SENSOR:
-#if !defined(ISP2401)
-		ia_css_stream_configure_rx(curr_stream);
-#endif
+		if (!IS_ISP2401)
+			ia_css_stream_configure_rx(curr_stream);
 		break;
 	case IA_CSS_INPUT_MODE_TPG:
-#if !defined(ISP2401)
-		IA_CSS_LOG("tpg_configuration: x_mask=%d, y_mask=%d, x_delta=%d, y_delta=%d, xy_mask=%d",
-			   curr_stream->config.source.tpg.x_mask,
-			   curr_stream->config.source.tpg.y_mask,
-			   curr_stream->config.source.tpg.x_delta,
-			   curr_stream->config.source.tpg.y_delta,
-			   curr_stream->config.source.tpg.xy_mask);
-
-		sh_css_sp_configure_tpg(
-		    curr_stream->config.source.tpg.x_mask,
-		    curr_stream->config.source.tpg.y_mask,
-		    curr_stream->config.source.tpg.x_delta,
-		    curr_stream->config.source.tpg.y_delta,
-		    curr_stream->config.source.tpg.xy_mask);
-#endif
+		if (!IS_ISP2401) {
+			IA_CSS_LOG("tpg_configuration: x_mask=%d, y_mask=%d, x_delta=%d, y_delta=%d, xy_mask=%d",
+				   curr_stream->config.source.tpg.x_mask,
+				   curr_stream->config.source.tpg.y_mask,
+				   curr_stream->config.source.tpg.x_delta,
+				   curr_stream->config.source.tpg.y_delta,
+				   curr_stream->config.source.tpg.xy_mask);
+
+			sh_css_sp_configure_tpg(
+			    curr_stream->config.source.tpg.x_mask,
+			    curr_stream->config.source.tpg.y_mask,
+			    curr_stream->config.source.tpg.x_delta,
+			    curr_stream->config.source.tpg.y_delta,
+			    curr_stream->config.source.tpg.xy_mask);
+		}
 		break;
 	case IA_CSS_INPUT_MODE_PRBS:
-#if !defined(ISP2401)
-		IA_CSS_LOG("mode prbs");
-		sh_css_sp_configure_prbs(curr_stream->config.source.prbs.seed);
-#endif
+		if (!IS_ISP2401) {
+			IA_CSS_LOG("mode prbs");
+			sh_css_sp_configure_prbs(curr_stream->config.source.prbs.seed);
+		}
 		break;
 	case IA_CSS_INPUT_MODE_MEMORY:
 		IA_CSS_LOG("mode memory");
-- 
2.41.0

