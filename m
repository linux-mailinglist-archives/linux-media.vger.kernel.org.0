Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 991177B58F5
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 19:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjJBRYS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 13:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjJBRYR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 13:24:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E8C08E
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 10:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696267403;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=XJ2MqbqEeJLQtdU6waBTGpwGuddKAAb4iUeVdb949bs=;
        b=FJDilBVm2nNGGLjUAi6MqTaEjoOVhZEYK/mpT4ZdYA02wX7rpVrfed+Vr4J3FgqkTV8hVt
        6Ax1rB7wrVIYfVdbrgUrip0k4cbegROZIloGuIOefm4ib8uPOSzKusP4fsAyaI4qYIePVc
        C5ZxWn4regBpTRjS3I6TAW37CbdYRtM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-r6wutnJ8PqCheh7f-e9y_A-1; Mon, 02 Oct 2023 13:23:09 -0400
X-MC-Unique: r6wutnJ8PqCheh7f-e9y_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3154D3C1ACD4;
        Mon,  2 Oct 2023 17:23:09 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.89])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B7D0E1005B90;
        Mon,  2 Oct 2023 17:23:07 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH] media: intel/ipu6: Set V4L2_CAP_IO_MC flag for isys /dev/video# nodes
Date:   Mon,  2 Oct 2023 19:23:06 +0200
Message-ID: <20231002172306.111601-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IPU6 isys is a media-controller centric device which needs
the pipeline to be configured using the media controller API before use.

Set the V4L2_CAP_IO_MC flag to reflect this.

This also allows dropping of the enum_input() g_input() and s_input()
implementations, with V4L2_CAP_IO_MC set the v4l2-core will take care
of those.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 29 ++-----------------
 1 file changed, 2 insertions(+), 27 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index ad74a19527b7..e6fc32603c3f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -262,29 +262,6 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_enum_input(struct file *file, void *fh,
-			     struct v4l2_input *input)
-{
-	if (input->index > 0)
-		return -EINVAL;
-	strscpy(input->name, "camera", sizeof(input->name));
-	input->type = V4L2_INPUT_TYPE_CAMERA;
-
-	return 0;
-}
-
-static int vidioc_g_input(struct file *file, void *fh, unsigned int *input)
-{
-	*input = 0;
-
-	return 0;
-}
-
-static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
-{
-	return input == 0 ? 0 : -EINVAL;
-}
-
 static int link_validate(struct media_link *link)
 {
 	struct ipu6_isys_video *av =
@@ -1017,9 +994,6 @@ static const struct v4l2_ioctl_ops ioctl_ops_mplane = {
 	.vidioc_streamon = vb2_ioctl_streamon,
 	.vidioc_streamoff = vb2_ioctl_streamoff,
 	.vidioc_expbuf = vb2_ioctl_expbuf,
-	.vidioc_enum_input = vidioc_enum_input,
-	.vidioc_g_input = vidioc_g_input,
-	.vidioc_s_input = vidioc_s_input,
 };
 
 static const struct media_entity_operations entity_ops = {
@@ -1217,7 +1191,8 @@ int ipu6_isys_video_init(struct ipu6_isys_video *av)
 
 	mutex_init(&av->mutex);
 	av->vdev.device_caps = V4L2_CAP_STREAMING |
-			       V4L2_CAP_VIDEO_CAPTURE_MPLANE;
+			       V4L2_CAP_VIDEO_CAPTURE_MPLANE |
+			       V4L2_CAP_IO_MC;
 	av->vdev.vfl_dir = VFL_DIR_RX;
 
 	ret = ipu6_isys_queue_init(&av->aq);
-- 
2.41.0

