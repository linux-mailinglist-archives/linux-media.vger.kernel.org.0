Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 974C4606936
	for <lists+linux-media@lfdr.de>; Thu, 20 Oct 2022 21:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbiJTT4N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Oct 2022 15:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbiJTT4G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Oct 2022 15:56:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C4B120EDF
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 12:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666295764;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Izar131kmQOj4fIpKmUUxDyFSkeu96QYzj2nxLM0Hb8=;
        b=SVt5Z8nJ3TsmoGVt4bg2BW7OtjlwN5t5w/IILYXO6fJMFCGcr9xgtLYSAeiFwYnWMXernz
        jVsQfF2aaaqHDhUXg4WQ1eMkVtq6jGintm9RZ5Uin4c2ZvSye7xBi+8h1kr2/b2MTs8sK/
        Edqq4xQHFUp1xPTn2iFVIVeNETT/tO4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-VxQ1QrG8MKukLOILWJCLkg-1; Thu, 20 Oct 2022 15:56:00 -0400
X-MC-Unique: VxQ1QrG8MKukLOILWJCLkg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C605B3814586;
        Thu, 20 Oct 2022 19:55:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.86])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 48A1740C6EC2;
        Thu, 20 Oct 2022 19:55:58 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v2 11/17] media: atomisp: Make it possible to call atomisp_set_fmt() without a file handle
Date:   Thu, 20 Oct 2022 21:55:27 +0200
Message-Id: <20221020195533.114049-12-hdegoede@redhat.com>
In-Reply-To: <20221020195533.114049-1-hdegoede@redhat.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To fix atomisp_queue_setup() sometimes failing it needs to be able to call
atomisp_set_fmt(), but atomisp_queue_setup() (VIDIOC_REQBUFS) does not get
passed a file handle by the videobuf2 core.

Partly revert commit b3be98f984d4 ("media: atomisp: Remove a couple of not
useful function wrappers") so that atomisp_set_fmt() can be used
without a file handle.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c   |  3 +--
 drivers/staging/media/atomisp/pci/atomisp_cmd.h   |  2 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 10 +++++++++-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 0f8d683382fd..b52c8e010752 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -5096,9 +5096,8 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev,
 	return css_input_resolution_changed(asd, ffmt);
 }
 
-int atomisp_set_fmt(struct file *file, void *unused, struct v4l2_format *f)
+int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 {
-	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
 	struct atomisp_sub_device *asd = pipe->asd;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 4c965d17c9a3..d9110bba8c28 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -265,7 +265,7 @@ int atomisp_get_sensor_mode_data(struct atomisp_sub_device *asd,
 int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
 		    bool *res_overflow);
 
-int atomisp_set_fmt(struct file *file, void *fh, struct v4l2_format *f);
+int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f);
 
 int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 			      struct atomisp_shading_table *shading_table);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index e850de069f8f..b5d42257a87d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -665,6 +665,14 @@ static int atomisp_g_input(struct file *file, void *fh, unsigned int *input)
 	return 0;
 }
 
+static int atomisp_s_fmt_cap(struct file *file, void *fh,
+			     struct v4l2_format *f)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	return atomisp_set_fmt(vdev, f);
+}
+
 /*
  * set input are used to set current primary/secondary camera
  */
@@ -2401,7 +2409,7 @@ const struct v4l2_ioctl_ops atomisp_ioctl_ops = {
 	.vidioc_enum_fmt_vid_cap = atomisp_enum_fmt_cap,
 	.vidioc_try_fmt_vid_cap = atomisp_try_fmt_cap,
 	.vidioc_g_fmt_vid_cap = atomisp_g_fmt_cap,
-	.vidioc_s_fmt_vid_cap = atomisp_set_fmt,
+	.vidioc_s_fmt_vid_cap = atomisp_s_fmt_cap,
 	.vidioc_reqbufs = vb2_ioctl_reqbufs,
 	.vidioc_querybuf = vb2_ioctl_querybuf,
 	.vidioc_qbuf = atomisp_qbuf_wrapper,
-- 
2.37.3

