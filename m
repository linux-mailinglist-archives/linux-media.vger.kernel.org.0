Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32A453E8AE2
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 09:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235320AbhHKHQF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 03:16:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234855AbhHKHQE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 03:16:04 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 168A5C061765
        for <linux-media@vger.kernel.org>; Wed, 11 Aug 2021 00:15:41 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id 28-20020a17090a031cb0290178dcd8a4d1so4185992pje.0
        for <linux-media@vger.kernel.org>; Wed, 11 Aug 2021 00:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qePfP9EW1GBUzq27srhUsJLE0N5J6Kl3GGrYQK3Z8yo=;
        b=n+UWQMgmuQmQG2EekPaRfL1GukjblvdMdl3L0W6t76rUyL8BrVBwyk/RqRaD8LUFYf
         i+fl0JsX4mgRuhpoDAoy2mEYgondaqor4wwFp6xWnsggtcaYJpiEqRLYfWdRvANUSXCI
         ht3i6jqDk3nZ2tnpEf90h7o7iJuoKdtB7h868=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qePfP9EW1GBUzq27srhUsJLE0N5J6Kl3GGrYQK3Z8yo=;
        b=o79Sf+Uw7FYY1uAvOXG43zO/t9I1LFS7pu3beDGFzsoyVC4K9eWTJ6JvqP0b+70wdt
         qLV3UxDLvwH36Z8Z3RHo1jFg4m52DfQG7GGANXZmv9UPO3MeYmQVoOq7nfsTiGXLu/4J
         yuJwQ6ZCB3MiDT3QHTQukNd5A6u8PjCH9Lc+u/NedHCsPNawn16v6RJjx1wykcl4+SZz
         ZyWWWBk1bFiDH9y2wpYEhPQEja1SpkqaKJPt9KM0+zE1QyhfR74X3/WeLImQS+DV6z4B
         sSGR1jSjr8MtJpCD+f7jFRyurONuxAcC86l/DGHySB9GYrdqjscMIPCj3tHhmxw2832+
         Bq3Q==
X-Gm-Message-State: AOAM532JLZosQ89/tGdSwt6aU3SHjIPHyaLZnlJXx4xsiNh4g60TYk/8
        ZxiyyuvNDmo4Q/yGsjiLeV86KA==
X-Google-Smtp-Source: ABdhPJzkGjGYw/o1M8iFsyfy2/UuALOcoJa9U79ngqCU1NfSSOdr6MzNBX3e6S6NeHAjwCmoYcqpoA==
X-Received: by 2002:a63:f011:: with SMTP id k17mr407314pgh.391.1628666140516;
        Wed, 11 Aug 2021 00:15:40 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:8289:6db8:5ebc:e97e])
        by smtp.gmail.com with UTF8SMTPSA id y4sm5532773pjg.9.2021.08.11.00.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Aug 2021 00:15:40 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     enric.balletbo@collabora.com, dafna.hirschfeld@collabora.com,
        Eizan Miyamoto <eizan@chromium.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mtk-mdp: make mtk_mdp_comp_init static
Date:   Wed, 11 Aug 2021 17:15:15 +1000
Message-Id: <20210811171512.1.I4a34d99ace27ad2fe55e22c90244d3bba2c29bab@changeid>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This function isn't and doesn't need to be used outside of
mtk_mdp_comp.c

This patch depends on and is a follow-up to
https://patchwork.kernel.org/project/linux-mediatek/list/?series=524929

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 2 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 9527649de98e..2cf8f1864f8c 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -234,7 +234,7 @@ static const struct component_ops mtk_mdp_component_ops = {
 	.unbind = mtk_mdp_comp_unbind,
 };
 
-int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
+static int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
 {
 	struct device_node *larb_node;
 	struct platform_device *larb_pdev;
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index e3d6aef52869..aa6442cc8c1d 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -21,8 +21,6 @@ struct mtk_mdp_comp {
 	struct device		*larb_dev;
 };
 
-int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
-
 int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp);
 int mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp);
 
-- 
2.32.0.605.g8dce9f2422-goog

