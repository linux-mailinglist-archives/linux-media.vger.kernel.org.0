Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4759054D31D
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348281AbiFOUwB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348322AbiFOUwA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:52:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9383D5522A
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326318;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6BIgMyXhfVQUaQhC8/a6If7VNwuYJub6OcZio2SXOwI=;
        b=TnyzzuDmsYaMI1BsY1WemWTgPU6dK3xS2bPVZvH83p2CIUFMv5ycQxv/BaJWB37xZNU4kn
        uF37+TKixiAUB4hXvZnt4qvYbCPm3bJwoVlKZBr5BPlKP9qlpnLHwaS06xJhwJHC7mlfgC
        gMmVdrWnMhxBEtbxRei/2/xYYyaBg84=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-PvWCZOA2O0iIrnRbIg4MHg-1; Wed, 15 Jun 2022 16:51:52 -0400
X-MC-Unique: PvWCZOA2O0iIrnRbIg4MHg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6576519705A8;
        Wed, 15 Jun 2022 20:51:51 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C98191131D;
        Wed, 15 Jun 2022 20:51:49 +0000 (UTC)
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
Subject: [PATCH v2 39/40] media: atomisp: remove force argument from __destroy_[stream[s]|pipe[s]]()
Date:   Wed, 15 Jun 2022 22:50:36 +0200
Message-Id: <20220615205037.16549-40-hdegoede@redhat.com>
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

The force argument to the __destroy_pipe[s]() and __destroy_stream[s]()
functions is always true. Remove the argument and remove the code necessary
to handle the false case.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_compat_css20.c  | 34 ++++++-------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index cc8bc3fd1f10..5aa108a1724c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -418,24 +418,14 @@ static void __dump_stream_config(struct atomisp_sub_device *asd,
 }
 
 static int __destroy_stream(struct atomisp_sub_device *asd,
-			    struct atomisp_stream_env *stream_env, bool force)
+			    struct atomisp_stream_env *stream_env)
 {
 	struct atomisp_device *isp = asd->isp;
-	int i;
 	unsigned long timeout;
 
 	if (!stream_env->stream)
 		return 0;
 
-	if (!force) {
-		for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++)
-			if (stream_env->update_pipe[i])
-				break;
-
-		if (i == IA_CSS_PIPE_ID_NUM)
-			return 0;
-	}
-
 	if (stream_env->stream_state == CSS_STREAM_STARTED
 	    && ia_css_stream_stop(stream_env->stream) != 0) {
 		dev_err(isp->dev, "stop stream failed.\n");
@@ -469,12 +459,12 @@ static int __destroy_stream(struct atomisp_sub_device *asd,
 	return 0;
 }
 
-static int __destroy_streams(struct atomisp_sub_device *asd, bool force)
+static int __destroy_streams(struct atomisp_sub_device *asd)
 {
 	int ret, i;
 
 	for (i = 0; i < ATOMISP_INPUT_STREAM_NUM; i++) {
-		ret = __destroy_stream(asd, &asd->stream_env[i], force);
+		ret = __destroy_stream(asd, &asd->stream_env[i]);
 		if (ret)
 			return ret;
 	}
@@ -529,21 +519,19 @@ static int __create_streams(struct atomisp_sub_device *asd)
 	return 0;
 rollback:
 	for (i--; i >= 0; i--)
-		__destroy_stream(asd, &asd->stream_env[i], true);
+		__destroy_stream(asd, &asd->stream_env[i]);
 	return ret;
 }
 
 static int __destroy_stream_pipes(struct atomisp_sub_device *asd,
-				  struct atomisp_stream_env *stream_env,
-				  bool force)
+				  struct atomisp_stream_env *stream_env)
 {
 	struct atomisp_device *isp = asd->isp;
 	int ret = 0;
 	int i;
 
 	for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++) {
-		if (!stream_env->pipes[i] ||
-		    !(force || stream_env->update_pipe[i]))
+		if (!stream_env->pipes[i])
 			continue;
 		if (ia_css_pipe_destroy(stream_env->pipes[i])
 		    != 0) {
@@ -557,7 +545,7 @@ static int __destroy_stream_pipes(struct atomisp_sub_device *asd,
 	return ret;
 }
 
-static int __destroy_pipes(struct atomisp_sub_device *asd, bool force)
+static int __destroy_pipes(struct atomisp_sub_device *asd)
 {
 	struct atomisp_device *isp = asd->isp;
 	int i;
@@ -571,7 +559,7 @@ static int __destroy_pipes(struct atomisp_sub_device *asd, bool force)
 			continue;
 		}
 
-		ret = __destroy_stream_pipes(asd, &asd->stream_env[i], force);
+		ret = __destroy_stream_pipes(asd, &asd->stream_env[i]);
 		if (ret)
 			return ret;
 	}
@@ -581,10 +569,10 @@ static int __destroy_pipes(struct atomisp_sub_device *asd, bool force)
 
 void atomisp_destroy_pipes_stream_force(struct atomisp_sub_device *asd)
 {
-	if (__destroy_streams(asd, true))
+	if (__destroy_streams(asd))
 		dev_warn(asd->isp->dev, "destroy stream failed.\n");
 
-	if (__destroy_pipes(asd, true))
+	if (__destroy_pipes(asd))
 		dev_warn(asd->isp->dev, "destroy pipe failed.\n");
 }
 
@@ -801,7 +789,7 @@ int atomisp_create_pipes_stream(struct atomisp_sub_device *asd)
 	ret = __create_streams(asd);
 	if (ret) {
 		dev_warn(asd->isp->dev, "create stream failed %d.\n", ret);
-		__destroy_pipes(asd, true);
+		__destroy_pipes(asd);
 		return ret;
 	}
 
-- 
2.36.0

