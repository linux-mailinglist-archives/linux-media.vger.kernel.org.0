Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3D391A9B51
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 12:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896612AbgDOKrf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 06:47:35 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:54171 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2896604AbgDOKrX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 06:47:23 -0400
Received: from uno.homenet.telecomitalia.it (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id F23CF240003;
        Wed, 15 Apr 2020 10:47:11 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/6] v4l2-subdev: Introduce get_mbus_format pad op
Date:   Wed, 15 Apr 2020 12:49:57 +0200
Message-Id: <20200415105004.2497356-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v2 introduces two new patches that could be likely squashed in later to
deprecate the g_mbus_config() operation in documentation and expand the newly
introduced function documentation by popular demand.

Will report again the use cases I'm trying to address here:
------------------------------------------------------------------------------
Quoting:
https://patchwork.kernel.org/cover/10855919/
"The use case this series cover is the following one:
the Gen-3 R-Car boards include an ADV748x HDMI/CVBS to CSI-2 converter
connected to its CSI-2 receivers. The ADV748x chip has recently gained support
for routing both HDMI and analogue video streams through its 4 lanes TXA
transmitter, specifically to support the Ebisu board that has a single CSI-2
receiver, compared to all other Gen-3 board where the ADV748x TXes are connected
to different CSI-2 receivers, and where analogue video is streamed out from the
ADV748x single lane TXB transmitter.
To properly support transmission of analogue video through TXA, the number of
data lanes shall be dynamically reduced to 1, in order to comply with the MIPI
CSI-2 minimum clock frequency requirements"

During the discussion of the RFC, Dave reported another use case for media
bus parameter negotiation on his platform:
https://patchwork.kernel.org/patch/10855923/#22569149

Another possible use case is for parallel bus multiplexing, where multiple image
sensor share the parallel bus lines and they get activated alternatively through
an enable signal. While this might not be most clever design, it's often seen
in the wild, and this operation allow receivers to re-configure their bus
parameter in between streaming session.

Hyun is now using this series to configure GMSL devices.
------------------------------------------------------------------------------

v1->v2:
- Address Sakari's comment to use unsigned int in place of bools
- Add two new patches to address documentation
- Adjust rcar-csi2 patch as much as possible according to Niklas comments
- Add Niklas's tags

Jacopo Mondi (6):
  media: v4l2-subdv: Introduce get_mbus_config pad op
  media: v4l2-subdev: Deprecate g_mbus_config video op
  media: v4l2-subdev: Expand get_mbus_config doc
  media: i2c: adv748x: Adjust TXA data lanes number
  media: i2c: adv748x: Implement get_mbus_config
  media: rcar-csi2: Negotiate data lanes number

 drivers/media/i2c/adv748x/adv748x-core.c    | 31 ++++++--
 drivers/media/i2c/adv748x/adv748x-csi2.c    | 15 ++++
 drivers/media/i2c/adv748x/adv748x.h         |  1 +
 drivers/media/platform/rcar-vin/rcar-csi2.c | 53 ++++++++++++-
 include/media/v4l2-subdev.h                 | 82 ++++++++++++++++++++-
 5 files changed, 171 insertions(+), 11 deletions(-)

--
2.26.0

