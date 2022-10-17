Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5AD4600933
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 10:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbiJQIwc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 04:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbiJQIwA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 04:52:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 861E624F22
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 01:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665996675;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S/x0OTE0N8i+x3ZRpoUfimZm39aV7eGHqOrriR9MPRU=;
        b=gx14SO3ha4Zz6nYMyuqjUjDjrrGdesmwALcqGFp3TrKcv65QkSYU8Lw8g2tkkv//6wlAjJ
        XYy+X3BXf1Sg7UdmuCcDU/Ug+rez1kwKfehENQRVx+OwYfbpVo+9HODCHPoNFw1puh9LuA
        jWK6lRGb6IEAARJYQaP9tRz+O/iEOIs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-PFgYOFWCMneBDWgnE6y6KA-1; Mon, 17 Oct 2022 04:51:12 -0400
X-MC-Unique: PFgYOFWCMneBDWgnE6y6KA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35698811E67;
        Mon, 17 Oct 2022 08:51:12 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.44])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0CB0510A58CE;
        Mon, 17 Oct 2022 08:51:09 +0000 (UTC)
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
Subject: [PATCH 04/17] media: atomisp: On streamoff wait for buffers owned by the CSS to be given back
Date:   Mon, 17 Oct 2022 10:50:44 +0200
Message-Id: <20221017085057.7483-5-hdegoede@redhat.com>
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

There is no guarantee that when we stop the pipeline all buffers owned
by the CSS are cleanly returned to the videobuf queue.

This is a problem with videobuf2 which will complain loudly when not
all buffers have been returned after the streamoff() queue op has
returned.

And this also allows moving a WARN() in the continuous mode path.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_fops.c  |  3 ++
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 39 ++++++++-----------
 .../media/atomisp/pci/atomisp_subdev.h        |  3 +-
 3 files changed, 21 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index d47b7f19125f..3b833cd5b423 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -222,6 +222,9 @@ static int atomisp_q_video_buffers_to_css(struct atomisp_sub_device *asd,
 	if (WARN_ON(css_pipe_id >= IA_CSS_PIPE_ID_NUM))
 		return -EINVAL;
 
+	if (pipe->stopping)
+		return -EINVAL;
+
 	while (pipe->buffers_in_css < ATOMISP_CSS_Q_DEPTH) {
 		struct videobuf_buffer *vb;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index aefa7c07242a..bf5249b0d3bd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1754,6 +1754,22 @@ int atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 		return -EINVAL;
 	}
 
+	/*
+	 * There is no guarantee that the buffers queued to / owned by the ISP
+	 * will properly be returned to the queue when stopping. Set a flag to
+	 * avoid new buffers getting queued and then wait for all the current
+	 * buffers to finish.
+	 */
+	pipe->stopping = true;
+	mutex_unlock(&isp->mutex);
+	/* wait max 1 second */
+	ret = wait_event_interruptible_timeout(pipe->capq.wait,
+					       pipe->buffers_in_css == 0, HZ);
+	mutex_lock(&isp->mutex);
+	pipe->stopping = false;
+	if (ret <= 0)
+		return ret ? ret : -ETIME;
+
 	/*
 	 * do only videobuf_streamoff for capture & vf pipes in
 	 * case of continuous capture
@@ -1768,29 +1784,6 @@ int atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 								      0, 0, 0);
 			atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_AUTO, false);
 		}
-		/*
-		 * Currently there is no way to flush buffers queued to css.
-		 * When doing videobuf_streamoff, active buffers will be
-		 * marked as VIDEOBUF_NEEDS_INIT. HAL will be able to use
-		 * these buffers again, and these buffers might be queued to
-		 * css more than once! Warn here, if HAL has not dequeued all
-		 * buffers back before calling streamoff.
-		 */
-		if (pipe->buffers_in_css != 0) {
-			WARN(1, "%s: buffers of vdev %s still in CSS!\n",
-			     __func__, pipe->vdev.name);
-
-			/*
-			 * Buffers remained in css maybe dequeued out in the
-			 * next stream on, while this will causes serious
-			 * issues as buffers already get invalid after
-			 * previous stream off.
-			 *
-			 * No way to flush buffers but to reset the whole css
-			 */
-			dev_warn(isp->dev, "Reset CSS to clean up css buffers.\n");
-			atomisp_css_flush(isp);
-		}
 
 		return videobuf_streamoff(&pipe->capq);
 	}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index a1f4da35235d..65c2f8664f9d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -81,7 +81,8 @@ struct atomisp_video_pipe {
 
 	/* Store here the initial run mode */
 	unsigned int default_run_mode;
-
+	/* Set from streamoff to disallow queuing further buffers in CSS */
+	bool stopping;
 	unsigned int buffers_in_css;
 
 	/*
-- 
2.37.3

