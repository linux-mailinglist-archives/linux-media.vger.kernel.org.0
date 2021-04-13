Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A2F35E5D8
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 20:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244907AbhDMSEV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 14:04:21 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:27638 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237671AbhDMSEU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 14:04:20 -0400
X-Halon-ID: 9b7fbcba-9c82-11eb-aed0-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 9b7fbcba-9c82-11eb-aed0-005056917f90;
        Tue, 13 Apr 2021 20:03:59 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 00/11] rcar-vin: Add r8a779a0 support
Date:   Tue, 13 Apr 2021 20:02:42 +0200
Message-Id: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series adds support for V3U (r8a779a0) to the R-Car VIN driver. The 
V3U SoC is different from other Renesas SoCs as a new IP block (the ISP 
channel selector) is added between the CSI-2 receiver and the VIN 
modules. This new ISP IP deals with CSI-2 channel filtering based on 
VC/DT which in turn makes the VIN drivers much simpler with regards to 
the media graph. But it also means the rcar-vin driver needs to support 
and generate both the generic Gen3 MC-graph and the specific V3U 
MC-graph.

The rcar-vin driver intertwines the VIN group concept and the usage of 
the media graph into a single implementation. This needs to be broken 
apart before the new V3U support can be added. The first 01/11 - 10/11 
patches deals with this separation and its fallout. Fortunately patch 
11/11 after all that preparation work is quiet simple and straight 
forward when adding the V3U support.

There is a large patch (10/11) in the series, reviewers please fear not 
it only moves blocks of code around verbatim.

While working on this series it have become even more apparent to me 
that the VIN group concept probably should be replaced with something 
like the Media Device Allocator API once it learns how to work with DT.  
This series separation of the two VIN concepts is a good first step for 
me to hope to find time to dig into that.

Updates to the DT bindings have been posted in a separate patch.

Niklas Söderlund (11):
  rcar-vin: Refactor controls creation for video device
  rcar-vin: Fix error paths for rvin_mc_init()
  rcar-vin: Improve async notifier cleanup paths
  rcar-vin: Improve reuse of parallel notifier
  rcar-vin: Rename array storing subdevice information
  rcar-vin: Move group async notifier
  rcar-vin: Extend group notifier DT parser to work with any port
  rcar-vin: Create a callback to setup media links
  rcar-vin: Specify media device ops at group creation time
  rcar-vin: Move and rename CSI-2 link notifications
  rcar-vin: Add r8a779a0 support

 drivers/media/platform/rcar-vin/rcar-core.c | 973 +++++++++++---------
 drivers/media/platform/rcar-vin/rcar-dma.c  |  20 +-
 drivers/media/platform/rcar-vin/rcar-vin.h  |  24 +-
 3 files changed, 581 insertions(+), 436 deletions(-)

-- 
2.31.1

