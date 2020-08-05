Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6793923CCA8
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 18:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728344AbgHEQ4q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 12:56:46 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:50626 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728150AbgHEQyb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 12:54:31 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 196243A860A
        for <linux-media@vger.kernel.org>; Wed,  5 Aug 2020 10:55:12 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E001BC000D;
        Wed,  5 Aug 2020 10:53:48 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
Subject: 
Date:   Wed,  5 Aug 2020 12:57:17 +0200
Message-Id: <20200805105721.15445-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Subject: [PATCH 0/4] media: docs: Document pixel array properties

Hans' patch "[PATCH] imx219: selection compliance fixes" sparkled a discussion
on how the V4L2 selection targets have to be used in order to access an
image sensor pixel array properties.

The discussion shown how much under-specified that part was, so this is
an attempt to provide a bit documentation for this.

My feeling is that we're hijacking the existing targets for this use case
and we should probably define new ones, considering how few users we have in
mainline of them at the moment.

On top Hans' patch with reworded commit message and minor updates.

For reference, we're using the V4L2 selection targets in libcamera to retrieve
the sensor pixel array properties to be reported to applications for
calibration purposes. The currently defined pixel properties for libcamera
are available here:
https://git.linuxtv.org/libcamera.git/tree/src/libcamera/property_ids.yaml#n390

Thanks
   j

Hans Verkuil (1):
  media: i2c: imx219: Selection compliance fixes

Jacopo Mondi (3):
  media: docs: Describe pixel array properties
  media: docs: Describe targets for sensor properties
  media: docs: USe SUBDEV_G_SELECTION for sensor properties

 .../userspace-api/media/v4l/dev-subdev.rst    | 85 +++++++++++++++++++
 .../media/v4l/v4l2-selection-targets.rst      | 49 +++++++++++
 .../media/v4l/vidioc-subdev-g-selection.rst   |  4 +
 drivers/media/i2c/imx219.c                    | 17 ++--
 4 files changed, 147 insertions(+), 8 deletions(-)

--
2.27.0

