Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB698324A
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 15:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729522AbfHFNJv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Aug 2019 09:09:51 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44982 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728560AbfHFNJv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Aug 2019 09:09:51 -0400
Received: by mail-pf1-f194.google.com with SMTP id t16so41462746pfe.11
        for <linux-media@vger.kernel.org>; Tue, 06 Aug 2019 06:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=N8P6BFsOop1K4eWiuZrjN6EJTn34oYRRKch8Go11cDo=;
        b=RGwMVnpzulBrHLjEt9tPbu30lO62P4BcdDb4BrorNxVv35JMEiyj1sYFXsulCS11wn
         wh9a3MUDL1nrPNHp2L8+Ap8UGJ+TIHjUuQQPlCfYP/k3lppoAEuA/M2W1DyCTGhHbYya
         RBVQz7S+zXj0cFqcEC9C3vK7rk+pyl5Bp4VTF7SU2F5x56UdDHWUcAhXR/2jE/q/iBVf
         eOaR/HdFKRT8gtJj8mJhgu5Uuee8Np2kXwt/TeGU57t6LnR+Joy10dK7RtVm0uJUG7kl
         z1N4VnY9Ik6DtLO9AzXz9vjhuyzpCPcu8X8rUnMOIhFIh6dNPZNcrgmMpH/LMc+TZWps
         Xi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=N8P6BFsOop1K4eWiuZrjN6EJTn34oYRRKch8Go11cDo=;
        b=gVzSuz0S+DgkqbqP4GeN0g8AcSmCR7qvA6hZmKm6w8o/lDvieDiQMBuK97Oljjzjq4
         +5P6QQCFRc7R0xX+uTHJx1D13HX3VtNtSqZ4JB/XUO6k5hXpm0vZPBw61OJCvcgbPZBG
         dYhHNr4B+OZVWRkgtZiU6VTeFrhv5LV+bLNGjZr0QHINuQj/Q4rRZm+eN43kUy5PXxJd
         6IH3VVbGjulLUc9BGfDzRcMxIUkLfb5JeQ0p8jWyrDO2wptX0ilGxu4REWei+G96LW+U
         YSs3BjBh00TtzUu6roufD6sSzvotMT1u8QAhKLc302sIzcl3GJmCBh6MUBPHWTX+zWnU
         OgNg==
X-Gm-Message-State: APjAAAXlob4XN+U403zscKK/+so9+Ws7wuyVqrk0xnTBqVceO4GuzG9Z
        CwcXCCto8YPvT2ZZqq4NI8Nw
X-Google-Smtp-Source: APXvYqypPfh5IkZ43BoV4ds6TppwLwnLqunFBQ3Z44724sReR5l6o8QdGcy0mOfyeaQtjvbkuF9hhg==
X-Received: by 2002:a63:c64b:: with SMTP id x11mr2960012pgg.319.1565096990514;
        Tue, 06 Aug 2019 06:09:50 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:7180:928a:153d:caa0:477e:f9fd])
        by smtp.gmail.com with ESMTPSA id v8sm73715371pgs.82.2019.08.06.06.09.45
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 06 Aug 2019 06:09:49 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/3] Add IMX290 CMOS image sensor support
Date:   Tue,  6 Aug 2019 18:39:35 +0530
Message-Id: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
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

Changes in v2:

* Added Reviewed-by tag from Rob for bindings patch

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

