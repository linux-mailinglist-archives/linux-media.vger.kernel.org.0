Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 432B8625B2D
	for <lists+linux-media@lfdr.de>; Fri, 11 Nov 2022 14:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233840AbiKKNaD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Nov 2022 08:30:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbiKKNaB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Nov 2022 08:30:01 -0500
X-Greylist: delayed 63 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 11 Nov 2022 05:29:59 PST
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7A0317420
        for <linux-media@vger.kernel.org>; Fri, 11 Nov 2022 05:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2395; q=dns/txt; s=iport;
  t=1668173399; x=1669382999;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JjDWV+oZk1DAoj6WsNXl8FUHGhpCryV0DX60cmHbNqI=;
  b=ZvMi6cZci3Z+YYymJsyAlpDl6P2JwXWWiaslF5pjy7CxgUPx3OjLZuxO
   WpPTKSt53NfynqG0zZbLzE2fZ+6Kj5w71PBdrhjbI18erDfVCRjiP8JZv
   l0xAxWlbNvqOMNki7uDqC9j9gEHLeN5E40RemSEYvc5r+be9gThXPf1hw
   Y=;
X-CSE-ConnectionGUID: CEgM4lN3Ti6XLWX0+XVSCg==
X-CSE-MsgGUID: u3UGAFkoQHeXGdZfoBmsAw==
X-IronPort-AV: E=Sophos;i="5.96,156,1665446400"; 
   d="scan'208";a="4860155"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2022 13:28:54 +0000
Received: from office-260.rd.cisco.com ([10.47.79.110])
        by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 2ABDSsVN020236;
        Fri, 11 Nov 2022 13:28:54 GMT
From:   Erling Ljunggren <hljunggr@cisco.com>
To:     linux-media@vger.kernel.org
Cc:     Erling Ljunggren <hljunggr@cisco.com>
Subject: [PATCH v4 0/5] Add the cat24c208 EDID EEPROM driver + new EDID capability
Date:   Fri, 11 Nov 2022 14:29:01 +0100
Message-Id: <20221111132906.2212662-1-hljunggr@cisco.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.79.110, [10.47.79.110]
X-Outbound-Node: aer-core-1.cisco.com
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        SPF_HELO_PASS,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=ham
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

v4:
 - update driver and bindings to support a video input connector phandle
 - use connector phandle to get HPD gpio and input label

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
 - sorted makefile
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

 .../bindings/media/i2c/onnn,cat24c208.yaml    |  46 ++
 .../userspace-api/media/v4l/biblio.rst        |  11 +
 .../media/v4l/vidioc-querycap.rst             |  11 +
 .../media/videodev2.h.rst.exceptions          |   1 +
 MAINTAINERS                                   |   7 +
 drivers/media/i2c/Kconfig                     |   9 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/cat24c208.c                 | 499 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-dev.c            |  15 +
 include/uapi/linux/videodev2.h                |   1 +
 10 files changed, 601 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
 create mode 100644 drivers/media/i2c/cat24c208.c

-- 
2.38.0

