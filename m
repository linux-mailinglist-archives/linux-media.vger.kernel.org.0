Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318302BC729
	for <lists+linux-media@lfdr.de>; Sun, 22 Nov 2020 17:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbgKVQhU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Nov 2020 11:37:20 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:19834 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727935AbgKVQhU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Nov 2020 11:37:20 -0500
X-Halon-ID: 3f7631f0-2cdf-11eb-8a9c-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 3f7631f0-2cdf-11eb-8a9c-005056917a89;
        Sun, 22 Nov 2020 17:25:00 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] adv748x: Add support for s2ram
Date:   Sun, 22 Nov 2020 17:36:34 +0100
Message-Id: <20201122163637.3590465-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series enables usage of the ADV748x after the system have been 
suspended to ram. During s2ram the ADV748x may be powered down and thus 
lose its configuration from probe time. The configuration contains  
among other things the i2c slave address mappings for the different 
blocks inside the ADV748x. If this is lost the hardware listens to the 
"wrong" i2c addresses and becomes inaccessible.

Example trying to read the analog standard before and after s2ram with 
and without this this series.

Without this series,

  # subdev=$(grep -l "adv748x 4-0070 afe" /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g')
  # v4l2-ctl --get-detected-standard -d $subdev
  Video Standard = 0x000000ff
          PAL-B/B1/G/H/I/D/D1/K
  # echo on > /sys/bus/i2c/drivers/bd9571mwv/*/bd9571mwv-regulator*/backup_mode
  ** flipp SW23 off **
  # echo mem > /sys/power/state
  ** flipp SW23 on **
  # v4l2-ctl --get-detected-standard -d $subdev
  [  502.753723] adv748x 4-0070: error reading 63, 02
  [  502.866437] adv748x 4-0070: error reading 63, 02
  VIDIOC_QUERYSTD: failed: No such device or address

With this series,

  # subdev=$(grep -l "adv748x 4-0070 afe" /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g')
  # v4l2-ctl --get-detected-standard -d $subdev
  Video Standard = 0x000000ff
          PAL-B/B1/G/H/I/D/D1/K
  # echo on > /sys/bus/i2c/drivers/bd9571mwv/*/bd9571mwv-regulator*/backup_mode
  ** flipp SW23 off **
  # echo mem > /sys/power/state
  ** flipp SW23 on **
  # v4l2-ctl --get-detected-standard -d $subdev
  Video Standard = 0x000000ff
          PAL-B/B1/G/H/I/D/D1/K

Also any streaming while the system is suspended to ram fails to resume 
without this series due to the issue demonstrated above. This series is 
tested on R-Car M3-N on-top of latest media-tree.

Niklas Söderlund (3):
  adv748x: afe: Select input port when device is reset
  adv748x: csi2: Set virtual channel when device is reset
  adv748x: Configure device when resuming from sleep

 drivers/media/i2c/adv748x/adv748x-afe.c  |  6 +----
 drivers/media/i2c/adv748x/adv748x-core.c | 29 ++++++++++++++++++++++--
 drivers/media/i2c/adv748x/adv748x-csi2.c |  6 +----
 drivers/media/i2c/adv748x/adv748x.h      |  2 ++
 4 files changed, 31 insertions(+), 12 deletions(-)

-- 
2.29.2

