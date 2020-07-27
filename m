Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43AB122F692
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 19:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730784AbgG0R0W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 13:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729927AbgG0R0W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 13:26:22 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA66C061794;
        Mon, 27 Jul 2020 10:26:21 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id f18so15570523wml.3;
        Mon, 27 Jul 2020 10:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zsKxRhlKd+uQDOq2/CXnJ6zIjjtOUm8tfFO4C1ExSks=;
        b=brpUcL1dvlfAx+vy6LtKzjhnTVyIriswGfEVAhcn4lBEgN/dKomchE/adCVnX6Oz32
         zhDR+MYC8aTX9htq5QRg2ynAPL+FB8ryT3We2P5zzOC89WsfiY0bWxSW0myzQmURj22O
         lQE6O8H0GvW4NxapvQP/VgTe3ERzx1YwXMVSMJNbiuGdOIeb6m6b0V4S9SeOjVKOU5g0
         BSnRm4tHiaSZSJSWfdPIPZ/+OqdRqhvUxlgiToNidPwGm7Z3YRHWHbNHfVeYlxG+JSZ/
         ajeP647s5kvSE4564J6Pyamp+hpZgvdecG6Xs90bphDofFiPSNteiTh986fJ17/h7F7L
         kUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zsKxRhlKd+uQDOq2/CXnJ6zIjjtOUm8tfFO4C1ExSks=;
        b=EMafQtJnHvqyoF9twiOTVGIzqsBShyJohiAyXnQsYqsQEEGvThgglCkwxkrpJFppce
         29Qh2utiAFHWfSuSFH7p9KNLMc+HViNmcfwYkrGUHJ4ISng6NLxOhJYgHNL5BFtktHwS
         YtYI8Yp6YAivV0fcXxqVdfjSza9jwM3uPfhQpdtvEQgmjiYgye+8HZ9ET7LrLui+mnAk
         TkFIO4/wIHgQjfmqtvv2Vtn5AeWE6MWjCJ95+v+TaKuKfk8LJcta+75Gu5mcXOcF2JP0
         dysIBes0RB5I7+5i6Hor10lr1cthSFly4mCz3Kk9h7UjB4iKgx/JmrbF5Auh/Gk5pydM
         WJdw==
X-Gm-Message-State: AOAM530HlJPcGuNXYoycqoaThFsv/nT8t82fuQL/KVHiac/5brat3zcf
        vfCN5ljSuEvQxbRdm+am/GkzgyD1JaVDPg==
X-Google-Smtp-Source: ABdhPJwkJV3qaZGLM3sAXvMmmraw2MnHdwguxhJ8gmiBPedSmNgltn0XLRIhYjiS1VEvidDNTPbdvA==
X-Received: by 2002:a1c:2dc6:: with SMTP id t189mr344180wmt.26.1595870780590;
        Mon, 27 Jul 2020 10:26:20 -0700 (PDT)
Received: from localhost.localdomain (112.red-81-32-35.dynamicip.rima-tde.net. [81.32.35.112])
        by smtp.gmail.com with ESMTPSA id l10sm9198395wru.3.2020.07.27.10.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 10:26:20 -0700 (PDT)
From:   Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Cc:     Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2] media: atomisp-mt9m114: replace fixed function names
Date:   Mon, 27 Jul 2020 19:24:17 +0200
Message-Id: <20200727172415.54935-1-juant.aldea@gmail.com>
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

PATCH V2:
* Restored word "error" as pointed out by Dan Carpenter <dan.carpenter@oracle.com>

---
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

