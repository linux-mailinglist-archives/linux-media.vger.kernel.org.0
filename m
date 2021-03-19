Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72EB934221D
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 17:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbhCSQlo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 12:41:44 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:35555 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbhCSQld (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 12:41:33 -0400
X-Originating-IP: 5.92.35.220
Received: from uno.localdomain (mob-5-92-35-220.net.vodafone.it [5.92.35.220])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6F3CFC0004;
        Fri, 19 Mar 2021 16:41:28 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/19] media: gmsl: Reliability improvement
Date:   Fri, 19 Mar 2021 17:41:29 +0100
Message-Id: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
   series following:
https://patchwork.linuxtv.org/project/linux-media/list/?series=4650
https://patchwork.linuxtv.org/project/linux-media/list/?series=4861

Compared to the following iteration it seems RDACM21 is finally fixed \o/

I'll sum-up the issue here from the last email exchange:
-------------------------------------------------------------------------------
Basically, as patch "media: i2c: rdacm21: Fix OV10640 powerdown" of
this series describes, the OV10640 power-up was broken before you
spotted the usage of the wrong gpio pad and it was working because of
an internal pull-up on the SPWDN line, which was erroneously left
floating. Once that was fixed, the OV10640 was always identified
correctly, leaving us with this puzzling "ov490 boot timeout error"
that manifested with more or less the same frequency of the ov10640
identification issue.

In the current implementation we power up the OV490 and wait for its
firmware to boot -before- powering up the ov10640 sensor. Most
probably (or looking at the results I get noaw, most certainly) the
OV490 firmware checks for the sensor to be available and probably
tries to program it. So we're back to the issue we originally had when
the sensor was powered because of the pull up resistor, failing to
boot in case the sensor didn't startup correctly which happened in the
20% of the cases.

If I do power up the OV10640 -before- the OV490 all the firmware boot
errors are now gone. I need to tune a bit the timeouts as after the
OV490 boot the OV10640 requires some time before being accessible.
Once I nail down the right timeouts I'll send v3. So far I got 0
errors on 50 boot attempts, finally \o/
-------------------------------------------------------------------------------

The rest of the series is almost identical a few grammar fixes apart.
Thanks
   j

Jacopo Mondi (19):
  media: i2c: max9286: Adjust parameters indent
  media: i2c: max9286: Rename reverse_channel_mv
  media: i2c: max9286: Cache channel amplitude
  media: i2c: max9286: Define high channel amplitude
  media: v4l2-subdev: De-deprecate init() subdev op
  media: gmsl: Reimplement initialization sequence
  media: i2c: max9286: Rework comments in .bound()
  media: i2c: max9271: Check max9271_write() return
  media: i2c: max9271: Introduce wake_up() function
  media: i2c: rdamc21: Fix warning on u8 cast
  media: i2c: rdacm21: Add dealy after OV490 reset
  media: i2c: rdacm21: Fix OV10640 powerup
  media: i2c: rdacm21: Power up OV10640 before OV490
  media: i2c: rdacm20: Enable noise immunity
  media: i2c: rdacm20: Embed 'serializer' field
  media: i2c: rdacm20: Replace goto with a loop
  media: i2c: rdacm20: Report camera module name
  media: i2c: rdacm20: Check return values
  media: i2c: rdacm20: Re-work ov10635 reset

 drivers/media/i2c/max9271.c |  37 ++++++--
 drivers/media/i2c/max9271.h |   9 ++
 drivers/media/i2c/max9286.c |  61 ++++++++-----
 drivers/media/i2c/rdacm20.c | 174 +++++++++++++++++++++---------------
 drivers/media/i2c/rdacm21.c | 117 +++++++++++++++---------
 include/media/v4l2-subdev.h |  15 +++-
 6 files changed, 268 insertions(+), 145 deletions(-)

--
2.30.0

