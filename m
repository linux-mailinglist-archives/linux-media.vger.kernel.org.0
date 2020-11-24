Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3C9E2C21AC
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 10:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731476AbgKXJia (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 04:38:30 -0500
Received: from retiisi.eu ([95.216.213.190]:44956 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731183AbgKXJi3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 04:38:29 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id C7B35634C24;
        Tue, 24 Nov 2020 11:37:50 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH 00/30] Trivial MIPI CCS support
Date:   Tue, 24 Nov 2020 11:31:56 +0200
Message-Id: <20201124093226.23737-1-sakari.ailus@linux.intel.com>
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

since the big, big patchset (v2):

- Split into more easily reviewable chunks (this is the second of maybe
  three). The cover page describes the entire big set. This set contains
  new DT compatible strings, CCS ACPI ID, rudimentary support for CCS
  (without PLL changes most sensors need, that's for later), including CCS
  static data.

- Fix SPDX tags. Some were left accidentally with BSD-3-Clause license
  only.

- Remove WARN_ON() from snprintf(), but return an error instead.

- Free loaded static data on error as well.

- Add descriptions to ccs-data-defs.h and ccs-data.h to document the
  difference between the two.

- Make the delay after I²C transfer error a range.

- Make better use of kernel support functions.

- Depends on earlier pull request here:

  <URL:https://patchwork.linuxtv.org/project/linux-media/patch/20201123231950.GD4351@valkosipuli.retiisi.org.uk/>

Sakari Ailus (30):
  ccs: Add MIPI CCS compatible strings
  ccs: Add device compatible identifiers for telling SMIA and CCS apart
  ccs: Add CCS ACPI device ID
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
  ccs: Allow range in between I²C retries
  ccs: Add support for manufacturer regs from sensor and module files
  ccs: Use static data read-only registers
  ccs: Clean up runtime PM usage
  ccs: Wrap long lines, unwrap short ones
  ccs: Use longer pre-I²C sleep for CCS compliant devices
  ccs: Remove unnecessary delays from power-up sequence
  dt-bindings: mipi,ccs: Don't mention vana voltage
  dt-bindings: mipi,ccs: Add vcore and vio supplies
  ccs: Use all regulators

 .../bindings/media/i2c/mipi-ccs.yaml          |  11 +-
 MAINTAINERS                                   |   4 +-
 drivers/media/i2c/Kconfig                     |   2 +-
 drivers/media/i2c/Makefile                    |   2 +-
 drivers/media/i2c/{smiapp-pll.c => ccs-pll.c} |  66 +-
 drivers/media/i2c/{smiapp-pll.h => ccs-pll.h} |  42 +-
 drivers/media/i2c/ccs/Kconfig                 |   2 +-
 drivers/media/i2c/ccs/Makefile                |   2 +-
 drivers/media/i2c/ccs/ccs-core.c              | 396 +++++---
 drivers/media/i2c/ccs/ccs-data-defs.h         | 219 ++++
 drivers/media/i2c/ccs/ccs-data.c              | 944 ++++++++++++++++++
 drivers/media/i2c/ccs/ccs-data.h              | 120 +++
 drivers/media/i2c/ccs/ccs-quirk.c             |  10 +-
 drivers/media/i2c/ccs/ccs-quirk.h             |   2 +-
 drivers/media/i2c/ccs/ccs-reg-access.c        | 227 ++++-
 drivers/media/i2c/ccs/ccs-reg-access.h        |   6 +-
 drivers/media/i2c/ccs/ccs.h                   |  24 +-
 17 files changed, 1805 insertions(+), 274 deletions(-)
 rename drivers/media/i2c/{smiapp-pll.c => ccs-pll.c} (89%)
 rename drivers/media/i2c/{smiapp-pll.h => ccs-pll.h} (66%)
 create mode 100644 drivers/media/i2c/ccs/ccs-data-defs.h
 create mode 100644 drivers/media/i2c/ccs/ccs-data.c
 create mode 100644 drivers/media/i2c/ccs/ccs-data.h

-- 
2.27.0
