Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E86CA338814
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 09:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232384AbhCLI56 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 03:57:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232343AbhCLI5d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 03:57:33 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8701C061574
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 00:57:32 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id x21so6833606eds.4
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 00:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7zv1xOGJda4AtyvsNNHyaUWXqhFQbgUkYGG6JO8p1G8=;
        b=Q9qx3fa25Pa3BMHQomhVxJGEmj35aVIxtxQN2XfiCkdty43ppSwNJlfF1DPLMEa5Pz
         +opAbUo/nAN1NcgbSzBV/8q7QE1WQdJiunJTNb0JU0s7zhwdD2qSl+W3qApS2d4x0fUF
         sTzMag4pZcVyzlGbE3O6mFNykJRMiW+EhQWUYVz0pSnnlwtWuDdFcsKJaM/Pcwn8k1Or
         d6ux6BLXQA5bE7W/ZNRl0y6khjizKgWUqAm1kM4uhSVcV/qxIB1FUidGVVPGKCcmcv/r
         vCBoRbEN/tf0LAMDLemdTUl2Ml4DiXOm4XYlygQmYbMPI3+u0RxdAn+oiHdyE6JmShXA
         0kcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7zv1xOGJda4AtyvsNNHyaUWXqhFQbgUkYGG6JO8p1G8=;
        b=Ro/+865ObvSC2WxOKhEStLbvHt6EdBor9tZ8wts0fm5rky9x8i48ae+prwVcE1N5qf
         8DKJMaeVfptF+kfz8TKGK4TKnPn+2C9pnWJmwGpILQKltAnQ9s5Ssxu3tN6y5U7JsPXq
         ga7YiVscIkpRp92d7U/uoknjinhA1ykJrdA6wKRnEtBuzPOAs6Zjw2HodukIUtREYidZ
         m1OpKt4xAGMIsSKt8QC6L261XM21lMgDkw/UI6LM4AaubOLl63C5Jh4YH4wAjLJPfsq3
         JO0plVEzExFWLXW6MK1dzLCxNIpApxr5gXby79xp5ciFUvmzhUvsx6J+MeY+xbCgyDIh
         SL4A==
X-Gm-Message-State: AOAM533P7qqRHpuDxcL853E+be8t3Zl/eSLzUC6T3YOsLpIXxz19CdTY
        lniiIW4uTgQyRmYDjVSmYC8mnd8ett5g3G91
X-Google-Smtp-Source: ABdhPJwxd5nL4wdJW5BhRR+TQY5dVzemuP1Shy/xURe2dcJclumgbRBnCaSK4nljWFeTb01yI1zIKw==
X-Received: by 2002:a05:6402:68e:: with SMTP id f14mr12865814edy.169.1615539451360;
        Fri, 12 Mar 2021 00:57:31 -0800 (PST)
Received: from localhost.localdomain (hst-221-88.medicom.bg. [84.238.221.88])
        by smtp.gmail.com with ESMTPSA id s14sm2418683ejf.47.2021.03.12.00.57.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 00:57:31 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.13] v2: Venus updates
Date:   Fri, 12 Mar 2021 10:57:16 +0200
Message-Id: <20210312085716.2435846-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixed checkpatch warn/errors.

Supersedes https://patchwork.linuxtv.org/project/linux-media/patch/20210306162903.221668-1-stanimir.varbanov@linaro.org/

Venus driver updates for v5.13 includes:

 * Make display-delay and display-delay-enable standard controls and support
 for them in Venus driver.
 * Add new AUD generation control and support for it in Venus driver.
 * Parse firmware-name DT property in the Venus driver.
 * Fix probe dependency error in case of built-in Venus driver.
 * Fix interconnect resource in .probe.

Please pull.

regards,
Stan

The following changes since commit 1cb3ff130f4d97dec2d1bee968a87f5d6e24dd60:

  media: imx: imx7_mipi_csis: Print shadow registers in mipi_csis_dump_regs() (2021-03-11 11:59:53 +0100)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.13-v2

for you to fetch changes up to a7a0b3a31d6d270721b7e563272a1647da4522f1:

  venus: core: Parse firmware-name DT property (2021-03-12 10:43:18 +0200)

----------------------------------------------------------------
Venus updates for v5.13 v2

----------------------------------------------------------------
Bryan O'Donoghue (1):
      media: venus: core, venc, vdec: Fix probe dependency error

Christophe JAILLET (1):
      media: venus: core: Fix some resource leaks in the error path of 'venus_probe()'

Stanimir Varbanov (7):
      v4l2-ctrl: Make display delay and display enable std controls
      venus: vdec: Add support for display delay and delay enable controls
      s5p-mfc: Use display delay and display enable std controls
      docs: Deprecate mfc display delay controls
      media: v4l2-ctrls: Add control for AUD generation
      venus: venc: Add support for AUD NALU control
      venus: core: Parse firmware-name DT property

Stephen Boyd (1):
      media: venus: Include io.h for memremap()

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 30 +++++++++++++++++
 drivers/media/platform/qcom/venus/core.c           | 38 ++++++++++++----------
 drivers/media/platform/qcom/venus/core.h           |  3 ++
 drivers/media/platform/qcom/venus/firmware.c       |  8 ++++-
 drivers/media/platform/qcom/venus/pm_helpers.c     | 30 ++++++++---------
 drivers/media/platform/qcom/venus/pm_helpers.h     |  7 ++--
 drivers/media/platform/qcom/venus/vdec.c           | 10 +++++-
 drivers/media/platform/qcom/venus/vdec_ctrls.c     | 16 ++++++++-
 drivers/media/platform/qcom/venus/venc.c           | 14 ++++++++
 drivers/media/platform/qcom/venus/venc_ctrls.c     |  8 ++++-
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c       | 16 +++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c               |  6 ++++
 include/uapi/linux/v4l2-controls.h                 |  4 +++
 13 files changed, 148 insertions(+), 42 deletions(-)
