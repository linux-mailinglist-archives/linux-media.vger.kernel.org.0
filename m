Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A15972FDB66
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 22:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728274AbhATUzI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 15:55:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbhATNpT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 08:45:19 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A563C061793
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:44:23 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id a1so1851383wrq.6
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hzjOsw+gZMqd2RylzSWRrirjORZcFF3uOV1qZMXwFSE=;
        b=MDr4m1cQtrKYTuogx3tagcy8TWnB1S8riT1kr473MvBdrqeOyOw64BO8zrIAz7M1sO
         ofUFIZcdR5XKJMDZFxVW0FHrtepyblgSWrLoLPgP24eNfaNn985CdzsPSRP9FOT7JAbR
         ZxYSRGIJ6tzGoBLjAGSfSBAyrrh6yOiViYjvFiUvDUarwXc18JcFUXLEKY+60zkn3XeF
         z0+3FqRB6WQ6/eatARlgJm9sbYxRvZSN0NiQrdGn2jEKXmiH/yrxg7gQjvaclI1vSJsU
         Ixa16uHt3CDmQtPEB7KcF7EsNAO26DpgKb3oi6MS1K1r5tbAwQJR4exh1kIoJwWOlt1W
         pWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hzjOsw+gZMqd2RylzSWRrirjORZcFF3uOV1qZMXwFSE=;
        b=WbWMkjU7dV2kkWdL4GwbsmJnCKaaCeD6nXHRE0ABGmZhJF2rMvJZ286pZIIEGDPmt7
         QCPx6T5OounGbbeok2wUesgauCfVY/5LGCqjlb9FtTJ3boFo49JjeMgq8erpylq/YZ3b
         eAm3664axbovEzzYDtbBig0Z48b097W6EcF+uxu2czo7pUOviOmgBhnvFN4tSIJsz+Pw
         37mCK8VnalVAN2t3aOhZ7DNq6VQcVX3FzIYsnVAK8SORiU84YZMQR4Psqc0uEEUPVwig
         ZOJ8MJyFFC4rnz0FY/XMzWEnfuUQo9v881cuAKd/NKZ5gXIX3MGMttWQnBEcIZEFPPET
         m5jQ==
X-Gm-Message-State: AOAM533f5qvQ5t1PbkyIn0UNvRzNCX1GvNbhGXGL4+Z+4EiZsYc7aool
        wKCJzfbGE4bIga0OSVg4FJapCw==
X-Google-Smtp-Source: ABdhPJxtKoWZxFO48ty6vnuuc8mj6XvSBUKa056meVNFEJFxCGUYKdtrwXhPXzrsqQTT0ot3PzTUyQ==
X-Received: by 2002:a5d:4d50:: with SMTP id a16mr9171576wru.43.1611150262021;
        Wed, 20 Jan 2021 05:44:22 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:93b3:1f80:ae7b:a5c6])
        by smtp.gmail.com with ESMTPSA id t67sm4224075wmt.28.2021.01.20.05.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 05:44:21 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        vkoul@kernel.org, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v2 02/22] media: camss: Fix vfe_isr comment typo
Date:   Wed, 20 Jan 2021 14:43:37 +0100
Message-Id: <20210120134357.1522254-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120134357.1522254-1-robert.foss@linaro.org>
References: <20210120134357.1522254-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Comment refers to ISPIF, but this is incorrect. Only
the VFE interrupts are handled by this function.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1
 - Bjorn: Add r-b

 drivers/media/platform/qcom/camss/camss-vfe-4-1.c | 2 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 174a36be6f5d..a1b56b89130d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -922,7 +922,7 @@ static void vfe_violation_read(struct vfe_device *vfe)
 }
 
 /*
- * vfe_isr - ISPIF module interrupt handler
+ * vfe_isr - VFE module interrupt handler
  * @irq: Interrupt line
  * @dev: VFE device
  *
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index b5704a2f119b..84c33b8f9fe3 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -1055,7 +1055,7 @@ static void vfe_violation_read(struct vfe_device *vfe)
 }
 
 /*
- * vfe_isr - ISPIF module interrupt handler
+ * vfe_isr - VFE module interrupt handler
  * @irq: Interrupt line
  * @dev: VFE device
  *
-- 
2.27.0

