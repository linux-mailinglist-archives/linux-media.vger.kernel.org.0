Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 452553EA1E8
	for <lists+linux-media@lfdr.de>; Thu, 12 Aug 2021 11:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235486AbhHLJW2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 05:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235404AbhHLJWY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 05:22:24 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F5EC061765
        for <linux-media@vger.kernel.org>; Thu, 12 Aug 2021 02:21:59 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id g138so3957781wmg.4
        for <linux-media@vger.kernel.org>; Thu, 12 Aug 2021 02:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SfSWlMNkRusRWrFgcNlK5f+Tq18JLveXJe/Yu78G3iI=;
        b=plSLnX8ZD6s40Oveh27/GmjBzf/ucPmUjZJrNgWQI7yrpGQaw9aYJVM+/EPwmjSsbe
         M2jb1omyczDnezm+sqCci0R/gombAiPDnzr1tRWprhlmdv7kH/t3byAF3ioWrsB6LdZK
         Jq/wqDLHVxcxtVRd0Xgdm0+bbRkl5ZX+5kewjCXfdqMEeBN6cTvAgqm4iij+iaC4SfHX
         stibatM6EHmZXPBzJ07XXAZIMvr4IJZk4PYd4a09gxJlgGrVxcu6yYvSWB3FL9F7N9HS
         YHSxoaxYgB+T5ISOt4lR8Y+OpGHXie880p662vtyVO5muEGUj1zhXtzra593KDc8p5Wt
         hIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SfSWlMNkRusRWrFgcNlK5f+Tq18JLveXJe/Yu78G3iI=;
        b=ZElj1+87FnhfHiaHrjA7Vm2agYEGkvFyo4WvU6taWGY6SaHm981Nu/8hj90ssst10B
         xGT2qQYgQSn92ICea2f/ImSY6dBw5giqKsw3pvrvwpWk3mszb5g1u1o6988RMteW3VZ0
         FoMUu5XJ01hwGy0cPWkJf1Ly1P+Yh6G9V6rALyRocsfBkP4qhjsweiYTHGX6PK9Toxot
         rsx4IZdG/6ZjubxIZGgx2g+LonT3aDdkQnq6p9uc1mSDd3FFjuRUsF3fuoCpz739A+wq
         DRoWhNB9B2hr/AhSGHfQlK19UcYtdQHPyj5akELdUi84YjaLTIaZccz9NZ0R6F7NDbe7
         54XA==
X-Gm-Message-State: AOAM533v/MPoTKZZbOq7/4CqGV5g0feIsse59eU3SP8C8vaSBD65+nSo
        EmD3ceHukci6aW2aR/yHeZffzw==
X-Google-Smtp-Source: ABdhPJxz42p7tdtH6rARtZ5tspXf4Xt+v1Os/5IYZZ5LAH4xeBEtmOB6nAvaDO8JrK0QbfPExl64+Q==
X-Received: by 2002:a7b:cd10:: with SMTP id f16mr2922862wmj.104.1628760118152;
        Thu, 12 Aug 2021 02:21:58 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:3e3:aaac:9c1f:b942])
        by smtp.gmail.com with ESMTPSA id s10sm2720586wrv.54.2021.08.12.02.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 02:21:57 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v2] media: camss: vfe: Don't call hw_version() before its dependencies are met
Date:   Thu, 12 Aug 2021 11:21:52 +0200
Message-Id: <20210812092152.726874-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vfe->ops->hw_version(vfe) is being called before vfe->base has been
assigned, and before the hardware has been powered up.

Fixes: b10b5334528a9 ("media: camss: vfe: Don't read hardware version needlessly")

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 6b2f33fc9be2..71f78b40e7f5 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -604,6 +604,8 @@ static int vfe_get(struct vfe_device *vfe)
 		vfe_reset_output_maps(vfe);
 
 		vfe_init_outputs(vfe);
+
+		vfe->ops->hw_version(vfe);
 	} else {
 		ret = vfe_check_clock_rates(vfe);
 		if (ret < 0)
@@ -1299,7 +1301,6 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		return -EINVAL;
 	}
 	vfe->ops->subdev_init(dev, vfe);
-	vfe->ops->hw_version(vfe);
 
 	/* Memory */
 
-- 
2.30.2

