Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D28BF3F6F8C
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 08:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239107AbhHYGee (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 02:34:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239078AbhHYGec (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 02:34:32 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D69AC0613C1
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 23:33:47 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id b9so9344691plx.2
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 23:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9K6fTrQKg0eyCvlXAdZKTTOOHMG9DmPNgjH8VJOHFo8=;
        b=OAIQQotobDg4VABTCD5AWF/CvuSWI78aJCtku35mN5kwCsHPAPuVCyWObgau2soem1
         X2ePrCNej9Mw4S1woXgMFDEbk8tBXUM2eJ5ekjiEWOxEc9TCHIN8qqCUCXl10Z1k9840
         FtRakX60dRrKY51lMM27LI22UhIbGbjxolcp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9K6fTrQKg0eyCvlXAdZKTTOOHMG9DmPNgjH8VJOHFo8=;
        b=iyIypVquGYZrDtsSxkjEXwa/wa+zLqbPsvDxHs12etDDe4MU6d87YSgUsxG3O7rJTP
         iQ6blAL2hRhMbnyK1z3oHfE/xYEfjH3sofYGNFdPP9olgXI6hWWp1uDEfVEinbZ83SGb
         BKP9awdY6ys/LhRZ4tRQs8Kap3mo9lCrM54D578vGnG52QMWi9VSkJVfVjAkQZqXRqtC
         KC8IhqVwCWQL2q1udBspnoBp3Vsb32ddE5NE/Fd/CAs1qUD0KnNUK/jLe1xUZ6s46l77
         JwtS5lOnjn8VpVZJaXJq0voSD7y24CWEk7Ik9UbvaXxQxivSgDpLtKBJ3pCAAkqQKkGZ
         +CHg==
X-Gm-Message-State: AOAM5321bo6IHN24DDCIyPGuSW5o6Hf0FkvwvQ13I90nFaA2V/nM49vl
        rkIaVifx72XprTVcmHSCbq9Z9Q==
X-Google-Smtp-Source: ABdhPJy6BUtCkuLNfAtdL49wqU7oY8b44Pfo4jXe6sTGJN63fP452tlucKgY3vXS2lkAPzDdi2aPOQ==
X-Received: by 2002:a17:903:248f:b029:128:d5ea:18a7 with SMTP id p15-20020a170903248fb0290128d5ea18a7mr36874180plw.83.1629873226793;
        Tue, 24 Aug 2021 23:33:46 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:3f2f:9e23:8a5:952])
        by smtp.gmail.com with UTF8SMTPSA id f9sm4356953pjq.36.2021.08.24.23.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 23:33:46 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     chunkuang.hu@kernel.org, yong.wu@mediatek.com, wenst@chromium.org,
        ck.hu@mediatek.com, houlong.wei@mediatek.com,
        enric.balletbo@collabora.com, yongqiang.niu@mediatek.com,
        Eizan Miyamoto <eizan@chromium.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v7 0/7] Refactor MTK MDP driver into core/components
Date:   Wed, 25 Aug 2021 16:33:16 +1000
Message-Id: <20210825063323.3607738-1-eizan@chromium.org>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


This is an update to
https://patchwork.kernel.org/project/linux-mediatek/list/?series=283075
To address some comments and fixes.

This series has been verified to work on 5.13.


Changes in v7:
- Drop last two changes from this series related to removing the vpu
  property from the mdp_rdma0 device node

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

Eizan Miyamoto (7):
  mtk-mdp: propagate errors from clock_on
  mtk-mdp: add driver to probe mdp components
  mtk-mdp: use pm_runtime in MDP component driver
  media: mtk-mdp: don't pm_run_time_get/put for master comp in clock_on
  mtk-mdp: make mdp driver to be loadable by platform_device_register*()
  soc: mediatek: mmsys: instantiate mdp virtual device from mmsys
  media: mtk-mdp: use mdp-rdma0 alias to point to MDP master

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 268 +++++++++++++++--
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  34 +--
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 282 ++++++++++++------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   3 +
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |   4 +-
 drivers/soc/mediatek/mtk-mmsys.c              |  20 +-
 6 files changed, 470 insertions(+), 141 deletions(-)

-- 
2.33.0.rc2.250.ged5fa647cd-goog

