Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A79C1C4F66
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 09:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgEEHo6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 03:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725833AbgEEHo6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 03:44:58 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD18C061A0F
        for <linux-media@vger.kernel.org>; Tue,  5 May 2020 00:44:58 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id u10so480314pls.8
        for <linux-media@vger.kernel.org>; Tue, 05 May 2020 00:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O2pv13qx7VFGbbGCBI+M8Dk49yxcXbYowJJnWYcKPyA=;
        b=gTUcBPhXn7zwDJld52yMM64s04tMkXRJBQG1NWq/zYwXC6B1H01YZwAbf03E0N+d3a
         dsYVRX3mdZ9pP3VUEc1ki2liSb7gzB2RnSZzS39WlTfSWX5IENahsL6Ptt8mKz3pYpcg
         OyJfrpRgzQWKerlBIyhp3wbvemUv+0LOlwiCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O2pv13qx7VFGbbGCBI+M8Dk49yxcXbYowJJnWYcKPyA=;
        b=UCOJnX0AQKUfE8/hNGPKx5Vo3YPF4ZoEJVj/TFdTo4oSH8VDPYdOav8R0v/XXAC3nO
         SLJCcukDnO7Bl+Xph8nNnPikgQ57oB2lKrIXLjVUKNL4wHsGAZhGi49wGL215wzbo10M
         Mq2EaJ6o2uwEuBg7wkszLDpeJ7ds5BNfrRwyfY3Rn1pp2AE9lSHsRYYnuUgTEE3JqeaT
         hBACYiop7JQ0RlRE/1mVjet/6gh5iWAfh3ZNUtcX5AjPS8WVdkCDr9zM62ALLMdd0zdx
         MEqZz4a8KyJYjEwXIcCVaLx6/qo0GnwX/+x/TkGhC3NEFYHVUXxi0JH6qORZc9SpwgGP
         svQw==
X-Gm-Message-State: AGi0PuZRTBkPS3oCcXU0zKW1bsAIH4u+rVuX5MaotanRKse9Sb/kfbuN
        qlExqNWV3HRTJPk/ToFjwkdWhA==
X-Google-Smtp-Source: APiQypKEj76sEkdrmamm6pACw3UuGZqt7SISdTgTQwe/a0f+om4l4A/EzQV+B3BPoL0Bs/K056M7Kg==
X-Received: by 2002:a17:902:8687:: with SMTP id g7mr1976063plo.59.1588664697580;
        Tue, 05 May 2020 00:44:57 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
        by smtp.gmail.com with ESMTPSA id j5sm1205741pfh.58.2020.05.05.00.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 00:44:57 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
X-Google-Original-From: Eizan Miyamoto <eizan@google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Eizan Miyamoto <eizan@google.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v1 0/2] Refactor MDP driver and add dummy component driver
Date:   Tue,  5 May 2020 17:44:29 +1000
Message-Id: <20200505074431.242840-1-eizan@google.com>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


This series depends on changes in
https://patchwork.kernel.org/patch/11528171/

We are adding a dummy MDP component driver so that all the components
are properly configured with IOMMUs and LARBs. This is required for
us to get hardware video decode working in 4.19, and possibly newer
kernels.


Eizan Miyamoto (2):
  [media] mtk-mdp: add driver to probe mdp components
  [media] mtk-mdp: use pm_runtime in MDP component driver

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 186 +++++++++++++++---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  33 +---
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 177 ++++++++++++-----
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   1 +
 4 files changed, 297 insertions(+), 100 deletions(-)

-- 
2.26.2.526.g744177e7f7-goog

