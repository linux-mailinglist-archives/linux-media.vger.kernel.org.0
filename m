Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D54AC58885C
	for <lists+linux-media@lfdr.de>; Wed,  3 Aug 2022 09:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237321AbiHCH6J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Aug 2022 03:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235626AbiHCH6I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Aug 2022 03:58:08 -0400
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E73D29C90
        for <linux-media@vger.kernel.org>; Wed,  3 Aug 2022 00:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2395; q=dns/txt; s=iport;
  t=1659513487; x=1660723087;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xe++4vAn3h0LtSTvZklJQu2txzYoqZWJulAMWepupx0=;
  b=c34MvVxCFSC2EWmpCQaeFOQYf41CRfYJP+MOoQdSQNDgUPQJJbPxeu7Q
   pCc/xinRyCeeV+3fQ+foHyIjow0OwaN+ZjYKoEuvzZ/SiS/RA1za/KhbT
   rQo9mmrBfoBoMFz20ExQNxzIkoFrRueQ+0QpihSXX+oKzHtPrNClwuKMY
   8=;
X-IronPort-AV: E=Sophos;i="5.93,213,1654560000"; 
   d="scan'208";a="3325130"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 03 Aug 2022 07:58:06 +0000
Received: from office-260.rd.cisco.com ([10.47.77.162])
        by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 2737w5S8024084;
        Wed, 3 Aug 2022 07:58:05 GMT
From:   Erling Ljunggren <hljunggr@cisco.com>
To:     linux-media@vger.kernel.org
Cc:     Erling Ljunggren <hljunggr@cisco.com>
Subject: [PATCH v2 0/5] Add the cat24c208 EDID EEPROM driver + new EDID capability
Date:   Wed,  3 Aug 2022 09:58:45 +0200
Message-Id: <20220803075850.1196988-1-hljunggr@cisco.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.77.162, [10.47.77.162]
X-Outbound-Node: aer-core-1.cisco.com
X-Spam-Status: No, score=-10.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

