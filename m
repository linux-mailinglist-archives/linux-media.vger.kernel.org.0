Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37DD97016BC
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238948AbjEMMek (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238982AbjEMMef (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:34:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9660C3C06
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981168;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vkIlweMM4N006C44HWSmiWcdBnVdtyPt1tUgBBlhgjo=;
        b=IvazM+b+SZAZ5M2hGdkuSZGpqed2j/MX8blxkL3JHFGmc+FXW/Tn0rqInvs4DqrlkK45x5
        1P6/n61YXRAiBLo5shsrbZQwidTyJc738xnHjU3pS85e6M/NFVnv/QjXlsX1pQX/LlBZia
        q/f6T3q1h02P1knQL+Stb8Tz21WPT9U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-5J6LtHewMkyp2EDZgcC7GA-1; Sat, 13 May 2023 08:32:45 -0400
X-MC-Unique: 5J6LtHewMkyp2EDZgcC7GA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B13F580067D;
        Sat, 13 May 2023 12:32:44 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2C4D540C2076;
        Sat, 13 May 2023 12:32:43 +0000 (UTC)
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
Subject: [PATCH 24/30] media: atomisp: Rename atomisp_destroy_pipes_stream_force() to atomisp_destroy_pipes_stream()
Date:   Sat, 13 May 2023 14:31:53 +0200
Message-Id: <20230513123159.33234-25-hdegoede@redhat.com>
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

There now no longer is a non force version of
atomisp_destroy_pipes_stream_force() so having the _force postfix
no longer makes sense rename it to atomisp_destroy_pipes_stream().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat.h     |  2 +-
 .../staging/media/atomisp/pci/atomisp_compat_css20.c   | 10 +++++-----
 drivers/staging/media/atomisp/pci/atomisp_fops.c       |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index 850b354cc160..89ed1f7209f0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -215,7 +215,7 @@ int atomisp_css_input_configure_port(struct atomisp_sub_device *asd,
 				     unsigned int metadata_height);
 
 int atomisp_create_pipes_stream(struct atomisp_sub_device *asd);
-void atomisp_destroy_pipes_stream_force(struct atomisp_sub_device *asd);
+void atomisp_destroy_pipes_stream(struct atomisp_sub_device *asd);
 
 void atomisp_css_stop(struct atomisp_sub_device *asd,
 		      enum ia_css_pipe_id pipe_id, bool in_reset);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index cecdf111e14f..a04c16502cac 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -548,7 +548,7 @@ static int __destroy_pipes(struct atomisp_sub_device *asd)
 	return 0;
 }
 
-void atomisp_destroy_pipes_stream_force(struct atomisp_sub_device *asd)
+void atomisp_destroy_pipes_stream(struct atomisp_sub_device *asd)
 {
 	if (__destroy_streams(asd))
 		dev_warn(asd->isp->dev, "destroy stream failed.\n");
@@ -746,7 +746,7 @@ int atomisp_create_pipes_stream(struct atomisp_sub_device *asd)
 
 int atomisp_css_update_stream(struct atomisp_sub_device *asd)
 {
-	atomisp_destroy_pipes_stream_force(asd);
+	atomisp_destroy_pipes_stream(asd);
 	return atomisp_create_pipes_stream(asd);
 }
 
@@ -1034,7 +1034,7 @@ int atomisp_css_start(struct atomisp_sub_device *asd,
 	 * destroying all pipes.
 	 */
 	if (sp_is_started) {
-		atomisp_destroy_pipes_stream_force(asd);
+		atomisp_destroy_pipes_stream(asd);
 		ia_css_stop_sp();
 		atomisp_create_pipes_stream(asd);
 	}
@@ -1824,7 +1824,7 @@ void atomisp_css_stop(struct atomisp_sub_device *asd,
 	 * CSS 2.0 API limitation: ia_css_stop_sp() can only be called after
 	 * destroying all pipes.
 	 */
-	atomisp_destroy_pipes_stream_force(asd);
+	atomisp_destroy_pipes_stream(asd);
 
 	atomisp_init_raw_buffer_bitmap(asd);
 
@@ -2314,7 +2314,7 @@ static int __get_frame_info(struct atomisp_sub_device *asd,
 	return 0;
 
 get_info_err:
-	atomisp_destroy_pipes_stream_force(asd);
+	atomisp_destroy_pipes_stream(asd);
 	return -EINVAL;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index c7da5bfd93ae..223c5be072cc 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -614,7 +614,7 @@ static int atomisp_release(struct file *file)
 		isp->inputs[asd->input_curr].asd = NULL;
 	}
 
-	atomisp_destroy_pipes_stream_force(asd);
+	atomisp_destroy_pipes_stream(asd);
 
 	ret = v4l2_subdev_call(isp->flash, core, s_power, 0);
 	if (ret < 0 && ret != -ENODEV && ret != -ENOIOCTLCMD)
-- 
2.40.1

