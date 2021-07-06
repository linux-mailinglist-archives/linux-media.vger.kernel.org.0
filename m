Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF5803BD6E3
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 14:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240815AbhGFMsl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 08:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238472AbhGFMsk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 08:48:40 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A475C05BD38
        for <linux-media@vger.kernel.org>; Tue,  6 Jul 2021 05:41:08 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id j16-20020a05600c1c10b0290204b096b0caso2164048wms.1
        for <linux-media@vger.kernel.org>; Tue, 06 Jul 2021 05:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZnlHLNnJd5GU0c7sfvbRXRKe3J+7AIP690BFavXKv1w=;
        b=Tgdihnyrz7EvhoXM7zBn/7wdjxTn+9+TZAnba00UOq7jgBqH6P/RLawu3OCcSSkS5r
         uT3uVAay9MiFXblkJgnjCsSyVvtuMpADlgH6oG1B02sTNA2s2UMFXxoWHKlJZknNk6Hp
         cAb3kKvRh/tgoiFtFBf09SjMGCwyD9QmHby5qIf+TgbD2EWZlvb2wCV1WfJIr+zJ4jDu
         a2x68i1M5MHokjcsbpqiMQQ5R1kYLQQP/dOilQdz6FBptzuHgnekoyaCWgVd9HCuBG80
         Mw+snaA+Gosk9GobmtcCGtOP2IbKgiZQFx7cDhQ95ZEx/jUyaEO872DCzVvJcqgXA4yB
         s5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZnlHLNnJd5GU0c7sfvbRXRKe3J+7AIP690BFavXKv1w=;
        b=kABs5hvltlfEbXoGRMPR9g5idXkH88MoY+IyjGYbLs2TV9L7J+xsmuTw2Up+M1e3hn
         WTNJxHCaRkmZprnFicqyLkG6JPqTZhOlh4GwDsEin7Fx+yJ61ZF9KJh0GsyqlOVyPowU
         jFwJNrQSi75I8CQBPvF+gJzJdyXpLiiyFSSX6k4c1PiFswv+7dWi17SAE3BJ4VsaYMqC
         SDTyX0tRj4V8GChgt7SS8XnmAkR7IseXMrw7KfNiOR6VaPt0i/F3/QBf/XbCKOcZBnt8
         Y1rGSUBqh/sttT6FV7U9+QvX1iKEGtMm9EA2H9P3JQHcob4Sfcd5iAW15ONG5oxK/hOt
         Q8ng==
X-Gm-Message-State: AOAM530iklzkn7sRd6MOr1Z3yoPzAWWg8hrzDM7uxReK+kRv9JYZzCcG
        MRBSYkdY78XjNEJ9yZuoSJyBKaB48LvXKw==
X-Google-Smtp-Source: ABdhPJzWRZPLxPm5pkjpVSedfMNIICVpLIX53ZmQsrzAHGeoZVifZhAkmLeC18AjdSgx43eqXYMCPw==
X-Received: by 2002:a05:600c:a45:: with SMTP id c5mr442364wmq.153.1625575266517;
        Tue, 06 Jul 2021 05:41:06 -0700 (PDT)
Received: from localhost.localdomain (hst-221-27.medicom.bg. [84.238.221.27])
        by smtp.gmail.com with ESMTPSA id n18sm2585979wms.3.2021.07.06.05.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 05:41:06 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-api@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 0/5] Qualcomm custom compressed pixfmt
Date:   Tue,  6 Jul 2021 15:40:29 +0300
Message-Id: <20210706124034.773503-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Changes since v1:
 * rename QC8C to QC08C
 * rewrite the documentation part
 * handle correctly QC10C compressed format in the driver
 * correct compressed 10-bit formats for Venus v4 and v6

Regards,
Stan

v1: https://patchwork.linuxtv.org/project/linux-media/list/?series=5331

Stanimir Varbanov (5):
  v4l: Add Qualcomm custom compressed pixel formats
  venus: helpers: Add helper to check supported pixel formats
  venus: Add a handling of QC08C compressed format
  venus: hfi_platform: Correct supported compressed format
  venus: Add a handling of QC10C compressed format

 .../media/v4l/pixfmt-reserved.rst             | 18 +++++++
 drivers/media/platform/qcom/venus/helpers.c   | 48 +++++++++++--------
 drivers/media/platform/qcom/venus/helpers.h   |  1 +
 .../platform/qcom/venus/hfi_platform_v4.c     |  4 +-
 .../platform/qcom/venus/hfi_platform_v6.c     |  4 +-
 drivers/media/platform/qcom/venus/vdec.c      | 31 ++++++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +
 include/uapi/linux/videodev2.h                |  2 +
 8 files changed, 82 insertions(+), 28 deletions(-)

-- 
2.25.1

