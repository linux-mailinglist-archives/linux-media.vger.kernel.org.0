Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12FDB4E83BF
	for <lists+linux-media@lfdr.de>; Sat, 26 Mar 2022 20:25:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234705AbiCZT0n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Mar 2022 15:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231621AbiCZT0n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Mar 2022 15:26:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A1A5815B063
        for <linux-media@vger.kernel.org>; Sat, 26 Mar 2022 12:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1648322699;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ykDXlOPk2TFsdn08fWycm9GIyujKbG9G/UkGWmpaTzI=;
        b=Xt43SD9KF2LDdjwItAtOn784ezA4hYi/twLdTJAAMc/gAdYG8lveFHuZwbcZGdoF4kkLjG
        u4Sp8B3w/PFlmQn6Yd95JYqXXe/VqO5C3rqcVBQabFn9Zn0d0R+ipZ6q6t7XE/F4GORkVW
        nklNsPv2hnJc7gSMsPTgorJtB4tw45E=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-N1bwjo0aNaK_u_koXm0NlQ-1; Sat, 26 Mar 2022 15:24:58 -0400
X-MC-Unique: N1bwjo0aNaK_u_koXm0NlQ-1
Received: by mail-qv1-f70.google.com with SMTP id fw9-20020a056214238900b0043522aa5b81so8324107qvb.21
        for <linux-media@vger.kernel.org>; Sat, 26 Mar 2022 12:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ykDXlOPk2TFsdn08fWycm9GIyujKbG9G/UkGWmpaTzI=;
        b=m3oObnEdb6+iK8YC/TmjNR/EKKtsz79bo3wg/6viptdRyrhjM1DKFJb3UiMU9N2EiD
         PCQ8APne9y6Oo3hrpOvT/anTcLq71mpG+lwFi3mFtgS9zG+K7qoAA4wNCGcivYYDQerm
         Bt0wRDnbeBq4HYClzK3NwPjcqlJlDIG5xY1FeK9s3tu/7zDdgGpafpNZ6nbb4t5Sd/Oj
         Ac45Mo4vC9IpmOmWJnsWd3VJxzJE7KAACzCzn9759pNbwmeVqUaRu5014Pkmg/HDxWGA
         Soqd/QraOUmuGxxfQLvSJGt71UEDktHb/nX27yX/sAmM35aQS2qYOmCSiIEi9Jd3AOXq
         KezQ==
X-Gm-Message-State: AOAM53238V2CwNCXXkUso6GK3Ei315LQwSDxQrHBAzlFuQTrGU6SmvdX
        KRlGilf/Ez4qzs0tI26pmauilu7PByYfLz/NdVPpoK4ua1P6l7G8AljtehrrNHzHEY1PkQmULsA
        R7kwwJmCPmt9ub1aObyEH3DE=
X-Received: by 2002:a05:620a:1539:b0:67d:45f2:f5bd with SMTP id n25-20020a05620a153900b0067d45f2f5bdmr11127664qkk.313.1648322697791;
        Sat, 26 Mar 2022 12:24:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5Bbhbe4fNmCCiw0bHclSMqD4b5ogUJimIEaOAuMXEpuJ39XeDHBrgaI1Pk8q6ZmT7kZe2ug==
X-Received: by 2002:a05:620a:1539:b0:67d:45f2:f5bd with SMTP id n25-20020a05620a153900b0067d45f2f5bdmr11127653qkk.313.1648322697470;
        Sat, 26 Mar 2022 12:24:57 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id b17-20020a05622a021100b002e1f86db385sm8064691qtx.68.2022.03.26.12.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 12:24:56 -0700 (PDT)
From:   trix@redhat.com
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, nathan@kernel.org,
        ndesaulniers@google.com, hverkuil-cisco@xs4all.nl, vrzh@vrzh.net,
        tomi.valkeinen@ideasonboard.com
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] media: staging: atomisp: rework reading the id and revision values
Date:   Sat, 26 Mar 2022 12:18:53 -0700
Message-Id: <20220326191853.2914552-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this representative issue
atomisp-ov2722.c:920:3: warning: 3rd function call
  argument is an uninitialized value
  dev_err(&client->dev, "sensor_id_high = 0x%x\n", high);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

high and low are only set when ov2722_read_reg() is successful.
Reporting the high value when there is an error is not
meaningful.  The later read for low is not checked.  high
and low are or-ed together and checked against a non zero
value.

Remove the unneeded error reporting for high.  Initialize
high and low to 0 and use the id check to determine if
the reads were successful

The later read for revision is not checked.  If it
fails the old high value will be used and the revision
will be misreported.

Since the revision is only reported and not checked or
stored it is not necessary to return if the read with
successful.  This makes the ret variable unnecessary
so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2722.c        | 20 ++++++++-----------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index da98094d7094a..d5d099ac1b707 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -906,22 +906,17 @@ static int ov2722_get_fmt(struct v4l2_subdev *sd,
 static int ov2722_detect(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
-	u16 high, low;
-	int ret;
+	u16 high = 0, low = 0;
 	u16 id;
 	u8 revision;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
-	ret = ov2722_read_reg(client, OV2722_8BIT,
-			      OV2722_SC_CMMN_CHIP_ID_H, &high);
-	if (ret) {
-		dev_err(&client->dev, "sensor_id_high = 0x%x\n", high);
-		return -ENODEV;
-	}
-	ret = ov2722_read_reg(client, OV2722_8BIT,
-			      OV2722_SC_CMMN_CHIP_ID_L, &low);
+	ov2722_read_reg(client, OV2722_8BIT,
+			OV2722_SC_CMMN_CHIP_ID_H, &high);
+	ov2722_read_reg(client, OV2722_8BIT,
+			OV2722_SC_CMMN_CHIP_ID_L, &low);
 	id = (high << 8) | low;
 
 	if ((id != OV2722_ID) && (id != OV2720_ID)) {
@@ -929,8 +924,9 @@ static int ov2722_detect(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	ret = ov2722_read_reg(client, OV2722_8BIT,
-			      OV2722_SC_CMMN_SUB_ID, &high);
+	high = 0;
+	ov2722_read_reg(client, OV2722_8BIT,
+			OV2722_SC_CMMN_SUB_ID, &high);
 	revision = (u8)high & 0x0f;
 
 	dev_dbg(&client->dev, "sensor_revision = 0x%x\n", revision);
-- 
2.26.3

