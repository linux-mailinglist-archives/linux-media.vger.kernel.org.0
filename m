Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C08D9432C00
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 05:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbhJSDCz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 23:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhJSDCy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 23:02:54 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D6CC06161C;
        Mon, 18 Oct 2021 20:00:43 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id j190so11298202pgd.0;
        Mon, 18 Oct 2021 20:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Du7hGfWofk5Y9PYxqwgL02UhVD5OoKwO5dVIpF7FLGw=;
        b=FX3JBsryhWMJVTta9l1Jhc5PsA9+IwgdmpKy41or5UgMVS/1AOLR79tkwB6XWOVOs8
         AfX+qaSscxl67HZUJe+BvJkYX3A0rbQX6dGtyhs9aHg6PYo9SOgrQgSOqN9AY11U/qHR
         +Da8iJI7LuZeztUyQEtoEFY+EqZfp34qmjY88631WuzBMQ4lVPhjNsC2gviR2qz0EVhv
         Bvwxo3ce1+r2zYQCNvNvErjoPxjeOtgZKM4Co8MY1mXqXW09e/o6n7PhMz5jLRjQPzBu
         YTeYzOKI5hCu//NuD1JaSOVT47GhD/Sb8vA+YmEMLhdeRbKdPedGPEqTCqU9Oy+qSGPL
         e52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Du7hGfWofk5Y9PYxqwgL02UhVD5OoKwO5dVIpF7FLGw=;
        b=Y0POp52WDaBDLqBMtR+DI+1uA20vwKJo7iOqnklpp257VbsInoElZhXs/S4I2KPYlX
         SuBXd5YrfiDBbErQw+MqEVSlI13j1LarD3M9jbFFE11Xvm/qyfbXtyXjtBbzxiXsDpaz
         7e344ojM+sR6tEsQn3jwrSjFwUzQAgwfyqIyh70ddx7U6dIItX8mqP3Y8UaqnvRtA1Fz
         vwHkMoVsHygh37E8PFtuOc4P8tjoufFJeD+KvfE9ejUXM2KOFb9Y5hq9Mj84JTbE9gF4
         p0mOxj50S1hu44kOXB0FArukPC1ieLssfVte46EfP8Wn4Yxpujsf4CJFyOHPlEijj/+q
         VoKQ==
X-Gm-Message-State: AOAM530MbxI+3xt9yRm6+7uixRV8G8y2rkO+CIdviN3zLK4jxMQFuFD0
        5f9HyyePIsYjNFtXhEDg3Ns=
X-Google-Smtp-Source: ABdhPJyFg858TcueogG6Qus2VVYUo5lmLkp1ZuiMzlw1Wt6+dmUfr5Y2So7INCraknWb9iOJQ12vAQ==
X-Received: by 2002:a05:6a00:731:b0:44c:7c1b:fe6a with SMTP id 17-20020a056a00073100b0044c7c1bfe6amr32484334pfm.44.1634612442499;
        Mon, 18 Oct 2021 20:00:42 -0700 (PDT)
Received: from localhost.localdomain ([94.177.118.15])
        by smtp.gmail.com with ESMTPSA id lp9sm801540pjb.35.2021.10.18.20.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 20:00:41 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Dongliang Mu <mudongliangabcd@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] driver: hva: add pm_runtime_disable in the error handling code of hva_hw_probe
Date:   Tue, 19 Oct 2021 11:00:29 +0800
Message-Id: <20211019030030.3326236-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the error handling code of hva_hw_probe, it fails to invoke
pm_runtime_disable in many error sites.

Fix this by adding a label err_disable with pm_runtime_disable and
adjust one goto from label err_clk to err_disable.

Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 drivers/media/platform/sti/hva/hva-hw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/sti/hva/hva-hw.c b/drivers/media/platform/sti/hva/hva-hw.c
index 30fb1aa4a351..5dd5dbf59cfe 100644
--- a/drivers/media/platform/sti/hva/hva-hw.c
+++ b/drivers/media/platform/sti/hva/hva-hw.c
@@ -387,7 +387,7 @@ int hva_hw_probe(struct platform_device *pdev, struct hva_dev *hva)
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
 		dev_err(dev, "%s     failed to set PM\n", HVA_PREFIX);
-		goto err_clk;
+		goto err_disable;
 	}
 
 	/* check IP hardware version */
@@ -405,6 +405,8 @@ int hva_hw_probe(struct platform_device *pdev, struct hva_dev *hva)
 
 err_pm:
 	pm_runtime_put(dev);
+err_disable:
+	pm_runtime_disable(dev);
 err_clk:
 	if (hva->clk)
 		clk_unprepare(hva->clk);
-- 
2.25.1

