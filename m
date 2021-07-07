Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB8DE3BE39D
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 09:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbhGGHhN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 03:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbhGGHhM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 03:37:12 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8EA4C06175F
        for <linux-media@vger.kernel.org>; Wed,  7 Jul 2021 00:34:31 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id p14-20020a17090ad30eb02901731c776526so843975pju.4
        for <linux-media@vger.kernel.org>; Wed, 07 Jul 2021 00:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OJlTGwQarQCwpYvNcauR++9WrrW2NSvtHc/ue7RodJg=;
        b=AuazIt6wRB7ZeBAjhK9ytxJTkucjF6k5BsVeoltdwkePA7cS/fKxHnORZSh77uRfoS
         RgvulmIxxv889zhp87tFqJBjuxeVPZJ18OHG6HJoMlygPw7p00n6oQWrzWneR/2SNMez
         9Lu/mVfByWJ4LmChRXj+IIwAOjqqeAWemaTUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OJlTGwQarQCwpYvNcauR++9WrrW2NSvtHc/ue7RodJg=;
        b=DtvSWSANOerdMIDRpZcBdroTxMXcZ+bePz7VtbRpNjKWye3FRFX0FkxEuYi8IUMzNX
         a940dHvX/MgfO4Z+2kx4hVuK19Kgl4pOMuPXmOgXhQ3FQzB9aTKI2b3nEIY5+rNoMQur
         7jouN6QVGpR1xmUii2xlqaw3yxEbV+EqbT+Ct+22TmZwl8U1uVZR+LN2EF03Rb5tT77u
         fKdHlO42W9/Tmz5oxQ/ASLwV4zEBG4SsXUz+myu44HZ1m7K8B3APkMxknX2hgZOSKDfs
         AYy+jiFa3vUWTIw0jxa/6wpUqKC+qO0S+VJ7Q7pWU1b2ezvf90P+pvEAQhqzRhLerVAR
         wSoQ==
X-Gm-Message-State: AOAM533Yy/4GVus38X64bMx8vVg6gKtPFVdjajHGNJCpk3ElUDC4hW3D
        IKuqgcZGc2ELmXlIU3bYe+mA6g==
X-Google-Smtp-Source: ABdhPJwbaSWuRfpIWfTMNQ/mnZEWXookdqAFX4f4ckRHmLTlGK82ywmPRaOOcJSazu0oxBqgsxhN3w==
X-Received: by 2002:a17:90a:b28a:: with SMTP id c10mr4537829pjr.59.1625643271395;
        Wed, 07 Jul 2021 00:34:31 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:ccb9:d95f:4dac:dbc4])
        by smtp.gmail.com with UTF8SMTPSA id f4sm21323341pgm.20.2021.07.07.00.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 00:34:31 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     houlong.wei@mediatek.com, enric.balletbo@collabora.com,
        wenst@chromium.org, yong.wu@mediatek.com, chunkuang.hu@kernel.org,
        Eizan Miyamoto <eizan@chromium.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v4 0/8] Refactor MTK MDP driver into core/components
Date:   Wed,  7 Jul 2021 17:34:02 +1000
Message-Id: <20210707073410.999625-1-eizan@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


This is an update to
https://patchwork.kernel.org/project/linux-mediatek/list/?series=283075
To address some comments and fixes.

This series has been verified to work on 5.13.

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

Eizan Miyamoto (8):
  mtk-mdp: add driver to probe mdp components
  mtk-mdp: use pm_runtime in MDP component driver
  media: mtk-mdp: don't pm_run_time_get/put for master comp in clock_on
  mtk-mdp: soc: mediatek: register mdp from mmsys
  media: mtk-mdp: search for vpu node instead of linking it to a
    property
  media: mtk-mdp: propagate errors better in pm_suspend/resume
  media: mtk-mdp: use mdp-rdma0 alias to point to MDP master
  dts: mtk-mdp: remove mediatek,vpu property from primary MDP device

 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |   1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 258 ++++++++++++++--
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  34 +--
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 281 ++++++++++++------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   3 +
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |   4 +-
 drivers/soc/mediatek/mtk-mmsys.c              |  20 +-
 7 files changed, 466 insertions(+), 135 deletions(-)

-- 
2.32.0.93.g670b81a890-goog

