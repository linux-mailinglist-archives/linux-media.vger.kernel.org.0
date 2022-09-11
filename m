Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0889D5B502E
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 19:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiIKRRW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 13:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiIKRRS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 13:17:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B7B275E9
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 10:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662916636;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J5iR7juZJgcG1R1ZvNEhQoRssfdZh7eyl+m9qhu1VGY=;
        b=Z3saev2qFoChv3tNiwU+yvhLr4iLH5jdeqimjpbvi3kFa3vkPBrAnIpGVJ0bnBsfaiM8kQ
        Fg6VkSs80fnHgjZok38tSboWGwxaNwmFLZdls6dVl1SEvLvjPSOLTkCqsO2y+8EUziCcHM
        yand7HeculmiIYedfPY6+Oza17zIl8I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-gseBtkPTN-Ka5gLzb_oKZg-1; Sun, 11 Sep 2022 13:17:12 -0400
X-MC-Unique: gseBtkPTN-Ka5gLzb_oKZg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A383811E80;
        Sun, 11 Sep 2022 17:17:11 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1629B492C3B;
        Sun, 11 Sep 2022 17:17:09 +0000 (UTC)
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
Subject: [PATCH 08/17] media: atomisp: Rework asd->streaming state update in __atomisp_streamoff()
Date:   Sun, 11 Sep 2022 19:16:44 +0200
Message-Id: <20220911171653.568932-9-hdegoede@redhat.com>
In-Reply-To: <20220911171653.568932-1-hdegoede@redhat.com>
References: <20220911171653.568932-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

During the first __atomisp_streamoff() call on an asd with only one pipe
streaming asd->streaming would get set twice:

asd->streaming = ATOMISP_DEVICE_STREAMING_STOPPING;
asd->streaming = ATOMISP_DEVICE_STREAMING_DISABLED;

Rework the code a bit so that it gets set to the correct value
right away instead of doing this in 2 steps.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index daecdcdeb27c..899157584951 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1930,14 +1930,14 @@ int __atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	if (!pipe->capq.streaming)
 		return 0;
 
-	spin_lock_irqsave(&isp->lock, flags);
-	if (asd->streaming == ATOMISP_DEVICE_STREAMING_ENABLED) {
-		asd->streaming = ATOMISP_DEVICE_STREAMING_STOPPING;
+	if (asd->streaming == ATOMISP_DEVICE_STREAMING_ENABLED)
 		first_streamoff = true;
-	}
 
+	spin_lock_irqsave(&isp->lock, flags);
 	if (atomisp_subdev_streaming_count(asd) == 1)
 		asd->streaming = ATOMISP_DEVICE_STREAMING_DISABLED;
+	else
+		asd->streaming = ATOMISP_DEVICE_STREAMING_STOPPING;
 	spin_unlock_irqrestore(&isp->lock, flags);
 
 	if (!first_streamoff) {
-- 
2.37.3

