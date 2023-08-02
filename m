Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F26F576C854
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 10:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233943AbjHBI1o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 04:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233941AbjHBI1n (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 04:27:43 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1129E48
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 01:27:41 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so1439126a12.0
        for <linux-media@vger.kernel.org>; Wed, 02 Aug 2023 01:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690964860; x=1691569660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=f9CvipQeFtHOcLEbAWVrFmu35ePajL0eMH9tb1EZJHI=;
        b=fgufiO1de7SuiJ95JmK92r6fssprswiDfX319XUgAZnl+lhFFa0R6z7sVOJR3yPPcY
         LF/ulR48W2E9Soi2XtcNXdRtOVNZFDog46Pw5h6xpJcXQ8qJyFwffal5st3l1RBhNAhW
         w9WvcmkYQtwAp20gQqzm9N7R6pAimyx+JL2kHMfKs3dHUw6a507SkyQFXVGwqMcIP/jl
         EDQIZ7RneDiFPKeAOHPV8DfyXlq4WOWjvS8O+eUOGqHkfDsykcYABiUNH7SwlBGuXLj6
         28u6Psm0RYjggmxvQcNT4KhCtbv72OzaVOIsOlldSpNA14bvzi8bMzc/xGs2RK4xbf0H
         hRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690964860; x=1691569660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f9CvipQeFtHOcLEbAWVrFmu35ePajL0eMH9tb1EZJHI=;
        b=I0Xq67SBG2cBsk1fun7HSkA9ie19EETHIWsnQdk+Ng7DQJblOwvbu2PNPWtd8fPNM3
         tXJ6hxFo4FPlrmuuCn5dbFR26FdkG0y/PiUzARY1b7BYNFdc1t35lTTfWGHOcEnbKLv9
         By8b2GlGICrDmvhgunMov4KlKzxd3+SGoszCMov3L3U9xY0GEsuk/KfICHkxDu9fO0Dn
         hqyt+RzfuM3VszlA0RFeNhy/D31QFk8gkkqtaWie942PhMMWhu3KGpVJGGrBvXiXiXmd
         pmH8gtLbB339lD7Hgx4S0z06JBFrrv0nL5C0i1YFEU4VqoX48gJU1eJjF7+H7YduoZ4D
         Y4cA==
X-Gm-Message-State: ABy/qLYwBhS5VmWDkPmp61/QQQbi3p6+qRWzkgzKlohjvOYjL4Y3EUrL
        /gLMTubTGMh3RAMGmBla50vduPuem98=
X-Google-Smtp-Source: APBJJlFsmeD1LzX/AtIeCTzzyHRDy8bCa9uILobzUQqiWJfeoMqlj41FYJvGmDZGWf2aevw6KXHX9Q==
X-Received: by 2002:a17:906:64ce:b0:99b:484b:21b4 with SMTP id p14-20020a17090664ce00b0099b484b21b4mr6499480ejn.8.1690964860361;
        Wed, 02 Aug 2023 01:27:40 -0700 (PDT)
Received: from aero-laptop.. (62-73-122-38.ip.btc-net.bg. [62.73.122.38])
        by smtp.gmail.com with ESMTPSA id y26-20020a170906071a00b009737b8d47b6sm8667052ejb.203.2023.08.02.01.27.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:27:39 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.6] Venus updates
Date:   Wed,  2 Aug 2023 11:27:33 +0300
Message-Id: <20230802082733.21862-1-stanimir.k.varbanov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This time the pull request includes following changes:

 - A long patchset from Konrad to start differentiating venus by
VPU (Video Processing Unit) instead of HFI firmware interface
versions - this will allow us to start the support for IRIS1 and
AR50 Lite.

- Few fixes.

Please pull.

regards,
Stan

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/tag-venus-for-v6.6

for you to fetch changes up to 210fefeb11b4bf5d4c5597f126425c2d3fea1aa9:

  media: venus: core: Set up secure memory ranges for SC7180 (2023-08-02 10:39:44 +0300)

----------------------------------------------------------------
Venus updates for v6.6

----------------------------------------------------------------
Konrad Dybcio (18):
      media: venus: hfi_venus: Only consider sys_idle_indicator on V1
      media: venus: hfi_venus: Write to VIDC_CTRL_INIT after unmasking interrupts
      media: venus: Introduce VPU version distinction
      media: venus: Add vpu_version to most SoCs
      media: venus: firmware: Leave a clue about obtaining CP VARs
      media: venus: hfi_venus: Sanitize venus_boot_core() per-VPU-version
      media: venus: core: Assign registers based on VPU version
      media: venus: hfi_venus: Sanitize venus_halt_axi() per-VPU-version
      media: venus: hfi_venus: Sanitize venus_isr() per-VPU-version
      media: venus: hfi_venus: Sanitize venus_cpu_and_video_core_idle() per-VPU-version
      media: venus: hfi_venus: Sanitize venus_cpu_idle_and_pc_ready() per-VPU-version
      media: venus: firmware: Sanitize per-VPU-version
      media: venus: hfi_platform: Check vpu_version instead of device compatible
      media: venus: vdec: Sanitize vdec_set_work_route() per-VPU-version
      media: venus: Introduce accessors for remapped hfi_buffer_reqs members
      media: venus: Use newly-introduced hfi_buffer_requirements accessors
      media: venus: hfi_venus: Restrict writing SCIACMDARG3 to Venus V1/V2
      media: venus: core: Set up secure memory ranges for SC7180

 drivers/media/platform/qcom/venus/core.c           | 11 +++-
 drivers/media/platform/qcom/venus/core.h           | 15 ++++++
 drivers/media/platform/qcom/venus/firmware.c       | 18 +++++--
 drivers/media/platform/qcom/venus/helpers.c        |  7 +--
 drivers/media/platform/qcom/venus/hfi_helper.h     | 61 +++++++++++++++++++---
 drivers/media/platform/qcom/venus/hfi_msgs.c       |  2 +-
 .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   | 22 ++++----
 drivers/media/platform/qcom/venus/hfi_platform.c   |  2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c      | 42 +++++++--------
 drivers/media/platform/qcom/venus/vdec.c           | 10 ++--
 drivers/media/platform/qcom/venus/vdec_ctrls.c     |  2 +-
 drivers/media/platform/qcom/venus/venc.c           |  4 +-
 drivers/media/platform/qcom/venus/venc_ctrls.c     |  2 +-
 13 files changed, 137 insertions(+), 61 deletions(-)
