Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 741E03DD552
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 14:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233551AbhHBMMj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 08:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233446AbhHBMMi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Aug 2021 08:12:38 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A8ECC0613D5
        for <linux-media@vger.kernel.org>; Mon,  2 Aug 2021 05:12:28 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id k1so19349715plt.12
        for <linux-media@vger.kernel.org>; Mon, 02 Aug 2021 05:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yhCy+jdg2z+Eckz1yvxcPdL/SuIBQamgSG0Pchby1eE=;
        b=IHFEat4kyp7BJrcnOYKhWyx2BgxojQqKz+Q69zBBnJ9SF6H/hSn+HkbWOVx8/ye6ir
         b/2N1/CLAwC6wSGNYMbfA6QLp/HMduvyqpQv0/r+QOCJNRawHSLCsegT5OYBch2dGAZt
         vFsHXxQKt0chTg+3kP4mAeEs6RBwjb0C5OEag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yhCy+jdg2z+Eckz1yvxcPdL/SuIBQamgSG0Pchby1eE=;
        b=rZVRT59ZfB6wPpFKFGEdLfnNs6WPrYW7Sh6d7RcaoE6ie2qcrYEwvLj/o3KM4k8Cch
         spL7uufPp0angooiR5NsVj5lnbFyjT1p04WkAzmRkIWs2Iyxvsq9oi/Mpf0UCakd6KXv
         aEDFpsv3/4dkFxsG3nV3zJpxLceiL31A+ziIlHxBncqRboLhx0KheWMF2NSg3OkiXi+K
         Aj7QUdg0Plm7XRQTk4mMIOPx1ROw+DeocCd6HqdVyzoWX6kAe8hndMWmpRF+scTkYTYB
         k7CQPM+QjnKxo8lI9w7bbNxNscw/S+4cgFib1tKJrREVL7AZgBrBrNx2UuYl6Ka1J1Ry
         kq0Q==
X-Gm-Message-State: AOAM530jXmRNze2ZDS8NWaa7MsnVA/KZRroirvxwNQ5CN8n5bFgaLNEe
        AyLLLx+UugKb+9GXLISotpAmJw==
X-Google-Smtp-Source: ABdhPJw9D3QYvpfQwiLiGcde+JTyAT/xpxneIagpGhWlhr9nQI9AqvoEdzzBW/YWozCp7VcQCEgNIw==
X-Received: by 2002:a17:90a:de18:: with SMTP id m24mr16795133pjv.78.1627906348032;
        Mon, 02 Aug 2021 05:12:28 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:cd34:e942:c094:baef])
        by smtp.gmail.com with UTF8SMTPSA id w134sm11685775pfd.124.2021.08.02.05.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Aug 2021 05:12:27 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     wenst@chromium.org, houlong.wei@mediatek.com, yong.wu@mediatek.com,
        enric.balletbo@collabora.com, devicetree@vger.kernel.org,
        chunkuang.hu@kernel.org, Eizan Miyamoto <eizan@chromium.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v6 0/9] Refactor MTK MDP driver into core/components
Date:   Mon,  2 Aug 2021 22:12:06 +1000
Message-Id: <20210802121215.703023-1-eizan@chromium.org>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


This is an update to
https://patchwork.kernel.org/project/linux-mediatek/list/?series=283075
To address some comments and fixes.

This series has been verified to work on 5.13.


Changes in v6:
- Don't propagate errors from clock_on/off as an afterthought.
- Split apart modifying mdp driver to be loadable from mmsys from
  actually loading it from mmsys into two changs to make review easier.
- Update devicetree bindings to reflect no longer needing the
  mediatek,vpu property in the mdp_rdma0 device node.
- Some stylistic cleanups.

Changes in v5:
- rebase and test on 5.13-next @ e2f74b13dbe6

Changes in v4:
- rebase and test on 5.13
- don't depend on https://patchwork.kernel.org/project/linux-mediatek/list/?series=464873

Changes in v3:
- get mdp master from aliases instead of strcmp against of_node->name

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

Eizan Miyamoto (9):
  mtk-mdp: propagate errors from clock_on
  mtk-mdp: add driver to probe mdp components
  mtk-mdp: use pm_runtime in MDP component driver
  media: mtk-mdp: don't pm_run_time_get/put for master comp in clock_on
  mtk-mdp: make mdp driver to be loadable by platform_device_register*()
  soc: mediatek: mmsys: instantiate mdp virtual device from mmsys
  media: mtk-mdp: use mdp-rdma0 alias to point to MDP master
  dts: mtk-mdp: remove mediatek,vpu property from primary MDP device
  dt-bindings: mediatek: remove vpu requirement from mtk-mdp

 .../bindings/media/mediatek-mdp.txt           |   3 -
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |   1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 268 +++++++++++++++--
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  34 +--
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 282 ++++++++++++------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   3 +
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |   4 +-
 drivers/soc/mediatek/mtk-mmsys.c              |  20 +-
 8 files changed, 470 insertions(+), 145 deletions(-)

-- 
2.32.0.554.ge1b32706d8-goog

