Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B37183E5869
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 12:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239837AbhHJKeL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 06:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239833AbhHJKeL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 06:34:11 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511AEC06179A
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 03:33:49 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id d6so29454835edt.7
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 03:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2bWdJTFdBT7N/3z85xLhwFZMuV51xWxicxyG3tsUzjw=;
        b=mvRdNz7Vkqu05ilLJvoACACdnCvcJVMLUYbUPaNL+3cTjW8wY+HilTjVlloB12hcjI
         yNPsqL0wpi/DPfdBJaTRQSA/Z/OXF/3HRwgz8r2m8Bk2Az9xwlkYHEDEOww+autydtzl
         LaQpPjigXb1VmNTxp/aX1ZfywweB05/o0TdJVH4lo2KYT8V5avgSKQ+/cGixrLNxrokA
         pUyfrpxCKKQ/mY/grrCBvthFm7dIvkX6y4Zo0LezTqRRJxucIQTMIVB9UffGbkvKN36F
         S6myo1MSwbFKIbsjwYFH8e80i98Fnjs1LgefWogL3H735N+hAHCE0dcYyVyeUB7CN5eI
         5KZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2bWdJTFdBT7N/3z85xLhwFZMuV51xWxicxyG3tsUzjw=;
        b=iSkDE26x2apLUoEO3nJVNmrAFXXfXn7w6N+lfv+xg0Jes4EDlO07VVqfl/irJq/VZZ
         5A/wMsjq7YqoOUQtxwKx2N4V3lpxfw2dReJWzJ5sXvXjjXBwWP/ngV9IvVjPex73Ti2E
         NI4z24YOpXl+mqwKdYjP2n4B4FEBWDR1XQGzWvPT7VRnoIX/H3KTR27PzUq+sFMqXUMf
         cILd5oiAQCaCZRqxuZHv4NHmC1YIUEdSp6W7gmwA5nIwWEvdbyYkyBMwfTMBwAIpuPZL
         9igA2APmHBHkjdl2XhtUY9bUXkCaJWImvxIU12TYg8CCxkqZDBblUkgkSukIDmbAlZKm
         73GA==
X-Gm-Message-State: AOAM530FjdhGzbzyd+fJs47CrIoSQ8e7EmpiN6MAluoafAcYglw9afw7
        P7yH8BwUvk63/tE/0zSxgvZWPQ==
X-Google-Smtp-Source: ABdhPJxiLVIU11HvVdNnI2iELiZO60AhTBUyY3vP00BKXYrVDzdn9NnZgBQmBGqb+uqTc39BQya0IQ==
X-Received: by 2002:a05:6402:4387:: with SMTP id o7mr4085082edc.204.1628591627769;
        Tue, 10 Aug 2021 03:33:47 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:6e3b:3620:e85a:7152])
        by smtp.gmail.com with ESMTPSA id e7sm9518357edk.3.2021.08.10.03.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 03:33:47 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v1] media: camss: vfe: Don't use vfe->base before it's assigned
Date:   Tue, 10 Aug 2021 12:33:36 +0200
Message-Id: <20210810103336.114077-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vfe->ops->hw_version(vfe) being called before vfe->base has been assigned
is incorrect and causes crashes.

Fixes: b10b5334528a9 ("media: camss: vfe: Don't read hardware version needlessly")

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 6b2f33fc9be22..1c8d2f0f81207 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1299,7 +1299,6 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		return -EINVAL;
 	}
 	vfe->ops->subdev_init(dev, vfe);
-	vfe->ops->hw_version(vfe);
 
 	/* Memory */
 
@@ -1309,6 +1308,8 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		return PTR_ERR(vfe->base);
 	}
 
+	vfe->ops->hw_version(vfe);
+
 	/* Interrupt */
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_IRQ,
-- 
2.30.2

