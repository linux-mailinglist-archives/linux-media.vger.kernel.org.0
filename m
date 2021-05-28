Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB37394919
	for <lists+linux-media@lfdr.de>; Sat, 29 May 2021 01:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhE1XXI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 May 2021 19:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhE1XXI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 May 2021 19:23:08 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805D4C061574
        for <linux-media@vger.kernel.org>; Fri, 28 May 2021 16:21:31 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id l18-20020a1c79120000b0290181c444b2d0so3180296wme.5
        for <linux-media@vger.kernel.org>; Fri, 28 May 2021 16:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nbfWgi9ugROl98i8h1KKJEb5+VK0QvP+xO1HNZaf/A0=;
        b=nt2G7OL2qJG3SBKQBy3msw8pwuyszEDQwM3pde/Tr9Gd+8jtrOIMW1J4/+YfmR7bFl
         t50SU4DztHgSI31HTQPjSW4aj1xAz2ojZxrYRiehr0BSMsxWhI4/+CuX6nndwLHKcVmn
         Z4OH5SX5S97wuQ4Y8Wmejbw5053pr0/eFQ+GXFoMZdmUlqAo8ULdDjiqLL3H95CPmgTk
         +rWqXyVt/S/9vtF4cN+PX31T0r4HQkd7ya3m01NTWtwPo667m6o9pg/ljXvcVuzpvNu2
         elOrbJawZf8lklXVXQSDn0uzNU8a1HZ7Gw5bo4l0QGc3sY//H15khBQObqY8P/MMCJKi
         I83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nbfWgi9ugROl98i8h1KKJEb5+VK0QvP+xO1HNZaf/A0=;
        b=GWJyAIApTVi3Zbl5tCrkZsXOHqZ/e6CXMaeElekmudHLLPW+hr185RcBJRYa8UWaLw
         jSPQFo7LwqVKsCMB55zt5pe6eGV6N0eoI02ijqo8TY3J2qJEaGqQSZ6XAly3KQyRvvY1
         89+2gpHnednnTRLCFLCRtC6JmFhExmaWMQMbt6QiMNReigrqEiBJv81p7HFl0As5cub0
         iXnE2e+1HDw6n3G/oBvVx728rM5NVbU6sBi13NnAgvtiKZ0KjPK/mprsL8BrhoZTjYoG
         arAp9hcKEMFyol1ucdHN3iYVkZkiMX7sVEj+XPNwCwnVSFqvpgChiCX6u0o118aq/00L
         gsIA==
X-Gm-Message-State: AOAM532JNlo51/PzjFbtVumAz8EL7oiiVPDiZ5oN4llPvZoHYpl13b6u
        H8rYvKKsCN1pSAKXmzhv1dE4FzsGK65227Ml
X-Google-Smtp-Source: ABdhPJyvszG68D2lFIKDDNWFnXZPkb5Y8pjArUB302Avtr42O25rk2Mtw2xV33Iiz3/ZOWX3UDt4Mg==
X-Received: by 2002:a1c:4c03:: with SMTP id z3mr10509385wmf.58.1622244090032;
        Fri, 28 May 2021 16:21:30 -0700 (PDT)
Received: from localhost.localdomain (hst-221-87.medicom.bg. [84.238.221.87])
        by smtp.gmail.com with ESMTPSA id h13sm8268992wml.26.2021.05.28.16.21.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 16:21:29 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.14] Venus updates
Date:   Sat, 29 May 2021 02:21:20 +0300
Message-Id: <20210528232120.326677-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The changes this time includes:
  * Conversion to devm variants of OPP APIs
  * Enable low power setting for encoder.
  * Few small fixes.

Please pull.

regards,
Stan

The following changes since commit 71c689dc2e732d4cb190aaf0edea73116b1611bd:

  media: v4l2-ctrls: split up into four source files (2021-05-25 17:03:29 +0200)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.14

for you to fetch changes up to f7b9607889df645ad689e00a1a2971ff3714fbe0:

  media: venus: helpers: Delete an unneeded bool conversion (2021-05-29 02:13:01 +0300)

----------------------------------------------------------------
Venus updates for v5.14

----------------------------------------------------------------
Dikshita Agarwal (1):
      media: venus: Enable low power setting for encoder

Gustavo A. R. Silva (1):
      media: venus: hfi_cmds.h: Replace one-element array with flexible-array member

Stanimir Varbanov (1):
      venus: hfi_cmds: Fix conceal color property

Yangtao Li (1):
      media: venus: Convert to use resource-managed OPP API

Zhen Lei (1):
      media: venus: helpers: Delete an unneeded bool conversion

 drivers/media/platform/qcom/venus/core.h           |   7 +-
 drivers/media/platform/qcom/venus/helpers.c        |   5 +-
 drivers/media/platform/qcom/venus/hfi_cmds.c       |  22 +--
 drivers/media/platform/qcom/venus/hfi_cmds.h       |   2 +-
 drivers/media/platform/qcom/venus/hfi_helper.h     |  10 +-
 drivers/media/platform/qcom/venus/hfi_platform.c   |  16 +++
 drivers/media/platform/qcom/venus/hfi_platform.h   |   4 +
 .../media/platform/qcom/venus/hfi_platform_v4.c    |  28 ++--
 .../media/platform/qcom/venus/hfi_platform_v6.c    |  28 ++--
 drivers/media/platform/qcom/venus/pm_helpers.c     | 150 ++++++++++++++-------
 10 files changed, 191 insertions(+), 81 deletions(-)
