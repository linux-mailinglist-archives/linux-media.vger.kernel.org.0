Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88EABD3818
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 05:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbfJKD42 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 23:56:28 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37013 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbfJKD42 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 23:56:28 -0400
Received: by mail-pf1-f193.google.com with SMTP id y5so5249028pfo.4
        for <linux-media@vger.kernel.org>; Thu, 10 Oct 2019 20:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=SVBIZ6TutEvvopb2bKkLN3mfYjjRYFIVl60EmQThixk=;
        b=y/75rxgAC5Na+RGpyEeX9rvjD5h7d6xoHOp4IQpNng7jLQQsmogQYVjWVMhnNTlYVq
         SB+8kfaErnFC4/Tam8D+lMTc9mBcFljO5xULgPipZfgve2YoD/KbbDPKPdIQ/QhxKEPb
         DSj3MGidtddra/kXbCC0tIY1IIKAIouMyv1V0DHMv1pkCOThIluKf8j7efGCgfXuAdM+
         T6zIIHQNYjhAtOjcDZ4ME+91J5ZFlsphbVoyxeOJESfKgvhODyhDLLFESHqS4jWdKSm+
         jsKADIkrUaQOtNHPuAVWF8FNLTJG4DSm5GyqvEj+0wTwod8JgoNH7XAhhdiadCjJNpbJ
         /dIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SVBIZ6TutEvvopb2bKkLN3mfYjjRYFIVl60EmQThixk=;
        b=adfQhw5mxQT4slo7b0cSwH8bfS/0itd2cQFlTn4W5k1Bb3VnEbbIvN95/5b1ws2vR+
         LZ6kQjXznL+dnyeYAB+Pw0C5m60MhagwhNRzPzNGlj0d+VQNnjrfeh3uJfxxuAcvQYyf
         SeplbiRLA423rBL1z25Yn5E9iHcomcd3XFkHwj3M5K3oTq/tD0UkPc3aWXs6uq1KJNL+
         wkl42lZtomF4RqFKMXy5dY1kGy/SK8QDyvQCnil8H9mLISwd5qdCbzOU0qfeH6xQ4OUe
         HSdR9tGkbT2blzfXCq+RV43bqkb7OjLSfsN60KfZBvTU5a99u4MZOLmkgxlnc/XZOQCo
         wnbw==
X-Gm-Message-State: APjAAAVvOZ8BPg+PZ3Xyvd3bNuB5sVkGhf/WdgQ3WVz1QW+rAEuGGrnL
        ZaCsQgUjKV7MW/vz3+Rs2t0G
X-Google-Smtp-Source: APXvYqxQNZ1y/2ZTnuluqLNI6S3eCUHXdneW8RC8NfEDQRnxgr9BPuUGs2KRoVSfEyvXvXHI5nyHJQ==
X-Received: by 2002:a63:5946:: with SMTP id j6mr14544603pgm.214.1570766187160;
        Thu, 10 Oct 2019 20:56:27 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:638c:660b:18a3:ff6e:e66c:65b0])
        by smtp.gmail.com with ESMTPSA id b185sm9534210pfg.14.2019.10.10.20.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 20:56:26 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/2] Add IMX296 CMOS image sensor support
Date:   Fri, 11 Oct 2019 09:26:11 +0530
Message-Id: <20191011035613.13598-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patchset adds support for IMX296 CMOS image sensor from Sony.
Sensor can be programmed through I2C and 4-wire interface but the
current driver only supports I2C interface. The sensor is
capable of outputting frames in CSI2 format (1 Lane). In the case
of sensor resolution, driver only supports 1440x1088 at 30 FPS.

The driver has been validated using Framos IMX296 module interfaced to
96Boards Dragonboard410c.

Thanks,
Mani

Manivannan Sadhasivam (2):
  dt-bindings: media: i2c: Add IMX296 CMOS sensor binding
  media: i2c: Add IMX296 CMOS image sensor driver

 .../devicetree/bindings/media/i2c/imx296.txt  |  55 ++
 MAINTAINERS                                   |   8 +
 drivers/media/i2c/Kconfig                     |  11 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/imx296.c                    | 733 ++++++++++++++++++
 5 files changed, 808 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx296.txt
 create mode 100644 drivers/media/i2c/imx296.c

-- 
2.17.1

