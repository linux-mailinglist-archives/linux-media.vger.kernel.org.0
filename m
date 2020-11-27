Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B99762C6333
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 11:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728077AbgK0KiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 05:38:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727913AbgK0KiF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 05:38:05 -0500
X-Greylist: delayed 1676 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 27 Nov 2020 02:38:04 PST
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8A6EC0613D1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 02:38:04 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 536B3634C24;
        Fri, 27 Nov 2020 12:37:15 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH v2 00/29] Linux CCS driver preparation
Date:   Fri, 27 Nov 2020 12:32:56 +0200
Message-Id: <20201127103325.29814-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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

Note that the library as well as the register definitions are dual
licensed under GNU GPL v2 OR BSD 3-clause licenses for use outside the
Linux kernel.

Also DT bindings are updated accordingly and converted to YAML format.

More information on MIPI CCS can be found here:

<URL:https://www.mipi.org/specifications/camera-command-set>

Comments are welcome.

since v1:

- Fix the SPDX tag in mk-ccs-regs script

- Add support for producing kernel definitions including use of BIT macro
  and kernel types in mk-ccs-regs (was C99 only)

- Add MAINTAINERS entry for the documentation in the first documentation
  patch.

- Fix compilation issues due to ccs-limits.o missing from Makefile in a
  few patches early in the set.

since the big, big patchset (v2):

- Split into more easily reviewable chunks (this is the first of maybe
  three). The cover page describes the entire big set. This set contains
  mostly cleanups for the smiapp driver that prepare for support for
  additional features as well as DT bindings, as well as using CCS limits.

- Fix SPDX tags. Some were left accidentally with BSD-3-Clause license
  only.

- Fix bus-type alignment in DT bindings.

- Add CCS driver documentation

- Add -u option to the CCS register definition generator.

- Add static keyword for ccs_limit_offset array.

- Add generated CCS register definitions, and do not generate the definitions as
  part of the build process.

- Remove ccs-os.h header.

Sakari Ailus (29):
  ccs: Add the generator for CCS register definitions and limits
  Documentation: ccs: Add CCS driver documentation
  smiapp: Import CCS definitions
  smiapp: Use CCS register flags
  smiapp: Calculate CCS limit offsets and limit buffer size
  smiapp: Remove macros for defining registers, merge definitions
  smiapp: Add macros for accessing CCS registers
  smiapp: Use MIPI CCS version and manufacturer ID information
  smiapp: Read CCS limit values
  smiapp: Switch to CCS limits
  smiapp: Obtain frame descriptor from CCS limits
  smiapp: Use CCS limits in reading data format descriptors
  smiapp: Use CCS limits in reading binning capabilities
  smiapp: Use CCS registers
  smiapp: Remove quirk function for writing a single 8-bit register
  smiapp: Rename register access functions
  smiapp: Internal rename to CCS
  smiapp: Differentiate CCS sensors from SMIA in subdev naming
  smiapp: Rename as "ccs"
  ccs: Remove profile concept
  ccs: Give all subdevs a function
  dt-bindings: nokia,smia: Fix link-frequencies documentation
  dt-bindings: nokia,smia: Make vana-supply optional
  dt-bindings: nokia,smia: Remove nokia,nvm-size property
  dt-bindings: nokia,smia: Convert to YAML
  dt-bindings: nokia,smia: Use better active polarity for reset
  dt-bindings: nokia,smia: Amend SMIA bindings with MIPI CCS support
  dt-bindings: mipi-ccs: Add bus-type for C-PHY support
  ccs: Request for "reset" GPIO

 .../bindings/media/i2c/mipi-ccs.yaml          |  128 ++
 .../bindings/media/i2c/nokia,smia.txt         |   66 -
 .../driver-api/media/drivers/ccs/ccs-regs.txt | 1041 ++++++++++
 .../driver-api/media/drivers/ccs/ccs.rst      |   82 +
 .../driver-api/media/drivers/ccs/mk-ccs-regs  |  433 ++++
 .../driver-api/media/drivers/index.rst        |    1 +
 MAINTAINERS                                   |   21 +-
 drivers/media/i2c/Kconfig                     |    2 +-
 drivers/media/i2c/Makefile                    |    2 +-
 drivers/media/i2c/{smiapp => ccs}/Kconfig     |    7 +-
 drivers/media/i2c/ccs/Makefile                |    6 +
 .../{smiapp/smiapp-core.c => ccs/ccs-core.c}  | 1828 +++++++++--------
 drivers/media/i2c/ccs/ccs-limits.c            |  239 +++
 drivers/media/i2c/ccs/ccs-limits.h            |  259 +++
 .../smiapp-quirk.c => ccs/ccs-quirk.c}        |   92 +-
 .../smiapp-quirk.h => ccs/ccs-quirk.h}        |   52 +-
 .../smiapp-regs.c => ccs/ccs-reg-access.c}    |   85 +-
 drivers/media/i2c/ccs/ccs-reg-access.h        |   38 +
 drivers/media/i2c/ccs/ccs-regs.h              |  954 +++++++++
 .../media/i2c/{smiapp/smiapp.h => ccs/ccs.h}  |  164 +-
 drivers/media/i2c/ccs/smiapp-reg-defs.h       |  580 ++++++
 drivers/media/i2c/smiapp/Makefile             |    6 -
 drivers/media/i2c/smiapp/smiapp-limits.c      |  118 --
 drivers/media/i2c/smiapp/smiapp-limits.h      |  114 -
 drivers/media/i2c/smiapp/smiapp-reg-defs.h    |  489 -----
 drivers/media/i2c/smiapp/smiapp-reg.h         |  116 --
 drivers/media/i2c/smiapp/smiapp-regs.h        |   36 -
 27 files changed, 4947 insertions(+), 2012 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
 create mode 100644 Documentation/driver-api/media/drivers/ccs/ccs-regs.txt
 create mode 100644 Documentation/driver-api/media/drivers/ccs/ccs.rst
 create mode 100755 Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
 rename drivers/media/i2c/{smiapp => ccs}/Kconfig (55%)
 create mode 100644 drivers/media/i2c/ccs/Makefile
 rename drivers/media/i2c/{smiapp/smiapp-core.c => ccs/ccs-core.c} (53%)
 create mode 100644 drivers/media/i2c/ccs/ccs-limits.c
 create mode 100644 drivers/media/i2c/ccs/ccs-limits.h
 rename drivers/media/i2c/{smiapp/smiapp-quirk.c => ccs/ccs-quirk.c} (66%)
 rename drivers/media/i2c/{smiapp/smiapp-quirk.h => ccs/ccs-quirk.h} (55%)
 rename drivers/media/i2c/{smiapp/smiapp-regs.c => ccs/ccs-reg-access.c} (66%)
 create mode 100644 drivers/media/i2c/ccs/ccs-reg-access.h
 create mode 100644 drivers/media/i2c/ccs/ccs-regs.h
 rename drivers/media/i2c/{smiapp/smiapp.h => ccs/ccs.h} (57%)
 create mode 100644 drivers/media/i2c/ccs/smiapp-reg-defs.h
 delete mode 100644 drivers/media/i2c/smiapp/Makefile
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-limits.c
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-limits.h
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-reg-defs.h
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-reg.h
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-regs.h

-- 
2.27.0

