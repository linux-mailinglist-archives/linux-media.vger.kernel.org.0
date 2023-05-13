Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1096F701696
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237370AbjEMMcw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjEMMcv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:32:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 575462D55
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981127;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NUjOxKsRzoghVLKQSrbyPsItrY8cDwJ2gxRv9vBWoqs=;
        b=i+Fpdt9byCIfDoTg26dyMkpQNbeaRZuUQ0QnulmKSrHgedlgw2rfpUVFmjpWtyFtR2xFiB
        7zr897fH+9V/ySVW6NjzFzZoGEpKJHCho8+UeHq0SYPMMW15FAsxZREbqFQk3x69q69Ayz
        HXg9Qyiz4JpcXgYmafN/j8NPxn3HKOU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-6yyOzg09NgGwiThzemGavg-1; Sat, 13 May 2023 08:32:04 -0400
X-MC-Unique: 6yyOzg09NgGwiThzemGavg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D802101A54F;
        Sat, 13 May 2023 12:32:03 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CB1B940C2077;
        Sat, 13 May 2023 12:32:01 +0000 (UTC)
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
Subject: [PATCH 01/30] media: atomisp: Remove res_overflow parameter from atomisp_try_fmt()
Date:   Sat, 13 May 2023 14:31:30 +0200
Message-Id: <20230513123159.33234-2-hdegoede@redhat.com>
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

The only remaining caller of atomisp_try_fmt() always passes NULL
for the res_overflow parameter. Drop it and simplify atomisp_try_fmt().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 21 ++++---------------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  3 +--
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  2 +-
 3 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index aa790ae746f3..bb49d6f2e67f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3881,8 +3881,7 @@ static void __atomisp_init_stream_info(u16 stream_index,
 }
 
 /* This function looks up the closest available resolution. */
-int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
-		    bool *res_overflow)
+int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f)
 {
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
@@ -3940,6 +3939,8 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
 	}
 
 	f->pixelformat = fmt->pixelformat;
+	f->width = format.format.width;
+	f->height = format.format.height;
 
 	/*
 	 * If the format is jpeg or custom RAW, then the width and height will
@@ -3948,22 +3949,8 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
 	 * the sensor driver.
 	 */
 	if (f->pixelformat == V4L2_PIX_FMT_JPEG ||
-	    f->pixelformat == V4L2_PIX_FMT_CUSTOM_M10MO_RAW) {
-		f->width = format.format.width;
-		f->height = format.format.height;
+	    f->pixelformat == V4L2_PIX_FMT_CUSTOM_M10MO_RAW)
 		return 0;
-	}
-
-	if (!res_overflow || (format.format.width < f->width &&
-			      format.format.height < f->height)) {
-		f->width = format.format.width;
-		f->height = format.format.height;
-		/* Set the flag when resolution requested is
-		 * beyond the max value supported by sensor
-		 */
-		if (res_overflow)
-			*res_overflow = true;
-	}
 
 	/* app vs isp */
 	f->width = rounddown(clamp_t(u32, f->width, ATOM_ISP_MIN_WIDTH,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 399b549bcf83..3cf086eba06d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -259,8 +259,7 @@ int atomisp_compare_grid(struct atomisp_sub_device *asd,
 			 struct atomisp_grid_info *atomgrid);
 
 /* This function looks up the closest available resolution. */
-int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
-		    bool *res_overflow);
+int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f);
 
 int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 384f31fc66c5..4d927799f53b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -896,7 +896,7 @@ static int atomisp_try_fmt_cap(struct file *file, void *fh,
 	f->fmt.pix.width += pad_w;
 	f->fmt.pix.height += pad_h;
 
-	ret = atomisp_try_fmt(vdev, &f->fmt.pix, NULL);
+	ret = atomisp_try_fmt(vdev, &f->fmt.pix);
 	if (ret)
 		return ret;
 
-- 
2.40.1

