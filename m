Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 209F760DD0F
	for <lists+linux-media@lfdr.de>; Wed, 26 Oct 2022 10:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233360AbiJZI37 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Oct 2022 04:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233328AbiJZI35 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Oct 2022 04:29:57 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E634E120B8
        for <linux-media@vger.kernel.org>; Wed, 26 Oct 2022 01:29:53 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id fy4so19285191ejc.5
        for <linux-media@vger.kernel.org>; Wed, 26 Oct 2022 01:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tCDyYr72ZmIVgiaUFV2oaXbsmgokNr8cc7POh74ybFU=;
        b=XbrfKn40bQZY1mijV4jjxYMkn3bB+FmO2f1LP0eirYPhnMUPd7dozYsMFQ+TDiavWZ
         Ggvz8/gcMcoQQCCwllyiqifxBpANeJW2mTnDh2h2aqMZFltZSV1rKgdH8BSUgzFl8r0r
         u4OBfxlLCE+K0UtGX+V7K6J8ldpJVOPPRCC7sfInpjjgheQA+rGtwWLTWlTPfFvPMZv1
         nZACzReuKy0jm8wnmbBljI5CnXFnExU+8l4XhPW7RJqwFu6et2BgJnNvGf1FxPl3BECX
         28TgK67lHqQ5JNWu/5dLrnurPf60wFoDt+W8vPUGgMzHyAgqAt9lv0fOCJWnMhB12FZz
         IewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tCDyYr72ZmIVgiaUFV2oaXbsmgokNr8cc7POh74ybFU=;
        b=tsK0OnkvzQWboqexcvx9/6lWI3Y8IOuuXjP4t8q4YKj1xwY7ZglUL9eBJWyMuvI2KU
         l9JNkDW7R9gJWn0WY4ILgv2ryAxJqqXeN6ORPkfCTdpjnJreS6sWQFikKNhOu196imGM
         kGU2NadKtKlHWqgYjeK/JudNMJziStvEKDn5l5tqoRX6u7xv8fSwZdgQ23IcKf376nAC
         VBbI+I/Aij6V+RyYxbJ4EFw1wo8ALX5V+ZXR+2c1X2dO5G8O8aCIS4//MPAsVhr6ibTk
         LSkHXT92WvFZ3t+rBqYjUl24wGSqcT134DGGkQsF/McB+l5m6iOs5TKyA567MRvilcIA
         h+7A==
X-Gm-Message-State: ACrzQf0nQP77RNNcxluxJbKs4KNz4U3dvkTK0hgMBQENhMvMAifmvLyq
        9dcvC2i7KoMoNgDVnmBuQ3RMMXqaxb1V3Q==
X-Google-Smtp-Source: AMsMyM6ur+vLwZCr2m8z3lp2qWtx5MZsYhaKzDkGGxrxiZoDhmiwQPZVKCKqd+y/s7fInOT2IhO+PQ==
X-Received: by 2002:a17:907:9625:b0:78d:bb06:9072 with SMTP id gb37-20020a170907962500b0078dbb069072mr36426520ejc.472.1666772992240;
        Wed, 26 Oct 2022 01:29:52 -0700 (PDT)
Received: from localhost.localdomain (hst-221-27.medicom.bg. [84.238.221.27])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709061da900b0078e0973d1f5sm2641886ejh.0.2022.10.26.01.29.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 01:29:51 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.2] Venus updates
Date:   Wed, 26 Oct 2022 11:29:33 +0300
Message-Id: <20221026082933.2897216-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This time the pull request includes Maintainers file changes in Venus
description and few fixes.

Please pull.

regards,
Stan

The following changes since commit 247f34f7b80357943234f93f247a1ae6b6c3a740:

  Linux 6.1-rc2 (2022-10-23 15:27:33 -0700)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/tag-venus-for-v6.2

for you to fetch changes up to 0f6e8d8c94a82e85e1b9b62a7671990740dc6f70:

  venus: pm_helpers: Fix error check in vcodec_domains_get() (2022-10-25 10:38:56 +0300)

----------------------------------------------------------------
Venus updates for v6.2

----------------------------------------------------------------
Stanimir Varbanov (4):
      MAINTAINERS: Change email for Venus driver
      venus: firmware: Correct reset bit
      venus: firmware: Correct non-pix start and end addresses
      venus: firmware: Correct assertion of reset bit on remote processor

Tang Bin (1):
      venus: pm_helpers: Fix error check in vcodec_domains_get()

Vikash Garodia (1):
      MAINTAINERS: Add Vikash as VENUS video driver co-maintainer

 MAINTAINERS                                    |  3 ++-
 drivers/media/platform/qcom/venus/firmware.c   | 20 ++++++++++----------
 drivers/media/platform/qcom/venus/pm_helpers.c |  4 ++--
 3 files changed, 14 insertions(+), 13 deletions(-)
