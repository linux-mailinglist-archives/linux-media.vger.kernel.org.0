Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6F6F735453
	for <lists+linux-media@lfdr.de>; Mon, 19 Jun 2023 12:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbjFSKzL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jun 2023 06:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbjFSKyh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jun 2023 06:54:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E2F1BCD
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 03:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687171943;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=io/9sXqxe9RzFPxEjyc096FBW6Nx8z03uuB9DJOvUSY=;
        b=Lyit0UCiCWKSuygN9spN4D/RF8m4Buj2JTjR6WSVKeE//krh48EPChOCVVDBKAFwp5Xf2d
        S7DpDwxxvN9RBTjdlp8FgeblKQM4+G1CXtHqFUFN9mKwAelJCSyNzjvpXZaso085RXiqqH
        CYHWrSxGS3By777bN4Yrvvu/vBAQOKo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-QJDB2UkIP4a3qKZNhcNTeQ-1; Mon, 19 Jun 2023 06:52:18 -0400
X-MC-Unique: QJDB2UkIP4a3qKZNhcNTeQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DA99801189;
        Mon, 19 Jun 2023 10:52:17 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.97])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CF27E112132C;
        Mon, 19 Jun 2023 10:52:15 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH 2/7] media: atomisp: Remove bogus asd == NULL checks
Date:   Mon, 19 Jun 2023 12:52:07 +0200
Message-Id: <20230619105212.303653-2-hdegoede@redhat.com>
In-Reply-To: <20230619105212.303653-1-hdegoede@redhat.com>
References: <20230619105212.303653-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The asd is a sub-structure of the main driver data struct, so it is
never NULL. Drop the unnecessary NULL checks in a couple of places.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-media/533f6930-434a-45f3-afff-127003fa64c9@moroto.mountain/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 24 -------------------
 .../media/atomisp/pci/atomisp_compat_css20.c  |  3 ---
 2 files changed, 27 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 807e3aa1eb70..cbbf6f728f57 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3001,12 +3001,6 @@ void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe *pipe)
 	bool need_to_enqueue_buffer = false;
 	int i;
 
-	if (!asd) {
-		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, pipe->vdev.name);
-		return;
-	}
-
 	lockdep_assert_held(&asd->isp->mutex);
 
 	/*
@@ -3068,12 +3062,6 @@ int atomisp_set_parameters(struct video_device *vdev,
 	struct atomisp_css_params *css_param = &asd->params.css_param;
 	int ret;
 
-	if (!asd) {
-		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
 	lockdep_assert_held(&asd->isp->mutex);
 
 	if (!asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream) {
@@ -4067,12 +4055,6 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	const struct atomisp_in_fmt_conv *fc = NULL;
 	int ret, i;
 
-	if (!asd) {
-		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
 	isp_sink_crop = atomisp_subdev_get_rect(
 			    &asd->subdev, NULL, V4L2_SUBDEV_FORMAT_ACTIVE,
 			    ATOMISP_SUBDEV_PAD_SINK, V4L2_SEL_TGT_CROP);
@@ -4280,12 +4262,6 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 	    (struct atomisp_input_stream_info *)ffmt->reserved;
 	int ret;
 
-	if (!asd) {
-		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
 	format = atomisp_get_format_bridge(f->pixelformat);
 	if (!format)
 		return -EINVAL;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index b13d1cb4668d..b97ec85aa0ba 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -613,9 +613,6 @@ static void __apply_additional_pipe_config(
 static bool is_pipe_valid_to_current_run_mode(struct atomisp_sub_device *asd,
 	enum ia_css_pipe_id pipe_id)
 {
-	if (!asd)
-		return false;
-
 	if (pipe_id == IA_CSS_PIPE_ID_YUVPP)
 		return true;
 
-- 
2.40.1

