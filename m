Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6E6C66C436
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 16:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjAPPpK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 10:45:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbjAPPpI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 10:45:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D311E2B2
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 07:45:07 -0800 (PST)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F28C1802;
        Mon, 16 Jan 2023 16:45:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673883904;
        bh=umIF+ksz5M3xv3zRrMyRCAU3CnkYBZqkY/kjoA3G7Zk=;
        h=From:To:Cc:Subject:Date:From;
        b=T+E1rRDIBH1ErbElSTMmEPYOt/mgkGRCx+hnKzLkXqiT6ELnfmF0ZAuCNY0P15G/D
         AIZm9u/oH1PNE3yeNhTUmnhiVeEGiJYFPMhTqJRxXck25GqrZk3aWVmvdsZ8S6Q9qf
         iDf9qGEqteRxhuPPrjrVh1PdeOPj2Kv/h5TJEJtU=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Nicholas Roth <nicholas@rothemail.net>,
        Robert Mader <robert.mader@collabora.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v5 0/2] media: i2c: Add driver for OmniVision OV8858
Date:   Mon, 16 Jan 2023 16:44:46 +0100
Message-Id: <20230116154448.76944-1-jacopo.mondi@ideasonboard.com>
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

v4 -> v5:
- Address Sakari's comments
 - Remove macros for ARRAY_SIZE
 - Refuse 4 lanes in R1A mode
 - Remove clk_set_rate
 - Fetch the i2c client from the subdev
 - Make pixel_rate variable local
 - Support V4L2_SUBDEV_FL_HAS_EVENTS

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
 drivers/media/i2c/ov8858.c                    | 2001 +++++++++++++++++
 5 files changed, 2130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
 create mode 100644 drivers/media/i2c/ov8858.c

--
2.39.0

