Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 651F53B254F
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 05:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhFXDSF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 23:18:05 -0400
Received: from mx-lax3-1.ucr.edu ([169.235.156.35]:30022 "EHLO
        mx-lax3-1.ucr.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbhFXDSE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 23:18:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1624504546; x=1656040546;
  h=from:to:cc:subject:date:message-id;
  bh=SblKopDqFHSiwCfGDOMHISY6FX5IDGcC7lO8ql3WkLo=;
  b=P5pXVZTNTkA1VwHnzNh4or0VHC5u2OhK3SP4jRcN8H0PrpZ+yt38qOEV
   uSV3ULMoyzzr6b8tsrchJJrCEGXa2rOrnoD5QzJLAhJ4DHniPIAB3cBiD
   ZNprVQa7t/tON1wQITlE2rl1bqFrWDof8Sh6nU2NNTuYqms2nrPoUQTAm
   3XSkzyjfJhfPfe7QLC+f2p94a3NTkmgNgw/qUQlOLuMsTCSftYegaAgyb
   xFsDBT5lXXT0N8WpGOrIjyxhrPIcHsG/776YawiR3UcMvVInJPPZU67f5
   zJQCu13N07jyWewY9YUc57SgODxSL9ruH7/fKnRMyKfXRSQwbsYY98Zrd
   g==;
IronPort-SDR: H+vlGN629ID7s9Qa7COPP73KG0mQ9/zN+eBsXCggcufIrnfbhdPBuyGElzBusLVJbMFmK1qDhh
 bDhNLqi5poYr1Mv7tAbQFZcdPJI6+PvHQq/MbQ6gbXiZvsBiR7X95UNmKLmswvoKwuYKGf7Qwm
 RxFKENLrNV7M57Kd2qFCf+9db/SKdYl+KMcfYcarev33DG8hAZL4zqRbkl1TLET3Z4pPOI8zlL
 Db1clJxn3FVTiqqnaszhOc9dOIj9gVb3B1t0OfOJwgf78o17UuJL4b1fNBUYCh5e84MR+tr9kW
 l1s=
X-IPAS-Result: =?us-ascii?q?A2FJBQAu+NNghsXSVdFagmCDeVUWjUyHMQEBBowZGH+Ge?=
 =?us-ascii?q?YhlgXwCCQEBAQ0BAUEEAQGEUIJwAiU0CQ4CBAEBAQEDAgMBAQEBBQEBBgEBA?=
 =?us-ascii?q?QEBAQUEAQECEAEBAQFshS9Ggjgpg2ULFhVSUEUBBQE1IjmCFgGCYSaaH4EGP?=
 =?us-ascii?q?YwxM4EBiBoBCQ2BYgkBCIEoiHqFF4EZgRCEAnSHb4JQBIMbexODdgEBAZAQG?=
 =?us-ascii?q?4MEAYw7m0YBBgKDBRyCfppuRIZUjiWQfromAgoHBhAjgTGCFU0lgWwKgUFQG?=
 =?us-ascii?q?Q6NdQFCjjVBMjgCBgoBAQMJjCsB?=
IronPort-PHdr: A9a23:O5P+QBWhj4vKrceaSIgIKE5LRUDV8KwEVTF92vMcY1JmTK2v8tzYM
 VDF4r011RmVBNSdsK4YwLaJ+4nbGkU4qa6bt34DdJEeHzQksu4x2zIaPcieFEfgJ+TrZSFpV
 O5LVVti4m3peRMNQJW2aFLduGC94iAPERvjKwV1Ov71GonPhMiryuy+4ZLebxhMiTanb75/I
 xq7oQreu8QUnIBvNrs/xhzVr3VSZu9Y33loJVWdnxb94se/4ptu+DlOtvwi6sBNT7z0c7w3Q
 rJEAjsmNXs15NDwuhnYUQSP/HocXX4InRdOHgPI8Qv1Xpb1siv9q+p9xCyXNtD4QLwoRTiv6
 bpgRQT2gykbKTE27GDXitRxjK1FphKhuwd/yJPQbI2MKfZyYr/RcdYcSGpEX8ZRTDdBAoK6b
 4sAEuEPI/9WpJTzp1sPsxS+ARSjD/7rxjJGmnP62Ks33OM9HAzIwAAsAssCvGjJoN7oMKseT
 OC4wKzOwD7ebf1ZxC395ZDIfB4/vP+CU7F+f83KxEUzCw/IlEmcpJb5Mz+J0OkGrmiV7/BnV
 eKqk2MoqQBxozmvxscxjYnCm4UYy1DF9CV52ok1JMG0RFJ1bNO/DZtfqzuaO5FoTcw/XmFlo
 SA3waAJtpCnZiYF0ognxwLBZPyddYiF+h3uWPiTLDl4mH5ofLKxiwiy/EWjxOPxSNe43lZLo
 ydHj9TBt3IA2hjS58WGVPZw4kSs1SqT2w3R9+1JLl44m6rdJpU8wbAwjoIevVrfEiLygkn7j
 6+bel869uS19+jreKjqq5ueOoNslw3zM6AjltahDek2MgUCRXaX9Oam2LH940H0TrNHheAsn
 KbDqpDVP8Ebq7a8Aw9Sz4ks9Q6yDyyj0NQEhXkHK09FeA6fg4jpJV7OJPf4AO+6g1u2kTdrw
 +nKPqXvApnQN3TDnqrtcLJ/5kJGxwozytdf551QCr4fOv78RkjxtNnAAh84NQy73frnBc1j2
 o8CXW+DGKyUPaPIvVOW++4jP/OAaJIRtTv/M/Ql4uThjX49mV8TZ6mp2p4XZWi4H/VnI0WWe
 3vsjssdHWoEpQc+UfDliEeYXTFNenmyQrow5isnB4K+EYfDWoetjaSF3Ce6GJ1We29HBkmJE
 Xj2aoqEWu0DZTmMIs9ujDMET6KtS4w/2hG0sg/11b5nIvDT+i0CupKwnPZv4OiGpBAg9SFzR
 5CMwWGETjksxUsVTCVw0axi9x8ugmyf2LR11qQLXedY4OlEB0JnaPbh
IronPort-HdrOrdr: A9a23:VQRTm6PXI4t6ysBcTsCjsMiBIKoaSvp037Dk7TEVdfU7SL3+qy
 nDpoV56faLskd2ZJhIo7npU8m9qBvnlKKdirNhWYtKMjOW2ldA77sO0WIh+Vfd8uHFmdK1rZ
 0QCpSWweedY2RHsQ==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; 
   d="scan'208";a="50373552"
Received: from mail-pf1-f197.google.com ([209.85.210.197])
  by smtp-lax3-1.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jun 2021 20:15:46 -0700
Received: by mail-pf1-f197.google.com with SMTP id j24-20020a62b6180000b0290303645fae06so3000237pff.22
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 20:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+IbvtWPOhTjlxqwR4MNXPf2er5NRjM2nXY4Wvi5w5Z8=;
        b=bu+Jza0sX7FmcwdcjT+wEyy7ezF2NouP9TQFVYTkXLJuidNwcn1ZE1fY6osMXsfE8D
         2DpSupNuH2+DBsyhGfU48jTWy1bTeIdSYw1qEbdYJ8oGV/ZbLvwsmXA/9t6LYe/q7itV
         8ZTxZACrVlD5rmK7o8hQ5yVPhhWv2hpRbfhQYeJSo15zIx9brJMMaIyEAkUt2rW7A6J1
         W7vySw8DzFoUP3kz/1nUQIJAJsCxPfuXPdl/93qVrqGSAJbaJjy3HLDN/jotme3VDX3r
         ksEDNH0jAQRvRewgwScINTq0CtvnW0PbeqV3P5toK8xbqlkZHv1OvoA2I8grcOK0G+R+
         rFFQ==
X-Gm-Message-State: AOAM53253oTC1neyhiOgdrAUgITcJXeQmV6+PCh2YEkVyM24lpb5MDlS
        qG1iDOx0iPa71CsqU5WGqe3iPByL7HT2NanvrehyXmXmcdeyiw5w0ljns7K9E37sEu4XeECKaw2
        JhEMqwzVcmz1V2v+eyiqqg/IY
X-Received: by 2002:a17:90b:1291:: with SMTP id fw17mr3008328pjb.105.1624504545080;
        Wed, 23 Jun 2021 20:15:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4C+kYv2hUl0KJDQVzoA3q03zbeF8vVcB+7UTZ0fKdC08nXOLdUMs3yBBA0ckjCw+LxUv8Zg==
X-Received: by 2002:a17:90b:1291:: with SMTP id fw17mr3008313pjb.105.1624504544896;
        Wed, 23 Jun 2021 20:15:44 -0700 (PDT)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.googlemail.com with ESMTPSA id u7sm811917pjd.55.2021.06.23.20.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 20:15:44 -0700 (PDT)
From:   Yizhuo <yzhai003@ucr.edu>
Cc:     Yizhuo <yzhai003@ucr.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: atomisp: fix the uninitialized use and rename "retvalue"
Date:   Thu, 24 Jun 2021 03:17:17 +0000
Message-Id: <20210624031719.11157-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Inside function mt9m114_detect(), variable "retvalue" could
be uninitialized if mt9m114_read_reg() returns error, however, it
is used in the later if statement, which is potentially unsafe.

The local variable "retvalue" is renamed to "model" to avoid
confusion.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index f5de81132177..b02a8cd3dde7 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -1533,16 +1533,20 @@ static struct v4l2_ctrl_config mt9m114_controls[] = {
 static int mt9m114_detect(struct mt9m114_device *dev, struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
-	u32 retvalue;
+	u32 model;
+	int ret;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C)) {
 		dev_err(&client->dev, "%s: i2c error", __func__);
 		return -ENODEV;
 	}
-	mt9m114_read_reg(client, MISENSOR_16BIT, (u32)MT9M114_PID, &retvalue);
-	dev->real_model_id = retvalue;
+	ret = mt9m114_read_reg(client, MISENSOR_16BIT,
+			       (u32)MT9M114_PID, &model);
+	if (ret)
+		return ret;
+	dev->real_model_id = model;
 
-	if (retvalue != MT9M114_MOD_ID) {
+	if (model != MT9M114_MOD_ID) {
 		dev_err(&client->dev, "%s: failed: client->addr = %x\n",
 			__func__, client->addr);
 		return -ENODEV;
-- 
2.17.1

