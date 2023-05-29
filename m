Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8A32714803
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 12:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbjE2Kjj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 06:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbjE2Kjg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 06:39:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC9DE4
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 03:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685356737;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AyrKR2bF7qX9KYjmk92LCz+SJSxGMFiOnzohNHtHCIg=;
        b=P5Rg+kkY/0BVbrj/uRw8yPEe8SfdVPkLgR3RwPXbk8dq2vCvB6YdLwVDzWqUnXTh0gUM6g
        1vr6Mtq8+eQqn2KYzLAFvV7eebrLIyFVZc9rnpiZD9WHMt4IaZamfL3UrB61/eBkMcy03Z
        UyecnbpiW/wlKalV6j/YMRb8/CFeXQ4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-AaG0gBf3Pn6xNH1ARTYaVg-1; Mon, 29 May 2023 06:38:53 -0400
X-MC-Unique: AaG0gBf3Pn6xNH1ARTYaVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 378DC101A52C;
        Mon, 29 May 2023 10:38:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9F9BB2166B2B;
        Mon, 29 May 2023 10:38:51 +0000 (UTC)
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
Subject: [PATCH 17/21] media: atomisp: Make atomisp_init_sensor() check if the sensor supports binning
Date:   Mon, 29 May 2023 12:37:37 +0200
Message-Id: <20230529103741.11904-18-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-1-hdegoede@redhat.com>
References: <20230529103741.11904-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make atomisp_init_sensor() check if the sensor supports binning.

This is a preparation patch for using the selection / crop support
to determine the padding values to use with a specific sensor.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_internal.h      |  1 +
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 30 +++++++++++++++++--
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 9fded17a2c71..f7b4bee9574b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -126,6 +126,7 @@ struct atomisp_input_subdev {
 	unsigned int type;
 	enum atomisp_camera_port port;
 	u32 code; /* MEDIA_BUS_FMT_* */
+	bool binning_support;
 	bool crop_support;
 	struct v4l2_subdev *camera;
 	/* Sensor rects for sensors which support crop */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 3a2e15605919..c43b916a006e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -934,11 +934,12 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 {
 	struct v4l2_subdev_mbus_code_enum mbus_code_enum = { };
+	struct v4l2_subdev_frame_size_enum fse = { };
 	struct v4l2_subdev_state sd_state = {
 		.pads = &input->pad_cfg,
 	};
 	struct v4l2_subdev_selection sel = { };
-	int err;
+	int i, err;
 
 	mbus_code_enum.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	err = v4l2_subdev_call(input->camera, pad, enum_mbus_code, NULL, &mbus_code_enum);
@@ -961,6 +962,28 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 
 	input->active_rect = sel.r;
 
+	/*
+	 * Check for a framesize with half active_rect width and height,
+	 * if found assume the sensor supports binning.
+	 * Do this before changing the crop-rect since that may influence
+	 * enum_frame_size results.
+	 */
+	for (i = 0; ; i++) {
+		fse.index = i;
+		fse.code = input->code;
+		fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+
+		err = v4l2_subdev_call(input->camera, pad, enum_frame_size, NULL, &fse);
+		if (err)
+			break;
+
+		if (fse.min_width <= (input->active_rect.width / 2) &&
+		    fse.min_height <= (input->active_rect.height / 2)) {
+			input->binning_support = true;
+			break;
+		}
+	}
+
 	/*
 	 * The ISP also wants the non-active pixels at the border of the sensor
 	 * for padding, set the crop rect to cover the entire sensor instead
@@ -983,9 +1006,10 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 	if (err)
 		return;
 
-	dev_info(input->camera->dev, "Supports crop native %dx%d active %dx%d\n",
+	dev_info(input->camera->dev, "Supports crop native %dx%d active %dx%d binning %d\n",
 		 input->native_rect.width, input->native_rect.height,
-		 input->active_rect.width, input->active_rect.height);
+		 input->active_rect.width, input->active_rect.height,
+		 input->binning_support);
 
 	input->crop_support = true;
 }
-- 
2.40.1

