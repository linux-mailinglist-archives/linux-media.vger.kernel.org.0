Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC742FDB6A
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 22:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728914AbhATUzR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 15:55:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbhATNpT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 08:45:19 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A4BC0613C1
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:44:21 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id b5so401584wrr.10
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m6jdKU1G+/Gba6Pdo2VNljOQ104HqrrC2plW0O0vdBw=;
        b=TCpEfHql2KeLXkQuBo0IWLnpSxbjD9f9d8gS1jZQ4h5LLgt03BPvJBlALGalia2+1G
         He0074nSmOAlNQhuQWvo7y5M0MTuUMOvlwMNrqpAzPHnTLMoOCoVA7hW1+reNZ8TZFuZ
         d5pn5RdFa7gIl0hKLfnRjd0Z9LT7xIP9cVIc7UuTmziPFQJBZ/xXE26AGKINukE3q21e
         X495mKKQkex8qXgtDB35w1UnePv9HfONB3Y11ZKDaFJ/uNbHYZUT33P5hpN/WoQqkod5
         TQllwgC+a4eY85QsuwcU838kvXl9pnC72QBJScUxEWN77uNtFyPqc18P60gPJuVPeqN0
         ceJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m6jdKU1G+/Gba6Pdo2VNljOQ104HqrrC2plW0O0vdBw=;
        b=rw6tT5uXZFr7yAtBR46q7tpzuZOhlFusVF8oi1MeJe4T9yxdRZJDl7nRx0ltliWKns
         zx/Nqbo34ZOVSGQfN9AZ2dfPOOSqcSfxM6dY36TTRqciTAjZ4joocm44hER895ZThTOm
         4oUVIYQwar7apL8jVQf1S6U77iSg8Sa7zfkIWhSHsOCWV/xOcg3yIvHAwOr97gCkyr7h
         kJL7Eor8Ei/VDd7cLbXrOvCRnuZMQgrr2zE7ACKlFGphJN+WzBnZt9b0fei3nO6bkNLp
         lB3cE1S+1AZGQ0UWKNtk4rUWnoo3amTYyLAe9MmU8fkD8tHWXO7jfjAAaFV6jTJXej5+
         WYhg==
X-Gm-Message-State: AOAM533XZjDlcms50Z70JK79+Mk06ukZ6Vex7Ed9ujH7fB4SYvQnPyFu
        ImsDa6O/kDL/UPeAAJEDCzhQrg==
X-Google-Smtp-Source: ABdhPJxfOKWY9zFHgiY6UK5UbH0iV3KBaSmVOgwF878taDYibAZNbPU9+9A/S3c0512iBZx0mPp0GA==
X-Received: by 2002:a5d:6289:: with SMTP id k9mr9896508wru.200.1611150260134;
        Wed, 20 Jan 2021 05:44:20 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:93b3:1f80:ae7b:a5c6])
        by smtp.gmail.com with ESMTPSA id t67sm4224075wmt.28.2021.01.20.05.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 05:44:19 -0800 (PST)
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
Subject: [PATCH v2 01/22] media: camss: Fix vfe_isr_comp_done() documentation
Date:   Wed, 20 Jan 2021 14:43:36 +0100
Message-Id: <20210120134357.1522254-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Function name is comment is wrong, and was changed to be
the same as the actual function name.

The comment was changed to kerneldoc format.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

Changes since v1
 - Bjorn: Fix function doc name & use kerneldoc format

 drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index fae2b513b2f9..94c9ca7d5cbb 100644
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

