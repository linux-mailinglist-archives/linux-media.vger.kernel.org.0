Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92A4D4D3624
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 18:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbiCIQoi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 11:44:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237467AbiCIQkO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 11:40:14 -0500
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 880F714A6CC
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 08:33:13 -0800 (PST)
Received: from lanttu.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::c1:2])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 58178634C92;
        Wed,  9 Mar 2022 18:33:11 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v3 2/5] mc: media_device_init() initialises a media_device, not media_entity
Date:   Wed,  9 Mar 2022 18:31:09 +0200
Message-Id: <20220309163112.11708-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220309163112.11708-1-sakari.ailus@linux.intel.com>
References: <20220309163112.11708-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The documentation for media_device_init() had several references to
(struct) media_entity where it should have referred to struct media_device
instead. Fix this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/media-device.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/media/media-device.h b/include/media/media-device.h
index 7d5b212792a5..bc015d2cf541 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -249,28 +249,28 @@ void media_device_cleanup(struct media_device *mdev);
  * The caller is responsible for initializing the &media_device structure
  * before registration. The following fields of &media_device must be set:
  *
- *  - &media_entity.dev must point to the parent device (usually a &pci_dev,
+ *  - &media_device.dev must point to the parent device (usually a &pci_dev,
  *    &usb_interface or &platform_device instance).
  *
- *  - &media_entity.model must be filled with the device model name as a
+ *  - &media_device.model must be filled with the device model name as a
  *    NUL-terminated UTF-8 string. The device/model revision must not be
  *    stored in this field.
  *
  * The following fields are optional:
  *
- *  - &media_entity.serial is a unique serial number stored as a
+ *  - &media_device.serial is a unique serial number stored as a
  *    NUL-terminated ASCII string. The field is big enough to store a GUID
  *    in text form. If the hardware doesn't provide a unique serial number
  *    this field must be left empty.
  *
- *  - &media_entity.bus_info represents the location of the device in the
+ *  - &media_device.bus_info represents the location of the device in the
  *    system as a NUL-terminated ASCII string. For PCI/PCIe devices
- *    &media_entity.bus_info must be set to "PCI:" (or "PCIe:") followed by
+ *    &media_device.bus_info must be set to "PCI:" (or "PCIe:") followed by
  *    the value of pci_name(). For USB devices,the usb_make_path() function
  *    must be used. This field is used by applications to distinguish between
  *    otherwise identical devices that don't provide a serial number.
  *
- *  - &media_entity.hw_revision is the hardware device revision in a
+ *  - &media_device.hw_revision is the hardware device revision in a
  *    driver-specific format. When possible the revision should be formatted
  *    with the KERNEL_VERSION() macro.
  *
-- 
2.30.2

