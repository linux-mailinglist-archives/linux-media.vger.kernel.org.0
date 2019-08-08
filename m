Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C96285779
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 03:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389587AbfHHBTr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 21:19:47 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:17961 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389565AbfHHBTr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Aug 2019 21:19:47 -0400
X-Halon-ID: 9074e45a-b97a-11e9-bdc3-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [145.14.112.32])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 9074e45a-b97a-11e9-bdc3-005056917a89;
        Thu, 08 Aug 2019 03:19:37 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/6] rcar-vin: Add support for V4L2_FIELD_ALTERNATE
Date:   Thu,  8 Aug 2019 03:18:44 +0200
Message-Id: <20190808011850.21219-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This series adds support for V4L2_FIELD_ALTERNATE to rcar-vin. This
removes a limitation in the driver where a video sources delivering
video using the alternating field format was forced to use the rcar-vin
interlacer and V4L2_FIELD_INTERLACED was delivers to the user. After
this series the use of the interlacer is still default but the user have
the option to explicit ask for alternate.

It is based on latest media-tree and tested on R-Car Gen2 and Gen3
hardware.

Patch 1/6, 2/6 and 3/6 prepares for the work by fixing a broken return 
statement, use available macros and renaming a poorly variable. Patch 
4/6 fixes a problem with scaling (Gen2 only) which was found when 
testing alternating between V4L2_FIELD_ALTERNATE and 
V4L2_FIELD_INTERLACED. Patch 5/6 is the real change adding support for 
the new field format. Last 6/6 takes advantage of that the hardware 
interlacer is no longer a requirement and removes a bit of ugly code as 
a result.

Niklas Söderlund (6):
  rcar-vin: Fix incorrect return statement in rvin_try_format()
  rcar-vin: Make use of V4L2_FIELD_IS_INTERLACED() macro
  rcar-vin: Rename rectangle holding the video source information
  rcar-vin: Do not reset the crop and compose rectangles in s_fmt
  rcar-vin: Add support for V4L2_FIELD_ALTERNATE
  rcar-vin: Clean up how format is set on subdevice

 drivers/media/platform/rcar-vin/rcar-dma.c  |  54 ++++++-----
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 100 +++++++++-----------
 drivers/media/platform/rcar-vin/rcar-vin.h  |   4 +-
 3 files changed, 78 insertions(+), 80 deletions(-)

-- 
2.22.0

