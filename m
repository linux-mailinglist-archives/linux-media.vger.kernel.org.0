Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06C705B5031
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 19:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbiIKRR1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 13:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiIKRRY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 13:17:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40637275E9
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 10:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662916642;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lEQnqIQny/mQCoLh9YYX3NNL3pR9s0X8VmVV8xmIkGA=;
        b=V2QSs1Dv+aCukD7L8tjo+6B6FrOYQEfUvvbnBhFJzil16SC/zVOImsb530UDVrPmxs1Evm
        J/oWJ1/ZfLIbuJYtzV1Ce08vgTavVGCIMTfIaK3xPix6V4VhM2e1nIFKOOr/Sp5hQwQ8jP
        3/2UkEiN0QGWiuavrpDQbgA/WHAJK9g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-syip23HZNfK6Nxc8kgF3Wg-1; Sun, 11 Sep 2022 13:17:19 -0400
X-MC-Unique: syip23HZNfK6Nxc8kgF3Wg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FC123C025C8;
        Sun, 11 Sep 2022 17:17:18 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DFC56492C3B;
        Sun, 11 Sep 2022 17:17:16 +0000 (UTC)
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
Subject: [PATCH 12/17] media: atomisp: Drop unnecessary first_streamoff check
Date:   Sun, 11 Sep 2022 19:16:48 +0200
Message-Id: <20220911171653.568932-13-hdegoede@redhat.com>
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

Drop an unnecessary first_streamoff check from atomisp_streamoff(),
above the check there is a:

	if (!first_streamoff)
		goto stop_sensor;

Code block which will jump over the code with the test, so the test
is only executed when first_streamoff is true and therefor the test
is not necessary.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index ed3ec603a713..77c0d55ab409 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1880,10 +1880,10 @@ int atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 		cancel_work_sync(&asd->delayed_init_work);
 		asd->delayed_init = ATOMISP_DELAYED_INIT_NOT_QUEUED;
 	}
-	if (first_streamoff) {
-		css_pipe_id = atomisp_get_css_pipe_id(asd);
-		atomisp_css_stop(asd, css_pipe_id, false);
-	}
+
+	css_pipe_id = atomisp_get_css_pipe_id(asd);
+	atomisp_css_stop(asd, css_pipe_id, false);
+
 	/* cancel work queue*/
 	if (asd->video_out_capture.users) {
 		capture_pipe = &asd->video_out_capture;
-- 
2.37.3

