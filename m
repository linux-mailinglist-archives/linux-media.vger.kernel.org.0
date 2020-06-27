Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB3220C0A6
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2020 12:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgF0KQC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Jun 2020 06:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726356AbgF0KQC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Jun 2020 06:16:02 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04EA4C03E979
        for <linux-media@vger.kernel.org>; Sat, 27 Jun 2020 03:16:02 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id a8so7580632edy.1
        for <linux-media@vger.kernel.org>; Sat, 27 Jun 2020 03:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=lDanYebc0yOPEVLAR8y9fCJSE3bTcvO7TrfJIfKWQiQ=;
        b=wdEhx2A6Pb4cofIHRTDB0RC8+j534nxbA7EVU77iC1v0lNJpfbADFFJZxdlF9iEWGx
         Nt89ZDXpHbZdMTN+amYdWGy24HivCQ2Wsk8NnTM+KmGr11aPMkqA/4qKJQaySdzW72fj
         1qC5GVj/cqx6jrhx2lhrOU1BNX96xEmX5TYH/zT3RvMBV2SUcEfYy9jI4x+xhVTvhpXo
         hRdqgcfiGFmATyO1/bUvbsexz3JCFsV0l67/HBUnOrNi4yLYW4HyKextD6dP/RmPLNlZ
         tZtI75Qis3TuivIwpehAVT1v8PIuqVlrye0STuGmiLbW1R228knxbYsqwt73R4n+28jL
         qS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=lDanYebc0yOPEVLAR8y9fCJSE3bTcvO7TrfJIfKWQiQ=;
        b=JbJmpsKJLNsuyTFZbbRiyPPkpACBPHKp4Y66/FA/w69BGFGv7UN3Y8/MVnPEy+tvVO
         oZ+sVkFsBWPxHDyu0USpfU+kOqr2iqzyrSAcFbd0C7D6VEShulkRiLW9YI8IkKcxPkAW
         muZ4hUvjEGnMg3GbyGCfmOmMAKbgfUAHGlPiGcXPC0BU8BLzL0nQX0BXf6KAONvqwe9d
         a8WKbHeLK7OgCvu6zpvNemalzVqAbF07AleERTohfNEA7mFz1SgdEmGr4FzQuQguSUti
         aBiLCH8NYthdH04bYLjfQ3hYI5oGELKpFhCyIWwOG6T2DN/6MZa5CthRRiaOdZBGKwe1
         VORA==
X-Gm-Message-State: AOAM5301t5hWhwk4Mb218G+Srq7/LlYo6OE6OLBW7E9ZfAOAoUXSgFfl
        FdFSRQrw/XPM7775deKYzH6X4KmpeDMpDA==
X-Google-Smtp-Source: ABdhPJyXLNyCr5kUYpkrki1Lbt2zVdexCt5Q4nGtDbl6VDvY4xk2YwqdK/h/bW6q98VqFT2aB02qnw==
X-Received: by 2002:a05:6402:319b:: with SMTP id di27mr7939492edb.133.1593252960551;
        Sat, 27 Jun 2020 03:16:00 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-36.ip.btc-net.bg. [212.5.158.36])
        by smtp.gmail.com with ESMTPSA id bo18sm9758244ejb.14.2020.06.27.03.15.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2020 03:16:00 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for v5.9] Venus updates
Date:   Sat, 27 Jun 2020 13:15:37 +0300
Message-Id: <20200627101537.14704-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Venus driver updates for v5.9 includes:

 * A fix for multiple encoders
 * A fix for encoder pm_runtime imbalance in error path

Please pull.

regards,
Stan

The following changes since commit e30cc79cc80fd919b697a15c5000d9f57487de8e:

  media: media-request: Fix crash if memory allocation fails (2020-06-23 15:19:37 +0200)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-tag-for-v5.9

for you to fetch changes up to b5b7e04c25debbb3ed976e158d39844037238610:

  media: venus: venc: Fix runtime PM imbalance in venc_open (2020-06-27 13:03:15 +0300)

----------------------------------------------------------------
Venus updates for v5.9

----------------------------------------------------------------
Dinghao Liu (1):
      media: venus: venc: Fix runtime PM imbalance in venc_open

Mansur Alisha Shaik (1):
      venus: fix multiple encoder crash

 drivers/media/platform/qcom/venus/pm_helpers.c | 4 ++++
 drivers/media/platform/qcom/venus/venc.c       | 3 +--
 2 files changed, 5 insertions(+), 2 deletions(-)
