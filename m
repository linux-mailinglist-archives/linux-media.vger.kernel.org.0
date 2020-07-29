Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB53423281D
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 01:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgG2XcE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 19:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbgG2XcE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 19:32:04 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21E84C061794
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 16:32:04 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id g10so3130286wmc.1
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 16:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=Shvg+pWIgqBrbjkqOE6gkiEaOhwejYOEYrruPanePCY=;
        b=pRbTSRiYrZ7ENOVrULD1ofRvej9qNaIXwMu8u35f7+wh/dprR16hGFc2HDz10MFPrA
         /42gJC3gNs56oiQ7Q4HEaYePiprtL/BsEjLv6ETVhXnGYsz3BkE333kp5NJERjvmBIrA
         95VjtgR2DkguvblZSBA3IH2T3HEm3VRp+2wLdsyxEp5rhXrceQasTzKNaoiY5oaGZJAg
         85X8RJBkkE0PBfBQZcmQRYr2cGZkBsDjpgmxJe9BNX96upgouetKR6Ce6A0K5gO5dPhM
         fTdHJQ0THe7E8wugiP4zaGPPurIXnH24VoB2rg/N+dWbp65NrZpqa3oIvxTi8W+eylmn
         Phog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=Shvg+pWIgqBrbjkqOE6gkiEaOhwejYOEYrruPanePCY=;
        b=W5jqQ8/L8mh33B+K8av0LAeIXkFMN8VYEFRZN0WEc0k/AVVwgoyE2pjub/cW33i/as
         DKpJ7GG47fNqo5G1kNaappkjKiNMbivZ6l74Sh8oBa0XGjGqfuKHlUMIm6908ERd6C9Y
         IMtpNRhPG+uAArjqdVxryidNIECTKzcvuNnGguFjZBEh1ecrV0izDIyvuCqCzxuVtzUc
         zOSH3PDGeH04a46l3Q/uiJ17aJ+aujvcMX2b75gsGM8znUMazUlD35uUH7gb7n5LiPk1
         r6U1+XO3dS8Cu/dNM9/7VPR4gwc/ktCFQM5orFltvHdyzLkR2blYFMzYSVG7sENGmacE
         LTAQ==
X-Gm-Message-State: AOAM5327WJ//vNpu98E/+FwYFssqhcE0JCc42Zjrmqnb0Fl6UmkljF8l
        vZ0FWmgt0hrJ0z/OUaly1LpSd29LLdQvqA==
X-Google-Smtp-Source: ABdhPJz87sTl1gauKjHD9YHkejTPGyqI1yxAKDcBA9JWEv7u1We2F5Znhr8jghPKP7Re/qMJ+skY0g==
X-Received: by 2002:a1c:2646:: with SMTP id m67mr11354340wmm.137.1596065522554;
        Wed, 29 Jul 2020 16:32:02 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id k184sm7306068wme.1.2020.07.29.16.32.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 16:32:01 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for v5.9] Venus updates - part2
Date:   Thu, 30 Jul 2020 02:31:33 +0300
Message-Id: <20200729233133.10187-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Venus driver updates for v5.9 part2 includes:

 * A runtime PM fix in venus core driver probe error path.
 * Add missing PM core_put ops in driver probe error path.
 * A new OPP tables/perf voting.

Please pull.

regards,
Stan

The following changes since commit 8f2a4a9d5ff5202d0b3e3a144ebb9b67aabadd29:

  media: dvbdev.h: keep * together with the type (2020-07-19 14:26:25 +0200)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.9-part2

for you to fetch changes up to e04afdd4ec0815d7059f923f3647fdad4b0472bf:

  media: venus: core: Add support for opp tables/perf voting (2020-07-30 02:18:07 +0300)

----------------------------------------------------------------
Venus updates for v5.9 part2

----------------------------------------------------------------
Dinghao Liu (1):
      media: venus: core: Fix runtime PM imbalance in venus_probe

Rajendra Nayak (2):
      media: venus: core: Fix error handling in probe
      media: venus: core: Add support for opp tables/perf voting

 drivers/media/platform/qcom/venus/core.c       | 22 ++++--
 drivers/media/platform/qcom/venus/core.h       |  5 ++
 drivers/media/platform/qcom/venus/pm_helpers.c | 92 ++++++++++++++++++++++++--
 3 files changed, 106 insertions(+), 13 deletions(-)
