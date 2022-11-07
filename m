Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A15A61FFCC
	for <lists+linux-media@lfdr.de>; Mon,  7 Nov 2022 21:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233044AbiKGUuY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 15:50:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233038AbiKGUuV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 15:50:21 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF361EEDD
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 12:50:19 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 23294FF807;
        Mon,  7 Nov 2022 20:50:15 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCH 0/3] Documentation: media: camera_sensor: Document blankings handling
Date:   Mon,  7 Nov 2022 21:49:56 +0100
Message-Id: <20221107204959.37691-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
   this series updates the camera-sensor documentation to indicate that
vertical and horizontal blankings should be updated when a new image format
is applied on the sensor.

1/3 is more for discussion than inclusion, as I noticed the documentation and
the CCS driver use the analogue crop rectangle sizes to compute blanking limits
while most driver use the visible size.

Which ones are correct ?

As I interpret "Figure 47 Line and Frame Blanking Definitions" in CSI-2 spec (I
have version 1.01.00 r0.04 2-Apr-2009) it seems clear to me that blankings
surround the visible size ("valid data"). However it is also correct to consider
blanking limits are a property of the pixel array usually represented by a
minx/max limits of some "total output size" register.

I wonder if it makes any real difference in practice...

3/3 also documents that exposure limits should be updated when a new vertical
blankings are applied.

I haven't documented if the actual control value should be reset to some
know value as the init-time default or to its minimum value, as described in
https://lore.kernel.org/linux-media/20221019065801.4n7alfivhffbvgzo@uno.localdomain/T/

A question for Dave: should the registration of events handler callbacks be
documented too as clarified in:
https://www.spinics.net/lists/linux-media/msg220715.html

Thanks!
  j

Jacopo Mondi (3):
  Documentation: media: camera-sensor: Correct frame interval
  documentation: media: camera_sensor: Document blankings handling
  documentation: media: camera_sensor: Update exposure on blanking
    change

 .../driver-api/media/camera-sensor.rst        | 69 +++++++++++++++++--
 1 file changed, 65 insertions(+), 4 deletions(-)

--
2.38.1

