Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 737EB56306F
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 11:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236402AbiGAJlL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Jul 2022 05:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiGAJlK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Jul 2022 05:41:10 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4C95C9EE
        for <linux-media@vger.kernel.org>; Fri,  1 Jul 2022 02:41:09 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id h23so2984855ejj.12
        for <linux-media@vger.kernel.org>; Fri, 01 Jul 2022 02:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bfhnkjN8EYZiKALNnk0S4AvyDtRhk5bZ1VENz1EbQN0=;
        b=RGox5xdyqGFXrCdbw3CeWW/NSsxMi+SzQB5t5l3N/wdMKCPjFxUFCHEw7RRUZQ4jpp
         r68a89T4vEDTe+jksp+Vxzyef8gv3h1i5+SLLmwA8N3GM4SnvFUWCMoK6lGKTa/yHTwz
         fJAoCsTIQK8P8NFdLWw2NbW+jI42P58LDAZqYngOq8/E0E4noRXtX2dDrGsiwWageJ2i
         WADmKrA6JkrVGcmj0HA0wTxaljaojMj2YAaSjt7ghY3wrJyslFRD4eg34NH0a4U6z09s
         NC+uLDQ6O1OZ6aaXwOD3dwn7WxVnA1aVmk9emhAcmbO7BLB1UPlDJfoGV7+St6x1gXxS
         eELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bfhnkjN8EYZiKALNnk0S4AvyDtRhk5bZ1VENz1EbQN0=;
        b=BBGpeze3wuyXNUUXDR97qyWZEWYgPBaVhDpfHGL11KlmweQ5jZTJYhOsStucAkI0i/
         PPfsINZAnj4md1fbCR9WTOVj2FoJfdDP3IJOJM2n1jZGVVXCr6D54rOEGtFFRMegyuPM
         9tmnWXmars1f+3EKC/5wDSG/j0ogsMD9y0wpgUU9tvE8j6KUCgazMB+ZeJbUlc24Aaw5
         04srbFH/1ghfM4cKEWKFoiA5+nAYDMEhh/x3yqJVFPUrAAdSgGELFXJFCZHUkLZ2J7U3
         L7QlbY5x9fwOccf0U4DkGp47CbkXpJ+SAxSk6txeTOiYaAzhvoicbUWawwpLouvTsbmA
         /EiQ==
X-Gm-Message-State: AJIora+aDGbSmKMCc1P11T9VLb/CBQyBMpoo8Bm975ZKRo8EJGt0PeTz
        9qfLBHFg+yvvM/yObPv2LkeDEZD9pc/Td3mj
X-Google-Smtp-Source: AGRyM1su/lsOgxkpxTFhKaZxuNVRmVdhMSKldMIp449vxK8MPbK91toPEIqQwwl/2VEqcDWHukbKqg==
X-Received: by 2002:a17:907:c0a:b0:726:22b1:9734 with SMTP id ga10-20020a1709070c0a00b0072622b19734mr13542260ejc.195.1656668467706;
        Fri, 01 Jul 2022 02:41:07 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id t17-20020a1709067c1100b00711d5baae0esm10317528ejo.145.2022.07.01.02.41.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 02:41:06 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.20] Venus updates
Date:   Fri,  1 Jul 2022 12:40:59 +0300
Message-Id: <20220701094059.82319-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This time the updates include:

 * Trigger Subsystem reset through fault-inject.
 * Correct supported codecs for sc7280.

Please pull.

regards,
Stan

The following changes since commit 945a9a8e448b65bec055d37eba58f711b39f66f0:

  media: pvrusb2: fix memory leak in pvr_probe (2022-06-20 10:30:37 +0100)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.20

for you to fetch changes up to 52a71814f6b71fe99b61fcc67898830ccf26c266:

  media: venus: hfi_platform: Correct supported codecs for sc7280 (2022-06-29 16:11:30 +0300)

----------------------------------------------------------------
Venus updates for v5.20

----------------------------------------------------------------
Dikshita Agarwal (1):
      venus: Add support for SSR trigger using fault injection

Vikash Garodia (1):
      media: venus: hfi_platform: Correct supported codecs for sc7280

 drivers/media/platform/qcom/venus/core.c         | 15 ++++++++++++++-
 drivers/media/platform/qcom/venus/dbgfs.c        |  9 +++++++++
 drivers/media/platform/qcom/venus/dbgfs.h        | 13 +++++++++++++
 drivers/media/platform/qcom/venus/hfi_parser.c   |  6 ++++--
 drivers/media/platform/qcom/venus/hfi_platform.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/venus/hfi_platform.h |  2 ++
 6 files changed, 64 insertions(+), 3 deletions(-)
