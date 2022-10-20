Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6960606934
	for <lists+linux-media@lfdr.de>; Thu, 20 Oct 2022 21:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbiJTT4F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Oct 2022 15:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbiJTT4A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Oct 2022 15:56:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02B5FAE4D
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 12:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666295759;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kHkZGDy1XJOOgj7f1fVF+1HfsYg0np3Q+pIFo3Ko9m8=;
        b=Z50ze/0Y00oJ+T/q2ifyJJoA8EX/hgVaGvlW7jXVrtTx7o7/DA7vsYTybOmnh/qhr/pTtn
        8dgeJSWn2uRRm2OHuSbHriTvY/XP7ddRe4HWAtpEyQ3As2tOOaqtJR1DfpT4Enyd9Tutt2
        M+kmWqa5vTN5UJYz6Esd1Yn/aORf1uk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-Ljuq2EV4Pxyp4tCalETVqA-1; Thu, 20 Oct 2022 15:55:55 -0400
X-MC-Unique: Ljuq2EV4Pxyp4tCalETVqA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63E08101A528;
        Thu, 20 Oct 2022 19:55:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.86])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D8EA940C6EC2;
        Thu, 20 Oct 2022 19:55:52 +0000 (UTC)
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
Subject: [PATCH v2 08/17] media: atomisp: Use new atomisp_flush_video_pipe() helper in atomisp_streamoff()
Date:   Thu, 20 Oct 2022 21:55:24 +0200
Message-Id: <20221020195533.114049-9-hdegoede@redhat.com>
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

Use the new atomisp_flush_video_pipe() helper instead of open-coding it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 40 +------------------
 1 file changed, 2 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 1fffe49cf578..7d5413981714 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1734,11 +1734,6 @@ int atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
 	struct atomisp_sub_device *asd = pipe->asd;
-	struct atomisp_video_pipe *capture_pipe = NULL;
-	struct atomisp_video_pipe *vf_pipe = NULL;
-	struct atomisp_video_pipe *preview_pipe = NULL;
-	struct atomisp_video_pipe *video_pipe = NULL;
-	struct videobuf_buffer *vb, *_vb;
 	enum ia_css_pipe_id css_pipe_id;
 	int ret;
 	unsigned long flags;
@@ -1819,43 +1814,12 @@ int atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	css_pipe_id = atomisp_get_css_pipe_id(asd);
 	atomisp_css_stop(asd, css_pipe_id, false);
 
-	/* cancel work queue*/
-	if (asd->video_out_capture.users) {
-		capture_pipe = &asd->video_out_capture;
-		wake_up_interruptible(&capture_pipe->capq.wait);
-	}
-	if (asd->video_out_vf.users) {
-		vf_pipe = &asd->video_out_vf;
-		wake_up_interruptible(&vf_pipe->capq.wait);
-	}
-	if (asd->video_out_preview.users) {
-		preview_pipe = &asd->video_out_preview;
-		wake_up_interruptible(&preview_pipe->capq.wait);
-	}
-	if (asd->video_out_video_capture.users) {
-		video_pipe = &asd->video_out_video_capture;
-		wake_up_interruptible(&video_pipe->capq.wait);
-	}
+	atomisp_flush_video_pipe(pipe, true);
+
 	ret = videobuf_streamoff(&pipe->capq);
 	if (ret)
 		return ret;
 
-	/* cleanup css here */
-	/* no need for this, as ISP will be reset anyway */
-	/*atomisp_flush_bufs_in_css(isp);*/
-
-	spin_lock_irqsave(&pipe->irq_lock, flags);
-	list_for_each_entry_safe(vb, _vb, &pipe->activeq, queue) {
-		vb->state = VIDEOBUF_PREPARED;
-		list_del(&vb->queue);
-	}
-	list_for_each_entry_safe(vb, _vb, &pipe->buffers_waiting_for_param, queue) {
-		vb->state = VIDEOBUF_PREPARED;
-		list_del(&vb->queue);
-		pipe->frame_request_config_id[vb->i] = 0;
-	}
-	spin_unlock_irqrestore(&pipe->irq_lock, flags);
-
 	atomisp_subdev_cleanup_pending_events(asd);
 stopsensor:
 	if (atomisp_subdev_streaming_count(asd) + 1
-- 
2.37.3

