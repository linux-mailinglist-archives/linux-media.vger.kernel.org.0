Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECE8254329
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 12:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgH0KHX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 06:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726093AbgH0KHX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 06:07:23 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8536C061264
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 03:07:22 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id h15so4769697wrt.12
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 03:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=wlT2BFOiU4VOIUgmLqdFNzwQgkuCk7uvjOoHthBTomI=;
        b=uvZabJIaDUDdTM9a6StRXw2N9gFIKa+X4InPceaHZ9nJDB+U53s1N5kgkDWT0Y5jZA
         tXZnAZLF/5RrFszHopXfJG+J75HX8LZbclC+4EYu+OYrSMMpMOjGi1R2y0rXtrzCSk44
         VspI3g42LeohpGoiLe/oe44XN4A4jESDRBsL6L92K1mX6I2EjZi/RWkD4nNbNvdpbkOI
         5bG16x5bXTvFIVxu0bygPq74mYEPEEdDQlsGkeFNB7qJtdQTw0S64h0MXRWytiLkOMal
         A2iC9Ta1hhmrRg8bE+vwUdmTYxpi54hcAuwYx42/koSThk6DCoQfyFP9JXVI3AzLMobP
         dqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=wlT2BFOiU4VOIUgmLqdFNzwQgkuCk7uvjOoHthBTomI=;
        b=Dem345PDfF4G3a6c54pmLE9dViet+Znr9h1r9xE74stT3AV8MAjCbRjsTuOVd2Az7g
         QD3+Z0dIioKQb1LbjyW+mOJGQXSJbj/46Qx05IMffrWsBsxgUQvQWV07uck2bo2FfQpK
         P8lK+9GIO8vOn7A4dVYaXrKvomtMHwonHwZ6NMt/4E9phc7Z4c4pU3kzVVxVAr72pwoG
         OF5xeBbHM4N+A3t3RnUWQoo0dipufkK+jDjHsrGs8zyAPYy8jjRGwKDkzDIgiQNhd+HO
         UBi/ehRrQfrK/yE2WwHuBPdiLIX1eJI7teHxtT9B9VE0AOkZxTWf56jV8XK4hFRkI/F9
         e38A==
X-Gm-Message-State: AOAM531yxYiJYwL1Yw8z9wWyJy9TfgYTxENc0Nmew1OwLQJpf5EMZIG8
        Y9uDOigBK1wAP6ESXRQIf0etlql9cZnlian8
X-Google-Smtp-Source: ABdhPJxzCb4gtKTZAeBg5uFB085/Lf60BS+TTMK26T6HIXuA6kKeJ/VBk1bqH3EnO1XTjphOoC0gww==
X-Received: by 2002:adf:f011:: with SMTP id j17mr18939762wro.335.1598522838671;
        Thu, 27 Aug 2020 03:07:18 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id z8sm4191560wmf.10.2020.08.27.03.07.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 03:07:18 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for v5.10] Venus updates
Date:   Thu, 27 Aug 2020 13:07:10 +0300
Message-Id: <20200827100710.11967-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Venus driver updates for v5.10 includes:

 * An encoder fix for reported frameintervals for v1.
 * A list coruption fix.
 * Fixes in the recovery mechanism.
 * Add debugfs file to set firmware debug level and grouping of the
   dev_dbg messages in the driver by importance. 
 * Add new encoder Constant quality v4l2 control plus new bitrate mode and
   make the relevant changes in Venus driver.
 * Make private MFC driver Frame skip control a standard v4l2 control and
   make the relevant changes in Venus driver.

Please pull.

regards,
Stan

The following changes since commit d84eca28c807dbcdb40a2b8e2697118b99fdb2fd:

  media: MAINTAINERS: add Dafna Hirschfeld for rkisp1 (2020-08-26 18:52:33 +0200)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.10

for you to fetch changes up to dcdaa912ca2919662c33c6a01a04d779db9d2d09:

  venus: Make debug infrastructure more flexible (2020-08-27 12:48:32 +0300)

----------------------------------------------------------------
Venus updates for v5.10

----------------------------------------------------------------
Loic Poulain (1):
      media: venus: Fix reported frame intervals

Maheshwar Ajja (1):
      media: v4l2-ctrls: Add encoder constant quality control

Stanimir Varbanov (10):
      venus: parser: Prepare parser for multiple invocations
      venus: Rework recovery mechanism
      venus: Add new interface queues reinit
      venus: venc: Add support for constant quality control
      media: v4l2-ctrl: Add frame-skip std encoder control
      venus: venc: Add support for frame-skip mode v4l2 control
      media: s5p-mfc: Use standard frame skip mode control
      media: docs: Deprecate mfc frame skip control
      venus: Add debugfs interface to set firmware log level
      venus: Make debug infrastructure more flexible

Vikash Garodia (1):
      venus: fixes for list corruption

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 53 ++++++++++++++++
 drivers/media/platform/qcom/venus/Makefile         |  2 +-
 drivers/media/platform/qcom/venus/core.c           | 28 +++++----
 drivers/media/platform/qcom/venus/core.h           | 10 +++
 drivers/media/platform/qcom/venus/dbgfs.c          | 21 +++++++
 drivers/media/platform/qcom/venus/dbgfs.h          | 12 ++++
 drivers/media/platform/qcom/venus/helpers.c        |  2 +-
 drivers/media/platform/qcom/venus/hfi.c            |  5 ++
 drivers/media/platform/qcom/venus/hfi.h            |  1 +
 drivers/media/platform/qcom/venus/hfi_cmds.c       | 37 ++++++++++-
 drivers/media/platform/qcom/venus/hfi_helper.h     | 10 ++-
 drivers/media/platform/qcom/venus/hfi_msgs.c       | 18 +++---
 drivers/media/platform/qcom/venus/hfi_parser.c     |  3 +
 drivers/media/platform/qcom/venus/hfi_venus.c      | 72 +++++++++++++++++-----
 drivers/media/platform/qcom/venus/hfi_venus.h      |  1 +
 drivers/media/platform/qcom/venus/pm_helpers.c     |  2 +-
 drivers/media/platform/qcom/venus/vdec.c           | 16 +++--
 drivers/media/platform/qcom/venus/venc.c           | 32 ++++++++--
 drivers/media/platform/qcom/venus/venc_ctrls.c     | 21 ++++++-
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c       |  6 ++
 drivers/media/v4l2-core/v4l2-ctrls.c               | 12 ++++
 include/uapi/linux/v4l2-controls.h                 |  8 +++
 22 files changed, 319 insertions(+), 53 deletions(-)
 create mode 100644 drivers/media/platform/qcom/venus/dbgfs.c
 create mode 100644 drivers/media/platform/qcom/venus/dbgfs.h
