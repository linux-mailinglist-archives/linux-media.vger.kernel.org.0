Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A636326C650
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 19:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbgIPRpL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 13:45:11 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:52634 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbgIPRog (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 13:44:36 -0400
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 298A13AB401;
        Wed, 16 Sep 2020 15:45:18 +0000 (UTC)
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8435A24000F;
        Wed, 16 Sep 2020 15:39:54 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, mchehab@kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/2] media: i2c: Add support for RDACM21 camera module
Date:   Wed, 16 Sep 2020 17:43:36 +0200
Message-Id: <20200916154338.159747-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
   this series introduces support for the RDACM21 camera module, an automotive
camera module based on GMSL technology.

The camera module integrates a MAX9271 serializer, and OV10640 image sensor
coupled with an OV490 ISP. The image sensor and the ISP are programmed loading
the content of an EEPROM chip integrated in the camera module package and
are configured to produce images in 1280x1080 YUYV8 format.

The camera module driver uses the max9271 library to control the serializer,
as the RDACM20 does, to maximize code reuse.

And that's for patch 2/2: it's all unicorns and rainbows!

Patch 1/2 is the less nice one, and is sent as RFC to trigger discussions.

The camera module is connected to a MAXIM development board which integrates a
MAX9286 deserializer. The same expansion board is used with the RDACM20 camera
module and the max9286 driver is meant to work with both cameras without
modifications.

Unfortunately, each camera module has its own characteristics, in details:

- the RDACM20 module integrates a micro-controller unit that pre-programs the
  embedded max9271 serializer at power-up time. The serializer then operates
  with the GMSL reverse channel towards the de-serializer with electrical
  noise immunity feature enabled ("high-threshold" as per chip manual), and
  requires the de-serializer to communicate with the camera module with the
  reverse channel amplitude compensated to 170mV.

- the RDACM21 module is not pre-programmed by any micro-controller, and requires
  the de-serializer to initially maintain the reverse channel amplitude to
  100mV, then after the remote ends have been probed and have enabled the noise
  immunity feature on their reverse channels to increase the amplitude to 170mV
  to guarantee stability of the communications.

For that reason, a mechanism to control the reverse channel amplitude of the
GMSL channel is required. The channel amplitude is controlled by the
de-serializer, but depends on the properties of the remote serializer.

We have explored a few solutions in the past:
1) A dt property that specifies the initial reverse channel amplitude (or simply
   a boolean property that specifies if any channel pre-compensation is
   required). Issue is that the property should be set in the de-serializer
   but depends on the remote side configuration and on which camera module
   is currently connected.

2) Use get_mbus_config to retrieve the GMSL channel configuration. Hyun has
   added to get_mbus_config support for GMSL parameters to control the signal
   polarities[1]. This seems nice, but the channel amplitude has to be set
   -before- the remote end is probed and no subdev operation can be called
   until the remote sub-device have registered.

In this initial version, [1/2] simply adjust the reverse channel after all
remotes have probed, allowing support for RDACM21 but breaking compatibility
with RDACM20.

Any comment on how this should better be handled ?

Thanks
  j

[1] https://github.com/xlnx-hyunkwon/linux-xlnx/commits/hyunk/vision-wip-5.4-next

Jacopo Mondi (2):
  RFC: media: i2c: max9286: Compensate reverse channel
  media: i2c: Add driver for RDACM21 camera module

 MAINTAINERS                 |  12 +
 drivers/media/i2c/Kconfig   |  13 +
 drivers/media/i2c/Makefile  |   2 +
 drivers/media/i2c/max9286.c |   8 +-
 drivers/media/i2c/rdacm21.c | 541 ++++++++++++++++++++++++++++++++++++
 5 files changed, 574 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/i2c/rdacm21.c

--
2.28.0

