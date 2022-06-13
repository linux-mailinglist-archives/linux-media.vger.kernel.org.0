Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 141AC549FD1
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347000AbiFMUpy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:45:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242462AbiFMUob (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:44:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F2CFE6476
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149941;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gDcddNsrEyPkiLmIrObCxvniF30MCiHnZ91KDKHbwX8=;
        b=ZhytHVDrBpIfnUV9UAEeyRD63o/dyEWvvaORQaJt06cJVJGCPJPK6jWQ+dWg+ZySKqoqhp
        NfqpJmv0zwrptZ9YFTQqEXPB9EgZ6X1vgzV0Dfe86nw/wwop+01bFb81AbUpk2Q42P4sBB
        UN14A5biSTUjGYrwXQ2Sf0xp2lhX2Iw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-19BecnXXMYCvqng4frXSiA-1; Mon, 13 Jun 2022 15:52:17 -0400
X-MC-Unique: 19BecnXXMYCvqng4frXSiA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A8BA3C021A6;
        Mon, 13 Jun 2022 19:52:17 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A8B1A2166B26;
        Mon, 13 Jun 2022 19:52:15 +0000 (UTC)
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
Subject: [PATCH 21/40] media: atomisp: asc.acc.pipeline is always NULL
Date:   Mon, 13 Jun 2022 21:51:18 +0200
Message-Id: <20220613195137.8117-22-hdegoede@redhat.com>
In-Reply-To: <20220613195137.8117-1-hdegoede@redhat.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the removal of the ACC ioctls and atomisp_acc.c asc.acc.pipeline
never gets set, so it is always NULL.

Remove asc.acc.pipeline and drop checks for it being NULL / !NULL.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c          | 3 ---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 3 +--
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c        | 6 ------
 drivers/staging/media/atomisp/pci/atomisp_subdev.h       | 1 -
 4 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 18f063393433..d8b3896a267a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1888,9 +1888,6 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr)
 		    && isp->sw_contex.file_input)
 			v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
 					 video, s_stream, 1);
-		/* FIXME! FIX ACC implementation */
-		if (asd->acc.pipeline && css_pipe_done[asd->index])
-			atomisp_css_acc_done(asd);
 	}
 	dev_dbg(isp->dev, "<%s\n", __func__);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 51b31e6c4811..646404a71d18 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -3857,8 +3857,7 @@ static struct atomisp_sub_device *__get_atomisp_subdev(
 
 	for (i = 0; i < isp->num_of_streams; i++) {
 		asd = &isp->asd[i];
-		if (asd->streaming == ATOMISP_DEVICE_STREAMING_DISABLED &&
-		    !asd->acc.pipeline)
+		if (asd->streaming == ATOMISP_DEVICE_STREAMING_DISABLED)
 			continue;
 		for (j = 0; j < ATOMISP_INPUT_STREAM_NUM; j++) {
 			stream_env = &asd->stream_env[j];
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 69deeb55613f..725b3b1562b1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -626,12 +626,6 @@ unsigned int atomisp_streaming_count(struct atomisp_device *isp)
 
 unsigned int atomisp_is_acc_enabled(struct atomisp_device *isp)
 {
-	unsigned int i;
-
-	for (i = 0; i < isp->num_of_streams; i++)
-		if (isp->asd[i].acc.pipeline)
-			return 1;
-
 	return 0;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index f1e87c3a9dfa..f611fd47b85d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -323,7 +323,6 @@ struct atomisp_sub_device {
 	struct v4l2_ctrl *disable_dz;
 
 	struct {
-		struct ia_css_pipe *pipeline;
 		struct completion acc_done;
 	} acc;
 
-- 
2.36.0

