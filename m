Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB1C9A33A4
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 11:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbfH3JT7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Aug 2019 05:19:59 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41713 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727326AbfH3JT7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Aug 2019 05:19:59 -0400
Received: by mail-pl1-f194.google.com with SMTP id m9so3090244pls.8
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2019 02:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=MO4FAsdSxcjZz9XUXbUG6G+n0aMjGeZSAkfHq2M0InE=;
        b=mB4OiYZrs6fA8SMC4/yow7KH/FEcJ+DUD2HdqIiWDf0i5RXXy0iuV333yVQySpoCEt
         kLMSaPWrhXK98sWf1l6nUxdyiisqXR0lvCbhs6jiax1wpUTYNGGf1WlmcUsghyXRSQ/r
         P8RcDykrrJ6RN1LPoLh2tOOQNP/cwZG+mVpYN36vdzIIARFtLhIV0s072z1u9fH4p4xf
         SuIRvHFJEt9H7zXyGjj8zaQNZjHMpq9B0HnNRS7W3dSMo6QzbylLnFG2U+dE08eJ5C9U
         xpVunDMIT+sOAaLg6j6nLaSX5Kh6kEymJOn1DAYjlWngKxrIDFriGdkha7fdJlBIVXjZ
         0gmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MO4FAsdSxcjZz9XUXbUG6G+n0aMjGeZSAkfHq2M0InE=;
        b=FIgrUTgj4Xz69XpVadoJMbs4ZjCkYxZIwW2siabuwUroe4iSwSSeGQ9PEfOpWJZeqB
         LtzVF8fW1JNoWKQ5h7FzEyQJL/3toqLKCA2Ao9M/vrbbRclmNCPasPPJ/c3D9/gjJa3O
         ZXenpXpov5/nRoh6EB43pVJ36i7WIBuBe9hWwaUrsWt8ucB5jp3Z3nYccN6OGQOU3d+V
         6+HqzroynFuFfryZg2sV3EbAACVTiNT7bgG4N5olkYvxXLSt7xb7G1V6s8/R6jezKCPD
         WE4V2skFz3+JggN+KThdCVRbqy79rhl857fN9rQfFDmj5+T46pkF0L4pToK+B9zNG7Vz
         BCUA==
X-Gm-Message-State: APjAAAV/z3rdhlXho0njRdoE7Hue415hIWwp6KRjxKWebno7JocnfLJj
        pr3/+8c7ESZuVqMH4/xIQ2hQ
X-Google-Smtp-Source: APXvYqwet7PSlkqIUyr0R1qYH0rq5kyhy+3t/vPHkgqfhzlLHiPco1D8+brDPe1ilWjwMyEX3aXUlQ==
X-Received: by 2002:a17:902:2bcb:: with SMTP id l69mr15006887plb.282.1567156798541;
        Fri, 30 Aug 2019 02:19:58 -0700 (PDT)
Received: from localhost.localdomain ([103.59.132.163])
        by smtp.googlemail.com with ESMTPSA id g202sm3142676pfb.155.2019.08.30.02.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 02:19:57 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 0/3] Add IMX290 CMOS image sensor support
Date:   Fri, 30 Aug 2019 14:49:40 +0530
Message-Id: <20190830091943.22646-1-manivannan.sadhasivam@linaro.org>
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

Changes in v3:

As per the review by Sakari:

* Switched to pm runtime
* Used link-frequency property
* Removed useless read calls from buffered read function
* Some other misc changes to the driver and binding

Changes in v2:

* Added Reviewed-by tag from Rob for bindings patch

Manivannan Sadhasivam (3):
  dt-bindings: media: i2c: Add IMX290 CMOS sensor binding
  media: i2c: Add IMX290 CMOS image sensor driver
  MAINTAINERS: Add entry for IMX290 CMOS image sensor driver

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

