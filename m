Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411432667F4
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 19:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbgIKR6V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 13:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgIKR6R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 13:58:17 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EC58C061573
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2020 10:58:16 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id lo4so14885612ejb.8
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2020 10:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=nRURPQVTePKPsHgmeSXD6VQbJn+/wx6dLirmnPb+How=;
        b=fWPhBwRH7CxVkYP5U3XirjAc3eAR2cjK8GksrRWH8jDGKoOGlGkJ5E9xNaV5cglM7x
         QCZ/DQbWbb4K8hSfg7bTdf/cXzuTDmz0TMZO5z6VMvcYvOO0CBalASHrcC391I3F+0Gn
         23Nmj/eM2FH+gzq/YgJTVgVu8CWMYN2DxrMVfPca2/Lp1qUk6uTqHDoCgzDvEc0TXmML
         XcY1mALfEQtA0MQ10dT6oZqhwlMRVHDbsKWXE/YGXAd9hkMd6fljX+a+9cvZRyZhTrZF
         rSnx90ObzZbRyr55eWAn3V5SoPDvgcUao9+ARxjRRmKcnWUtofws3HF+6R41nLBeGFhI
         ECtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=nRURPQVTePKPsHgmeSXD6VQbJn+/wx6dLirmnPb+How=;
        b=qvVbMOAz9dVlL1Q+QPeFqqs7SiR8titkX9JuBIuT8ozOwD5ZSkgkVXk2j1+VyUdDQb
         CDCxdN/QsvNmHlUXIERapw0KelTzPuUr6M/9SQFWtKqvdc9lewPxxKuClZbXxNy32R0F
         10tA16Y5J91GNOexGyNmhmGAjIZvfu58kcfhc6+usAr+MQ0hIt4Ad60Q6PwF7p01lFHg
         p1VHTjcIJnTL229dqG7qS5YVxR4yUsdkzRjDnyzjACB7jLq7JCVocTon2judPJNzrf+t
         nSTDkP7GIDD+JjaMZmFEwV1oIYf0b0aUfouT8/lVqgNut1YvufMHpAFuQpqro/CyUmk5
         KQeA==
X-Gm-Message-State: AOAM531CGalUn5opRAU0t6FzSaqcYyY93nliWgxv4yE8D1wDApSEMJgJ
        Xw/NhGIs/M8lbPfz3a39DhXYkShyCOK9Vg4L
X-Google-Smtp-Source: ABdhPJw4VgpOq1ECixaFyXztXyKPNaX+/ssYoY8GRvVpzkYOYbdlRV3BfbxKMV4eMEAS0uYt1tm8lA==
X-Received: by 2002:a17:906:cb92:: with SMTP id mf18mr3287804ejb.485.1599847095028;
        Fri, 11 Sep 2020 10:58:15 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id k9sm2217535edr.3.2020.09.11.10.58.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 10:58:14 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for v5.10] Venus updates - part2
Date:   Fri, 11 Sep 2020 20:56:29 +0300
Message-Id: <20200911175629.25918-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

 * Fix for firmware load failure with the firmware version in linux-firmware for sdm845/850.
 * Add VP9 levels menu control and the implementation in the driver.
 * Cleanup dma_parms.

Please pull.

regards,
Stan

The following changes since commit 93c16fabdb74a9c1a427402fc1fe588a45130c5b:

  media: ov8856: Add support for 3264x2448 mode (2020-09-10 14:29:35 +0200)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.10-part2

for you to fetch changes up to 0aa6d05de364d6e06534ee179ae0d33c1656098b:

  venus: firmware: Set virtual address ranges (2020-09-10 19:12:37 +0300)

----------------------------------------------------------------
Venus updates for v5.10 part2

----------------------------------------------------------------
Robin Murphy (1):
      media: venus: core: Drop local dma_parms

Stanimir Varbanov (8):
      v4l2-ctrl: Add VP9 codec levels
      venus: hfi_helper: Add VP9 profile and levels
      venus: helpers: Add a helper to map v4l2 ids to HFI ids
      venus: vdec: Set/Get VP9 profile/level
      venus: vdec: Use helper to get profile and level
      venus: venc: Use helper to set profile and level
      firmware: qcom_scm: Add memory protect virtual address ranges
      venus: firmware: Set virtual address ranges

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  43 ++++
 drivers/firmware/qcom_scm.c                        |  24 +++
 drivers/firmware/qcom_scm.h                        |   1 +
 drivers/media/platform/qcom/venus/core.c           |  14 +-
 drivers/media/platform/qcom/venus/core.h           |  17 +-
 drivers/media/platform/qcom/venus/firmware.c       |  19 +-
 drivers/media/platform/qcom/venus/helpers.c        | 239 +++++++++++++++++++++
 drivers/media/platform/qcom/venus/helpers.h        |   2 +
 drivers/media/platform/qcom/venus/hfi_helper.h     |  18 ++
 drivers/media/platform/qcom/venus/vdec_ctrls.c     |  31 ++-
 drivers/media/platform/qcom/venus/venc.c           | 159 +-------------
 drivers/media/platform/qcom/venus/venc_ctrls.c     |  14 +-
 drivers/media/v4l2-core/v4l2-ctrls.c               |  21 ++
 include/linux/qcom_scm.h                           |   7 +
 include/uapi/linux/v4l2-controls.h                 |  17 ++
 15 files changed, 429 insertions(+), 197 deletions(-)
