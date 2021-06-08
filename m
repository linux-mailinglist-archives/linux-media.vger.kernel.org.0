Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E993A0736
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 00:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235557AbhFHWlY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 18:41:24 -0400
Received: from mail-qv1-f51.google.com ([209.85.219.51]:42806 "EHLO
        mail-qv1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235483AbhFHWlL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 18:41:11 -0400
Received: by mail-qv1-f51.google.com with SMTP id c10so9014295qvo.9
        for <linux-media@vger.kernel.org>; Tue, 08 Jun 2021 15:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YF+r6J+3VfhXF0w7kNy6T/fUbmvmV9LKX6YLuEVLoRg=;
        b=MjpIW44LVEmHX2q0gFwSod1kO98C0xxLFr85YAgYxUpGYGrzDGrULry/yapkewaxid
         xCZ9OxC2S5ordjs24B5FywBkr+eKxz6RC+hlpUBoPvBwnDN0/IGLdtCt2AlAZVz/wVjp
         ejO7BcE8qYXoobqgGP8bs6pGAdGiKwT58JSQTLk4dSODKRbARDSSZkMvspoy9dACOQjg
         RAM/ZNnSpNzsjGAIpTZdb6uzz1/6D4eM14O9gNNbxSKS6e594IrxHMBXS+3NRrvclfa5
         kQVD3ZUHSzeVMSG3vRjiCW7T3F0gP50ihCCVR7YaHG2xhMJhOITC3lJFDNRzenXEPWZw
         lH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YF+r6J+3VfhXF0w7kNy6T/fUbmvmV9LKX6YLuEVLoRg=;
        b=ei7SavvZ2SlMZKdf6G9AYhIQ79r5OglQHHziUqKbsissHMe93uIGBz2VHduMCNzKFn
         74b/M+Y+Hio9k3wlzGmC5ke2HLhPI3Lc3VHzp6FyNJwJIikay4xasZtBPBEKeptcgdV5
         Uh6mBb15IGMQmxTr+nDcC9XKGntGa+5GhSqkEur51ATXq4gZqBmwrxzoSgcMbL2cIrDs
         lkxQdDHhOt1GIHW7zF7odhbSe2ctOg8h/iM9is3+yGjJIkOq4SwJdQpiOdDUYwOOUslH
         lFgqH5h3cfLRJDubS64/RDv/gHUZ+0JbV53B2eFhiHspWbRiOMY0xznniwQ1JnAKvcVw
         skxw==
X-Gm-Message-State: AOAM531uOQO94zgmu0JFt4Lj5eFMnlrETIDFlTOqwiESDH+D3IjRHNFt
        FYQ+O15UJ5lsO9aXNzTM/GnSaA==
X-Google-Smtp-Source: ABdhPJwVbH69KUAIfKnaIV0u4eUMVkZv8Bc78jwoeYG/XhR8Lr7OU+NamcJAKAvtFSaHM426dcVjlw==
X-Received: by 2002:a05:6214:6b1:: with SMTP id s17mr2811745qvz.60.1623191882071;
        Tue, 08 Jun 2021 15:38:02 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id m3sm2324266qkh.135.2021.06.08.15.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 15:38:01 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 13/17] media: camss: vfe-170: fix "VFE halt timeout" error
Date:   Tue,  8 Jun 2021 18:35:02 -0400
Message-Id: <20210608223513.23193-14-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608223513.23193-1-jonathan@marek.ca>
References: <20210608223513.23193-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This function waits for halt_complete but doesn't do anything to cause
it to complete, and always hits the "VFE halt timeout" error. Just delete
this code for now.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-170.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index 1de793b218194..ba142c8cec6ee 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -355,17 +355,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
  */
 static int vfe_halt(struct vfe_device *vfe)
 {
-	unsigned long time;
-
-	reinit_completion(&vfe->halt_complete);
-
-	time = wait_for_completion_timeout(&vfe->halt_complete,
-					   msecs_to_jiffies(VFE_HALT_TIMEOUT_MS));
-	if (!time) {
-		dev_err(vfe->camss->dev, "VFE halt timeout\n");
-		return -EIO;
-	}
-
+	/* rely on vfe_disable_output() to stop the VFE */
 	return 0;
 }
 
-- 
2.26.1

