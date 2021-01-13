Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B062F4036
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 01:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393954AbhAMAnP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 19:43:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392361AbhAMA1F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 19:27:05 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70595C061794
        for <linux-media@vger.kernel.org>; Tue, 12 Jan 2021 16:26:25 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id m6so141446pfk.1
        for <linux-media@vger.kernel.org>; Tue, 12 Jan 2021 16:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P5cep6q7xr6t9kLaivrV7idzLK5AQ7vlZX4sAVxDVuo=;
        b=fD2bqF0VHgRb3wN28oaLJ2r6nRVEHcID7ozo+dKpSqImokp7jo1Dnks9lAwMp1OU2e
         LKDvKcQkPpkRqksrGprFTd9tf/s1aBw4CYL5/mMRv6crxJePDqW1d2bOs97Zn2GKBW0Q
         qZh7DnUEyWkliISDzQEVJp4YJEpDuSsx3R2/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P5cep6q7xr6t9kLaivrV7idzLK5AQ7vlZX4sAVxDVuo=;
        b=IP6j26EuRz3NIQo/vC+eUL3/guURwRhCmzttEvQF7Sh+0ZfOe8dGd1tANJ7F36dd4w
         QNXrfFtavmZ0Z3Ysea7d9zBKtfm7Qe1Xajj0l9RMNliacIkDWbe5eyjsWeaL6EhFspzF
         BvKD6NYKII/eRc7ABr5/OHoI4JjIVxPXOGJf4jA7vCF6jeUYJ5eATwT7/zGt5j/H7PmU
         UGuGGBxb2UK5WhO31ss916BjhLy3+7Ww+zevoPU3QfM1ODeS0jwy1HGwTDcAQn+DswVl
         6at7wQqw86AeKIDz35bXcOK/1DOytEvQS0kQ1IZZdiJYdxyiEY4ehFcWj69g9Whn2n1J
         zDpQ==
X-Gm-Message-State: AOAM533K+yyXUw4jUFgta3htDO8I4N4Qtnz5fEQzs65XVGC03arsg0NM
        vEmGCu+vfWkzP2XZCea8C+rLsyI+Rwi5og==
X-Google-Smtp-Source: ABdhPJyD+hXJ2C6UE9S3spN4vWkdQDn/M2cSB0mVGVds2IGeT6BY0kPf2x1dFVfgMUuecjbhznXfjQ==
X-Received: by 2002:a63:31ce:: with SMTP id x197mr1637187pgx.262.1610497584553;
        Tue, 12 Jan 2021 16:26:24 -0800 (PST)
Received: from localhost (136.247.83.34.bc.googleusercontent.com. [34.83.247.136])
        by smtp.gmail.com with ESMTPSA id h17sm270397pfc.119.2021.01.12.16.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 16:26:23 -0800 (PST)
From:   Fritz Koenig <frkoenig@chromium.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stanimir.varbanov@linaro.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org,
        acourbot@chromium.org
Cc:     Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH] venus: Check for valid device instance
Date:   Wed, 13 Jan 2021 00:26:16 +0000
Message-Id: <20210113002616.1501493-1-frkoenig@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

core->dev_dec and core-dev->enc are set up
by the corresponding vdec_probe and venc_probe.
If the probe fails, they will not be set
and so could be null when venus_sys_error_handler
is called.

Fixes: 43e221e485e5 ("media: venus: Rework recovery mechanism")
Signed-off by: Fritz Koenig <frkoenig@chromium.org>
---
 drivers/media/platform/qcom/venus/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index bdd293faaad0..979fcada4d3b 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -62,7 +62,8 @@ static void venus_sys_error_handler(struct work_struct *work)
 
 	mutex_lock(&core->lock);
 
-	while (pm_runtime_active(core->dev_dec) || pm_runtime_active(core->dev_enc))
+	while ((core->dev_dec && pm_runtime_active(core->dev_dec)) ||
+			(core->dev_enc && pm_runtime_active(core->dev_enc)))
 		msleep(10);
 
 	venus_shutdown(core);
-- 
2.30.0.284.gd98b1dd5eaa7-goog

