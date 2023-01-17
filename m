Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0481E66DA91
	for <lists+linux-media@lfdr.de>; Tue, 17 Jan 2023 11:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236321AbjAQKGU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Jan 2023 05:06:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236148AbjAQKGR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Jan 2023 05:06:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A73CB3C1D
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 02:06:16 -0800 (PST)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 239FF10C;
        Tue, 17 Jan 2023 11:06:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673949974;
        bh=pb3wRTv3sp84GATXwl39TeWyAD9ucGQdE+Af62iP3VA=;
        h=From:To:Cc:Subject:Date:From;
        b=BUF8V8l0uBSYvYqEkaqQ07cyLzS5AcnufWqmSgZi9PtzvGVfHp9qJ+OteebDb2U9w
         s1G+N6KqOrw56hbA42s7b+rYKbVOLsOcaTaKdPmklto4OwHVSHkzqRT5iw8R1iVLYU
         pdNTJcpxlMy/nq8O8x8fuoFcmdxNpYzbRQXfpbog=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Robert Mader <robert.mader@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 0/3] media: imx258: Remove rotation=<80 requirement
Date:   Tue, 17 Jan 2023 11:06:00 +0100
Message-Id: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the imx258 driver requires to have the 'rotation' device node
property specified in DTS with a fixed value of 180 degrees.

The "rotation" fwnode device property is intended to allow specify the
sensor's physical mounting rotation, so that it can be exposed through
the read-only V4L2_CID_CAMERA_SENSOR_ROTATION control and applications
can decide how to compensate for that.

The imx258 driver has read-only VFLIP and HFLIP enabled, resulting in
a 180 degrees image rotation being produced by the sensor. But this
doesn't imply that the physical mounting rotation should match the
driver's implementation.

I took into the series Robert's patch that register device node properties and
on top of that register flips controls, in order to remove the hard requirement
of the 180 degrees rotation property presence.

Jacopo Mondi (2):
  media: imx258: Register H/V flip controls
  media: imx258: Remove mandatory 180 degrees rotation

Robert Mader (1):
  media: imx258: Parse and register properties

 drivers/media/i2c/imx258.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

--
2.39.0

