Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E900189CE5
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 14:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgCRNZn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 09:25:43 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:59310 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727085AbgCRNZn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 09:25:43 -0400
X-Halon-ID: e0a9da5c-691b-11ea-9f40-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id e0a9da5c-691b-11ea-9f40-0050569116f7;
        Wed, 18 Mar 2020 14:25:07 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v5 0/4] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
Date:   Wed, 18 Mar 2020 14:25:09 +0100
Message-Id: <20200318132513.3089234-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This series aims to reduce the amount of boiler plate code in video
device drivers who's inputs and/or outputs are controlled by the Media
Controller instead of the V4L2 API.

Patch 1/4 adds a new video device capability flag V4L2_CAP_IO_MC which
if set provides helper implementations for the enum inputs and outputs
ioctls freeing the video device driver from the need to implement them.

Patch 2/4, 3/4 and 4/4 converts the R-Car VIN, Intel IPU3 and VIMC 
drivers to use the new default handlers and capability flag and delete 
the now redundant boiler plate code. I'm sure more video device drivers
can make use of this new flag but as I can only test on these two
platforms I have limited my changes to those.

A separate patch to v4l-utils will be posted separately as [1] to add a 
test for this feature to v4l2-compliance.

1. [PATCH 0/2] v4l2-compliance: add tests for V4L2_CAP_IO_MC

Niklas Söderlund (4):
  v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
  rcar-vin: Make use of V4L2_CAP_IO_MC
  staging/intel-ipu3: Make use of V4L2_CAP_IO_MC
  vimc: Make use of V4L2_CAP_IO_MC

 .../media/uapi/v4l/vidioc-querycap.rst        |  6 ++
 .../media/videodev2.h.rst.exceptions          |  1 +
 drivers/media/platform/rcar-vin/rcar-v4l2.c   | 17 +-----
 drivers/media/platform/vimc/vimc-capture.c    |  2 +-
 drivers/media/v4l2-core/v4l2-dev.c            | 25 ++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          | 57 ++++++++++++++++--
 drivers/staging/media/ipu3/ipu3-v4l2.c        | 58 +------------------
 include/uapi/linux/videodev2.h                |  2 +
 8 files changed, 84 insertions(+), 84 deletions(-)

-- 
2.25.1

