Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBA0435E15
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 11:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhJUJmX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 05:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbhJUJmW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 05:42:22 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12299C06161C
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 02:40:07 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 5so2726872edw.7
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 02:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZxPzGOnYx9C4Of3wGaGSYtZEngNxbz8U+CuZjAgKy3I=;
        b=vohO5WycQocXR7ZFtVPrWRqYyMxW4uhYOMFvzbER2ikSL+RdNeWYKEDWVY+cD+PXfL
         Gakwwy7twyoiawFCKWg1bAKHOT2YLjDmuqvq0Ej2w03yURIiMJMkZ9ZBklZha+SbgR63
         4lG0TSWj0I4WPiHcEx42VwsK+wYb3LA5PLyaPYKjJEHNHSA7lZVtrfkC3Q7/Afx+jw2B
         TuAzdzvbJamZB3esyxVxX7h2ss8VeYJk5DBGsotlugnXk9Lxx0AtcPZXyMpiMx/4Gxcg
         DnQUgb7kS4w3pz5RkheP8JJylAIdBIM2swutuX2CWSuHVG5XDUk+VyeQYGN67yV3fi0i
         rjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZxPzGOnYx9C4Of3wGaGSYtZEngNxbz8U+CuZjAgKy3I=;
        b=Krsl4NgxgkTqIQr0BQPZq+pduynFxHUua9XOEiZP10ClBlvw78wlkRipPBj+WdknoS
         w6MOJz8oiV/IiRGrrcPKse7ZcIVDMknJ+P0/xQlK7gXMH7iZB/omAI+e+KIl7hlexDv7
         4IaShIKTA87xYbKhS68NEJgOwjeMJ8y/QNo3nwMdon4SbAYyl0kBycxwyKtl69gctEws
         /UCQLAVUSkfEzqptBI6BbY/DvIBj846GaQkrCz7X7wSHmGIQ88yj9r9CuiJhl5g8NUAq
         61gOwRmFMi3HGcKWbPuRPyeoHgF0YofMx9YvvcAYslKEPpmykw3RXpXmKV0Z8sTK2ygw
         B1hA==
X-Gm-Message-State: AOAM5319l5DpmIzjSMQmfRGyeDUAeAg1497IUilEGF8slcL1lfeCyZ+Y
        kcWYnmhCEwli6ua3m/FfRvd9a7N9e1yDHQ==
X-Google-Smtp-Source: ABdhPJx9yfTg+nSwRzjhwDGPiO0HajMZSKOgyJ0HIJqzqMOoELq8Xibs0TaY6+cVhFZKqxPq9UTKwA==
X-Received: by 2002:a17:906:2505:: with SMTP id i5mr5801111ejb.450.1634809205218;
        Thu, 21 Oct 2021 02:40:05 -0700 (PDT)
Received: from localhost.localdomain (hst-221-81.medicom.bg. [84.238.221.81])
        by smtp.gmail.com with ESMTPSA id h9sm2241116ejy.108.2021.10.21.02.40.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 02:40:04 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.16] Venus updates - part2
Date:   Thu, 21 Oct 2021 12:39:51 +0300
Message-Id: <20211021093951.3963813-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This second part of Venus updates includes:
  * Add sdm660 DT schema, DT compatible and resources.
  * DPB internal buffers handing as part of DRC.
  * Added pmruntime autosuspend for encoder.
  * An attempt to handle fatal (firmware) errors as per the spec. 

Please pull.

regards,
Stan

The following changes since commit fd2eda71a47b095e81b9170c3f8b7ae82b04e785:

  media: remove myself from dvb media maintainers (2021-10-08 13:56:25 +0200)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.16-part2

for you to fetch changes up to 1fc3539ba413a4302efae670fcfae25d75db31e9:

  media: venus: core: Add sdm660 DT compatible and resource struct (2021-10-21 12:20:46 +0300)

----------------------------------------------------------------
Venus updates for v5.16 part2

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      dt-bindings: media: venus: Add sdm660 dt schema
      media: venus: core: Add sdm660 DT compatible and resource struct

Mansur Alisha Shaik (1):
      venus: vdec: decoded picture buffer handling during reconfig sequence

Stanimir Varbanov (5):
      venus: venc: Use pmruntime autosuspend
      venus: Make sys_error flag an atomic bitops
      venus: hfi: Check for sys error on session hfi functions
      venus: helpers: Add helper to mark fatal vb2 error
      venus: Handle fatal errors during encoding and decoding

 .../bindings/media/qcom,sdm660-venus.yaml          | 186 +++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.c           |  77 ++++++++-
 drivers/media/platform/qcom/venus/core.h           |   7 +-
 drivers/media/platform/qcom/venus/helpers.c        |  67 +++++++-
 drivers/media/platform/qcom/venus/helpers.h        |   4 +
 drivers/media/platform/qcom/venus/hfi.c            |  48 +++++-
 drivers/media/platform/qcom/venus/vdec.c           |  25 ++-
 drivers/media/platform/qcom/venus/venc.c           | 116 ++++++++++++-
 8 files changed, 511 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
