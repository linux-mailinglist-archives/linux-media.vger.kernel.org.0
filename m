Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DEC14666B6
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 16:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359080AbhLBPjT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 10:39:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359067AbhLBPjS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 10:39:18 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D45C06174A
        for <linux-media@vger.kernel.org>; Thu,  2 Dec 2021 07:35:55 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id q3so37611954wru.5
        for <linux-media@vger.kernel.org>; Thu, 02 Dec 2021 07:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4rv/fyUIkZmcgUL4jWnd5ZJeQoQ3nVOUW2jLjnzBt8o=;
        b=qB4wRdgN1wDHIxQ4lxLDY6ooYNKGghkt7HHr71C2fFf5FOLr1P5OdYbMNw/eThwK92
         Bh+AYwksSq/5y76g9fuE69TIwYNV/7URXpwoRmmS792SlUve++AO42zD4zdA9Gbg8Pd8
         So5gIPJ9QS5q/MSdI3hRawZHt9rmLmqtrkk2VfWjwGk5SCX7xiPl1xCtDLKxr2o2EufJ
         ldxrGsuFe/udOxfy0hfaZB1zWCGQwTb1Fmzmp1vmCp4c3nN0oU0XGGb7a6/yh2biRFlI
         D9BzWQSJ+66gCbn/YhIZbw4Oa1eSoQPbge+TkG1GGu/3RFfCHEe9IyGYhAnjiJh0/aPd
         VQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4rv/fyUIkZmcgUL4jWnd5ZJeQoQ3nVOUW2jLjnzBt8o=;
        b=2PAhcHPifqZN06mivIvJTMRjMQK8HJQghYLoOdTHoa787VebJjQNDPppoN1C0/7Llx
         7JYn50UuibX6odVUJkxRkmhjemR9m4dxvzJqW9tRcW9atQPAOZSc80IgyseMQlMnG/MT
         ZYQA25v/NmUQH5+axhrk55OX7F9wblzLAZLz6mBd10E7c6M2aIYODg5FTzZi9a3OyUwg
         pi5sc9qNfVdYTvb8cxuu2hBF9YPh4p+0y933p19yC7Z5j0Wd7C+toIi+ENJZet6yKiJn
         nvvzNGQZpzOXzpbspgMkof620A0uAXb5EXlIlzxI8ZBMYCLFlytdEWrNENWieFRrx4hp
         Ft5A==
X-Gm-Message-State: AOAM531+gYE06EhVUFM51MCaUhyjoboMerwHf8o9j8yzi9wOvRbAauZd
        EM0NJdVLnhx7ZH4eNgOgcvi0/g==
X-Google-Smtp-Source: ABdhPJwXyGW/c1ON9gIyLRYmizCqx9vd6q4BAOMeRIO5q9uB5fEPGgCDMbH/4CT+NX6UzQp2Ucxz8Q==
X-Received: by 2002:a5d:59a2:: with SMTP id p2mr15198316wrr.252.1638459353896;
        Thu, 02 Dec 2021 07:35:53 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bd18sm3662wmb.43.2021.12.02.07.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 07:35:53 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 12/19] media: camss: fix VFE irq name
Date:   Thu,  2 Dec 2021 15:37:22 +0000
Message-Id: <20211202153729.3362372-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
References: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

vfe->id isn't set yet, so use "id" instead here.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
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

