Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1042B51B1EB
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 00:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379013AbiEDWe0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 18:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378987AbiEDWeT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 18:34:19 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 276C12B1A9
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 15:30:42 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id w4so3786136wrg.12
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 15:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FzK2W8CNT0lX5FWVe1kjOwhxaW1qkIGlxZ2dJN0pfJY=;
        b=RqEEaB0Vn5nOKVJMdBbqMsV3OTWEKJ3wd4rS9I4hWzIGbfWMy3BY6Jt0/wK/KvWXMq
         +mUAJfEdMYnaFXI27TbyX+c7VnaXb4xxO0mIX7hsj4x7nubZbxn6QIfc5ne/u9TTwkXi
         83pEhwAelmwE1uupQHaHzY/W7XSetQHK6t/UPaNZF7XwXh8sBHZvEL/KUShGfG+Intl9
         pw06cZpXIbIzMvVnyXHubeoGvm05SGvRkd8xMJr/j2w5q5oqmmYyedDs8Ko+5mKudDiI
         SatbGSRG8V4vbUlEHzcRhnUrYWCt4t5NzCUc767buZAEMuecFBbWgqZCATkDXYEBBE4p
         9GbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FzK2W8CNT0lX5FWVe1kjOwhxaW1qkIGlxZ2dJN0pfJY=;
        b=lROWtjrTcjDQBt3vk+HXyelTtTLq+KntopQZQ1LiwXx2O3e/0gzMO8LRsWDmvYvJvV
         Q7R1eWrns0+S+UrIWHfnFzxnkzyicXeSQ2U60LGnIPBJ/NPyV1a+GISt9X4xt0Ruvcu7
         L4Aq1IUTwUvGvvqSJ8W79Q4jH9jEqFvYBk+b81pCDPgNCVt4iCuN+sdQQ4bGyu2z6TZv
         0yjdUI0oFE91M/C4pE+3zqacrE4xmPmfwXIO/t6BZA9LwPKc9E7WPWn1kDywZRnsdBu2
         PVbGRd+mb03l3tnwdexwhUjLK4aYilupQuSfcmKUeXJzhUrE1zqv9Q9534ciBo1XvcTY
         FNPw==
X-Gm-Message-State: AOAM532XKfrJbj2FDYgrUL94PZt1zXg+bK0iIIyXZ6f61YSlQUfpv99B
        N4b8/yiDdZiyNo+3tPqGN3GEARNcjoI=
X-Google-Smtp-Source: ABdhPJzkoqQqScaWB7kducKbx6IyRl+KfDeQWcfSuNKKXXoEnPvQVelTBUETrwisSleYYRBjQh/iRg==
X-Received: by 2002:a5d:6908:0:b0:20a:d71b:f4af with SMTP id t8-20020a5d6908000000b0020ad71bf4afmr17119208wru.527.1651703440634;
        Wed, 04 May 2022 15:30:40 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h29-20020adfaa9d000000b0020c5253d913sm12501442wrc.95.2022.05.04.15.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 15:30:40 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v3 00/15] Support OVTI7251 on Microsoft Surface line
Date:   Wed,  4 May 2022 23:30:12 +0100
Message-Id: <20220504223027.3480287-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all

This series extends the OV7251 driver so it's functional on the
Microsoft Surface line of laptops, where it's used as the IR
camera for face login. The camera sensor is connected to a CIO2
device which packs the 10-bit greyscale data into 25 pixels per 32
bytes similar to the IPU3 formats for Bayer data, so I also added
a new format to describe that and added it to the ipu3-cio2 driver's
list of supported formats. 

Series-level changes:

	- Added patches 12-15, which extend the driver's controls to fulfil libcamera
  requirements.

Thanks
Dan

Daniel Scally (15):
  media: uapi: Add IPU3 packed Y10 format
  media: ipu3-cio2: Add support for V4L2_PIX_FMT_IPU3_Y10
  media: i2c: Add acpi support to ov7251
  media: i2c: Provide ov7251_check_hwcfg()
  media: i2c: Remove per-mode frequencies from ov7251
  media: i2c: Add ov7251_pll_configure()
  media: i2c: Add support for new frequencies to ov7251
  media: i2c: Add ov7251_detect_chip()
  media: i2c: Add pm_runtime support to ov7251
  media: i2c: Remove .s_power() from ov7251
  media: ipu3-cio2: Add INT347E to cio2-bridge
  media: i2c: Extend .get_selection() for ov7251
  media: i2c: add ov7251_init_ctrls()
  media: i2c: Add hblank control to ov7251
  media: i2c: Add vblank control to ov7251 driver

 .../media/v4l/pixfmt-yuv-luma.rst             |  14 +-
 drivers/media/i2c/ov7251.c                    | 749 +++++++++++++-----
 drivers/media/pci/intel/ipu3/cio2-bridge.c    |   2 +
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   5 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   3 +-
 6 files changed, 554 insertions(+), 220 deletions(-)

-- 
2.25.1

