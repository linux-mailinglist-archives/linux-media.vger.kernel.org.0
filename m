Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 479341A1182
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 18:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728182AbgDGQfb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 12:35:31 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:40305 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbgDGQfb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 12:35:31 -0400
X-Originating-IP: 2.224.242.101
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 4FE9B4000A;
        Tue,  7 Apr 2020 16:35:27 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), libcamera-devel@lists.libcamera.org
Subject: [PATCH v8 00/11] media: Report camera sensor properties
Date:   Tue,  7 Apr 2020 18:38:14 +0200
Message-Id: <20200407163825.1766483-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This new version includes Rob's ack on the 'rotation' DTS property definition
and addresses Hans' comments there.

The rest of the series, which mostly addresses controls remains to be
acknowledged and is unchanged compared to v7.

v7->v8:
- Add Rob's ack to 03/11
- Address Hans typographical comments in 03/11

Jacopo Mondi (11):
  dt-bindings: video-interfaces: Document 'location' property
  media: v4l2-ctrl: Document V4L2_CID_CAMERA_SENSOR_LOCATION
  dt-bindings: video-interface: Replace 'rotation' description
  media: v4l2-ctrl: Document V4L2_CID_CAMERA_SENSOR_ROTATION
  media: v4l2-ctrls: Add camera location and rotation
  media: v4l2-fwnode: Add helper to parse device properties
  include: v4l2-ctrl: Sort forward declarations
  media: v4l2-ctrls: Sort includes alphabetically
  media: v4l2-ctrls: Add helper to register properties
  media: i2c: ov5670: Parse and register properties
  media: i2c: ov13858: Parse and register properties

 .../bindings/media/video-interfaces.txt       | 372 +++++++++++++++++-
 .../media/uapi/v4l/ext-ctrls-camera.rst       | 153 +++++++
 drivers/media/i2c/ov13858.c                   |  11 +
 drivers/media/i2c/ov5670.c                    |  12 +
 drivers/media/v4l2-core/v4l2-ctrls.c          |  52 ++-
 drivers/media/v4l2-core/v4l2-fwnode.c         |  42 ++
 include/media/v4l2-ctrls.h                    |  34 +-
 include/media/v4l2-fwnode.h                   |  47 +++
 include/uapi/linux/v4l2-controls.h            |   7 +
 9 files changed, 718 insertions(+), 12 deletions(-)

--
2.26.0

