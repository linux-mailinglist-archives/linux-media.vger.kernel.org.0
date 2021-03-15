Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8DE33B368
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 14:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhCONOw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 09:14:52 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:51385 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbhCONOw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 09:14:52 -0400
X-Originating-IP: 79.22.58.175
Received: from uno.homenet.telecomitalia.it (host-79-22-58-175.retail.telecomitalia.it [79.22.58.175])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 6FCB0FF807;
        Mon, 15 Mar 2021 13:14:48 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/18] media: gmsl: Reliability improvement
Date:   Mon, 15 Mar 2021 14:14:54 +0100
Message-Id: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
  this series follows
https://patchwork.linuxtv.org/project/linux-media/list/?series=4650

Compared to the previous iteration the most substantial changes are
- max9271: Add a wakeup() function
- max9271: Add a patch to report errors from max9271_write()
- rdacm21: Re-work ov10640 initialization
  Laurent spotted a mis-use of the SPWDN gpio signal. Fixing it an re-applying
  the v1 patch that adds the correct delays to the power-up sequence fixes all
  the ov10640 sporadic initialization errors \o/
  Details in the commit message
- rdacm21: Increase OV490 firmware boot timeout. Details in the commit message.
- media: Propose de-depreaction of subdev init() core operation
- Squash max9286 and rdacm20/21 initialization sequence rework to maintain
  bisectability as suggestd by Kieran and Laurent
- Drop i2c speed adjustment as it seems not to have any impact on reliability

Run more than 300 boot tests on the in-development version of the series.
The previous iteration fixed the failure rate down to 13% from the 25% of the
current mainline version.

This new iteration on which I run 80 boot tests gave me a single failure when
tested with RDACM21 and R8A77970 Eagle board \o/

Thanks
   j

Jacopo Mondi (18):
  media: i2c: rdamc21: Fix warning on u8 cast
  media: i2c: rdacm20: Enable noise immunity
  media: i2c: rdacm20: Embedded 'serializer' field
  media: i2c: rdacm20: Replace goto with a loop
  media: i2c: rdacm20: Report camera module name
  media: i2c: max9271: Check max9271_write() return
  media: i2c: rdacm20: Check return values
  media: i2c: rdacm20: Re-work ov10635 reset
  media: i2c: max9271: Introduce wake_up() function
  media: i2c: max9286: Adjust parameters indent
  media: i2c: rdacm21: Fix OV10640 powerdown
  media: i2c: rdacm21: Give more time to OV490 to boot
  media: i2c: max9286: Rename reverse_channel_mv
  media: i2c: max9286: Cache channel amplitude
  media: i2c: max9286: Define high channel amplitude
  media: v4l2-subdev: De-deprecate init() subdev op
  media: gmsl: Reimplement initialization sequence
  media: i2c: max9286: Rework comments in .bound()

 drivers/media/i2c/max9271.c |  37 +++++++--
 drivers/media/i2c/max9271.h |   9 ++
 drivers/media/i2c/max9286.c |  61 ++++++++------
 drivers/media/i2c/rdacm20.c | 160 ++++++++++++++++++++----------------
 drivers/media/i2c/rdacm21.c |  74 ++++++++++-------
 include/media/v4l2-subdev.h |  15 +++-
 6 files changed, 223 insertions(+), 133 deletions(-)

--
2.30.0

