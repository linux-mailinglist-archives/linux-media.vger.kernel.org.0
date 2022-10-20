Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C42A606931
	for <lists+linux-media@lfdr.de>; Thu, 20 Oct 2022 21:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbiJTTz6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Oct 2022 15:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbiJTTz4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Oct 2022 15:55:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C16651057FD
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 12:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666295755;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ilOvCV9hI+oLEULT7HJL/2M26nM1vm48TMXZUfrIkbc=;
        b=jCqSq79w9nlK1lKy05ZKwvqoNhw05jasyoeDRPesYEJSp7dgSPkS3JLRGjNx6zOXQ5C7QJ
        y0HPYeIuUnO1Uuyg1NZdeX+91LIQ4c+jnCE8PqQziyMD8uxpCAgu0g4tSFQRRHOlyWnjwJ
        PHF26OStP1yxiCiN4qx0rcJ89eBU0GA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-sCYHQbowMKWf6GSy8bpzbQ-1; Thu, 20 Oct 2022 15:55:49 -0400
X-MC-Unique: sCYHQbowMKWf6GSy8bpzbQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43AB685A583;
        Thu, 20 Oct 2022 19:55:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.86])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B2F6E40C6EC2;
        Thu, 20 Oct 2022 19:55:47 +0000 (UTC)
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
Subject: [PATCH v2 05/17] media: atomisp: Remove unused atomisp_buffers_queued[_pipe] functions
Date:   Thu, 20 Oct 2022 21:55:21 +0200
Message-Id: <20221020195533.114049-6-hdegoede@redhat.com>
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

The atomisp_buffers_queued[_pipe] functions are not used anywhere,
remove them.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 15 ---------------
 drivers/staging/media/atomisp/pci/atomisp_cmd.h |  4 ----
 2 files changed, 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index c72d0e344671..0d3a4ff99730 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -640,21 +640,6 @@ void atomisp_clear_css_buffer_counters(struct atomisp_sub_device *asd)
 	asd->video_out_video_capture.buffers_in_css = 0;
 }
 
-/* ISP2400 */
-bool atomisp_buffers_queued(struct atomisp_sub_device *asd)
-{
-	return asd->video_out_capture.buffers_in_css ||
-	       asd->video_out_vf.buffers_in_css ||
-	       asd->video_out_preview.buffers_in_css ||
-	       asd->video_out_video_capture.buffers_in_css;
-}
-
-/* ISP2401 */
-bool atomisp_buffers_queued_pipe(struct atomisp_video_pipe *pipe)
-{
-	return pipe->buffers_in_css ? true : false;
-}
-
 /* 0x100000 is the start of dmem inside SP */
 #define SP_DMEM_BASE	0x100000
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index c9f92f1326b6..fc1cfda718e1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -57,10 +57,6 @@ struct atomisp_video_pipe *atomisp_to_video_pipe(struct video_device *dev);
 int atomisp_reset(struct atomisp_device *isp);
 void atomisp_flush_bufs_and_wakeup(struct atomisp_sub_device *asd);
 void atomisp_clear_css_buffer_counters(struct atomisp_sub_device *asd);
-/* ISP2400 */
-bool atomisp_buffers_queued(struct atomisp_sub_device *asd);
-/* ISP2401 */
-bool atomisp_buffers_queued_pipe(struct atomisp_video_pipe *pipe);
 
 /* Interrupt functions */
 void atomisp_msi_irq_init(struct atomisp_device *isp);
-- 
2.37.3

