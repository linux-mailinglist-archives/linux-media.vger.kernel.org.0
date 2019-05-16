Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F021F1FD62
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 03:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727393AbfEPBq2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 21:46:28 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:58968 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726917AbfEPBPB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 21:15:01 -0400
X-Halon-ID: fd2a1cf1-7777-11e9-8ab4-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id fd2a1cf1-7777-11e9-8ab4-005056917a89;
        Thu, 16 May 2019 03:14:57 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ulrich Hecht <uli@fpond.eu>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/8] rcar-vin: Merge Gen2 and Gen3 file operations
Date:   Thu, 16 May 2019 03:14:09 +0200
Message-Id: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se>
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
lot of code could me removed my merging the two sets.

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

 drivers/media/platform/rcar-vin/rcar-v4l2.c | 188 ++++----------------
 1 file changed, 38 insertions(+), 150 deletions(-)

-- 
2.21.0

