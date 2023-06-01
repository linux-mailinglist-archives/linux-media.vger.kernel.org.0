Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8046971A1B5
	for <lists+linux-media@lfdr.de>; Thu,  1 Jun 2023 17:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234763AbjFAPCk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jun 2023 11:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233822AbjFAPBF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jun 2023 11:01:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B683910D5
        for <linux-media@vger.kernel.org>; Thu,  1 Jun 2023 07:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685631548;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LjN3WmiAbe4dV1aNuMh71/tZebm4EMjQJk0lOemIUXk=;
        b=Mf9PMCvQfplCAZ1h4vA/QIuGPMhV5SRayM/uOno9DzqYTp6ES5x+gjMLSFWwCCKi16zMHT
        G9UqKs8N7vN+Lf5dtrJ4dPKauyFrmcRUoh0TXox0Wsg5GY75+O7Li9puIV6fRoTM68Rd5Y
        ruzWjGy4n7pibt3k/09fwzA2L0dm1sA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-58slDWE0P6yACML5hZ_oWA-1; Thu, 01 Jun 2023 10:59:05 -0400
X-MC-Unique: 58slDWE0P6yACML5hZ_oWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 672CA8030D4;
        Thu,  1 Jun 2023 14:59:04 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.72])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D6EAF20296C6;
        Thu,  1 Jun 2023 14:59:02 +0000 (UTC)
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
Subject: [PATCH 2/3] media: atomisp: Make atomisp_enum_framesizes_crop() check resolution fits with padding
Date:   Thu,  1 Jun 2023 16:58:57 +0200
Message-Id: <20230601145858.59652-3-hdegoede@redhat.com>
In-Reply-To: <20230601145858.59652-1-hdegoede@redhat.com>
References: <20230601145858.59652-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that atomisp_get_padding() takes minimum padding requirements
on BYT/ISP2400 into account, it is possible for a resolution which
fits in the active area of the sensor to not fit in the native area
once padding is added.

For example on the ov2680 which has a native resolution of 1616x1216
the max active resolution of 1600x1200 leaves 16x16 for padding which
meets the worst-case minimum padding requirement of 14x14 on BYT.

But after binning we are left with an native area of 808x608 and
an active area of 800x600. This leaves 8x8 for padding which is not
enough. So on BYT 800x600 is not a valid resolution (it could be
made by lots of cropping without binning but then the remaining
field of view is no good).

Modify atomisp_enum_framesizes_crop() to check the resolution +
padding fits in the native rectangle, removing 800x600 from
the list of valid modes on BYT.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c    |  5 ++---
 .../staging/media/atomisp/pci/atomisp_cmd.h    |  4 ++++
 .../staging/media/atomisp/pci/atomisp_ioctl.c  | 18 +++++++++++++-----
 3 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 5c984edfb3fc..68550cd49a83 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3691,9 +3691,8 @@ static void atomisp_fill_pix_format(struct v4l2_pix_format *f,
 }
 
 /* Get sensor padding values for the non padded width x height resolution */
-static void atomisp_get_padding(struct atomisp_device *isp,
-				u32 width, u32 height,
-				u32 *padding_w, u32 *padding_h)
+void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
+			 u32 *padding_w, u32 *padding_h)
 {
 	struct atomisp_input_subdev *input = &isp->inputs[isp->asd.input_curr];
 	struct v4l2_rect native_rect = input->native_rect;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index c9a587b34e70..8305161d2062 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -250,6 +250,10 @@ int atomisp_makeup_css_parameters(struct atomisp_sub_device *asd,
 int atomisp_compare_grid(struct atomisp_sub_device *asd,
 			 struct atomisp_grid_info *atomgrid);
 
+/* Get sensor padding values for the non padded width x height resolution */
+void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
+			 u32 *padding_w, u32 *padding_h);
+
 /* This function looks up the closest available resolution. */
 int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		    const struct atomisp_format_bridge **fmt_ret,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 279493af6e0d..d2174156573a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -703,7 +703,8 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
  */
 static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 					      struct v4l2_frmsizeenum *fsize,
-					      struct v4l2_rect *active,
+					      const struct v4l2_rect *active,
+					      const struct v4l2_rect *native,
 					      int *valid_sizes)
 {
 	static const struct v4l2_frmsize_discrete frame_sizes[] = {
@@ -716,11 +717,15 @@ static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 		{  800,  600 },
 		{  640,  480 },
 	};
+	u32 padding_w, padding_h;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(frame_sizes); i++) {
-		if (frame_sizes[i].width > active->width ||
-		    frame_sizes[i].height > active->height)
+		atomisp_get_padding(isp, frame_sizes[i].width, frame_sizes[i].height,
+				    &padding_w, &padding_h);
+
+		if ((frame_sizes[i].width + padding_w) > native->width ||
+		    (frame_sizes[i].height + padding_h) > native->height)
 			continue;
 
 		/*
@@ -748,9 +753,10 @@ static int atomisp_enum_framesizes_crop(struct atomisp_device *isp,
 {
 	struct atomisp_input_subdev *input = &isp->inputs[isp->asd.input_curr];
 	struct v4l2_rect active = input->active_rect;
+	struct v4l2_rect native = input->native_rect;
 	int ret, valid_sizes = 0;
 
-	ret = atomisp_enum_framesizes_crop_inner(isp, fsize, &active, &valid_sizes);
+	ret = atomisp_enum_framesizes_crop_inner(isp, fsize, &active, &native, &valid_sizes);
 	if (ret == 0)
 		return 0;
 
@@ -759,8 +765,10 @@ static int atomisp_enum_framesizes_crop(struct atomisp_device *isp,
 
 	active.width /= 2;
 	active.height /= 2;
+	native.width /= 2;
+	native.height /= 2;
 
-	return atomisp_enum_framesizes_crop_inner(isp, fsize, &active, &valid_sizes);
+	return atomisp_enum_framesizes_crop_inner(isp, fsize, &active, &native, &valid_sizes);
 }
 
 static int atomisp_enum_framesizes(struct file *file, void *priv,
-- 
2.40.1

