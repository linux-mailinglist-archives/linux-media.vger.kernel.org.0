Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A192E9B68
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 17:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbhADQ6b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 11:58:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbhADQ6b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 11:58:31 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B2EFC061574
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 08:57:51 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 427AC1F44B6C
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 0/6] Remove last users of v4l2-clk and remove v4l2-clk
Date:   Mon,  4 Jan 2021 13:57:33 -0300
Message-Id: <20210104165739.116404-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2 temporary clock helper API is used by just one last capture
driver, pxa-camera, which registers a dummy clock; and then by just
a few sensor drivers, consuming clocks through the v4l2-clk API.

It's possible to convert these few last users, and so remove
the v4l2-clk API, which hasn't been used for a few years.

The sensor drivers are already using the CCF API,
which v4l2-clk API uses as fallback.

To convert the pxa-camera driver, a fixed-rate clock
is registered for the mach-based platforms that still exist,
for mt9m111 to work (the only sensor that PXA currently
registers).

Ezequiel Garcia (6):
  media: mach-pxa: Register the camera sensor fixed-rate clock
  media: pxa_camera: Drop the v4l2-clk clock register
  media: ov9640: Use the generic clock framework
  media: mt9m111: Use the generic clock framework
  media: ov6650: Use the generic clock framework
  media: Remove the legacy v4l2-clk API

 .../driver-api/media/v4l2-clocks.rst          |  31 --
 Documentation/driver-api/media/v4l2-core.rst  |   1 -
 arch/arm/mach-pxa/devices.c                   |   8 +
 drivers/media/i2c/mt9m111.c                   |  17 +-
 drivers/media/i2c/ov6650.c                    |  26 +-
 drivers/media/i2c/ov9640.c                    |  15 +-
 drivers/media/i2c/ov9640.h                    |   4 +-
 drivers/media/platform/pxa_camera.c           |  30 +-
 drivers/media/v4l2-core/Makefile              |   2 +-
 drivers/media/v4l2-core/v4l2-clk.c            | 321 ------------------
 include/media/v4l2-clk.h                      |  73 ----
 11 files changed, 37 insertions(+), 491 deletions(-)
 delete mode 100644 Documentation/driver-api/media/v4l2-clocks.rst
 delete mode 100644 drivers/media/v4l2-core/v4l2-clk.c
 delete mode 100644 include/media/v4l2-clk.h

-- 
2.29.2

