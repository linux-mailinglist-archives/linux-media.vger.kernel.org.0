Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70FE91E0247
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 21:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388185AbgEXTZc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 May 2020 15:25:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388177AbgEXTZb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 May 2020 15:25:31 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C2CC061A0E
        for <linux-media@vger.kernel.org>; Sun, 24 May 2020 12:25:30 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id w15so9340141lfe.11
        for <linux-media@vger.kernel.org>; Sun, 24 May 2020 12:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=XhMEpClAt+PfIQ8hr+BTzgcAeLpej4vtVsIBoCgk0eo=;
        b=fnypOXGv7rlaol6AuYJkXTQLV72KGeSUudg5L4No9mxAlzpJ3C6XqiaKk7aRKPYA7O
         8q4zXDIoYp6A8Um2W7XAw72Oi+JRFwF5pyayBOOWj4CaHqLkPq1poPE5+6b5p6CKdJHP
         1sWnJM1+g4ef+VYkH2HmR7X7LuAOTv5WENIVS9NkZVX/76PaL0f+pamQBDOkZSyV7H90
         /z+9SgJU5CQxLkelbL4KwR6DG58MoGvsNAxEd2CrYhv4SdMLK0psA1+QfF4a7grKoVOL
         Yw1199ehj7j95er4PtLXRPTc2BgOWgePZvxkwGX3bIJttyKlrNE2qTrdLezs6wUUIHJc
         k8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XhMEpClAt+PfIQ8hr+BTzgcAeLpej4vtVsIBoCgk0eo=;
        b=AuHcZQ6R6N8pAO7cwuAfgkAb6lOTNn9PYk4Uu92ZgFykPyaLnud8/z1BlJn5HX8LVN
         eFeATQepb6ertA3bsypTYjyr3Lq1TYQP/z/NlOyjb8XPoKWOENf0qrKuJdh/IxLz4zqp
         VmMyR7M4uWqVWuLMvfGVdeOBP6H1PJb+Vl6d5CnkMLVPpQHCpHwPKrQDftboPOcFxurA
         BVqKXn+ErzB4QteBPkXjMahIIiiclhnn011qqCVSzDGXAzrM38Yib9TlLzV63ZZuUwRX
         QqlnmavItUwjUFHzDnaNosCJuWbdYrk5g7GVDGdjDHjVOICIyXlRkS4Fq4rYDLeNnfWi
         YsFQ==
X-Gm-Message-State: AOAM530e/5AsflQqhGmm+PnbQU9UeCGAOgbV5kNmTaAXayS4AuGsYWtp
        3roaTqq7WLrV8rnK/O5wYJH3YQ==
X-Google-Smtp-Source: ABdhPJxakEWM+ccUlpzVYyhXRAXmUISbly2mfW/PY88vHmfEHP6oj3oOO2LmhhCAz9H58mliNHM5rw==
X-Received: by 2002:a19:7e15:: with SMTP id z21mr12730265lfc.103.1590348328855;
        Sun, 24 May 2020 12:25:28 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id v10sm3878137lja.23.2020.05.24.12.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 12:25:27 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v3 00/10] Improvements to IMX290 CMOS driver
Date:   Sun, 24 May 2020 22:24:55 +0300
Message-Id: <20200524192505.20682-1-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset adds improvements to the existing media driver for IMX290
CMOS sensor from Sony. The major changes are adding 2 lane support,
configurable link frequency & pixel rate, test pattern generation, and
RAW12 mode support.

The link frequency & pixel rate combinations depend on various factors like
lane count, resolution and image format as per the datasheet.

Also fixes for the following issues in the existing driver are included:
* the current_format field in the struct imx290 can be used before
  initialization,
* the reset signal to IMX290 isn't handled correctly,
* the bus_type field of v4l2_fwnode_endpoint structure passed as the
  argument to v4l2_fwnode_endpoint_alloc_parse() function is not
  initiaized.

Changes in v3:

* The review comments from Sakari are addressed
  https://lkml.org/lkml/2019/12/19/705
  As a part of those changes:
  . null ptr checks are added to imx290_set_fmt() so that it can be called
    early in the probe() function to set the default format, and to
    initialize imx290->current_mode and imx290->bpp - these last two must be 
    set before imx290_calc_pixel_rate() is called when creating the controls
  . setting imx290->bpp removed from imx290_write_current_format(). Now this
    function only writes to the camera sensor registers. The call to
    imx290_write_current_format() is moved from imx290_set_fmt() back to
    imx290_start_streaming(): imx290_set_fmt() can be called when the sensor
    is powered off, and writes to the sensor registers would fail.
  . in imx290_set_ctrl() in the 12 bpp case the value the BLKLEVEL register
    is restored to when the test pattern is disabled is made consistent with
    imx290_12bit_settings[]
* The "IMX290 sensor driver fixes" patchset included
  https://patchwork.kernel.org/cover/11407347/
* Added a patch to set the bus_type field of v4l2_fwnode_endpoint structure
  before calling v4l2_fwnode_endpoint_alloc_parse()

Andrey Konovalov (4):
  media: i2c: imx290: set the format before VIDIOC_SUBDEV_G_FMT is
    called
  media: i2c: imx290: fix the order of the args in SET_RUNTIME_PM_OPS()
  media: i2c: imx290: fix reset GPIO pin handling
  media: i2c: imx290: set bus_type before calling
    v4l2_fwnode_endpoint_alloc_parse()

Manivannan Sadhasivam (6):
  media: i2c: imx290: Add support for 2 data lanes
  media: i2c: imx290: Add configurable link frequency and pixel rate
  media: i2c: imx290: Add support for test pattern generation
  media: i2c: imx290: Add RAW12 mode support
  media: i2c: imx290: Add support to enumerate all frame sizes
  media: i2c: imx290: Move the settle time delay out of loop

 drivers/media/i2c/imx290.c | 358 ++++++++++++++++++++++++++++++-------
 1 file changed, 297 insertions(+), 61 deletions(-)

-- 
2.17.1

