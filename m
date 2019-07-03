Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2A7B5EC17
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 21:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbfGCTCp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 15:02:45 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34976 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbfGCTCp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 15:02:45 -0400
Received: by mail-pg1-f193.google.com with SMTP id s27so1699889pgl.2
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 12:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=aooip+kWJxLFJyvTQdfnMiqXuVARSg/BQD76gFdkiao=;
        b=wx/uWhK5+yfTepystjQ2YkC6otrYPFbC/x/pda4pFsEQBh3iaTxVjp86GM7kjW6z/4
         bNhTE1Pm8RdGVPFzJo+a3a7IExJHK3dr0OWCIPw/27PzoepOl32N5zAwpk3fR+j2VUhL
         DjZGMUIj/PWPkvxTJm8cYVmnf1dX+JGNJawAv9UyFLo3mUF8SaWty+r2YGkGODd4MZBR
         hyh9XvCnVMgIbA5C1ty35B8i7RdYOHI25fE3+wE3o93BXESmlPkIdKowVi5zkzKqG3Lx
         tKt+2v3sPvxFOeLSBnCOo2Tp5GM2fMk6yZKs7vxtyOxejk7sXGVOH/U68GQSXhen2wrl
         tI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=aooip+kWJxLFJyvTQdfnMiqXuVARSg/BQD76gFdkiao=;
        b=ilEz0fU72w5rn9Od/7bKgNfX5ARuxIAaeY2QRwPIHsRtmZrhk5LtoHVLchEJ0LNYVB
         dx2r+eBs4uE5tE7zW3tDv+0OKadi2yLlrEt2jmWlwgVJ2rBYc3c98iCV5TVG/IkWR2Do
         7cPLughP/mqiOgEwKcNkHnGxXQPRhDeRC+7fWrjIwLTOXglyncVG4GFLTlDyuceoud5x
         +w5n2vWbbXMS6JXP+CmlS+exQ3orIxnZeIQzwyJFhsKQ3ApqvaV49A2Yh7OULnSVNKeZ
         FYWTZdjNE1hNSPpClrnpd/AmEt3AgSHV+RFkNupunLCq1fhTkxUEI9v9zavLeoS62D89
         AbPQ==
X-Gm-Message-State: APjAAAVIu6drKo1Zot+5YGTy4myC8Y3i6bvQ/Dbt/UAazDSBaPQoynF+
        g5jVkZ8LD3/QOeGvmSgtJ1v0
X-Google-Smtp-Source: APXvYqxqgH24xGX/KDx7bfh7omWTueZWvVekD9k694CbKHhIt6GaoeEScEcolwsrGHYfYSfUKvrc4A==
X-Received: by 2002:a63:5d45:: with SMTP id o5mr39174199pgm.40.1562180564114;
        Wed, 03 Jul 2019 12:02:44 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:117:d72f:1d34:d0bb:bb4e:3065])
        by smtp.gmail.com with ESMTPSA id j14sm3631503pfn.120.2019.07.03.12.02.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 12:02:42 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/3] Add IMX290 CMOS image sensor support
Date:   Thu,  4 Jul 2019 00:32:27 +0530
Message-Id: <20190703190230.12392-1-manivannan.sadhasivam@linaro.org>
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

Manivannan Sadhasivam (3):
  dt-bindings: media: i2c: Add IMX290 CMOS sensor binding
  media: i2c: Add IMX290 CMOS image sensor driver
  MAINTAINERS: Add entry for IMX290 CMOS image sensor driver

 .../devicetree/bindings/media/i2c/imx290.txt  |  51 ++
 MAINTAINERS                                   |   8 +
 drivers/media/i2c/Kconfig                     |  11 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/imx290.c                    | 845 ++++++++++++++++++
 5 files changed, 916 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt
 create mode 100644 drivers/media/i2c/imx290.c

-- 
2.17.1

