Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A336F27F347
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 22:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730404AbgI3UTR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 16:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730009AbgI3UTR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 16:19:17 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE46C061755;
        Wed, 30 Sep 2020 13:19:16 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 22859634C87;
        Wed, 30 Sep 2020 23:19:00 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org
Subject: [RESEND PATCH 000/100] Linux CCS driver
Date:   Wed, 30 Sep 2020 23:19:07 +0300
Message-Id: <20200930201914.31377-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

I'm just resending the DT binding patches while cc'ing the devicetree
list. The entire set is here:

<URL:https://lore.kernel.org/linux-media/20200930152858.8471-1-sakari.ailus@linux.intel.com/T/#t>

The entire set converts the existing SMIA driver into a MIPI CCS driver
while maintaining compatibility with existing SMIA compliant devices. MIPI
CCS is the current standard, hence the rename.

Sakari Ailus (100):
  smiapp: Add CCS register definitions and limits
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
  dt-bindings: Add vendor prefix for MIPI Alliance
  dt-bindings: nokia,smia: Fix link-frequencies documentation
  dt-bindings: nokia,smia: Make vana-supply optional
  dt-bindings: nokia,smia: Convert to YAML
  dt-bindings: nokia,smia: Use better active polarity for reset
  dt-bindings: Amend SMIA bindings with MIPI CCS support
  dt-bindings: Add bus-type for C-PHY support
  ccs: Request for "reset" GPIO
  ccs: Add "mipi,ccs" compatible string
  ccs: Remove the I²C ID table
  ccs: Remove remaining support for platform data
  ccs: Make hwcfg part of the device specific struct
  ccs: Add CCS static data parser library
  ccs: Combine revision number major and minor into one
  ccs: Read CCS static data from firmware binaries
  ccs: Stop reading arrays after the first zero
  ccs: The functions to get compose or crop rectangle never return NULL
  ccs: Replace somewhat harsh internal checks based on BUG with WARN_ON
  ccs: Refactor register reading a little
  ccs: Make real to integer number conversion optional
  ccs: Move limit value real to integer conversion from read to access
    time
  ccs: Read ireal numbers correctly
  smiapp-pll: Rename as ccs-pll
  ccs: Change my e-mail address
  ccs: Add support for manufacturer regs from sensor and module files
  ccs: Use static data read-only registers
  ccs: Clean up runtime PM usage
  ccs: Wrap long lines, unwrap short ones
  ccs: Add device compatible identifiers for telling SMIA and CCS apart
  ccs: Use longer pre-I²C sleep for CCS compliant devices
  ccs-pll: Don't use div_u64 to divide a 32-bit number
  ccs-pll: Split limits and PLL configuration into front and back parts
  ccs-pll: Use correct VT divisor for calculating VT SYS divisor
  ccs-pll: End search if there are no better values available
  ccs-pll: Remove parallel bus support
  ccs-pll: Differentiate between CSI-2 D-PHY and C-PHY
  ccs-pll: Move the flags field down, away from 8-bit fields
  ccs-pll: Document the structs in the header as well as the function
  ccs-pll: Use the BIT macro
  ccs-pll: Begin calculation from OP system clock frequency
  ccs-pll: Fix condition for pre-PLL divider lower bound
  ccs-pll: Avoid overflow in pre-PLL divisor lower bound search
  ccs-pll: Fix comment on check against maximum PLL multiplier
  ccs-pll: Fix check for PLL multiplier upper bound
  ccs-pll: Use explicit 32-bit unsigned type
  ccs-pll: Add support for lane speed model
  ccs: Add support for lane speed model
  ccs-pll: Add support for decoupled OP domain calculation
  ccs-pll: Add support for extended input PLL clock divider
  ccs-pll: Support two cycles per pixel on OP domain
  ccs-pll: Add support flexible OP PLL pixel clock divider
  ccs-pll: Add sanity checks
  ccs-pll: Add C-PHY support
  ccs-pll: Split off VT subtree calculation
  ccs-pll: Check for derating and overrating, support non-derating
    sensors
  ccs-pll: Better separate OP and VT sub-tree calculation
  ccs-pll: Print relevant information on PLL tree
  ccs-pll: Rework bounds checks
  ccs-pll: Make VT divisors 16-bit
  ccs-pll: Fix VT post-PLL divisor calculation
  ccs-pll: Separate VT divisor limit calculation from the rest
  ccs-pll: Add trivial dual PLL support
  ccs: Dual PLL support
  ccs-pll: Add support for DDR OP system and pixel clocks
  ccs: Add support for DDR OP SYS and OP PIX clocks
  ccs: Print written register values
  ccs-pll: Print pixel rates
  ccs: Add support for obtaining C-PHY configuration from firmware
  ccs: Add digital gain support
  ccs: Add support for old-style SMIA digital gain
  ccs: Remove analogue gain field
  ccs: Only add analogue gain control if the device supports it
  v4l: Add user control base for CCS controls
  v4l: uapi: Add controls for analogue gain constants
  ccs: Add support for analogue gain coefficient controls
  v4l: uapi: Add controls for CCS alternative analogue gain
  ccs: Add support for alternate analogue global gain
  ccs: Add debug prints for MSR registers
  v4l: uapi: Add CCS controls for correction configuration and
    capabilities
  ccs: Add shading correction and luminance correction level controls
  smiapp: Add CCS ACPI device ID

 .../bindings/media/i2c/mipi,ccs.yaml          |  164 +
 .../bindings/media/i2c/nokia,smia.txt         |   66 -
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |   20 +-
 drivers/media/i2c/Kconfig                     |    4 +-
 drivers/media/i2c/Makefile                    |    4 +-
 drivers/media/i2c/ccs-pll.c                   |  885 ++++
 drivers/media/i2c/ccs-pll.h                   |  211 +
 drivers/media/i2c/ccs/Kconfig                 |   11 +
 drivers/media/i2c/ccs/Makefile                |    6 +
 drivers/media/i2c/ccs/ccs-core.c              | 3665 +++++++++++++++++
 drivers/media/i2c/ccs/ccs-data-defs.h         |  215 +
 drivers/media/i2c/ccs/ccs-data.c              |  949 +++++
 drivers/media/i2c/ccs/ccs-data.h              |  116 +
 drivers/media/i2c/ccs/ccs-limits.c            |  239 ++
 drivers/media/i2c/ccs/ccs-limits.h            |  258 ++
 drivers/media/i2c/ccs/ccs-os.h                |   15 +
 .../smiapp-quirk.c => ccs/ccs-quirk.c}        |  105 +-
 .../smiapp-quirk.h => ccs/ccs-quirk.h}        |   54 +-
 drivers/media/i2c/ccs/ccs-reg-access.c        |  417 ++
 drivers/media/i2c/ccs/ccs-reg-access.h        |   42 +
 drivers/media/i2c/ccs/ccs-regs.h              |  953 +++++
 .../media/i2c/{smiapp/smiapp.h => ccs/ccs.h}  |  183 +-
 drivers/media/i2c/ccs/smiapp-reg-defs.h       |  582 +++
 drivers/media/i2c/smiapp-pll.c                |  482 ---
 drivers/media/i2c/smiapp-pll.h                |   99 -
 drivers/media/i2c/smiapp/Kconfig              |   10 -
 drivers/media/i2c/smiapp/Makefile             |    6 -
 drivers/media/i2c/smiapp/smiapp-core.c        | 3173 --------------
 drivers/media/i2c/smiapp/smiapp-limits.c      |  118 -
 drivers/media/i2c/smiapp/smiapp-limits.h      |  114 -
 drivers/media/i2c/smiapp/smiapp-reg-defs.h    |  489 ---
 drivers/media/i2c/smiapp/smiapp-reg.h         |  116 -
 drivers/media/i2c/smiapp/smiapp-regs.c        |  261 --
 drivers/media/i2c/smiapp/smiapp-regs.h        |   36 -
 include/uapi/linux/ccs.h                      |   21 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 37 files changed, 8939 insertions(+), 5158 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/mipi,ccs.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
 create mode 100644 drivers/media/i2c/ccs-pll.c
 create mode 100644 drivers/media/i2c/ccs-pll.h
 create mode 100644 drivers/media/i2c/ccs/Kconfig
 create mode 100644 drivers/media/i2c/ccs/Makefile
 create mode 100644 drivers/media/i2c/ccs/ccs-core.c
 create mode 100644 drivers/media/i2c/ccs/ccs-data-defs.h
 create mode 100644 drivers/media/i2c/ccs/ccs-data.c
 create mode 100644 drivers/media/i2c/ccs/ccs-data.h
 create mode 100644 drivers/media/i2c/ccs/ccs-limits.c
 create mode 100644 drivers/media/i2c/ccs/ccs-limits.h
 create mode 100644 drivers/media/i2c/ccs/ccs-os.h
 rename drivers/media/i2c/{smiapp/smiapp-quirk.c => ccs/ccs-quirk.c} (63%)
 rename drivers/media/i2c/{smiapp/smiapp-quirk.h => ccs/ccs-quirk.h} (53%)
 create mode 100644 drivers/media/i2c/ccs/ccs-reg-access.c
 create mode 100644 drivers/media/i2c/ccs/ccs-reg-access.h
 create mode 100644 drivers/media/i2c/ccs/ccs-regs.h
 rename drivers/media/i2c/{smiapp/smiapp.h => ccs/ccs.h} (53%)
 create mode 100644 drivers/media/i2c/ccs/smiapp-reg-defs.h
 delete mode 100644 drivers/media/i2c/smiapp-pll.c
 delete mode 100644 drivers/media/i2c/smiapp-pll.h
 delete mode 100644 drivers/media/i2c/smiapp/Kconfig
 delete mode 100644 drivers/media/i2c/smiapp/Makefile
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-core.c
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-limits.c
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-limits.h
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-reg-defs.h
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-reg.h
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-regs.c
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-regs.h
 create mode 100644 include/uapi/linux/ccs.h

-- 
2.27.0

