Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A06DCD78C7
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 16:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732807AbfJOOhF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 10:37:05 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:7645 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732712AbfJOOhA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 10:37:00 -0400
X-Halon-ID: ffc6f0d1-ef58-11e9-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id ffc6f0d1-ef58-11e9-837a-0050569116f7;
        Tue, 15 Oct 2019 16:35:36 +0200 (CEST)
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
Subject: [PATCH 0/3] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
Date:   Tue, 15 Oct 2019 16:35:49 +0200
Message-Id: <20191015143552.317669-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
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

Patch 1/3 adds the core parts of this change by adding a new video 
device capability flag V4L2_CAP_IO_MC which if set provides helper 
implementations for the get, set and enum inputs and outputs ioctrls 
freeing the video device driver from the need to implement them.

Patch 2/3 and 3/3 converts the R-Car VIN and Intel IPU3 drivers to use 
this new flag and delete the now redundant boiler plate code. I'm sure 
more video device drivers can make use of this new flag but as I can 
only test on these two platforms I have limited my changes to those.

1. https://patchwork.linuxtv.org/patch/41857/

Niklas Söderlund (3):
  v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
  rcar-vin: Make use of V4L2_CAP_IO_MC
  staging/intel-ipu3: Make use of V4L2_CAP_IO_MC

 .../media/uapi/v4l/vidioc-querycap.rst        |  3 +
 .../media/videodev2.h.rst.exceptions          |  1 +
 drivers/media/platform/rcar-vin/rcar-v4l2.c   | 17 +---
 drivers/media/v4l2-core/v4l2-dev.c            | 24 +++--
 drivers/media/v4l2-core/v4l2-ioctl.c          | 87 ++++++++++++++++++-
 drivers/staging/media/ipu3/ipu3-v4l2.c        | 60 +------------
 include/uapi/linux/videodev2.h                |  2 +
 7 files changed, 110 insertions(+), 84 deletions(-)

-- 
2.23.0

