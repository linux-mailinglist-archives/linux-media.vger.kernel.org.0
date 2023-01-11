Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D01E6662C2
	for <lists+linux-media@lfdr.de>; Wed, 11 Jan 2023 19:28:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235829AbjAKS14 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Jan 2023 13:27:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236446AbjAKS1R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Jan 2023 13:27:17 -0500
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 666C732EBE
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 10:27:14 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id C9A3920003;
        Wed, 11 Jan 2023 18:27:10 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Nicholas Roth <nicholas@rothemail.net>,
        Robert Mader <robert.mader@collabora.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v4 0/2] media: i2c: Add driver for OmniVision OV8858
Date:   Wed, 11 Jan 2023 19:26:55 +0100
Message-Id: <20230111182657.74160-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.39.0
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
  this is a new version of Nicholas' first submission available at
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

v3 -> v4:
- s/ov8858_read_reg/ov8858_read
- correct autosuspend sequence in probe
- added tags

v2 -> v3:
- Address Laurent's comments; most significant changes
  - Use v4l2_subdev_state everywhere and drop cur_mode
  - Simplify s_stream
  - Re-sort functions definition
  - Write analogue and digital gain as 16 bits registers
  - put fwnode in error path and remove function

v1 -> v2:
- Unified and simplified modes
- Adjust blanking values to match FPS
- Address Laurent's comment:
  - rework reg_write() function
  - move to subdev state
  - cosmetic change

Jacopo Mondi (1):
  dt-bindings: media: Add OmniVision OV8858

Nicholas Roth (1):
  media: i2c: Add driver for OmniVision OV8858

 .../bindings/media/i2c/ovti,ov8858.yaml       |  106 +
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   13 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov8858.c                    | 1995 +++++++++++++++++
 5 files changed, 2124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
 create mode 100644 drivers/media/i2c/ov8858.c

--
2.38.1

