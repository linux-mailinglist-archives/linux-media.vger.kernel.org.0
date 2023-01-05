Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2AD465F2A4
	for <lists+linux-media@lfdr.de>; Thu,  5 Jan 2023 18:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233948AbjAER2G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Jan 2023 12:28:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235343AbjAER1d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Jan 2023 12:27:33 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1EFE6718E
        for <linux-media@vger.kernel.org>; Thu,  5 Jan 2023 09:23:31 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 47A511C0006;
        Thu,  5 Jan 2023 17:23:28 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Nicholas Roth <nicholas@rothemail.net>,
        Robert Mader <robert.mader@collabora.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 0/2] media: i2c: Add driver for OmniVision OV8858
Date:   Thu,  5 Jan 2023 18:23:18 +0100
Message-Id: <20230105172320.133810-1-jacopo@jmondi.org>
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

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Hello,
  this is a new version of  of Nicholas' first submission available at
https://lore.kernel.org/all/20221106171129.166892-2-nicholas@rothemail.net/

This is a re-write of the previous version so I've restarted numeration from 0
even if in this version I have not changed the register tables.

Functionally the most notable difference is the addition of support for binned
mode in 4 data lanes mode.

There is more space for optimization on top of this series, in example the
register tables can be reworked to share more common settings between modes. I
have started the effort, but as it is a tedious and error-prone work I would
rather have this first version merged and the iterate on top. Programming of the
analog crop rectangle and output size could also be made parametric, but the
current modes have a few undocumented registers and I didn't feel like biting
the bullet and see if the can be safely removed or not.

Also, the BSP driver mentions a "not well supported" R1A version of the chip.
I would be in favour of removing it if no one oppose.

Images are still rather "dark" when tested with libcamera but preview is working
as expected in both modes (full res and half-res binned mode) and with 2 and 4
data lanes.

Nicholas could you let me know if things are fine with you here ?

Thanks
  j

Jacopo Mondi (1):
  dt-bindings: media: Add schema for OmniVision OV8858

Nicholas Roth (1):
  media: i2c: Add driver for OmniVision OV8858

 .../bindings/media/i2c/ovti,ov8858.yaml       |  109 +
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   13 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov8858.c                    | 1989 +++++++++++++++++
 5 files changed, 2121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
 create mode 100644 drivers/media/i2c/ov8858.c

--
2.38.1

