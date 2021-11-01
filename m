Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBF5F4423E3
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 00:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbhKAXYg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 19:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbhKAXYf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 19:24:35 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 959F7C061714
        for <linux-media@vger.kernel.org>; Mon,  1 Nov 2021 16:22:01 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id d72-20020a1c1d4b000000b00331140f3dc8so825106wmd.1
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 16:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mksQzG4/t5F+05LjDt+bAjJOQGpEVAfh5TIYgNmTCus=;
        b=FfbR7S6fTmmWuCSU1dYnXeL2wUhDEgHdaJhQuScu7tbUrSOAUuI6DD2esqLRAufMve
         z/bdkl1BMxLgB17szwhk0BavOsZ878p80eSbOxHfWKjPreCOX38GZD1EgSClQJvZpB6t
         LRfQif72bYH1LXnPSvl71C8iPuPo1ozxAuTzMjW2kQiYHxfv+gfkrBcsIo2nfTEDxgBX
         jb/skY6RDVDYUVQvN6dbOZjeP6au+Ly1Um7geAihR0o3X37ebnkoNXl+bzPk7uWxl3RK
         PKLgMPgQQXT85gmK/sq0x0Y9GkauqLohdmuDZWNkBunykBj7Mfxg3GTj6TXJlr3C5XN4
         NPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mksQzG4/t5F+05LjDt+bAjJOQGpEVAfh5TIYgNmTCus=;
        b=YLH4a3xm0G8CAUsrcHaCfw8VPNMMAx8No3aUuHcyTBrZX2zGuS9pq2eQp2sKXdRuV8
         FhkN20AGMFLQ4Z2pC3Fa1B6gYOKCDzTAGd1rNjzM8SXL81ct3u8+gjDGF1zXSRT+VgmH
         QcrxvYIGjKcdjZk7DWevEvOw0zd3AIQNdnHO+GyoLddd9nACnuk5wu0IatKnglSczBO4
         pQsrXlBLv2jCFKb6WdFb4tte3Opwm8x6H4grxXSU4YXwTP2f9BVX7jb1yGo/Mcu2R1jV
         3veMy8njMtWGm3G6moRh3IsmmGMkg7sdseeY8j90atgE8hypmVtkOJVjXDQdAHHvtFkJ
         WieQ==
X-Gm-Message-State: AOAM530Ye8aBZpvQMWdo5Y92RcVvTrZtb/mGlPKCof62IUAkt7PCQ5ga
        nI6cleNvtc8EMIE8Bvyzhtf1t4gOtxY=
X-Google-Smtp-Source: ABdhPJxf8Cugtc5dzSfNqWRuBT0wT03kgu5eZE9W7LO0j0jKl6uyExVSoQcRgu8Rcq3rPscsOJy5sQ==
X-Received: by 2002:a05:600c:a0b:: with SMTP id z11mr2386839wmp.147.1635808920283;
        Mon, 01 Nov 2021 16:22:00 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l124sm763513wml.8.2021.11.01.16.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 16:21:59 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 0/5] Add support for OV5693 sensor
Date:   Mon,  1 Nov 2021 23:21:39 +0000
Message-Id: <20211101232144.134590-1-djrscally@gmail.com>
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

Series changes since v4:

	- Added 2 patches from Hans which are fixing some problems he spotted.

Daniel Scally (3):
  media: ipu3-cio2: Toggle sensor streaming in pm runtime ops
  media: i2c: Add support for ov5693 sensor
  media: ipu3-cio2: Add link freq for INT33BE entry

Hans de Goede (2):
  media: i2c: ov5693: Rename ov5693_sw_standby() to
    ov5693_enable_streaming()
  media: i2c: ov5693: Fix lockdep error

 MAINTAINERS                                   |    7 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov5693.c                    | 1542 +++++++++++++++++
 drivers/media/pci/intel/ipu3/cio2-bridge.c    |    2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   17 +-
 6 files changed, 1578 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/i2c/ov5693.c

-- 
2.25.1

