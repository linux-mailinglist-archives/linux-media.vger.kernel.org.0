Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE7951B289F
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 15:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728847AbgDUN5u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 09:57:50 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:37799 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728337AbgDUN5u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 09:57:50 -0400
X-Halon-ID: 0d663786-83d8-11ea-aeed-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 0d663786-83d8-11ea-aeed-005056917f90;
        Tue, 21 Apr 2020 15:57:38 +0200 (CEST)
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
Subject: [PATCH v8 0/6] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
Date:   Tue, 21 Apr 2020 15:57:37 +0200
Message-Id: <20200421135743.1381930-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.26.0
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

Patch 1/6 adds a new video device capability flag V4L2_CAP_IO_MC which
if set provides helper implementations for the enum inputs and outputs
ioctls freeing the video device driver from the need to implement them.

Patch 2/6 fix initialization of reserved fields in the cx18 and ivtv 
drivers which becomes a problem in 3/6 where Laurent adds mbus filters to
VIDIOC_ENUM_FMT.

Patch 4/6, 5/6 and 6/6 converts the R-Car VIN, Intel IPU3 and VIMC
drivers to use the new default handlers and capability flag and delete
the now redundant boiler plate code. I'm sure more video device drivers
can make use of this new flag but as I can only test on these two
platforms I have limited my changes to those.

A separate patch to v4l-utils have been posted as [1] to add a
test for this feature in v4l2-compliance.

This version have been rebased to latest media-tree to account for the 
large shuffles of files. It has also replaced patch 2/6 with a different 
version that addresses both cx18 and ivtv instead of only ivtv.

1. [PATCH 0/2] v4l2-compliance: add tests for V4L2_CAP_IO_MC

Laurent Pinchart (2):
  media: pci: Fill v4l2_fmtdesc with designated initializers
  media: v4l2: Extend VIDIOC_ENUM_FMT to support MC-centric devices

Niklas Söderlund (4):
  v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
  rcar-vin: Make use of V4L2_CAP_IO_MC
  staging/intel-ipu3: Make use of V4L2_CAP_IO_MC
  vimc: Make use of V4L2_CAP_IO_MC

 .../media/v4l/vidioc-enum-fmt.rst             | 16 ++++-
 .../media/v4l/vidioc-querycap.rst             |  6 ++
 .../media/videodev2.h.rst.exceptions          |  1 +
 drivers/media/pci/cx18/cx18-ioctl.c           | 22 ++++--
 drivers/media/pci/ivtv/ivtv-ioctl.c           | 26 +++----
 drivers/media/platform/rcar-vin/rcar-v4l2.c   | 40 ++++++-----
 .../media/test-drivers/vimc/vimc-capture.c    | 14 +++-
 drivers/media/v4l2-core/v4l2-dev.c            | 25 +++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          | 70 +++++++++++++++++--
 drivers/staging/media/ipu3/ipu3-v4l2.c        | 64 ++---------------
 include/uapi/linux/videodev2.h                |  5 +-
 11 files changed, 180 insertions(+), 109 deletions(-)

-- 
2.26.0

