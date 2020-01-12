Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB4DB1388B5
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 00:25:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387460AbgALXZV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Jan 2020 18:25:21 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:19470 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727323AbgALXZV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Jan 2020 18:25:21 -0500
X-Halon-ID: c956a093-3592-11ea-a00b-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac5d7b.dip0.t-ipconnect.de [84.172.93.123])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id c956a093-3592-11ea-a00b-005056917a89;
        Mon, 13 Jan 2020 00:25:19 +0100 (CET)
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
Subject: [PATCH v3 0/5] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
Date:   Mon, 13 Jan 2020 00:24:53 +0100
Message-Id: <20200112232458.2844506-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.24.1
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

Patch 1/5 adds a new video device capability flag V4L2_CAP_IO_MC which 
if set provides helper implementations for the enum inputs and outputs 
ioctrls freeing the video device driver from the need to implement them.  

It also adds a default handler for VIDIOC_{G,S}_{INPUT,OUTPUT} as
suggested by Hans in v1. This allows video drivers (disregarding of the
V4L2_CAP_IO_MC flag) to remove callbacks for these operations if they
only provide a single input/output.

Patch 2/5, 3/5, 4/5 and 5/5 converts the R-Car VIN and Intel IPU3
drivers to use the new default handlers and capability flag and delete 
the now  redundant boiler plate code. I'm sure more video device drivers 
can make use of this new flag but as I can only test on these two 
platforms I have limited my changes to those.

1. https://patchwork.linuxtv.org/patch/41857/

Niklas Söderlund (5):
  v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
  rcar-vin: Use default VIDIOC_{G,S}_{INPUT,OUTPUT} handler
  staging/intel-ipu3: Use default VIDIOC_{G,S}_{INPUT,OUTPUT} handler
  rcar-vin: Make use of V4L2_CAP_IO_MC
  staging/intel-ipu3: Make use of V4L2_CAP_IO_MC

 .../media/uapi/v4l/vidioc-querycap.rst        |  5 ++
 .../media/videodev2.h.rst.exceptions          |  1 +
 drivers/media/platform/rcar-vin/rcar-v4l2.c   | 32 +--------
 drivers/media/v4l2-core/v4l2-dev.c            | 19 +++--
 drivers/media/v4l2-core/v4l2-ioctl.c          | 69 +++++++++++++++++--
 drivers/staging/media/ipu3/ipu3-v4l2.c        | 60 +---------------
 include/uapi/linux/videodev2.h                |  2 +
 7 files changed, 89 insertions(+), 99 deletions(-)

-- 
2.24.1

