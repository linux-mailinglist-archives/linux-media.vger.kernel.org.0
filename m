Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 770FB44DA17
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234206AbhKKQQt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:16:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234183AbhKKQQs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:16:48 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72242C061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:13:59 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id d24so10752277wra.0
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BEL08sASglLnc0YJF8xLj56OK6VU80+SSEepEY/qQGM=;
        b=oepXc2wm+wExo3AaSQBSDzYO9yEUxfyqBWdTCdT8ZFvYydh1j/5p9ewBFiGULpB6wz
         KzXW37Ezq8as3GVwqLybBYOeIhdPjJlrqrpn5UpKV8fucOKvueVYYrPJeahtrbSLgDeV
         hnGQJxKyZoGnX3oVgglbJFCn3mVhkUyATEso45yG2HXRwOCR51JxCFdH6u3gOO+aRXYC
         xSAX33+f6t8yyjclj9Aa3LK46KT9MVn4dwnUVLCVEnjmuEbv9KxZAk9p1qpYY87/lsVv
         v9C1SBxnqyPGsfUGyWqgmzt/1imUSzo2MXaNHn18g2Wnb0C0Dgv8izKk9QdBivJcIOn8
         GMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BEL08sASglLnc0YJF8xLj56OK6VU80+SSEepEY/qQGM=;
        b=mqRaIlf1VKgS1pqCFZOIPF5BumMMrO53S/YIq4UJEfDdvOH4wmgrExmE5/oVxH4ZAn
         FR3BbcCmnEd0J6AqdgeBzlueHSh94MeXzhgtHpy/WGcLxrjE9qy5o5KUovbj6a70d+Uv
         PJpyQs+tdy2Y0E97L8nX4jJFl3XgPaGkveOro01uCTmMXroEbTaIpZRLS8/gPMqsuVAx
         2Qgz8tKK1/fE7+Zu1mKcTzDbjx32WRhPsF05QXk0/xXno2yhD5AmfSQPqvQk6Th8ls7o
         revf67vSyaSAh8ZOWM91q39FSLYBCAly1+AVykgbDuO7QP9qkQt6QvnivC8jmjYJbPjE
         bl1Q==
X-Gm-Message-State: AOAM5331PKpD6DIQ5WJ/bJH2Qo4yPBsT30rzqE1tojxs+TEHAg/JNAdX
        M/hxzLE9rvAsvJgerWxCZwV+DQ==
X-Google-Smtp-Source: ABdhPJwsLi9eGsr0ZIBGXbZ7qluqfluuj5hbwp/+gNDWr63rO+Pavmev2gpaviTjFV1Xq0zvyab4Ag==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr10321271wri.377.1636647238074;
        Thu, 11 Nov 2021 08:13:58 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o1sm3441451wrn.63.2021.11.11.08.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:13:57 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH 12/18] media: camss: fix VFE irq name
Date:   Thu, 11 Nov 2021 16:15:36 +0000
Message-Id: <20211111161542.3936425-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
References: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

vfe->id isn't set yet, so use "id" instead here.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 71f78b40e7f5..165b404761db 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1293,7 +1293,6 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	case CAMSS_660:
 		vfe->ops = &vfe_ops_4_8;
 		break;
-
 	case CAMSS_845:
 		vfe->ops = &vfe_ops_170;
 		break;
@@ -1321,7 +1320,7 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 
 	vfe->irq = r->start;
 	snprintf(vfe->irq_name, sizeof(vfe->irq_name), "%s_%s%d",
-		 dev_name(dev), MSM_VFE_NAME, vfe->id);
+		 dev_name(dev), MSM_VFE_NAME, id);
 	ret = devm_request_irq(dev, vfe->irq, vfe->ops->isr,
 			       IRQF_TRIGGER_RISING, vfe->irq_name, vfe);
 	if (ret < 0) {
-- 
2.33.0

