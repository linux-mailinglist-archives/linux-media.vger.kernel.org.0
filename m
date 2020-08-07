Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 396F123EC37
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 13:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726226AbgHGLQl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 07:16:41 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:13288 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726987AbgHGLQk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Aug 2020 07:16:40 -0400
X-Halon-ID: 6eb52ecf-d89f-11ea-a39b-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac52a8.dip0.t-ipconnect.de [84.172.82.168])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 6eb52ecf-d89f-11ea-a39b-005056917f90;
        Fri, 07 Aug 2020 13:16:37 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] v4l: async: Switch to endpoint node matching
Date:   Fri,  7 Aug 2020 13:16:17 +0200
Message-Id: <20200807111619.3664763-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

With the recent merger of [1] in the media-tree it is finally possible 
to resurrect the last pieces of the work that started in 2017 :-)

Patch 1/2 switches the default behavior of V4L2 async to use endpoint 
node matching instead of device node matching. This is made possible by 
[1] where the matching logic is already changed to allow for both 
possibilities.

Patch 2/2 removes the special case in R-Car CSI-2 driver which have 
always used endpoint node matching since it needed to work with ADV748x 
that register multiple sub-devices using endpoint nodes in the async 
framework.

With this small series the split between V4L2 drivers that use endpoint 
vs device node matching is finally closed \o/.

1. b98158d837efa0b2 ("media: v4l2-async: Accept endpoints and devices for fwnode matching")

Niklas Söderlund (1):
  rcar-csi2: Use V4L2 async helpers to create the notifier

Sakari Ailus (1):
  v4l: async: Use endpoint node, not device node, for fwnode match

 drivers/media/platform/rcar-vin/rcar-csi2.c | 48 +++++----------------
 drivers/media/v4l2-core/v4l2-async.c        |  8 +++-
 drivers/media/v4l2-core/v4l2-fwnode.c       |  2 +-
 3 files changed, 18 insertions(+), 40 deletions(-)

-- 
2.28.0

