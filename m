Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10C73DA451
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 15:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238115AbhG2NaM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 09:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237849AbhG2N3N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 09:29:13 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A101EC0613D3
        for <linux-media@vger.kernel.org>; Thu, 29 Jul 2021 06:29:09 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id h24-20020a1ccc180000b029022e0571d1a0so4046268wmb.5
        for <linux-media@vger.kernel.org>; Thu, 29 Jul 2021 06:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aHj6egrf+dvUFb8SGDQsPfGCwm+B2h/dnp7lsrxcZQE=;
        b=k4KhjI3Yep2biAqm8ydx0PRBytl0AbsaL7TwaU79uOcCzMyav9VSuwZjJHBVJoo1Uc
         Byr55yYCbbAqOKKhYDBsanBtpbrRYnNdPfZx04Yci2SULzJpbf6pMmrsYFvkfUBcEDnv
         pkidH7je6ZYd0GxpEXFKvz6CpjJhKidA/IcJ+gpISBFTuMib0j3f41qs8wX6w/hhTCx1
         TVY+wkArt7K5ViptYJpjJJFV975+f8M5pSZXINHyJ9AqQf/zNW5B2RS/P6FHbxadldtG
         PSxLhII9tTlJqmh8IVWrI+tCDbp1bIcgkU6GiAi9++lXb1YGU4tObCqMfKRZNZa7OZ0s
         7nSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aHj6egrf+dvUFb8SGDQsPfGCwm+B2h/dnp7lsrxcZQE=;
        b=l1mOpAX4moQtdRSGy789qMJwN4aC6Bqzs++nb9FB/Q4KcUhZIN3UWD/YdKTEaBvNGJ
         Vh/KZFokzauXIpMZwGFtGZixWjlm0fjuHmGSM7twPpngxsMglg+mP3u3co+V1R2yoZJ7
         g1LdGkZMSKZfX+3EbofRkQvuf8nZW/zGZeGm9ieGHivbUagtRVSFyrQKnG4gABgPhF8h
         5+8r7MSwWgMwBAFLZT43JQuIkUOBg5btBzF7u3PMJ4g3Lei5Pdq7DthHuxEE7xQbeoIL
         sSx90bp4Z6Vb/BbI/4a1rBxsGn1g/RIUMDPaxn9U2CP9wbfeqDPKTBYb5+JKPO8vBAws
         IOuA==
X-Gm-Message-State: AOAM5312lHowA6qH5MGZenQCuK+sPIYT1u3XbbdhkntlQB9IGn0BbXVK
        9lMz+VMIeZbazyOjE4HnaNkskwKEhHMvvQ==
X-Google-Smtp-Source: ABdhPJxrExc3V8EYHjmlku7K2OIMcmpK+ergclGbTP4ct5YpZXQuT6RovJf/SQwnUA+hdVigPwTkHQ==
X-Received: by 2002:a05:600c:1986:: with SMTP id t6mr3151426wmq.80.1627565347963;
        Thu, 29 Jul 2021 06:29:07 -0700 (PDT)
Received: from localhost.localdomain ([109.120.209.55])
        by smtp.gmail.com with ESMTPSA id s9sm3489928wra.80.2021.07.29.06.29.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 06:29:07 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.15] Venus updates
Date:   Thu, 29 Jul 2021 16:28:54 +0300
Message-Id: <20210729132854.136809-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The update includes:
  * Add intra-refresh period encoder standard control.
  * Add h264 8x8 transform control in Venus driver.
  * Few fixes.

Please pull.

regards,
Stan

The following changes since commit c27479d762de4eda72ba9e0aa150d439970f2077:

  media: atomisp: pci: reposition braces as per coding style (2021-07-22 14:01:57 +0200)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.15

for you to fetch changes up to 7c526859a0789f96ff0cd8792356e24aeda948ce:

  venus: venc: add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control (2021-07-29 16:19:51 +0300)

----------------------------------------------------------------
Venus updates for v5.15

----------------------------------------------------------------
Colin Ian King (1):
      media: venus: venc: Fix potential null pointer dereference on pointer fmt

Mansur Alisha Shaik (2):
      venus: helper: do not set constrained parameters for UBWC
      venus: venc: add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control

Stanimir Varbanov (3):
      docs: ext-ctrls-codec: Document cyclic intra-refresh zero control value
      media: v4l2-ctrls: Add intra-refresh period control
      venus: venc: Add support for intra-refresh period

Zhen Lei (1):
      media: venus: hfi: fix return value check in sys_get_prop_image_version()

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 19 +++++++++-
 drivers/media/platform/qcom/venus/core.h           |  2 ++
 drivers/media/platform/qcom/venus/helpers.c        |  3 ++
 drivers/media/platform/qcom/venus/hfi_cmds.c       |  8 +++++
 drivers/media/platform/qcom/venus/hfi_helper.h     |  5 +++
 drivers/media/platform/qcom/venus/hfi_msgs.c       |  2 +-
 drivers/media/platform/qcom/venus/venc.c           | 40 ++++++++++++++++++++++
 drivers/media/platform/qcom/venus/venc_ctrls.c     | 38 +++++++++++++++-----
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  2 ++
 include/uapi/linux/v4l2-controls.h                 |  1 +
 10 files changed, 110 insertions(+), 10 deletions(-)
