Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1529775A7BF
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 09:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbjGTH0S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 03:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbjGTH0Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 03:26:16 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8A319A4
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 00:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689837975; x=1721373975;
  h=from:to:cc:subject:date:message-id;
  bh=yvy9R0oP6C3Ojw7F3JTa9EInqH5bz9u+CNPlEj808u0=;
  b=TzwHZaFpSCumxVfRpp/8r44ALEH6cOvhXh7U+dGzhd/ig2SH6+6ZAbZp
   EGCVBukjOWh9mlOMvKBrqXS2nrzHijXiuC52cmH7a+HlJ43aTZoXhF5an
   HnTCdlkiQeHvWgbN/0CmonwKTuzs5f8C6HxN1Bp4ObB0ZxBNDi+W+0rtp
   t+LWop+yUqkCDMLzarsjHX2XWNUka3MwHUD+R3jc2LysTtijxnMhnNz52
   oZgwzqBK34GMNLg1X5YPx/mlufM9LdyDhkqcdKFdsQDlsTFSV2F+RWBag
   FKJB9bnIsvR4e4ZYPUEsw2QNc9mxhLg7havkHJJMlITrFc3bp3ZAss5un
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="365542150"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="365542150"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 00:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="837983031"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="837983031"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jul 2023 00:26:09 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, hdegoede@redhat.com,
        djrscally@gmail.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org
Cc:     bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com,
        Wentong Wu <wentong.wu@intel.com>
Subject: media: pci: intel: ivsc: Add driver of Intel Visual Sensing Controller(IVSC)
Date:   Thu, 20 Jul 2023 15:25:49 +0800
Message-Id: <1689837952-12373-1-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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

Implementation:Implementation:
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

The drivers have been tested with IPU6 and ov01a1s by below commands:

media-ctl -v -V "\"Intel IVSC CSI\":0 [fmt:SGRBG10/1296x798]"
media-ctl -v -V "\"Intel IVSC CSI\":1 [fmt:SGRBG10/1296x798]"
media-ctl -v -V "\"Intel IPU6 CSI2 1\":0 [fmt:SGRBG10/1296x798]"
media-ctl -v -V "\"Intel IPU6 CSI2 1\":1 [fmt:SGRBG10/1296x798]"
media-ctl -l "\"Intel IVSC CSI\":0 -> \"Intel IPU6 CSI2 1\":0[1]"
media-ctl -v -l "\"Intel IPU6 CSI2 1\":1 -> \"Intel IPU6 ISYS Capture 0\":0[5]"
yavta -c100 -n5 -I -s 1296x798 --file=/tmp/frame-CSI1.bin -f SGRBG10 /dev/video0

---
v10:
 - use v4l2_ctrl_new_int_menu for mei_csi frequency control
 - add sub dev name for mei_csi
 - add post_probe_work for mei_ace to probe sensor after mei_ace

v9:
 - revert v8's change because it is not suitable for MEI framework

v8:
 - use new uuid structure and macro

v7:
 - add more comments for IVSC ACPI dev

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

 drivers/acpi/scan.c                    |   3 +
 drivers/media/pci/Kconfig              |   1 +
 drivers/media/pci/intel/Makefile       |   2 +
 drivers/media/pci/intel/ivsc/Kconfig   |  12 +
 drivers/media/pci/intel/ivsc/Makefile  |   9 +
 drivers/media/pci/intel/ivsc/mei_ace.c | 579 +++++++++++++++++++++++
 drivers/media/pci/intel/ivsc/mei_csi.c | 825 +++++++++++++++++++++++++++++++++
 7 files changed, 1431 insertions(+)
 create mode 100644 drivers/media/pci/intel/ivsc/Kconfig
 create mode 100644 drivers/media/pci/intel/ivsc/Makefile
 create mode 100644 drivers/media/pci/intel/ivsc/mei_ace.c
 create mode 100644 drivers/media/pci/intel/ivsc/mei_csi.c

-- 
2.7.4

