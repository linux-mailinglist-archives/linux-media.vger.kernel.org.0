Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 568C631CF39
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 18:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbhBPRmM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 12:42:12 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:43777 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbhBPRmL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 12:42:11 -0500
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 1FCC8200003;
        Tue, 16 Feb 2021 17:41:25 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/16] media: i2c: GMSL reliability improvements
Date:   Tue, 16 Feb 2021 18:41:30 +0100
Message-Id: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
  this series is based on the most recent media-master with the following
patch applied on top: "media: i2c: rdamc21: Fix warning on u8 cast"

The series contains multiple changes:

- patches from [1-8] contain enhancements to the existing camera module
  drivers. The first 7 patches apply to RDACM20 the same style comments
  received on RDACM21. Nothing controversial should be there.
  A cosmetic fix for the max9286 driver follows.

- patch [9/16] contains a fixup for the RDACM21 camera module that is required
  to avoid sporadic failures during the system initialization.

- From patches [10/16] a rework of the GMSL camera initialization procedure
  starts with 3 patches that prepare for the most substantial change on the
  series.

  The current initialization procedure for a GMSL chip looks like

	MAX9282				RDACM2x

	- probe()
	- init()
	- mux initialize()
		- probe camera 1	- probe()
					- init max9271
					- init image sensor/ISP
					- enable noise immunity
		...

	- camera 1 bound

		- probe camera n	- probe()
					- init max9271
					- init image sensor/ISP
					- enable noise immunity
	- camera n bound
	- all camera have probed
		- Increase channel amplitude

  This implies that all the initial configuration of the camera modules
  which requires several I2C transactions to configure the image sensor and
  the embedded ISP are run without noise immunity enabled.

  On a test of 50 boot cycle the failure rate for the RDACM21 camera module
  is around ~20% which is considerably bad.

  This series implements a different mechanism that allows to run the
  initialization of the camera module with noise immunity enabled, by splitting
  the operations between the usual probe() method and the .init() subdev
  core operation [1]

  The new procedure looks like

	MAX9282				RDACM2x

	- probe()
	- init()
	- mux initialize()
		- probe camera 1	- probe()
					- init max9271
					- enable noise immunity
	- camera 1 bound
	- increase channel amplitude
	- camera 1.init()
					- init image sensor/ISP
	- restore initial channel amplitude

		...
		- probe camera n	- probe()
					- init max9271
					- enable noise immunity
	- camera n bound
	- increase channel amplitude
	- camera n.init()
					- init image sensor/ISP
	- all camera have probed

  This allows to run the image sensor/ISP initialization with noise immunity
  enabled, as that's the part that requires the most I2C writes, being the
  components programmed with register-value tables.

  The same boot tests shows a failure percentage of 13%, considerably lower
  than the current version. It also allows to increase the I2C bit rate to the
  default 339 Kbps for which the setup/hold time are calibrated.

  Bouns points: this helps isolating the MAX9271 initialization and will make
  it easier making the max9271 a self-contained driver as suggested by Mauro.

  [1] All good and glorious BUT: all of this relies on the usage of a subdev
  operation that is considered deprecated. Is it an hard limitation ?

  GMSL is kind of different beast compared to usual subdevices, so it might
  make sense to make an exception in this case ?

Thanks
   j

Jacopo Mondi (16):
  media: i2c: rdacm20: Enable noise immunity
  media: i2c: rdacm20: Embedded 'serializer' field
  media: i2c: rdacm20: Replace goto with a loop
  media: i2c: rdacm20: Report camera module name
  media: i2c: rdacm20: Check return values
  media: i2c: rdacm20: Re-work ov10635 reset
  media: i2c: rdacm2x: Fix wake up delay
  media: i2c: max9286: Adjust parameters indent
  media: i2c: rdacm21: Re-work OV10640 initialization
  media: i2c: max9286: Rename reverse_channel_mv
  media: i2c: max9286: Cache channel amplitude
  media: i2c: max9286: Define high channel amplitude
  media: i2c: rdacm2x: Implement .init() subdev op
  media: i2c: max9286: Initialize remotes when bound
  media: i2c: max9286: Rework comments in .bound()
  media: i2c: gmsl: Use 339Kbps I2C bit-rate

 drivers/media/i2c/max9286.c |  67 ++++++++++------
 drivers/media/i2c/rdacm20.c | 153 +++++++++++++++++++-----------------
 drivers/media/i2c/rdacm21.c |  73 ++++++++++-------
 3 files changed, 167 insertions(+), 126 deletions(-)

--
2.30.0

