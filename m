Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFB52E9508
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 13:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbhADMjl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 07:39:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbhADMjl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 07:39:41 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B1D6C061574
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 04:39:01 -0800 (PST)
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 7969A634C87
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 14:38:50 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kwP8M-0000Xb-DY
        for linux-media@vger.kernel.org; Mon, 04 Jan 2021 14:38:50 +0200
Date:   Mon, 4 Jan 2021 14:38:50 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.12] Additional CCS driver features
Message-ID: <20210104123850.GC850@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This pull request adds support for additional CCS driver features,
including digital gain support, alternative analogue gain support, analogue
gain coefficients and CCS shading correction controls.

Also the CCS driver and the PLL calculator are moved to kernel integer
types.

There are a few fixes and power-on sequence cleanups as well.

Please pull.


The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.12-2.1-signed

for you to fetch changes up to 16800ffed3ecfbb451b707018228bfd3954b118c:

  ccs: Small definition cleanup (2021-01-04 13:11:21 +0200)

----------------------------------------------------------------
Linux CCS driver patches for 5.12

----------------------------------------------------------------
Sakari Ailus (25):
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
      ccs: Hardware requires a delay after starting the clock of lifting reset
      ccs: Add a sanity check for external clock frequency
      ccs: Support and default to auto PHY control
      Documentation: Include CCS PLL calculator to CCS driver documentation
      ccs-pll: Switch from standard integer types to kernel ones
      ccs: Switch from standard integer types to kernel ones
      Revert "media: ccs-pll: Fix MODULE_LICENSE"
      ccs: Small definition cleanup

 Documentation/driver-api/media/drivers/ccs/ccs.rst |  13 +
 Documentation/userspace-api/media/drivers/ccs.rst  | 110 +++++++
 .../userspace-api/media/drivers/index.rst          |   1 +
 MAINTAINERS                                        |   2 +
 drivers/media/i2c/ccs-pll.c                        | 116 ++++----
 drivers/media/i2c/ccs-pll.h                        |  86 +++---
 drivers/media/i2c/ccs/ccs-core.c                   | 318 ++++++++++++++++++---
 drivers/media/i2c/ccs/ccs-data.c                   |   1 -
 drivers/media/i2c/ccs/ccs-data.h                   |   2 +
 drivers/media/i2c/ccs/ccs-reg-access.c             |  29 +-
 drivers/media/i2c/ccs/ccs.h                        |   8 +-
 drivers/media/i2c/ccs/smiapp-reg-defs.h            |   2 +
 include/uapi/linux/ccs.h                           |  18 ++
 include/uapi/linux/v4l2-controls.h                 |   5 +
 14 files changed, 551 insertions(+), 160 deletions(-)
 create mode 100644 Documentation/userspace-api/media/drivers/ccs.rst
 create mode 100644 include/uapi/linux/ccs.h

-- 
Sakari Ailus
