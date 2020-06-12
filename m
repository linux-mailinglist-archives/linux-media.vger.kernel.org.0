Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2A2C1F7921
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 15:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgFLN4k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 09:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgFLNyY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 09:54:24 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04196C08C5C4
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 06:54:23 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id h188so5526473lfd.7
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=i8QHZ+71uR5r8C2iVrz+FnYiMnJAkGWgVhEcbxpdOK0=;
        b=XLWy5sO0x6NyMihD9u77RPeoTa4IN3p4476KrhEB3C21R7zGrViSArupp8vODWeY08
         MZAA3SwN3S2SA6wiLKAnZTnaJ+tnvDIHdd39DowB98xoNi9Z2TOoma4aoiU4O4Mc8mgG
         SL95B7uIT4Lv994CBMH+AHawfTt3QilccsXJTsPxr1d2BgD2APHJ2Ea0FappE9lUlgbx
         oP4EKJSze9ktQAMIfGqxnt/MEijNdd0DgnDnaSSi00JB79vNii1CxJVUdcAFn2d9MAPg
         goz06Sx8j18T6Dbu7MOOnB1zls/Ow3l8Ceedxl5NwZEHsZo1HCQnTsc1Q0BgLt3746aB
         swMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=i8QHZ+71uR5r8C2iVrz+FnYiMnJAkGWgVhEcbxpdOK0=;
        b=orPig1FXzwcDXRNZo4yv4/bwZqn+sLQai9SxejYGnuUqB1FFCz6lz4j0C3I0L8ek0Z
         +f89NjDARHsKWZVniX9IYms4notxbKftKBEQKk3XiM/DcPboxPpcOdpJ6FBQ75MS5AB/
         mDEh1wE+UrH5rcnrPu/gMCyenu/wXrV4hmKpToQfiZ3HpYsZ9odsHRjopydo/XRZdJIK
         wcyf+1Ei8CgPOrKVFGqKM9vBtiNWzSk1yKKElAZD2W7azKXIrVJEM8QeuUlweEpr52BV
         0F76/QwwqzrVpPkDRU9VE5LRLDqVY4EMM1fxfD+eJUymODUV1LEYz7B2vDo/A99EvqLX
         rW2w==
X-Gm-Message-State: AOAM530LKwck3q0rvuoMRqVFNwghdM0vLVmvsee5OirmeHp2BFbMM3rZ
        qnpz+nW3XM0JE7O7wyPNnmSkTQ==
X-Google-Smtp-Source: ABdhPJwO0Af920iLi+MZmruEfnVsbizcM52UCA3GXDnT0F2vvjwJGqBUDC4wL8C8SVGin7D00Fgkvw==
X-Received: by 2002:a19:cbd7:: with SMTP id b206mr6991562lfg.163.1591970061110;
        Fri, 12 Jun 2020 06:54:21 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id a1sm2414415lfi.36.2020.06.12.06.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 06:54:20 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v5 02/10] media: i2c: imx290: fix the order of the args in SET_RUNTIME_PM_OPS()
Date:   Fri, 12 Jun 2020 16:53:47 +0300
Message-Id: <20200612135355.30286-3-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200612135355.30286-1-andrey.konovalov@linaro.org>
References: <20200612135355.30286-1-andrey.konovalov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The macro is defined as SET_RUNTIME_PM_OPS(suspend_fn, resume_fn, idle_fn),
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

