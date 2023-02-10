Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 369FC6915FD
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 02:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbjBJBA1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 20:00:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbjBJBAL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 20:00:11 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 898036F8EB
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 17:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675990810; x=1707526810;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LXokKT5WpWCI0JGhUbitHdfziGa0b1e9QQ+R1q6OZNY=;
  b=FD65VJkti65NoRvdcTPvXlDYCqtWItKusd+dsCG8XSRo8/MLskN0gtFu
   e4GWaBGgNCARwt5LRWRPIIRe5X+ye2LVSR/42IoAyAd46feVMrTNRQYHW
   MklqnJjuBJit17bCpPAbQpY/MobyOE+XQU6glVcnZuo7oEWZjYwgw5dWD
   RLwtMGD66FnRTpHvXIbLbe6mQaq38IzP0u3YT4O8NnfnNE3XxdBBoyqeV
   rm5scgnxserVVq48bMbUManvt4sLcU3N1H1R0p9dr685j83UnbxSJ6yI2
   LED0jLkypWeYmlo2xaCr0aDyetgr8k+qK1SwkpFUBZPHEfKwTvbdcBtw6
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="313943356"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="313943356"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 17:00:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="667878076"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="667878076"
Received: from wentongw-hp-z228-microtower-workstation.sh.intel.com ([10.239.153.109])
  by orsmga002.jf.intel.com with ESMTP; 09 Feb 2023 17:00:07 -0800
From:   Wentong Wu <wentong.wu@intel.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        linux-media@vger.kernel.org
Cc:     srinivas.pandruvada@intel.com,
        pierre-louis.bossart@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com, bingbu.cao@intel.com,
        Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v1 0/3] media: pci: intel: ivsc: Add driver of Intel Visual Sensing Controller(IVSC)
Date:   Fri, 10 Feb 2023 09:02:18 +0800
Message-Id: <20230210010221.2466486-1-wentong.wu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Intel Visual Sensing Controller (IVSC), codenamed "Clover Falls", is a
companion chip designed to provide secure and low power vision capability
to IA platforms. IVSC is available in existing commercial platforms from
multiple OEMs.

The primary use case of IVSC is to bring in context awareness. IVSC
interfaces directly with the platform main camera sensor via a CSI-2 link
and processes the image data with the embedded AI engine. The detected
events are sent over I2C to ISH (Intel Sensor Hub) for additional data
fusion from multiple sensors. The fusion results are used to implement
advanced use cases like:
 - Face detection to unlock screen
 - Detect user presence to manage backlight setting or waking up system

Since the Image Processing Unit(IPU) used on the host processor needs to
configure the CSI-2 link in normal camera usages, the CSI-2 link and camera
sensor can only be used in mutually-exclusive ways by host IPU and IVSC. By
default the IVSC owns the CSI-2 link and camera sensor. The IPU driver can
take ownership of the CSI-2 link and camera sensor using interfaces provided
by this IVSC driver.

Switching ownership requires an interface with two different hardware modules
inside IVSC. The software interface to these modules is via Intel MEI (The
Intel Management Engine) commands. These two hardware modules have two
different MEI UUIDs to enumerate. These hardware modules are:
 - ACE (Algorithm Context Engine): This module is for algorithm computing when
IVSC owns camera sensor. Also ACE module controls camera sensor's ownership.
This hardware module is used to set ownership of camera sensor.
 - CSI (Camera Serial Interface): This module is used to route camera sensor
data either to IVSC or to host for IPU driver and application.

IVSC also provides a privacy mode. When privacy mode is turned on, camera
sensor can't be used. This means that both ACE and host IPU can't get image
data. And when this mode is turned on, host IPU driver is informed via a
registered callback, so that user can be notified.

In summary, to acquire ownership of camera by IPU driver, first ACE module
needs to be informed of ownership and then to setup MIPI CSI-2 link for the
camera sensor and IPU.

Implementation:
There are two different drivers to handle ACE and CSI hardware modules inside
IVSC.
 - mei_csi: MEI client driver to send commands and receive notifications from
CSI module.
 - mei_ace: MEI client driver to send commands and get status from ACE module.
Interface is exposed via ivsc.h to acquire and release camera sensor and CSI-2
link.

Below diagram shows connections of IVSC/ISH/IPU/Camera sensor.
-----------------------------------------------------------------------------
| Host Processor                                                            |
|                                                                           |
|       -----------------       -----------------       ---------------     |
|       |               |       |               |       |             | I2C |
|       |      IPU      |       |      ISH      |       |camera driver|--|  |
|       |               |       |               |       |             |  |  |
|       -----------------       -----------------       ---------------  |  |
|               |                       |                      |         |  |
|               |                       |               ---------------  |  |
|               |                       |               |             |  |  |
|               |                       |               | IVSC driver |  |  |
|               |                       |               |             |  |  |
|               |                       |               ---------------  |  |
|               |                       |                      |         |  |
----------------|-----------------------|----------------------|---------|---
                | CSI                   | I2C                  |SPI      |
                |                       |                      |         |
----------------|-----------------------|----------------      |         |
| IVSC          |                                       |      |         |
|               |                                       |      |         |
|       -----------------       -----------------       |      |         |
|       |               |       |               |       |      |         |
|       |      CSI      |       |      ACE      |       |------|         |
|       |               |       |               |       |                |
|       -----------------       -----------------       |                |
|               |                       | I2C           |                |
----------------|-----------------------|----------------                |
                | CSI                   |                                |
                |                       |                                |
            --------------------------------                             |
            |                              | I2C                         |
            |         camera sensor        |-----------------------------|
            |                              |
            --------------------------------

Wentong Wu (3):
  media: pci: intel: ivsc: Add CSI submodule
  media: pci: intel: ivsc: Add ACE submodule
  media: pci: intel: ivsc: Add acquire/release API for ivsc

 drivers/media/pci/Kconfig              |   1 +
 drivers/media/pci/intel/Makefile       |   2 +
 drivers/media/pci/intel/ivsc/Kconfig   |  12 +
 drivers/media/pci/intel/ivsc/Makefile  |   7 +
 drivers/media/pci/intel/ivsc/ivsc.c    |  84 +++++
 drivers/media/pci/intel/ivsc/mei_ace.c | 472 +++++++++++++++++++++++++
 drivers/media/pci/intel/ivsc/mei_ace.h |  36 ++
 drivers/media/pci/intel/ivsc/mei_csi.c | 341 ++++++++++++++++++
 drivers/media/pci/intel/ivsc/mei_csi.h |  60 ++++
 include/linux/ivsc.h                   |  74 ++++
 10 files changed, 1089 insertions(+)
 create mode 100644 drivers/media/pci/intel/ivsc/Kconfig
 create mode 100644 drivers/media/pci/intel/ivsc/Makefile
 create mode 100644 drivers/media/pci/intel/ivsc/ivsc.c
 create mode 100644 drivers/media/pci/intel/ivsc/mei_ace.c
 create mode 100644 drivers/media/pci/intel/ivsc/mei_ace.h
 create mode 100644 drivers/media/pci/intel/ivsc/mei_csi.c
 create mode 100644 drivers/media/pci/intel/ivsc/mei_csi.h
 create mode 100644 include/linux/ivsc.h

-- 
2.25.1

