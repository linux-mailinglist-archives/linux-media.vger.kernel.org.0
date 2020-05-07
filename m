Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F26E1C8692
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 12:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbgEGKYR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 06:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725834AbgEGKYR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 06:24:17 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15697C061A10
        for <linux-media@vger.kernel.org>; Thu,  7 May 2020 03:24:17 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id z6so1889507plk.10
        for <linux-media@vger.kernel.org>; Thu, 07 May 2020 03:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oo1xnFJoKnJRPCb1k/kpUqpuervQpCi0IylZD35uCtU=;
        b=bFZX//5u1biNAhAdVXKnxlQhgXZg0E2/qIYtejPF3hTyPzdudv+Hhol6yhMhe+pLXR
         qi4+lJDJD7wqFhb1fbU2HQ7nJpMx8oxCrZRVXU3DeP/7FtrWOGlSHLeIoomLn/ZIuZt1
         UiMxHSLmOE2/9gbS6u8Dw1em28VAE3YDr4jx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oo1xnFJoKnJRPCb1k/kpUqpuervQpCi0IylZD35uCtU=;
        b=jkMnycnQ0qbanMndlWcqk5oMQ8khNL7+SOIdEBqzfoex97B9l4neHo9MhA4uMWWY3R
         zjdrgFHkOB3vq6yB8dXoOnX4RxLAZSRORiNmTAoVwwRQsOToon+/R2PG57mVxWiEzMwk
         0KRtKd6m02enuSDEb3YLoIqd3zJmOhYEXjvFNS9lBVKwqvn2f9uek2Eru85D/DD+hdHK
         4YP0s/TPt3M1Hha3+pUhvUgTtMEZPk1/uyuKl+n9sLBqVZsm7j3FlHW/CXbMne0nlR5z
         X23+p1utPtLzFTnAQXBWQbS93cPpvs967S4BTQEZe+v3KGk5Dpk3qxXi7xlfBJmaVlSm
         BfKA==
X-Gm-Message-State: AGi0Pub/i2fd3RnGlLA9o6XCiHLboOlwYcXgwHiL9mJEGWlWSuZzLPyT
        fnToGZSaR5iit9nGyoVC9bTLLvwkqWo=
X-Google-Smtp-Source: APiQypK0Yj463Sz55i7hlJ8Wfduxc6jBmzjwL3+Xbpt0RRZaW6Bed1aBCs2s4nzl9RneQvMrKQc2Lw==
X-Received: by 2002:a17:90a:24e6:: with SMTP id i93mr14512370pje.13.1588847055212;
        Thu, 07 May 2020 03:24:15 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
        by smtp.gmail.com with ESMTPSA id i185sm4408872pfg.14.2020.05.07.03.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 03:24:14 -0700 (PDT)
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
Subject: [PATCH v3 1/5] [media] mtk-mdp: remove mtk_mdp_comp.regs from mtk_mdp_comp.h
Date:   Thu,  7 May 2020 20:23:42 +1000
Message-Id: <20200507202337.v3.1.I0d52fd84fe481e254a10960b060f32c47ce0d202@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200507102345.81849-1-eizan@chromium.org>
References: <20200507102345.81849-1-eizan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These fields are not used and can be removed.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
Reviewed-by: Enric Balletbo I Serra <enric.balletbo@collabora.com>
---

Changes in v3: None
Changes in v2: None

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

