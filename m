Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51F024B9FF1
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 13:19:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240338AbiBQMTh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 07:19:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbiBQMTg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 07:19:36 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 093462AA3AF
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 04:19:22 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id c6so6559037edk.12
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 04:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ts2GyXXrq57TcHLX1kWxj3I3Xc3p4Y8E74Sxp9Klwj0=;
        b=jI5JAmDz/A/8/Aqs1xRzEL9p4UgW4i4Vj3rw2cOJLpyGzGEX5QZXCdmqagzGcwmoi9
         6WafIceJrtqkEBSStJdOqR4o6F6o0h6uJ78WplzK6nc3ejnq8lsSY2PKcq9LB5ZuFd+W
         Zvu3AHzRrDJUpIacUiJ2EJft8uIXf1O0j8Z0pHVvzQ2cSo/U+hzZ9oZnetsgtClW4f21
         Vl/XKSIp67r+Ton5Q7707tasDqDO/xZv3f2f17rNTnmOpgKe+iQXsvA4mNDX+LsZpqnq
         /9rTsNA+CylEJgazWb8r7+AYCmhb1yPAkRVyOOAauJf8SOjfYb7Zaf3asrLuiNDAeCZL
         yP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ts2GyXXrq57TcHLX1kWxj3I3Xc3p4Y8E74Sxp9Klwj0=;
        b=Ze6uQYnHNHoLGkp8nq5UoVnLwMeJOumBRJ6+YrhaqOTDKzd6y4M9y03gu4zChti20F
         4oFDp/wvpWjXU7EL1nB9YnHK8iPT/CmBsiqPouG8FULtS/6Wt2bTZQ6tDs7Qe7iZKu6S
         wVZlGhIwicRNtVoTg4jkQRPysZwMpvUk8qZHv/iD5yOHnxsF+A5dUq/or6I9LS9wM1zR
         6N7iA01uGlXYVPXqmEFpH90cqeEULY4x5nZ5yNVwiQV0mADsg7vsg9HAX1UM/FjP1STj
         Lf54SAY9XQJCle+cyj1MfY/djCix1s11vrbC7JtmdxHh536EvgCW+hiIugQ8lbnJ9t3c
         fT+A==
X-Gm-Message-State: AOAM530lvl1aNh47+0IEhKFf0RwOdAqW8NGfi8pa6GW9sBfnDSxnTqI5
        6fr5XGAM1m/e9qmJoWuZpFR0cVoVtADOug==
X-Google-Smtp-Source: ABdhPJyLZ1BvxdUYCAfCil0K+lrcQ2+ip9pnhIY96VvD+tvZV9/zlYokTGfVoneChVKQkXNp1YDjUg==
X-Received: by 2002:a05:6402:5242:b0:40f:6a4f:ff33 with SMTP id t2-20020a056402524200b0040f6a4fff33mr2337028edd.30.1645100360161;
        Thu, 17 Feb 2022 04:19:20 -0800 (PST)
Received: from localhost.localdomain (hst-221-51.medicom.bg. [84.238.221.51])
        by smtp.gmail.com with ESMTPSA id q19sm1123155ejm.74.2022.02.17.04.19.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 04:19:19 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.18] Venus updates
Date:   Thu, 17 Feb 2022 14:19:13 +0200
Message-Id: <20220217121913.1556254-1-stanimir.varbanov@linaro.org>
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

This time the updates include few fixes.

Please pull.

regards,
Stan

The following changes since commit 127efdbc51fe6064336c0452ce9c910b3e107cf0:

  media: atomisp: fix dummy_ptr check to avoid duplicate active_bo (2022-02-08 07:31:33 +0100)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.18

for you to fetch changes up to c4ddd4d953274c4009dc076efcdbb1f4f1517169:

  venus: hfi_cmds: List HDR10 property as unsupported for v1 and v3 (2022-02-17 14:12:05 +0200)

----------------------------------------------------------------
Venus updates for v5.18

----------------------------------------------------------------
Ameer Hamza (1):
      media: venus: vdec: fixed possible memory leak issue

Stanimir Varbanov (3):
      venus: core: Fix kerneldoc warnings
      venus: venc: Fix h264 8x8 transform control
      venus: hfi_cmds: List HDR10 property as unsupported for v1 and v3

 drivers/media/platform/qcom/venus/core.h       | 4 ++++
 drivers/media/platform/qcom/venus/helpers.c    | 2 +-
 drivers/media/platform/qcom/venus/hfi_cmds.c   | 2 ++
 drivers/media/platform/qcom/venus/venc.c       | 4 ++--
 drivers/media/platform/qcom/venus/venc_ctrls.c | 6 +++---
 5 files changed, 12 insertions(+), 6 deletions(-)
