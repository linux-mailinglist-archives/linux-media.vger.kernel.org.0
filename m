Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD1BF54D2FB
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347077AbiFOUu7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346894AbiFOUu5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:50:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 793B254FB8
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326255;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AZvhchIKJ3565zsrKt15gawBnXQCikg0FUqrtDVzGzA=;
        b=I8t/upHJTQyeybi0mLvOxVXk8MS73cpt+7zUrWGRiS0cSQTodhGjaBZtSYzgLoSSyKCNLJ
        0FkeErIAvrJbD5Gk0pMN9p+bRS1CQc/Llg/xAoQtGijRm+hh6ghacMQNPmAL6u6zV+6DXd
        NSTihXmV+QZKFkDtAqWsjLf/UdwjQ7s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-eDeksvG-MUCWyyJyCrvtpg-1; Wed, 15 Jun 2022 16:50:53 -0400
X-MC-Unique: eDeksvG-MUCWyyJyCrvtpg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBA06101AA4A;
        Wed, 15 Jun 2022 20:50:52 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4CBBD111F5;
        Wed, 15 Jun 2022 20:50:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 07/40] media: atomisp: drop contiguous flag from struct ia_css_frame
Date:   Wed, 15 Jun 2022 22:50:04 +0200
Message-Id: <20220615205037.16549-8-hdegoede@redhat.com>
In-Reply-To: <20220615205037.16549-1-hdegoede@redhat.com>
References: <20220615205037.16549-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop the contiguous flag from struct ia_css_frame, it is always false /
not used.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/ia_css_frame_public.h     | 1 -
 .../media/atomisp/pci/runtime/debug/src/ia_css_debug.c      | 2 --
 drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c | 6 +-----
 drivers/staging/media/atomisp/pci/sh_css.c                  | 5 -----
 4 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
index 9c4d466ebfb9..8f05af6d4cc9 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
@@ -169,7 +169,6 @@ struct ia_css_frame {
 	/** exposure id, see ia_css_event_public.h for more detail */
 	u32 isp_config_id; /** Unique ID to track which config was actually applied to a particular frame */
 	bool valid; /** First video output frame is not valid */
-	bool contiguous; /** memory is allocated physically contiguously */
 	union {
 		unsigned int	_initialisation_dummy;
 		struct ia_css_frame_plane raw;
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index f46238725eea..3d269bd23207 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -1305,8 +1305,6 @@ void ia_css_debug_frame_print(const struct ia_css_frame *frame,
 	ia_css_debug_dtrace(2, "  padded width  = %d\n",
 			    frame->info.padded_width);
 	ia_css_debug_dtrace(2, "  format        = %d\n", frame->info.format);
-	ia_css_debug_dtrace(2, "  is contiguous = %s\n",
-			    frame->contiguous ? "yes" : "no");
 	switch (frame->info.format) {
 	case IA_CSS_FRAME_FORMAT_NV12:
 	case IA_CSS_FRAME_FORMAT_NV16:
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index cb0b579fbadf..b748b133f01e 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -732,10 +732,7 @@ static int frame_allocate_buffer_data(struct ia_css_frame *frame)
 	IA_CSS_ENTER_LEAVE_PRIVATE("frame->data_bytes=%d\n", frame->data_bytes);
 #endif
 	frame->data = hmm_alloc(frame->data_bytes,
-				HMM_BO_PRIVATE, 0, NULL,
-				frame->contiguous ?
-				ATOMISP_MAP_FLAG_CONTIGUOUS : 0);
-
+				HMM_BO_PRIVATE, 0, NULL, 0);
 	if (frame->data == mmgr_NULL)
 		return -ENOMEM;
 	return 0;
@@ -796,7 +793,6 @@ static struct ia_css_frame *frame_create(unsigned int width,
 	me->info.format = format;
 	me->info.padded_width = padded_width;
 	me->info.raw_bit_depth = raw_bit_depth;
-	me->contiguous = false;
 	me->valid = valid;
 	me->data_bytes = 0;
 	me->data = mmgr_NULL;
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index b3e2a948f3e4..f0015c1e8d80 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -3075,7 +3075,6 @@ init_vf_frameinfo_defaults(struct ia_css_pipe *pipe,
 	assert(vf_frame);
 
 	sh_css_pipe_get_viewfinder_frame_info(pipe, &vf_frame->info, idx);
-	vf_frame->contiguous = false;
 	vf_frame->flash_state = IA_CSS_FRAME_FLASH_STATE_NONE;
 	ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
 	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME + idx, thread_id, &queue_id);
@@ -3257,7 +3256,6 @@ init_in_frameinfo_memory_defaults(struct ia_css_pipe *pipe,
 	in_frame->info.raw_bit_depth =
 	ia_css_pipe_util_pipe_input_format_bpp(pipe);
 	ia_css_frame_info_set_width(&in_frame->info, pipe->stream->config.input_config.input_res.width, 0);
-	in_frame->contiguous = false;
 	in_frame->flash_state = IA_CSS_FRAME_FLASH_STATE_NONE;
 	ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
 	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_INPUT_FRAME, thread_id, &queue_id);
@@ -3285,7 +3283,6 @@ init_out_frameinfo_defaults(struct ia_css_pipe *pipe,
 	assert(out_frame);
 
 	sh_css_pipe_get_output_frame_info(pipe, &out_frame->info, idx);
-	out_frame->contiguous = false;
 	out_frame->flash_state = IA_CSS_FRAME_FLASH_STATE_NONE;
 	ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
 	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_OUTPUT_FRAME + idx, thread_id, &queue_id);
@@ -7176,7 +7173,6 @@ create_host_copy_pipeline(struct ia_css_pipe *pipe,
 	ia_css_pipeline_clean(me);
 
 	/* Construct out_frame info */
-	out_frame->contiguous = false;
 	out_frame->flash_state = IA_CSS_FRAME_FLASH_STATE_NONE;
 
 	if (copy_on_sp(pipe) &&
@@ -7226,7 +7222,6 @@ create_host_isyscopy_capture_pipeline(struct ia_css_pipe *pipe)
 	err = sh_css_pipe_get_output_frame_info(pipe, &out_frame->info, 0);
 	if (err)
 		return err;
-	out_frame->contiguous = false;
 	out_frame->flash_state = IA_CSS_FRAME_FLASH_STATE_NONE;
 	ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
 	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_OUTPUT_FRAME, thread_id, &queue_id);
-- 
2.36.0

