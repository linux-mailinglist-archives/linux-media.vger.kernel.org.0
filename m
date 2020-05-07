Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F9E1C869A
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 12:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbgEGKYv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 06:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725857AbgEGKYt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 06:24:49 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80431C061A10
        for <linux-media@vger.kernel.org>; Thu,  7 May 2020 03:24:48 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id b6so1884441plz.13
        for <linux-media@vger.kernel.org>; Thu, 07 May 2020 03:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B/Mk9PnpQZ4xKWEBXlLMDvhktcZ9bgwGO85pTWBmd1Q=;
        b=Uw9tkn4tmqYAbTMf70CLe39oO9q1CC6aVjLT1Rme6khxLYX4hxUID3ZnvBSZGakv5P
         cGKuKJqk2HPHbQ4P1iQd69NwgL2xHQejKzAHF3MGaRFbXyURliEk1oHrAxQepDxSyXed
         VFbE4tH2UIH74TV9w+cRWY5I37BG/H1vO1EhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B/Mk9PnpQZ4xKWEBXlLMDvhktcZ9bgwGO85pTWBmd1Q=;
        b=PewRDr+ve0UwLN/KVTDnI6VyhmgRZlCrwOpR1aE9x3XNhBkHtfvYAqPuDfiijkATDy
         aJUQnJf5JK9uVe8g3tQZ+izpoWvJeKYOGTVeH0W0lYFC4XXv8ng+SzFMiZk/DqQjyfNk
         SWkm2Aa57WVp5lzekRSyoSwIfmMu6xG420vIfX5PrulkKxgL4ODvitQdSjnTYvYAtqBU
         EWZ5G1S+SDsoigtMdpSklGnulgfGebzP8yuwaVF2bFzUkeF/MbaQJEnmbibsFfaa9fHR
         nKTjzMGwmJc4qONeBruBivCiB6d8395Jch45sd44a6lC5RblPkXUM1RF/tGsUbpYpoZC
         6LlA==
X-Gm-Message-State: AGi0Pubd+Xd+e2NY6D9gO7PQI42AxekKiiN6PQgBO0Uxr2R/U5duA6Lc
        fXLaJulhaL5D+wnCK0aAekUKvg==
X-Google-Smtp-Source: APiQypIfdyYf1DVe2NADcLWJNyPuVcmkF60Nyz26uFMfQ6Htik4/hMklktg3MMP3+ePUbdo+ebw1vA==
X-Received: by 2002:a17:90a:b78e:: with SMTP id m14mr2742862pjr.114.1588847088130;
        Thu, 07 May 2020 03:24:48 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
        by smtp.gmail.com with ESMTPSA id a138sm4514903pfd.32.2020.05.07.03.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 03:24:47 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Eizan Miyamoto <eizan@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v3 3/5] [media] mtk-mdp: handle vpu_wdt_reg_handler() errors during probe
Date:   Thu,  7 May 2020 20:23:46 +1000
Message-Id: <20200507202337.v3.3.Ia8efd7905e2fcfc81f547e27a51f06373624b3da@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200507102345.81849-1-eizan@chromium.org>
References: <20200507102345.81849-1-eizan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a cleanup to better handle errors during MDP probe.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v3: None
Changes in v2:
- remove unnecessary error handling labels in favor of err_m2m_register

 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index 9b24b8d46eb7..17d155219ba2 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -188,8 +188,12 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	}
 
 	mdp->vpu_dev = vpu_get_plat_device(pdev);
-	vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
-			    VPU_RST_MDP);
+	ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
+				  VPU_RST_MDP);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register reset handler\n");
+		goto err_m2m_register;
+	}
 
 	platform_set_drvdata(pdev, mdp);
 
-- 
2.26.2.526.g744177e7f7-goog

