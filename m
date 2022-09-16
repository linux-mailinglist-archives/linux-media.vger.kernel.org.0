Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDABD5BAECF
	for <lists+linux-media@lfdr.de>; Fri, 16 Sep 2022 16:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbiIPOC4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Sep 2022 10:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231880AbiIPOCk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Sep 2022 10:02:40 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9A7AB180
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 07:02:26 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id i203-20020a1c3bd4000000b003b3df9a5ecbso15215335wma.1
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 07:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=6CvF1XXx94MfM8P5Aw9kd8Rda9CjzbWOT+YyUiF/JnY=;
        b=jXVxcjpU+3u+KJMBa6box1d6vsnBlAliT56oCeVAWJdtZZDwWeRb/zBFZzAec9wqrf
         mnfJtSIieUDPo6Ra8T/w/qLGs5G/7ZqaW2GNk3Kx3ELqc10bStCCaZnlmY7bn8/Iqm1s
         A/csJ3u9gOSdy/TEhP2BBzK1gzR9Ji/n/S/41/E2ZGjqy/Ce4dFsJ0WiCEte7SQhYkZ9
         OdNIJedbKbzsyaoffjRw/gIHHoTydSLSUX2PyTw+QbHG7s72fdI6jDdjsV+oB6ZqutOI
         uqH9ZjptcEpiL1FxYlz1r4ZlMs1kqapWrX8m9GmN8jAAJ3NlGTUpIEXDjmMKrNXuDl6+
         aVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6CvF1XXx94MfM8P5Aw9kd8Rda9CjzbWOT+YyUiF/JnY=;
        b=LMtgu2OMgC5c1gwK4kQ3zkZZRqfgUl7Y16M/SmMr0l3dxUFkJhqZMC8vcCmPfOylcW
         PLt6RkHBX4tZN10nuQ/GjfLa2SMgWjbnDrjUZ1NJzYKSZhiuyHuduo0dTn0aL4KGfCzo
         q9Ts8DYeoD7qC9PJeB8/VyREYjuzp3/3ITmi/6LAcnnFk6vBo6fIEZnX5EC/pcc0W0vX
         3IHSBoz+ZVrg5GzbHIuNipieOEIAAIzhGpuP+aN2Nlll+3TtutD4pZJzkT30wd1YI7kt
         ofzLESREerQpQ9968Dybk5umyIlGM3d9HbiqyWMVxPrjxs6hHXKw2YVeKl4j3RUlr7WM
         4veA==
X-Gm-Message-State: ACgBeo0/R65NeEsZ9a7GsSfKiPuIz3S66eCwQNrBP/j5ZjKk7285z7G2
        jO9bDddti0B4fbz8sFukV9wtyg==
X-Google-Smtp-Source: AA6agR5Zsc+tZeuuIw1wrhh4ZKC05STEYD5OPwW/gkXoXkBj/D/RA0kBx1GPhfPNxb0JODswa1lQXg==
X-Received: by 2002:a05:600c:3b1b:b0:3b4:92fd:559a with SMTP id m27-20020a05600c3b1b00b003b492fd559amr10180257wms.69.1663336944609;
        Fri, 16 Sep 2022 07:02:24 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f17-20020a1cc911000000b003a61306d79dsm2615041wmb.41.2022.09.16.07.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 07:02:24 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v4 3/3] media: i2c: imx412: Add new compatible strings
Date:   Fri, 16 Sep 2022 15:02:13 +0100
Message-Id: <20220916140213.1310304-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916140213.1310304-1-bryan.odonoghue@linaro.org>
References: <20220916140213.1310304-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Sony imx477 and imx577 use the same silicon enabling reference code
from Sony in the available examples provided as the imx412.

Add in compatible strings to differentiate the parts.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/imx412.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 9f854a1a4c2f..93f362e3b132 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -1288,6 +1288,8 @@ static const struct dev_pm_ops imx412_pm_ops = {
 
 static const struct of_device_id imx412_of_match[] = {
 	{ .compatible = "sony,imx412", .data = "imx412" },
+	{ .compatible = "sony,imx477", .data = "imx477" },
+	{ .compatible = "sony,imx577", .data = "imx577" },
 	{ }
 };
 
-- 
2.34.1

