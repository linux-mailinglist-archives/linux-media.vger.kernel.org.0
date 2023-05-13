Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3FF7016B0
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238676AbjEMMe1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231736AbjEMMe0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:34:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FCC93AA6
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981156;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4qQC9AZk1hyB/CxFkDpkzzL8TjfgWZyDGsM1vODpQzw=;
        b=Q954ba6XWO0Oe+cuMhZTmq34m9BcBGqup6vCvP+tHU01iSHs9O+0CadDTpB4FQP158dfzI
        MuFcu/qiJcAFN5SrRN5thMcCI6CimErtCgrDWbiIoMU/wcJfnrJXrHzS7t26Ds5ptnGgQ/
        MS/JaoJihPNr/wUREpbvAwIOHqMjG/M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-omNpJGPbOJ-1ludP0wc_og-1; Sat, 13 May 2023 08:32:33 -0400
X-MC-Unique: omNpJGPbOJ-1ludP0wc_og-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58538857E60;
        Sat, 13 May 2023 12:32:32 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C8DFC40C2076;
        Sat, 13 May 2023 12:32:30 +0000 (UTC)
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
Subject: [PATCH 17/30] media: atomisp: Simplify atomisp_css_[start|stop]()
Date:   Sat, 13 May 2023 14:31:46 +0200
Message-Id: <20230513123159.33234-18-hdegoede@redhat.com>
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

Now that continuous mode is gone and we only have 1 /dev/video# node,
the videobuf2 core guarantees that atomisp_css_[start|stop]() will
only be called one at a time.

So there is no need for atomisp_streaming_count() counts.

When reqbufs has been done then the streams are guaranteed to be created,
and streaming cannot be started without reqbufs so there is no need for
atomisp_css_start() to check if it needs to create the streams.

Use this to clean-up atomisp_css_[start|stop]().

While at it also fix atomisp_css_start() not re-creating the streams
on an error, breaking the guarantee that the streams are always there
after a succesfull reqbufs call.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_compat_css20.c  | 68 ++++++-------------
 1 file changed, 20 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 43760fcc0d43..092262e1b7ec 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1001,42 +1001,17 @@ int atomisp_css_start(struct atomisp_sub_device *asd,
 		wbinvd();
 	}
 
-	/*
-	 * For dual steam case, it is possible that:
-	 * 1: for this stream, it is at the stage that:
-	 * - after set_fmt is called
-	 * - before stream on is called
-	 * 2: for the other stream, the stream off is called which css reset
-	 * has been done.
-	 *
-	 * Thus the stream created in set_fmt get destroyed and need to be
-	 * recreated in the next stream on.
-	 */
-	if (!asd->stream_prepared) {
-		ret = atomisp_create_pipes_stream(asd);
-		if (ret)
-			return ret;
-	}
-	/*
-	 * SP can only be started one time
-	 * if atomisp_subdev_streaming_count() tell there already has some
-	 * subdev at streamming, then SP should already be started previously,
-	 * so need to skip start sp procedure
-	 */
-	if (atomisp_streaming_count(isp)) {
-		dev_dbg(isp->dev, "skip start sp\n");
-	} else {
-		if (!sh_css_hrt_system_is_idle())
-			dev_err(isp->dev, "CSS HW not idle before starting SP\n");
-		if (ia_css_start_sp()) {
-			dev_err(isp->dev, "start sp error.\n");
-			ret = -EINVAL;
-			goto start_err;
-		} else {
-			sp_is_started = true;
-		}
+	if (!sh_css_hrt_system_is_idle())
+		dev_err(isp->dev, "CSS HW not idle before starting SP\n");
+
+	if (ia_css_start_sp()) {
+		dev_err(isp->dev, "start sp error.\n");
+		ret = -EINVAL;
+		goto start_err;
 	}
 
+	sp_is_started = true;
+
 	for (i = 0; i < ATOMISP_INPUT_STREAM_NUM; i++) {
 		if (asd->stream_env[i].stream) {
 			if (ia_css_stream_start(asd->stream_env[i]
@@ -1054,16 +1029,15 @@ int atomisp_css_start(struct atomisp_sub_device *asd,
 	return 0;
 
 start_err:
-	atomisp_destroy_pipes_stream_force(asd);
-
-	/* css 2.0 API limitation: ia_css_stop_sp() could be only called after
-	 * destroy all pipes
-	 */
 	/*
-	 * SP can not be stop if other streams are in use
+	 * CSS 2.0 API limitation: ia_css_stop_sp() can only be called after
+	 * destroying all pipes.
 	 */
-	if ((atomisp_streaming_count(isp) == 0) && sp_is_started)
+	if (sp_is_started) {
+		atomisp_destroy_pipes_stream_force(asd);
 		ia_css_stop_sp();
+		atomisp_create_pipes_stream(asd);
+	}
 
 	return ret;
 }
@@ -1843,20 +1817,18 @@ int atomisp_css_input_configure_port(
 void atomisp_css_stop(struct atomisp_sub_device *asd,
 		      enum ia_css_pipe_id pipe_id, bool in_reset)
 {
-	struct atomisp_device *isp = asd->isp;
 	unsigned long irqflags;
 	unsigned int i;
 
-	/* if is called in atomisp_reset(), force destroy streams and pipes */
+	/*
+	 * CSS 2.0 API limitation: ia_css_stop_sp() can only be called after
+	 * destroying all pipes.
+	 */
 	atomisp_destroy_pipes_stream_force(asd);
 
 	atomisp_init_raw_buffer_bitmap(asd);
 
-	/*
-	 * SP can not be stop if other streams are in use
-	 */
-	if (atomisp_streaming_count(isp) == 0)
-		ia_css_stop_sp();
+	ia_css_stop_sp();
 
 	if (!in_reset) {
 		struct atomisp_stream_env *stream_env;
-- 
2.40.1

