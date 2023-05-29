Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57E307147F9
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 12:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbjE2KjZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 06:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231517AbjE2KjS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 06:39:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97482D2
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 03:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685356684;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9TMX2wuU13sPsUh5Oacj0V3W2zTJoY4+4aKEz04p00k=;
        b=A8AmqkdXHs3BDPfcjqS3iGPTn0BPdqJPHUrafW7Fw3Kdz1qxyvV9ej3408SjeSYGEJzIKq
        UeRc8R7RWYejPK48/x/ViSifO4pJMLVSCYlt3iLCIUNjhLjl/islXCtuQUZJhgNgTnKCuR
        /2vnYJYJz9aG3pWe+9FDXwvNhkH7hk0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-Weiyz4KEP_2aQI-htXrXiQ-1; Mon, 29 May 2023 06:38:01 -0400
X-MC-Unique: Weiyz4KEP_2aQI-htXrXiQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBC558007D9;
        Mon, 29 May 2023 10:38:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4414A2166B2B;
        Mon, 29 May 2023 10:37:59 +0000 (UTC)
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
Subject: [PATCH 05/21] media: atomisp: ov2680: Add init_cfg pad-op
Date:   Mon, 29 May 2023 12:37:25 +0200
Message-Id: <20230529103741.11904-6-hdegoede@redhat.com>
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

Having an init_cfg to initialize the passed in subdev-state is
important to make which == V4L2_SUBDEV_FORMAT_TRY ops work when
userspace is talking to a /dev/v4l2-subdev# node.

Copy the ov2680_init_cfg() from the standard drivers/media/i2c/ov2680.c
driver.

This is esp. relevant once support for cropping is added where
the v4l2_subdev_state.pads[pad].try_crop rectangle needs to be set
correctly for set_fmt which == V4L2_SUBDEV_FORMAT_TRY calls to work.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/i2c/atomisp-ov2680.c   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 6cbc470bce91..17fb773540e5 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -357,6 +357,21 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov2680_init_cfg(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
+		: V4L2_SUBDEV_FORMAT_ACTIVE,
+		.format = {
+			.width = 800,
+			.height = 600,
+		}
+	};
+
+	return ov2680_set_fmt(sd, sd_state, &fmt);
+}
+
 static int ov2680_detect(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
@@ -537,6 +552,7 @@ static const struct v4l2_subdev_sensor_ops ov2680_sensor_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov2680_pad_ops = {
+	.init_cfg = ov2680_init_cfg,
 	.enum_mbus_code = ov2680_enum_mbus_code,
 	.enum_frame_size = ov2680_enum_frame_size,
 	.enum_frame_interval = ov2680_enum_frame_interval,
-- 
2.40.1

