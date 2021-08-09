Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA3EF3E4F9B
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 00:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236947AbhHIW7U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 18:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236944AbhHIW7U (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 18:59:20 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12AA0C0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 15:58:59 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id c9so23457178wri.8
        for <linux-media@vger.kernel.org>; Mon, 09 Aug 2021 15:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2qpz+5CZQ5slWEiCXKyUiyi2ip1K+0H/HeG0p4Nc+vI=;
        b=k+MLtW2fT6khGirz6ynPoyObnoraBPTOvCMjU1KUabbtICMhBXpssb+HITxq6IUwve
         zHbaiqO/81GhYU5zT2VnkRZR2/+DWd5GVBKwQKDgAVwBmANHIQP7NwdX9yv2LQbVlZEe
         SnT2Cv0y3OyBX+K4wDlHVq7Dzao75kCd7eyq0CGIUCHYzUXgfof31ljlZs/nHfRg9faG
         trWV7pdSPvd4c6ov2uxcNmjUyCbChS5/rPqn6NupmhslW8soq/dIpluKnBBhxWpFYHy2
         hi3Cs/B4rTI2q5eErOUJzgn8VZw19mTC7akD9gGNiPomdAB6vuwfGiZP+g2CjXwIf0LF
         fvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2qpz+5CZQ5slWEiCXKyUiyi2ip1K+0H/HeG0p4Nc+vI=;
        b=RSraf8d+/eTNnnCFekMkm/HRCKpezy/3/cX3/hikXHPGjvLNImsJlJ0vm32H55wtDg
         wgvWGDuZZWTa42bJqudAxW1hhXkuAsHFTkcTEa0Vqo9QBdE2rUPHZJ/yOq4+eJjIWStH
         QPVCFs0/EkzDtDXFcp+eFpV1F2dAsDbeSjev8WY30LGM36Z0MhdNydjS3Uif2xP2ZpZv
         Pv9nLdRQTaOtQIn1SlFQtsHN+bRKz3vHD/1gfzQ7HBPoBCnds+tHy9y8QYLAksiP8JJX
         30MtIyJdm33r9wmsqB5tG1mwMdwlylLowhFdy48z2TqskvRRywzkkoJd67AyZwNtCK5A
         6NYA==
X-Gm-Message-State: AOAM530hZZhaQnXufCmZn++HIUWnlneag1uBV4cqevETx2UpjCTB2aoC
        V02ObDB5DPaZwScMJFnSwVs=
X-Google-Smtp-Source: ABdhPJyCFeqyfi5HWFfni6TYeCG5coS3ZghS6MxcRVyTSEEvQCtLV9ZIommY4Qy2QTLX2E8gSQT9YA==
X-Received: by 2002:adf:d085:: with SMTP id y5mr27102612wrh.272.1628549937651;
        Mon, 09 Aug 2021 15:58:57 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id v12sm20437957wrq.59.2021.08.09.15.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 15:58:57 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     djrscally@gmail.com, sakari.ailus@linux.intel.com,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v2 00/12] Extensions to ov8865 driver
Date:   Mon,  9 Aug 2021 23:58:33 +0100
Message-Id: <20210809225845.916430-1-djrscally@gmail.com>
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

	- Dropped a patch removing unused Macros from the driver.

Daniel Scally (12):
  media: i2c: Add ACPI support to ov8865
  media: i2c: Fix incorrect value in comment
  media: i2c: Defer probe if not endpoint found
  media: i2c: Support 19.2MHz input clock in ov8865
  media: i2c: Add .get_selection() support to ov8865
  media: i2c: Switch control to V4L2_CID_ANALOGUE_GAIN
  media: i2c: Add vblank control to ov8865
  media: i2c: Add hblank control to ov8865
  media: i2c: cap exposure at height + vblank in ov8865
  media: i2c: Add controls from fwnode to ov8865
  media: i2c: Switch exposure control unit to lines
  media: ipu3-cio2: Add INT347A to cio2-bridge

 drivers/media/i2c/ov8865.c                 | 334 +++++++++++++++++----
 drivers/media/pci/intel/ipu3/cio2-bridge.c |   2 +
 2 files changed, 282 insertions(+), 54 deletions(-)

-- 
2.25.1

