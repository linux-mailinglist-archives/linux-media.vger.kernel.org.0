Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E55727016B2
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232757AbjEMMe3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238074AbjEMMe0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:34:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B273AA9
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981158;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LqAldjOfwG7MT23v8Xbiayp11klirrHcL2cSmqNlQUk=;
        b=CgZ5Yvw+QN302xqYtWgCVe0rxTZsAzkuosdXj0xiX/A4IY7m3Pt5kk2xhtGvaTvK/8Bbuz
        5pWRMsWiRukdpskOMgHSo8n7OQWuBp4LCc0Lhv2fKQkYs3psAY/ByNXUrESZYi2ICQsk6Y
        rHH6KJPxYGROBuRs2xvfn0GhGa+wz/E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-V-Wz8FxKNxC609ARaia2kQ-1; Sat, 13 May 2023 08:32:34 -0400
X-MC-Unique: V-Wz8FxKNxC609ARaia2kQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 229721C060EB;
        Sat, 13 May 2023 12:32:34 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8C49340C2076;
        Sat, 13 May 2023 12:32:32 +0000 (UTC)
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
Subject: [PATCH 18/30] media: atomisp: Simplify atomisp_open() and atomisp_release()
Date:   Sat, 13 May 2023 14:31:47 +0200
Message-Id: <20230513123159.33234-19-hdegoede@redhat.com>
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

Now that continuous mode is gone and we only have 1 /dev/video# node,
combined with only allowing 1 open of that /dev/video# node for now,
there is no need to check for other (sub)dev / pipe users.

Remove the unnecessary checks for a nice cleanup.

Note we also don't need to set asd->streaming to disabled since
the vb2_fop_release() call done by atomisp_release() will have called
atomisp_stop_streaming() already at this point (if necessary) and
that will have already done this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_fops.c  | 26 -------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 37d8c8af3e8c..ef1a5ad30ace 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -532,11 +532,6 @@ static int atomisp_open(struct file *file)
 		return -EBUSY;
 	}
 
-	if (atomisp_dev_users(isp)) {
-		dev_dbg(isp->dev, "skip init isp in open\n");
-		goto init_subdev;
-	}
-
 	/* runtime power management, turn on ISP */
 	ret = pm_runtime_resume_and_get(vdev->v4l2_dev->dev);
 	if (ret < 0) {
@@ -552,19 +547,12 @@ static int atomisp_open(struct file *file)
 		goto css_error;
 	}
 
-init_subdev:
-	if (atomisp_subdev_users(asd))
-		goto done;
-
 	atomisp_subdev_init_struct(asd);
 	/* Ensure that a mode is set */
 	v4l2_ctrl_s_ctrl(asd->run_mode, pipe->default_run_mode);
 
-done:
 	pipe->users++;
 	mutex_unlock(&isp->mutex);
-
-
 	return 0;
 
 css_error:
@@ -583,7 +571,6 @@ static int atomisp_release(struct file *file)
 	struct atomisp_sub_device *asd = pipe->asd;
 	struct v4l2_subdev_fh fh;
 	struct v4l2_rect clear_compose = {0};
-	unsigned long flags;
 	int ret;
 
 	v4l2_fh_init(&fh.vfh, vdev);
@@ -598,8 +585,6 @@ static int atomisp_release(struct file *file)
 	mutex_lock(&isp->mutex);
 
 	pipe->users--;
-	if (pipe->users)
-		goto done;
 
 	/*
 	 * A little trick here:
@@ -616,9 +601,6 @@ static int atomisp_release(struct file *file)
 					ATOMISP_SUBDEV_PAD_SINK, &isp_sink_fmt);
 	}
 
-	if (atomisp_subdev_users(asd))
-		goto done;
-
 	atomisp_css_free_stat_buffers(asd);
 	atomisp_free_internal_buffers(asd);
 
@@ -632,13 +614,6 @@ static int atomisp_release(struct file *file)
 		isp->inputs[asd->input_curr].asd = NULL;
 	}
 
-	spin_lock_irqsave(&isp->lock, flags);
-	asd->streaming = ATOMISP_DEVICE_STREAMING_DISABLED;
-	spin_unlock_irqrestore(&isp->lock, flags);
-
-	if (atomisp_dev_users(isp))
-		goto done;
-
 	atomisp_destroy_pipes_stream_force(asd);
 
 	ret = v4l2_subdev_call(isp->flash, core, s_power, 0);
@@ -648,7 +623,6 @@ static int atomisp_release(struct file *file)
 	if (pm_runtime_put_sync(vdev->v4l2_dev->dev) < 0)
 		dev_err(isp->dev, "Failed to power off device\n");
 
-done:
 	atomisp_subdev_set_selection(&asd->subdev, fh.state,
 				     V4L2_SUBDEV_FORMAT_ACTIVE,
 				     ATOMISP_SUBDEV_PAD_SOURCE,
-- 
2.40.1

