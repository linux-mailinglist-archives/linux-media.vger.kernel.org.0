Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E82F3204C6E
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 10:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731824AbgFWIcY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 04:32:24 -0400
Received: from retiisi.org.uk ([95.216.213.190]:55876 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731579AbgFWIcX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 04:32:23 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 05C8F634C87
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2020 11:32:03 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jneLa-000168-Ui
        for linux-media@vger.kernel.org; Tue, 23 Jun 2020 11:32:02 +0300
Date:   Tue, 23 Jun 2020 11:32:02 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 5.9] Camera sensor driver patches + MC crash fix
Message-ID: <20200623083202.GC870@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a set of camera sensor patches for 5.9, including an omap3isp driver
fix and last but not least, a fix for a memory allocation issue causing a
crash in the media request API.

Please pull.


The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.9-1-signed

for you to fetch changes up to d23e5ef40d006631fdfb92d6c8c56e7ed886f1d3:

  media: media-request: Fix crash if memory allocation fails (2020-06-22 19:54:29 +0300)

----------------------------------------------------------------
Sensor driver patches for 5.9 + MC crash fix

----------------------------------------------------------------
Andrey Konovalov (4):
      media: i2c: imx290: set the format before VIDIOC_SUBDEV_G_FMT is called
      media: i2c: imx290: fix the order of the args in SET_RUNTIME_PM_OPS()
      media: i2c: imx290: fix reset GPIO pin handling
      media: i2c: imx290: set bus_type before calling v4l2_fwnode_endpoint_alloc_parse()

Bingbu Cao (1):
      media: ov2740: make ov2740 driver only work with ACPI

Chuhong Yuan (2):
      media: marvell-ccic: Add missed v4l2_async_notifier_cleanup()
      media: omap3isp: Add missed v4l2_ctrl_handler_free() for preview_init_entities()

Dinghao Liu (1):
      media: smiapp: Fix runtime PM imbalance on error

Manivannan Sadhasivam (6):
      media: i2c: imx290: Add support for 2 data lanes
      media: i2c: imx290: Add configurable link frequency and pixel rate
      media: i2c: imx290: Add support for test pattern generation
      media: i2c: imx290: Add RAW12 mode support
      media: i2c: imx290: Add support to enumerate all frame sizes
      media: i2c: imx290: Move the settle time delay out of loop

Qingwu Zhang (1):
      media: ov2740: add NVMEM interface to read customized OTP data

Sakari Ailus (1):
      smiapp: Use pm_runtime_get_if_active

Tuomas Tynkkynen (1):
      media: media-request: Fix crash if memory allocation fails

 drivers/media/i2c/Kconfig                       |   1 +
 drivers/media/i2c/imx290.c                      | 404 ++++++++++++++++++++----
 drivers/media/i2c/ov2740.c                      | 149 ++++++++-
 drivers/media/i2c/smiapp/smiapp-core.c          |   5 +-
 drivers/media/mc/mc-request.c                   |  31 +-
 drivers/media/platform/marvell-ccic/mcam-core.c |   2 +
 drivers/media/platform/omap3isp/isppreview.c    |   4 +-
 7 files changed, 514 insertions(+), 82 deletions(-)

-- 
Kind regards,

Sakari Ailus
