Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0BFD3D2DB8
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 22:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbhGVTx5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 15:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhGVTxx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 15:53:53 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E9FC061575;
        Thu, 22 Jul 2021 13:34:27 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 9-20020a05600c26c9b02901e44e9caa2aso353995wmv.4;
        Thu, 22 Jul 2021 13:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tx8ZPWBW700bFwUyx7qtKVsIbaZOGXgCcXE9ZUxMfzM=;
        b=LeHqq2hHGMflnFXwR5kGzu0u0aqg7MD8JxIoHjHdB4r7RGiQlqQqC10mFQp2/kPDqo
         VNekDFQtxKwsgSqCYoXGyy+FCaTaItqQ3o65JXxQ2Tfnec2vf9gO1kvCMbSKeQyBV1wP
         xvYjdhgF3/rYwJbiAEgD39vsNxTkBAyUO41CJ//oM9j+AHiGAjL1K5CLK0RMf4lyHKyl
         T3Mscdj1g1hHbjeeGLj8TliB0HUbS5c/ylEH7kosZNLUamdInfnNasJxf8uk+0jUDbjc
         O1u70W441LZpow4UJox8vr5cOC9Qvz5LsLadE0OGi4AOZdkTJ8bFBK4sHCsF5zyreU6H
         4Hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tx8ZPWBW700bFwUyx7qtKVsIbaZOGXgCcXE9ZUxMfzM=;
        b=Ug8+IBtUL6KfH2yX6tp2lCG3mTedWfDMeTeth7JPwCKePRd+CHAiLA2UgoxtYSKHfX
         JFW9/VczigXl2WFmtHvDHsbi6NhS+V+tRe2V6w7W5YJBcsBV6KFes7IJQ3tEVZtVHvnC
         QIfylhseg3a/rRj6MfZtEesVYhW8KllXnG1SrR410nQChWnfBE7rY+HYOXMOPkbofrOK
         T4ZlAuq+aTB/54hplPFPDTRY/KdAPICDn7399JrfmsahLn4ZJBQv4tfnoCNMO7Qz/N2x
         iETVfxMIf99/ms0Tbe+mcNeDIazDT0BHtjPk3E4AWrGq/tlwMt7Srcqu3WgtV28ttvSv
         s9nQ==
X-Gm-Message-State: AOAM532U3UcqVhQ9w2/lf5ZsTJfjoFDBHnCVExP/rXx7W9oGa7F2l+oW
        wpW4I4tOcu7z9AgA9T+XJ0o=
X-Google-Smtp-Source: ABdhPJyAjrx2pbZhJT1gTn2THDPmykyU2XoSThfpWfZL/0l3KNkWVHLuKfevTxM+fY5i5CzNjnC4qQ==
X-Received: by 2002:a1c:f314:: with SMTP id q20mr10959082wmq.154.1626986065764;
        Thu, 22 Jul 2021 13:34:25 -0700 (PDT)
Received: from valhalla.home ([2.29.20.106])
        by smtp.gmail.com with ESMTPSA id b16sm31036455wrw.46.2021.07.22.13.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 13:34:25 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH 00/13] Extensions to ov8865 driver
Date:   Thu, 22 Jul 2021 21:33:54 +0100
Message-Id: <20210722203407.3588046-1-djrscally@gmail.com>
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



Daniel Scally (13):
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
  media: i2c: Remove unused macros from ov8865
  media: ipu3-cio2: Add INT347A to cio2-bridge

 drivers/media/i2c/ov8865.c                 | 465 ++++++++++++---------
 drivers/media/pci/intel/ipu3/cio2-bridge.c |   2 +
 2 files changed, 277 insertions(+), 190 deletions(-)

-- 
2.25.1

