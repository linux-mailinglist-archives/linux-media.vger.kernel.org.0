Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B23842C1956
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 00:21:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgKWXU0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 18:20:26 -0500
Received: from retiisi.eu ([95.216.213.190]:41488 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725921AbgKWXUZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 18:20:25 -0500
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 28243634C24
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 01:19:50 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1khL7e-0001Su-L0
        for linux-media@vger.kernel.org; Tue, 24 Nov 2020 01:19:50 +0200
Date:   Tue, 24 Nov 2020 01:19:50 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for =?iso-8859-1?B?NS4xMV2gU21p?= =?iso-8859-1?Q?app?=
 driver fixes, begin conversion to CCS
Message-ID: <20201123231950.GD4351@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a set that prepares making the smiapp driver a modern MIPI CCS
driver. It includes bugfixes, switch to CCS limit definitions as well as
includes the DT bindings for the CCS device.

Please pull.


The following changes since commit 9463e07df8e0f93931e32c6f415d3f82bda63f35:

  media: v4l2-compat-ioctl32.c: add missing #ifdef CONFIG_COMPAT_32BIT_TIMEs (2020-11-17 07:14:46 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.11-3-signed

for you to fetch changes up to cd4f707bd17c2569c799a219d417c58261ea75d7:

  ccs: Request for "reset" GPIO (2020-11-18 13:13:24 +0200)

----------------------------------------------------------------
V4L2 patches for 5.11

----------------------------------------------------------------
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

 .../devicetree/bindings/media/i2c/mipi-ccs.yaml    |  128 ++
 .../devicetree/bindings/media/i2c/nokia,smia.txt   |   66 -
 .../driver-api/media/drivers/ccs/ccs-regs.txt      | 1041 +++++++++++
 Documentation/driver-api/media/drivers/ccs/ccs.rst |   82 +
 .../driver-api/media/drivers/ccs/mk-ccs-regs       |  410 +++++
 Documentation/driver-api/media/drivers/index.rst   |    1 +
 MAINTAINERS                                        |   20 +-
 drivers/media/i2c/Kconfig                          |    2 +-
 drivers/media/i2c/Makefile                         |    2 +-
 drivers/media/i2c/{smiapp => ccs}/Kconfig          |    7 +-
 drivers/media/i2c/ccs/Makefile                     |    6 +
 .../i2c/{smiapp/smiapp-core.c => ccs/ccs-core.c}   | 1828 +++++++++++---------
 drivers/media/i2c/ccs/ccs-limits.c                 |  239 +++
 drivers/media/i2c/ccs/ccs-limits.h                 |  258 +++
 .../i2c/{smiapp/smiapp-quirk.c => ccs/ccs-quirk.c} |   92 +-
 .../i2c/{smiapp/smiapp-quirk.h => ccs/ccs-quirk.h} |   52 +-
 .../{smiapp/smiapp-regs.c => ccs/ccs-reg-access.c} |   85 +-
 drivers/media/i2c/ccs/ccs-reg-access.h             |   38 +
 drivers/media/i2c/ccs/ccs-regs.h                   |  953 ++++++++++
 drivers/media/i2c/{smiapp/smiapp.h => ccs/ccs.h}   |  164 +-
 drivers/media/i2c/ccs/smiapp-reg-defs.h            |  580 +++++++
 drivers/media/i2c/smiapp/Makefile                  |    6 -
 drivers/media/i2c/smiapp/smiapp-limits.c           |  118 --
 drivers/media/i2c/smiapp/smiapp-limits.h           |  114 --
 drivers/media/i2c/smiapp/smiapp-reg-defs.h         |  489 ------
 drivers/media/i2c/smiapp/smiapp-reg.h              |  116 --
 drivers/media/i2c/smiapp/smiapp-regs.h             |   36 -
 27 files changed, 4921 insertions(+), 2012 deletions(-)
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
Kind regards,

Sakari Ailus
