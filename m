Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B08AB5B1D8D
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 14:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbiIHMqi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 08:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231880AbiIHMqg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 08:46:36 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61570A9C3F
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 05:46:34 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id z17so9677805eje.0
        for <linux-media@vger.kernel.org>; Thu, 08 Sep 2022 05:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=bzxVcTKX0owIDp9T/RUQh4jJxBPNf5jdvaRsKNUNotY=;
        b=RGevAPI+BtEU/SdkpaSaY3RF/lWaTG4F8HwxkxlDCLLCmWCDoYMcey5Hm5hSbeY6vt
         FM1BX0ogrJi2rHIl4CNp0qPkY6K6V2BzIxT2UOLU+LQ9yL1/+zqP6T2CT1oYC5maj9KB
         2rT//AJM1dFfc2BUXaMfnIXdTMLeJPFfsT2g4vMyBLeVij7bD8i8kshJA+HeZm+F4hbg
         wU4jDLUL+s6XsGLperuENSpvGBjcdeovs2QR1pmy89eFS3W8EFQaIefJ2yex9T5vuQo5
         Gx8SwRISa8BUTzxuszilxlruTg5waYeGwXAWcU7IKCpiEdQzrRuJi7ooCZHbcaxrXp2O
         jfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=bzxVcTKX0owIDp9T/RUQh4jJxBPNf5jdvaRsKNUNotY=;
        b=SrrdRtDV8n7IxIPFRUXlf3axks6wO6pL4C28tWa4/vBa7KmTfBhEUcdLeuMzESDfPo
         hZ8Sn7DyEEjUcGpDDgGB0enrLr2kGKa8c0rk0j3TrzlJNyx3TUeaNB27NDRkD14FvpGc
         DSioPHGkaE2Qi7QbAUhj1C/B1dNWxOdFUBQAnCaeEV4Ul179bhhqQMg4xMYyOKbIOfLc
         V9wIPnVq/l25YS8dbUkmWKlbYeg/IQklR7cxzYRb+LNPTRFMx6VNNniBD0EyhRenYRiA
         3OdW0V2YJsP+831Fq6wQ0ppEE5uUHGNJQ9Th4c7Kp99Pq10iOKGZ9tAocnbst8pDtRZI
         6iNA==
X-Gm-Message-State: ACgBeo0lkWl/ZyIDL5Ge56EcdH1UrOXWk7Jdo92Ifb/KvjExALHAFVUF
        Thgihz3znWQgTQ2uuhWGw2Y2zxPZ9BSg4w==
X-Google-Smtp-Source: AA6agR56Qf+xcJS1gLy4BmdlYVhsfeqC80oTcDK8OiqRD0bdpcMsNadcoQ9OlnSP10yNLeGbUnxNAA==
X-Received: by 2002:a17:907:1b1a:b0:74a:18f7:7f63 with SMTP id mp26-20020a1709071b1a00b0074a18f77f63mr6211478ejc.28.1662641192311;
        Thu, 08 Sep 2022 05:46:32 -0700 (PDT)
Received: from localhost.localdomain ([84.238.208.206])
        by smtp.gmail.com with ESMTPSA id v6-20020a170906180600b0073c8d4c9f38sm1211526eje.177.2022.09.08.05.46.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 05:46:31 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.1] Venus updates
Date:   Thu,  8 Sep 2022 15:46:25 +0300
Message-Id: <20220908124625.945549-1-stanimir.varbanov@linaro.org>
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

The update includes various fixes related to v4l2 compliance test and
one regression seen on Venus v1.

Please pull.

regards,
Stan

The following changes since commit 61890ccaefaff89f5babd2c8412fd222c3f5fe38:

  media: platform: mtk-mdp3: add MediaTek MDP3 driver (2022-08-30 16:25:51 +0200)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tag-venus-for-v6.1

for you to fetch changes up to 95822f213ac33af4f0b9cfd064ddfce5e3ec1a3e:

  media: venus: hfi: Remove the unneeded result variable (2022-09-08 13:42:50 +0300)

----------------------------------------------------------------
Venus updates for v6.1

----------------------------------------------------------------
Bryan O'Donoghue (2):
      media: venus: dec: Handle the case where find_format fails
      media: venus: Fix NV12 decoder buffer discovery on HFI_VERSION_1XX

Dikshita Agarwal (1):
      venus : Addition of support for VIDIOC_TRY_ENCODER_CMD

Stanimir Varbanov (4):
      venus : Add default values for the control
      venus : CAPTURE Plane width/height alignment with OUT plane.
      venus: venc_ctrls: Add default value for CLL info
      venus: venc: Set HDR10 PQ SEI property only for MAIN10 profile

Vikash Garodia (1):
      venus : Allow MIN/MAX settings for the v4l2 encoder controls defined range.

Viswanath Boma (3):
      venus : Addition of control support - V4L2_CID_MIN_BUFFERS_FOR_OUTPUT
      venus : Addition of EOS Event support for Encoder
      venus : Remove the capture plane settings for venc_g_parm/venc_s_parm

ye xingchen (1):
      media: venus: hfi: Remove the unneeded result variable

 drivers/media/platform/qcom/venus/helpers.c    | 13 +++++----
 drivers/media/platform/qcom/venus/hfi.c        |  5 +---
 drivers/media/platform/qcom/venus/vdec.c       |  2 ++
 drivers/media/platform/qcom/venus/venc.c       | 29 ++++++++++++++------
 drivers/media/platform/qcom/venus/venc_ctrls.c | 38 ++++++++++++++++++++++----
 5 files changed, 64 insertions(+), 23 deletions(-)
