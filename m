Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D60C34273FF
	for <lists+linux-media@lfdr.de>; Sat,  9 Oct 2021 01:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243722AbhJHXHU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 19:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbhJHXHU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 19:07:20 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39268C061570
        for <linux-media@vger.kernel.org>; Fri,  8 Oct 2021 16:05:24 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id m22so34182074wrb.0
        for <linux-media@vger.kernel.org>; Fri, 08 Oct 2021 16:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CMcvnYaJsbEtFQxn60DrbdQiZqQMu32jlZ3MJoK8nCY=;
        b=N2f6YT0NgOCaxBpqxU+V2c1zhFAjEubyH3JM5IBIsmv8yeAjsq9FzBaEoPSYKcUlBO
         vW8cSJjxfMcEA4DHMlIHyBPvR7daDAl27o9nBz4yQ/SdtL5a7+tQ2mzs4iJyFTfweKnE
         xhtm/5+xcbvORMpamLsoaMeJBMv1sW/67UzjYvHeflrJTLt4J/Ny3wZHGNNHEv48pdi6
         oxee9DSSH53XzD4jDwweJX3cdeLOs8aL4dxOhzl4kGU2PKF6xpXJZQV20OPcn6nZKl8x
         hpTfLw44vqZsDrfw+ZctKOD+ehyI81d8H0skEzwE3TYVCVIycaJpQW95hBPVDlq0C6bc
         d/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CMcvnYaJsbEtFQxn60DrbdQiZqQMu32jlZ3MJoK8nCY=;
        b=5mTWMGPnAYKxcvCdL6FGzn96cmfwwx/6frRExJ6suYhqQ2auoE2CwtQuksfIKRy8ks
         X6wyyThHFBGhxmR024l7mjMa8uLEAWwHhbK6RfyNvVzOQHLrE5zsEyBhNhVyhRCGI9Bp
         JB5eBR5/zgdfo4Grv4V1WHF19BafJ0wy5LD80inJ2lFhjun+t5/AzhdMRn/yMJCGUkrs
         C478YTUwgeLZsJ5hnVE4z6QyLge6o7Ib/6pHuqDezapw0lm5yKgynWLu1qnuclrGVNGU
         FPEKf0I3p55d0li7vL2ZG1vCN+7KeRufJetIY76c9gCE7i/OpqTAj9/irhvsn89qaMVB
         mpoQ==
X-Gm-Message-State: AOAM530hL7gfECndcRv1Jxmp1xkKrw1FC/im6YWZYCj8ZY8v3M/I8NyK
        jE2kjkCqebD3kKreZayRgzbqUKV7LSM=
X-Google-Smtp-Source: ABdhPJwCahW5NNNVOsGjLIX8mQzrfCnQeEdLiZ49mItbSkMTg88ZyvG85iL0GEVUBlAQpa7LUcM41g==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr7777686wrb.77.1633734322862;
        Fri, 08 Oct 2021 16:05:22 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id y11sm679267wrg.18.2021.10.08.16.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 16:05:22 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v4 0/3] Add support for OV5693 Sensor
Date:   Sat,  9 Oct 2021 00:05:12 +0100
Message-Id: <20211008230515.417451-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all

This series adds support for the OV5693 sensor found as the front camera in
many Microsoft Surface devices, along with a number of similar style laptops.
It is a heavily adapted derivative of the atomisp-ov5693 driver in staging,
which retains most of the global register settings and some of the other
functions from that driver, but otherwise uses the "normal" v4l2
infrastructure.

As we're targeting libcamera, all mandatory, recommended and optional controls
for that library (at least, at time of writing) are supported.

Series changes: a new patch adding the link frequency for this driver to the
cio2-bridge supported-sensors table so it'll be added as a property against
the sensor's firmware.

Daniel Scally (3):
  media: ipu3-cio2: Toggle sensor streaming in pm runtime ops
  media: ipu3-cio2: Add link freq for INT33BE entry
  media: i2c: Add support for ov5693 sensor

 MAINTAINERS                                   |    7 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov5693.c                    | 1532 +++++++++++++++++
 drivers/media/pci/intel/ipu3/cio2-bridge.c    |    2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   15 +-
 6 files changed, 1566 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/i2c/ov5693.c

-- 
2.25.1

