Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6F301C679F
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 07:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbgEFFua (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 01:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726761AbgEFFu3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 01:50:29 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 726F2C061A0F
        for <linux-media@vger.kernel.org>; Tue,  5 May 2020 22:50:28 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f7so454371pfa.9
        for <linux-media@vger.kernel.org>; Tue, 05 May 2020 22:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xNX2Jw3bggOqG+5nYPa2uqxysBzOfcRV74MkeaFU514=;
        b=M5y8/s3SulY3lzBKvRMnyiCfcyROkGDnu1LS8AmOMndWRhfVrQGhKS1f75nwyUlj2m
         LN9x9SSQFlx2M59Jjjbiskhq82qGNXgQ7DfVz/16fbK5RjlBzmk+aiEDlZlLafSVsv5o
         rtfjRNWfhaukA4aRZlleZGCroUu8cDGqfkUn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xNX2Jw3bggOqG+5nYPa2uqxysBzOfcRV74MkeaFU514=;
        b=ImhjhRKeU/fAELqBeqenMLJF5eIgNVXfOdqUQ4yPZtuF/aW+KVZtYO5ohW11gqs/7y
         zxbp6ePBrdJZX0xy719Wv1GFV34h3irhgb4suoncix3iQxvVDGjsaDpc+ebtHf2KsQm8
         N0HOLBznJb693YjFdBOlX9g3fxIbELScvKVLmZ+nihGBZhHqg94wfcQ2mhjnUfDdthxo
         wbX3phRuX4EW6aEcSnGXPAJUo1atS777hA6cNmXvpVBURdY1ZSrK3g/9cvSYMJIj8WE9
         U4bjegvYHAPjgLUCat1J17sruKoLxlgcZS20t4rT6WR64WQcIpH1GddKwnrJL3aXW+gD
         lyaw==
X-Gm-Message-State: AGi0PubenLRIBHu1jyWlBY7NF8gxwAVphjtssbr4QU2gG3McaGkLi750
        t2/AleTrq4sFq9ax+t4dfQmaQw==
X-Google-Smtp-Source: APiQypKlc/nYndVnKIEUfEb5mcot4tPrbEozcvijAAg8qzicqRQLv80bi22dUdsqMQmRh5vI0S6icA==
X-Received: by 2002:a63:7214:: with SMTP id n20mr5863410pgc.437.1588744227993;
        Tue, 05 May 2020 22:50:27 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
        by smtp.gmail.com with ESMTPSA id r31sm730629pgl.86.2020.05.05.22.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 22:50:27 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Eizan Miyamoto <eizan@chromium.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 3/5] [media] mtk-mdp: handle vpu_wdt_reg_handler() errors during probe
Date:   Wed,  6 May 2020 15:49:18 +1000
Message-Id: <20200506154832.v2.3.Ia8efd7905e2fcfc81f547e27a51f06373624b3da@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200506054920.109738-1-eizan@chromium.org>
References: <20200506054920.109738-1-eizan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a cleanup to better handle errors during MDP probe.

Signed-off-by: eizan@chromium.org
Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

Changes in v1:
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

