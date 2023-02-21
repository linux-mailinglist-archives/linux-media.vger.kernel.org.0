Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 654BA69E2E0
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 16:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234563AbjBUPA3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 10:00:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234519AbjBUPA1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 10:00:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203FCBDE8
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 06:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676991582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9d8J6Rd7lJIueXtSdRpXYS+6+vNgW3vrsqkU+Knn3Kc=;
        b=aBi1Ye90SB+B71hty6LEdBJZt76C9J7uVDJJniITTeC2S1pjo1iqDCKF0iB6LP935yn6xm
        R1TVwUv2lFauiWwNLJFELxUDKtsoyFcG0J5tsnFks5nuxidSvm97c2JLa55ebWH09WzmJl
        3ORS8d28j0ZIcmShPuZ/vrwW6EN57AI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591--6_bSAZIMe-89OhNccEKkw-1; Tue, 21 Feb 2023 09:59:36 -0500
X-MC-Unique: -6_bSAZIMe-89OhNccEKkw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8921101A52E;
        Tue, 21 Feb 2023 14:59:35 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.177])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 45F2F2026D4B;
        Tue, 21 Feb 2023 14:59:31 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 05/10] media: atomisp: Remove atomisp_css_enable_raw_binning()
Date:   Tue, 21 Feb 2023 15:59:01 +0100
Message-Id: <20230221145906.8113-6-hdegoede@redhat.com>
In-Reply-To: <20230221145906.8113-1-hdegoede@redhat.com>
References: <20230221145906.8113-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the now unused atomisp_css_enable_raw_binning() function.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_compat.h        |  3 ---
 .../media/atomisp/pci/atomisp_compat_css20.c  | 19 -------------------
 2 files changed, 22 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index 7316eb9f974a..06d54c9bcb49 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -196,9 +196,6 @@ void atomisp_css_input_set_two_pixels_per_clock(
     struct atomisp_sub_device *asd,
     bool two_ppc);
 
-void atomisp_css_enable_raw_binning(struct atomisp_sub_device *asd,
-				    bool enable);
-
 void atomisp_css_enable_dz(struct atomisp_sub_device *asd, bool enable);
 
 void atomisp_css_capture_set_mode(struct atomisp_sub_device *asd,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index accae44ad72b..914af04e9211 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1728,25 +1728,6 @@ void atomisp_css_input_set_two_pixels_per_clock(
 		.update_pipe[i] = true;
 }
 
-void atomisp_css_enable_raw_binning(struct atomisp_sub_device *asd,
-				    bool enable)
-{
-	struct atomisp_stream_env *stream_env =
-		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL];
-	unsigned int pipe;
-
-	if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO)
-		pipe = IA_CSS_PIPE_ID_VIDEO;
-	else
-		pipe = IA_CSS_PIPE_ID_PREVIEW;
-
-	stream_env->pipe_extra_configs[pipe].enable_raw_binning = enable;
-	stream_env->update_pipe[pipe] = true;
-	if (enable)
-		stream_env->pipe_configs[pipe].output_info[0].padded_width =
-		    stream_env->stream_config.input_config.effective_res.width;
-}
-
 void atomisp_css_enable_dz(struct atomisp_sub_device *asd, bool enable)
 {
 	int i;
-- 
2.39.1

