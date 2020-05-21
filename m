Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 968551DCDEB
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 15:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729296AbgEUN2h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 09:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729437AbgEUN2g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 09:28:36 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64139C05BD43
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 06:28:36 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id l21so8820716eji.4
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=PMQK+3WLgMeeHuMYX4OY8IdBlPdvrGSBUdMUAg90qrw=;
        b=VSI/i/VYlS6Qf6xzt4vUaC31mRMvFHSyaRUaZpNboeEQ5TSV0dwz+nG5FjSGw9R/Br
         jxsaXjESXxQnZemdZN8eo66EcwUpztft4LwGo6k4wSWGlOd2BiHODKWruug/89Twui0K
         7QtNaN2r9XZ8RNz3y8w8KDTU7LjZo5RpOChqm27kTtgYcSQuvQEiqeCSz+NP8tM7VNtN
         DcOZzw+f6adniFONs3u8Wk6GPKXuE5fqMAembdV0HfTRbxeF84JeA3ECA8k9+9CjEfDV
         LyK/3C3G/aBumi86SV3WndfirKrY60Y8xwhC13nS61Ym2HvUFnPaKw4BR380e/KwfiNz
         OoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=PMQK+3WLgMeeHuMYX4OY8IdBlPdvrGSBUdMUAg90qrw=;
        b=J9rXRnqPVwjQqAE+ATwkjLXKOxmkAw7I+P54RvuJKxKLkuV0ikQ6x6BPxvaPgh+SZR
         IoOj2rQyT4VAAFddCsrM5gIWmmkXTeth6VBgdt6YItxnOlb0m+1M6LdOlwvB1wUrD6Gi
         Ysp1LeUGyR2OZeu8xSk427xzzn+gvpyHEfB18u25LeUCmcurZlgH7PEW8EHYuCJIFINc
         EUrO09EKFE9h9r2S+qPb+DOtnO93IdTWZNXDZxxxXqWR3BDfUQoqzTsszCeZO2KkUkTD
         0D43QBcIqKy3kyxhSKMGRc/xB/oHYwWYoGBEYwX/zm6NsjMI+C7+ZyCbfXePB2w/gaF3
         LusA==
X-Gm-Message-State: AOAM533zvD7AK03wrHgtdzsrvQCDvwmzlBElP/5I05i1iHaDPzb3L2Ej
        KCxODCGfchgxZAhK5Rmcurl7NbLYsnBCEQ==
X-Google-Smtp-Source: ABdhPJySHieCQClv3MvdhiiKAz09ylapZ6SdvZ6J9R6+DeNuh6EVoBtx2AVE4C+ly7UrOiLTCEKSPA==
X-Received: by 2002:a17:906:84cf:: with SMTP id f15mr3472941ejy.185.1590067714453;
        Thu, 21 May 2020 06:28:34 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-12.ip.btc-net.bg. [212.5.158.12])
        by smtp.gmail.com with ESMTPSA id lr21sm4980580ejb.117.2020.05.21.06.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 06:28:33 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 0/3] Venus dynamic debug
Date:   Thu, 21 May 2020 16:28:13 +0300
Message-Id: <20200521132816.31111-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Here is second version of the dynamic debug series.

Few things are changed since v1:

 * Rebased on current media-tree master
 * Added one more patch for SSR trigger debug file

regards,
Stan

Stanimir Varbanov (3):
  venus: Add debugfs interface to set firmware log level
  venus: Make debug infrastructure more flexible
  venus: Add a debugfs file for SSR trigger

 drivers/media/platform/qcom/venus/Makefile    |  2 +-
 drivers/media/platform/qcom/venus/core.c      |  5 ++
 drivers/media/platform/qcom/venus/core.h      |  8 +++
 drivers/media/platform/qcom/venus/dbgfs.c     | 57 +++++++++++++++++
 drivers/media/platform/qcom/venus/dbgfs.h     | 12 ++++
 drivers/media/platform/qcom/venus/helpers.c   |  2 +-
 drivers/media/platform/qcom/venus/hfi_msgs.c  | 30 ++++-----
 drivers/media/platform/qcom/venus/hfi_venus.c | 27 ++++++--
 .../media/platform/qcom/venus/pm_helpers.c    |  3 +-
 drivers/media/platform/qcom/venus/vdec.c      | 63 +++++++++++++++++--
 drivers/media/platform/qcom/venus/venc.c      |  4 ++
 11 files changed, 180 insertions(+), 33 deletions(-)
 create mode 100644 drivers/media/platform/qcom/venus/dbgfs.c
 create mode 100644 drivers/media/platform/qcom/venus/dbgfs.h

-- 
2.17.1

