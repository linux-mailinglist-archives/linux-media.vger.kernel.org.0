Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC6D285AB7
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgJGIpI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:45:08 -0400
Received: from retiisi.org.uk ([95.216.213.190]:56932 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbgJGIpI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:45:08 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 83C73634C87;
        Wed,  7 Oct 2020 11:44:24 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v2 000/106] CCS driver
Date:   Wed,  7 Oct 2020 11:44:56 +0300
Message-Id: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
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

Note that the library as well as the register definitions are dual
licensed under GNU GPL v2 OR BSD 3-clause licenses for use outside the
Linux kernel.

Also DT bindings are updated accordingly and converted to YAML format.

More information on MIPI CCS can be found here:

<URL:https://www.mipi.org/specifications/camera-command-set>

Comments are welcome.

since v1 (DT bindings):

- Remove DT vendor prefix, use vendor-less compatible string

- Add spec version specific compatible strings together with the generic one

- Add VCore and VIO regulators

- Fix rotation property description

- Use less verbose definition of data-lanes property

- Remove CSI-1 bus; this isn't really there, the old stuff is all CCP2

- Make bus-type a required property

- Use additionalProperties: false on the device

- Fix the example (change compatible string, remove nokia,nvm leftover
  property)

- Fix MAINTAINERS

since v1 (driver):

- Generate register and limit definitions from source

- Style fixes in ccs-pll.c

- Use correct MODULE_LICENSE in ccs-pll.c

- Support for VCore and VIO regulators

- Remove extra delays from power-up sequence

- Adapt to parsing changes in v4l2_fwnode_endpoint_alloc_parse(), i.e.
  call it just once. This also fixes parsing bus-type-less DT binaries.

- Fix MAINTAINERS

Sakari Ailus (106):
  smiapp: Generate CCS register definitions and limits
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
  ccs: Add MIPI CCS compatible strings
  ccs: Remove the I²C ID table
  ccs: Remove remaining support for platform data
  ccs: Make hwcfg part of the device specific struct
  ccs: Fix obtaining bus information from firmware
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
  ccs-pll: Fix MODULE_LICENSE
  ccs: Change my e-mail address
  ccs: Add support for manufacturer regs from sensor and module files
  ccs: Use static data read-only registers
  ccs: Clean up runtime PM usage
  ccs: Wrap long lines, unwrap short ones
  ccs: Add device compatible identifiers for telling SMIA and CCS apart
  ccs: Use longer pre-I²C sleep for CCS compliant devices
  ccs: Remove unnecessary delays from power-up sequence
  dt-bindings: mipi,ccs: Don't mention vana voltage
  dt-bindings: mipi,ccs: Add vcore and vio supplies
  ccs: Use all regulators
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
  v4l: uapi: Add user control base for CCS controls
  v4l: uapi: ccs: Add controls for analogue gain constants
  ccs: Add support for analogue gain coefficient controls
  v4l: uapi: ccs: Add controls for CCS alternative analogue gain
  ccs: Add support for alternate analogue global gain
  ccs: Add debug prints for MSR registers
  v4l: uapi: ccs: Add CCS controls for shading correction
  ccs: Add shading correction and luminance correction level controls
  ccs: Add CCS ACPI device ID

 .../bindings/media/i2c/mipi-ccs.yaml          |  135 +
 .../bindings/media/i2c/nokia,smia.txt         |   66 -
 MAINTAINERS                                   |   21 +-
 drivers/media/i2c/Kconfig                     |    4 +-
 drivers/media/i2c/Makefile                    |    4 +-
 drivers/media/i2c/{smiapp-pll.c => ccs-pll.c} | 1012 ++++---
 drivers/media/i2c/{smiapp-pll.h => ccs-pll.h} |  196 +-
 drivers/media/i2c/{smiapp => ccs}/Kconfig     |    9 +-
 drivers/media/i2c/{smiapp => ccs}/Makefile    |   18 +-
 .../{smiapp/smiapp-core.c => ccs/ccs-core.c}  | 2426 ++++++++++-------
 drivers/media/i2c/ccs/ccs-data-defs.h         |  215 ++
 drivers/media/i2c/ccs/ccs-data.c              |  949 +++++++
 drivers/media/i2c/ccs/ccs-data.h              |  116 +
 drivers/media/i2c/ccs/ccs-os.h                |   15 +
 .../smiapp-quirk.c => ccs/ccs-quirk.c}        |  105 +-
 .../smiapp-quirk.h => ccs/ccs-quirk.h}        |   54 +-
 .../smiapp-regs.c => ccs/ccs-reg-access.c}    |  296 +-
 .../smiapp-regs.h => ccs/ccs-reg-access.h}    |   40 +-
 drivers/media/i2c/ccs/ccs-regs.txt            | 1041 +++++++
 .../media/i2c/{smiapp/smiapp.h => ccs/ccs.h}  |  185 +-
 drivers/media/i2c/ccs/mk-ccs-regs             |  405 +++
 .../smiapp-reg.h => ccs/smiapp-reg-defs.h}    |  502 +++-
 drivers/media/i2c/smiapp/smiapp-limits.c      |  118 -
 drivers/media/i2c/smiapp/smiapp-limits.h      |  114 -
 drivers/media/i2c/smiapp/smiapp-reg-defs.h    |  489 ----
 include/uapi/linux/ccs.h                      |   21 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 27 files changed, 6166 insertions(+), 2396 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
 rename drivers/media/i2c/{smiapp-pll.c => ccs-pll.c} (16%)
 rename drivers/media/i2c/{smiapp-pll.h => ccs-pll.h} (18%)
 rename drivers/media/i2c/{smiapp => ccs}/Kconfig (48%)
 rename drivers/media/i2c/{smiapp => ccs}/Makefile (14%)
 rename drivers/media/i2c/{smiapp/smiapp-core.c => ccs/ccs-core.c} (43%)
 create mode 100644 drivers/media/i2c/ccs/ccs-data-defs.h
 create mode 100644 drivers/media/i2c/ccs/ccs-data.c
 create mode 100644 drivers/media/i2c/ccs/ccs-data.h
 create mode 100644 drivers/media/i2c/ccs/ccs-os.h
 rename drivers/media/i2c/{smiapp/smiapp-quirk.c => ccs/ccs-quirk.c} (63%)
 rename drivers/media/i2c/{smiapp/smiapp-quirk.h => ccs/ccs-quirk.h} (53%)
 rename drivers/media/i2c/{smiapp/smiapp-regs.c => ccs/ccs-reg-access.c} (37%)
 rename drivers/media/i2c/{smiapp/smiapp-regs.h => ccs/ccs-reg-access.h} (16%)
 create mode 100644 drivers/media/i2c/ccs/ccs-regs.txt
 rename drivers/media/i2c/{smiapp/smiapp.h => ccs/ccs.h} (52%)
 create mode 100644 drivers/media/i2c/ccs/mk-ccs-regs
 rename drivers/media/i2c/{smiapp/smiapp-reg.h => ccs/smiapp-reg-defs.h} (10%)
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-limits.c
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-limits.h
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-reg-defs.h
 create mode 100644 include/uapi/linux/ccs.h

-- 
2.27.0

