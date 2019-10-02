Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE70FC875F
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 13:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbfJBLaG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 07:30:06 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34077 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbfJBLaG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 07:30:06 -0400
Received: by mail-wr1-f67.google.com with SMTP id a11so19256661wrx.1
        for <linux-media@vger.kernel.org>; Wed, 02 Oct 2019 04:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=c+HawoUCN0wDXl6yXcj90og2sCV58k1+u/97qXquZg8=;
        b=swHPdpIbspRHp/fPlwdIn3d2attRFOXkBd2S+HfnGVsf0GuCz1djbGnsDEU7h1E/Rf
         g/3ejgq4H7Su2BT5ai+/DyfL5z11fxuE+ebKxfLgkb16IX6aidsXQychtVnG5FquQzj0
         k3PlsYmhlj7CY8bpVvjJkRzBz1xoq+aDCd713E1JoUGQ1dYZYft3rp7M6Bp4KFsXp2x/
         d8eI8w9gZEux5mgOxC/Zb6WX1Wa+6Jz/e64MMe3hNEDI2nXyiLaxinvdKKu0/ccKHmOL
         aiGdw5vvbpfeHgBLjn8jgyiiKtU6hmqKtCNnhE58yK5aKpy9qD52PAPuaCYBmGBNgEkZ
         Qvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=c+HawoUCN0wDXl6yXcj90og2sCV58k1+u/97qXquZg8=;
        b=qQkLb1g2Ps90ekpkdMql2WQmRSpbcXjjLYiEeVdM6pQKIXCn0ZMhC1Yoi9rSl+GRmo
         FFEYCm/Yl/NofiNDB1/qAHvHyMcb0auv9p7HLz0wG7Y+ioOowhwHnr/5grlLw6PMmX5Y
         +5FIgwGQE0ZJGOwq/zlvedOl1u76N9N9uKJzg2U/oNpbRWKPYckb116waS3xuRvPcv8Q
         7nLlRQOVeuj2qJkR5ICM0sSk5nz9FlYCP2JD9SJIcIoQbHsN3O2SqIv4scmp++blyfUa
         9ajwiEdP8Wu2PVu/RmJjPH38Azamvd6YQAIEJrVAGAkPeM4h4BEON3RCdvzBpV8CXOHL
         LFXg==
X-Gm-Message-State: APjAAAVKdidEjSTK4r3PNEB2fsuypaBtXvhEttA2VajeZRID8tfSGJfq
        OZRCAlCedI1b6kRtsJ5cKjdNFXdFq2k=
X-Google-Smtp-Source: APXvYqzCudC6RWViI4ecqPsoOcPnDNcmO80Kt8+/eOsupB+g8O4ldLGzx5wW25Gu5kpzV4f2nkPwjQ==
X-Received: by 2002:a5d:6606:: with SMTP id n6mr2132985wru.389.1570015803880;
        Wed, 02 Oct 2019 04:30:03 -0700 (PDT)
Received: from mms-0440.qualcomm.mm-sol.com ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id v6sm12267740wma.24.2019.10.02.04.30.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 04:30:03 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for v5.5] Venus updates, take 2
Date:   Wed,  2 Oct 2019 14:29:53 +0300
Message-Id: <20191002112953.16642-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The Venus driver updates include:

* three fixes: fail to suspend, enum frameinterval issue with encoder
and frequency table modifications for v3 to handle performance issues.
* two new features: interconnect bandwidth support on v4 and more precise
clock-scaling on v4.

Please pull.

Changes since v1:
Fixed checkpatch error/warn in 0003-venus-venc-Fix-enum-frameintervals.patch

regards,
Stan

The following changes since commit 503e59365dd134b2c63864f14e2de0476284b003:

  media: i2c: ov2659: Switch to SPDX Licensing (2019-10-01 17:39:16 -0300)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.5

for you to fetch changes up to e8938a0b5beb6f0fafc921010375cda64a5a4592:

  venus: Update clock scaling (2019-10-02 14:17:23 +0300)

----------------------------------------------------------------
Venus updates for v5.5

----------------------------------------------------------------
Aniket Masule (2):
      venus: Add codec data table
      venus: Update clock scaling

Loic Poulain (1):
      venus: core: Fix msm8996 frequency table

Stanimir Varbanov (3):
      venus: Use on-chip interconnect API
      venus: venc: Fix enum frameintervals
      venus: Fix occasionally failures to suspend

 drivers/media/platform/Kconfig                |   1 +
 drivers/media/platform/qcom/venus/core.c      |  56 +++++-
 drivers/media/platform/qcom/venus/core.h      |  30 ++++
 drivers/media/platform/qcom/venus/helpers.c   | 246 ++++++++++++++++++++++++--
 drivers/media/platform/qcom/venus/helpers.h   |   3 +-
 drivers/media/platform/qcom/venus/hfi_venus.c |   6 +
 drivers/media/platform/qcom/venus/vdec.c      |   8 +-
 drivers/media/platform/qcom/venus/venc.c      |  27 ++-
 8 files changed, 346 insertions(+), 31 deletions(-)
