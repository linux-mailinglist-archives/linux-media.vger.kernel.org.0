Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84B452CC4AF
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387507AbgLBSLZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:11:25 -0500
Received: from retiisi.eu ([95.216.213.190]:33466 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728656AbgLBSLZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 13:11:25 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id CE9E2634C24;
        Wed,  2 Dec 2020 20:08:30 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 00/38] Support additional CCS PLL features, C-PHY
Date:   Wed,  2 Dec 2020 20:06:03 +0200
Message-Id: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
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

Also DT bindings are updated accordingly and converted to YAML format.

More information on MIPI CCS can be found here:

<URL:https://www.mipi.org/specifications/camera-command-set>

Comments are welcome.

since the big, big patchset (v2):

- Split into more easily reviewable chunks (this is the first of maybe
  three). The cover page describes the entire big set. This set contains
  support for additional CCS PLL features as well as making the CCS driver
  support them, including trivial dual PLL and C-PHY support --- as the
  first upstream sensor driver supporting C-PHY.

- Fix kerneldoc comments in CCS PLL documentation.

Sakari Ailus (38):
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

 drivers/media/i2c/ccs-pll.c            | 986 +++++++++++++++++--------
 drivers/media/i2c/ccs-pll.h            | 177 ++++-
 drivers/media/i2c/ccs/ccs-core.c       | 161 +++-
 drivers/media/i2c/ccs/ccs-quirk.c      |   5 +-
 drivers/media/i2c/ccs/ccs-reg-access.c |   4 +
 5 files changed, 974 insertions(+), 359 deletions(-)

-- 
2.27.0

