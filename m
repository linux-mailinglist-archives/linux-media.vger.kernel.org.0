Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95C5772187D
	for <lists+linux-media@lfdr.de>; Sun,  4 Jun 2023 18:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231754AbjFDQPM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Jun 2023 12:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232011AbjFDQPK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Jun 2023 12:15:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FAB7DC
        for <linux-media@vger.kernel.org>; Sun,  4 Jun 2023 09:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685895260;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RgqWZJY1gtiF9VOC9b6KBuvHjPw32HL9s7xBsjtjjiw=;
        b=RzyJSxMrWJfgv4mJUsUSyIpZUoLqVFMNMS3Ks78TsUAQOrPS5EMC5gWP7YcUspNPBYhtCV
        dTEAgI49ElI1gtxCJTo5Z2g2Gd1l2Gw/zJFQNOGZFXbOQyWSH2AdtyZ1oitf+nwUmsfXd0
        fqbx73V8uMmJ7cuxSRPPniJnc+AYntc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-C3-XVopoNfKFSlB8yTQueg-1; Sun, 04 Jun 2023 12:14:16 -0400
X-MC-Unique: C3-XVopoNfKFSlB8yTQueg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58C32101A52C;
        Sun,  4 Jun 2023 16:14:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.9])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C51E5492B00;
        Sun,  4 Jun 2023 16:14:13 +0000 (UTC)
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
Subject: [PATCH 1/5] media: atomisp: Stop resetting selected input to 0 between /dev/video# opens
Date:   Sun,  4 Jun 2023 18:14:02 +0200
Message-Id: <20230604161406.69369-2-hdegoede@redhat.com>
In-Reply-To: <20230604161406.69369-1-hdegoede@redhat.com>
References: <20230604161406.69369-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

No other V4L2 driver resets the selected input (front cam or back cam
selected in case of the atomisp).

Stop resetting selected input to 0 between /dev/video# opens.

This allows e.g. using v4l2-ctl -i to switch the input before starting
another app, which is useful since most apps don't support selecting
the input.

Note more in general the whole resetting of a bunch of internal
state from the open fop needs to be removed there to allow multiple
opens of /dev/video# for full v4l2 API compliance.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 36e441dce7d5..54466d2f323a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -474,9 +474,6 @@ static void atomisp_subdev_init_struct(struct atomisp_sub_device *asd)
 	/* s3a grid not enabled for any pipe */
 	asd->params.s3a_enabled_pipe = IA_CSS_PIPE_ID_NUM;
 
-	/* Add for channel */
-	asd->input_curr = 0;
-
 	asd->copy_mode = false;
 
 	asd->stream_prepared = false;
-- 
2.40.1

