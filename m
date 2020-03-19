Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6B6D18A9F4
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 01:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgCSArN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 20:47:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47778 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgCSArN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 20:47:13 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D69A15F;
        Thu, 19 Mar 2020 01:47:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584578831;
        bh=BcMOyRrUsL1SHvIG76gQJHO0cS3lweqorql079gGhn4=;
        h=From:To:Cc:Subject:Date:From;
        b=qs0xWh0osMCVL80SpZtS45jEID1HwXReE8M8WsVsRaD+PR0OYAlapSQ/RAxtrFTJe
         2taVDT8XhpPnk9CpuLeT6MqUnRVieP/Iyk/3x5smoAjQWIPsO9Ao9TM8mHZ84wV/b9
         xITKVsSC6Szrclcpe48AcBQhtnu8jXVmxHNCK3tA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v6 0/5] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
Date:   Thu, 19 Mar 2020 02:46:56 +0200
Message-Id: <20200319004701.30416-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This is the sixth version of Niklas' eponymous series that aims to
reduce the amount of boiler plate code in video device drivers who's
inputs and/or outputs are controlled by the Media Controller instead of
the V4L2 API. I have merged it with the VIDIOC_ENUM_FMT extension for
MC-centric devices that was posted in [1], as the two are related.

Patch 1/5 adds the new video device capability flag V4L2_CAP_IO_MC and
is unchanged compared to Niklas' v5. Patch 2/5 is the rebased version of
the VIDIOC_ENUM_FMT extension that now depends on the V4L2_CAP_IO_MC
flag.

Patches 3/5, 4/5 and 5/5 converts the R-Car VIN, Intel IPU3 and VIMC
drivers to use the new default handlers and capability flag and delete
the now redundant boiler plate code. The IPU3 and VIMC drivers also
implement the VIDIOC_ENUM_FMT extension. This should be added to the
R-Car VIN driver in patch 3/5, that Niklas has nicely proposed to handle
for me :-)

A separate patch to v4l-utils has been posted ([2]) to add a test for
the V4L2_CAP_IO_MC feature to v4l2-compliance. Once the VIDIOC_ENUM_FMT
extension will stabilize, I will do the same for it.

[1] https://lore.kernel.org/linux-media/20200313152406.13347-1-laurent.pinchart@ideasonboard.com/
[2] https://lore.kernel.org/linux-media/20200318132722.3089925-1-niklas.soderlund+renesas@ragnatech.se/

Laurent Pinchart (1):
  media: v4l2: Extend VIDIOC_ENUM_FMT to support MC-centric devices

Niklas Söderlund (4):
  v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
  rcar-vin: Make use of V4L2_CAP_IO_MC
  staging/intel-ipu3: Make use of V4L2_CAP_IO_MC
  vimc: Make use of V4L2_CAP_IO_MC

 .../media/uapi/v4l/vidioc-enum-fmt.rst        | 19 +++--
 .../media/uapi/v4l/vidioc-querycap.rst        |  6 ++
 .../media/videodev2.h.rst.exceptions          |  1 +
 drivers/media/platform/rcar-vin/rcar-v4l2.c   | 17 +----
 drivers/media/platform/vimc/vimc-capture.c    | 10 ++-
 drivers/media/v4l2-core/v4l2-dev.c            | 25 +++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          | 70 +++++++++++++++++--
 drivers/staging/media/ipu3/ipu3-v4l2.c        | 64 ++---------------
 include/uapi/linux/videodev2.h                |  5 +-
 9 files changed, 125 insertions(+), 92 deletions(-)

-- 
Regards,

Laurent Pinchart

