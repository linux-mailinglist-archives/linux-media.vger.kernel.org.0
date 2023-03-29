Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 797AC6CF519
	for <lists+linux-media@lfdr.de>; Wed, 29 Mar 2023 23:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbjC2VRY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Mar 2023 17:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjC2VRX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Mar 2023 17:17:23 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E6661708
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 14:17:22 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id eh3so68613771edb.11
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 14:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680124641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=poqoV9DLa63J5k0SYffopawcwmWY2ewpwxbFLEKtvMA=;
        b=MI21zzWNl5FqFiMz+xn8XxDYlrBbi24RQFsVCvEWMjTV1bdtRNhn9dpMJD4AfYjdkq
         7scPv4hpuAfJAxYDP0awnzhCGBTeTYGvp1c2SAVixGf7bKIWz+plHcZvB8fDGAQqVqMF
         d5+l+boDLpr475cPSzj8vLze79MvWJAFiv4DEjJI9JDNb6J0lq55arwFU/DYCadneGjk
         w1b5PJXzGQzFSxEqPbY3o8Ak6/Cnvj1mZ1TE24Pm2Ukm7pEwc9N3BZ56s/Zg8EB8pjtn
         xH+nOjggDZR5xAR9IoRY4Srpufiv8mx0FxIcjsTpr9WytIVv2ukKwCkaBge84vAnaMuB
         Da9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680124641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=poqoV9DLa63J5k0SYffopawcwmWY2ewpwxbFLEKtvMA=;
        b=qqGhlyNMalEtmtQUnWfh6QHmF2puwr1fMphjKkGnxVyeQ83D2Wuq2jcPTrgjYXuuAl
         SAvajPTNwTwpGcELNlaVjJa4omQzf7ZZ72ALfObxImZ8Zn3oyChMq0e2e8J/YHc+KR+/
         Yeil0ztWH34DzDr16dv9CWSUg4galFumWu8AGwMb7dWG3z6SqR6YuwfhLxr/+WPQ0Mw0
         bhluPflxGVvfabv3QBBPlOpNKPLhnuGBmz8I/aqLAgaLg6krfbQEZu6DI+u7VNfCRCvh
         5qVIVueIzvd1lSAuVevzIC/UMWveAfdXgNuw2f7GiPTvpYGESuYQ5K8EzvmYESRiO+ln
         RS4w==
X-Gm-Message-State: AAQBX9dveHf9PxnbTgQuN/srLVuatUkzdYFBEGUnyZHXCz7kn2y01lCy
        KfKa7CvrfB4QXYQpjtDarob4KVHxH0Q=
X-Google-Smtp-Source: AKy350Yttf2skMmviko3u/UyaLDZIrL8KIz19Paio6qtxqXMDbKs8wcnhMxrItzvIb7ec02EqBp0kQ==
X-Received: by 2002:a17:907:1819:b0:931:dcd4:4ff0 with SMTP id lg25-20020a170907181900b00931dcd44ff0mr24734315ejc.75.1680124640969;
        Wed, 29 Mar 2023 14:17:20 -0700 (PDT)
Received: from aero-laptop.. (hst-221-24.medicom.bg. [84.238.221.24])
        by smtp.gmail.com with ESMTPSA id n18-20020a170906379200b0093237bd4bc3sm16399361ejc.116.2023.03.29.14.17.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 14:17:20 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.4] Venus updates
Date:   Thu, 30 Mar 2023 00:16:55 +0300
Message-Id: <20230329211655.100276-1-stanimir.k.varbanov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This time Venus updates includes:

 - A fix for capture format enumeration.
 - A fix for handling decoder start cmd.
 - A fix for H265 decoder failure.
 - Adds encoder commands support.
 - DT-binding re-organizations.
 - Adds support for QP range for HFI versions 4xx and 6xx.

Please pull.

regards,
Stan

The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/tag-venus-for-v6.4

for you to fetch changes up to dfc416974aab7cc1c3f5b4a2b607badac27e9cf8:

  venus: Add support for min/max qp range. (2023-03-29 23:58:01 +0300)

----------------------------------------------------------------
Venus updates for v6.4

----------------------------------------------------------------
Dikshita Agarwal (1):
      venus: venc: add handling for VIDIOC_ENCODER_CMD

Javier Martinez Canillas (1):
      media: venus: dec: Fix capture formats enumeration order

Krzysztof Kozlowski (9):
      media: venus: drop unused opp_table field documentation
      media: dt-bindings: qcom,venus: cleanup
      media: dt-bindings: qcom,venus: split common properties
      media: dt-bindings: qcom,msm8996-venus: document interconnects
      media: dt-bindings: qcom,sc7180-venus: document OPP table
      media: dt-bindings: qcom,sc7280-venus: document OPP table
      media: dt-bindings: qcom,sdm845-venus-v2: document OPP table
      media: dt-bindings: qcom,sm8250-venus: document OPP table
      media: dt-bindings: qcom,venus: document firmware-name

Michał Krawczyk (1):
      media: venus: dec: Fix handling of the start cmd

Viswanath Boma (2):
      venus: Fix for H265 decoding failure.
      venus: Add support for min/max qp range.

 .../bindings/media/qcom,msm8916-venus.yaml         |  86 ++++--------
 .../bindings/media/qcom,msm8996-venus.yaml         | 146 +++++++++------------
 .../bindings/media/qcom,sc7180-venus.yaml          |  97 ++++++--------
 .../bindings/media/qcom,sc7280-venus.yaml          | 132 ++++++++-----------
 .../bindings/media/qcom,sdm660-venus.yaml          | 144 ++++++++------------
 .../bindings/media/qcom,sdm845-venus-v2.yaml       | 108 ++++++---------
 .../bindings/media/qcom,sdm845-venus.yaml          | 104 ++++++---------
 .../bindings/media/qcom,sm8250-venus.yaml          | 122 +++++++----------
 .../bindings/media/qcom,venus-common.yaml          |  73 +++++++++++
 drivers/media/platform/qcom/venus/core.h           |  10 +-
 drivers/media/platform/qcom/venus/hfi_cmds.c       |  23 ++++
 drivers/media/platform/qcom/venus/hfi_helper.h     |  18 +++
 .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   |   4 +-
 drivers/media/platform/qcom/venus/vdec.c           |  16 ++-
 drivers/media/platform/qcom/venus/venc.c           | 107 +++++++++++++--
 15 files changed, 607 insertions(+), 583 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,venus-common.yaml
