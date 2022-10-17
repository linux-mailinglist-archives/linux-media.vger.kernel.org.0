Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38032600948
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 10:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbiJQIxL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 04:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbiJQIwz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 04:52:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B95E46D92
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 01:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665996744;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=W5AfnCvIPYxPgEN9hAaGD5HXf9969B0k37l0uWB8gF4=;
        b=OGn9ryiSMIDgG9+rokngsNWRgRm639Eju59kYPZK24PwfSe6JIUjB81hB6AfJxTpFg7YlR
        DG45KGEtPCRzsoNGrL3XN6lmWYY+OBzTADLJJC8iXKzMhExqWy6scd0dHborzZhBrHhJJO
        FHY5SGhr9p1XTIdI+cF8VaqehiDWa0Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-hbVI1jLPPNizxRMspn-z4A-1; Mon, 17 Oct 2022 04:52:23 -0400
X-MC-Unique: hbVI1jLPPNizxRMspn-z4A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C53A857AA0;
        Mon, 17 Oct 2022 08:52:12 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.44])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EBA1F10A58CF;
        Mon, 17 Oct 2022 08:52:01 +0000 (UTC)
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
Subject: [PATCH 17/17] media: atomisp: gc0310: Power on sensor from set_fmt() callback
Date:   Mon, 17 Oct 2022 10:50:57 +0200
Message-Id: <20221017085057.7483-18-hdegoede@redhat.com>
In-Reply-To: <20221017085057.7483-1-hdegoede@redhat.com>
References: <20221017085057.7483-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Depending on which order userspace makes various v4l2 calls, the sensor
might still be powered down when set_fmt is called.

What should really happen here is delay the writing of the mode-related
registers till streaming is started, but for now use the same quick fix
as the atomisp_ov2680 code and call power_up() from set_fmt() in
combination with keeping track of the power-state to avoid doing the
power-up sequence twice.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 14 ++++++++++++--
 drivers/staging/media/atomisp/i2c/gc0310.h         |  1 +
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index cbc8b1d91995..45338abb0973 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -786,8 +786,6 @@ static int gpio_ctrl(struct v4l2_subdev *sd, bool flag)
 	return ret;
 }
 
-static int power_down(struct v4l2_subdev *sd);
-
 static int power_up(struct v4l2_subdev *sd)
 {
 	struct gc0310_device *dev = to_gc0310_sensor(sd);
@@ -800,6 +798,9 @@ static int power_up(struct v4l2_subdev *sd)
 		return -ENODEV;
 	}
 
+	if (dev->power_on)
+		return 0; /* Already on */
+
 	/* power control */
 	ret = power_ctrl(sd, 1);
 	if (ret)
@@ -820,6 +821,7 @@ static int power_up(struct v4l2_subdev *sd)
 
 	msleep(100);
 
+	dev->power_on = true;
 	return 0;
 
 fail_gpio:
@@ -844,6 +846,9 @@ static int power_down(struct v4l2_subdev *sd)
 		return -ENODEV;
 	}
 
+	if (!dev->power_on)
+		return 0; /* Already off */
+
 	/* gpio ctrl */
 	ret = gpio_ctrl(sd, 0);
 	if (ret) {
@@ -861,6 +866,7 @@ static int power_down(struct v4l2_subdev *sd)
 	if (ret)
 		dev_err(&client->dev, "vprog failed.\n");
 
+	dev->power_on = false;
 	return ret;
 }
 
@@ -935,6 +941,9 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
 		return 0;
 	}
 
+	/* s_power has not been called yet for std v4l2 clients (camorama) */
+	power_up(sd);
+
 	dev_dbg(&client->dev, "%s: before gc0310_write_reg_array %s\n",
 		__func__, dev->res->desc);
 	ret = startup(sd);
@@ -1073,6 +1082,7 @@ static int gc0310_s_config(struct v4l2_subdev *sd,
 	 * as first power on by board may not fulfill the
 	 * power on sequqence needed by the module
 	 */
+	dev->power_on = true; /* force power_down() to run */
 	ret = power_down(sd);
 	if (ret) {
 		dev_err(&client->dev, "gc0310 power-off err.\n");
diff --git a/drivers/staging/media/atomisp/i2c/gc0310.h b/drivers/staging/media/atomisp/i2c/gc0310.h
index db643ebc3909..4b9ce681bd93 100644
--- a/drivers/staging/media/atomisp/i2c/gc0310.h
+++ b/drivers/staging/media/atomisp/i2c/gc0310.h
@@ -152,6 +152,7 @@ struct gc0310_device {
 	int vt_pix_clk_freq_mhz;
 	struct gc0310_resolution *res;
 	u8 type;
+	bool power_on;
 };
 
 enum gc0310_tok_type {
-- 
2.37.3

