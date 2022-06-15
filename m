Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFDC54CC6C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 17:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346330AbiFOPPc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 11:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344978AbiFOPP3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 11:15:29 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F29B3C707;
        Wed, 15 Jun 2022 08:15:26 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 5759F240005;
        Wed, 15 Jun 2022 15:15:22 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     dave.stevenson@raspberrypi.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>, david.plowman@raspberrypi.com,
        laurent.pinchart@ideasonboard.com,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 0/5] media: ov5647: Reintroduce 8bpp modes from R-Car BSP
Date:   Wed, 15 Jun 2022 17:14:52 +0200
Message-Id: <20220615151457.415038-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

8 bpp mode was removed in commit 38c223081815 ("media: ov5647:
Remove 640x480 SBGGR8 mode") as it hangs the sensor and no streaming
was possible.

This series upports a few patches from Renesas R-Car 4.1.0 BSP which use
8 bpp modes for ADAS applications.

While at it, a few patches from the RPi BSP have been upported as well, as the
series has been tested on a Pi.

As reported in the commit message of 3/5, a register quirk allows to capture
8bpp modes with no hangs:

Quoting:

-------------------------------------------------------------------------------
Comparing the register table for the 10 bit full-size mode and the
register table for the there introduced 8 bit full size mode, the main
difference is in the value of register 0x3034, documented as:

0x3034: Bit[7]:   Not used
	Bit[6:4]: pll_charge_pump
	Bit[3:0]: mipi_bit_mode
		  0000: 8 bit mode
		  0001: 10 bit mode
		  Others: Reserved to future use

However the value currently assigned to the register in all 10 bits
modes contradicts the register description (0x3034=0x1a) suggesting that
the documentation is possibly wrong and the lower and higher 4 bits are
actually swapped.

In facts, the 8 bits mode as added in the BSP commit assigns to register
0x3034 the value 0x08, causing the sensor to hang.

This patch uses for the register the same value as the 10 bits mode with
BIT(4) cleared, resulting in correct streaming operations with the
expected 15 FPS frame rate.

pi@raspberrypi:~ $ v4l2-ctl --get-subdev-fmt pad=0 -d /dev/v4l-subdev0
pi@raspberrypi:~ $ yavta -s2592x1944 -fSGBRG8 --capture=10 --skip=7 -F /dev/video0
...
Captured 10 frames in 0.631383 seconds (15.838237 fps, 79806470.803431 B/s).
...
-------------------------------------------------------------------------------

As reported in the same commit messages, frames as captured from the Pi are
completely black, suggesting that some other setting is off.

However the sensor does not hang anymore and it is worth re-enabling the modes
as a base for further debugging.

Thanks
   j

David Plowman (1):
  media: ov5647: Support HFLIP and VFLIP

Jacopo Mondi (3):
  media: ov5647: Add 8 bit SGBRG8 full size mode
  media: ov5647: Reintroduce 8 bit 640x480
  media: ov5647: Add support for test patterns

Laurent Pinchart (1):
  media: ov5647: Parse and register properties

 drivers/media/i2c/ov5647.c | 411 +++++++++++++++++++++++++++++++++++--
 1 file changed, 393 insertions(+), 18 deletions(-)

--
2.35.1

