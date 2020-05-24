Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B38201E024C
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 21:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388233AbgEXTZn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 May 2020 15:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387807AbgEXTZl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 May 2020 15:25:41 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974F7C05BD43
        for <linux-media@vger.kernel.org>; Sun, 24 May 2020 12:25:40 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id e125so9393282lfd.1
        for <linux-media@vger.kernel.org>; Sun, 24 May 2020 12:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ythenNMgCasy/26fjGx9+1WbKj8OM9GaH/NHc6AXhOM=;
        b=cuqs1pzV9wFff2GzAa77a4DoEBOaiwUw4k6/Z5KiNk0rPbw2WWyS87P6oE987eiUQY
         dvFFcbBp3yAMwXas2jEHznl6OFbqR/glhEu7tjtzqv+AihXa/K9aVZ9wKqE9C3qDu6Tf
         iOy2cw+Im3uOdJdsrheiW7bJGH8bgwHa5jzwSC0bZE649ZGdSLvLvllqMKYn5/wPUqEd
         aR6SLXLiJ6w5zAuwDbPp0nCu4VoWqHjhT9v67s22giW0KTfTuSNcTu7U0ExBx5TorhW/
         Y9bZc50QE3GpJhp6lfvQ0y2K4HWFw3Q9QeeCWvvXR4EPplzkihdAw0xE5vLuBQleYb1m
         I7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ythenNMgCasy/26fjGx9+1WbKj8OM9GaH/NHc6AXhOM=;
        b=SdrL+by3aPRSVHPqlkjlDQnxG/gFD3jFr+qIHU4aMp7jdD15mInopWxTYpwqDpLmPT
         tl+xcr2cu4S8scsX0uZsn+hwRWBhzYxoif7PdZ1MqLlszfQo6CYyw9Jopuu0Wh9EQiLr
         ZWMoHs6BFJg7SdEYC9AbR39eTf9rS6RKBas0s6zWlqAAQxUEq3qWeX2cGU0pN4KW6HYs
         TiV360P9nNOKo3giOvZb6leou168CISuQ1eZsiTsR8kmNuak3zG9mCMjxOFGqOm1OG+c
         7HVL9EBgMDxX+E0mjBkZxDG9uOFyBVELz+BioICZBDiI+i0HA9VFkBEJyUUlymW7L6oN
         dDig==
X-Gm-Message-State: AOAM533Kts61Dfzudwge6v8MEG3dXmYGQNTKXnY6lymAEBxlCjpazVFd
        NDkx4WJDhbLQHW1U1cbl+4Tm4A==
X-Google-Smtp-Source: ABdhPJyLX3K9NnfpRP83wKssyR/D1UCw4Vs0QqPtZAFmHi4f7xcRBgxDMaLRhHDA/s5sdZNPyS0D5Q==
X-Received: by 2002:ac2:5597:: with SMTP id v23mr12527697lfg.42.1590348339139;
        Sun, 24 May 2020 12:25:39 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id v10sm3878137lja.23.2020.05.24.12.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 12:25:38 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v3 02/10] media: i2c: imx290: fix the order of the args in SET_RUNTIME_PM_OPS()
Date:   Sun, 24 May 2020 22:24:57 +0300
Message-Id: <20200524192505.20682-3-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200524192505.20682-1-andrey.konovalov@linaro.org>
References: <20200524192505.20682-1-andrey.konovalov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This macro is defined as SET_RUNTIME_PM_OPS(suspend_fn, resume_fn, idle_fn),
so imx290_power_off must be the 1st arg, and imx290_power_on the 2nd.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/media/i2c/imx290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 2d8c38ffe2f0..d0322f9a8856 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -648,7 +648,7 @@ static int imx290_power_off(struct device *dev)
 }
 
 static const struct dev_pm_ops imx290_pm_ops = {
-	SET_RUNTIME_PM_OPS(imx290_power_on, imx290_power_off, NULL)
+	SET_RUNTIME_PM_OPS(imx290_power_off, imx290_power_on, NULL)
 };
 
 static const struct v4l2_subdev_video_ops imx290_video_ops = {
-- 
2.17.1

