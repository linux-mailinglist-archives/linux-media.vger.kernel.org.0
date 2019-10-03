Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5CB5C9B4A
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 11:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729193AbfJCJz1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 05:55:27 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33451 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728894AbfJCJz1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 05:55:27 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so1439363pfl.0
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2019 02:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=e6qE7XB76qy7vrZGoWaWqzg5fBcTX3zqPmnTO48m2kI=;
        b=QQmX9/5Phtejcr1s1+XLaQd2GNoMEJRCgCi+qbyPv4OAQyhGeTxqwHOsoWcrQ3h4ls
         0PBrbMSml429sVGl9iiksabhKvcCNZRCsALpvqhhRxjstI3KJQrwjDS6cZZtK/8uOz4l
         sw1hkkpnKXuY6qZB/VyLeoze3Qm71B2UWxRvYm9T6dwL3Uo4zzJ4X0sxX7d+fbUbFohi
         MQHReNnKsu1eC2tK3k5llT2QaaFN0arIMNg3rOYbjbm3HBdJEdaLjyRn62TdLk6zDz+b
         h4HwvSOHP0ntz9Xs2AyqQLL/P+58M1xgZ+JylLH7VXlj/IqJAX0lv7FPnnILMKpKufPl
         Zu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=e6qE7XB76qy7vrZGoWaWqzg5fBcTX3zqPmnTO48m2kI=;
        b=POUeh5zjqwVMtOW1et0fQegtmFEonXNULfT27ubTVi5bNpDOOKTYlxkDUm0f4V3vcn
         02IxcDrLVvOCOwvfVTLvW6B2H4cV7Rda6hFj9FRbIgmUeccrDI1fNg/K38hzRO2ah9hZ
         TWIDdYYnBxAWjqFHRTQ1EyMW7v6y33eiAh35hlZUbm6lt/8R/HhnHCR1t2Zn30RJH0GM
         0vN3Yut9eBvCQVi3NO+TbY/WzyC5Jh90A50IkWDeoK7bbIwvdOBZzwYEDZwYWJRMGRKk
         2WzIJ+ET09bdwCOVc2glts9PrDBdM2OSyYIL1X0Fj/a/4m0v6gSUwY69npYovO2H68WN
         bY5w==
X-Gm-Message-State: APjAAAXc6AqBUaFe4/BwEj4TkxguJqnfT3zLyaDB8r+dMnvatFDsr6q0
        UcBxj97buG/2HFMrSlg/rELY
X-Google-Smtp-Source: APXvYqzydIQYXMnyCqqO3yg3J8kBycFk+XR5FrVUknBJE3cp5jNvElNBPUavGxIrF2g9kfibWX3bzw==
X-Received: by 2002:a63:ed10:: with SMTP id d16mr8924685pgi.307.1570096526650;
        Thu, 03 Oct 2019 02:55:26 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:801:ac5d:fca3:6f38:70fb:67fc])
        by smtp.gmail.com with ESMTPSA id v3sm2346171pfn.18.2019.10.03.02.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 02:55:25 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 0/2] Add IMX290 CMOS image sensor support
Date:   Thu,  3 Oct 2019 15:25:01 +0530
Message-Id: <20191003095503.12614-1-manivannan.sadhasivam@linaro.org>
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
 drivers/media/i2c/imx290.c                    | 885 ++++++++++++++++++
 5 files changed, 962 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt
 create mode 100644 drivers/media/i2c/imx290.c

-- 
2.17.1

