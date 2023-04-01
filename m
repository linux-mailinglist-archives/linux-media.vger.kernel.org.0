Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4A86D31B8
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjDAPAn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjDAPAl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:00:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C11B1DFB4
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 07:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361185;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Og6uNSnQQlIDTobQmVAXOXrC2T4+vgbrAVfQOLRwNyA=;
        b=QDwJOOJMWk6baPSIXCEyRtN68EtmVDETQ/QcPTScfaw1wGRZOsnU6ewhZlLjvydpJPQ9co
        PQ2UNk5dA4l6XXtahmNMQ56rrhD2hdBZbeukKArzddA6gFPR9RRle8EpLdTNaD2+N2UWY+
        WWmkGDN5nXLwVH9TtkZzBDW4ubrEzTE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-_FxapGy3O7OCe6RlxyH9pA-1; Sat, 01 Apr 2023 10:59:42 -0400
X-MC-Unique: _FxapGy3O7OCe6RlxyH9pA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5522185A78F;
        Sat,  1 Apr 2023 14:59:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 44E23400F59;
        Sat,  1 Apr 2023 14:59:40 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 03/28] media: atomisp: ov2680: Error handling fixes
Date:   Sat,  1 Apr 2023 16:59:01 +0200
Message-Id: <20230401145926.596216-4-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
References: <20230401145926.596216-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix s_stream error handling

Fix 3 error handling issues:

1. In ov2680_s_stream(), when pm_runtime_get_sync() fails it will still
   have incremented the pm-runtime reference count so we need to call
   pm_runtime_put()

2. In ov2680_s_stream() sensor->is_streaming should always be set to false
   when the sensor is powered-off even on i2c-communication errors.

3. In ov2680_probe(), call ov2680_remove() on ov2680_s_config() errors,
   so that pm_runtime_disable() is properly called to disable the
   runtime-pm which has been enabled before the ov2680_s_config() call.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 3181276ed027..63de214916f5 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -419,7 +419,7 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
 	if (enable) {
 		ret = pm_runtime_get_sync(sensor->sd.dev);
 		if (ret < 0)
-			goto error_unlock;
+			goto error_power_down;
 
 		ret = ov2680_set_mode(sensor);
 		if (ret)
@@ -447,6 +447,7 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
 
 error_power_down:
 	pm_runtime_put(sensor->sd.dev);
+	sensor->is_streaming = false;
 error_unlock:
 	mutex_unlock(&sensor->input_lock);
 	return ret;
@@ -644,8 +645,10 @@ static int ov2680_probe(struct i2c_client *client)
 	pm_runtime_use_autosuspend(dev);
 
 	ret = ov2680_s_config(&sensor->sd);
-	if (ret)
+	if (ret) {
+		ov2680_remove(client);
 		return ret;
+	}
 
 	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
-- 
2.39.1

