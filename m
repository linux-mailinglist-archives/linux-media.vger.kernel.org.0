Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFB07182DCF
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 11:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgCLKco (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 06:32:44 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58705 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbgCLKc1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 06:32:27 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jCL8T-0002xl-Ar; Thu, 12 Mar 2020 11:32:17 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jCL8R-0001Jn-AL; Thu, 12 Mar 2020 11:32:15 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: [PATCH v13 00/19] TVP5150 Features and Fixes
Date:   Thu, 12 Mar 2020 11:31:35 +0100
Message-Id: <20200312103156.3178-1-m.felsch@pengutronix.de>
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

since my v12 wasn't the last I drop any comments about that here ;)
Anyway this version addresses Sakari's and Hans comments.

In short:
- Patch 4 and 5 are new according Sakari's comments. I splitted them
  due to backport reasons (something for stable?).
- Patch 8:
  - address the memory leak bug
  - address the uselsee connector NULL set
- Patch 13:
  - fixes the non static issue

Regards,
  Marco

Javier Martinez Canillas (1):
  partial revert of "[media] tvp5150: add HW input connectors support"

Marco Felsch (19):
  dt-bindings: connector: analog: add sdtv standards property
  dt-bindings: display: add sdtv-standards defines
  media: v4l: link dt-bindings and uapi
  media: v4l2-fwnode: fix v4l2_fwnode_parse_link handling
  media: v4l2-fwnode: simplify v4l2_fwnode_parse_link
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
 drivers/media/v4l2-core/v4l2-fwnode.c         | 192 ++++-
 include/dt-bindings/display/sdtv-standards.h  |  76 ++
 include/dt-bindings/media/tvp5150.h           |   2 -
 include/media/v4l2-fwnode.h                   | 143 ++++
 include/uapi/linux/videodev2.h                |   4 +
 8 files changed, 1156 insertions(+), 215 deletions(-)
 create mode 100644 include/dt-bindings/display/sdtv-standards.h

-- 
2.20.1

