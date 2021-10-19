Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B57C9432C5C
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 05:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232549AbhJSDmU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 23:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbhJSDmT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 23:42:19 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B42A6C06161C;
        Mon, 18 Oct 2021 20:40:07 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id t184so15571360pfd.0;
        Mon, 18 Oct 2021 20:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tOq8p3az740sR6QT9kkDjUVDdnMQ5++3NL//gil0HwI=;
        b=K8MKZ5H8jRnQ8zDmTuMJKCCXSA5LbWuQqn+kYiyjRzTK2JSOwOu7w/DRLr2K/xnyr6
         oI5BxJoHnYxTePO1mzqD//LDDijw61YN5EBAsJW/uvYZwOp1wWivmVwyCL1Oz5kftBYb
         UQLf3UZIpzD9dRPvRqMHgTSjF+N9gP837HW53XWzL+LIfNjZ8VDflLc5lV3aynEXzvmy
         /TAxSpVT5oFMTKf6KaDikAPVlp7bZ1koqqMYzj7xf/YpYmKmk7sRpyZzESlmskXkcTq/
         5Dz/lux08DIRF8mvC/opESlcioD5vTPfOX4FGPtsGomydxGjU95gbqFAyHlnzv0A2obp
         xxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tOq8p3az740sR6QT9kkDjUVDdnMQ5++3NL//gil0HwI=;
        b=xJ4QdKpzUzCdL3zGCnaUGpm1Pv3lh3RQqcE5NPDATrM+4Aiyu+x85FI82+u+d7k62/
         279KborB0a0u+TC/f3dkN6ETXsmQtI14PT5+HNdoB5/+ISWMuH2vMYzDIk+97ZCXIMJs
         2IqDTioubRIFCB8tu1sDni93z6q64MWH+jhKKbm6rXvA0exmAwNV7vfW6Wqdtw7MjVg2
         FxE/ASq8vlqJKFvyU4sxAktY5zq01J/4HONG/J3MzRu+KG20vC+GrBExpnAB990JDWVy
         rqSL/nS0qIpnFPN9QkT74lkAE6tGvhMWoJl/DZgSe69JIMel+7Pwu/agdKbaB9FzUGPN
         pl2w==
X-Gm-Message-State: AOAM5324cmnYlHF2Y0OLyOuUzXHKnD+9FiyW/eR5OB1K5iLHmP8vA5cY
        DALUV4BcUbcoCzTleGrXBb/QzaehhEYxQmzQKFo=
X-Google-Smtp-Source: ABdhPJy3OQcJks3p/zF6f6RTyJWmySP+ASYh672j3wgFkROgmDPkiKiprFxm6AB+daH639RcUIsCcA==
X-Received: by 2002:a63:ce0a:: with SMTP id y10mr26643738pgf.133.1634614807117;
        Mon, 18 Oct 2021 20:40:07 -0700 (PDT)
Received: from localhost.localdomain ([94.177.118.15])
        by smtp.gmail.com with ESMTPSA id s21sm7377955pfg.70.2021.10.18.20.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 20:40:06 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Dongliang Mu <mudongliangabcd@gmail.com>,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] driver: s3c_camif: move s3c_camif_unregister_subdev out of camif_unregister_media_entities
Date:   Tue, 19 Oct 2021 11:39:52 +0800
Message-Id: <20211019033953.3328944-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the error handling of s3c_camif_probe, s3c_camif_unregister_subdev
may be executed twice, one is from camif_unregister_media_entities.
Although there is sanity check about the registration status,
it is not good to call s3c_camif_unregister_subdev twice in the error
handling code.

Fix this by moving s3c_camif_unregister_subdev out of
camif_unregister_media_entities, and add a s3c_camif_unregister_subdev
in the s3c_camif_remove.

Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 drivers/media/platform/s3c-camif/camif-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/s3c-camif/camif-core.c b/drivers/media/platform/s3c-camif/camif-core.c
index e1d51fd3e700..ba91cf7d3ab0 100644
--- a/drivers/media/platform/s3c-camif/camif-core.c
+++ b/drivers/media/platform/s3c-camif/camif-core.c
@@ -292,7 +292,6 @@ static void camif_unregister_media_entities(struct camif_dev *camif)
 {
 	camif_unregister_video_nodes(camif);
 	camif_unregister_sensor(camif);
-	s3c_camif_unregister_subdev(camif);
 }
 
 /*
@@ -524,6 +523,7 @@ static int s3c_camif_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	camif_clk_put(camif);
+	s3c_camif_unregister_subdev(camif);
 	pdata->gpio_put();
 
 	return 0;
-- 
2.25.1

