Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0AC044D9EC
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234178AbhKKQLp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:11:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234138AbhKKQLo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:11:44 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 715CBC061767
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:55 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id t30so10618616wra.10
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BEL08sASglLnc0YJF8xLj56OK6VU80+SSEepEY/qQGM=;
        b=ZWBOZHEHwTOsgc9/oYvi1imDl/P07u2yoD36MpcNd9A79wdaHlWQxfIwrkjPsbtKeI
         gm8c1Gt5dLmP/UDD+kKoptcJN2JwU+1uZAYHfpU/+92vatzY6bCDurjeN3zjE0jRTTxT
         ISSHjQdwG3ZPeYpbTxXwVanSIl/mpIUbLwjmWi/Uv/uYiK4j+MpCGehZ5ZMdKf8+4Npq
         LX9OMhj8CwQkb7r8OEspWkEgDwPdT+LbzO9QQljfXPfyQxHtMxnRhMP9cPP6SJdS0tio
         pwuMmb2Wmuwxf/8mMgqXz9T7kxTxY0WVIYmSZYNl5uLK1bvd27PoAu3R93jJPZyyJ/be
         99Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BEL08sASglLnc0YJF8xLj56OK6VU80+SSEepEY/qQGM=;
        b=NT0UcMO/hCsWLHHdlZfb3YoO1zHaBUv9/FkSS/S2gybO4d0o89ugoXTga36G7Ah7Hp
         msQGZTPMT1gzj9uBBn5nHr2NB6perBIM49Uon+GYe0Di8zZ1FLUAbW4NsKhCWBWSnOZW
         OOxENlP27OlA7mAqrCvPaFaRXfWysOCptg5dO3qXSSYRhjGSq/f9h5SVG7E1tYdgx2hE
         q4uiCsJu89tQFvuE/1onY6/2/Ho1f7kk4gk+55+IRF2Un3Ktg4pFc5ix/afFwnlT2JXL
         0PG1/TfBiHxZm7ej8Yf0NEe1dCBvKYuzqemYgM+nJW530xexTAf5lEl7t8otiMPrgQp3
         /VPQ==
X-Gm-Message-State: AOAM531eH+Sj2qxM6gS/vfR5hnvFLKHFA9Qbmxlo2sOPYh0Hy6vooe/r
        xotwc+ocsnds/2aniIOBm6wtiqAXP5Njpg==
X-Google-Smtp-Source: ABdhPJyyrhFK9m7qv8B9/v3Mu7T1R5jcFmgg3ME7SW9Ss+zWNjctWgmMQsl66wcWj+d/DU/auXsDKw==
X-Received: by 2002:adf:c78d:: with SMTP id l13mr10028196wrg.134.1636646934050;
        Thu, 11 Nov 2021 08:08:54 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x8sm3245558wrw.6.2021.11.11.08.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:08:53 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     inux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH 12/18] media: camss: fix VFE irq name
Date:   Thu, 11 Nov 2021 16:10:32 +0000
Message-Id: <20211111161038.3936217-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
References: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
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

