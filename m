Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B18821C4CCB
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 06:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgEEEBO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 00:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgEEEBO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 May 2020 00:01:14 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329CEC061A0F
        for <linux-media@vger.kernel.org>; Mon,  4 May 2020 21:01:13 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id u10so286118pls.8
        for <linux-media@vger.kernel.org>; Mon, 04 May 2020 21:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DcuOwTL7vWeGU4BHEEgCAhZYtrZvgsB0gLbKKMhZqVM=;
        b=GiPNnuzUK9FnG/VS1XegNdexL4Voi0zdwNKKzBwte2k3acVUCL9EDxBGjFfpHnwGM9
         U3HUEPcRukJqgs/g4K3X1ytfDAtPMZ+zsuhuv2WLphAXSTkov9EC7OsdRqoHK/Q3bYwr
         mwEsCzhKWmouicpjYsefvdkcrfumYNZx1glZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DcuOwTL7vWeGU4BHEEgCAhZYtrZvgsB0gLbKKMhZqVM=;
        b=iPBnqsCPvdASgdpo/QtalXYZ5nY8JL9Fe6Ke++B79JfFTYus6iTLSJewNx4uSMSEms
         9mkZuK3fq6U19DTx5vSsc9aLH/nWCb3gOLp73iMzCpXSdJfYfiPPtAu4d5pZyW4KxV19
         qk9SW43ThrnqCPP/+hdFD2TkP+lx0jItnWEP3F44zZaAPpDlu8AQnhBa6XGyjxSemRV1
         U+/f1YWTvnOmdan0MORS+N6H5WERZegMMOAIixTU83Lk34dm8NINj0CKN/BfxpZuXwfx
         zkznIoHNLE5+pBMaWkYwEjysVvTKbaF0n8EYkmVHzh7VjwbMMA8qEKtKJBidbj7cgFBc
         QV/g==
X-Gm-Message-State: AGi0PubqsRWwWqe+MysHcKCb8OOVnB9ABurGgSMjdvPwd8CGKLZLTUyF
        iUbJd58LNjI0c0rRg9+Bp+AhLQ==
X-Google-Smtp-Source: APiQypL9b1gOcDXoI9Aau8wQwRN9YSmxnUKqOC75g2zmvbguz1b03VlXqH1TYxFDmN7LQ4AbJ86ZJw==
X-Received: by 2002:a17:90a:9f8a:: with SMTP id o10mr489319pjp.118.1588651272798;
        Mon, 04 May 2020 21:01:12 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
        by smtp.gmail.com with ESMTPSA id c10sm629631pfm.50.2020.05.04.21.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 21:01:12 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
X-Google-Original-From: Eizan Miyamoto <eizan@google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Eizan Miyamoto <eizan@google.com>, eizan@chromium.org,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v1 1/5] [media] mtk-mdp: remove mtk_mdp_comp.regs from mtk_mdp_comp.h
Date:   Tue,  5 May 2020 14:00:44 +1000
Message-Id: <20200505125042.v1.1.If0cdd88c5399a38cff7163298cc8794f8c40a401@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200505040048.132493-1-eizan@google.com>
References: <20200505040048.132493-1-eizan@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These fields are not used and can be removed.

Signed-off-by: eizan@chromium.org
Signed-off-by: Eizan Miyamoto <eizan@google.com>
---

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 14991685adb7..facc6104b91f 100644
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

