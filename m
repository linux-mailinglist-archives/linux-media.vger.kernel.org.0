Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0723D2FB3E5
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 09:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730245AbhASIUU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 03:20:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729440AbhASIUB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 03:20:01 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72735C061574
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 00:19:06 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id n6so5353864edt.10
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 00:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fv5IXNyt2xoTPfx/VfOonjupTi1Xaenv1cqFE08My+o=;
        b=nxwhGPXEPAXJBtt3AYIDMt7ZZ4a6tpZHvAUeuCY6cogrcwlf1XWzko/pkSTAzGFS+N
         HE/9XAqKwoW/ZPT3z2TPMmQsGTO+P8EpSmJLFIHBScFkcQPdZsAFoNlm2eYaRnUGmklT
         02rUrT2Ew5MP5zmmC1p7lkV7arR4CKGPyMoHsrloMzLck83QfRt6+XjDdSQHf+SbLmdd
         SH6odajzJNK6UF/Nlky0ht85VY8MluS+Qe+gB9Zw26R5jJhJqEk1w80+TYbSlprmf6S2
         9vYwON1g9sGxy/JPLGIXsU35n4hZaaLpMHMs5e5YZuxmmqVh7UyccaxhWm3ZlJbCdWKM
         DUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fv5IXNyt2xoTPfx/VfOonjupTi1Xaenv1cqFE08My+o=;
        b=sOIq3Wag/bcj7BkDfZXHdeF50VkffG0vSDquZajFP3yJ1g267jFEHZzM6e1K1oS26n
         K7zZ8Fr3CbVz24ULcdb43aYQyn+5soqUwrWjLI0L9S3/ysYcYTY5hqZlOzjcdBQkfdgO
         kQGtrrneijFJhMRTkKd86Fbp9dRJyOIbPgGrA+z6RL5To8JPvZ391Fcu1ZbdwQG4+tJT
         94Ua+NK3XHQr+rDWOSW8dwJDDfC1PgvOF8TxAMN8XJGbD3joTLo6LUon2Agw8ltHHpJ5
         V0ZcWFYM0Hh7mZu8Zh0DWoFGXwaxoeqBjUpPAflwDvaXY20b/ZlMoESdOaaURjWfi48D
         a9FA==
X-Gm-Message-State: AOAM532oMV34oq22G+beklGSA80KBTiJteJQSgr5xlOyJ7QPm+iR0niL
        cGqKpNOevhNKAFIzrH7ymkwSOH/6PuHHjbzl
X-Google-Smtp-Source: ABdhPJzoGasIG8/47cGTvCRB1o0cli2MP4oL1BT+abCLqVRT0yf/wNf6nTvhWeoe7N2SesuvDUyiQw==
X-Received: by 2002:a50:b246:: with SMTP id o64mr2317461edd.132.1611044345018;
        Tue, 19 Jan 2021 00:19:05 -0800 (PST)
Received: from localhost.localdomain (hst-221-75.medicom.bg. [84.238.221.75])
        by smtp.gmail.com with ESMTPSA id de4sm4128734edb.38.2021.01.19.00.19.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 00:19:04 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.12] Venus updates - part2
Date:   Tue, 19 Jan 2021 10:18:53 +0200
Message-Id: <20210119081853.1293838-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Venus driver updates for v5.12 part2 includes:

 * Two patches to fix sparse/smatch warn/errors of previous pull request.
 * A patch to remove dependancy to interconnect.
 * Adds core-dump support for firmware. 
 * A few ready to merge fixes and v4l2 control fix.  


Please pull.

regards,
Stan

The following changes since commit 321af22a3d2f6ed1fb1737c8588c01f6fec8a7b8:

  media: atomisp: convert comma to semicolon (2021-01-14 13:59:46 +0100)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.12-part2

for you to fetch changes up to a2e970d99e814dcd12bc64c1cd42e1bd5597949d:

  venus: venc: set IDR period to FW only for H264 & HEVC (2021-01-19 09:55:45 +0200)

----------------------------------------------------------------
Venus updates for v5.12 part2

----------------------------------------------------------------
Colin Ian King (1):
      media: venus: Fix uninitialized variable count being checked for zero

Dikshita Agarwal (4):
      venus: core: add support to dump FW region
      venus: venc: fix handlig of S_SELECTION and G_SELECTION
      venus: venc: set inband mode property to FW.
      venus: venc: set IDR period to FW only for H264 & HEVC

Georgi Djakov (1):
      media: platform: Remove depends on interconnect

Stanimir Varbanov (1):
      venus: pm_helpers: Control core power domain manually

Zou Wei (1):
      media: venus: Mark bufreq_enc with static keyword

 drivers/media/platform/Kconfig                     |  1 -
 drivers/media/platform/qcom/venus/core.c           | 30 +++++++++
 drivers/media/platform/qcom/venus/core.h           |  4 +-
 drivers/media/platform/qcom/venus/firmware.c       |  3 +
 drivers/media/platform/qcom/venus/helpers.c        | 18 ++++++
 drivers/media/platform/qcom/venus/helpers.h        |  2 +
 drivers/media/platform/qcom/venus/hfi_cmds.c       | 12 ++++
 drivers/media/platform/qcom/venus/hfi_helper.h     |  4 +-
 drivers/media/platform/qcom/venus/hfi_parser.c     |  2 +-
 .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   |  4 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     | 36 ++++++-----
 drivers/media/platform/qcom/venus/venc.c           | 73 +++++++++++++++-------
 drivers/media/platform/qcom/venus/venc_ctrls.c     | 17 ++++-
 13 files changed, 159 insertions(+), 47 deletions(-)
