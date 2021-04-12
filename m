Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D04B735C1ED
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 11:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240999AbhDLJgg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:36:36 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:39825 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240594AbhDLJej (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 05:34:39 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 38672200005;
        Mon, 12 Apr 2021 09:34:16 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/17] media: gmsl: Reliability improvements
Date:   Mon, 12 Apr 2021 11:34:34 +0200
Message-Id: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
   series following:
v1: https://patchwork.linuxtv.org/project/linux-media/list/?series=4650
v2: https://patchwork.linuxtv.org/project/linux-media/list/?series=4861
v3: https://patchwork.linuxtv.org/project/linux-media/list/?series=4904

This series is a minor rework that builds on top of the comments received on v3.

I've re-order patches for better consumption:
[01/17] -> [05/17]: max9286 style fixes
[06/17] -> [07/17]: max9271 minor fixes
[08/17] -> [10/17]: rdamc21 fixes: these patches are relevant for RDACM21
 		    stability
[11/17] -> [15/17]: rdacm20 fixes
[16/17] -> [17/17]: GMSL initialization series rework, also relevant for syste,
                    stability

The only part where consensus still has to be reached is the last two patches.
Unfortunately, Sakari's suggestion of moving the remotes initialization to
s_stream() time did not work, and this version is the only one I've found that
gurantees a reliable initialization sequence. I've cc-ed Hans and Sakari to
continue the discussion.

Run quite some tests with Eagle and RDACM21: 1378 boot cycles with 100% boot
success (thanks Kieran for the board access).

Thanks
   j

Jacopo Mondi (17):
  media: i2c: max9286: Adjust parameters indent
  media: i2c: max9286: Rename reverse_channel_mv
  media: i2c: max9286: Cache channel amplitude
  media: i2c: max9286: Define high channel amplitude
  media: i2c: max9286: Rework comments in .bound()
  media: i2c: max9271: Check max9271_write() return
  media: i2c: max9271: Introduce wake_up() function
  media: i2c: rdacm21: Add dealy after OV490 reset
  media: i2c: rdacm21: Fix OV10640 powerup
  media: i2c: rdacm21: Power up OV10640 before OV490
  media: i2c: rdacm20: Enable noise immunity
  media: i2c: rdacm20: Embed 'serializer' field
  media: i2c: rdacm20: Report camera module name
  media: i2c: rdacm20: Check return values
  media: i2c: rdacm20: Re-work ov10635 reset
  media: v4l2-subdev: De-deprecate init() subdev op
  media: gmsl: Reimplement initialization sequence

 drivers/media/i2c/max9271.c |  42 +++++++++--
 drivers/media/i2c/max9271.h |   9 +++
 drivers/media/i2c/max9286.c |  56 +++++++++------
 drivers/media/i2c/rdacm20.c | 135 +++++++++++++++++++++---------------
 drivers/media/i2c/rdacm21.c | 124 +++++++++++++++++++++------------
 include/media/v4l2-subdev.h |  15 +++-
 6 files changed, 253 insertions(+), 128 deletions(-)

--
2.31.1

