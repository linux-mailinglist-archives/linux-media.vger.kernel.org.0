Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 515DF6D31C9
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbjDAPBa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbjDAPB2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:01:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0DDD1EA39
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 08:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361222;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NqV9490Mg4OeN8EDJ/97R+nPQu2ujG6puyFSMc5iU4Y=;
        b=bDhRveSoyNScmkOGMmSDTPtYwlF//9/t71nLU3xSEQkeph8HWfN5Qhe/SuFbspMatCLzd5
        98sJNo3Q14hiO/UDinhgV0o13deC7yh8KPNFnZ3FWDlrhdXDSUP9XGnxt4I8sfljrCvPdk
        9OQedkwkXBAX1OjT+uHRshLjzkmXAL4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-qD4g6UROOSKE8ZRlbXlKPw-1; Sat, 01 Apr 2023 11:00:19 -0400
X-MC-Unique: qD4g6UROOSKE8ZRlbXlKPw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55DBD2A59560;
        Sat,  1 Apr 2023 15:00:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C6CA64021C7;
        Sat,  1 Apr 2023 15:00:16 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 22/28] media: atomisp: Remove snr_mbus_fmt local var from atomisp_try_fmt()
Date:   Sat,  1 Apr 2023 16:59:20 +0200
Message-Id: <20230401145926.596216-23-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
References: <20230401145926.596216-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

snr_mbus_fmt is a local variable pointing to a substruct of another local
variable which really just makes the code harder to read / follow,
so drop it.

And likewise also drop the stream_info local variable.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 33 +++++++++----------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index c73931c77695..0fca4bc605ec 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3970,11 +3970,7 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
-
-	struct v4l2_mbus_framefmt *snr_mbus_fmt = &format.format;
 	const struct atomisp_format_bridge *fmt;
-	struct atomisp_input_stream_info *stream_info =
-	    (struct atomisp_input_stream_info *)snr_mbus_fmt->reserved;
 	int ret;
 
 	if (!asd) {
@@ -3995,14 +3991,15 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
 	if (f->width <= 0 || f->height <= 0)
 		return -EINVAL;
 
-	snr_mbus_fmt->code = fmt->mbus_code;
-	snr_mbus_fmt->width = f->width;
-	snr_mbus_fmt->height = f->height;
+	format.format.code = fmt->mbus_code;
+	format.format.width = f->width;
+	format.format.height = f->height;
 
-	__atomisp_init_stream_info(ATOMISP_INPUT_STREAM_GENERAL, stream_info);
+	__atomisp_init_stream_info(ATOMISP_INPUT_STREAM_GENERAL,
+				   (struct atomisp_input_stream_info *)format.format.reserved);
 
 	dev_dbg(isp->dev, "try_mbus_fmt: asking for %ux%u\n",
-		snr_mbus_fmt->width, snr_mbus_fmt->height);
+		format.format.width, format.format.height);
 
 	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
 			       pad, set_fmt, &pad_state, &format);
@@ -4010,12 +4007,12 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
 		return ret;
 
 	dev_dbg(isp->dev, "try_mbus_fmt: got %ux%u\n",
-		snr_mbus_fmt->width, snr_mbus_fmt->height);
+		format.format.width, format.format.height);
 
-	fmt = atomisp_get_format_bridge_from_mbus(snr_mbus_fmt->code);
+	fmt = atomisp_get_format_bridge_from_mbus(format.format.code);
 	if (!fmt) {
 		dev_err(isp->dev, "unknown sensor format 0x%8.8x\n",
-			snr_mbus_fmt->code);
+			format.format.code);
 		return -EINVAL;
 	}
 
@@ -4029,15 +4026,15 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
 	 */
 	if (f->pixelformat == V4L2_PIX_FMT_JPEG ||
 	    f->pixelformat == V4L2_PIX_FMT_CUSTOM_M10MO_RAW) {
-		f->width = snr_mbus_fmt->width;
-		f->height = snr_mbus_fmt->height;
+		f->width = format.format.width;
+		f->height = format.format.height;
 		return 0;
 	}
 
-	if (!res_overflow || (snr_mbus_fmt->width < f->width &&
-			      snr_mbus_fmt->height < f->height)) {
-		f->width = snr_mbus_fmt->width;
-		f->height = snr_mbus_fmt->height;
+	if (!res_overflow || (format.format.width < f->width &&
+			      format.format.height < f->height)) {
+		f->width = format.format.width;
+		f->height = format.format.height;
 		/* Set the flag when resolution requested is
 		 * beyond the max value supported by sensor
 		 */
-- 
2.39.1

