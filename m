Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C253C5EDB9E
	for <lists+linux-media@lfdr.de>; Wed, 28 Sep 2022 13:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232932AbiI1LWW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Sep 2022 07:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232518AbiI1LWW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Sep 2022 07:22:22 -0400
X-Greylist: delayed 63 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 28 Sep 2022 04:22:21 PDT
Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1644CDCE99
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 04:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2258; q=dns/txt; s=iport;
  t=1664364141; x=1665573741;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=a7Q5tAQ6AD2zhdI5S4TKzBvo4aJ0YRPO1H/u1eQfJlo=;
  b=b5K5HhvYm4ZEIjwR1OUjCuALoevaqhIrtgUr65gSTFtP1amRsZeGSKSr
   GMHkKQpVnY6DRSbQc59VCNYq6GUO8NxGyEZFrOtqxBvzV189lWbmHZ9tq
   43eMZe+26Sw1TJRdzNV+enwmrW0b0C6ggR+hmiy4nDYvDgb0mBYJnfae0
   A=;
X-IronPort-AV: E=Sophos;i="5.93,351,1654560000"; 
   d="scan'208";a="1511355"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 28 Sep 2022 11:21:15 +0000
Received: from office-260.rd.cisco.com ([10.47.77.162])
        by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 28SBLFek008487;
        Wed, 28 Sep 2022 11:21:15 GMT
From:   Erling Ljunggren <hljunggr@cisco.com>
To:     linux-media@vger.kernel.org
Cc:     Erling Ljunggren <hljunggr@cisco.com>
Subject: [PATCH v3 0/5] Add the cat24c208 EDID EEPROM driver + new EDID capability
Date:   Wed, 28 Sep 2022 13:21:42 +0200
Message-Id: <20220928112147.358745-1-hljunggr@cisco.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.77.162, [10.47.77.162]
X-Outbound-Node: aer-core-1.cisco.com
X-Spam-Status: No, score=-9.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for the standalone cat24c208 EDID EEPROM i2c device.
Usually EDID support is part of an HDMI receiver, but this is a standalone EEPROM.

Note that EEPROMs for EDIDs are not regular EEPROM devices, these are dual port
devices that follow the VESA E-DDC standard.

Since this is a standalone device that does not capture any video a new
V4L2_CAP_EDID capability is introduced to represent such devices.
Note that such a device doesn't have to be an EEPROM, it can also be
implemented using a microcontroller, for example.

v3:
 - use old V4L2_CAP_ASYNCIO (0x02000000) capability bit
 - validate physical address of edid in driver
 - handle empty edid in driver
 - add cec notifier support to driver
 - update driver and bindings with hpd gpio support
 - removed references to "memory" in capability and docs
 - associate ioctls based on device direction

v2:
 - fix dt binding example
 - rename i2c client variables in data struct
 - fix include: of_device.h -> mod_devicetable.h
 - Sorted makefile
 - used define EDID_OFFSET_EXT_FLAG instead of magic number
 - removed of_match_ptr
 - added bus_info
 - remove unneeded headers
 - add depends on OF to Kconfig


Erling Ljunggren (4):
  media: videodev2.h: add V4L2_CAP_EDID
  media: docs: Add V4L2_CAP_EDID
  dt-bindings: media: add cat24c208 bindings
  media: v4l2-dev: handle V4L2_CAP_EDID

Jonathan Selnes (1):
  media: i2c: cat24c208: driver for the cat24c208 EDID EEPROM

 .../bindings/media/i2c/onnn,cat24c208.yaml    |  48 ++
 .../userspace-api/media/v4l/biblio.rst        |  11 +
 .../media/v4l/vidioc-querycap.rst             |  11 +
 .../media/videodev2.h.rst.exceptions          |   1 +
 MAINTAINERS                                   |   7 +
 drivers/media/i2c/Kconfig                     |   9 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/cat24c208.c                 | 480 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-dev.c            |  15 +
 include/uapi/linux/videodev2.h                |   1 +
 10 files changed, 584 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
 create mode 100644 drivers/media/i2c/cat24c208.c

-- 
2.37.3

