Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 990CA447B6
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 19:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729725AbfFMRBY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 13:01:24 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:16632 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729717AbfFLXqS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 19:46:18 -0400
X-Halon-ID: 3bccaf61-8d6c-11e9-8ab4-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 3bccaf61-8d6c-11e9-8ab4-005056917a89;
        Thu, 13 Jun 2019 01:46:06 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 0/8] rcar-vin: Merge Gen2 and Gen3 file operations
Date:   Thu, 13 Jun 2019 01:45:39 +0200
Message-Id: <20190612234547.14486-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This series aims to merge the two different set of file operations used
in the rcar-vin driver. One set was used on Renesas Gen2 boards while
the other set was used on Gen3. Main difference between the two is that
Gen2 uses a device node centric world view while Gen3 subscribes to the
media controller way of looking at things ;-)

After refactoring out a lot of code left over from the Gen2 mode which
stems from the drivers origin in soc_camera it became apparent that a
lot of code could me removed by merging the two sets.

Tested on both Gen2 and Gen3 no regressions found.

Niklas Söderlund (8):
  rcar-vin: Do not call pm_runtime_{resume,suspend}()
  rcar-vin: Remove unneeded calls to pm_runtime_{enable,disable}
  rcar-vin: Allow interrupting lock when trying to open the video device
  rcar-vin: Do not sync subdevice format when opening the video device
  rcar-vin: Move pm_runtime_{get,put} out of helpers
  rcar-vin: Merge helpers dealing with powering the parallel subdevice
  rcar-vin: Fold rvin_initialize_device() into rvin_open()
  rcar-vin: Merge Gen2 and Gen3 file operations

 drivers/media/platform/rcar-vin/rcar-v4l2.c | 192 +++++---------------
 1 file changed, 42 insertions(+), 150 deletions(-)

-- 
2.21.0

