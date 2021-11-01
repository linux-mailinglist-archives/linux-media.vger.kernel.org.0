Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE4E441192
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 01:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbhKAAN7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Oct 2021 20:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbhKAAN7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Oct 2021 20:13:59 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C53C061714
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:26 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id o14so25682306wra.12
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b0qRVqa5zz7w+w6UNXK374+6GWiKeKtGgGRHM5b4ZOs=;
        b=IjFRZoiSdA6ZfxuCPleYZuN/rvkHjDf2/CdfWjdJs5bLsHWstwapHyu/NXUfOncjnC
         cqKENAlZgtlmezvm1Kv3byPtQslb1la89MRMUQmSQq2lpLQGxEak4EZzu5y5RoYCHRmA
         f/6MtoGTNH81s/wbbzBYl8zOpOV+ELT/NUJmzHfDKt5qL6D9pJneLrWhfuD7VtDnvnzk
         OcguDCV5j2NN46ZXLVIZJs3SbRDznbE7z2RmcevnbYvmD8E8w54beXiVUKC0S7P4YH5W
         19qqP4xeJm8aHoBljdcKjDiZWCEz+u+QgFr7G08cUJZK/smwE9i7V5cXWwMiwxgCK6VM
         YgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b0qRVqa5zz7w+w6UNXK374+6GWiKeKtGgGRHM5b4ZOs=;
        b=B8UqokR9DbBePaTfiggOcslCKXvl3L7DWSSHxQDmvc4gGOHvGVEHsaf88PFmLbcaP8
         pv4CLL1rwUj/A8IiWM0Zdj3VKWiHmUbRPk3lwqWW/ChnzQUeVVOqu4pO6DYEcyJSlALC
         DDaWR8uorXOZeKeC/IgMz4AHpNLy0ScXKlqfwcQwJXLc6iHmXNMOZ6jX1YA+1oFSrLX7
         2NAoqvxAQ1rc9WjilYuB9RK7t7yUoHnKzo/OHpzEBa+Wr7XnkKAI7E/obh+LSKCCVrXm
         KkdwkuXfo7uMidx9aWoi+C1r4PpdmJoeE2FOPXtopHRtbwyvS6gbCeuSDLZkqd7jsNPz
         88XQ==
X-Gm-Message-State: AOAM533eyLoFb+UcoUXswlUZjeLy5daIbbyHyu4NPxtNOtW5mMbLW8Nz
        Sb6WGrpltaDIFgmOWWcSj1g=
X-Google-Smtp-Source: ABdhPJyieZXJIr3awpHdJ8CRT77KqvI8SaLVnMSQoOgwOTwBlEjwCF+gZluRJuY+pImmAiIDZetZGg==
X-Received: by 2002:a5d:6c6c:: with SMTP id r12mr33833040wrz.177.1635725484692;
        Sun, 31 Oct 2021 17:11:24 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id k6sm12557678wri.83.2021.10.31.17.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 17:11:24 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v4 00/16] Extensions to ov8865 driver
Date:   Mon,  1 Nov 2021 00:11:03 +0000
Message-Id: <20211101001119.46056-1-djrscally@gmail.com>
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

Series changes since V3:

	- Fixed a problem that prevented v3 applying properly due to the series
	being based on my WIP tree rather than a clean media tree. No code
	changes to the individual patches.

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

