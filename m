Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7B57147F5
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 12:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbjE2Kir (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 06:38:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbjE2Kin (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 06:38:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4830CCD
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 03:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685356683;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pQ5ls5ttIsM7XFmyxZy3dzVMD6iAvyK5KCgN+W4YE+s=;
        b=FeHdgTN9u+UcYoPTG3fg1KKrvjLnKXbRTROeG+QpPRf9Ao2DXm2aeDr6o1R5QlJOMaRLRW
        HQqd+UQPKm7TesGNCOpizSujLcotCP8qEuN/8TDHlU8NWlyXXAUqX/iYa4FKsxJAY85xFC
        JK6eXcORkbRV9F9NmhbtNfJR9nq6ka8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-Dqofvci_M_ej8c3TySuSBA-1; Mon, 29 May 2023 06:37:59 -0400
X-MC-Unique: Dqofvci_M_ej8c3TySuSBA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FD9C38184E5;
        Mon, 29 May 2023 10:37:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7C7152166B2B;
        Mon, 29 May 2023 10:37:57 +0000 (UTC)
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
Subject: [PATCH 04/21] media: atomisp: ov2680: Add missing ov2680_calc_mode() call to probe()
Date:   Mon, 29 May 2023 12:37:24 +0200
Message-Id: <20230529103741.11904-5-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-1-hdegoede@redhat.com>
References: <20230529103741.11904-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Call ov2680_calc_mode() from probe() instead of relying on userspace
to make at least one s_fmt call to fill the mode parameters.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 8bcfa5ae2ea0..6cbc470bce91 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -195,8 +195,10 @@ static void ov2680_fill_format(struct ov2680_dev *sensor,
 	ov2680_set_bayer_order(sensor, fmt);
 }
 
-static void ov2680_calc_mode(struct ov2680_dev *sensor, int width, int height)
+static void ov2680_calc_mode(struct ov2680_dev *sensor)
 {
+	int width = sensor->mode.fmt.width;
+	int height = sensor->mode.fmt.height;
 	int orig_width = width;
 	int orig_height = height;
 
@@ -338,7 +340,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 		return 0;
 
 	mutex_lock(&sensor->lock);
-	ov2680_calc_mode(sensor, fmt->width, fmt->height);
+	ov2680_calc_mode(sensor);
 	mutex_unlock(&sensor->lock);
 	return 0;
 }
@@ -660,6 +662,7 @@ static int ov2680_probe(struct i2c_client *client)
 	}
 
 	ov2680_fill_format(sensor, &sensor->mode.fmt, OV2680_NATIVE_WIDTH, OV2680_NATIVE_HEIGHT);
+	ov2680_calc_mode(sensor);
 
 	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
 	if (ret) {
-- 
2.40.1

