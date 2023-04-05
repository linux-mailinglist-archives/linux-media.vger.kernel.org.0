Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1A66D8A35
	for <lists+linux-media@lfdr.de>; Thu,  6 Apr 2023 00:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbjDEWBB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Apr 2023 18:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjDEWBA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Apr 2023 18:01:00 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68DDB76AE
        for <linux-media@vger.kernel.org>; Wed,  5 Apr 2023 15:00:59 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id r11so37589782wrr.12
        for <linux-media@vger.kernel.org>; Wed, 05 Apr 2023 15:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680732058; x=1683324058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/i+LcbbWpppF7guNitk2xP/me4zUXkwEvVEGYX1QYxY=;
        b=qa5y5ELMJ1WPrCf+fGxlE/fhAvU65vRbTsQGLBO7Z2MNaWJijdFEH9q2aFb6T9T66F
         NXtX9dCIzHHDaFYI3N3ptoBX+4cke3klfRTgtI6mCeI/GIOHa+1MxhL/+HZ+Ae+RsITw
         gyf7R1I21k+pYU0xVLUFN1PT+sstI5Os52ggxQX2x+fiUneckYuKNJxkvN5GAlmb7ZWQ
         xb3WybGRE2Dkx1EKfnaRgyjhre0w4GdF4B054oo3HGEnse6f6fxJaDtUriDxqcclOMBa
         R6OFnTwLZTznvzH90WtPQ2wuTbotuN6acor39tJqi9EV6zAgw/2Ad1SvIJIdC+qkCvF6
         kFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680732058; x=1683324058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/i+LcbbWpppF7guNitk2xP/me4zUXkwEvVEGYX1QYxY=;
        b=phXMrWhqwIXtm/QOfIGM2RAFANmPmcUuqHnWtOL+eCmzQGkJNbUC+JCtQgeerq7i56
         C0fZCJ3gfzTbO3T/RZm+Aci451tfrmKJBraboVvi+EWGvmB4+U6s7w/9+bcV4rXnomVG
         ix/cjBJkVJwPeY+c6c+T6K/HzmS6qDstSD3WMwm9ypMOoiieUqqBZFP8usA8mJD0re1L
         t/L6JRryYDk6iGnRIPqFkrAWSx1rVUbDjUpbaD3LpIDB9t4Xw+yEDPdAm/sJpSKIwxCX
         G2mZVzBNf4lmuurVTxQxEnUA03uNCUC9Hgmn2b/hDEAI3B41dsrK40DtirVYWODwvQmd
         aHGw==
X-Gm-Message-State: AAQBX9cCyKENS63kRxL8j3yVpQc1FpMuXE/XwbJEyDM5J8n6XFPlzADI
        r42yL3Dnq425QO2aQSY5BmbgHOwvilw=
X-Google-Smtp-Source: AKy350Z0elpU/gOKOtddmkKjwsRA4bod3l3O4FfnJ8TseEy9ZgOt+uwQ3GApu15Y19YsTOUJaNQS/Q==
X-Received: by 2002:adf:f6cb:0:b0:2cf:ec49:958b with SMTP id y11-20020adff6cb000000b002cfec49958bmr4438009wrp.12.1680732057778;
        Wed, 05 Apr 2023 15:00:57 -0700 (PDT)
Received: from aero-laptop.. (hst-221-70.medicom.bg. [84.238.221.70])
        by smtp.gmail.com with ESMTPSA id y13-20020adff14d000000b002c55306f6edsm16011761wro.54.2023.04.05.15.00.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 15:00:57 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.4 v3] Venus updates
Date:   Thu,  6 Apr 2023 01:00:47 +0300
Message-Id: <20230405220047.305248-1-stanimir.k.varbanov@gmail.com>
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
 - Adds support for QP range for HFI versions 4xx and 6xx.
 - Correct P010 buffer alignment.

Please pull.

regards,
Stan

Chnages since v2:
 Fixed error/warn in patches/0003-venus-venc-add-handling-for-VIDIOC_ENCODER_CMD.patch,
 and add one more ready to merge patch which corrects P010 buffer alignment.
  
Changes since v1:
 In this v2 pull request the DT-binding re-organizations and cleanup
 patchset from Krzysztof has been dropped, it is already part of
 Sakari's dt-binding pull request.


The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/tag-venus-for-v6.4-v3

for you to fetch changes up to 683710ec363d4e7499d3fb61ca160ff8aada45f1:

  media: venus: Correct P010 buffer alignment (2023-04-05 19:48:27 +0300)

----------------------------------------------------------------
Venus updates for v6.4 v3

----------------------------------------------------------------
Dikshita Agarwal (1):
      venus: venc: add handling for VIDIOC_ENCODER_CMD

Fritz Koenig (1):
      media: venus: Correct P010 buffer alignment

Javier Martinez Canillas (1):
      media: venus: dec: Fix capture formats enumeration order

Krzysztof Kozlowski (1):
      media: venus: drop unused opp_table field documentation

Michał Krawczyk (1):
      media: venus: dec: Fix handling of the start cmd

Viswanath Boma (2):
      venus: Fix for H265 decoding failure.
      venus: Add support for min/max qp range.

 drivers/media/platform/qcom/venus/core.h           |  10 +-
 drivers/media/platform/qcom/venus/helpers.c        |   4 +-
 drivers/media/platform/qcom/venus/hfi_cmds.c       |  23 +++++
 drivers/media/platform/qcom/venus/hfi_helper.h     |  18 ++++
 .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   |   4 +-
 drivers/media/platform/qcom/venus/vdec.c           |  23 ++++-
 drivers/media/platform/qcom/venus/venc.c           | 109 +++++++++++++++++++--
 7 files changed, 173 insertions(+), 18 deletions(-)
