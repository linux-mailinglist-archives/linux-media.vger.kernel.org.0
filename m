Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C35B1C6797
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 07:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgEFFuP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 01:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725771AbgEFFuP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 01:50:15 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4F47C061A0F
        for <linux-media@vger.kernel.org>; Tue,  5 May 2020 22:50:13 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o18so301827pgg.8
        for <linux-media@vger.kernel.org>; Tue, 05 May 2020 22:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ldWprC6/gJRy30f4qI0sd87+jEX+5JVD2qRmLKUKSuY=;
        b=kRWBWqQa6ecU6mj/tDkQ5CyX0eu1M74l2wFd/sa8roAbVsA16hSvJ0poORwNmLvTWq
         uUnZcYIowQQ867FiKUZFFwcagHQ8pwFgab6F8bfGIY0UHVI/XB5+RtdjqE+5r7ujhQYu
         t/DgPgoT6wGvpRRdCG/kerbjz/d5Ojyd45T24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ldWprC6/gJRy30f4qI0sd87+jEX+5JVD2qRmLKUKSuY=;
        b=p2tHSyO8wN+GB3XvzN+DwIOvz40AqpWlXwFo3pGaTVf0pwcLr1n/hyReRziAuItD8o
         hTJBI/rpIPfA1zqI4tdN04q4gzKbOOnCwuNK5B3n2e9qjl5CVwnWl2kyE69AZOcn0qir
         FPvFb1o6Xs6OUStJQdybcPz06g/H0yhFrDlWZQ/B1vUFl7gP6boou5vSDjDdnivqYd3I
         k7YMkX2Co+FhnVAgexu3errbtcn+hogZ+kLJ/DM9FPSD/x/YsI202Tv+PMNsNPQ1fCee
         D/0Er5GTUfPrNgNwxbzhSadWPAiL/AQlzWz7f2y7EdqFNk+4x/SF5+WGSXZJV5oPuPBA
         goAg==
X-Gm-Message-State: AGi0PubnFgdM/ahb7+m4BE812VzJdkCuqW1UeM4OafOLbXRimplaLlSD
        OUEiRuNl3h18H6xgGhFIUlXjLA==
X-Google-Smtp-Source: APiQypLBf6Z7OsDBx417Ig2iNo0B8it48czxeprZK9XxePTpiPqDkOB4YpcOD4sdhh224rDHgW0Hsg==
X-Received: by 2002:aa7:9a43:: with SMTP id x3mr6662861pfj.266.1588744213491;
        Tue, 05 May 2020 22:50:13 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
        by smtp.gmail.com with ESMTPSA id z13sm3734853pjz.42.2020.05.05.22.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 22:50:13 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Eizan Miyamoto <eizan@chromium.org>,
        Enric Balletbo I Serra <enric.balletbo@collabora.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/5] [media] mtk-mdp: remove mtk_mdp_comp.regs from mtk_mdp_comp.h
Date:   Wed,  6 May 2020 15:49:16 +1000
Message-Id: <20200506154832.v2.1.I0d52fd84fe481e254a10960b060f32c47ce0d202@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200506054920.109738-1-eizan@chromium.org>
References: <20200506054920.109738-1-eizan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These fields are not used and can be removed.

Signed-off-by: eizan@chromium.org
Reviewed-by: Enric Balletbo I Serra <enric.balletbo@collabora.com>
Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

Changes in v1: None

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 58abfbdfb82d..c76cd61fb178 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -106,7 +106,6 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
 	comp->dev_node = of_node_get(node);
 	comp->id = comp_id;
 	comp->type = mtk_mdp_matches[comp_id].type;
-	comp->regs = of_iomap(node, 0);
 
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
 		comp->clk[i] = of_clk_get(node, i);
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index 998a4b953025..3b83bd6e0d8b 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -38,7 +38,6 @@ enum mtk_mdp_comp_id {
  * struct mtk_mdp_comp - the MDP's function component data
  * @dev_node:	component device node
  * @clk:	clocks required for component
- * @regs:	Mapped address of component registers.
  * @larb_dev:	SMI device required for component
  * @type:	component type
  * @id:		component ID
@@ -46,7 +45,6 @@ enum mtk_mdp_comp_id {
 struct mtk_mdp_comp {
 	struct device_node	*dev_node;
 	struct clk		*clk[2];
-	void __iomem		*regs;
 	struct device		*larb_dev;
 	enum mtk_mdp_comp_type	type;
 	enum mtk_mdp_comp_id	id;
-- 
2.26.2.526.g744177e7f7-goog

