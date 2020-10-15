Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6C0128FB7D
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 01:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730540AbgJOXO2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Oct 2020 19:14:28 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:31373 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726877AbgJOXO2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Oct 2020 19:14:28 -0400
X-Halon-ID: 213f4d1e-0f3c-11eb-9f83-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2fef.dip0.t-ipconnect.de [79.202.47.239])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 213f4d1e-0f3c-11eb-9f83-005056917a89;
        Fri, 16 Oct 2020 01:14:13 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/5] rcar-vin: Support suspend and resume
Date:   Fri, 16 Oct 2020 01:14:03 +0200
Message-Id: <20201015231408.2399933-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This series add suspend and resume support directly to R-Car VIN and 
indirectly to R-Car CSI-2 and other subdevices in the VIN capture 
pipeline. The capture pipeline is stopped when suspending and started 
when resuming, all while retaining the buffers provided from user-space.  
This makes the start and stop of the pipeline transparent from an 
application point of view.

As the pipeline is switched off subdevices that poweroff themself when 
not in use (such as R-Car CSI-2) are also switched off and are 
indirectly serviced by the suspend support in VIN.

This work is based on-top of the media-tree and is tested on both R-Car 
Gen2 and Gen3 without any regressions.

Niklas Söderlund (5):
  rcar-vin: Use scratch buffer when not in running state
  rcar-vin: Remove handling of user-space buffers when stopping
  rcar-vin: Cache the CSI-2 channel selection value
  rcar-vin: Break out hardware start and stop to new methods
  rcar-vin: Add support for suspend and resume

 drivers/media/platform/rcar-vin/rcar-core.c |  51 ++++++++
 drivers/media/platform/rcar-vin/rcar-dma.c  | 129 +++++++++++---------
 drivers/media/platform/rcar-vin/rcar-vin.h  |  15 ++-
 3 files changed, 131 insertions(+), 64 deletions(-)

-- 
2.28.0

