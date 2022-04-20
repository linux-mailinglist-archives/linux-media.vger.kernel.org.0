Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDD4508C67
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 17:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380309AbiDTPvS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 11:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349122AbiDTPvP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 11:51:15 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121FE403E0
        for <linux-media@vger.kernel.org>; Wed, 20 Apr 2022 08:48:29 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id g18so4379757ejc.10
        for <linux-media@vger.kernel.org>; Wed, 20 Apr 2022 08:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EDaBjgoWxFTWirrlbcYbeEIQIWNFwqY0LoRi2+oih64=;
        b=UhwepQj7kYXuJ+AHwbtkVuefu7olyuv+7vtIiJHg47s7dlQ+f5NrNVKMCjCdS2EZ8g
         o+NpaT6SNbgH9KeO0+M3lD8qmTvjnDV+sn/URh57CrANMgPnqRSFJahk1xFnP17LAby9
         NiIGpvJ3kOgZTQ9tol+1EQ6/Jyw4ETc7VvkUOMMeVtMjl75qQXD1GcGqXlMy3wskaNz/
         N8RQXMVLRxPws9Yqg3ihbRbLs0tGBMTbSfQR1t7UVnVl04gyLMdqD/iGzObWHOvmgo1y
         hD18jfxdQCDh5q5Qa1JuzQcggaNKKztGtbMR0q1o19nuJ1h1Oh5zB1vWzPMTYytTPdJF
         7dMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EDaBjgoWxFTWirrlbcYbeEIQIWNFwqY0LoRi2+oih64=;
        b=kBaBt1e3tP34fGf0ZezVUZOCNmvphKJrqa5LCtFMWd9sic0ICPbmEwO+rLzVk6IAX6
         F1soEoXWruStAtanwP5ZEFQp8GpM6MBm7EuWEmrS3MKm957DIm1dN9c0T7ZWXa+6NECU
         7IWe0A3HVzjavcn1rWHxQAVMR5q69buw2eujCmLuwtnllw/lNMrGOCEh0XqZXFUfXF6U
         ADQKKBaxLwiQi+kIpP7TNhO3O8cA5DGFsYkfymDrgSVPaU+OhMVZbZiVasLx0XHC4KOz
         pDQdh/B9rGaadRg+utj6hbzGOjrr5EjfhrRvC9Qq2+7vp0gtL6KMoslf7jCdnHZvmMQm
         QbWw==
X-Gm-Message-State: AOAM533W3zD2Sq6vXfwKGwyiMXEpTqxcyqq6bn7BizVRc6gLMZLQh+mI
        8gcdyz1OndQl9jThuV7UeERFUuxSBY+Rwp2M
X-Google-Smtp-Source: ABdhPJyPU5Yzwpgtg+mu9vYMLTSg2N0cZwhvl+qRVgIe1N9jSzsCQYDvOFwbYmJkIqwhJI1+VX8k3A==
X-Received: by 2002:a17:907:6d94:b0:6e8:c309:9923 with SMTP id sb20-20020a1709076d9400b006e8c3099923mr18710414ejc.101.1650469707350;
        Wed, 20 Apr 2022 08:48:27 -0700 (PDT)
Received: from localhost.localdomain (hst-221-97.medicom.bg. [84.238.221.97])
        by smtp.gmail.com with ESMTPSA id g11-20020a1709061e0b00b006eff90d9c18sm970685ejj.92.2022.04.20.08.48.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 08:48:26 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.19] Venus updates
Date:   Wed, 20 Apr 2022 18:48:14 +0300
Message-Id: <20220420154814.146560-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This time the updates include.

 * Adds new QCOM compressed custom pixel formats and related changes
   in v4l2 and Venus driver.
 * Adds intra-refresh type v4l2 control and support in Venus driver.
 * Few fixes.

Please pull.

regards,
Stan

The following changes since commit 3d59142ad94cf60b94b3dc94c19fdafa23aec8b1:

  media: dvb-usb: dib0700_devices: use an enum for the device number (2022-04-18 07:36:44 +0200)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.19

for you to fetch changes up to d7a7d26cde9ab49cb2265ca74f5372acedad8565:

  venus: venc: Add support for intra-refresh type (2022-04-20 17:58:00 +0300)

----------------------------------------------------------------
Venus updates for v5.19

----------------------------------------------------------------
Dikshita Agarwal (2):
      media: v4l2-ctrls: Add intra-refresh type control
      venus: venc: Add support for intra-refresh type

Luca Weiss (2):
      media: venus: hfi: Add error message for timeout error
      media: venus: hfi: avoid null dereference in deinit

Stanimir Varbanov (6):
      v4l: Add Qualcomm custom compressed pixel formats
      venus: helpers: Add helper to check supported pixel formats
      venus: Add a handling of QC08C compressed format
      venus: hfi_platform: Correct supported compressed format
      venus: Add a handling of QC10C compressed format
      venus: vdec: Use output resolution on reconfigure

Vikash Garodia (2):
      media: venus: do not queue internal buffers from previous sequence
      media: venus: vdec: ensure venus is powered on during stream off

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 22 ++++++
 .../userspace-api/media/v4l/pixfmt-reserved.rst    | 19 +++++
 drivers/media/platform/qcom/venus/core.h           |  1 +
 drivers/media/platform/qcom/venus/helpers.c        | 85 ++++++++++++++--------
 drivers/media/platform/qcom/venus/helpers.h        |  1 +
 drivers/media/platform/qcom/venus/hfi.c            |  3 +
 .../media/platform/qcom/venus/hfi_platform_v4.c    |  4 +-
 .../media/platform/qcom/venus/hfi_platform_v6.c    |  4 +-
 drivers/media/platform/qcom/venus/hfi_venus.c      |  4 +-
 drivers/media/platform/qcom/venus/vdec.c           | 37 ++++++++--
 drivers/media/platform/qcom/venus/venc.c           |  6 +-
 drivers/media/platform/qcom/venus/venc_ctrls.c     |  8 ++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  9 +++
 drivers/media/v4l2-core/v4l2-ioctl.c               |  2 +
 include/uapi/linux/v4l2-controls.h                 |  5 ++
 include/uapi/linux/videodev2.h                     |  2 +
 16 files changed, 170 insertions(+), 42 deletions(-)
