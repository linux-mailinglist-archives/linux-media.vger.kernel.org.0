Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEBD38F12C
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 18:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbfHOQsP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 12:48:15 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38908 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbfHOQsP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 12:48:15 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id F094C28CF68
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 0/6] V4L2 core I2C/SPI code cleanup
Date:   Thu, 15 Aug 2019 13:48:00 -0300
Message-Id: <20190815164806.19248-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro, Hans:

A new spin of this cleanup series. Goal here
is to remove some ifdefs and while at it remove some
low hanging fruit.

Patch 1 merges v4l2-common.ko into videodev.ko, since
it doesn't seem to be useful to have them splitted.

Patches 2 to 5 move the I2C and SPI helpers, so they
can be conditionally built.

Patch 6 removes unneeded BUG() calls in these helpers.
Hans, you suggested to replace BUG with WARN_ON,
but it seemed that just returning NULL was fine.

There are a few checkpatch.pl issues triggered here,
all of them belonging to the already existing code.
I'm not addressing that in this series.

The entire series should not affect any functionality,
but just clean-up the code a bit.

Thanks,
Eze

Ezequiel Garcia (6):
  media: v4l2-core: Module re-organization
  media: v4l2-core: move spi helpers out of v4l2-common.c
  media: v4l2-core: move i2c helpers out of v4l2-common.c
  media: v4l2-core: introduce a helper to unregister a spi subdev
  media: v4l2-core: introduce a helper to unregister a i2c subdev
  media: v4l2-core: Remove BUG() from i2c and spi helpers

 drivers/media/v4l2-core/Kconfig       |   5 +
 drivers/media/v4l2-core/Makefile      |   5 +-
 drivers/media/v4l2-core/v4l2-common.c | 214 --------------------------
 drivers/media/v4l2-core/v4l2-dev.c    |   4 +-
 drivers/media/v4l2-core/v4l2-device.c |  39 +----
 drivers/media/v4l2-core/v4l2-i2c.c    | 168 ++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-spi.c    |  73 +++++++++
 include/media/v4l2-common.h           | 150 +++++++++++++-----
 8 files changed, 366 insertions(+), 292 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-i2c.c
 create mode 100644 drivers/media/v4l2-core/v4l2-spi.c

-- 
2.22.0

