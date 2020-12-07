Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B272D1BF5
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 22:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgLGVZE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 16:25:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbgLGVZE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 16:25:04 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4244C061749
        for <linux-media@vger.kernel.org>; Mon,  7 Dec 2020 13:23:18 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 3E23D634C87;
        Mon,  7 Dec 2020 23:23:12 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 00/24] Additional CCS feature support
Date:   Mon,  7 Dec 2020 23:15:06 +0200
Message-Id: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello everyone,

Here's a set of patches that turn the existing SMIA driver into a MIPI CCS
driver while maintaining SMIA support. A number of bugs in the existing
code are fixed in this set, too.

The changes at this point are primarily focused on dealing with new
mandatory driver features related to PLL configuration (as CCS allows for
much more variation there) and things such as integer conversion from
U16.U16 format instead of float. There are some other new features as well
such as digital gain and support for getting device specific analogue gain
coefficients.

A new feature in CCS is CCS static data which makes it possible to obtain
sensor's capabilities and limits from a file chosen based on sensor
identification. CCS static data is used also for storing MSR registers so
supporting new, CCS compliant devices requires no driver changes.

Also DT bindings are updated accordingly and converted to YAML format.

More information on MIPI CCS can be found here:

<URL:https://www.mipi.org/specifications/camera-command-set>

Comments are welcome.

since the big, big patchset (v2):

- Split into more easily reviewable chunks (this is the first of maybe
  three). The cover page describes the entire big set. This set contains
  support for additional configurability, more bugfixes, power sequence
  alignment with CCS and other tasks postponed in earlier patches.

- Added more documentation (driver, controls, PLL calculator).

- Switch from C99 integer types to Linux types.

- Fix file order in MAINTAINERS.

- Revert MODULE_LICENSE change to "GPL" -> "GPL v2"

- Support automatic PHY control, and default to it instead of using
  UI-based control.

- Remove V4L2_CID_CCS_LUMINANCE_SHADING_CORRECTION and
  V4L2_CID_CCS_SHADING_CORRECTION_CAPABILITY controls. This way we don't
  tell all the device capabilities to the user but it's unlikely anyone
  will really want to know this part precisely.

- Align with CCS power-on sequence.

- Don't do software reset if we have a reset GPIO.

- Bail out in probe if the external clock frequency is zero.

- Activate the luminance control only when shading correction is enabled.

Sakari Ailus (24):
  ccs: Add digital gain support
  ccs: Add support for old-style SMIA digital gain
  ccs: Remove analogue gain field
  ccs: Only add analogue gain control if the device supports it
  v4l: uapi: Add user control base for CCS controls
  Documentation: ccs: Add user documentation for the CCS driver
  v4l: uapi: ccs: Add controls for analogue gain constants
  ccs: Add support for analogue gain coefficient controls
  v4l: uapi: ccs: Add controls for CCS alternative analogue gain
  ccs: Add support for alternate analogue global gain
  ccs: Add debug prints for MSR registers
  v4l: uapi: ccs: Add CCS controls for shading correction
  ccs: Add shading correction and luminance correction level controls
  ccs: Get the endpoint by port rather than any next endpoint
  ccs: Don't change the I²C address just for software reset
  ccs: Only do software reset if we have no hardware reset
  ccs: Wait until software reset is done
  ccs: Hardware requires a delay after starting the clock of lifting
    reset
  ccs: Add a sanity check for external clock frequency
  ccs: Support and default to auto PHY control
  Documentation: Include CCS PLL calculator to CCS driver documentation
  ccs-pll: Switch from standard integer types to kernel ones
  ccs: Switch from standard integer types to kernel ones
  Revert "media: ccs-pll: Fix MODULE_LICENSE"

 .../driver-api/media/drivers/ccs/ccs.rst      |  13 +
 .../userspace-api/media/drivers/ccs.rst       | 110 ++++++
 .../userspace-api/media/drivers/index.rst     |   1 +
 MAINTAINERS                                   |   2 +
 drivers/media/i2c/ccs-pll.c                   | 116 +++----
 drivers/media/i2c/ccs-pll.h                   |  86 ++---
 drivers/media/i2c/ccs/ccs-core.c              | 318 +++++++++++++++---
 drivers/media/i2c/ccs/ccs-reg-access.c        |  29 +-
 drivers/media/i2c/ccs/ccs.h                   |   8 +-
 drivers/media/i2c/ccs/smiapp-reg-defs.h       |   2 +
 include/uapi/linux/ccs.h                      |  18 +
 include/uapi/linux/v4l2-controls.h            |   5 +
 12 files changed, 549 insertions(+), 159 deletions(-)
 create mode 100644 Documentation/userspace-api/media/drivers/ccs.rst
 create mode 100644 include/uapi/linux/ccs.h

-- 
2.29.2

