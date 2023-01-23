Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1392A677BB8
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbjAWMxG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:53:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231529AbjAWMxF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:53:05 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7183A97
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478338;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZB/ISPaSIj9SIRxYCE7mVvFn8pcCnYATENe+7tfG6AU=;
        b=aivVQnF70ne9UOxzbukKboc1agZLrdEbpyyCTXj5Rw2s2j3J7cdSEjntfz15/OIWQL6hX7
        1L8JfCgrV7k7yNtBlbzm8rTwmh6e4G0AAzkoj2Yzj573KjoqluF9FLSQF7G28VRNjLieKO
        x3NVEBFHP6d2GyUSJyT1SH2MQrGmL4E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-Ef0s4yufOy6eoN1_SZ7x1Q-1; Mon, 23 Jan 2023 07:52:16 -0500
X-MC-Unique: Ef0s4yufOy6eoN1_SZ7x1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 148223C02533;
        Mon, 23 Jan 2023 12:52:16 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7AAEDC15BAD;
        Mon, 23 Jan 2023 12:52:13 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 02/57] media: atomisp: use vb2_start_streaming_called()
Date:   Mon, 23 Jan 2023 13:51:10 +0100
Message-Id: <20230123125205.622152-3-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil@xs4all.nl>

Don't touch q->start_streaming_called directly, use the
vb2_start_streaming_called() function instead.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Link: https://lore.kernel.org/r/bc6c24ec-72ea-64a1-9061-311cc7339827@xs4all.nl
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index cb01ba65c88f..4f35e8f8250a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -636,10 +636,10 @@ static int atomisp_enum_input(struct file *file, void *fh,
 static unsigned int
 atomisp_subdev_streaming_count(struct atomisp_sub_device *asd)
 {
-	return asd->video_out_preview.vb_queue.start_streaming_called
-	       + asd->video_out_capture.vb_queue.start_streaming_called
-	       + asd->video_out_video_capture.vb_queue.start_streaming_called
-	       + asd->video_out_vf.vb_queue.start_streaming_called;
+	return vb2_start_streaming_called(&asd->video_out_preview.vb_queue) +
+	       vb2_start_streaming_called(&asd->video_out_capture.vb_queue) +
+	       vb2_start_streaming_called(&asd->video_out_video_capture.vb_queue) +
+	       vb2_start_streaming_called(&asd->video_out_vf.vb_queue);
 }
 
 unsigned int atomisp_streaming_count(struct atomisp_device *isp)
-- 
2.39.0

