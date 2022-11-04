Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0703F6199CF
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 15:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbiKDO2Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 10:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232411AbiKDO12 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 10:27:28 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A3E317E1
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 07:25:10 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 2BCC5100013;
        Fri,  4 Nov 2022 14:25:06 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 00/10] media: ar0521: Add analog gain, rework clock tree
Date:   Fri,  4 Nov 2022 15:24:43 +0100
Message-Id: <20221104142452.117135-1-jacopo@jmondi.org>
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
  this series adds a few features to the ar0521 driver to enable its usage
with libcamera.

In particular:
- enum_frame_sizes
- global analog gain control
- LINK_FREQ
- Rework blanking handligs

v3 (Dave)
- Check __v4l2_ctrl_modify_range() return value
- Make LINK_FREQ readonly to avoid additional churn in s_ctrl
- Fix trivial early return in s_ctrl
- Use exposure's default value when modifying the controls' limits
- Change the exposure default to 0x70 to match the register default value

v2:
- I have dropped the most controverse part that allows to change the link
  frequency to obtain 60FPS. It can be eventually be applied on top.
- Use register 0x3028 to control analog gain not to overwrite the global digital
  gain.
- Fix the HBLANK/VBLANK max by using the values read from on-chip registers.
- Fix handling of LINK_FREQ in s_cltr (but do not make the control read only).
- Fix errors reported by 0-days:
  - use do_div() for 64-bit division
  - declare variables in function scope and not in case scope in s_ctrl

Jacopo Mondi (10):
  media: ar0521: Implement enum_frame_sizes
  media: ar0521: Add V4L2_CID_ANALOG_GAIN
  media: ar0521: Set maximum resolution to 2592x1944
  media: ar0521: Rework PLL computation
  media: ar0521: Refuse unsupported controls
  media: ar0521: Add LINK_FREQ control
  media: ar0521: Adjust exposure and blankings limits
  media: ar0521: Setup controls at s_stream time
  media: ar0521: Rework startup sequence
  media: ar0521: Tab-align definitions

 drivers/media/i2c/ar0521.c | 352 ++++++++++++++++++++++++++-----------
 1 file changed, 250 insertions(+), 102 deletions(-)

--
2.38.1

