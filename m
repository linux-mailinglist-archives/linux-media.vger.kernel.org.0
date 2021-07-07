Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBA333BEA8D
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 17:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232230AbhGGPWG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 11:22:06 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:46957 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232050AbhGGPWG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 11:22:06 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 57988E000B;
        Wed,  7 Jul 2021 15:19:23 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/4] media: Introduce post_register() subdev operation
Date:   Wed,  7 Jul 2021 17:19:59 +0200
Message-Id: <20210707152003.136272-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello, this series adds a new core operation to the v4l2 subdev ops to allow
deferring part of the initialization sequence to a later point in time.

I'll copy the commit message of the now superseded patch that was using the
deprecated init() subdev operation to achieve the same result

------------------------------------------------------------------------------
The current probe() procedure of the RDACM20 and RDACM21 GMSL cameras is
performed with the embedded MAX9271 serializer's noise immunity
threshold disabled. Once the camera has been initialized by probing the
embedded chips, the threshold is enabled and then compensated on the
deserializer's side by increasing the reverse channel signal amplitude
once all cameras have bound.

The probe routine is thus run without noise immunity activated which
in noisy environment conditions makes the probe sequence less reliable as
the chips configuration requires a relatively high amount of i2c
transactions.

Break chip initialization in two:

- At probe time only configure the serializer's reverse channel with
  noise immunity activated, to reduce the number of transactions
  performed without noise immunity protection enabled
- Move the chips initialization to the .post_register() core subdev operation
  called by the deserializer after all camera have probed and
  have increased their noise immunity threshold

The initialization routine looks like the following:

            MAX9286                  RDACM20/21

            probe()
               |
               ---------------------> |
                                      probe() {
                                         enable_threshold()
                                      }
               |<--------------------|
           v4l2 async bound {
                compensate_amplitude()
                call post_register()
               |-------------------->|
                                     init() {
                                         access camera registers()
                                    }
               |<-------------------
            }
-------------------------------------------------------------------------------

The usage of post_register() is opt-in. The receiver should explicitly require
to be in control of calling post_register() by setting the newly introduced
V4L2_ASYNC_NOTIFIER_DEFER_POST_REGISTER flag.

If the receiver does not specify such flag, post_registered() is called by the
core just after the subdevice has been registered.

Thanks
   j

Jacopo Mondi (4):
  media: v4l2-subdev: Introduce post_register() core op
  media: v4l2-async: Add notifier flags
  media: v4l2-async: Call post_register() subdev op
  media: i2c: gmsl: Defer camera initialization

 drivers/media/i2c/max9286.c          | 21 ++++++--
 drivers/media/i2c/rdacm20.c          | 81 ++++++++++++++++------------
 drivers/media/i2c/rdacm21.c          | 73 ++++++++++++++-----------
 drivers/media/v4l2-core/v4l2-async.c | 11 ++++
 include/media/v4l2-async.h           | 10 ++++
 include/media/v4l2-subdev.h          |  3 ++
 6 files changed, 130 insertions(+), 69 deletions(-)

--
2.32.0

