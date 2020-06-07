Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46D721F0D1D
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2020 18:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgFGQbj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Jun 2020 12:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbgFGQav (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Jun 2020 12:30:51 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE34AC08C5C7
        for <linux-media@vger.kernel.org>; Sun,  7 Jun 2020 09:30:49 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id n24so17469186lji.10
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2020 09:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ythenNMgCasy/26fjGx9+1WbKj8OM9GaH/NHc6AXhOM=;
        b=aD4r7KAYyBWRL+r3cCNFwandPIp1eaBY0+mJVtAAbLtlNeZCVeWmO4LdP98zGXkx2f
         mWWk3CuksVHnax1r1AAVz5876ez1ow5sbWhBGtJY0DmabUBtHAGnvlt1bxUVFJwk9OLz
         7X0SneyAfRhAjPkbAtwQ5OMzdMWIBSmbJvkSdy+lvAsyfSJErqbJmvJThSZjFU1KJrCe
         cpuYcZOGcVK3QquNEw3olj2fEPbf6FCVU/qXa6LhWsako84djR1C25QZQWcwdUQSgW8x
         SvqFhDiRFY/zVHG2Bw1dgI24DdE66sH6Hwl+PPj1Wzd/7mBFNJSFnOWgN0q14Jl7jDgy
         ft4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ythenNMgCasy/26fjGx9+1WbKj8OM9GaH/NHc6AXhOM=;
        b=DeSkXppttAdy4RXovQ84RHPF8Tz2zOG2W1Fd5+zxKkK8h7M0PVULnqOGvPs390OvSN
         SqQTBFfopvh1P+vYrIyVWKQTorc+V7AEVfbpXDBSSxUbtI0IxEPUkBo4cMLa2FgmLyIc
         Oh3aDrJT3Q/ZTvQwaB6TSANnIeWNyhsd29rRRolbZPgisu5ged29L4x8JcOL68+5OoZ9
         dmekrvg2L3/eGA3NPgMnslAnPXOAl+q4qdIVhhdKwtpFjtp/0DC6IRvTNWgIAvRBsN7Q
         3tRyn9qiHOkw74eLnofGY3jEdj1lBj0+loM6b5IZDPMiqIxd0i8a1pVzXGfGjTHod0vX
         BxIw==
X-Gm-Message-State: AOAM530kof3/6bPm50SlAF9Z+gGiS8IVSoV/CqrCJiyp8nXAOKwiq+6a
        AplhyyZzkkvzQQeVBw13jLmC+Q==
X-Google-Smtp-Source: ABdhPJztgQw/a4CxBiVGeklrqq34QTqDSxO6rZE1olhTeauKdcDOH+dSCnusoO2D30v2fZFAEdjbEQ==
X-Received: by 2002:a05:651c:1103:: with SMTP id d3mr9651976ljo.110.1591547448299;
        Sun, 07 Jun 2020 09:30:48 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id l7sm1726511ljj.55.2020.06.07.09.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 09:30:47 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v4 02/10] media: i2c: imx290: fix the order of the args in SET_RUNTIME_PM_OPS()
Date:   Sun,  7 Jun 2020 19:30:17 +0300
Message-Id: <20200607163025.8409-3-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200607163025.8409-1-andrey.konovalov@linaro.org>
References: <20200607163025.8409-1-andrey.konovalov@linaro.org>
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

