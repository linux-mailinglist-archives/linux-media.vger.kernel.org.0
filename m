Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3724337BCA
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 19:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbhCKSKa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 13:10:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbhCKSKB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 13:10:01 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82387C061764
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 10:10:00 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id e19so48232754ejt.3
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 10:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OfcdS0huGYBFauDoZapDpV12oshuFzeyuB4yCyBnMLQ=;
        b=ydIMlSNT7f30UN/TTjCPavpqxIDelgxtq3P9yAlxTrbFMpWeJDvGahPFj87qJc47Lk
         hnqXeX117+jSwo8lMEVdFTYS5xUvhFfhwoBIWZAxeLb/8ZmvGKRj0EAxYzgzIHCJBiBS
         yEu1ZAjgwV+LT4tnn8irFGa9SVPnOQaIkz5qNq0qP8L4dE6LDzp6u7bK6kV3Mlnj9y9j
         81kfK4lgikbBz3Kl3UzVMrcz2pAj/vbGk3Aug18w64+y/XbfXmrP9pQr/QZrvaGsV6gj
         iKtRuz3FsSZPwDjsdWCIhOOHnbj13c4RlPkzB2/A9rxDjNpFcGzUyGnU8OvU9Qm8Qkt0
         UDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OfcdS0huGYBFauDoZapDpV12oshuFzeyuB4yCyBnMLQ=;
        b=QvTpKRhpB+F8kr6azPllBhkNK2Fa/g1uiWxU0FrC5JUW+Ao/TaGGGVrSTLrjcb399Q
         zPfW1KwEL6TG6afcjT8Y7pyoM6aY7GKKi4/y24Mr9dIyvLJxhILqx3JB7TwGxpdHEYHn
         z3N1eGJ2SIrGVInjOIV783o2VyUoFpQdCQE54CrraWlnrk5dJkObd3dCYS0EkH/Hc/HK
         yWBNrfajrJ9BTu8TwstmLasySTsjZwAcxJ1jovCv4RSem3bYCUaaIyi3JO4T13jT6ZVY
         RxzhZmJdmF6Irvne9p8yxSe3qA7piRNVbJ3wve37EfOJKKIuz3jh7rfX5piMDpG4JKPr
         AuEQ==
X-Gm-Message-State: AOAM531vwuX47cF1Nn+VsV0lm/QZf+pcS2tkLSqKrzZM677mVLvbYla2
        uK8wYJcAT1LsFbkKEHtcMDD+Qg==
X-Google-Smtp-Source: ABdhPJxczMFaJENfbxPAZ4jjiF0dAom6VDWrN5gcEjx7WdvfHE6cwU7dibV98WBNFdrAWpN1SK0Pxw==
X-Received: by 2002:a17:906:2551:: with SMTP id j17mr4282436ejb.441.1615486199236;
        Thu, 11 Mar 2021 10:09:59 -0800 (PST)
Received: from localhost.localdomain ([2a02:2454:3e3:5f00:8e01:34c:da50:eb7e])
        by smtp.gmail.com with ESMTPSA id a22sm1741290ejr.89.2021.03.11.10.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 10:09:58 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v7 01/22] media: camss: Fix vfe_isr_comp_done() documentation
Date:   Thu, 11 Mar 2021 19:09:27 +0100
Message-Id: <20210311180948.268343-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210311180948.268343-1-robert.foss@linaro.org>
References: <20210311180948.268343-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Function name in comment is wrong, and was changed to be
the same as the actual function name.

The comment was changed to kerneldoc format.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---

Changes since v1:
 - Bjorn: Fix function doc name & use kerneldoc format

Changes since v5:
 - Nicolas: Fixed typo in commit message
 - Andrey: Added r-b


 drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index b2c95b46ce66..f50e08c4fd11 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1076,8 +1076,8 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 }
 
-/*
- * vfe_isr_wm_done - Process composite image done interrupt
+/**
+ * vfe_isr_comp_done() - Process composite image done interrupt
  * @vfe: VFE Device
  * @comp: Composite image id
  */
-- 
2.27.0

