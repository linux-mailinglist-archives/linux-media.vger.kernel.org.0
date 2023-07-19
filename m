Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F288C759285
	for <lists+linux-media@lfdr.de>; Wed, 19 Jul 2023 12:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbjGSKQ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jul 2023 06:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbjGSKQZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jul 2023 06:16:25 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA28B1BFD
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 03:16:20 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fbc63c2e84so66925465e9.3
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 03:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689761779; x=1690366579;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oTUN50/17AR9wbpM9Qq3N318u2qSEtlvZXw2qFUaUY0=;
        b=SZwtn00ajOrI5/UUiA0X4OJc07NJAT2mAmuEUcnSa7J6fajC9YQciamJHdZaB4z5Mg
         VUKacOYsjiBr3IECM9/qhJT3IdzM1hGveZZuplA24QniFFxGen71+QeKETMNIDJ0yzak
         wExVu/MUzcyXiIE4dNlMKUvipPMlFgsyHwxP4gTK4WAwPieVVoNmQTFBazHPER08fJIL
         vlyXmgWIsQUaXFDXT7Wx6vApwSBnDSYRQyI4JwB3BAZxOQOecIaQ3rhYiN8mN1Q8mv/t
         UUY9kJoSb55RhA/OON8IV3yT6W/jYsS4qK0He3+9Nlo9A28ZvjN1HsUXQFE3KuqElgVb
         9xiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689761779; x=1690366579;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oTUN50/17AR9wbpM9Qq3N318u2qSEtlvZXw2qFUaUY0=;
        b=UYBU+8cRyW9GNRE9DvewyYB7lpR0QWTTP5UQAe4LAGY8VFjCNPbEeHBuOvQnm9Q501
         eMZarTvmu+C+5J3+AAj9tbdTLb93W4/5U2VXZeOia+GGxn9GcaCgkgITOssL+WHlxTW9
         eKGj2WjcWyHgyK5MZCpyNQcttMi8/Oe2YeMlOeqyzDzMsvICVePXwWhbuNTedfT8190j
         aoYOznE1yrtJL4iZOXkzHxQYibnfR16XvaRPFlwTcgZq+l8dzzH9KTKFMyt9WaoUTQS+
         FxaJHnUdp7F2HrA0n1uKAL3giw5EOM1FkKe7bchBPMwN97srGXtj4MkrQpkN1hr31Z9T
         r8kg==
X-Gm-Message-State: ABy/qLZzD1N+jgcvL3+zGwzRBboSh3gFIPLERugq+yJzTJaeFzu4Zv30
        R8Gw+yg7yU8skm9bIRzOUosxOw==
X-Google-Smtp-Source: APBJJlHAnLgTuIDQBKuxxNCX3qrgDSx988MYKL5jiLsTUFs2svQEUhO3U+rph1zIbWRvMaxwoMfADQ==
X-Received: by 2002:a05:600c:3787:b0:3fb:1b78:38d2 with SMTP id o7-20020a05600c378700b003fb1b7838d2mr1749085wmr.4.1689761779299;
        Wed, 19 Jul 2023 03:16:19 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c16-20020a7bc010000000b003fbe36a4ce6sm1354773wmb.10.2023.07.19.03.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 03:16:17 -0700 (PDT)
Date:   Wed, 19 Jul 2023 13:16:10 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     Arec Kao <arec.kao@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Hao Yao <hao.yao@intel.com>, linux-media@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: ov13b10: Fix some error checking in probe
Message-ID: <b7ed2497-35d6-490e-b2a6-089f8099290a@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "ret = " assignment was missing, so ov13b10_power_on() is not
checked for errors.  Add the assignment.

Fixes: 6e28afd15228 ("media: ov13b10: add PM control support based on power resources")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Adding error handling always risky breaking the driver and I have not
tested this patch.

 drivers/media/i2c/ov13b10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index dbc642c5995b..8ebdb32dd3db 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1501,7 +1501,7 @@ static int ov13b10_probe(struct i2c_client *client)
 
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
-		ov13b10_power_on(&client->dev);
+		ret = ov13b10_power_on(&client->dev);
 		if (ret) {
 			dev_err(&client->dev, "failed to power on\n");
 			return ret;
-- 
2.39.2

