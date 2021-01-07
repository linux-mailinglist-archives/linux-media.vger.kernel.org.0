Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 809572ECE79
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 12:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727716AbhAGLOJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 06:14:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbhAGLOI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 06:14:08 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31C01C0612F4
        for <linux-media@vger.kernel.org>; Thu,  7 Jan 2021 03:13:28 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id q18so5275126wrn.1
        for <linux-media@vger.kernel.org>; Thu, 07 Jan 2021 03:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=gk0VZrJpE2xA3EGI+aiPFK25QN6p0u1VwtnpvxCaFaM=;
        b=F2HviaB2PBaVB6mALRh2QbeT0Mt+nt4k2KSdjIbCC3nZ57FAgsMa4Kr1aWNvSe4X9o
         MdlBKerR5DX2OKXnnDzj+2Q5TqnfaSd8IJFGe1ERFxyTQuC+J8k+ZbGFGCX9xHznVd+f
         dark8xJO/Nwm3PgFlT83mQgHgC4wWXqhTraESnen8KV/AHJzvUy/QqJjqmSIdvxUmslQ
         T6+cIfiIycYZvv9jnBOklyhWUYW+pYXvOEHXIAPtHIKLMqxAzVXj11+TAyZTr0QygfmW
         t+8lHlnwKxv9L3sjiPXAn2otsv9xUx77wbXq6Jc1F8bA1ApFAZoRA7tzdBZRBJdgJmDP
         Bmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=gk0VZrJpE2xA3EGI+aiPFK25QN6p0u1VwtnpvxCaFaM=;
        b=rcVrz/iHd9byGnnJSUDnTxiCasmJ5E8xS0ARhdrI+5OFvwvn6LEpgTavY9q35duTOs
         Of0MNnwuOKYz19zVDOH5IDbBLMe7RnwaHNQDNW9ba6wixwGEvkfyMIhX5JGjXlLBXhpw
         nGG9pkSIUo3ncuh4JGhH8poNmzouvoRisJ3y082qWzuVm1MXocHgxTM6kMjm1AitTk53
         IJeplD51OVtjMSFQpwJq1hLEhvwTQCnbkR3kukmNxdnXJAS5J1e+fC2joaSmbDgGcUsk
         VVmbMbnxX8fzvUCQ4dBCddYKfhR5oqoiD4I4MMyqB86KOnoLOk50SXBfdoAO9UwPlsvE
         oAaA==
X-Gm-Message-State: AOAM531U179xA9blX6z8JXVvRJZ9+pH9BWzeq1VXK4rP0fuwn/cGkuUd
        PtuuGFigGUu6NhEJLdqILYJmnn1yMp5KBR/C
X-Google-Smtp-Source: ABdhPJx1r0wao2MKPqdVdy7wtbO8zwr7agDAW798HP21cz+dS5JkdJiKkUVYOXoQ3tba+JIv4YPvMg==
X-Received: by 2002:a5d:43c3:: with SMTP id v3mr8360568wrr.184.1610018006804;
        Thu, 07 Jan 2021 03:13:26 -0800 (PST)
Received: from localhost.localdomain (hst-221-30.medicom.bg. [84.238.221.30])
        by smtp.gmail.com with ESMTPSA id 125sm7352315wmc.27.2021.01.07.03.13.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 03:13:26 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.12] Venus updates
Date:   Thu,  7 Jan 2021 13:13:16 +0200
Message-Id: <20210107111316.18115-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Venus driver updates for v5.12 includes:

 * Decoder improvements related to dynamic resolution change.
 * Encoder stability improvements.
 * Change to VB2 contiguous allocator.
 * Introduce hfi platform and static capabilities in the driver in preparation
   for new Venus IP v6.

Please pull.

regards,
Stan

The following changes since commit ecd07f4b9d2173694be9214a3ab07f9efb5ba206:

  media: allegro: rename stream_id to dst_handle (2021-01-04 13:22:54 +0100)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.12

for you to fetch changes up to 726d75fdca34642fc33e4c21db2737b33ee825b0:

  venus: helpers: Wire up hfi platform buffer requirements (2021-01-07 12:45:44 +0200)

----------------------------------------------------------------
Venus updates for v5.12

----------------------------------------------------------------
Alexandre Courbot (2):
      media: venus: use contig vb2 ops
      media: venus: preserve DRC state across seeks

Fritz Koenig (1):
      venus: vdec: Handle DRC after drain

Stanimir Varbanov (21):
      venus: vdec: Fix non reliable setting of LAST flag
      venus: vdec: Make decoder return LAST flag for sufficient event
      venus: helpers: Lock outside of buffer queue helper
      venus: venc: Init the session only once in queue_setup
      venus: Limit HFI sessions to the maximum supported
      venus: hfi: Correct session init return error
      venus: helpers: Calculate properly compressed buffer size
      venus: pm_helpers: Check instance state when calculate instance frequency
      venus: Delete not used core caps
      venus: Add more capabilities and VP9 profile/levels
      venus: Create hfi platform and move vpp/vsp there
      venus: Rename venus_caps to hfi_plat_caps
      venus: hfi_plat: Add codecs and capabilities ops
      venus: hfi_plat_v4: Populate codecs and capabilities for v4
      venus: hfi_plat: Add platform ops for getting number of VPP pipes
      venus: hfi_plat_v6: Populate capabilities for v6
      venus: hfi_plat: Add hfi platform buffers ops
      venus: Add platform buffers for v6
      venus: Get codecs and capabilities from hfi platform
      venus: vdec,core: Handle picture structure event
      venus: helpers: Wire up hfi platform buffer requirements

Vikash Garodia (1):
      media: venus: request for interrupt from venus

 drivers/media/platform/Kconfig                     |    2 +-
 drivers/media/platform/qcom/venus/Makefile         |    4 +-
 drivers/media/platform/qcom/venus/core.c           |   17 -
 drivers/media/platform/qcom/venus/core.h           |   54 +-
 drivers/media/platform/qcom/venus/helpers.c        |  136 +-
 drivers/media/platform/qcom/venus/helpers.h        |    2 +-
 drivers/media/platform/qcom/venus/hfi.c            |   18 +-
 drivers/media/platform/qcom/venus/hfi_helper.h     |   18 +
 drivers/media/platform/qcom/venus/hfi_parser.c     |   59 +-
 drivers/media/platform/qcom/venus/hfi_parser.h     |    7 +-
 drivers/media/platform/qcom/venus/hfi_plat_bufs.h  |   38 +
 .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   | 1317 ++++++++++++++++++++
 drivers/media/platform/qcom/venus/hfi_platform.c   |   65 +
 drivers/media/platform/qcom/venus/hfi_platform.h   |   67 +
 .../media/platform/qcom/venus/hfi_platform_v4.c    |  319 +++++
 .../media/platform/qcom/venus/hfi_platform_v6.c    |  326 +++++
 drivers/media/platform/qcom/venus/hfi_venus.c      |   80 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     |   12 +-
 drivers/media/platform/qcom/venus/vdec.c           |  129 +-
 drivers/media/platform/qcom/venus/venc.c           |  108 +-
 20 files changed, 2535 insertions(+), 243 deletions(-)
 create mode 100644 drivers/media/platform/qcom/venus/hfi_plat_bufs.h
 create mode 100644 drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform.c
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform.h
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v4.c
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6.c
