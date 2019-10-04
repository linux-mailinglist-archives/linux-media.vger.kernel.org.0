Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53AFDCC015
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 18:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390309AbfJDQFi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 12:05:38 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35324 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390058AbfJDQFi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 12:05:38 -0400
Received: by mail-pf1-f194.google.com with SMTP id 205so4186926pfw.2
        for <linux-media@vger.kernel.org>; Fri, 04 Oct 2019 09:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=G6wIL875XZuorF2ZOZc99He9fmBICo2vTYfV+CUzHL0=;
        b=lOuj9JiU977ulIU8HkqDBOBQQ89TzhSSv3/X40mTVvctu8QgNnMEIzSohNVLZHTw9V
         yi4CO3DHpQmGWba5f6J8A1SPWwbNg0vzxLlXPa1J4d0YZdy8fz9c6222HH1f/Urwv3DV
         UNrq8NVfMurgeOIegEddRk3k4OFNyZtxaCMX4L3voGeVS3AIC0U7cG4BA3y2LB2LatBW
         6NtnN4NrYC5YhFQ1qf30iUGq72FnmYVgm/jt0U/ZwAXV5aFOQiHzcBMCx1NWz8gSwJ6+
         9hRdIeQxlzIoepLgK22iFJj6lS0qDcqEBgpw3FURlwS7DPIRXKoIGpuN9Yn10L9nQ9r7
         R03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=G6wIL875XZuorF2ZOZc99He9fmBICo2vTYfV+CUzHL0=;
        b=Mds/HG+QTcvEXZHrUo0Z3Vyh54EaXV/emnmRwg/IAQ9JZ/Vm5reTOKHKkdgfH02Pw9
         TGUBIGye2iYNyV07Ayd21KUz7tXzEdNxQ+GkY4szwzk3uNc0w/su/sNoixuoPeoER74p
         DCW7AzFpU1w0hB/iWgGlcQE+j0pHf0EekXgfF2c8KR2teC5w5Er304sTTzyciL7TOBMa
         ef+aiWf7f0g5mUK7W6zVOrXm26Q7ZBjxgHpVigp3fOm18NG2Xdal+fiWwFkHkTxHVi7Y
         wQc2McXuUZNTCS12CYfkBGoe1txajIHmiKoBNfWL3jYfsSk0kqoPowSPa4WLJzKAMWkP
         6fGw==
X-Gm-Message-State: APjAAAWPQ/mZYLXhvu80hFgUHSA3nIF4NzhLhQU1AMk6fEWrIrJgl/3R
        AohZkNqsKHT99q1ev+bNBcT+
X-Google-Smtp-Source: APXvYqwEeenp3fnA43Qgkg6DKMInAhQDlL7l8FbjYMHEpk4Ij7IGN5Hqostll6TJ9guDv3Fr28fVSA==
X-Received: by 2002:a17:90a:e017:: with SMTP id u23mr2556438pjy.55.1570205137188;
        Fri, 04 Oct 2019 09:05:37 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:648a:e40a:3174:4ae1:69ba:aabb])
        by smtp.gmail.com with ESMTPSA id b5sm5402254pgb.68.2019.10.04.09.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 09:05:36 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 0/2] Add IMX290 CMOS image sensor support
Date:   Fri,  4 Oct 2019 21:35:23 +0530
Message-Id: <20191004160525.16716-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patchset adds support for IMX290 CMOS image sensor from Sony.
Sensor can be programmed through I2C and 4-wire interface but the
current driver only supports I2C interface. Also, the sensor is
capable of outputting frames in following 3 interfaces:

* CMOS logic parallel SDR output
* Low voltage LVDS serial DDR output
* CSI-2 serial data output

But the current driver only supports CSI-2 output available from 4 lanes.
In the case of sensor resolution, driver only supports 1920x1080 and
1280x720 at mid data rate of 445.5 Mpbs.

The driver has been validated using Framos IMX290 module interfaced to
96Boards Dragonboard410c.

Thanks,
Mani

Changes in v5:

* Fixed issues reported by coccinelle
* Moved MAINTAINERS entry to bindings patch as suggested by Sakari

Changes in v4:

As per the review by Sakari:

* Squashed the MAINTAINERS changes with driver patch
* Some misc changes to the driver

Changes in v3:

As per the review by Sakari:

* Switched to pm runtime
* Used link-frequency property
* Removed useless read calls from buffered read function
* Some other misc changes to the driver and binding

Changes in v2:

* Added Reviewed-by tag from Rob for bindings patch

Manivannan Sadhasivam (2):
  dt-bindings: media: i2c: Add IMX290 CMOS sensor binding
  media: i2c: Add IMX290 CMOS image sensor driver

 .../devicetree/bindings/media/i2c/imx290.txt  |  57 ++
 MAINTAINERS                                   |   8 +
 drivers/media/i2c/Kconfig                     |  11 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/imx290.c                    | 881 ++++++++++++++++++
 5 files changed, 958 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt
 create mode 100644 drivers/media/i2c/imx290.c

-- 
2.17.1

