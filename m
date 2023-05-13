Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76A997016AD
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238477AbjEMMd6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238406AbjEMMdv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:33:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A27D63A92
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981152;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dDAdEGhZl31KpOpCLRgNBxJqgfL/YFPj8BUQ7ExtQHI=;
        b=WfcbeTpNae7rUpqdRatNY2wFrOEmrLjNJyOtDKEFO9CvMK+TCaxdW9nJWI+ByhqGne6r7v
        1PUwTUPTGfW86AiutM3Z/Q1xy98ndQkz9ijIoUz5gI9nIS1pdeCyBkRQ/KbokYy4TttoIl
        B0rSE6+81KHRSLOWUxnCINp0yWStQeA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-VI83qs2zO7e7giOB5-JCIw-1; Sat, 13 May 2023 08:32:29 -0400
X-MC-Unique: VI83qs2zO7e7giOB5-JCIw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF0C988B767;
        Sat, 13 May 2023 12:32:28 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 415B740C2076;
        Sat, 13 May 2023 12:32:27 +0000 (UTC)
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
Subject: [PATCH 15/30] media: atomisp: Remove atomisp_sensor_start_stream()
Date:   Sat, 13 May 2023 14:31:44 +0200
Message-Id: <20230513123159.33234-16-hdegoede@redhat.com>
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

Now that we no longer have continuous mode we always want to
start the sensor on the first atomisp_start_streaming() call
and stop it on the first atomisp_stop_streaming() call.

Remove atomisp_sensor_start_stream() which returned the number
of streams which should be active before starting the sensor
and always start/stop the sensor directly.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 36 -------------------
 1 file changed, 36 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index e0a8616ecf05..13e00a2af8e1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1123,20 +1123,6 @@ enum ia_css_pipe_id atomisp_get_css_pipe_id(struct atomisp_sub_device *asd)
 	}
 }
 
-static unsigned int atomisp_sensor_start_stream(struct atomisp_sub_device *asd)
-{
-	if (asd->vfpp->val != ATOMISP_VFPP_ENABLE ||
-	    asd->copy_mode)
-		return 1;
-
-	if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO ||
-	    (asd->run_mode->val == ATOMISP_RUN_MODE_STILL_CAPTURE &&
-	     !atomisp_is_mbuscode_raw(asd->fmt[ATOMISP_SUBDEV_PAD_SOURCE].fmt.code)))
-		return 2;
-	else
-		return 1;
-}
-
 /* Input system HW workaround */
 /* Input system address translation corrupts burst during */
 /* invalidate. SW workaround for this is to set burst length */
@@ -1162,7 +1148,6 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct atomisp_device *isp = asd->isp;
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	enum ia_css_pipe_id css_pipe_id;
-	unsigned int sensor_start_stream;
 	unsigned long irqflags;
 	int ret;
 
@@ -1177,18 +1162,6 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	/* Input system HW workaround */
 	atomisp_dma_burst_len_cfg(asd);
 
-	/*
-	 * The number of streaming video nodes is based on which
-	 * binary is going to be run.
-	 */
-	sensor_start_stream = atomisp_sensor_start_stream(asd);
-
-	if (atomisp_subdev_streaming_count(asd) > sensor_start_stream) {
-		atomisp_qbuffers_to_css(asd);
-		ret = 0;
-		goto out_unlock;
-	}
-
 	if (asd->streaming == ATOMISP_DEVICE_STREAMING_ENABLED) {
 		atomisp_qbuffers_to_css(asd);
 		goto start_sensor;
@@ -1233,12 +1206,6 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	atomisp_qbuffers_to_css(asd);
 
-	/* Only start sensor when the last streaming instance started */
-	if (atomisp_subdev_streaming_count(asd) < sensor_start_stream) {
-		ret = 0;
-		goto out_unlock;
-	}
-
 start_sensor:
 	if (isp->flash) {
 		asd->params.num_flash_frames = 0;
@@ -1340,9 +1307,6 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 
 	atomisp_subdev_cleanup_pending_events(asd);
 stopsensor:
-	if (atomisp_subdev_streaming_count(asd) != atomisp_sensor_start_stream(asd))
-		goto out_unlock;
-
 	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
 			       video, s_stream, 0);
 
-- 
2.40.1

