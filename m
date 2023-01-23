Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75A08677BC8
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:53:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbjAWMxl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:53:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbjAWMxk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:53:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1177B10418
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478380;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VrU0rsbYpaz4Bk5O8TbzzS2vAsX/4ylVYGmmg72h8no=;
        b=eZ/qNpwlaj9Kj//LmpmOVChAnn7CF42DLT9kr5eXRvfjJk6bt9B9JMc1xlpKDiAX7xebDA
        BA8OM9EpOTMFF/CJI5aBY6/S/qM2Lnnjg2cutrpqHKwVMz+BxKsOBVIWEIG8vHn8qq6FnW
        Bu6B+Eu8qiVbPJAr5vn6szOWU6xpDR0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-5Kxs0s22NKuGO036itcfUw-1; Mon, 23 Jan 2023 07:52:55 -0500
X-MC-Unique: 5Kxs0s22NKuGO036itcfUw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4807418A6460;
        Mon, 23 Jan 2023 12:52:55 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C8AD9C15BAD;
        Mon, 23 Jan 2023 12:52:52 +0000 (UTC)
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
Subject: [PATCH 16/57] media: atomisp: Remove unnecessary memset(foo, 0, sizeof(foo)) calls
Date:   Mon, 23 Jan 2023 13:51:24 +0100
Message-Id: <20230123125205.622152-17-hdegoede@redhat.com>
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

The memory for all of struct atomisp_video_pipe is kzalloc()-ed in
atomisp_subdev_init() so there is no need to memset parts of
struct atomisp_video_pipe to 0.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index c32db4ffb778..eb8f319fca5c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -1054,11 +1054,6 @@ static int atomisp_init_subdev_pipe(struct atomisp_sub_device *asd,
 	INIT_LIST_HEAD(&pipe->activeq);
 	INIT_LIST_HEAD(&pipe->buffers_waiting_for_param);
 	INIT_LIST_HEAD(&pipe->per_frame_params);
-	memset(pipe->frame_request_config_id,
-	       0, VIDEO_MAX_FRAME * sizeof(unsigned int));
-	memset(pipe->frame_params,
-	       0, VIDEO_MAX_FRAME *
-	       sizeof(struct atomisp_css_params_with_list *));
 
 	return 0;
 }
-- 
2.39.0

