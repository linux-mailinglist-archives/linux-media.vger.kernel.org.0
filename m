Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 744A71C6BF8
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 10:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbgEFIlQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 04:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728349AbgEFIlQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 May 2020 04:41:16 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0EADC061A0F
        for <linux-media@vger.kernel.org>; Wed,  6 May 2020 01:41:15 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id s18so464293pgl.12
        for <linux-media@vger.kernel.org>; Wed, 06 May 2020 01:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VkoYcVU7NbBeJg58Zqc5BWaG09vaVe4UBMU1LZjqb/g=;
        b=CIpRiYea9WavKCCzFUX1KcmqQRqXAUfnUOpK6kYBI47aHAW2q68iHkQwQ9a53C4+mm
         bfI2CWK8Yr2OJlemlrTiq2q/w0fUesykOuoV/uPt11BXPFji9lBmU5tQeBjrbr3Fe8QU
         3U+D2JeKqnISGbxkYsJdYFDrdMSz6AMv3TTmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VkoYcVU7NbBeJg58Zqc5BWaG09vaVe4UBMU1LZjqb/g=;
        b=Kq/G2z/TGCFUsITyWISRFS50xEEe6mhl3SCi7X+mI+3b8Il522UaJyYd60fyJtaW44
         6Kf1biaDk3jnbprVPQAj4ztjOe54AopLyzsGPjIgfzzbjxvicthatEmCtdHdlUP6o7Wr
         qUGYIeOxzvjysg1+e87C75/Lbama+xHKmoxcCkdqhlN5HArIhbO29E1KO9HnVpWr5+G6
         L0wWb357Wd91BVS0IRpxBGkQwYtM+mBfZR31E2vQKYfT00rb++NeiUTgFq1SqR4iWMaY
         r1RXhW8T2g10VvpOZOS3x2I4+3T3O9YocF3im5k3T7i9gRws5OqmrAqZAQbXGQ7iDFbn
         fWMA==
X-Gm-Message-State: AGi0PuaSqRbSnmZ4L8BAoRLYbv3oz5yOUmq4z+DPfuuNTjIWeidFs6k6
        YEUmJSmdSBN/19PFB2aX5JbP15WhpIc=
X-Google-Smtp-Source: APiQypI0J1HwXbViVLlYWXD2Y2yI1V6k6VKFQ9zvlAicFXalpNwCJAXSFHp0zsOyvBrN9HZalI3SBw==
X-Received: by 2002:a62:7f07:: with SMTP id a7mr4606572pfd.34.1588754475570;
        Wed, 06 May 2020 01:41:15 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
        by smtp.gmail.com with ESMTPSA id o21sm3986931pjr.37.2020.05.06.01.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 01:41:15 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Refactor MDP driver and add dummy component driver
Date:   Wed,  6 May 2020 18:40:37 +1000
Message-Id: <20200506084039.249977-1-eizan@chromium.org>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


This series depends on all changes in the series:
https://patchwork.kernel.org/patch/11530275/

We are adding a dummy MDP component driver so that all the components
are properly configured with IOMMUs and LARBs. This is required for
us to get hardware video decode working in 4.19, and possibly newer
kernels.

Changes in v2:
- remove empty mtk_mdp_comp_init
- update documentation for enum mtk_mdp_comp_type
- remove comma after last element of mtk_mdp_comp_driver_dt_match

Eizan Miyamoto (2):
  [media] mtk-mdp: add driver to probe mdp components
  [media] mtk-mdp: use pm_runtime in MDP component driver

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 172 ++++++++++++++---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  32 +--
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 182 ++++++++++++------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   1 +
 4 files changed, 286 insertions(+), 101 deletions(-)

-- 
2.26.2.526.g744177e7f7-goog

