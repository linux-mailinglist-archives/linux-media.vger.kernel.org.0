Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDF5C35DA91
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 11:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243443AbhDMJAi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 05:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbhDMJAg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 05:00:36 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF73C061574
        for <linux-media@vger.kernel.org>; Tue, 13 Apr 2021 02:00:17 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id w18so18542615edc.0
        for <linux-media@vger.kernel.org>; Tue, 13 Apr 2021 02:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oQl29HipZj4pLZm/cS+1hsQHo2L4v6ZlnErba1X/H+c=;
        b=qN9JOSweUFIe9J1FdmM3gC3UdHpJclzUwMTRe4LTJSUl+GTaXEGYENt4/l/YQjRBCT
         Gljz5QVM/bKYMY/mlCwpqHp4LEqN3ygJK4ZW51p5+7qQlb0Xyh+bTJiumLnLhCK+dFjY
         vyDDNl7Rqqihs9D4zuc9IPwZsX0uH1AdsnQ2/kox9sCO7rfGIZN4TD2Qi5c9dCHJiQGg
         g7ZNkqoXKsGvQyKAVQXO5eRFkSMzPPqLdRJ0pWKSS+CkivzC0K4c2TEhB+a+Np7075Qb
         2ElZ6b8qqhAlNVKuMAsk+X04TDWgLE0t19DKW+Tk169PptsYuAXpOVpc3jH8aOWBarzX
         GtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oQl29HipZj4pLZm/cS+1hsQHo2L4v6ZlnErba1X/H+c=;
        b=WE2z19Wc/b/EFsM6qKEBa3/Z8Nlpduq/MuvGUZcmcKRdU7Eil8c+80EjWUs0RBND4q
         d0G7Vd20C5iU4+FBxhiS9QLtEiPP4/gs2srIvxmHy3wgIS1tqT4gst7IW+w5M2bVGELg
         RfAN7PxZxVvvlH8ay4ca1qiUZh5wItNfaqZ1Bm4vokK49Hj+PEg97pqgTaLe7NJEFGTQ
         wTMl41IPNeCWSdyHRfu/h/gyXJ9bQLCdca+U/piKkkfPkOiKagyLMV2sbG5zoGnWslJH
         CkZoyU1rGM7PrwxibQFh+7TE+zgLX3gxGvKXlCQrCGUiHPcLD3nmwDsJKv4TIgD1+Rwm
         G9oQ==
X-Gm-Message-State: AOAM533bik/n8kfusQcLW18bHyLoCLDRzBdf9Q7tIsSPi1SaP0NAxKzg
        Fn993ISaI3m1dteNWUo45ipYT/eSC+S/cA==
X-Google-Smtp-Source: ABdhPJyqDn6emPO7JY/T08Q5i5nJpn3G9vRNsWHf5yDSni/fkviPh7XxNiq7Bbk9crXrpaxnFD1IOg==
X-Received: by 2002:a50:f29a:: with SMTP id f26mr33624479edm.13.1618304416087;
        Tue, 13 Apr 2021 02:00:16 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id x4sm8607082edd.58.2021.04.13.02.00.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 02:00:15 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.13] Venus updates - part4
Date:   Tue, 13 Apr 2021 12:00:05 +0300
Message-Id: <20210413090005.1112579-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are few more Venus new features and fixes:

  * Fix kerneldoc warns/errors
  * Fix for v6 buffer size calculations
  * Fix for maximum bandwidth
  * Fix for potential infinite loop
  * Add Venus image version to qcom socinfo
  * Fix dev_warn for hardware overload

Please pull.

regards,
Stan

The following changes since commit 4f4e6644cd876c844cdb3bea2dd7051787d5ae25:

  media: gscpa/stv06xx: fix memory leak (2021-04-09 13:19:38 +0200)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.13-part4

for you to fetch changes up to 6c8951b87829a1ef8211317ca123b9786c6f1e26:

  venus : hfi: add venus image info into smem (2021-04-13 11:46:11 +0300)

----------------------------------------------------------------
Venus updates for v5.13-part4

----------------------------------------------------------------
Colin Ian King (1):
      venus: core,pm: fix potential infinite loop

Dikshita Agarwal (2):
      venus: Fix internal buffer size calculations for v6.
      venus : hfi: add venus image info into smem

Dmitry Baryshkov (1):
      venus: core: correct firmware name for sm8250

Mansur Alisha Shaik (1):
      venus: fix hw overload error log condition

Stanimir Varbanov (1):
      venus: core: Fix kerneldoc warnings

Vikash Garodia (1):
      venus: helpers: keep max bandwidth when mbps exceeds the supported range

 drivers/media/platform/Kconfig                     |  2 +-
 drivers/media/platform/qcom/venus/core.c           |  2 +-
 drivers/media/platform/qcom/venus/core.h           | 40 +++++++++++++++++-----
 drivers/media/platform/qcom/venus/hfi_msgs.c       | 20 +++++++++--
 .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   | 26 +++++++++-----
 drivers/media/platform/qcom/venus/pm_helpers.c     |  8 ++---
 6 files changed, 73 insertions(+), 25 deletions(-)
