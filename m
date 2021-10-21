Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9FA436CE5
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 23:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbhJUVqO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 17:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbhJUVqN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 17:46:13 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F473C061764
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:43:57 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id r10so1576900wra.12
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U9Q6+FzDKl+dqL6m05FdZSWdYB/9XZcdNVEVInKc3DM=;
        b=C0YOW/8a16q9IvDNAWLYO6xUR++bYIIzD0q8E1l944yr4pJWwASZbRsxguz6nUS93j
         AbT+k/496eQo8GaRz0TbT6kGHGXxmi51L4zxRLwglIneGAcgsbqui3qCWLobxJhxwInj
         6/WgLz7uta+nGeFh8IUt7T5bUXcLnaVdGS0kYUcHcjiMK26vAhhiwV9LoMCYpXyg47vW
         wI8jG+P+e45dsDOT5ScQ3lRr//6vJizCqhW/w+ID4h3395ztp+RDs6nbnzoeMfnTSA5n
         NmgRpnD7DRgN9gYq32mMrw6OAD7SrMpyULUTCJBeURpQ3NBmRH3Xj4apZp21x1WN7CMh
         w6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U9Q6+FzDKl+dqL6m05FdZSWdYB/9XZcdNVEVInKc3DM=;
        b=UfpNH4Hyie6w0alhGw0h5qqLI1keJVTOUTv3Za1jahVn/LmhkTgO1U06SuMbdntOdb
         DsVaGYgJhWweZogKyIH3IGsCQAlr5UCssYyW71xnpv6px6uCrWP78ig4GjXQnrgzuTjP
         U8/kNUNTOj04lVckVGGyPyqJtZ+XWtuulaWoCs52YHP4DrruKfwKuIt2ehoe1vc9EB0u
         DXw/KzIY70wrG9q8MzglxxDNowCleTU6WNjpjH0q1ZtemAtVhwz2IOVlo0Qo1FNEpv1x
         F+2EWClSypLCpCvu7+oGWUCtuawQLSjyI/xAwhmM4UhHW5Hm/Ol6QFq00FNiZSHSQmhq
         HfQg==
X-Gm-Message-State: AOAM532c8W2UUdtC9KABkHj04DhdqtavSlcvQy+xQ0BoXHkloDE977nz
        k96WgWX5Kt9VHJJCOG74gQq/ABb0xBY=
X-Google-Smtp-Source: ABdhPJxBlG8G8UCkUSX6qM/8cdY5VNEIm7ITmK/uAKfqaVk3VY7e9xdNaJtP3zwVS93stkQ4/lWaNg==
X-Received: by 2002:adf:f9c5:: with SMTP id w5mr4601083wrr.82.1634852635731;
        Thu, 21 Oct 2021 14:43:55 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id r205sm6378507wma.3.2021.10.21.14.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 14:43:55 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        hdegoede@redhat.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v3 00/16] Extensions to ov8865 driver
Date:   Thu, 21 Oct 2021 22:43:15 +0100
Message-Id: <20211021214331.1188787-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all

This series extends the ov8865 driver with:

* Support for binding to ACPI enumerated devices.
* Support for a 19.2MHz clock in addition to existing 24MHz clock support
* Another v4l2_subdev_pad_ops callback
* 4 more V4L2 controls
* makes the driver supported by the cio2-bridge

There's also a little bit of tidying that I did along the way.

The series is tested on an MS Surface Go 2.

Thanks
Dan

Series changes since V2:

	- Added a patch changing the HTS values in some modes to be >= the
	value for output size x
	- Added a patch re-ordering calls to pm_runtime
	- Added a patch using dev_err_probe() to avoid error prints when the 
	driver defers probe.

Daniel Scally (15):
  media: i2c: Add ACPI support to ov8865
  media: i2c: Fix incorrect value in comment
  media: i2c: Defer probe if not endpoint found
  media: i2c: Support 19.2MHz input clock in ov8865
  media: i2c: Add .get_selection() support to ov8865
  media: i2c: Switch control to V4L2_CID_ANALOGUE_GAIN
  media: i2c: Add vblank control to ov8865
  media: i2c: Add hblank control to ov8865
  media: i2c: Update HTS values in ov8865
  media: i2c: cap exposure at height + vblank in ov8865
  media: i2c: Add controls from fwnode to ov8865
  media: i2c: Switch exposure control unit to lines
  media: i2c: Re-order runtime pm initialisation
  media: i2c: Use dev_err_probe() in ov8865
  media: ipu3-cio2: Add INT347A to cio2-bridge

Hans de Goede (1):
  media: i2c: ov8865: Fix lockdep error

 drivers/media/i2c/ov8865.c                 | 459 +++++++++++++++------
 drivers/media/pci/intel/ipu3/cio2-bridge.c |   2 +
 2 files changed, 327 insertions(+), 134 deletions(-)

-- 
2.25.1

