Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33B9B17C326
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 17:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgCFQkX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 11:40:23 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:31350 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbgCFQkX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Mar 2020 11:40:23 -0500
X-Halon-ID: 1c7bde43-5fc9-11ea-aa6d-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 1c7bde43-5fc9-11ea-aa6d-005056917f90;
        Fri, 06 Mar 2020 17:40:13 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [PATCH v4 0/3] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
Date:   Fri,  6 Mar 2020 17:39:32 +0100
Message-Id: <20200306163935.805333-1-niklas.soderlund@ragnatech.se>
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

Patch 1/3 adds a new video device capability flag V4L2_CAP_IO_MC which
if set provides helper implementations for the enum inputs and outputs
ioctrls freeing the video device driver from the need to implement them.

Patch 2/3 and 3/3 converts the R-Car VIN and Intel IPU3 drivers to use 
the new default handlers and capability flag and delete the now  
redundant boiler plate code. I'm sure more video device drivers
can make use of this new flag but as I can only test on these two
platforms I have limited my changes to those.

Niklas Söderlund (3):
  v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
  rcar-vin: Make use of V4L2_CAP_IO_MC
  staging/intel-ipu3: Make use of V4L2_CAP_IO_MC

 .../media/uapi/v4l/vidioc-querycap.rst        |  6 ++
 .../media/videodev2.h.rst.exceptions          |  1 +
 drivers/media/platform/rcar-vin/rcar-v4l2.c   | 17 +-----
 drivers/media/v4l2-core/v4l2-dev.c            | 25 ++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          | 57 ++++++++++++++++--
 drivers/staging/media/ipu3/ipu3-v4l2.c        | 60 +------------------
 include/uapi/linux/videodev2.h                |  2 +
 7 files changed, 84 insertions(+), 84 deletions(-)

-- 
2.25.1

