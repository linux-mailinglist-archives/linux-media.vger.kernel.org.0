Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C344549FD0
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244777AbiFMUpv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242821AbiFMUob (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:44:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BC87117E1D
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149944;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fWw8SdHuZ2LXCO9Fh9Kuq3IJ6S020mmRixqNYtYJ8EQ=;
        b=d2f8+WJashNIJ/kOZWgmbEg2y2z3b0miNmMsVtw8Ym64ml0bfNWf+Wd1i8cPJFNFwVpZZS
        Gf38NQGQeQfmXI9xLqMG7+qsrK6SmJRK0sDiIs8Nkg7I98swR7Q2o4NmZYDSgVl4kxIgjS
        k3hxmCTl1FEhjXqL0pYa0NTa0yb65pk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-9eOp9qEGMPmJgxhk4TYoAQ-1; Mon, 13 Jun 2022 15:52:19 -0400
X-MC-Unique: 9eOp9qEGMPmJgxhk4TYoAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE6A7801E6B;
        Mon, 13 Jun 2022 19:52:18 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 711262166B26;
        Mon, 13 Jun 2022 19:52:17 +0000 (UTC)
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
Subject: [PATCH 22/40] media: atomisp: remove no longer used atomisp_css_acc_done() function
Date:   Mon, 13 Jun 2022 21:51:19 +0200
Message-Id: <20220613195137.8117-23-hdegoede@redhat.com>
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

atomisp_css_acc_done() is no longer used anywhere, remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat.h       | 2 --
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 5 -----
 drivers/staging/media/atomisp/pci/atomisp_subdev.h       | 4 ----
 3 files changed, 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index 07569f47498d..809f1a8c9974 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -442,8 +442,6 @@ int atomisp_css_get_dis_stat(struct atomisp_sub_device *asd,
 
 int atomisp_css_update_stream(struct atomisp_sub_device *asd);
 
-void atomisp_css_acc_done(struct atomisp_sub_device *asd);
-
 struct atomisp_acc_fw;
 int atomisp_css_set_acc_parameters(struct atomisp_acc_fw *acc_fw);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 646404a71d18..6e91654ce5da 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -3823,11 +3823,6 @@ void atomisp_css_set_cont_prev_start_time(struct atomisp_device *isp,
 	return;
 }
 
-void atomisp_css_acc_done(struct atomisp_sub_device *asd)
-{
-	complete(&asd->acc.acc_done);
-}
-
 /* Set the ACC binary arguments */
 int atomisp_css_set_acc_parameters(struct atomisp_acc_fw *acc_fw)
 {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index f611fd47b85d..798a93793a9a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -322,10 +322,6 @@ struct atomisp_sub_device {
 
 	struct v4l2_ctrl *disable_dz;
 
-	struct {
-		struct completion acc_done;
-	} acc;
-
 	struct atomisp_subdev_params params;
 
 	struct atomisp_stream_env stream_env[ATOMISP_INPUT_STREAM_NUM];
-- 
2.36.0

