Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB9C4B92D9
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 22:04:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233295AbiBPVES (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Feb 2022 16:04:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234075AbiBPVEI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Feb 2022 16:04:08 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21F4B2B0B09;
        Wed, 16 Feb 2022 13:03:45 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id B8E6B1BF206;
        Wed, 16 Feb 2022 21:03:42 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 00/10] media: Multiplexed streams for R-Car CSI-2 and ADV748x
Date:   Wed, 16 Feb 2022 22:04:37 +0100
Message-Id: <20220216210447.481006-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
   this series build up several other branches:

- Tomi's tomba/multistream/work-v10
- Niklas' CHSEL rework:
  "media: rcar-{csi2,vin}: Move to full Virtual Channel routing per CSI-2 IP"

Both rebased on the most recent media-master.

The series makes adv748x a fully multiplexed device which can direct the video
stream on different source pad streams which select the virtual channel.

The CSI-2 support was sent already, but this time has been rebased on Niklas'
chsel rework. The CSI-2 is a multiplexed receiver with a fixed routing table
as the routing towards VIN is controlled by link enablement.

Finally VIN needs a little adjustment to support multiplexed transmitters.

Need more testing but I've been able to capture each VC on the corresponding VIN
(vc x -> CSI2:x + 1 -> VINx)

Niklas:
I have an additional script for vin-tests if interested.

A branch for testing is available at
https://git.sr.ht/~jmondi_/linux multistream/media-master/tomba-v10/niklas/adv748x

Thanks
   j

Jacopo Mondi (10):
  media: adv748x: Add flags to adv748x_subdev_init()
  media: adv748x: Add support for v4l2_subdev_state
  media: adv748x: Move format to subdev state
  media: adv748x: Implement .get_frame_desc()
  media: adv748x: Implement set_routing
  media: rcar-csi2: Add support for multiplexed streams
  media: rcar-csi2: Move format to subdev state
  media: rcar-csi2: Config by using the remote frame_desc
  media: rcar-csi2: Implement set_routing
  media: rcar-vin: Support multiplexed transmitters

 drivers/media/i2c/adv748x/adv748x-afe.c     |   2 +-
 drivers/media/i2c/adv748x/adv748x-core.c    |   4 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c    | 292 ++++++++++++++----
 drivers/media/i2c/adv748x/adv748x-hdmi.c    |   2 +-
 drivers/media/i2c/adv748x/adv748x.h         |   6 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c | 312 ++++++++++++++++----
 drivers/media/platform/rcar-vin/rcar-dma.c  |   3 +-
 7 files changed, 497 insertions(+), 124 deletions(-)

--
2.35.0

