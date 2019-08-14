Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAB2F8DEBB
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 22:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbfHNU1H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 16:27:07 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:56447 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbfHNU1H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 16:27:07 -0400
X-Originating-IP: 87.5.130.64
Received: from uno.homenet.telecomitalia.it (host64-130-dynamic.5-87-r.retail.telecomitalia.it [87.5.130.64])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 51F40FF808;
        Wed, 14 Aug 2019 20:27:03 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Subject: [RFC 0/5] media: v4l2-ctrls: Add camera 'location' support
Date:   Wed, 14 Aug 2019 22:28:10 +0200
Message-Id: <20190814202815.32491-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
  as anticipared on #v4l, this is a proposal to add a way for camera devices
to report their mounting location to user-space. The information on the camera
location is particularly meaningful for mobile devices, and in the process of
integrating libcamera with the Android camera stack, we found the need to report
this information to applications and there's currently no way to retrieve it
from the V4L2 API

The idea is to provide a camera class read-only control, named 'Location',
that is used to report the camera mounting position, which is retrieved from
the firmware interface. Hans mentioned v4l2-properties as a better mechanism to
report such static informations, but since they're not here I think a control
would do for now...

The RFC adds a DT standard property to video-interfaces.txt to express the
location in DTS (I actually tested it on ACPI, but..), and then adds a new
control in the camera class to expose it. Finally, two example sensor drivers I
used for testing have been modified to expose the read-only control.

Why an RFC: mostly because of the nature and definition of the property. It's
tricky to define the "location" semantic clearly as it really depends
on the device the camera it is installed on. To begin with, I only defined
FRONT and BACK locations, and documented them the best I could.

Also the control itself it's probably more appropriate expressed as an integer
menu control. However, given the few supported values, and the fact they are
standard, I went for a standard integer control and defined a few macros for the
possible values as setting up a menu control requires a bit more effort in
drivers which I'm not sure it is worth it.

I tried out a few different names for the property as well, such as
"orientation", "position", "mounting-position" but none of them really satisfied
me, so I picked the most simple one. Feedbacks are welcome here too.

Thanks
  j


Jacopo Mondi (5):
  media: dt-bindings: Document 'location' property
  media: v4l2-ctrl: Document V4L2_CID_LOCATION
  media: v4l2-ctrls: Add support for V4L2_CID_LOCATION
  media: i2c: ov5670: Report the camera location
  media: i2c: ov13858: Report the camera location

 .../bindings/media/video-interfaces.txt       |  4 ++++
 .../media/uapi/v4l/ext-ctrls-camera.rst       | 23 +++++++++++++++++++
 drivers/media/i2c/ov13858.c                   | 11 +++++++++
 drivers/media/i2c/ov5670.c                    | 11 +++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  7 ++++++
 include/uapi/linux/v4l2-controls.h            |  4 ++++
 6 files changed, 60 insertions(+)

--
2.22.0

