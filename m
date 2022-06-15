Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD5A54D2F7
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347775AbiFOUv0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347681AbiFOUvY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:51:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3BB4354FB8
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326282;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u0suSRgIJudqJT2YaEZylJe3sxdlVX+RheglqTj5br8=;
        b=VQQmeS6qB8KFimjqRxMZ8IopNj98/byYxly8OMM82VYJ+Wo13wepEIKk7iZF6RajMpu1o4
        FD0s3fznM19WBNcaARK6KzscJAATq1RAy0NPEBUEviFaJl3A6OM9GcoSwtptHXqC+nbFBi
        OrGVbay1BEnOiQqiIi0weaM89bNEXO8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-lg8LEXA-OziYEOwb16hvGg-1; Wed, 15 Jun 2022 16:51:21 -0400
X-MC-Unique: lg8LEXA-OziYEOwb16hvGg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DB1F1C1C1B0;
        Wed, 15 Jun 2022 20:51:20 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E0D58111F5;
        Wed, 15 Jun 2022 20:51:18 +0000 (UTC)
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
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 22/40] media: atomisp: remove no longer used atomisp_css_acc_done() function
Date:   Wed, 15 Jun 2022 22:50:19 +0200
Message-Id: <20220615205037.16549-23-hdegoede@redhat.com>
In-Reply-To: <20220615205037.16549-1-hdegoede@redhat.com>
References: <20220615205037.16549-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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

