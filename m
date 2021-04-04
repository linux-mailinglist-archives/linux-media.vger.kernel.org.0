Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20A6935377D
	for <lists+linux-media@lfdr.de>; Sun,  4 Apr 2021 10:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbhDDImj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Apr 2021 04:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbhDDImj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Apr 2021 04:42:39 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF7BC061756
        for <linux-media@vger.kernel.org>; Sun,  4 Apr 2021 01:42:33 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id r12so12964363ejr.5
        for <linux-media@vger.kernel.org>; Sun, 04 Apr 2021 01:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6/FsJ3jRODRujlgLae07rHac1f8iqgcFfyFSBisI19k=;
        b=Jv4AtU32WzcPfp2n8x3/H59z46DzkBaM0VE5rId99BGEIj6Cx5Y6JUCjs+5YoT5IrD
         HdGB+EmTvLDejftVGNo+cm2QbUiapXmzf28ddJJYzc9sFbWOn4+GkSkcwCJrlanmBaPG
         xDRSbJJJ8tLTVnF6j5uQuRO1GVM58sjgh7X2Kl3XP6evj0zkVEvpcKmpqDuKJsgY0V9J
         L8F1TWlTUCndi5UvHasewX0j+emnZY/oTM+qRQtA0GRE4sx15BjhD9mNktV+fZ4d87+T
         TMg6xwnX/S7UD2pfQRV3DY7sp4VGtyc06qwHzw5AiRkyb7aGLjuLv4hUoz0tA62DwGJU
         tl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6/FsJ3jRODRujlgLae07rHac1f8iqgcFfyFSBisI19k=;
        b=lrEESbsH9OcVTpiWep6jD9qppPwMB4LkIeLXHDsM0S6nsG/IZF/1dWT9bnhFuQ020x
         REX1NUHz0OGXzJg2ZWfHJSa+8sUxSDfiHZg4T8WqHZwt/RBTQABWJKab7eXpxDXKrn8T
         M/YkZkuGo7pWJBdZrxX7PVb3Jv6CQu+nOMQRbm6/5CFx93mXYh18Wq5yf/QywEG/+44E
         y+UYrBFYvDb4jiOee52NAgAKGHLW5Aw3jh5Ukb20vxXlnYI92CHLRQihftzyuXF8c1Fx
         7gKlh0gu28hs7uVrANBbfpgzuDWLz2w1kvH6XDWGn91rTiNXns7fpM0e2ttgMtoiiufZ
         jPaA==
X-Gm-Message-State: AOAM532H1g6+yGuxnZYNBIDA9WNnfAdrnuqqFpUU9zo/u0Lti8jWmaCC
        axD71/bmPsI/+d2BIu/XzDrqBDnCXJGB2QvK
X-Google-Smtp-Source: ABdhPJztxSrdsroFySHhE8eBRKN9TN7LzLRgUzI7BJWUYNToWuo4WpbhEZ79AGAbX/nWMc7g3fu0LA==
X-Received: by 2002:a17:906:d790:: with SMTP id pj16mr22209075ejb.255.1617525751717;
        Sun, 04 Apr 2021 01:42:31 -0700 (PDT)
Received: from localhost.localdomain (hst-221-13.medicom.bg. [84.238.221.13])
        by smtp.gmail.com with ESMTPSA id e16sm6513585ejc.63.2021.04.04.01.42.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 01:42:31 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.13] Venus updates - part3
Date:   Sun,  4 Apr 2021 11:42:23 +0300
Message-Id: <20210404084223.2141401-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This adds Venus v6xx support found on sm8250 Qualcomm SoCs.

regards,
Stan

The following changes since commit 97b34809ec240d82c82af97626c2071a4062e0e6:

  media: staging: atomisp: reduce kernel stack usage (2021-03-23 16:55:52 +0100)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.13-part3

for you to fetch changes up to f345ee419dd70bb6b41d93946b3d0159631ab43d:

  media: venus: vdec: Fix decoder cmd STOP issue (2021-04-04 10:14:08 +0300)

----------------------------------------------------------------
Venus updates for v5.13 part3

----------------------------------------------------------------
Bryan O'Donoghue (11):
      media: venus: Update v6 buffer descriptors
      media: venus: core: add sm8250 DT compatible and resource data
      media: venus: core: Add io base variables for each block
      media: venus: hfi,pm,firmware: Convert to block relative addressing
      media: venus: core: Add differentiator IS_V6(core)
      media: venus: core: Add an io base for TZ wrapper regs
      media: venus: core: Add an io base for AON regs
      media: venus: core: Hook to V6 base registers when appropriate
      media: venus: hfi: Read WRAPPER_TZ_CPU_STATUS_V6 on 6xx
      media: venus: hfi, vdec: v6 Add IS_V6() to existing IS_V4() if locations
      media: venus: pm: Hook 6xx pm ops into 4xx pm ops

Dikshita Agarwal (12):
      media: venus: hfi: Define block offsets for V6 hardware
      media: venus: hfi: Define additional 6xx registers
      media: venus: hfi: Add a 6xx boot logic
      media: venus: hfi: Add 6xx interrupt support
      media: venus: core,pm: Vote for min clk freq during venus boot
      media: venus: hfi: Add 6xx AXI halt logic
      media: venus: pm: Toggle 6xx wrapper power in vcodec_control
      media: venus: firmware: Do not toggle WRAPPER_A9SS_SW_RESET on 6xx
      media: venus: helpers: Add internal buffer list for v6
      media: venus: helpers, hfi, vdec: Set actual plane constraints to FW
      media: venus: hfi: Increase plat_buf_v6 o/p buffer count.
      media: venus: helper: Decide work mode

Stanimir Varbanov (2):
      media: venus: core,pm: Add handling for resets
      media: venus: vdec: Fix decoder cmd STOP issue

 drivers/media/platform/qcom/venus/core.c           |  78 ++++++++++
 drivers/media/platform/qcom/venus/core.h           |  19 +++
 drivers/media/platform/qcom/venus/firmware.c       |  34 +++--
 drivers/media/platform/qcom/venus/helpers.c        |  71 ++++++++-
 drivers/media/platform/qcom/venus/helpers.h        |   3 +-
 drivers/media/platform/qcom/venus/hfi_cmds.c       |  15 +-
 drivers/media/platform/qcom/venus/hfi_helper.h     |   9 +-
 .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   |   6 +-
 .../media/platform/qcom/venus/hfi_platform_v6.c    | 138 ++++++++---------
 drivers/media/platform/qcom/venus/hfi_venus.c      | 164 +++++++++++++++------
 drivers/media/platform/qcom/venus/hfi_venus_io.h   | 118 +++++++++------
 drivers/media/platform/qcom/venus/pm_helpers.c     |  92 +++++++++++-
 drivers/media/platform/qcom/venus/vdec.c           |  17 ++-
 drivers/media/platform/qcom/venus/venc.c           |   2 +-
 14 files changed, 567 insertions(+), 199 deletions(-)
