Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7EAF37ADDC
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 20:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbhEKSJQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 14:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232010AbhEKSJO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 14:09:14 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 493B6C06174A
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:07 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id f29so7427358qka.0
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m5/6pzxNzbbYkFsZXg0EnLX6bHrV+zgSw51fRvk1jaw=;
        b=GxqXSpc9O3mQr6WF2n529jLUFaUDRLuLriBdpyn0AZdRmFZL30u5fVlxn6NBAZUYlS
         UuEdXTOgaE8+46iQTvUj5Cxi+zP087QIt+Q4KbqDdvw8qljS6C7fYaaphVAg/lXkdwQb
         63cy2eJymoWOm24Kq0QVkSpU4P473CSkNrOu6n9RscYz6sg8LMXvvtBrLacse+7KrC5I
         zZzvY0eWm6SB7c9dQhVXjBs0wpvlr8qUVxXQtn+9NSf5xMWX7Wi8Dp+jJjHGc1A85XBx
         mzS5RUqsoPSOFzXOTwmY/20OpyEwohkPDTUXAnpwZnVezauDybPjQBFeQbgTJC4IgHrz
         Ofug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m5/6pzxNzbbYkFsZXg0EnLX6bHrV+zgSw51fRvk1jaw=;
        b=JthtiY6nAuQrvaU+iX8d1Ys3+z8QbxaEHuS/LZY/tlHd+53lFKLj/0dXB7ILkOOqAB
         uuWfpHFarWVj8AadEE4IzlqtyqWTuLPTSYbVwT0tN8evU/AXLp/0DtABKgxio88eDCT+
         G6J0Gz/U/8g9ZwBXRE982A0yaZjvLTBo/HEtZjkMKdYDqDf5gTzTSjBCzpQrPf3neSHM
         tCpnjKm5DZasfv8C4Nhl0jppHm62MgEtyRkHA4cfjEYrO3TYSxHG/iokFZDgH8cCW7LQ
         aPURuEbyiOv3wP1zzUw4U2f0SykESAVlkCDhGuOcyYfc52ep9ubx1UfLaqr/WHTwHjFI
         r2wA==
X-Gm-Message-State: AOAM533s27j2xLpepLjL1BH/zBsgm8aRJeTeUj/IX3bKem0jgpexnMz/
        YNPYjn21/xw1K4D9L67U7en3aQ==
X-Google-Smtp-Source: ABdhPJx8gtspoCkhqQR/buYqOvYmOoVT/ts0w783jwbgCnO58tAbN0EGk2e/Hpn9a+JSCs8Vzsnfjw==
X-Received: by 2002:a05:620a:21c5:: with SMTP id h5mr23029616qka.395.1620756486485;
        Tue, 11 May 2021 11:08:06 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id g5sm17104476qtm.2.2021.05.11.11.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:08:06 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Todor Tomov <todor.too@gmail.com>
Subject: [PATCH 00/17] CAMSS: SM8250 support (and some fixes)
Date:   Tue, 11 May 2021 14:07:07 -0400
Message-Id: <20210511180728.23781-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds initial support for SM8250 and its 4 VFEs and 6 CSIPHYs.
The only big change is the added camss-vfe-480.c to support the
Titan 480 VFE.

Jonathan Marek (17):
  media: camss: csiphy-3ph: don't print HW version as an error
  media: camss: csiphy-3ph: disable interrupts
  media: camss: csiphy-3ph: add support for SM8250 CSI DPHY
  media: camss: csid-170: fix non-10bit formats
  media: camss: csid-170: don't enable unused irqs
  media: camss: csid-170: remove stray comment
  media: camss: csid-170: support more than one lite vfe
  media: camss: csid-170: set the right HALF_CMD when disabled
  media: camss: csid: allow csid to work without a regulator
  media: camss: remove vdda-csiN from sdm845 resources
  media: camss: fix VFE irq name
  media: camss: vfe-170: clean up some dead code
  media: camss: vfe-170: fix "VFE halt timeout" error
  media: camss: Add initial support for VFE hardware version Titan 480
  media: camss: add support for V4L2_PIX_FMT_GREY for sdm845 HW
  media: camss: add support for SM8250 camss
  media: dt-bindings: media: camss: Add qcom,sm8250-camss binding

 .../bindings/media/qcom,sm8250-camss.yaml     | 398 +++++++++++++
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-csid-170.c      |  31 +-
 .../media/platform/qcom/camss/camss-csid.c    |  39 +-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 181 ++++--
 .../media/platform/qcom/camss/camss-csiphy.c  |   9 +-
 .../media/platform/qcom/camss/camss-vfe-170.c |  65 +-
 .../media/platform/qcom/camss/camss-vfe-480.c | 554 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c |  13 +-
 drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
 .../media/platform/qcom/camss/camss-video.c   |   5 +-
 drivers/media/platform/qcom/camss/camss.c     | 202 ++++++-
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 13 files changed, 1352 insertions(+), 148 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-480.c

-- 
2.26.1

