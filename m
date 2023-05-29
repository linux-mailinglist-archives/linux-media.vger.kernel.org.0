Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B52C714808
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 12:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231660AbjE2Kjw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 06:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231634AbjE2Kjt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 06:39:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5B2F3
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 03:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685356740;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S+INLfi2nZC3HH7QPaXd6UBOhOd4MjTaQnwp3QJnHpA=;
        b=WOcHFzKcbb8jWtHNpnNVc0mkGt5RT/L1BdqtlQpTzrjeOgNJ9/IdHdCuVSrsd6iev32agJ
        4RUhyrGEmyPEGEC51lzlV4+60+U2U5unmfMIehYTotpayXVQjaO0pXHKdYscS6bG1tQ34a
        Cq5JGCsw6gnWcH3W+dAvq4UoJyklSxg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-pM1bOJFVO-aAtCPIrvgBuw-1; Mon, 29 May 2023 06:38:57 -0400
X-MC-Unique: pM1bOJFVO-aAtCPIrvgBuw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B54D71C06909;
        Mon, 29 May 2023 10:38:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2F50E2166B2B;
        Mon, 29 May 2023 10:38:55 +0000 (UTC)
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
Subject: [PATCH 19/21] media: atomisp: Set crop before setting fmt
Date:   Mon, 29 May 2023 12:37:39 +0200
Message-Id: <20230529103741.11904-20-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-1-hdegoede@redhat.com>
References: <20230529103741.11904-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some drivers which implement selections/crop only allow setting the format
with and height to either the crop rectangle width and height or to half
the crop rectangle width and height (binning). An example of such
a driver is the standard v4l2 ov5693 driver.

First set the crop rectangle to match the requested format
when trying or setting the sensor format, to match these drivers
expectations.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index ce16850170c4..9dfc4bda24f5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3715,6 +3715,47 @@ static void atomisp_get_padding(struct atomisp_device *isp,
 	*padding_h = min_t(u32, (native_rect.height - height) & ~1, pad_h);
 }
 
+static int atomisp_set_crop(struct atomisp_device *isp,
+			    const struct v4l2_mbus_framefmt *format,
+			    int which)
+{
+	struct atomisp_input_subdev *input = &isp->inputs[isp->asd.input_curr];
+	struct v4l2_subdev_state pad_state = {
+		.pads = &input->pad_cfg,
+	};
+	struct v4l2_subdev_selection sel = {
+		.which = which,
+		.target = V4L2_SEL_TGT_CROP,
+		.r.width = format->width,
+		.r.height = format->height,
+	};
+	int ret;
+
+	if (!input->crop_support)
+		return 0;
+
+	/* Cropping is done before binning, when binning double the crop rect */
+	if (input->binning_support && sel.r.width <= (input->active_rect.width / 2) &&
+				      sel.r.height <= (input->active_rect.height / 2)) {
+		sel.r.width *= 2;
+		sel.r.height *= 2;
+	}
+
+	/* Clamp to avoid top/left calculations overflowing */
+	sel.r.width = min(sel.r.width, input->native_rect.width);
+	sel.r.height = min(sel.r.height, input->native_rect.height);
+
+	sel.r.left = ((input->native_rect.width - sel.r.width) / 2) & ~1;
+	sel.r.top = ((input->native_rect.height - sel.r.height) / 2) & ~1;
+
+	ret = v4l2_subdev_call(input->camera, pad, set_selection, &pad_state, &sel);
+	if (ret)
+		dev_err(isp->dev, "Error setting crop to %ux%u @%ux%u: %d\n",
+			sel.r.width, sel.r.height, sel.r.left, sel.r.top, ret);
+
+	return ret;
+}
+
 /* This function looks up the closest available resolution. */
 int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		    const struct atomisp_format_bridge **fmt_ret,
@@ -3758,6 +3799,10 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	dev_dbg(isp->dev, "try_mbus_fmt: asking for %ux%u\n",
 		format.format.width, format.format.height);
 
+	ret = atomisp_set_crop(isp, &format.format, V4L2_SUBDEV_FORMAT_TRY);
+	if (ret)
+		return ret;
+
 	ret = v4l2_subdev_call(input->camera, pad, set_fmt, &pad_state, &format);
 	if (ret)
 		return ret;
@@ -4225,6 +4270,10 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 
 	/* Disable dvs if resolution can't be supported by sensor */
 	if (asd->params.video_dis_en && asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
+		ret = atomisp_set_crop(isp, &vformat.format, V4L2_SUBDEV_FORMAT_TRY);
+		if (ret)
+			return ret;
+
 		vformat.which = V4L2_SUBDEV_FORMAT_TRY;
 		ret = v4l2_subdev_call(input->camera, pad, set_fmt, &pad_state, &vformat);
 		if (ret)
@@ -4243,6 +4292,11 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 			asd->params.video_dis_en = false;
 		}
 	}
+
+	ret = atomisp_set_crop(isp, &vformat.format, V4L2_SUBDEV_FORMAT_ACTIVE);
+	if (ret)
+		return ret;
+
 	vformat.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	ret = v4l2_subdev_call(input->camera, pad, set_fmt, NULL, &vformat);
 	if (ret)
-- 
2.40.1

