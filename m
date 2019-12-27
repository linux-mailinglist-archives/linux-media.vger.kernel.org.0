Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 859F012B484
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2019 13:22:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727221AbfL0MWJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Dec 2019 07:22:09 -0500
Received: from mail-lj1-f182.google.com ([209.85.208.182]:42423 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbfL0MWJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Dec 2019 07:22:09 -0500
Received: by mail-lj1-f182.google.com with SMTP id y4so12630100ljj.9
        for <linux-media@vger.kernel.org>; Fri, 27 Dec 2019 04:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=U8Ue5vhLnmgWcERuYYynEzv1XucZwapNJFZkmMkgenw=;
        b=D60nQnW3XJ03QmjGKNvwm5kDyZo7gjLV8XVCr1xiU8Nterp03sJrM23/f2WNEl5MUr
         oLxBWh658v70RqAjRFLoUX9qqE+d6Ap2WfxLpbLVedudKT+5svBjFPcQQ0FIq+yjy0lm
         lgkK377s8MOsgr+X/LMNrwOn1T/hvVX1SHsq4AKaVoVz2NBFkqAE6xd26va89FI2DGly
         BBPTIF/m0ZuRiI7ecAWqYfQqE1ovcMHFsSJROELcCNhBf0ZYqzm5wHfkfc3B1rgw70N1
         D+PdQFdIHIQ3xi+o04yaSOrBGrBIVJpZIrB9nba15gHd+GqKAva+4fz9xcchNRsoOjpi
         QHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=U8Ue5vhLnmgWcERuYYynEzv1XucZwapNJFZkmMkgenw=;
        b=Pf2RM4hr82w2eukJ1rNlGS4Cy0RxXrDuBBFyp3jjJGb4P+rAk+aKIUeDmuLyZh4I/y
         DE0jBBOCKpdEMv5Rg08MdzjF2w2ZO8UHztdoovvfbk7IAlZcQW33VwUIgOOHNGTRRG0L
         LlPDjZnot8ZF9Xp4gxHpy1vmTiIyqrdrJslsLukTKsZCBkbXTPEFJN8V2hPiZPbO/Uu9
         HWa/2rKgDDpv8WW612j6ygRj6I+Vp5Wycjgj5+qZNozLgOo1B5fUInbPrfVuYDywggAf
         1k8jfh7UPD2CuaAxf9Vhacof3yDXjAguqjeJ6Jz1/MXhjk0pT+eqs7plaPDRsEZcKlSn
         xYmg==
X-Gm-Message-State: APjAAAV7bAfANPnQ+sWrEcgqNsqw0FOhjRTVADlyMtrgfGroY1bM8r13
        7/Q2CtEwFimFpiW3KOWoGN76uA==
X-Google-Smtp-Source: APXvYqytvqDzcMovvIcyLMEhiHEwdmISb5T3xkVUkTm9lXIKfTAlYpwVJxZYFlpVT448cbRGS7d5Hw==
X-Received: by 2002:a05:651c:282:: with SMTP id b2mr27878285ljo.41.1577449327124;
        Fri, 27 Dec 2019 04:22:07 -0800 (PST)
Received: from TM-8481.Dlink (office.dev.rtsoft.ru. [62.117.114.130])
        by smtp.googlemail.com with ESMTPSA id x21sm13523692ljd.2.2019.12.27.04.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2019 04:22:06 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        peter.griffin@linaro.org, ezequiel@collabora.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v2 0/2] Add IMX219 CMOS image sensor support
Date:   Fri, 27 Dec 2019 15:21:12 +0300
Message-Id: <20191227122114.23075-1-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset adds support for IMX219 CMOS image sensor from Sony.
Sony IMX219 is an 8MPix, 1/4.0-inch CMOS active pixel digital image sensor
with an active array size of 3280H x 2464V. It is programmable through
I2C interface. Image data are sent through MIPI CSI-2, which can be configured
as either 2 or 4 data lanes, but this driver currently only supports 2 lanes.
The currently supported resolutions are 3280x2464 @ 15fps, 1920x1080 @ 30fps
(cropped FOV), and 1640x1232 (2x2 binned) @ 30fps.

The driver has been tested with Raspberry Pi Camera Module v2 connected to
Raspberry Pi Zero W.

Changes since v1 [1]:

dt-bindings:
  - license updated to (GPL-2.0-only OR BSD-2-Clause)
  - non-standard 'camera-clk' property has got type, description, properties,
    and required
  - 'clock-lanes', 'data-lanes', and 'clock-noncontinuous' moved to the correct
    node, the syntax has been fixed
  - 'port' added to required properties
  - minor corrections to some other property descriptions

imx219 sensor driver:
  - fixed width variables replaced with '[unsigned] int' where appropriate
  - excessive comments dropped
  - imx219_get_format_code() returns 'codes[...]', and doesn't use an extra
    internal variable any more
  - initializing 'ret' to 0 in the beginning of imx219_set_ctrl() dropped
  - uses IMX219_XCLK_FREQ macro instead of hardcoded number
  - IMX219_REG_ORIENTATION is dropped from the mode_*x*_regs[] tables as it is 
    written by the control handler
  - imx219_stop_streaming() return value changed to void 
  - calling imx219_power_on() moved from imx219_identify_module() to
    imx219_probe(), and calling imx219_power_off() in the probe() error path
    has been added. This simplifies imx219_identify_module(), and ensures
    that the sensor is powered off after probe() and until streaming is
    started
  - comment referring to "xclr" pin changed to call it "enable pin" vs "power
    down pin" to better match the "OUT_HIGH" pin configuration

Thanks,
Andrey

[1] https://patchwork.kernel.org/cover/11284783/


Andrey Konovalov (1):
  dt-bindings: media: i2c: Add IMX219 CMOS sensor binding

Dave Stevenson (1):
  media: i2c: Add driver for Sony IMX219 sensor

 .../devicetree/bindings/media/i2c/imx219.yaml |  134 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   12 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx219.c                    | 1240 +++++++++++++++++
 5 files changed, 1395 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml
 create mode 100644 drivers/media/i2c/imx219.c

-- 
2.17.1

