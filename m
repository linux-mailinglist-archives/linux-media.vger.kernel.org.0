Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2D53A3AA2
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 06:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhFKEER (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 00:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhFKEER (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 00:04:17 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E5B8C061574
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 21:02:04 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id h12so3376646pfe.2
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 21:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dHnvb/5q4pu/qIeAJnS0gxEaPn/2BF/h/mnBeFWe2kU=;
        b=PBAd9qhBUf6V1LfObAM2a5Ujj6S2jZogVGzCMmDl2YCnqpM1JqJ/Kib/ArqLJd6+Z8
         4JDc9yxn0C4wfZS9Pw4XzSzfWKpy9yCUh/8AiGqWMEXChrFL9vxYEaNzU+LF8NnBnnNO
         u/CHBjGciUSPtTFYkJQDdHnGWJL4MjzYCnDuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dHnvb/5q4pu/qIeAJnS0gxEaPn/2BF/h/mnBeFWe2kU=;
        b=tOmEayyCaByqf0MrRl9YekWkscqYvo0FsX+S+9yXKvo7a2TnCbhMpqgK1Ghxn2C2d0
         eJZTSGc5QCWYxZXPG2l35IT/WJvQ8Du99w577JCny+odyZJyvEwZJZU3eMv/gv0PUB8b
         u1+p+8Ce1Qm2vTE7vhqb+yDknT3e2wNVGkSH/yCsC5/eCrWbCi8uHYoHUlJFFlDKQRFk
         2Wjo1Ta/UO5oRN3aYPDDeW7KjyLEiA0sgb7hJpLh97Qglnw9gPaPS0RTL+b3B+Jdqo3o
         u9wqQIR05kJWjvllcP6A7/JymwSrSFnqQ+vuwifhzaE6XJmX0/ZjSOXv1H76YWqTw7Ay
         sOkg==
X-Gm-Message-State: AOAM531eTPr8fU1yTKZpSeByfA14rDv3mQTfCym+DEh/1kt9lBjyl12N
        VXA/AT9Hk2CARqZNb8cDtAtHeQ==
X-Google-Smtp-Source: ABdhPJzGwVIh6XECxvR1OvFsqr6SKN92gztMweR8qLNeCrhI/7Kq+py+jyKomDkaXiMr8686emmtLg==
X-Received: by 2002:aa7:8892:0:b029:2f5:33fc:1073 with SMTP id z18-20020aa788920000b02902f533fc1073mr6219778pfe.79.1623384123780;
        Thu, 10 Jun 2021 21:02:03 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:db52:e918:e5f9:9e14])
        by smtp.gmail.com with UTF8SMTPSA id z185sm3927781pgb.4.2021.06.10.21.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 21:02:03 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     houlong.wei@mediatek.com, enric.balletbo@collabora.com,
        yong.wu@mediatek.com, chunkuang.hu@kernel.org,
        Eizan Miyamoto <eizan@chromium.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/8] Refactor MTK MDP driver into core/components
Date:   Fri, 11 Jun 2021 14:01:37 +1000
Message-Id: <20210611040145.2085329-1-eizan@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


This is an update to
https://patchwork.kernel.org/project/linux-mediatek/list/?series=283075
To address some comments and fixes.

This series has been verified to work on 5.12.

It has been rebased on top of the series
https://patchwork.kernel.org/project/linux-mediatek/list/?series=464873


Changes in v2:
- rebased onto Linux 5.12
- 100 char line length allowance was utilized in a few places
- Removal of a redundant dev_err() print at the end of
  mtk_mdp_comp_init()
- Instead of printing errors and ignoring them, I've added a patch to
  correctly propagate them.
- Use of C style comments.
- Three additional patches were added to eliminate dependency on the
  mediatek,vpu property inside the mdp_rdma0 device node.

Eizan Miyamoto (8):
  mtk-mdp: add driver to probe mdp components
  mtk-mdp: use pm_runtime in MDP component driver
  media: mtk-mdp: don't pm_run_time_get/put for master comp in clock_on
  mtk-mdp: soc: mediatek: register mdp from mmsys
  media: mtk-mdp: search for vpu node instead of linking it to a
    property
  media: mtk-mdp: propagate errors better in pm_suspend/resume
  media: mtk-mdp: treat rdma@14001000 specially when probing
  dts: mtk-mdp: remove mediatek,vpu property from primary MDP device

 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |   1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 226 ++++++++++++--
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  35 +--
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 281 ++++++++++++------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   3 +
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |   4 +-
 drivers/soc/mediatek/mtk-mmsys.c              |  20 +-
 7 files changed, 434 insertions(+), 136 deletions(-)

-- 
2.32.0.272.g935e593368-goog

