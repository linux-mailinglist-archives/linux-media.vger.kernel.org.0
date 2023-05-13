Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F58D701697
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237639AbjEMMc4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjEMMcz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:32:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DADF1BF2
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981131;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oH0GAqqmVpNU4oIRWmkkVKyuUl5Lvi3T95PMgNYG9CU=;
        b=Br2pnLvYvDqsJJvfIjtQIAKMzpLYI2QZn7b/ADfPt90uSyNbnMGeaiSKRGbhn/j7fpQd4m
        W5NmUN1E+jjwbl9hR30V1RKusXzq8dlS9L7p7VTIIxQetw6cuxuwZ3DrgamZRwYxiIMD8+
        PM1Sq9kqGimoKz8hHwaAJFqQ/8zGHfQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-onVfNsQ0NT-5ZDPHu7ghFA-1; Sat, 13 May 2023 08:32:09 -0400
X-MC-Unique: onVfNsQ0NT-5ZDPHu7ghFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E5E388B767;
        Sat, 13 May 2023 12:32:09 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BA1C540C2077;
        Sat, 13 May 2023 12:32:07 +0000 (UTC)
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
Subject: [PATCH 04/30] media: atomisp: Drop atomisp_get_css_buf_type()
Date:   Sat, 13 May 2023 14:31:33 +0200
Message-Id: <20230513123159.33234-5-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
References: <20230513123159.33234-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since continuous mode has been removed, there no longer is the option for
separate capture output + viewfinder output streams at the same time.

So all buffers queued by userspace are now for the normal output stream,
remove atomisp_get_css_buf_type() and always use
IA_CSS_BUFFER_TYPE_OUTPUT_FRAME for buffers queued by userspace.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_fops.c  | 29 +------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index a95c41d084c2..143ab78b003b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -342,24 +342,10 @@ static int atomisp_q_video_buffers_to_css(struct atomisp_sub_device *asd,
 	return 0;
 }
 
-static int atomisp_get_css_buf_type(struct atomisp_sub_device *asd,
-				    enum ia_css_pipe_id pipe_id,
-				    uint16_t source_pad)
-{
-	if (pipe_id == IA_CSS_PIPE_ID_COPY ||
-	    source_pad == ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE ||
-	    source_pad == ATOMISP_SUBDEV_PAD_SOURCE_VIDEO ||
-	    (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW &&
-	     asd->run_mode->val != ATOMISP_RUN_MODE_VIDEO))
-		return IA_CSS_BUFFER_TYPE_OUTPUT_FRAME;
-	else
-		return IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME;
-}
-
 /* queue all available buffers to css */
 int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 {
-	enum ia_css_buffer_type buf_type;
+	const enum ia_css_buffer_type buf_type = IA_CSS_BUFFER_TYPE_OUTPUT_FRAME;
 	enum ia_css_pipe_id css_capture_pipe_id = IA_CSS_PIPE_ID_NUM;
 	enum ia_css_pipe_id css_preview_pipe_id = IA_CSS_PIPE_ID_NUM;
 	enum ia_css_pipe_id css_video_pipe_id = IA_CSS_PIPE_ID_NUM;
@@ -400,9 +386,6 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 	}
 
 	if (capture_pipe) {
-		buf_type = atomisp_get_css_buf_type(
-			       asd, css_capture_pipe_id,
-			       atomisp_subdev_source_pad(&capture_pipe->vdev));
 		input_stream_id = ATOMISP_INPUT_STREAM_GENERAL;
 
 		atomisp_q_video_buffers_to_css(asd, capture_pipe,
@@ -411,9 +394,6 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 	}
 
 	if (vf_pipe) {
-		buf_type = atomisp_get_css_buf_type(
-			       asd, css_capture_pipe_id,
-			       atomisp_subdev_source_pad(&vf_pipe->vdev));
 		if (asd->stream_env[ATOMISP_INPUT_STREAM_POSTVIEW].stream)
 			input_stream_id = ATOMISP_INPUT_STREAM_POSTVIEW;
 		else
@@ -425,10 +405,6 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 	}
 
 	if (preview_pipe) {
-		buf_type = atomisp_get_css_buf_type(
-			       asd, css_preview_pipe_id,
-			       atomisp_subdev_source_pad(&preview_pipe->vdev));
-
 		if (css_preview_pipe_id == IA_CSS_PIPE_ID_YUVPP)
 			input_stream_id = ATOMISP_INPUT_STREAM_VIDEO;
 		else if (asd->stream_env[ATOMISP_INPUT_STREAM_PREVIEW].stream)
@@ -442,9 +418,6 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 	}
 
 	if (video_pipe) {
-		buf_type = atomisp_get_css_buf_type(
-			       asd, css_video_pipe_id,
-			       atomisp_subdev_source_pad(&video_pipe->vdev));
 		if (asd->stream_env[ATOMISP_INPUT_STREAM_VIDEO].stream)
 			input_stream_id = ATOMISP_INPUT_STREAM_VIDEO;
 		else
-- 
2.40.1

