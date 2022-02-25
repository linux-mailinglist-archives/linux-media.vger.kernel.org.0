Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47BF14C3A1E
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 01:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234016AbiBYAIw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 19:08:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232259AbiBYAIt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 19:08:49 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C5014A236
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:16 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id v2-20020a7bcb42000000b0037b9d960079so781686wmj.0
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=laBbjVEP+uNG+rNLENt9GcCrKPZsIThjKehEMryac/c=;
        b=Tf8Jd++j71ScoLsDeOewIpkeCb4VY9OOHh7WTAlshVO/UAdSFcznp6f08kux1LrCeL
         XTle1dzbEr5NZomFWBZb2EPBPutnX4nqmuQGXFhlLS97KWZQ2KN7GK0ZCeNesoUjWNYK
         03ABc4TnY2R3zg2sY4mE4pSlr0hmMyk0EoH96k/RyHnd9pbze8u8m0JVm/hzIzNHGsvR
         FSftLEsbllnjcWit8L9X5wjhNUyvWDMvuZVj2UKYwUMNQCDgd3d/qVRxJ6UiQ2tFyRRM
         rItzl4sN2JylmAGcK3NoJmZKi7G3SfPtyyefPUgearohbjCiBwJYWynidTbm6/s4IDRq
         k9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=laBbjVEP+uNG+rNLENt9GcCrKPZsIThjKehEMryac/c=;
        b=FxtX+8OntZgb7+BlE3tNL4PUHgT1PjaCeOYyPpq237bXJ7cg16Z/dyblbYJu8i0Ye0
         CdHBtErL6ksVirEtxTDgnraifbdfrJMJg8sXFNvwS37JczEBupeDpLKrh7yQjYfpw+lA
         9ZgRC1aPREuis9XraJk/vwIcu/+kJjXoLfWt3IuuGuaDbq1jHwAZ6k8rCYlySSVEuvoT
         0qtfB4WIG5OzfUwlkM9IG0TPzvxBekBpkj0htPPhjcrMJN93EXZrr0ybx7T3yk5Q3d8o
         xgpobUl3kMvXXAOodXCu66ftGwzfta3ppql0T4smZMaRlswokybCCMArVflMsO3vpFK3
         r9GA==
X-Gm-Message-State: AOAM530JzKRhekJYiF4g9dsMOaOt9OnLE3kmH1Ckz042HZuZT8LZJZ91
        dqlQ8h/+ozGApeo+qjTl7Fb78M2tI2T2Ag==
X-Google-Smtp-Source: ABdhPJzHqo6zEGur6R21EqmTLSk3B5vFGhJ+BEhRBzQjkNfd8JgzbSrbpfDgQJBBSSp+eq+IkGjLdA==
X-Received: by 2002:a1c:a382:0:b0:381:cfd:5564 with SMTP id m124-20020a1ca382000000b003810cfd5564mr366352wme.103.1645747694968;
        Thu, 24 Feb 2022 16:08:14 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id a3-20020adfe5c3000000b001e68a5e1c20sm742668wrn.4.2022.02.24.16.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 16:08:14 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v2 00/11] Support OVTI7251 on Microsoft Surface line
Date:   Fri, 25 Feb 2022 00:07:42 +0000
Message-Id: <20220225000753.511996-1-djrscally@gmail.com>
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

	- Added patch 5 removing per-mode frequency settings

Thanks
Dan

Daniel Scally (11):
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

 .../media/v4l/pixfmt-yuv-luma.rst             |  14 +-
 drivers/media/i2c/ov7251.c                    | 565 ++++++++++++------
 drivers/media/pci/intel/ipu3/cio2-bridge.c    |   2 +
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   7 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   3 +-
 6 files changed, 412 insertions(+), 180 deletions(-)

-- 
2.25.1

