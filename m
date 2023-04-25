Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB2C6ED9FA
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 03:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbjDYBon (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 21:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231814AbjDYBoP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 21:44:15 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B93173591
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 18:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682387054; x=1713923054;
  h=from:to:cc:subject:date:message-id;
  bh=QeSKqgl/US+8E9XKbIjAZaomIocSLdAA0R2u7AvuKYA=;
  b=Oa+9OicMIBNkR18uh42hZP+27ya6DTr4Q+uQldPQ4B5wNms/5eGtokL/
   yV61TssnQ+JMsWrIK/eJ99XloE5j+FaWwZ60nxcW7SxG/PP+OrXI7+MlY
   7KbAWWZNNOCsgSVMbAqUHSHhzRHxm+1cemDKqQmQzEttzN9VmL8iH8VqZ
   tUhtgYttC9Zqb7zk0vr405wyPwa0sPtkX277AdD2q8EWxjsVGt5s+sQi5
   Td+uF1vVXfjLOdYPlUdY6QoairF7wYYTNg2GA+hNpx3sJ4R9eVDWMRKr3
   QWQ/wy86sFPrtIYBD3Gb5K39dB23n0FRzGGYmdGXm4rIXJm6btMKnP8T9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="345375351"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="345375351"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 18:44:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="687152114"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="687152114"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orsmga007.jf.intel.com with ESMTP; 24 Apr 2023 18:44:11 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, hdegoede@redhat.com,
        djrscally@gmail.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org
Cc:     bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com,
        Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v6 0/3] media: pci: intel: ivsc: Add driver of Intel Visual Sensing Controller(IVSC)
Date:   Tue, 25 Apr 2023 09:43:56 +0800
Message-Id: <1682387039-16674-1-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
configure the CSI-2 link in normal camera usages, the CSI-2 link and
camera sensor can only be used in mutually-exclusive ways by host IPU and
IVSC. By default the IVSC owns the CSI-2 link and camera sensor. The IPU
driver can take ownership of the CSI-2 link and camera sensor using the
interfaces exported via v4l2 sub-device.

Switching ownership requires an interface with two different hardware
modules inside IVSC. The software interface to these modules is via Intel
MEI (The Intel Management Engine) commands. These two hardware modules
have two different MEI UUIDs to enumerate. These hardware modules are:
 - ACE (Algorithm Context Engine): This module is for algorithm computing
when IVSC owns camera sensor. Also ACE module controls camera sensor's
ownership. This hardware module is used to set ownership of camera sensor.
 - CSI (Camera Serial Interface): This module is used to route camera
sensor data either to IVSC or to host for IPU driver and application.

IVSC also provides a privacy mode. When privacy mode is turned on, camera
sensor can't be used. This means that both ACE and host IPU can't get
image data. And when this mode is turned on, users are informed via v4l2
control API.

In summary, to acquire ownership of camera by IPU driver, first ACE
module needs to be informed of ownership and then to setup MIPI CSI-2
link for the camera sensor and IPU.

Implementation:
There are two different drivers to handle ACE and CSI hardware modules
inside IVSC.
 - ivsc_csi: MEI client driver to send commands and receive notifications
from CSI module.
 - ivsc_ace: MEI client driver to send commands and get status from ACE
module.
Interface is exposed via v4l2 sub-devcie APIs to acquire and release
camera sensor and CSI-2 link.

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

---
v6:
 - add V4L2_SUBDEV_FL_HAS_EVENTS flag for csi subdev
 - add the LINK FREQUENCY volatile control
 - query sensor link frequency with v4l2_get_link_freq api
 - add error handling for creating device link
 - fix coding style issues

v5:
 - probe mei_csi only after software node has been setup

v4:
 - call v4l2_ctrl_handler_free() if setting up the handler failed
 - set V4L2_CTRL_FLAG_READ_ONLY for privacy_ctrl
 - add dev_warn if failed to switch CSI-2 link to IVSC
 - use v4l2_fwnode_endpoint_alloc_parse to get num_data_lanes
 - add document about how sensor connected to IVSC is powered
 - move lock to mei_ace_send
 - check return value for device_link_add

Wentong Wu (3):
  media: pci: intel: ivsc: Add CSI submodule
  media: pci: intel: ivsc: Add ACE submodule
  ACPI: delay enumeration of devices with a _DEP pointing to IVSC device

 drivers/acpi/scan.c                    |   2 +
 drivers/media/pci/Kconfig              |   1 +
 drivers/media/pci/intel/Makefile       |   2 +
 drivers/media/pci/intel/ivsc/Kconfig   |  12 +
 drivers/media/pci/intel/ivsc/Makefile  |   9 +
 drivers/media/pci/intel/ivsc/mei_ace.c | 591 ++++++++++++++++++++++++
 drivers/media/pci/intel/ivsc/mei_csi.c | 809 +++++++++++++++++++++++++++++++++
 7 files changed, 1426 insertions(+)
 create mode 100644 drivers/media/pci/intel/ivsc/Kconfig
 create mode 100644 drivers/media/pci/intel/ivsc/Makefile
 create mode 100644 drivers/media/pci/intel/ivsc/mei_ace.c
 create mode 100644 drivers/media/pci/intel/ivsc/mei_csi.c

-- 
2.7.4

