Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 418AC184987
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 15:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgCMOhv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 10:37:51 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:55365 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgCMOhu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 10:37:50 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id DB65FFF806;
        Fri, 13 Mar 2020 14:37:45 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        dave.stevenson@raspberrypi.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/4] v4l2-subdev: Introduce get_mbus_format pad op
Date:   Fri, 13 Mar 2020 15:40:31 +0100
Message-Id: <20200313144035.401430-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series introduces a pad oriented operation, much similar to the existing
s/g_mbus_config subdv video operation, to allow dyanmic negotiation of media
bus parameter.

The existing s/g_mbus_format are on their way to deprecation, due to the fact
they operate at device level being a video op instead of pad level as this new
implementation does.

The use case I'm addressing is described here, in the RFC sent one year ago
on top of Sakari's v4l-multiplexed work, where I tried to extend the frame
descriptor to transport media bus information.

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

For now I have left untouched definitions and users of the existing
s/g_mbus_config ops, waiting for feedback on this first implementation.

Thanks
   j

Jacopo Mondi (4):
  media: i2c: adv748x: Adjust TXA data lanes number
  media: v4l2-subdv: Introduce get_mbus_config pad op
  media: i2c: adv748x: Implement get_mbus_config
  media: rcar-vin: csi2: Negotiate data lanes number

 drivers/media/i2c/adv748x/adv748x-core.c    | 31 +++++++---
 drivers/media/i2c/adv748x/adv748x-csi2.c    | 15 +++++
 drivers/media/i2c/adv748x/adv748x.h         |  1 +
 drivers/media/platform/rcar-vin/rcar-csi2.c | 49 ++++++++++++++-
 include/media/v4l2-subdev.h                 | 67 +++++++++++++++++++++
 5 files changed, 153 insertions(+), 10 deletions(-)

--
2.25.1

