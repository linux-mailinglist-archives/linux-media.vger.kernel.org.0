Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B392FE8E3
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2019 00:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727404AbfKOX5K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 18:57:10 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:51235 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727064AbfKOX5J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 18:57:09 -0500
X-Halon-ID: 932bcc3d-0803-11ea-a0b9-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac5865.dip0.t-ipconnect.de [84.172.88.101])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 932bcc3d-0803-11ea-a0b9-005056917f90;
        Sat, 16 Nov 2019 00:57:03 +0100 (CET)
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
Subject: [PATCH v2 0/6] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
Date:   Sat, 16 Nov 2019 00:55:53 +0100
Message-Id: <20191115235559.806041-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

First of this series is based on work done by Helen in 2017 [1], I have
synced with her that it's OK for me to takeover the work.

This series aims to reduce the amount of boiler plate code in video
device drivers who's inputs and/or outputs are controlled by the Media
Controller instead of the V4L2 API.

Patch 1/6 adds a default handler for VIDIOC_{G,S}_{INPUT,OUTPUT} as 
suggested by Hans in v1. This allows video drivers (disregarding of the 
V4L2_CAP_IO_MC flag) to remove callbacks for these operations if they 
only provide a single input/output.

Patch 3/6 adds the core parts of this change by adding a new video
device capability flag V4L2_CAP_IO_MC which if set provides helper
implementations for the enum inputs and outputs ioctrls freeing the 
video device driver from the need to implement them.

Patch 2/6, 3/6, 5/6 and 6/6 converts the R-Car VIN and Intel IPU3 
drivers to use the new default handlers  and flag and delete the now 
redundant boiler plate code. I'm sure more video device drivers can make 
use of this new flag but as I can only test on these two platforms I 
have limited my changes to those.

1. https://patchwork.linuxtv.org/patch/41857/

Niklas Söderlund (6):
  v4l2-dev/ioctl: Add default handlers for VIDIOC_{G,S}_{INPUT,OUTPUT}
  rcar-vin: Use default VIDIOC_{G,S}_{INPUT,OUTPUT} handler
  staging/intel-ipu3: Use default VIDIOC_{G,S}_{INPUT,OUTPUT} handler
  v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
  rcar-vin: Make use of V4L2_CAP_IO_MC
  staging/intel-ipu3: Make use of V4L2_CAP_IO_MC

 .../media/uapi/v4l/vidioc-querycap.rst        |  3 +
 .../media/videodev2.h.rst.exceptions          |  1 +
 drivers/media/platform/rcar-vin/rcar-v4l2.c   | 32 +-------
 drivers/media/v4l2-core/v4l2-dev.c            | 18 +++--
 drivers/media/v4l2-core/v4l2-ioctl.c          | 80 ++++++++++++++++++-
 drivers/staging/media/ipu3/ipu3-v4l2.c        | 60 +-------------
 include/uapi/linux/videodev2.h                |  2 +
 7 files changed, 97 insertions(+), 99 deletions(-)

-- 
2.24.0

