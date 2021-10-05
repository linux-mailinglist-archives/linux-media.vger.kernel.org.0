Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ADC442202E
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 10:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233017AbhJEIM7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 04:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232761AbhJEIM5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 04:12:57 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00C6C061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 01:11:07 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id bm13so24926642edb.8
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 01:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GVwcWs/uv4J9s+bBSG6ihmdyt76H04Hfo/iT/pqXSrY=;
        b=fXzaTCWklpzZHEUNwY89xZcl1XOE0AnhvAQ5X/i9vhuCNa+o72Vtip9I1kN6/hFvht
         gEbbwojyuenaQuOMNoeMviRhgWi+xR2mUqwM9GdFJW+izTeB2WzEHB+AzcLvolUCEb0m
         i9h/tIVbxLBVaBoDGREvxhNznI08XgDRr0Z57xVdZ9fYgli9UrzR25B7BgcQVVFb9lKD
         2jifvrAOtHdVtkeJyIgarBVrsCKqgMFdhUP84zr0sSZ68GCyp8wAZKlBULt7syGGyktC
         JJVFkJ8BM6jg6obChFs+Yx4rAHgrjiUZ+8cY0n6PhsZ73Tk2eWwnSes6J0c15LZOdX59
         ZCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GVwcWs/uv4J9s+bBSG6ihmdyt76H04Hfo/iT/pqXSrY=;
        b=e99iSS98E+8fFSU2pxe+szpykxhKkfQas33fgUNtb6wYa8p26V+lXNdqi3xvkmBDcC
         b0atZOi7o7/oQnMxES/bN3dMf8mmyWflkvZm9O/pVuuOR0zU3EkiW8mc3a0yjG0frZVe
         zXeYEuYzHROlALNv8Yyh3SHqTMImf89DJkshR85MogNHJlJTo/Qo7gCNPdAdTPahm3ox
         sVNfZJHTjlqHiDQcjrQG/601AggaB/W9RUiTgtPRRrAJXDkmUyDHfv0FRvwn3/TUJ5KP
         VpvmrmnAkgISDRpyKzviArl5wvPoELgl3eDo5WQUhT8FXIHg1HVy1a+HdSMQ3ptGuf5N
         uwjQ==
X-Gm-Message-State: AOAM531je2DtVYlnjt5AGfqGKVVdT2u4SzxkDqO9qbnsTs36g1HaeKz8
        /kxnDszWqTSp5Vc6WHxRDk2ZZvoBiXla4Q==
X-Google-Smtp-Source: ABdhPJxKMzLdHnqm/Wu7EAET3yX4z0Hk2cWBuw00IUeWq9avIGtMcvB6GABbx4vat1SKRYCI/DKxrQ==
X-Received: by 2002:aa7:c941:: with SMTP id h1mr24759255edt.128.1633421465630;
        Tue, 05 Oct 2021 01:11:05 -0700 (PDT)
Received: from localhost.localdomain ([84.238.208.199])
        by smtp.gmail.com with ESMTPSA id f1sm3096258edz.47.2021.10.05.01.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 01:11:05 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v5 0/7] media: venus: Enable venus support on sc7280 
Date:   Tue,  5 Oct 2021 11:10:41 +0300
Message-Id: <20211005081048.3095252-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Re-send the patchset with comments addressed and fix checkpatch
warnings and errors found during preparing Venus pull request. 

regards,
Stan

Dikshita Agarwal (7):
  venus: firmware: enable no tz fw loading for sc7280
  media: venus: core: Add sc7280 DT compatible and resource data
  media: venus: Add num_vpp_pipes to resource structure
  media: venus: hfi: Skip AON register programming for V6 1pipe
  venus: vdec: set work route to fw
  media: venus: helpers: update NUM_MBS macro calculation
  media: venus: Set buffer to FW based on FW min count requirement.

 drivers/media/platform/qcom/venus/core.c      | 54 +++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h      |  2 +
 drivers/media/platform/qcom/venus/firmware.c  | 42 +++++++++++----
 drivers/media/platform/qcom/venus/helpers.c   | 14 +++--
 drivers/media/platform/qcom/venus/hfi_cmds.c  |  7 +++
 .../media/platform/qcom/venus/hfi_helper.h    | 14 +++++
 drivers/media/platform/qcom/venus/hfi_msgs.c  |  7 +++
 .../platform/qcom/venus/hfi_plat_bufs_v6.c    |  6 ++-
 .../media/platform/qcom/venus/hfi_platform.c  | 13 -----
 .../media/platform/qcom/venus/hfi_platform.h  |  2 -
 .../platform/qcom/venus/hfi_platform_v6.c     |  6 ---
 drivers/media/platform/qcom/venus/hfi_venus.c |  4 ++
 .../media/platform/qcom/venus/hfi_venus_io.h  |  2 +
 drivers/media/platform/qcom/venus/vdec.c      | 37 ++++++++++---
 14 files changed, 165 insertions(+), 45 deletions(-)

-- 
2.25.1

