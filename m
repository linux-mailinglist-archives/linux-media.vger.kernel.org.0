Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 035D11F78F7
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 15:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgFLNyP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 09:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbgFLNyO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 09:54:14 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E33C08C5C1
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 06:54:13 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id u16so5523408lfl.8
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 06:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=3vT+wZ8ziAs7E5VUjyW0FBdqzQlsXKfHF9W52Q5ad+c=;
        b=zGmvAh/ZGt/vXHZt15aQA54OP1BiGscyEILqX9sLVHbugga06Px5iVZuHl/BgKZs2L
         iSTKyq49oQSV5KOjj7nsgIvgySsjzXLuMR0mB/nFxBXmcyMbmoqzc6MnBVPb2UE4ANcB
         mnRxBY9ltz2fprsMwW6CzkO3ZAXw8vULAqH3rM8mNjcfolBQZeEkLRG5IvIl0ucIm8Jy
         YokIBvSfG70XYCC7E0fo1iFGq/C8QZsTbHNkwguVhC4cYIvsK+vVLZHHIflOpGw95St2
         pPtTtNf1SBpUEVEZA2tMB9omveGeXag0P57aEqXK6yyQZ4Uhbo7f7F6Ztpr2NTdLl+5E
         oLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3vT+wZ8ziAs7E5VUjyW0FBdqzQlsXKfHF9W52Q5ad+c=;
        b=H9QlgnfM2WKwV+16hdc3HZNtOg5uHTcx4s36YvpuFxWtcCbvJ6DLAZu3EANmYPu8Ki
         XXXzlXNtnnRNJciM7ncyybY6zTE+yMRR+terd69WgJPO9NvMrGQEv9oc0AbBJW7auHFR
         vP05umDt9ejbtP3WaUS/BxJN6742P//jVLJRzRPbIcHrSVSRCXW73fdPvVESAbj2lWtM
         YKBfgTNaZ1OywzDz2jMnvdR8KZC6Oed2ybuhyQJ1+ll3fJlkAhg4jm/NY4ZDqEbVYO3c
         BTdWBeiTMnI0qeB2TlXARoJQYqeaKL/1WG1enULuas/ANfZlm+ufah4g7rKfhbQl0FrC
         FJ/w==
X-Gm-Message-State: AOAM533XAqysArWOjtfhFDYeqnUWvZPKp1K62tH17TiBDJCkPRAPDxOr
        ZMELsA6W5jH4rmwl0toi5rBVkQ==
X-Google-Smtp-Source: ABdhPJzm6BPlNgl41jkg6bQdqNLPtT3HfnpNXfIX/zwF/eepS4r0yWPRsSw2UAFyp0UmDO2to8svIQ==
X-Received: by 2002:ac2:4d25:: with SMTP id h5mr6879237lfk.87.1591970051731;
        Fri, 12 Jun 2020 06:54:11 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id a1sm2414415lfi.36.2020.06.12.06.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 06:54:10 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v5 00/10] Improvements to IMX290 CMOS driver
Date:   Fri, 12 Jun 2020 16:53:45 +0300
Message-Id: <20200612135355.30286-1-andrey.konovalov@linaro.org>
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

Changes in v5:

* Fixed the "Possible unwrapped commit description" issues reported by
  checkpatch.pl. The "msleep < 20ms can sleep for up to 20ms" warnings
  are still here, as sleeping for 20ms when the imx290 driver calls
  msleep(10) is fine

Changes in v4:

* The review comments from Sakari and Dave are addressed
  https://lkml.org/lkml/2020/5/24/294
  In particular,
  . HMAX values are included into struct imx290_mode. As the consequence,
    imx290_modes[] table splitted in two (one for 2-lane configuration,
    and another for the 4-lane one)
  . link frequency indexes are kept in struct imx290_mode to
    avoid using the width field as the key for modes table by
    imx290_get_link_freq_index(). These are still indexes, not the
    frequencies themselves: we need a separate tables of the frequencies
    for the V4L2_CID_LINK_FREQ integer menu control anyway, so the
    link frequency values should be better kept there (in one place)
  . imx290_modes_[ptr,num]() and imx290_link_freqs_[ptr,num]() helpers
    introduced to get rid of repeating lane configuration checks in the code
  . do_div() is used in imx290_calc_pixel_rate() to fix the build error
    on 32-bit systems
  . the check for the link frequencies listed in the device tree is
    reworked to handle multiple frequencies (vs removing the check entirely
    in v3)
  . imx290_enum_frame_size() is not changed since v3: all (of the 2) modes
    are supported for all the media codes. So the available modes / frame
    sizes have no dependency on the media code. The fse->code check in
    imx290_enum_frame_size() just guards against the codes not supported
    by the driver at all
* removed calling imx290_set_data_lanes() from imx290_probe(): the probe()
  calls imx290_power_on() a bit earlier, and imx290_power_on() sets the
  number of data lanes
* FREQ_INDEX_1080P/FREQ_INDEX_720P #define's introduced to make using
  imx290_link_freq_* tables a bit more error-proof
* the values in the imx290_link_freq_*[] tables are devided by 2: the
  previous ones were equal to the data rates which are twice as the link
  frequency

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

 drivers/media/i2c/imx290.c | 404 +++++++++++++++++++++++++++++++------
 1 file changed, 343 insertions(+), 61 deletions(-)

-- 
2.17.1

