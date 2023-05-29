Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 102DA7147FC
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 12:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbjE2Kjc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 06:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbjE2Kjb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 06:39:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D0FC4
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 03:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685356725;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2AQog8isOv/81euZZwrmPtZdnnX0w3OOuNquOlBxHsQ=;
        b=GTPMA7X6eBbRvia6h6IzEjTASF3D2S/EdPMYYmnk2qjGkAPsNqAsejO9abeuVeL2DR111P
        xzZHGHyocJrkAJZdMKJdSM38VwfLGugvbN4PmV032/Jq5ehft6Zc3OLjsjz6G0/XKYL097
        xyX2JVkThdt3fQDaqhlsCdIXKR8omVg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-fk-XB_0VOHaGPd1U9SrtUA-1; Mon, 29 May 2023 06:38:40 -0400
X-MC-Unique: fk-XB_0VOHaGPd1U9SrtUA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1904E8032E4;
        Mon, 29 May 2023 10:38:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8839A2166B2B;
        Mon, 29 May 2023 10:38:38 +0000 (UTC)
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
Subject: [PATCH 11/21] media: atomisp: Remove bogus fh use from atomisp_set_fmt*()
Date:   Mon, 29 May 2023 12:37:31 +0200
Message-Id: <20230529103741.11904-12-hdegoede@redhat.com>
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

atomisp_set_fmt*() use a local v4l2_subdev_fh declared on the stack,
specifically they use fh.state which is never initialized so when
passing fh.state to atomisp_subdev_set_ffmt() / to
atomisp_subdev_set_selection() these functions are passing random
stack contents as a pointer.

The reason this works is because when the which parameter is
V4L2_SUBDEV_FORMAT_ACTIVE the passed in state is not used.

Remove the bogus fh usage and just pass NULL as state.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 2a1cb3049019..87184ddf94c5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3908,7 +3908,6 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	const struct atomisp_format_bridge *format;
 	struct v4l2_rect *isp_sink_crop;
 	enum ia_css_pipe_id pipe_id;
-	struct v4l2_subdev_fh fh;
 	int (*configure_output)(struct atomisp_sub_device *asd,
 				unsigned int width, unsigned int height,
 				unsigned int min_width,
@@ -3929,8 +3928,6 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 		return -EINVAL;
 	}
 
-	v4l2_fh_init(&fh.vfh, vdev);
-
 	isp_sink_crop = atomisp_subdev_get_rect(
 			    &asd->subdev, NULL, V4L2_SUBDEV_FORMAT_ACTIVE,
 			    ATOMISP_SUBDEV_PAD_SINK, V4L2_SEL_TGT_CROP);
@@ -4138,7 +4135,6 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 	struct atomisp_device *isp;
 	struct atomisp_input_stream_info *stream_info =
 	    (struct atomisp_input_stream_info *)ffmt->reserved;
-	struct v4l2_subdev_fh fh;
 	int ret;
 
 	if (!asd) {
@@ -4149,8 +4145,6 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 
 	isp = asd->isp;
 
-	v4l2_fh_init(&fh.vfh, vdev);
-
 	format = atomisp_get_format_bridge(f->pixelformat);
 	if (!format)
 		return -EINVAL;
@@ -4210,7 +4204,7 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 		asd->params.video_dis_en = false;
 	}
 
-	atomisp_subdev_set_ffmt(&asd->subdev, fh.state,
+	atomisp_subdev_set_ffmt(&asd->subdev, NULL,
 				V4L2_SUBDEV_FORMAT_ACTIVE,
 				ATOMISP_SUBDEV_PAD_SINK, ffmt);
 
@@ -4232,7 +4226,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
 	struct v4l2_rect isp_sink_crop;
-	struct v4l2_subdev_fh fh;
 	int ret;
 
 	ret = atomisp_pipe_check(pipe, true);
@@ -4243,8 +4236,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 		"setting resolution %ux%u bytesperline %u\n",
 		f->fmt.pix.width, f->fmt.pix.height, f->fmt.pix.bytesperline);
 
-	v4l2_fh_init(&fh.vfh, vdev);
-
 	format_bridge = atomisp_get_format_bridge(f->fmt.pix.pixelformat);
 	if (!format_bridge)
 		return -EINVAL;
@@ -4288,7 +4279,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 				    snr_format_bridge->mbus_code;
 
 	isp_source_fmt.code = format_bridge->mbus_code;
-	atomisp_subdev_set_ffmt(&asd->subdev, fh.state,
+	atomisp_subdev_set_ffmt(&asd->subdev, NULL,
 				V4L2_SUBDEV_FORMAT_ACTIVE,
 				ATOMISP_SUBDEV_PAD_SOURCE, &isp_source_fmt);
 
@@ -4328,7 +4319,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 		isp_sink_crop.width = f->fmt.pix.width;
 		isp_sink_crop.height = f->fmt.pix.height;
 
-		atomisp_subdev_set_selection(&asd->subdev, fh.state,
+		atomisp_subdev_set_selection(&asd->subdev, NULL,
 					     V4L2_SUBDEV_FORMAT_ACTIVE,
 					     ATOMISP_SUBDEV_PAD_SOURCE, V4L2_SEL_TGT_COMPOSE,
 					     0, &isp_sink_crop);
@@ -4347,7 +4338,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 					 f->fmt.pix.height);
 		}
 
-		atomisp_subdev_set_selection(&asd->subdev, fh.state,
+		atomisp_subdev_set_selection(&asd->subdev, NULL,
 					     V4L2_SUBDEV_FORMAT_ACTIVE,
 					     ATOMISP_SUBDEV_PAD_SOURCE,
 					     V4L2_SEL_TGT_COMPOSE, 0,
-- 
2.40.1

