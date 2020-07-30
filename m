Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37B9E233136
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 13:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbgG3Lre (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 07:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727907AbgG3LrQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 07:47:16 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1038EC0619D4
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 04:47:15 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id y3so24603617wrl.4
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 04:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=tIZ4h1fhX2WCRnbynq3WODdOngNcLlyJs5mtZ1Hut3c=;
        b=zt750EJ2vU5XTvLnTcd3pHK0vw5SOb0ldRbuYnr3ab8Zf4dINgPH7UflqWBIUOh2MA
         gI1ak3nj8MX5XFyP+Qk3S6t8HGEhnoDCmoFM8sY5WmZngoaHRZK953+SF48h1svyS3gS
         /xLwWTYGFhZ7mFZVetLJ7/yD/h7KGI8wFDFkT8rm7yEvNKpuuQLvMyNzKdy3hM12Xa09
         BjqSKgN3suQwBePq013RLb5tToNA73yhMS0e2rQVX/vsly2WYcfaydWFCjNqZfQvEac8
         sTyHni/P2R/jTQJBYg978K6NdNuVtsLXFRAVCwTqJ7Hqrgh5av5Ehx2gvQFSotiqhPD0
         v46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tIZ4h1fhX2WCRnbynq3WODdOngNcLlyJs5mtZ1Hut3c=;
        b=DZAuBou7ZqY9tnkrz2vy68kBcd+ACuRpzAA+LTzhEExZpVmPk7+j37GA7zYxe7fLs/
         5i2/0gE8mz5V57w3kZ55TFpP+niqja8BzKrXbvBtvS+wV4AKbHzVbnwlPwUGjPY7lTXF
         JCOVGUzu4BIHh522Pa2Mjfb6B12s5KT2C9dEfTq/7l9/pow+H4NIZ4j4PdrkDr2Loqav
         SNICGQW+rL6LgEhmWZJQc1vC4aQ33hsgxpoS2Jb7b9bR80eV0kjB6SCnPibNtymfnBfq
         OIQDhkV179NNW/QOoZ4CHgl++xfQ99g++nv54ofc2g+3jDAwP7+n7nwqf1VIyaqiYcdX
         EjoQ==
X-Gm-Message-State: AOAM531JDVhQcxYLtxKoWxkYjmsXJLDoVOZsS4/U0KILt+FlEDNXloE4
        rJ7+CuKuTyWzfHTbehPOKXJxKx8c6tN4XA==
X-Google-Smtp-Source: ABdhPJyPiwoyW2cOAjYW4girHCbMu9Tu7U5+ZixtcXyQd7tg+oMUFYhvjMn9nKdgc/TW33ah40YvIg==
X-Received: by 2002:adf:bc4b:: with SMTP id a11mr32401711wrh.381.1596109632946;
        Thu, 30 Jul 2020 04:47:12 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id 32sm9636691wrn.86.2020.07.30.04.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 04:47:12 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/3] Venus - recovery from firmware crash
Date:   Thu, 30 Jul 2020 14:46:29 +0300
Message-Id: <20200730114632.6717-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

The intention of this patchset is to correct the recovery sequence
for Venus v4 (sdm845). Recently has been observed various recovery
failures which leads to unreliable behavior in sys_error handler.
To fix that the sys_error_handler is reworked, proper delays has
been added over pmruntime handling to ensure that the hardware and
encoder/decoder drivers are idle. Also a wrong watchdog code in
threaded irq has been removed. 

regards,
Stan

Stanimir Varbanov (3):
  venus: parser: Prepare parser for multiple invocations
  venus: Rework recovery mechanism
  venus: Add new interface queues reinit

 drivers/media/platform/qcom/venus/core.c      | 25 ++++----
 drivers/media/platform/qcom/venus/hfi.c       |  5 ++
 drivers/media/platform/qcom/venus/hfi.h       |  1 +
 .../media/platform/qcom/venus/hfi_parser.c    |  3 +
 drivers/media/platform/qcom/venus/hfi_venus.c | 62 +++++++++++++++----
 drivers/media/platform/qcom/venus/hfi_venus.h |  1 +
 6 files changed, 74 insertions(+), 23 deletions(-)

-- 
2.17.1

