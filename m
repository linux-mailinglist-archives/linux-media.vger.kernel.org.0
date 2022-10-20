Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A66560693B
	for <lists+linux-media@lfdr.de>; Thu, 20 Oct 2022 21:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbiJTT4Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Oct 2022 15:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbiJTT4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Oct 2022 15:56:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB98C1162F1
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 12:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666295767;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aCuuX/h4r9KTJdbCAUEIMDBZu77zu+KUUR9gWC0O1vA=;
        b=goAuulGlNqnjmAmyPiN679aNBRFs+q1E4kCXzgcBv5riIr1yqvy+zBrHFtheuavvpUTzfs
        b9v4Mwf4l1KW6Ru6aan1egxrygeVzDf8yE7hr6gLZuMLIeokETX0Es0tosEZJaOGLWAQ/L
        8cy2HBVbI3XrCwCuKKGtmK0E9yXIWBg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-EZ7Hjgo7NWi85fh0s0GATw-1; Thu, 20 Oct 2022 15:56:02 -0400
X-MC-Unique: EZ7Hjgo7NWi85fh0s0GATw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 874BA185A794;
        Thu, 20 Oct 2022 19:56:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.86])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0739340C6EC2;
        Thu, 20 Oct 2022 19:55:59 +0000 (UTC)
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
Subject: [PATCH v2 12/17] media: atomisp: Fix VIDIOC_REQBUFS failing when VIDIOC_S_FMT has not been called yet
Date:   Thu, 20 Oct 2022 21:55:28 +0200
Message-Id: <20221020195533.114049-13-hdegoede@redhat.com>
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

camorama calls VIDIOC_REQBUFS(V4L2_MEMORY_MMAP) to test if MMAP support
works (this was added specifically because of the previously broken
MMAP support in atomisp).

Currently this fails because atomisp_get_css_frame_info() fails in this
case. Although it is weird to call VIDIOC_REQBUFS before VIDIOC_S_FMT,
it is allowed to do this.

Fix this not working by doing a S_FMT to V4L2_PIX_FMT_YUV420 + the highest
supported resolution.

Note this will cause camorama to use mmap mode, which means it will also
use libv4l2 to do format conversion. libv4l2 will pick V4L2_PIX_FMT_RGB565
as input format and this will lead to a garbled video display. This is
a libv4lconvert bug, the RGB565 -> RGB24 path in libv4lconvert assumes
that stride == width which is not true on the atomisp.

I've already send out a libv4lconvert fix for this. Also this can be worked
around by passing --dont-use-libv4l2 as argument to camorama.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_compat_css20.c  |  2 +-
 .../staging/media/atomisp/pci/atomisp_fops.c  | 25 +++++++++++++++++--
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index ea6114679c53..f282572d69da 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2688,7 +2688,7 @@ int atomisp_get_css_frame_info(struct atomisp_sub_device *asd,
 
 	if (0 != ia_css_pipe_get_info(asd->stream_env[stream_index]
 		.pipes[pipe_index], &info)) {
-		dev_err(isp->dev, "ia_css_pipe_get_info FAILED");
+		dev_dbg(isp->dev, "ia_css_pipe_get_info FAILED");
 		return -EINVAL;
 	}
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index bc47a092a8af..f539df09ebd9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -50,15 +50,36 @@ static int atomisp_queue_setup(struct vb2_queue *vq,
 	u16 source_pad = atomisp_subdev_source_pad(&pipe->vdev);
 	int ret;
 
+	mutex_lock(&pipe->asd->isp->mutex); /* for get_css_frame_info() / set_fmt() */
+
+	/*
+	 * When VIDIOC_S_FMT has not been called before VIDIOC_REQBUFS, then
+	 * this will fail. Call atomisp_set_fmt() ourselves and try again.
+	 */
 	ret = atomisp_get_css_frame_info(pipe->asd, source_pad, &pipe->frame_info);
-	if (ret)
-		return ret;
+	if (ret) {
+		struct v4l2_format f = {
+			.fmt.pix.pixelformat = V4L2_PIX_FMT_YUV420,
+			.fmt.pix.width = 10000,
+			.fmt.pix.height = 10000,
+		};
+
+		ret = atomisp_set_fmt(&pipe->vdev, &f);
+		if (ret)
+			goto out;
+
+		ret = atomisp_get_css_frame_info(pipe->asd, source_pad, &pipe->frame_info);
+		if (ret)
+			goto out;
+	}
 
 	atomisp_alloc_css_stat_bufs(pipe->asd, ATOMISP_INPUT_STREAM_GENERAL);
 
 	*nplanes = 1;
 	sizes[0] = PAGE_ALIGN(pipe->pix.sizeimage);
 
+out:
+	mutex_unlock(&pipe->asd->isp->mutex);
 	return 0;
 }
 
-- 
2.37.3

