Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5836F7D22D2
	for <lists+linux-media@lfdr.de>; Sun, 22 Oct 2023 13:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbjJVLMc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Oct 2023 07:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjJVLMb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Oct 2023 07:12:31 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8F0CDE
        for <linux-media@vger.kernel.org>; Sun, 22 Oct 2023 04:12:28 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40806e4106dso12974575e9.1
        for <linux-media@vger.kernel.org>; Sun, 22 Oct 2023 04:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697973147; x=1698577947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IQWvuOFiUBNJs/S8w88w1dGbcOhlrY4y6hR/+1wFMhY=;
        b=kkOpzSeBw/8iPls4w8Z6m9EF6wKUGfGkfLgJKO6qbPAJxAWuw5fCEpeTKAy8UMiQm2
         DKgC14paui8VJ/OY6tsSChi2OyaoAcgSCCe9lPxq7AEKveiVEbrXc0BJCITjv+4kYn0j
         18L1Ubrp35Fa2uGYcm3wTmzGFZCfHcPkhdV1lwInbHWJ3MTS5oAwyytzRVqcZBZmP+jj
         Q/uq+uKhiG/B1jfcrX9NwfJoasP8n3f37PfumzjYZdnLr0SrzwO3er492dUi+e4Kae5A
         wlyCPV6kwvrlAbVl/O96Sl+rlLp5nLXixMIl+3JKaEUqrT1uTnpynH1+7gM3IxrgWBV0
         roLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697973147; x=1698577947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IQWvuOFiUBNJs/S8w88w1dGbcOhlrY4y6hR/+1wFMhY=;
        b=BFVSpiJ3STN9901vSGtFfDiWLBd233GAbRSybqJwZjUZpaXnw0zML173tysUr0z7gM
         Hhe3tsmqTXIo2VNNE1Urlis7/qCXyPHoGpE3Nnv+SpTEvkzBTBxTutEjQQ+Qf3RhbgUX
         yvvOw0goCQz0KEVwE5KLXHCDDPnXkRNXUSosm9zjkrmUJW/r14tnbGi7QMbY5HkQoEW+
         WWfi546R/+SQQNZQakvNqFBVvzJT0ftAiybDsrqOp6vGDnbJ47MnDzFCLgkeKkOH5mv0
         jAguv+yfURe3oX7y3dn7pI5IKjbWBuTdx6VfDDlPjlyv78qP8d8U4yAMGHWsA6Zkq7H/
         xbhA==
X-Gm-Message-State: AOJu0Yw3l19WqI+aML3Ko9pMAmovVxx4zElapetD4MspibRMwUx7dFU+
        Gr4W3JSJRnA1ZeJbotGQsdQMhc/3peU=
X-Google-Smtp-Source: AGHT+IEy/lPiLScnpxp53V/HWYw69u/SYST1jS7gig74ljwN39NE06IDboVkkAer2zEYxeTzOI5vhg==
X-Received: by 2002:a05:600c:2343:b0:401:b92f:eec5 with SMTP id 3-20020a05600c234300b00401b92feec5mr8815416wmq.9.1697973147075;
        Sun, 22 Oct 2023 04:12:27 -0700 (PDT)
Received: from aero-laptop.. (78-154-11-58.ip.btc-net.bg. [78.154.11.58])
        by smtp.gmail.com with ESMTPSA id p3-20020a05600c468300b0040646a708dasm6657414wmo.15.2023.10.22.04.12.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 04:12:26 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.7] Venus updates
Date:   Sun, 22 Oct 2023 14:12:22 +0300
Message-Id: <20231022111222.484567-1-stanimir.k.varbanov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Mauro,

The pull request includes:
 - A flex-array fix
 - Few fixes to avoid OOB accesses
 - Correct firmware path for more SOC versions

Please, pull.

regards,
Stan

The following changes since commit 94e27fbeca27d8c772fc2bc807730aaee5886055:

  media: cec: meson: always include meson sub-directory in Makefile (2023-10-13 11:33:22 +0200)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/tag-venus-for-v6.7

for you to fetch changes up to 9060ee6e0c0e865922ffd51517a7693ae3b231b8:

  media: venus: Fix firmware path for resources (2023-10-22 03:41:57 +0300)

----------------------------------------------------------------
Venus updates for v6.7

----------------------------------------------------------------
Gustavo A. R. Silva (1):
      media: venus: hfi_cmds: Replace one-element array with flex-array member and use __counted_by

Patrick Whewell (1):
      media: venus: Fix firmware path for resources

Vikash Garodia (4):
      venus: hfi: add checks to perform sanity on queue pointers
      venus: hfi: fix the check to handle session buffer requirement
      venus: hfi: add checks to handle capabilities from firmware
      venus: hfi_parser: Add check to keep the number of codecs within range

 drivers/media/platform/qcom/venus/core.c       | 10 +++++-----
 drivers/media/platform/qcom/venus/hfi_cmds.h   |  2 +-
 drivers/media/platform/qcom/venus/hfi_msgs.c   |  2 +-
 drivers/media/platform/qcom/venus/hfi_parser.c | 15 +++++++++++++++
 drivers/media/platform/qcom/venus/hfi_venus.c  | 10 ++++++++++
 5 files changed, 32 insertions(+), 7 deletions(-)
