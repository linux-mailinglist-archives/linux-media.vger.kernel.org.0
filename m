Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEEFA2CC0D7
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 16:31:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgLBPav (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 10:30:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgLBPau (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 10:30:50 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492C5C0613CF
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 07:30:10 -0800 (PST)
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 04E32634C24
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 17:28:57 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kkU3t-00033R-FJ
        for linux-media@vger.kernel.org; Wed, 02 Dec 2020 17:28:57 +0200
Date:   Wed, 2 Dec 2020 17:28:57 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for =?iso-8859-1?B?NS4xMV2gUHJl?=
 =?iso-8859-1?Q?liminary?= CCS support
Message-ID: <20201202152857.GW4351@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's preliminary CCS support for the newly renamed CCS driver, including
the CCS static data library. Additionally, I put in the two patches fixing
SPDX line location as well as renaming the register description file from
.txt to .asc.

Please pull.


The following changes since commit 1ed36ecd1459b653cced8929bfb37dba94b64c5d:

  media: i2c: imx219: Selection compliance fixes (2020-12-02 16:16:56 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/ccs-v4-ccs-support-asc-signed

for you to fetch changes up to c159d16bf5dbb3b8a80669da65d5a71db7f0eaab:

  ccs: Use all regulators (2020-12-02 17:17:18 +0200)

----------------------------------------------------------------
Preliminary CCS support for 5.11

----------------------------------------------------------------
Sakari Ailus (32):
      Documentation: ccs: Rename ccs-regs.txt as ccs-regs.asc
      Documentation: ccs: Reorder SPDX and copyright notice lines
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
      ccs: Move limit value real to integer conversion from read to access time
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

 .../devicetree/bindings/media/i2c/mipi-ccs.yaml    |  11 +-
 .../drivers/ccs/{ccs-regs.txt => ccs-regs.asc}     |   2 +-
 Documentation/driver-api/media/drivers/ccs/ccs.rst |   4 +-
 .../driver-api/media/drivers/ccs/mk-ccs-regs       |   4 +-
 MAINTAINERS                                        |   4 +-
 drivers/media/i2c/Kconfig                          |   2 +-
 drivers/media/i2c/Makefile                         |   2 +-
 drivers/media/i2c/{smiapp-pll.c => ccs-pll.c}      |  66 +-
 drivers/media/i2c/{smiapp-pll.h => ccs-pll.h}      |  42 +-
 drivers/media/i2c/ccs/Kconfig                      |   2 +-
 drivers/media/i2c/ccs/Makefile                     |   2 +-
 drivers/media/i2c/ccs/ccs-core.c                   | 396 +++++----
 drivers/media/i2c/ccs/ccs-data-defs.h              | 221 +++++
 drivers/media/i2c/ccs/ccs-data.c                   | 953 +++++++++++++++++++++
 drivers/media/i2c/ccs/ccs-data.h                   | 227 +++++
 drivers/media/i2c/ccs/ccs-quirk.c                  |  10 +-
 drivers/media/i2c/ccs/ccs-quirk.h                  |   2 +-
 drivers/media/i2c/ccs/ccs-reg-access.c             | 227 ++++-
 drivers/media/i2c/ccs/ccs-reg-access.h             |   6 +-
 drivers/media/i2c/ccs/ccs.h                        |  24 +-
 20 files changed, 1928 insertions(+), 279 deletions(-)
 rename Documentation/driver-api/media/drivers/ccs/{ccs-regs.txt => ccs-regs.asc} (100%)
 rename drivers/media/i2c/{smiapp-pll.c => ccs-pll.c} (89%)
 rename drivers/media/i2c/{smiapp-pll.h => ccs-pll.h} (66%)
 create mode 100644 drivers/media/i2c/ccs/ccs-data-defs.h
 create mode 100644 drivers/media/i2c/ccs/ccs-data.c
 create mode 100644 drivers/media/i2c/ccs/ccs-data.h

-- 
Kind regards,

Sakari Ailus
