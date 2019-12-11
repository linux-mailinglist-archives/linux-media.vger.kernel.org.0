Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66D9911AA41
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 12:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728947AbfLKLzF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 06:55:05 -0500
Received: from mail-lj1-f180.google.com ([209.85.208.180]:32835 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbfLKLzF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 06:55:05 -0500
Received: by mail-lj1-f180.google.com with SMTP id 21so23771366ljr.0
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2019 03:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=sSCSwi4tL2gSoLi0SB1Zb0lQ5xCfi5HKWemF61Tzx+I=;
        b=ncWJrcRfya3aIal/xfx31cPYnjb0jIANHRvoKxGWeiayZpfBfjfPnE0YYrDp+JP/JN
         JRHr306IHYr0vdzrfNvtB4WTzQ7S9PbhRNW1RPJgntYXI3WyAThd7TSxQp4uAo7ulRGt
         h05Bl/wxYCPYtVcSIqfTefh2I7YPluN2RYXGMhlZO9mjfRoiFRu4XBWvdeABW9tI0Woq
         cjZ5OfUgstaEa1kTM3LsFrs8YNJ1blG3lvQu1IwbKwggQUlCjTEliK7iJLW/1gXbQUQD
         LFntE3n5JEtD7k+Tx8H3JDEAdPIs8zDIsckDnLuuw6OBoCHWMGBmyjVmudymfWDbPA/T
         ROCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=sSCSwi4tL2gSoLi0SB1Zb0lQ5xCfi5HKWemF61Tzx+I=;
        b=ICC2FvwsYFTX+SeC5UHrNf+3ssUEUQN2Li5YOtO/8mgbE8Dyj9yuTmbpbH+nmYVeP5
         sj/9/L+2RItRnj588E0jGAXKkRhdvona0+M7NkSdfnE1EhsUZ1jVH9G7e1PlyaEvSnhW
         sfwBjJrxXlC82L70Xe4Nkxl/17aNMpLkOPJoSo/36mlopdXF+dUZbZiHaIzTrXDeL+Rb
         oBe3Y1kpdIOc4uM7jm1WYU9/0RvgppodEzl6fWKyhlkdYt/MTM7221PHP7FfLW7CNxHY
         HfxCtYrmcHspo0rN5utCi894YZhgX9jgHcbE17qD4pRFJa02cvaGHNnHCjdtzmBf8azB
         zrxQ==
X-Gm-Message-State: APjAAAVLUe9E4Hf5b0Z+fsCIpRjWtxlwkFvBxuh1+dnuU7LgnO/yFowN
        uKWknZwmZX6wsUeXqjN7SujQKOocWyg=
X-Google-Smtp-Source: APXvYqyxVqOz8Db6hEgBLl01dJ0CRuuTtPam3VcN0qN+qAyJOl2HJjGGT9tjrnbBw7wHJgPXct+Vdw==
X-Received: by 2002:a05:651c:327:: with SMTP id b7mr1765267ljp.22.1576065303308;
        Wed, 11 Dec 2019 03:55:03 -0800 (PST)
Received: from localhost.localdomain (95-28-65-22.broadband.corbina.ru. [95.28.65.22])
        by smtp.googlemail.com with ESMTPSA id 138sm1055875lfa.76.2019.12.11.03.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 03:55:02 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        dave.stevenson@raspberrypi.com, peter.griffin@linaro.org
Subject: [PATCH 0/2] Add IMX219 CMOS image sensor support
Date:   Wed, 11 Dec 2019 14:54:39 +0300
Message-Id: <20191211115441.10637-1-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset adds support for IMX290 CMOS image sensor from Sony.
Sony IMX219 is an 8MPix, 1/4.0-inch CMOS active pixel digital image sensor
with an active array size of 3280H x 2464V. It is programmable through
I2C interface. Image data are sent through MIPI CSI-2, which can be configured
as either 2 or 4 data lanes, but this driver currently only supports 2 lanes.
The currently supported resolutions are 3280x2464 @ 15fps, 1920x1080 @ 30fps
(cropped FOV), and 1640x1232 (2x2 binned) @ 30fps.

The driver has been tested with Raspberry Pi Camera Module v2 connected to
Raspberry Pi Zero W.

Thanks,
Andrey

Andrey Konovalov (1):
  dt-bindings: media: i2c: Add IMX219 CMOS sensor binding
Dave Stevenson (1):
  media: i2c: Add driver for Sony IMX219 sensor

 .../devicetree/bindings/media/i2c/imx219.yaml      |  112 ++
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   12 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx219.c                         | 1248 ++++++++++++++++++++
 5 files changed, 1381 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml
 create mode 100644 drivers/media/i2c/imx219.c


