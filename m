Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5EA2583DD4
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 13:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237005AbiG1LmC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jul 2022 07:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235799AbiG1Llt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jul 2022 07:41:49 -0400
X-Greylist: delayed 64 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 28 Jul 2022 04:41:48 PDT
Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3A6140E3
        for <linux-media@vger.kernel.org>; Thu, 28 Jul 2022 04:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2078; q=dns/txt; s=iport;
  t=1659008508; x=1660218108;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZgSi5/gcgB3+CnDCM11ERzKSg7Y2ZbZ6CbjmVYJK9nY=;
  b=iwr9zXJe4WKoVsfEVBcaOOpiXTv9yo2LTEPBW64HJTPMmp/HLAb0fwUv
   ly0TvJXVlo4umRhOQ2khSAeMCQZN9KaqJdCv97BuUa+vN/SzguKUQnZJy
   R1ycA8qN2VoTgcSNN9E/+j7sf/IjFQlS7mzq9qJYZztFAaLV/pYKTEmNh
   8=;
X-IronPort-AV: E=Sophos;i="5.93,198,1654560000"; 
   d="scan'208";a="612865"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 28 Jul 2022 11:40:42 +0000
Received: from office-260.rd.cisco.com ([10.47.77.162])
        by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 26SBegI1010979;
        Thu, 28 Jul 2022 11:40:42 GMT
From:   Erling Ljunggren <hljunggr@cisco.com>
To:     linux-media@vger.kernel.org
Cc:     Erling Ljunggren <hljunggr@cisco.com>
Subject: [PATCH 0/5] Add the cat24c208 EDID EEPROM driver + new EDID capability
Date:   Thu, 28 Jul 2022 13:40:45 +0200
Message-Id: <20220728114050.2400475-1-hljunggr@cisco.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.77.162, [10.47.77.162]
X-Outbound-Node: aer-core-1.cisco.com
X-Spam-Status: No, score=-10.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
V4L2_CAP_EDID_MEMORY capability is introduced to represent such devices.
Note that such a device doesn't have to be an EEPROM, it can also be
implemented using a microcontroller, for example. Hence the use of the generic
word 'MEMORY'.

The new capability uses the free bit 0x00000008. But we are running out of
capability bits: only 0x40000000 and 0x00000008 are free at the moment.

There is one other capability V4L2_CAP_ASYNCIO (0x02000000) that is not used
at all, it was never implemented. Wouldn't it be better to define
V4L2_CAP_ASYNCIO to 0, mark it as obsolete, and instead reuse it for this
V4L2_CAP_EDID_MEMORY capability?

Erling Ljunggren (4):
  media: videodev2.h: add V4L2_CAP_EDID_MEMORY
  media: docs: Add V4L2_CAP_EDID_MEMORY
  dt-bindings: media: add cat24c208 bindings
  media: v4l2-dev: handle V4L2_CAP_EDID_MEMORY

Jonathan Selnes (1):
  media: i2c: cat24c208: driver for the cat24c208 EDID EEPROM

 .../bindings/media/i2c/onnn,cat24c208.yaml    |  40 ++
 .../userspace-api/media/v4l/biblio.rst        |  11 +
 .../media/v4l/vidioc-querycap.rst             |   7 +
 .../media/videodev2.h.rst.exceptions          |   1 +
 MAINTAINERS                                   |   7 +
 drivers/media/i2c/Kconfig                     |   9 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/cat24c208.c                 | 421 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-dev.c            |   8 +
 include/uapi/linux/videodev2.h                |   1 +
 10 files changed, 506 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
 create mode 100644 drivers/media/i2c/cat24c208.c

-- 
2.37.1

