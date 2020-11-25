Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F34E2C4598
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 17:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732087AbgKYQpb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 11:45:31 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:29090 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732090AbgKYQp2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 11:45:28 -0500
X-Halon-ID: 9a57f7fd-2f3d-11eb-a78a-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 9a57f7fd-2f3d-11eb-a78a-0050569116f7;
        Wed, 25 Nov 2020 17:45:24 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/5] v4l2-fwnode: Remove v4l2_async_notifier_parse_fwnode_endpoints_by_port() helper
Date:   Wed, 25 Nov 2020 17:44:45 +0100
Message-Id: <20201125164450.2056963-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series aims to remove a V4L2 helper that provides a too simple 
implementation, v4l2_async_notifier_parse_fwnode_endpoints_by_port().  
Instead drivers shall implement what the helper does directly to get 
greater control of the process. There is only one user left in tree of 
this interface, R-Car VIN.

This series starts therefor to rework the R-Car VIN driver to not depend 
on the helper. And in the process a small fwnode imbalance is fixed.  
After the last user of the helper is reworked the series removes the 
helper to prevent usage of it to resurface.

This series is based on-top of the latest media tree and is tested on 
Renesas R-Car M3-N and Koelsch without any regressions or change in 
behavior detected.

Niklas Söderlund (5):
  rcar-vin: Only dynamically allocate v4l2_async_subdev
  rcar-vin: Rework parallel firmware parsing
  rcar-vin: Use v4l2_async_subdev instead of fwnode_handle to match
    subdevices
  rcar-vin: Rework CSI-2 firmware parsing
  v4l2-fwnode: Remove
    v4l2_async_notifier_parse_fwnode_endpoints_by_port()

 drivers/media/platform/rcar-vin/rcar-core.c | 156 ++++++++++++--------
 drivers/media/platform/rcar-vin/rcar-dma.c  |  16 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  12 +-
 drivers/media/platform/rcar-vin/rcar-vin.h  |   8 +-
 drivers/media/v4l2-core/v4l2-fwnode.c       |  14 --
 include/media/v4l2-fwnode.h                 |  53 -------
 6 files changed, 113 insertions(+), 146 deletions(-)

-- 
2.29.2

