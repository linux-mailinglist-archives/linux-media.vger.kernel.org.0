Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F79423D09D
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 21:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728343AbgHETvZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 15:51:25 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:48344 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728226AbgHEQwo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 12:52:44 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 84E823A9C92
        for <linux-media@vger.kernel.org>; Wed,  5 Aug 2020 10:55:16 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4BC14C000E;
        Wed,  5 Aug 2020 10:53:54 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
Subject: [PATCH 3/4] media: docs: USe SUBDEV_G_SELECTION for sensor properties
Date:   Wed,  5 Aug 2020 12:57:20 +0200
Message-Id: <20200805105721.15445-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805105721.15445-1-jacopo@jmondi.org>
References: <20200805105721.15445-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a small note to the VIDIOC_SUBDEV_G_SELECTION IOCTL documentation
to report that the API can be used to access an image sensor pixel array
properties.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../userspace-api/media/v4l/vidioc-subdev-g-selection.rst     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
index 06c9553ac48f5..05539f5deace2 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
@@ -46,6 +46,10 @@ The selections are used to configure various image processing
 functionality performed by the subdevs which affect the image size. This
 currently includes cropping, scaling and composition.
 
+This API can also be used to retrieve immutable properties of the device
+represented by the subdev, such as the pixel matrix properties of an image
+sensor.
+
 The selection API replaces
 :ref:`the old subdev crop API <VIDIOC_SUBDEV_G_CROP>`. All the
 function of the crop API, and more, are supported by the selections API.
-- 
2.27.0

