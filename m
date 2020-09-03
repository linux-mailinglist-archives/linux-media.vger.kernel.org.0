Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4E3925C8C1
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 20:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729145AbgICScP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 14:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgICScM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 14:32:12 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 749F0C061244;
        Thu,  3 Sep 2020 11:32:10 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id z4so4284963wrr.4;
        Thu, 03 Sep 2020 11:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nZlFaUQfaJJWMFCcYk05F0yvxG2u/t/yre5shVIK7KI=;
        b=gHIVbJ9oSriqlHoFWjPkTanbtqPBByFRcKhKU7auhizwrXjLqPYZNCx8CYzN0YtlCM
         KgymGB5DkBACD2njVMbQAM5pRQJK8IlwESyCWXD6uB4SzeW7GQZmsEKWnql/Q8b176zO
         8UkPY8xcCx79PVsSRc9WwLwX0hPisqiQOYcQa4uaGMheM05PTEsmwFkOAiF/yYau+5HN
         Eora7TL3yzFmQpjUyuJmy+nUQtQAeqNLGsjn/37K8nzh6I4XvjCtu5xlK1n79s228mJl
         Q04K4kYteu4ArKjrl+wyiaNoIaAzdvg8qvqedy3Z5bC5wVbJbXRVZrGIW8/2wdms0YFT
         XOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nZlFaUQfaJJWMFCcYk05F0yvxG2u/t/yre5shVIK7KI=;
        b=kULym0h+eEzo9rZGelnEAxuCCYSpJ2QP+oanbk8OE5Du9oZZtA7yvmaFjJbpBhzPzq
         Ol3TfTwPrKm6zSAKazrqbFSlkRqmGYqbQ8QQlh6JyC/aX3WU0Yq+PuCKacb1Y5fSae3X
         spfccyNru7O/UrEFqlGTyK27na5I+lRarCD6szba21+m70EKILAcj5N+VtQKe6rNi7Sk
         IaYEibSuZjRejFnJMOpMaphn2yz6Km576BaDKZCppytswNL/myLIbnmB2dXbn0k2GhgI
         elZBM0/vweRLfYxbN+zBv96mtE0DJ/jqiT7VvVDJzxVcF9tvBsUULMraMf03Te/7/FWt
         GBcg==
X-Gm-Message-State: AOAM531pHigV/FYZL4W3JVzWXhu29rZYEmRXQ0hPtyIfDO3S6HH4VTV9
        +PudCmYss8D+9pPBfrIGYJ8=
X-Google-Smtp-Source: ABdhPJwH1D9z5Su4/YaDQmrHE/SrdVgmIm5oEcQPysCfCqeDKRnP1O8ku5IIaSbKciAfSfFkiunUMA==
X-Received: by 2002:adf:c983:: with SMTP id f3mr3770266wrh.348.1599157928427;
        Thu, 03 Sep 2020 11:32:08 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id v12sm5812241wri.47.2020.09.03.11.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 11:32:08 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
Cc:     Alex Dewar <alex.dewar90@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: media: atomisp: Remove unhelpful info message
Date:   Thu,  3 Sep 2020 19:31:35 +0100
Message-Id: <20200903183145.720727-2-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903183145.720727-1-alex.dewar90@gmail.com>
References: <20200903183145.720727-1-alex.dewar90@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We don't really need to know that the LED pin reset successfully.

Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-lm3554.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
index 621555b0cf6b..77b7f59e62d7 100644
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

