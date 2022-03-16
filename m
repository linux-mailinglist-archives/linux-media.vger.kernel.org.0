Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4694DB527
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 16:47:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356003AbiCPPsN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 11:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbiCPPsM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 11:48:12 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312F46D383;
        Wed, 16 Mar 2022 08:46:56 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 3B7EF240006;
        Wed, 16 Mar 2022 15:46:53 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 00/10] media: Multiplexed streams for R-Car CSI-2 and ADV748x
Date:   Wed, 16 Mar 2022 16:46:31 +0100
Message-Id: <20220316154641.511667-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.35.1
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

- Tomi's tomba/multistream/work-v11
- Niklas' CHSEL rework:
  "media: rcar-{csi2,vin}: Move to full Virtual Channel routing per CSI-2 IP"

The series makes adv748x a fully multiplexed device which can direct the video
stream on different source pad streams which select the virtual channel.

The CSI-2 support was sent already, but this time has been rebased on Niklas'
chsel rework. The CSI-2 is a multiplexed receiver with a fixed routing table
as the routing towards VIN is controlled by link enablement.

Finally VIN needs a little adjustment to support multiplexed transmitters.

v1 -> v2:
- rebased on Tomi's v11
- Modified R-Car CSI-2 VC handling as suggested by Niklas. Now I can capture
  all CSI-2 Virtual Channel from every VIN instance freely \o/

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
  media: rcar-vin: Support state-aware transmitters

 drivers/media/i2c/adv748x/adv748x-afe.c     |   2 +-
 drivers/media/i2c/adv748x/adv748x-core.c    |   4 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c    | 265 +++++++++++++++----
 drivers/media/i2c/adv748x/adv748x-hdmi.c    |   2 +-
 drivers/media/i2c/adv748x/adv748x.h         |   6 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c | 279 ++++++++++++++++----
 drivers/media/platform/rcar-vin/rcar-dma.c  |   3 +-
 7 files changed, 445 insertions(+), 116 deletions(-)

--
2.35.1

