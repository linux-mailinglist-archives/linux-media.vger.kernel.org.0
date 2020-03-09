Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6063017DD1D
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 11:15:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbgCIKOv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 06:14:51 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34873 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726569AbgCIKOs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 06:14:48 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQj-0003mK-6T; Mon, 09 Mar 2020 11:14:37 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQg-0001lc-KL; Mon, 09 Mar 2020 11:14:34 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: [PATCH v12 00/19] TVP5150 Features and Fixes
Date:   Mon,  9 Mar 2020 11:14:09 +0100
Message-Id: <20200309101428.15267-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

here is the new and _hopefully_ last version :) This version contains
the discussion results with Sakari and some minor fixes from the v11.

Each patch has a dedicate log, so I avoid the details here and give only
an overview.

Patch 1-2:
Those where previously one patch.

Patch 3-6:
Prepare and implement the common v4l2-fwnode parsing code. I changed the
code from a single parse_and_add_links/free to parse/add_links/free. I
did the split to allow adding multiple links from different devices to a
_maybe_ coming global connector device. 

Patch 8:
I converted the parsing code to the new v4l2-fwnode-connector parsing
behaviour and fixed a two bugs during remove()

Patch 13:
This one is new due to the switch from the s_power() to the pm_runtime
as Sakari suggested.

Patch 14:
Also a new patch.

Patch 15:
New patch..

I've tested the series on a custom imx6-based board which uses the chip
directly (no-usb). I would appreciate if someone with a usb device can
test this too.

Regards,
  Marco

Javier Martinez Canillas (1):
  partial revert of "[media] tvp5150: add HW input connectors support"

Marco Felsch (17):
  dt-bindings: connector: analog: add sdtv standards property
  dt-bindings: display: add sdtv-standards defines
  media: v4l: link dt-bindings and uapi
  media: v4l2-fwnode: add endpoint id field to v4l2_fwnode_link
  media: v4l2-fwnode: add v4l2_fwnode_connector
  media: v4l2-fwnode: add initial connector parsing support
  media: tvp5150: add input source selection of_graph support
  media: dt-bindings: tvp5150: Add input port connectors DT bindings
  media: tvp5150: fix set_selection rectangle handling
  media: tvp5150: add FORMAT_TRY support for get/set selection handlers
  media: tvp5150: move irq en-/disable into runtime-pm ops
  media: tvp5150: add v4l2-event support
  media: tvp5150: add subdev open/close callbacks
  media: dt-bindings: tvp5150: cleanup bindings stlye
  media: dt-bindings: tvp5150: add optional sdtv standards documentation
  media: tvp5150: add support to limit sdtv standards
  media: tvp5150: make debug output more readable

Michael Tretter (1):
  media: tvp5150: initialize subdev before parsing device tree

 .../display/connector/analog-tv-connector.txt |   6 +
 .../devicetree/bindings/media/i2c/tvp5150.txt | 146 +++-
 drivers/media/i2c/tvp5150.c                   | 802 ++++++++++++++----
 drivers/media/v4l2-core/v4l2-fwnode.c         | 166 ++++
 include/dt-bindings/display/sdtv-standards.h  |  76 ++
 include/dt-bindings/media/tvp5150.h           |   2 -
 include/media/v4l2-fwnode.h                   | 143 ++++
 include/uapi/linux/videodev2.h                |   4 +
 8 files changed, 1146 insertions(+), 199 deletions(-)
 create mode 100644 include/dt-bindings/display/sdtv-standards.h

-- 
2.20.1

