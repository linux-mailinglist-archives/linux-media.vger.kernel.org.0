Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52816170AFA
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 23:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbgBZWAP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 17:00:15 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36414 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727503AbgBZWAP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 17:00:15 -0500
Received: by mail-lf1-f66.google.com with SMTP id f24so490292lfh.3
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 14:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uyUS9Qrs/Z0OPucsNs7VCy+xNY1BgSvPcX046PaoEd0=;
        b=gmnsmX27jolZIi2TCvxMy6vZR1vzYlc5BwWzCOT05cyEUC/DtdWu/Xy8FsQ4u5+xqJ
         XzVLBEr4wvG7EkkCgqPK9RFgSF4RWHOn51NfBlX21Nk9mCcsQdPBumdAs20fSAlPZebL
         3VrebLynzxRdRu42s1W21c8UhliwxG+mSTUoKHK0HRPzuDR/+kkzKILo0VHNCZn6pWlA
         HA47VBp75rkNk6VYtrkNq0A/QC04qecnXfW1y42nwMTakFgsQ0v/PsN0CihMxq728zyl
         DNppj2LgfrVcLElJ6Fq0PUsgrr2UJ3IjCm7JkHrOzY67/DQlcJgHaI6LjQGjA2IdFqRJ
         Pn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uyUS9Qrs/Z0OPucsNs7VCy+xNY1BgSvPcX046PaoEd0=;
        b=N6Rr8yIgoGpew4Yg5k6EoluXjpM31WSShiZ/qpasBf2PDndm01AnZg7qW2DQShjldU
         7uJMLgF+wGjpqGIbH5F0xf6pxOu/E/xy16iM5HslPuq3Kicpz2Gp4iYdQieEqXZHTANR
         KFQHNIUiUzQJiwJstKsI1L7Up8uV2qX4OveUazpol6sZs/TgQ75zGY1fnLqe4kSuCV34
         bEVl6K2Rhz0q+PqhiBAtFw4pIuQJ4N1ATBhO1Oe06ciXSS2CZoeXTQOTGBSRsobISmkT
         ux6v0viSdYR0nVOriRLbIjvRTwdX7C5JKVgU22f/PF9fHKuF9sXmt/Y+0MjvkyPirTIV
         Ieww==
X-Gm-Message-State: ANhLgQ08tlm9StWcqNTZUF1O0SmyrQGL9Jy5whudiMGKUnj+VfKnmaNn
        K5CZ9X8AhXYVhVFv0l5ZhifmaA==
X-Google-Smtp-Source: ADFU+vsA82ed28b+MQEg8V0WzaZ9al0ZZrv+I915xq1Bw+ty/aJ+LdkF7s4molW+Sky7hTV5Dss2eQ==
X-Received: by 2002:a05:6512:70:: with SMTP id i16mr357709lfo.93.1582754412049;
        Wed, 26 Feb 2020 14:00:12 -0800 (PST)
Received: from localhost.localdomain (95-28-65-22.broadband.corbina.ru. [95.28.65.22])
        by smtp.googlemail.com with ESMTPSA id a9sm316856lfr.37.2020.02.26.14.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 14:00:11 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH 2/3] media: i2c: imx290: fix the order of the args in SET_RUNTIME_PM_OPS()
Date:   Thu, 27 Feb 2020 00:59:12 +0300
Message-Id: <20200226215913.10631-3-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226215913.10631-1-andrey.konovalov@linaro.org>
References: <20200226215913.10631-1-andrey.konovalov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This macro is defined as SET_RUNTIME_PM_OPS(suspend_fn, resume_fn, idle_fn),
so imx290_power_off must be the 1st arg, and imx290_power_on the 2nd.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
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

