Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48B3A34D461
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 17:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhC2P6q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 11:58:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbhC2P6l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 11:58:41 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68BEBC061574
        for <linux-media@vger.kernel.org>; Mon, 29 Mar 2021 08:58:41 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id bx7so14770397edb.12
        for <linux-media@vger.kernel.org>; Mon, 29 Mar 2021 08:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lwrzxjA3pEGMjrl8cvG/l5syKLLdr/2YCRPKZGAhoiA=;
        b=eWRvudYUE7D1Uu9F7+tKeCL67izIzUhhoxl1Ua1Aqeqgxle1ESp4rWy5AfkrfIJvIT
         bqMLO8uskENcCzkcrNLSGtoc2RAJqApeharRUVpZpSxToqCsq892FcIeA2OG5AtK7e9k
         GNftuq6vISsa6uV7tLkjptwyfyN9OLriQLjlt0eFX8+Urs96OWim9+zxdsehNokjcO9I
         jcnOGE2nStVbe4h4CmbrTjb2Zm5Qx88EEVbb/oanRkhDnL0oI2wmzfA3GkLfOn12qUmG
         dxOJSn+w54BqtlAlOfvnoyT3A04trSbnXN0mWn0go/uGAnumbxB0EyokEj4o/pBBLAHj
         1/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lwrzxjA3pEGMjrl8cvG/l5syKLLdr/2YCRPKZGAhoiA=;
        b=lqGOUfCzOultnT7x8dLkgZGh2MEjndy8G34jYiWn8LfvRVgDhiO4zCoRH8JH1FLR1f
         yYkjbl4MkXAjJJUVTbYEH/oyc5z0QXsFk4UgPC7PtFB7jyFgxBs1kGYOukDKBXiq4r+X
         psJ5qphnpP92E9Mor81xt5eqEeA/7Iz1kOkG9/h9tKAWVBcqZDbJecy1vXSwDMKtKeOz
         dPXQ7hx47M6K0457HTj20SBaV9NmASyLj5Opkrcu5HRAtJNcB8ZOzCnAxwwBacHTUEFG
         PoxK6LU3CDVUzk35UoVJJE3tI/2ospKvSMyjDUWrBVrOJ56gt1duRmIWIcWhtyuKLL5I
         QGQQ==
X-Gm-Message-State: AOAM533lFnvquoKnmNZpII6b68z+FWrqCmVkfZAtc/nPXvV/OkVLT/CB
        Qvnpa8QdiG+fhLEfgZ7AsduZ+UNq0Oi1Bg==
X-Google-Smtp-Source: ABdhPJyki3IWz2W786iqs5gROqwopxuQW7qWkc0OHX0IlQtC1GNW3t65h3Yigv3Sw+vaSAXQ+7NSgg==
X-Received: by 2002:aa7:d385:: with SMTP id x5mr29495028edq.289.1617033520016;
        Mon, 29 Mar 2021 08:58:40 -0700 (PDT)
Received: from localhost.localdomain ([84.238.208.210])
        by smtp.gmail.com with ESMTPSA id gn3sm8356174ejc.2.2021.03.29.08.58.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 08:58:39 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.13] Venus updates - part2
Date:   Mon, 29 Mar 2021 18:58:34 +0300
Message-Id: <20210329155834.1428138-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Venus updates and new controls for v5.13:

  * Fix for previous pull request for v5.13
  * Various fixes for Venus v1
  * New encoder LTR controls and implementation
  * New decoder control to set conceal color
  * New colorimetry control class and HDR10 compound controls
 
regards,
Stan

The following changes since commit 97b34809ec240d82c82af97626c2071a4062e0e6:

  media: staging: atomisp: reduce kernel stack usage (2021-03-23 16:55:52 +0100)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.13-part2

for you to fetch changes up to bb4243fcb52014a2fff2f125ddc2622271a32fc7:

  venus: venc: Add support for CLL and Mastering display controls (2021-03-29 18:18:41 +0300)

----------------------------------------------------------------
Venus updates for v5.13-part2

----------------------------------------------------------------
Dikshita Agarwal (2):
      media: v4l2-ctrl: add controls for long term reference.
      venus: venc: Add support for Long Term Reference (LTR) controls

Stanimir Varbanov (13):
      venus: core: Drop second v4l2 device unregister
      venus: hfi_parser: Don't initialize parser on v1
      venus: hfi_parser: Check for instance after hfi platform get
      venus: pm_helpers: Set opp clock name for v1
      venus: venc_ctrls: Change default header mode
      venus: hfi_cmds: Support plane-actual-info property from v1
      v4l2-ctrl: Add decoder conceal color control
      venus: vdec: Add support for conceal control
      v4l: Add new Colorimetry Class
      docs: Document colorimetry class
      v4l: Add HDR10 static metadata controls
      docs: Document CLL and Mastering display colorimetry controls
      venus: venc: Add support for CLL and Mastering display controls

 Documentation/userspace-api/media/v4l/common.rst   |  1 +
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 51 +++++++++++
 .../media/v4l/ext-ctrls-colorimetry.rst            | 93 ++++++++++++++++++++
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst | 12 +++
 .../userspace-api/media/videodev2.h.rst.exceptions |  2 +
 drivers/media/platform/qcom/venus/core.c           |  2 -
 drivers/media/platform/qcom/venus/core.h           |  4 +
 drivers/media/platform/qcom/venus/hfi_cmds.c       | 44 +++++++---
 drivers/media/platform/qcom/venus/hfi_helper.h     | 30 +++++++
 drivers/media/platform/qcom/venus/hfi_parser.c     | 12 +--
 drivers/media/platform/qcom/venus/pm_helpers.c     | 19 ++++-
 drivers/media/platform/qcom/venus/vdec.c           | 11 ++-
 drivers/media/platform/qcom/venus/vdec_ctrls.c     |  9 +-
 drivers/media/platform/qcom/venus/venc.c           | 38 +++++++++
 drivers/media/platform/qcom/venus/venc_ctrls.c     | 64 +++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls.c               | 98 +++++++++++++++++++++-
 include/media/v4l2-ctrls.h                         |  4 +
 include/uapi/linux/v4l2-controls.h                 | 39 +++++++++
 include/uapi/linux/videodev2.h                     |  3 +
 19 files changed, 512 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
