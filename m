Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD8D291237
	for <lists+linux-media@lfdr.de>; Sat, 17 Oct 2020 16:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438256AbgJQOKn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Oct 2020 10:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438252AbgJQOKn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Oct 2020 10:10:43 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CFF2C061755;
        Sat, 17 Oct 2020 07:10:42 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x7so6623128wrl.3;
        Sat, 17 Oct 2020 07:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1t1qKTOcHJuHJHJsb4p8ik2mZczxzfF5ELYPkpoZWUg=;
        b=GbLWpBKMrdXEd6HyCuPGNMB5P3R96WSNhFqO55ycZBa0IQM3aXrHpxAfyh0pHBdzZK
         Kcurg3yXtC3pilHBAg2L4dp+ICU+nJ8TKZAg0N6SvRIMx0L6sXOi9Ne5VDx/v0e4GWYd
         mGJZNOv0zAJZsIwYgQaEouYBHyVh9pBV3iGpHmaa+tCKSDvU5UUMGeiLm5y1/yA2K0ww
         ugIJWC/N9JeRPoHSkV4lf+4jGmnF9IpqZwAjwdpunDqydq90UOshhabjsAYS9RJfTIql
         nhTVbx6AIApVgSovzG7eMaRBUYm8qe2vIjVDp57Xjo6PrifSxMzNv/Yaxl1vHccaaxxM
         /Z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1t1qKTOcHJuHJHJsb4p8ik2mZczxzfF5ELYPkpoZWUg=;
        b=RphK8glFZSUts9m/OYvi38SjQPVCMUU5dDOtty/Me5XPyuMBDSycReG7K/Z8yVGJhr
         1idOzPIkj0Qdh2yhTyLVGAFFuiGVd+Tw8fNIgWPxhoXXv2JgN7h3r16/f1BeqztllRuD
         mJDzrs1uhVSm+PgS9dbZMxol/ms6vW+NPHDT8SjJNhoeJMT2Pk5ZmxwqfAas9mfcB/av
         3Z0/llSJWqPJFKhm6kiOOaFE2IH6OrhbtmVMTIMGzmhWP8cz0bzDslzD5rhs00++li9y
         LHio2DcH0qsBLFNopUhV807FykVmV0ljQB7452rhq2mGYBAS0yKdj+cvBQ6k4TXLYLYe
         stpQ==
X-Gm-Message-State: AOAM532ENEvEPFQXPSDKR3lC1JXCwqMn+EMGc66nXwOH4zo350N3Ro25
        EwuDGsSdjgYDTS6Kbbs4voY=
X-Google-Smtp-Source: ABdhPJzfcA0ECFdHtCngcWj3sFyHuPE35S+QknUbVboMYZkEumlRCEpQGIboB4PdiQ67c1SMEBlOAg==
X-Received: by 2002:adf:9069:: with SMTP id h96mr10853710wrh.358.1602943841407;
        Sat, 17 Oct 2020 07:10:41 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id i33sm9130623wri.79.2020.10.17.07.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 07:10:40 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
To:     mchehab@kernel.org
Cc:     Alex Dewar <alex.dewar90@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] staging: media: atomisp: Remove unhelpful info message
Date:   Sat, 17 Oct 2020 15:09:43 +0100
Message-Id: <20201017140950.15989-2-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201017140950.15989-1-alex.dewar90@gmail.com>
References: <20201017140950.15989-1-alex.dewar90@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We don't really need to know that the LED pin reset successfully.

Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-lm3554.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
index b38df022f880..0043ae8e2ffa 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
@@ -771,7 +771,6 @@ static int lm3554_gpio_init(struct i2c_client *client)
 	ret = gpiod_direction_output(pdata->gpio_reset, 0);
 	if (ret < 0)
 		return ret;
-	dev_info(&client->dev, "flash led reset successfully\n");
 
 	if (!pdata->gpio_strobe)
 		return -EINVAL;
-- 
2.28.0

