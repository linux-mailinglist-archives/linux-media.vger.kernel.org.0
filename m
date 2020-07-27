Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1AD222F6FE
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 19:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730699AbgG0Rs5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 13:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728532AbgG0Rs5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 13:48:57 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A23C061794;
        Mon, 27 Jul 2020 10:48:57 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 9so14906212wmj.5;
        Mon, 27 Jul 2020 10:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qOH/UoaqC+LDO4kkcL97+3vWeaaagSUdgiIVI5ufHis=;
        b=XWcLeYAWwLQnQ/+Vniw+1NZMkQBf5jPAzdnX66/ZOrG+d8xxI/geLEvfjZuvZxTw6A
         T5Na0PcnsDM5t4kNk6hPCIJTXxwx5VzLDWQa/DFx9ItkiyaVmZC0SsYIAOpwMP/MqLLW
         wBtasEqQKV1jN/y3TFd9fkF1l3pw0pNF8OzWQ0T+erudPq0LAc6g9JSLk/NNmWG6/1Qk
         B5U20kHwZgUKg4twqfKp0UjqMkkX0QwES20iQSgWlh/WpKektlQ0znluUNwnpdF7GuEW
         1NGVzAaSZePpJpIgwJI6oPBcYrUVglr1Z0LoUZV8IKbJ7pyJ8sWlH9v3edi0eSRh7W8c
         zApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qOH/UoaqC+LDO4kkcL97+3vWeaaagSUdgiIVI5ufHis=;
        b=TLopHUN7qFcsoS24mAIASZmjWMGuoLazJLg8Qx4oQjgy/Ur6j4Xlid6gLvjg0d1M/r
         ZdcCH1j4fGl2Oa4n5/kqFDBgeB4IComL1wSMP/h8dJlAFgVJtNhQc4g8ppg5HYoUv3Yv
         tUiRtz7jJPpI2HKNYdZV3ngCAoKUebhHJrXpd+gMd+s0KnjIWMFOjgm0o/5vnCkjOkjq
         r6nqO0iHYR3pAcOWXfSVFZmIjb8LZLVaL5Q//NersT2d1dS9QnGOR2sAhpL1+SHd31aJ
         3tfqNlUDB1moP+Hzr/a/xwlmJ2LbR2547UIqCXhDIALYekd9BEDK6F1lioWb4s7kANP+
         dFCw==
X-Gm-Message-State: AOAM533TWCzubT9ZA4M76ndQ03L9GRAXJmPYLKtZwrgW4KpoRU1SUjAZ
        M0OFI9eKFRaZSPMqsMQyeeY=
X-Google-Smtp-Source: ABdhPJxfNAV1+tUhphWVdB/yAnUKsH2CS8FGtw6ozsRuygaha6vREw+pf9Ma8uRtJcQlBCFiG9T9YQ==
X-Received: by 2002:a1c:5646:: with SMTP id k67mr367294wmb.61.1595872135762;
        Mon, 27 Jul 2020 10:48:55 -0700 (PDT)
Received: from localhost.localdomain (112.red-81-32-35.dynamicip.rima-tde.net. [81.32.35.112])
        by smtp.gmail.com with ESMTPSA id y11sm14072266wrs.80.2020.07.27.10.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 10:48:55 -0700 (PDT)
From:   Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Cc:     Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3] media: atomisp-mt9m114: replace fixed function names
Date:   Mon, 27 Jul 2020 19:48:12 +0200
Message-Id: <20200727174811.57486-1-juant.aldea@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are a couple of debug messages using hardcoded function names
instead of the preferred __func__ magic constant.

Replace them:

WARNING: Prefer using '"%s...", __func__' to using 'misensor_rmw_reg', this function's name, in a string
215: FILE: ./media/atomisp/i2c/atomisp-mt9m114.c:215:
+       v4l2_err(client, "misensor_rmw_reg error exit, read failed\n");

WARNING: Prefer using '"%s...", __func__' to using 'misensor_rmw_reg', this function's name, in a string
236: FILE: ./media/atomisp/i2c/atomisp-mt9m114.c:236:
+       v4l2_err(client, "misensor_rmw_reg error exit, write failed\n");

Signed-off-by: Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>
---
PATCH V2:
* Restored word "error" as pointed out by Dan Carpenter <dan.carpenter@oracle.com>

PATCH V3: 
* Fix V2 changelog message.

 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index 0d60918a9b19..f5de81132177 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -212,7 +212,7 @@ misensor_rmw_reg(struct i2c_client *client, u16 data_length, u16 reg,
 
 	err = mt9m114_read_reg(client, data_length, reg, &val);
 	if (err) {
-		v4l2_err(client, "misensor_rmw_reg error exit, read failed\n");
+		v4l2_err(client, "%s error exit, read failed\n", __func__);
 		return -EINVAL;
 	}
 
@@ -233,7 +233,7 @@ misensor_rmw_reg(struct i2c_client *client, u16 data_length, u16 reg,
 
 	err = mt9m114_write_reg(client, data_length, reg, val);
 	if (err) {
-		v4l2_err(client, "misensor_rmw_reg error exit, write failed\n");
+		v4l2_err(client, "%s error exit, write failed\n", __func__);
 		return -EINVAL;
 	}
 
-- 
2.27.0

