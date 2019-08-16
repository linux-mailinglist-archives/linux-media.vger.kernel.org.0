Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23264903D2
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 16:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbfHPORD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 10:17:03 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:54695 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727291AbfHPORD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 10:17:03 -0400
X-Originating-IP: 87.5.130.64
Received: from uno.homenet.telecomitalia.it (host64-130-dynamic.5-87-r.retail.telecomitalia.it [87.5.130.64])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id EDA65FF80E;
        Fri, 16 Aug 2019 14:16:59 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/6] media: v4l2-ctrls: Add camera sensor location
Date:   Fri, 16 Aug 2019 16:18:16 +0200
Message-Id: <20190816141822.7582-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
  after yesterday's RFC I'm now sending a proper v1 for inclusion.
Thanks Hans, Laurent and Sakari for the comments on the RFC.

I have expanded the documentation, finalized on an integer control to expose
the camera sensor location, and provided and helper in v4l2-fwnode to parse
the firmware property and register the associated control.

On the helper: right now only 'location' is parsed and the assoiated
V4L2_CID_CAMERA_SENSOR_LOCATION control registered. Ideally, I would have liked
to support more properties coming from firmware and exposed through controls,
but:
- V4L2_CID_LINK_FREQ which corresponds to the 'link-frequencies' property is
  never directly parsed for firmware and exposed as a control in any mainline
  driver. The contrary is actually true: all drivers but smiapp register values
  not coming from DT but hardcoded in the driver itself. smiapp parses the link
  frequencies from DT but does not expose them directly. This makes me wonder
  about the actual purpose of the property if nobody uses that.
  Should drivers be moved to retrieve the property from firmware instead?
- V4L2_CID_PIXEL_RATE depends on the link frequencies, number of lanes and
  configured image format. It seems better handled by drivers instead of in an
  helper considering how many parameters are required to calculate it.

So the newly added function just parses and expose the camera location, which
makes me wonder if it's worth an helper at all. What other properties could be
parsed and registered as controls which I have missed?

Thanks
   j

Jacopo Mondi (6):
  media: dt-bindings: Document 'location' property
  media: v4l2-ctrl: Document V4L2_CID_LOCATION
  media: v4l2-ctrls: Add support for V4L2_CID_LOCATION
  media: v4l2-fwnode: Add helper to register controls from fw
  media: i2c: ov5670: Register controls from firmware
  media: i2c: ov13858: Register controls from firmware

 .../bindings/media/video-interfaces.txt       | 10 +++++
 .../media/uapi/v4l/ext-ctrls-camera.rst       | 34 ++++++++++++++++
 drivers/media/i2c/ov13858.c                   |  8 ++++
 drivers/media/i2c/ov5670.c                    |  7 ++++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  2 +
 drivers/media/v4l2-core/v4l2-fwnode.c         | 40 +++++++++++++++++++
 include/media/v4l2-fwnode.h                   | 29 ++++++++++++++
 include/uapi/linux/v4l2-controls.h            |  5 +++
 8 files changed, 135 insertions(+)

--
2.22.0

