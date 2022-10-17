Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAF0600943
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 10:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbiJQIwx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 04:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230332AbiJQIwe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 04:52:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 881B7474DC
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 01:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665996706;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k8OXA/Nd4CyyzFK17MQNxeb9PPqVpnUxGZ2h1xMKpo4=;
        b=gQRb9JvmK3vpF2vtdUa016p3E+pKKMVvstO6tvVtKkybGpj1o/zooFT3aUdkLXh9U8AXPG
        kVregUMzNWZf2sq5f8GY96NfCk3sZgk3ywMrWCQ+QbaHxJUexjS1NvldDeOb1EhXBq3uMT
        xS9L3v9C+fnvYSwd+5NuSTLHsOAoqQI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-eD6rEK7jMg-ex6oVfbXgAA-1; Mon, 17 Oct 2022 04:51:42 -0400
X-MC-Unique: eD6rEK7jMg-ex6oVfbXgAA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7046C81173B;
        Mon, 17 Oct 2022 08:51:40 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.44])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 78D4110A58CE;
        Mon, 17 Oct 2022 08:51:29 +0000 (UTC)
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
Subject: [PATCH 12/17] media: atomisp: Fix VIDIOC_REQBUFS failing when VIDIOC_S_FMT has not been called yet
Date:   Mon, 17 Oct 2022 10:50:52 +0200
Message-Id: <20221017085057.7483-13-hdegoede@redhat.com>
In-Reply-To: <20221017085057.7483-1-hdegoede@redhat.com>
References: <20221017085057.7483-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
 .../staging/media/atomisp/pci/atomisp_fops.c  | 21 +++++++++++++++++--
 2 files changed, 20 insertions(+), 3 deletions(-)

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
index eb9555c5e879..95b8477a197f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -50,9 +50,26 @@ static int atomisp_queue_setup(struct vb2_queue *vq,
 	u16 source_pad = atomisp_subdev_source_pad(&pipe->vdev);
 	int ret;
 
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
+			return ret;
+
+		ret = atomisp_get_css_frame_info(pipe->asd, source_pad, &pipe->frame_info);
+		if (ret)
+			return ret;
+	}
 
 	atomisp_alloc_css_stat_bufs(pipe->asd, ATOMISP_INPUT_STREAM_GENERAL);
 
-- 
2.37.3

