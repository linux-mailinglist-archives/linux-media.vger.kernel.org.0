Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDDE923CF
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 14:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727630AbfHSMuS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 08:50:18 -0400
Received: from retiisi.org.uk ([95.216.213.190]:47444 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727039AbfHSMuS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 08:50:18 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 6067F634C87;
        Mon, 19 Aug 2019 15:49:45 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 0/6] Provide a serialisation mechanism for subdev ops
Date:   Mon, 19 Aug 2019 15:47:22 +0300
Message-Id: <20190819124728.10511-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

While access to the V4L2 device nodes was conveniently serialised for
devices the drivers of which used the V4L2 framework, this was no the case
for sub-devices that also may be called from other drivers.

Instead acquire the lock to the v4l2_subdev_call macro.

This set adds the capability to the framework and makes smiapp use it.

This is a big change. I'm still not posting this as RFC as the feature is
entirely optional. Albeit I'd expect new drivers to use it in the future:
quite a bit of code was removed from the smiapp driver as a result (there
were other cleanups, too).

Generally drivers that handle multiple sub-devices need to take special
care when making nested calls (hopefully as few as possible, but starting
streaming comes to mind). We may need an unlocked variant of the macro as
well.

Sakari Ailus (6):
  v4l: subdev: Set sd->devnode before registering the subdev
  v4l: subdev: Provide a locking scheme for subdev operations
  smiapp: Error handling cleanups and fixes
  smiapp: Rely on V4L2 sub-device framework to do the locking
  smiapp: Remove the active field from sensor's struct
  smiapp: Avoid fall-through in switch

 drivers/media/i2c/smiapp/smiapp-core.c | 203 ++++++++-----------------
 drivers/media/i2c/smiapp/smiapp-regs.c |   3 -
 drivers/media/i2c/smiapp/smiapp.h      |   1 -
 drivers/media/v4l2-core/v4l2-device.c  |   3 +-
 include/media/v4l2-subdev.h            |  25 ++-
 5 files changed, 86 insertions(+), 149 deletions(-)

-- 
2.20.1

