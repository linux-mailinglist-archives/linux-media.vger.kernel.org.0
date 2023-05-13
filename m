Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12E9C70169F
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238353AbjEMMdq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238330AbjEMMdp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:33:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C011B35B8
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981144;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DapL5BRvh+yWg9dp4bmdu30CsoBCEbuaDPr4vxVl/WM=;
        b=UfxhrJEVllQEEWa4KqtHv30Nx0LAcmofzGSjOBdyRz6T777ZCvC7dADdEAhpSOX+8Lhazl
        JcoeKNpi9BwyhW4673nJbrhxPB2+C56h9M3JnU66SqawJDsOhbyZC9HPWOfnRQq9uql2du
        95Vq24KoLrQecM2I/mbQ4m0s4DOmZAE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364--unlTPw1Nayf8-yjYlPkFw-1; Sat, 13 May 2023 08:32:20 -0400
X-MC-Unique: -unlTPw1Nayf8-yjYlPkFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0741A29AA3B0;
        Sat, 13 May 2023 12:32:20 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 72B8340C2076;
        Sat, 13 May 2023 12:32:18 +0000 (UTC)
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
Subject: [PATCH 10/30] media: atomisp: Remove 1 line atomisp_flush_bufs_and_wakeup() helper
Date:   Sat, 13 May 2023 14:31:39 +0200
Message-Id: <20230513123159.33234-11-hdegoede@redhat.com>
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

After recent changes this now is just a wrapper around
atomisp_flush_video_pipe(). Make its single caller call
atomisp_flush_video_pipe() directly and drop the helper.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 8 +-------
 drivers/staging/media/atomisp/pci/atomisp_cmd.h | 1 -
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3dcf81e431cb..42a2a8f0da06 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -640,12 +640,6 @@ void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, enum vb2_buffer_s
 	spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
 }
 
-/* Returns queued buffers back to video-core */
-void atomisp_flush_bufs_and_wakeup(struct atomisp_sub_device *asd)
-{
-	atomisp_flush_video_pipe(&asd->video_out, VB2_BUF_STATE_ERROR, false);
-}
-
 /* clean out the parameters that did not apply */
 void atomisp_flush_params_queue(struct atomisp_video_pipe *pipe)
 {
@@ -1029,7 +1023,7 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 		 * dequeueing buffers is not needed. CSS will recycle
 		 * buffers that it has.
 		 */
-		atomisp_flush_bufs_and_wakeup(&isp->asd);
+		atomisp_flush_video_pipe(&isp->asd.video_out, VB2_BUF_STATE_ERROR, false);
 
 		/* Requeue unprocessed per-frame parameters. */
 		atomisp_recover_params_queue(&isp->asd.video_out);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index cbe2f48d3dfa..1cb973ddf2dc 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -59,7 +59,6 @@ int atomisp_buffers_in_css(struct atomisp_video_pipe *pipe);
 void atomisp_buffer_done(struct ia_css_frame *frame, enum vb2_buffer_state state);
 void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, enum vb2_buffer_state state,
 			      bool warn_on_css_frames);
-void atomisp_flush_bufs_and_wakeup(struct atomisp_sub_device *asd);
 void atomisp_clear_css_buffer_counters(struct atomisp_sub_device *asd);
 
 /* Interrupt functions */
-- 
2.40.1

